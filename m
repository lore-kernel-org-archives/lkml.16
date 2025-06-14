Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36F812E7626;
	Sat, 14 Jun 2025 18:15:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749924927; cv=none; b=cdaesJ75bROPnYBxX+AYU5AWa/fwpBe3yV/SGvzYIcqIJ3WkxaIdejQUxJ0UaohoRwDHQWgphA60LC5oc6Bb/Oz+QrAY67ol+l3AbopVYITF+LTBUYAT4FsHY1/RjpQz6AnFeJ2Lza3gPBsB+2eEbFjs0orYfH8HbcXTkZ8GKH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749924927; c=relaxed/simple;
	bh=hP+WRwN6pCkW1c53+y6PCRIZplyK8iIirUqkqpATSdc=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=Joqkm+Hi45GUM4EUMoYor9T3HCEv/Vc5xx6N0OFSh/qL5HTRHikYKtgVNK80o1h/gQ1ZZo/fcNAajhZni3JZ4fjs9y9+csUVDYy9UtuFIpO7IEu7QeiMRj9TxT4J7gkoShIBpz1nOOVBfogmRedg8OqsSmn7wwRn7Pw5hLYY8uI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RfXC7D3c; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RfXC7D3c"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF907C4CEEB;
	Sat, 14 Jun 2025 18:15:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749924926;
	bh=hP+WRwN6pCkW1c53+y6PCRIZplyK8iIirUqkqpATSdc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RfXC7D3cjcOuRXOFNSIEdDzG/E9CjefrNQNb4MnMvgItM3GqNfPUHHMgdGy3pbWYd
	 Eeln4Rz5OYAAC+H6uMJoiTXTepRjrtkq7hcRyJoCdI7OegDzsJSdoi4uvrl4AZa9EM
	 AaHACRYNDlHolh6QK9+nDywlTtbm0FvZe+dM0zrMJMyzUXfqTLPWbO43KMq0CAgrd9
	 FG/0fm8dCIDIdu/V4stgh3xPOTuSs+3Ehwfcmym1RS/2j86ietEGD30oiN996xBqO0
	 yJXzNIrxv1UfTLY+ue3lC21wW5fcXeD+2tmfZ8FnaxORjcUh8nGQ7T267IMeBkXLL6
	 5/r0cQTc7YE1g==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 14 Jun 2025 20:15:24 +0200
Message-Id: <DAMGM426FUU1.2IESY59SPIIHN@kernel.org>
From: "Benno Lossin" <lossin@kernel.org>
To: "Eunsoo Eun" <ewhk9887@gmail.com>, <rust-for-linux@vger.kernel.org>
Cc: <linux-kernel@vger.kernel.org>, "Eunsoo Eun" <naturale@hufs.ac.kr>,
 "Benno Lossin" <benno.lossin@proton.me>
Subject: Re: [PATCH 1/2] rust: macros: allow optional trailing comma in
 module!
X-Mailer: aerc 0.20.1
References: <20250614081312.763606-1-ewhk9887@gmail.com>
In-Reply-To: <20250614081312.763606-1-ewhk9887@gmail.com>

I didn't get the second patch advertised in the subject, did something
go wrong when sending the patch?

On Sat Jun 14, 2025 at 10:13 AM CEST, Eunsoo Eun wrote:
> From: Eunsoo Eun <naturale@hufs.ac.kr>
>
> Make the `module!` macro syntax more flexible by allowing an optional
> trailing comma after the last field. This makes it consistent with
> Rust=E2=80=99s general syntax patterns where trailing commas are allowed =
in
> structs, arrays, and other comma-separated lists.
>
> For example, these are now all valid:
>
>     module! {
>         type: MyModule,
>         name: "mymodule",
>         license: "GPL"  // No trailing comma
>     }
>
>     module! {
>         type: MyModule,
>         name: "mymodule",
>         license: "GPL",  // With trailing comma
>     }
>
> This change also allows optional trailing commas in array fields like
> `authors`, `alias`, and `firmware`:
>
>     module! {
>         type: MyModule,
>         name: "mymodule",
>         authors: ["Author 1", "Author 2"],  // No trailing comma
>         license: "GPL"
>     }
>
>     module! {
>         type: MyModule,
>         name: "mymodule",
>         authors: ["Author 1", "Author 2",], // With trailing comma
>         license: "GPL"
>     }
>
> Suggested-by: Benno Lossin <benno.lossin@proton.me>
> Link: https://github.com/Rust-for-Linux/linux/issues/1172
> Signed-off-by: Eunsoo Eun <naturale@hufs.ac.kr>
> ---
>  rust/macros/concat_idents.rs |  9 ++++++++
>  rust/macros/module.rs        | 42 ++++++++++++++++++++++++++++++------
>  2 files changed, 45 insertions(+), 6 deletions(-)
>
> diff --git a/rust/macros/concat_idents.rs b/rust/macros/concat_idents.rs
> index 7e4b450f3a50..c139e1658b4a 100644
> --- a/rust/macros/concat_idents.rs
> +++ b/rust/macros/concat_idents.rs
> @@ -17,6 +17,15 @@ pub(crate) fn concat_idents(ts: TokenStream) -> TokenS=
tream {
>      let a =3D expect_ident(&mut it);
>      assert_eq!(expect_punct(&mut it), ',');
>      let b =3D expect_ident(&mut it);
> +   =20
> +    // Check for optional trailing comma
> +    if let Some(TokenTree::Punct(punct)) =3D it.clone().next() {

Please avoid cloning the iterator, as that is inefficient. Instead use
`peekable()` to create an iterator with a `peek` function.

> +        if punct.as_char() =3D=3D ',' {
> +            // Consume the trailing comma
> +            it.next();
> +        }

This allows any kind of trailing token in concat_idents, but only a
comma should be allowed.

> +    }
> +   =20
>      assert!(it.next().is_none(), "only two idents can be concatenated");
>      let res =3D Ident::new(&format!("{a}{b}"), b.span());
>      TokenStream::from_iter([TokenTree::Ident(res)])
> diff --git a/rust/macros/module.rs b/rust/macros/module.rs
> index 2ddd2eeb2852..d37492457be5 100644
> --- a/rust/macros/module.rs
> +++ b/rust/macros/module.rs
> @@ -13,10 +13,27 @@ fn expect_string_array(it: &mut token_stream::IntoIte=
r) -> Vec<String> {
>      while let Some(val) =3D try_string(&mut it) {
>          assert!(val.is_ascii(), "Expected ASCII string");
>          values.push(val);
> -        match it.next() {
> -            Some(TokenTree::Punct(punct)) =3D> assert_eq!(punct.as_char(=
), ','),
> -            None =3D> break,
> -            _ =3D> panic!("Expected ',' or end of array"),
> +
> +        // Check for optional trailing comma
> +        match it.clone().next() {

Please avoid cloning the iterator, as that is inefficient. Instead use
`peekable()` to create an iterator with a `peek` function.

> +            Some(TokenTree::Punct(punct)) if punct.as_char() =3D=3D ',' =
=3D> {
> +                // Consume the comma
> +                it.next();
> +                // Check if there's another string after the comma
> +                if it.clone().next().is_none() {
> +                    // Trailing comma at end of array is allowed
> +                    break;
> +                }
> +            }
> +            Some(TokenTree::Literal(_)) =3D> {
> +                // Next item is a string literal, comma was required
> +                panic!("Expected ',' between array elements");
> +            }
> +            None =3D> {
> +                // End of array, no comma needed
> +                break;
> +            }
> +            Some(_) =3D> panic!("Expected ',' or end of array"),
>          }
>      }
>      values
> @@ -143,9 +160,22 @@ fn parse(it: &mut token_stream::IntoIter) -> Self {
>                  _ =3D> panic!("Unknown key \"{key}\". Valid keys are: {E=
XPECTED_KEYS:?}."),
>              }
> =20
> -            assert_eq!(expect_punct(it), ',');
> -
>              seen_keys.push(key);
> +
> +            // Check for optional trailing comma
> +            match it.clone().next() {
> +                Some(TokenTree::Punct(punct)) if punct.as_char() =3D=3D =
',' =3D> {
> +                    // Consume the comma
> +                    it.next();
> +                }
> +                Some(TokenTree::Ident(_)) =3D> {
> +                    // Next item is an identifier, comma was required
> +                    panic!("Expected ',' between module properties");
> +                }
> +                _ =3D> {
> +                    // End of input or closing brace, comma is optional

This also could be a new opening group or other punctuation, which would
be wrong.

---
Cheers,
Benno

> +                }
> +            }
>          }
> =20
>          expect_end(it);

