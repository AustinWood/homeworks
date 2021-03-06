export const RECEIVE_ALL_POKEMON = 'RECEIVE_ALL_POKEMON';
export const RECEIVE_POKEMON = 'RECEIVE_POKEMON';
import * as APIUtil from '../util/api_util';

export const receiveAllPokemon = pokemon => ({
  type: RECEIVE_ALL_POKEMON,
  pokemon
});

export const requestAllPokemon = () => (dispatch) => {
  return APIUtil.fetchAllPokemon()
    .then(pokemon => dispatch(receiveAllPokemon(pokemon)));
}

export const receivePokemon = pokemon => ({
  type: RECEIVE_POKEMON,
  pokemon
})

export const requestPokemon = (pokemonId) => (dispatch) => {
  return APIUtil.fetchPokemon(pokemonId)
    .then(pokemon => dispatch(receivePokemon(pokemon)));
}
