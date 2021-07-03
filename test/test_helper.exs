ExUnit.start()
Mox.Server.start_link([])
Mox.defmock(Napolleon.MockHTTPoison, for: Napolleon.HTTPBase)
