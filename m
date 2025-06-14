Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C5CC2E3382
	for <linux-kernel@vger.kernel.org>; Sat, 14 Jun 2025 17:42:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.67.36.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749922981; cv=none; b=mieG+ZZH41mi+yQmDJAfJPVhcyYY5pneIPWL2k+k+QmchRvpCThJ7JQ0+vdMbVm9uheJC3GnX+UVy6GgporqdHR6OUM5lNG0cOYsFcPugzXf3motMz2XNbn1kPrhagUcNm+5h5JgkypRTnDTmm/Q5FRH0rf2gNgIeIc0FAVdAi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749922981; c=relaxed/simple;
	bh=Q5pLQ6oIBIQ+Hqd/WY1ApEmlO+DYAGnBVH0C4rdWSsk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=cFve1jPpull8EyMkJae8px57Evj7fze2eEcdSt6rMwXm8sOteRDjtxWEFaCeuY9ssrktzSzOovJXNQPqi3TNfstwKByFVKD8Ow/3wofql8bsvdJxJ16n4Qrl1PK4tcC0w+rwg8iTQKbHSrnBzfbkOBGC9tG8qZbvIX+6A489lhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.net; spf=pass smtp.mailfrom=posteo.net; dkim=pass (3072-bit key) header.d=posteo.net header.i=@posteo.net header.b=JzL4t5Cq; arc=none smtp.client-ip=185.67.36.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=posteo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (3072-bit key) header.d=posteo.net header.i=@posteo.net header.b="JzL4t5Cq"
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id 1F49C240101
	for <linux-kernel@vger.kernel.org>; Sat, 14 Jun 2025 19:42:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.net;
	s=1984.ea087b; t=1749922977;
	bh=Q5pLQ6oIBIQ+Hqd/WY1ApEmlO+DYAGnBVH0C4rdWSsk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:From;
	b=JzL4t5CqgGtp8TmSNlU7d6IERMmYwcA22IiEONRLxXELv/DWrDg8PKsxZhig6ZxJ2
	 HovOz5OV8zyffOUcGLxTY1nlK3BlkIuqKGskqP3W4P9KG6/9Opf3hFfDTYp8UTNymE
	 Xzb2ZWU+N0XuQqwGMmuB3vUWnHvNkSmar0/AuUJ+gZT76neUzUTi/fqvmgr0GXSPlV
	 o1SBLHWYGTmIvZc+5z03wGgl05OBJkG4f8AuavwXdj0rZ/q0W0Jwy/pcme0Er5dQBM
	 p0yymQRFx8+oVaCY/nYa7FqUFwy63lskaGWdNiBVBqla3cfTSGfDFR3rZB90t559ku
	 GhyFaJJkQilGHZlyaVtJFjTQXMA5Td1/sCniVo8p2N9gUsdQUlx2dSHuH7zvtu8FQS
	 aCGLxL6SYlkUxcGO+zAFpW59jwW+U+JVj5p3zsDMHF9oCZlZVv6vpEl5HldZMHscbX
	 D5tOgQxl0QlBPKD3SKyDfZj7Zgq87e9innL8zeoRpRZVXVP7N+M
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4bKNrn5jBPz6trs;
	Sat, 14 Jun 2025 19:42:49 +0200 (CEST)
From: Charalampos Mitrodimas <charmitro@posteo.net>
To: Eunsoo Eun <ewhk9887@gmail.com>
Cc: rust-for-linux@vger.kernel.org,  linux-kernel@vger.kernel.org,  Eunsoo
 Eun <naturale@hufs.ac.kr>,  Benno Lossin <benno.lossin@proton.me>
Subject: Re: [PATCH 1/2] rust: macros: allow optional trailing comma in module!
In-Reply-To: <20250614081312.763606-1-ewhk9887@gmail.com>
References: <20250614081312.763606-1-ewhk9887@gmail.com>
Date: Sat, 14 Jun 2025 17:42:27 +0000
Message-ID: <87zfeamd8c.fsf@posteo.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Eunsoo Eun <ewhk9887@gmail.com> writes:

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
> +=20=20=20=20

We have some whitespaces here ^

> +    // Check for optional trailing comma
> +    if let Some(TokenTree::Punct(punct)) =3D it.clone().next() {
> +        if punct.as_char() =3D=3D ',' {
> +            // Consume the trailing comma
> +            it.next();
> +        }
> +    }
> +=20=20=20=20

Whitespaces also here ^.

Maybe you can add a new helper function for this one?

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

We might be able to do something like this here,
   let next_token =3D it.clone().next();
   match next_token {
         ...

> +            Some(TokenTree::Punct(punct)) if punct.as_char() =3D=3D ',' =
=3D> {
> +                // Consume the comma
> +                it.next();
> +                // Check if there's another string after the comma
> +                if it.clone().next().is_none() {
> +                    // Trailing comma at end of array is allowed
> +                    break;
> +                }

Lose this, and let it check naturally?

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
>=20=20
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
> +                }
> +            }
>          }
>=20=20
>          expect_end(it);
