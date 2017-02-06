{uses SDL2, SDL2_image;
 
var
sdlWindow1 : PSDL_Window;
sdlRenderer : PSDL_Renderer;
sdlTexture1 : PSDL_Texture;
 
begin
 
  //initilization of video subsystem
  if SDL_Init( SDL_INIT_VIDEO ) < 0 then HALT;
 
  sdlWindow1 := SDL_CreateWindow( 'Window1', 50, 50, 500, 500, SDL_WINDOW_SHOWN );
  if sdlWindow1 = nil then HALT;
 
  sdlRenderer := SDL_CreateRenderer( sdlWindow1, -1, 0 );
  if sdlRenderer = nil then HALT;
 
  sdlTexture1 := IMG_LoadTexture( sdlRenderer, 'C:\fpsdl.png' );
  if sdlTexture1 = nil then HALT;
  SDL_RenderCopy( sdlRenderer, sdlTexture1, nil, nil );
  SDL_RenderPresent (sdlRenderer);
  SDL_Delay( 2000 );
 
  SDL_DestroyTexture( sdlTexture1 );
  SDL_DestroyRenderer( sdlRenderer );
  SDL_DestroyWindow ( sdlWindow1 );
 
  //shutting down video subsystem
  SDL_Quit;
 
end.}
uses SDL2;
 
var
i : integer;
sdlWindow1 : PSDL_Window;
sdlRenderer : PSDL_Renderer;
sdlRect1 : PSDL_Rect;	//Allouer de la mémoire
sdlPoints1,sdlPoints2 : array[0..499] of PSDL_Point;

 
begin
 
  //initilization of video subsystem
  if SDL_Init( SDL_INIT_VIDEO ) < 0 then HALT;
 
  sdlWindow1 := SDL_CreateWindow( 'Window1', 50, 50, 500, 500, SDL_WINDOW_SHOWN );
  if sdlWindow1 = nil then HALT;
 
  sdlRenderer := SDL_CreateRenderer( sdlWindow1, -1, 0 );
  if sdlRenderer = nil then HALT;
 
  SDL_SetRenderDrawColor( sdlRenderer, 255, 255, 255, 255 );
  SDL_RenderClear( sdlRenderer );
  SDL_RenderPresent ( sdlRenderer );
  SDL_Delay( 1000 );
 
  SDL_SetRenderDrawColor( sdlRenderer, 255, 0, 0, 255 );
  SDL_RenderDrawLine( sdlRenderer, 10, 10, 200, 200 );
  SDL_RenderPresent( sdlRenderer );
  SDL_Delay( 1000 );
  SDL_SetRenderDrawColor( sdlRenderer, 255, 0, 0, 255 );
  SDL_RenderDrawLine( sdlRenderer, 10, 10, 10, 200 );
  SDL_RenderPresent( sdlRenderer );
  SDL_Delay( 1000 );
  SDL_SetRenderDrawColor( sdlRenderer, 255, 0, 0, 255 );
  SDL_RenderDrawLine( sdlRenderer, 10, 200, 200, 200 );
  SDL_RenderPresent( sdlRenderer );
  SDL_Delay( 1000 );
 
  SDL_SetRenderDrawColor( sdlRenderer, 0, 0, 0, 255 );
  for i := 0 to 47 do SDL_RenderDrawPoint( sdlRenderer, 490-i*10, 10+i*10 );
  SDL_RenderPresent( sdlRenderer );
  SDL_Delay( 1000 );
 
 
 
  SDL_SetRenderDrawColor( sdlRenderer, 128, 128, 128, 255 );
  SDL_RenderDrawPoints( sdlRenderer, sdlPoints1[0], 500 );
  SDL_RenderPresent( sdlRenderer );
  SDL_Delay( 3000 );
 
  for i := 0 to 499 do dispose( sdlPoints1[i] );
  dispose( sdlRect1 );
  SDL_DestroyRenderer( sdlRenderer );
  SDL_DestroyWindow ( sdlWindow1 );
 
  //shutting down video subsystem
  SDL_Quit;
 
end.