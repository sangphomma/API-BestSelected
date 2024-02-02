<?php

namespace App\Filament\Resources;

use App\Filament\Resources\PostResource\Pages;
use App\Filament\Resources\PostResource\RelationManagers;
use App\Models\Post;
use Filament\Forms;
use Filament\Forms\Components\MarkdownEditor;
use Filament\Forms\Components\Tabs;
use Filament\Forms\Components\Tabs\Tab;
use Filament\Forms\Components\Textarea;
use Filament\Forms\Form;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\SoftDeletingScope;
use Livewire\Features\SupportFileUploads\TemporaryUploadedFile;

class PostResource extends Resource
{
    protected static ?string $model = Post::class;

    protected static ?string $navigationIcon = 'heroicon-o-rectangle-stack';

    public static function form(Form $form): Form
    {
        return $form->schema([
            Tabs::make('Post')->tabs([

                Tab::make('info')->schema([
                    Forms\Components\Select::make('category_id')->label('Category')
                        ->relationship('category','name')
                        // ->unique(ignoreRecord:true)
                        ->preload()
                        ->searchable(),
                    Forms\Components\TextInput::make('name')
                        ->required()
                        ->maxLength(255),
                    Forms\Components\Toggle::make('published')
                        ->default(true)
                        ->required(),

                ]),
                Tab::make('Description')->schema([
                    // Forms\Components\MarkdownEditor::make('desc')
                    // // ->fileAttachmentsDisk('s3')
                    // ->fileAttachmentsDirectory('attachments')
                    // ->fileAttachmentsVisibility('public')
                    // MarkdownEditor::make('desc'),
                    Textarea::make('desc')
                    ->autocomplete($autocomplete = 'on') ->rows(30) ,
                ]),
                Tab::make('cover')->schema([
                    Forms\Components\TagsInput::make('tags'),
                    Forms\Components\FileUpload::make('cover')
                    ->directory('products-cover')
                    //->preserveFilenames()
                    ->getUploadedFileNameForStorageUsing(
                        function(TemporaryUploadedFile $file , Forms\Get $get){
                            if($get('name')!==''){
                                $fname=$get('name') ;
                            }else{
                                $fname='product' ;
                            }
                            return 'cover-'.$fname.'-'.str(now()->timestamp).'.'.str($file->getClientOriginalExtension()) ;
                        }
                    )
                    ->image()
                    ->imageEditor(),

                ]),
                Tab::make('images')->schema([
                    Forms\Components\FileUpload::make('images')->label('Screen Short')
                    ->directory('products-images')
                    ->multiple()
                    ->storeFileNamesIn('attachment_file_names')
                    ->image()
                    ->imageEditor(),
                ])

            ])

        ])->columns(1) ;

    }

    public static function table(Table $table): Table
    {
        return $table
            ->columns([
                Tables\Columns\TextColumn::make('category.name')
                    ->sortable(),
                Tables\Columns\TextColumn::make('name')
                    ->searchable(),
                Tables\Columns\ImageColumn::make('cover')
                    ->circular(80),
                Tables\Columns\ImageColumn::make('images')
                    ->stacked()->limit(3)
                    ->circular(80),
                Tables\Columns\ToggleColumn::make('published'),
                Tables\Columns\TextColumn::make('created_at')
                    ->dateTime()
                    ->sortable()
                    ->toggleable(isToggledHiddenByDefault: true),
                Tables\Columns\TextColumn::make('updated_at')
                    ->dateTime()
                    ->sortable()
                    ->toggleable(isToggledHiddenByDefault: true),
            ])
            ->filters([
                //
            ])
            ->actions([
                Tables\Actions\EditAction::make(),
            ])
            ->bulkActions([
                Tables\Actions\BulkActionGroup::make([
                    Tables\Actions\DeleteBulkAction::make(),
                ]),
            ]);
    }

    public static function getRelations(): array
    {
        return [
            //
        ];
    }

    public static function getPages(): array
    {
        return [
            'index' => Pages\ListPosts::route('/'),
            'create' => Pages\CreatePost::route('/create'),
            'edit' => Pages\EditPost::route('/{record}/edit'),
        ];
    }
}
