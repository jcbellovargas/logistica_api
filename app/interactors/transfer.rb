class Transfer
  include Interactor::Organizer

  organize ValidarOperacion, TransferirStock, CrearOperacion
end