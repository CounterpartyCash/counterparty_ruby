# encoding: utf-8
require_relative 'spec_helper'

describe Counterparty::TxEncode do
  describe ".encode" do
    it "Tokenly's getSampleCounterpartyTransactionProtocol2()" do
      encoder = Counterparty::TxEncode.new( 
        # Key:
        "\x8F\xD9\xF6\x89\xF1X\xA4&\x86r\x15\xDB\xDE\xE5\x8E\x9E\xABl\x81"+
        "\x80\x97\xD4\xBF+\xCF\v\xD1E\x8F<U\xAB",
        # Data:
        "\x00\x00\x00\x00\x00\x00\x00\x00\x00\x04\xFA\xDF\x00\x00\x00\x17Hv\xE8\x00",
        :receiver_addr => "12pv1K6LTLPFYXcCwsaU7VWYRSX7BuiF28",
        :sender_pubkey => '02f4aef682535628a7e0492b2b5db1aa312348c3095e0258e26b275b25b10290e6')

      expect(encoder.to_opmultisig).to eq([
        "OP_DUP OP_HASH160 1407ec32be440f32fc70f4eea810acd98f32aa32 OP_EQUALVERIFY OP_CHECKSIG",
        "1 0276d539826e5ec10fed9ef597d5bfdac067d287fb7f06799c449971b9ddf9fec6 02af7efeb1f7cf0d5077ae7f7a59e2b643c5cd01fb55221bf76221d8c8ead92bf0 02f4aef682535628a7e0492b2b5db1aa312348c3095e0258e26b275b25b10290e6 3 OP_CHECKMULTISIG",
        "OP_DUP OP_HASH160 6ca4b6b20eac497e9ca94489c545a3372bdd2fa7 OP_EQUALVERIFY OP_CHECKSIG"
        ] )
    end

    it "Tokenly's getSampleCounterpartyTransaction3()" do
      encoder = Counterparty::TxEncode.new(
        # Key:
        "\xE7\xF91\x9D\xE8Va\xC310\xE8\v}\xF1g3\x16H\x92\xEE\xB2\xE1\xFB"+
        "\x04NZ\xC5\xDEz2i\xB7",
        # Data:
        "\x00\x00\x00\x00\x00\x00\x00\x00\x00\x04\xFA\xDF\x00\x00\x00\x00\v\xEB\xC2\x00",
        :receiver_addr => "1FEbYaghvr7V53B9csjQTefUtBBQTaDFvN",
        :sender_pubkey => "0257b0d96d1fe64fbb95b2087e68592ee016c50f102d8dcf776ed166473f27c690")

      expect(encoder.to_opmultisig).to eq([
        "OP_DUP OP_HASH160 9c2401388e6d2752a496261e9130cd54ddb2b262 OP_EQUALVERIFY OP_CHECKSIG",
        "1 035240874259b8f93dffc6ffa29b09d0d06dfb072d9646ae777480a2c521bfdbb1 0264f1dd503423e8305e19fc77b4e26dc8ec8a8f500b1bec580112af8c64e74b1b 0257b0d96d1fe64fbb95b2087e68592ee016c50f102d8dcf776ed166473f27c690 3 OP_CHECKMULTISIG",
        "OP_DUP OP_HASH160 0c7bea5ae61ccbc157156ffc9466a54b07bfe951 OP_EQUALVERIFY OP_CHECKSIG"
        
        ] )
    end

    it "Tokenly's getSampleCounterpartyTransaction4()" do
      encoder = Counterparty::TxEncode.new(
        # Key:
        "\xA6\xED\xB8aq\xFCw68\x9F \xBCcT\"U\xDB\xBF\xA2\xDC\xD1s\xFC\a\x94"+
        "\x14\xAD\xAB\x7FT\x80q",
        # Data:
        "\x00\x00\x00\x00\x00\x00\x00\x00\x00\x04\xFA\xDF\x00\x00\x00\x00"+
        "\x05\xF5\xE1\x00", 
        :receiver_addr => "1Q7VHJDEzVj7YZBVseQWgYvVj3DWDCLwDE",
        :sender_addr => '1MFHQCPGtcSfNPXAS6NryWja3TbUN9239Y')

      expect(encoder.to_opreturn).to eq([
        "OP_DUP OP_HASH160 fd84ff1f2cc1b0299165e2804fccd6fb0bd48d0b OP_EQUALVERIFY OP_CHECKSIG",
        "OP_RETURN 2c54fff6d3e165e008f5ec45a06951e6b6fb4a162fcfec34aa1f0dd8",
        "OP_DUP OP_HASH160 de1607744008a3edeabae06365a9aa2b131d5dc2 OP_EQUALVERIFY OP_CHECKSIG"
      ] )
    end

    it "Tokenly's getSampleCounterpartyTransaction5()" do
      encoder = Counterparty::TxEncode.new(
        # Key:
        "\xCF\x8F\xA2\x9C\xF698\xA7\x87\xE72\xC8PqiVh\xB9\xE0\v\xFE\xDF\xF8"+
        "\a\xDF\xBD\xC8Zj\xD6\xA6\x96",
        # Data:
        "\x00\x00\x00\x00\x00\x00\x00\x00\x00\x04\xFA\xDF\x00\x00\x00\x01*"+
        "\x05\xF2\x00",
        :receiver_addr => "1KUsjZKrkd7LYRV7pbnNJtofsq1HAiz6MF",
        :sender_addr => '12iVwKP7jCPnuYy7jbAbyXnZ3FxvgLwvGK')

      expect(encoder.to_opreturn).to eq([
        "OP_DUP OP_HASH160 cab7d87116e620e10a69e666ec6494d4607631e7 OP_EQUALVERIFY OP_CHECKSIG",
        "OP_RETURN fb706d6b2839cfd52a4b50cb135f18cf9e0b280ca45b2da5694229f0",
        "OP_DUP OP_HASH160 12d155cefea286e9d3cda6cb64cd8d26a5b95780 OP_EQUALVERIFY OP_CHECKSIG"
      ] )
    end

    it "encodes a four output pubkeyhash" do
      # This was from Txid:
      #   '76133a842ced8d76047e070924bca66652b19581803079f200d35fd824499940'

      encoder = Counterparty::TxEncode.new( 
        # Key:
        "d,g\x1E\x99\xF3\xB5\xAETU\n\xFB\x15\xFA\xC3\xD9\x8FWPk\xAAk\xBE"+
        "\x95\xFA\x15\xB7\xF0|fN\e",
        # Data:
        "\x00\x00\x00\x00\x00\x00\x00\x00\x1Ez\x9DL\x00\x00\x00\x00\x05"+
        "\xF5\xE1\x00".force_encoding('UTF-8'),
        :receiver_addr => "1BdHqBSfUqv77XtBSeofH6XwHHczZxKRUF",
        :sender_addr => '1Ko36AjTKYh6EzToLU737Bs2pxCsGReApK')

      expect(encoder.to_pubkeyhash).to eq([
        'OP_DUP OP_HASH160 748e483222863a836a421df1a9395bbd835bdfda OP_EQUALVERIFY OP_CHECKSIG',
        'OP_DUP OP_HASH160 61e09442c872dabb980a7a86a04323a62512ec5d OP_EQUALVERIFY OP_CHECKSIG',
        'OP_DUP OP_HASH160 63e09442c872dabb98467a86a0432653c40c96c0 OP_EQUALVERIFY OP_CHECKSIG',
        'OP_DUP OP_HASH160 ce27246a0a6ca54dfa1f780ccd5cb3d0c73a75b2 OP_EQUALVERIFY OP_CHECKSIG',
      ] )
    end

    it "Encodes the gigantic multsig satoshi broadcast" do
      # This was from Txid:
      #   '14200afba2c8f91664afc37143763e5987a20647db3443c999137cc41b4db6e4'

      encoder = Counterparty::TxEncode.new(
        # Key:
        "\x13\xA2\x19LGG\xC7g\x85\xA7N\xFEQ\xB8xyG\x16E\xDD\xC1&\x8D\xE9"+
        "\xCA\xA6%\xF3\xA9\xA3\x05E",
        # Data:
        "\x00\x00\x00\x1EUj\x18\xE0\xBF\xF0\x00\x00\x00\x00\x00\x00\x00\x00"+
        "\x00\x00Commerce on the Internet has come to rely almost exclusively"+
        " on financial institutions serving as trusted third parties to "+
        "process electronic payments. While the system works well enough for "+
        "most transactions, it still suffers from the inherent weaknesses of "+
        "the trust based model. Completely non-reversible transactions are "+
        "not really possible, since financial institutions cannot avoid "+
        "mediating disputes. The cost of mediation increases transaction "+
        "costs, limiting the minimum practical transaction size and cutting "+
        "off the possibility for small casual transactions, and there is a "+
        "broader cost in the loss of ability to make non-reversible payments "+
        "for nonreversible services. With the possibility of reversal, the "+
        "need for trust spreads. Merchants must be wary of their customers, "+
        "hassling them for more information than they would otherwise need. "+
        "A certain percentage of fraud is accepted as unavoidable. These "+
        "costs and payment uncertainties can be avoided in person by using "+
        "physical currency, but no mechanism exists to make payments over a "+
        "communications channel without a trusted party. What is needed is "+
        "an electronic payment system based on cryptographic proof instead "+
        "of trust, allowing any two willing parties to transact directly "+
        "with each other without the need for a trusted third party. "+
        "Transactions that are computationally impractical to reverse would "+
        "protect sellers from fraud, and routine escrow mechanisms could "+
        "easily be implemented to protect buyers. In this paper, we propose "+
        "a solution to the double-spending problem using a peer-to-peer "+
        "distributed timestamp server to generate computational proof of the "+
        "chronological order of transactions. The system is secure as long "+
        "as honest nodes collectively control more CPU power than any "+
        "cooperating group of attacker nodes.".force_encoding('UTF-8'), 
        :sender_pubkey => '02a51147c9e3a554ed35e20cc5ca0fef20e47ae976cfe06a594e135e416bb05e32')

      expect(encoder.to_opmultisig).to eq([
        '1 027d222586a44cc5d365673cb613c1bb8df9cf6ab74cd825b1e0b2e579b1fd423d 0370a16f70a8a8a0a9afc5c0f3b9aae5d02b9bcf9f3351eb6cba0df8490e54ed2d 02a51147c9e3a554ed35e20cc5ca0fef20e47ae976cfe06a594e135e416bb05e32 3 OP_CHECKMULTISIG',
        '1 027d222586a44cc5d3654748d92de6b4f96050fbdb21b756c5c0d79d1addcb5e31 0374ba6f6eb2edefa8e183ddf5bde4cfd73e929d983856bf6daf0bac430e57fb85 02a51147c9e3a554ed35e20cc5ca0fef20e47ae976cfe06a594e135e416bb05e32 3 OP_CHECKMULTISIG',
        '1 037d222586a44cc5d365474fd37fe2b8fb7e50fbc46cac57c493c6801d91ca45f6 0274be6e22bbacf2b2a880c7bba8e58cce2d91de942556eb61b71bbb5e1356e617 02a51147c9e3a554ed35e20cc5ca0fef20e47ae976cfe06a594e135e416bb05e32 3 OP_CHECKMULTISIG',
        '1 037d222586a44cc5d3650e5f967df5a8f87c1eeec462f872d989de8059c5d648b6 033dbf7371bfa8ede6b68ac6f0afaadbdb33929d94384abe63b35ebe451319e588 02a51147c9e3a554ed35e20cc5ca0fef20e47ae976cfe06a594e135e416bb05e32 3 OP_CHECKMULTISIG',
        '1 027d222586a44cc5d365084fc22de0a3f47703fbd438b14adf939ec510c59e5e12 0269a5666eebbef5a0a780c6e8fcecded132dec9993305a26ab31baa4f0f4da807 02a51147c9e3a554ed35e20cc5ca0fef20e47ae976cfe06a594e135e416bb05e32 3 OP_CHECKMULTISIG',
        '1 027d222586a44cc5d3651059d766fab4e66a15e99723be05c588d7c50dc3cb5e2f 0269ec6863b8a8e4e6ac8ad0feb0a48cfd3093cd9d3351ae68a25eb6450f14fab6 02a51147c9e3a554ed35e20cc5ca0fef20e47ae976cfe06a594e135e416bb05e32 3 OP_CHECKMULTISIG',
        '1 027d222586a44cc5d365024ad37fe7b8f77515bac33eb94bc281d19110ded05ed3 023dad7867eba3efb2e197d1fab0e6d59e2f91ce823f47a761f75eab430f5aed27 02a51147c9e3a554ed35e20cc5ca0fef20e47ae976cfe06a594e135e416bb05e32 3 OP_CHECKMULTISIG',
        '1 037d222586a44cc5d365475adf63f5bff67011f69725b656c589c6900dd8d14359 036eec6963a5a3efb2e184c2f4b5ee8cd33a9ad490224ca563fb1ab159114cfc69 02a51147c9e3a554ed35e20cc5ca0fef20e47ae976cfe06a594e135e416bb05e32 3 OP_CHECKMULTISIG',
        '1 027d222586a44cc5d365024f982dc0b9f03913f5c438f84ad7c0df801dd8df59cd 0374a36422a2a3e3b4a484c7feafaad8cc3e90ce903551a26bb55ebb45124dfb30 02a51147c9e3a554ed35e20cc5ca0fef20e47ae976cfe06a594e135e416bb05e32 3 OP_CHECKMULTISIG',
        '1 037d222586a44cc5d3654b1cda64f9b8e1701efd9738b040918ddb8b10dccb40cd 033dbc7863a8b9e9a5a08994efaeebc2cd3e9dc998394beb77b204bd0a0057ecec 02a51147c9e3a554ed35e20cc5ca0fef20e47ae976cfe06a594e135e416bb05e32 3 OP_CHECKMULTISIG',
        '1 037d222586a44cc5d365475fc379e0b8fb7e50f5d12af851d985929516c2cd44b2 037fa5666bbfb4a0a0ae9794e8b1ebc0d27f9ddc822344a724af0cb9441258eb0d 02a51147c9e3a554ed35e20cc5ca0fef20e47ae976cfe06a594e135e416bb05e32 3 OP_CHECKMULTISIG',
        '1 037d222586a44cc5d3651355d963e7fdb5781efe9738b040c385928c0a91df0dc3 037fbe6563afa8f2e6a28ac7effce3c29e2b96d8d13a4ab877fb11be0a005be11c 02a51147c9e3a554ed35e20cc5ca0fef20e47ae976cfe06a594e135e416bb05e32 3 OP_CHECKMULTISIG',
        '1 037d222586a44cc5d3650b55c274b4a5fa391dfbdc29f84bde8e9f971cc7db5f20 026ea5686eaeedf0a7b888d1f5a8f98cd8308c9d9f394bb961ad1baa59085be4a1 02a51147c9e3a554ed35e20cc5ca0fef20e47ae976cfe06a594e135e416bb05e32 3 OP_CHECKMULTISIG',
        '1 027d222586a44cc5d365021cc568e6a7fc7a15e9996c8f4cc588929111d49e5d3e 0372bf796ba9a4ecafb59c94f4baaadedb299bcf823749e724af16bd0a0f5cedaf 02a51147c9e3a554ed35e20cc5ca0fef20e47ae976cfe06a594e135e416bb05e32 3 OP_CHECKMULTISIG',
        '1 027d222586a44cc5d365031cd062e6f1e16b05e9c36cab55c385d3810a9f9e603b 0378be696aaaa3f4b5e188c1e8a8aacedb7f89dc832f05a462fb0ab04f084ba822 02a51147c9e3a554ed35e20cc5ca0fef20e47ae976cfe06a594e135e416bb05e32 3 OP_CHECKMULTISIG',
        '1 037d222586a44cc5d3650449c579fbbcf06b03b69724b956c28cdb8b1e91ca456c 0278a12a64a4bfa0abae97d1bbb5e4cad12d93dc853f4aa524af16b944414de0ed 02a51147c9e3a554ed35e20cc5ca0fef20e47ae976cfe06a594e135e416bb05e32 3 OP_CHECKMULTISIG',
        '1 027d222586a44cc5d3650245967afba4f97d50f5c324bd57c689c18059dfdb4812 0279e22a43ebaee5b4b584ddf5fcfac9cc3c9bd3853742ae24b418f84c1358fd9a 02a51147c9e3a554ed35e20cc5ca0fef20e47ae976cfe06a594e135e416bb05e32 3 OP_CHECKMULTISIG',
        '1 037d222586a44cc5d365031cdf7eb4b0f67a15eac329bc05d093929017d0c84266 0374a86b60a7a8aee6958dd1e8b9aacfd12c8aced1374baf24ab1fa1470457fcc6 02a51147c9e3a554ed35e20cc5ca0fef20e47ae976cfe06a594e135e416bb05e32 3 OP_CHECKMULTISIG',
        '1 037d222586a44cc5d3654749d86ef1a3e17819f4c325bd569183d38b59d3db0dbb 037cba656bafa8e4e6a88b94ebb9f8dfd131dedf887650b86db519f85a0940fb0e 02a51147c9e3a554ed35e20cc5ca0fef20e47ae976cfe06a594e135e416bb05e32 3 OP_CHECKMULTISIG',
        '1 027d222586a44cc5d3650e5fd761b4b2e06b02ffd92fa1099182c79159dfd10d1a 0270a9696aaaa3e9b5acc5d1e3b5f9d8cd7f8ad2d13b44a061fb0eb9530c5ce606 02a51147c9e3a554ed35e20cc5ca0fef20e47ae976cfe06a594e135e416bb05e32 3 OP_CHECKMULTISIG',
        '1 027d222586a44cc5d365134f9662e2b4e73911bad423b548c48edb8618c5d74244 0273bf2a61a3aceea8a48994ecb5fec4d12a8a9d907651b971a80abd4e4149e9d4 02a51147c9e3a554ed35e20cc5ca0fef20e47ae976cfe06a594e135e416bb05e32 3 OP_CHECKMULTISIG',
        '1 037d222586a44cc5d3651548cf23b486fd7804bade3ff84bd485d6801d91d75e46 023dad6422aea1e5a5b597dbf5b5e98cce3e87d0943851eb77a20dac4f0c19eab3 02a51147c9e3a554ed35e20cc5ca0fef20e47ae976cfe06a594e135e416bb05e32 3 OP_CHECKMULTISIG',
        '1 037d222586a44cc5d365064fd369b4befb3913e8ce3cac4ad692d39511d8dd0d73 036dbe656dadede9a8b291d1fab8aac3d87f8acf842551e724ba12b4451650e621 02a51147c9e3a554ed35e20cc5ca0fef20e47ae976cfe06a594e135e416bb05e32 3 OP_CHECKMULTISIG',
        '1 037d222586a44cc5d365001cd763edf1e16e1fbac025b449d88ed5c509d0cc5903 0274a97922bfa2a0b2b384dae8bde9d89e3b97cf943551a77dfb09b15e0919edcc 02a51147c9e3a554ed35e20cc5ca0fef20e47ae976cfe06a594e135e416bb05e32 3 OP_CHECKMULTISIG',
        '1 037d222586a44cc5d365065fde2dfba5fd7c02bac025ac4dde95c6c50dd9db0db3 0273a96f66ebabefb4e18494efaeffdfca3a9a9d853e4cb960fb0eb9581540a605 02a51147c9e3a554ed35e20cc5ca0fef20e47ae976cfe06a594e135e416bb05e32 3 OP_CHECKMULTISIG',
        '1 037d222586a44cc5d3654768c46cfaa2f47a04f3d822ab05c588d39159d0cc48a5 023daf656fbbb8f4a7b58cdbf5bde6c0c77f97d0812444a870b21db946414de79b 02a51147c9e3a554ed35e20cc5ca0fef20e47ae976cfe06a594e135e416bb05e32 3 OP_CHECKMULTISIG',
        '1 037d222586a44cc5d365474ed37bf1a3e67c50edd839b4419190c08a0dd4dd591a 033dbf6f6ea7a8f2b5e183c6f4b1aacacc3e8bd9dd7644a560fb0cb75f1550e63b 02a51147c9e3a554ed35e20cc5ca0fef20e47ae976cfe06a594e135e416bb05e32 3 OP_CHECKMULTISIG',
        '1 037d222586a44cc5d365021cd37ef7a3fa6e50f7d22fb044df89c1880a91dd4230 0268a06e22aeacf3afad9c94f9b9aac5d32f92d89c334bbf61bf5eac454149fa71 02a51147c9e3a554ed35e20cc5ca0fef20e47ae976cfe06a594e135e416bb05e32 3 OP_CHECKMULTISIG',
        '1 027d222586a44cc5d3650848d36ee0f1f76c09ffc53ff605f88e929111d8cd0d21 036dad7a67b9e1a0b1a4c5c4e9b3fac3cd3adedcd1254aa771af17b744414de797 02a51147c9e3a554ed35e20cc5ca0fef20e47ae976cfe06a594e135e416bb05e32 3 OP_CHECKMULTISIG',
        '1 027d222586a44cc5d3654748de68b4b5fa6c12f6d261ab55d48ed68c17d69e5d8c 026fa3686eaea0a0b3b28cdafcfceb8cce3a9bcfdc224ae674be1baa0a0550fbc3 02a51147c9e3a554ed35e20cc5ca0fef20e47ae976cfe06a594e135e416bb05e32 3 OP_CHECKMULTISIG',
        '1 037d222586a44cc5d365134edf6fe1a5f07d50eede21bd56c581df9559c2db5f85 026ba97822bfa2a0a1a48bd1e9bdfec99e3c91d0812351aa70b211b64b0d19f864 02a51147c9e3a554ed35e20cc5ca0fef20e47ae976cfe06a594e135e416bb05e32 3 OP_CHECKMULTISIG',
        '1 037d222586a44cc5d3651553d96bb4bef33904f2d26cbb4dc38fdc8a15ded944c9 037ead6622a4bfe4a3b3c5dbfdfcfededf318ddc92224ca46aa850f87e095ca8e6 02a51147c9e3a554ed35e20cc5ca0fef20e47ae976cfe06a594e135e416bb05e32 3 OP_CHECKMULTISIG',
        '1 027d222586a44cc5d3651445c579f1bcb57003bac429bb50c38592840a91d242ae 0373ab2a63b8ede8a9af80c7effce4c3da3a8d9d923949a761b80ab15c0455f1a7 02a51147c9e3a554ed35e20cc5ca0fef20e47ae976cfe06a594e135e416bb05e32 3 OP_CHECKMULTISIG',
        '1 037d222586a44cc5d365475fd963e0a3fa7550f7d83ebd05f2b0e7c509dec9487c 026fec7e6aaaa3a0a7af9c94f8b3e5dcdb2d9fc9983842eb63a911ad5a4156ee70 02a51147c9e3a554ed35e20cc5ca0fef20e47ae976cfe06a594e135e416bb05e32 3 OP_CHECKMULTISIG',
        '1 0258222586a44cc5d365475dc279f5b2fe7c02bad923bc40c2ceb2e579b1be2df1 031dcc0a02cbcd80c6c1e5b49bdc8aacbe5ffebdf15625cb04db7ed82a6139888b 02a51147c9e3a554ed35e20cc5ca0fef20e47ae976cfe06a594e135e416bb05e32 3 OP_CHECKMULTISIG',
        'OP_DUP OP_HASH160 4de50dc01362d6ad9b4365a56167dae8c029bba1 OP_EQUALVERIFY OP_CHECKSIG'
      ])
    end
  end
end
