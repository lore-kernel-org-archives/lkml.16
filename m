Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C59922E719F;
	Tue, 17 Jun 2025 13:01:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750165283; cv=none; b=r5lJIlR5U/gl00rUwC6TLh0h11K0a/brYDfNt/facDex6GwpQnEMQeAi8DhZvbfMQhxzwrxcrRxEotOUdr5+rbvLygItqctrzcyg9Wqg+EzUGFz1Wr3adz98d6W6Qt3ZQx+QIY7ajZkUzibW5WWjBjIGBLoTCWI8SqAM+nbzpO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750165283; c=relaxed/simple;
	bh=qA2Ta6/U0VAg7wGZf08fGR/tC/NpdtEsYBXGvczlt9U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kFuWigFaJMVAMol7vo2m6AEwUR8MXlezWcMAsBJ/i92Kvg3mrDY1ROUjoFPfZemZhrJUiWlzGDLmfkNccGBm2KnFkmOSnK/bcruon7W/KrdvvhFZ+mzLwYGX8vlXcAkSAj4zrrUqRZXkUieOw+fmBAiSQulMUhIx6nKB/3qWOwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M1ntl3NP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M1ntl3NP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62B52C4CEE3;
	Tue, 17 Jun 2025 13:01:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750165283;
	bh=qA2Ta6/U0VAg7wGZf08fGR/tC/NpdtEsYBXGvczlt9U=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=M1ntl3NPO/HAMHtSjVG/7Xt3nA86JS965QA57CHjGlAaSKzYV40DgrIQf9SQagZWj
	 sQTno/CNppX2vqSWn0erIYqDUcoADC7gkCBks0K8yHB4rp+t+i/oRpnYHV4xF+zPiQ
	 YitJy+sLGjfhiXJJ666hOFjpAie/n9iH5nWftNQ/kKUKos4ovJyfhC6IEC6M3ULNsz
	 N+gHb0Ie/Pq0zM3rMkOQ0xoGclaFEmN2MN0Hp/U0m22Yku+HYtqyGv2qnRp0fNJGbM
	 LwJ0aTRQvQhDyx7uSFQ2+m7fyEg3R+Ct8gOjMKSwWZtdo8iLUeY8RRBAW31JYqGKu0
	 UY6OiaH9P6Deg==
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-addda47ebeaso1147874666b.1;
        Tue, 17 Jun 2025 06:01:23 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVMIrdQFJ0PeFIFDaLsKASnWT0+Y8EbAoYi/JMYMoXTAik7UZ2SzI5Gtfhkii+vcX+yAUhvCezb6i6/Ui4J@vger.kernel.org, AJvYcCVmW1sVAyceXAeuPGaMRSF7idYE8WmY3l7sxQOGrfH0sL4IKJTwCA7Y/WnLN3XtwUMNZU/ov76z1zPa@vger.kernel.org, AJvYcCWdlPKG/mdPpRamhTCNAx234r0T3nDXNu4/ZiFY5w8/xMml2Zu+hcef/MdZJIXEk2Rq/mAksiN5qwhvu96Scxs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/e18UV6+KrGNJBEKlrzyTIomNnW8u6KFZXtdyZA0gB1mAvzvq
	r74/JDEYmp/im4ydSTLOhFgZ+U0uK4Gvk3jnz58SoSOIb45keypy1J3/RXlu/KJn97HbSMkK/UB
	BLV9PfU5Cee2dXZVMi2yJ8ADRRLVbqQ==
X-Google-Smtp-Source: AGHT+IG9M1oo969JfgUiiSzgSAoKMZK9natZ+rqQw3z6YHuoXhuV5j/ioO15HhqLpQ8uoiPvSP8B555iJcGbCUxTsVA=
X-Received: by 2002:a17:907:7e92:b0:adb:2e9f:5d11 with SMTP id
 a640c23a62f3a-adfad4515f3mr1053840666b.37.1750165280323; Tue, 17 Jun 2025
 06:01:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250616154511.1862909-1-remo@buenzli.dev> <20250616154511.1862909-4-remo@buenzli.dev>
In-Reply-To: <20250616154511.1862909-4-remo@buenzli.dev>
From: Rob Herring <robh@kernel.org>
Date: Tue, 17 Jun 2025 08:01:08 -0500
X-Gmail-Original-Message-ID: <CAL_JsqKXrsdGjTE5KDkqmVHUK5urMJnWSLWgEi8H1yM21gcOCA@mail.gmail.com>
X-Gm-Features: AX0GCFvmJU-fnb9jTXvPd-qWR-SSg2EzNna8ZQCIRDR0t8tdHpfy0WVf6pC0pMA
Message-ID: <CAL_JsqKXrsdGjTE5KDkqmVHUK5urMJnWSLWgEi8H1yM21gcOCA@mail.gmail.com>
Subject: Re: [PATCH v1 3/3] samples: rust: platform: Add property child and
 reference args examples
To: Remo Senekowitsch <remo@buenzli.dev>
Cc: Saravana Kannan <saravanak@google.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Mark Brown <broonie@kernel.org>, Dirk Behme <dirk.behme@de.bosch.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 16, 2025 at 10:45=E2=80=AFAM Remo Senekowitsch <remo@buenzli.de=
v> wrote:
>
> Add some example usage of the device property methods for reading
> DT/ACPI/swnode child nodes and reference args.
>
> Signed-off-by: Remo Senekowitsch <remo@buenzli.dev>
> ---
>  drivers/of/unittest-data/tests-platform.dtsi |  7 +++++++
>  samples/rust/rust_driver_platform.rs         | 13 ++++++++++++-
>  2 files changed, 19 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/of/unittest-data/tests-platform.dtsi b/drivers/of/un=
ittest-data/tests-platform.dtsi
> index 50a51f38afb6..509eb614ab2b 100644
> --- a/drivers/of/unittest-data/tests-platform.dtsi
> +++ b/drivers/of/unittest-data/tests-platform.dtsi
> @@ -40,6 +40,13 @@ test-device@2 {
>
>                                 test,u32-prop =3D <0xdeadbeef>;
>                                 test,i16-array =3D /bits/ 16 <1 2 (-3) (-=
4)>;
> +
> +                               ref_child_0: child@0 {

child-0 or you need to add 'reg' property if you keep the unit-address.

> +                                       test,ref-arg =3D <&ref_child_1 0x=
20 0x32>;
> +                               };
> +                               ref_child_1: child@1 {
> +                                       test,ref-arg =3D <&ref_child_0 0x=
10 0x64>;
> +                               };
>                         };
>                 };
>
> diff --git a/samples/rust/rust_driver_platform.rs b/samples/rust/rust_dri=
ver_platform.rs
> index c0abf78d0683..4dcedb22a4bb 100644
> --- a/samples/rust/rust_driver_platform.rs
> +++ b/samples/rust/rust_driver_platform.rs
> @@ -4,7 +4,11 @@
>
>  use kernel::{
>      c_str,
> -    device::{self, Core},
> +    device::{
> +        self,
> +        property::{FwNodeReferenceArgs, NArgs},
> +        Core,
> +    },
>      of, platform,
>      prelude::*,
>      str::CString,
> @@ -91,6 +95,13 @@ fn properties_parse(dev: &device::Device) -> Result {
>          let prop: KVec<i16> =3D fwnode.property_read_array_vec(name, 4)?=
.required_by(dev)?;
>          dev_info!(dev, "'{name}'=3D'{prop:?}' (KVec)\n");
>
> +        for child in fwnode.children() {
> +            let name =3D c_str!("test,ref-arg");
> +            let nargs =3D NArgs::N(2);
> +            let prop: FwNodeReferenceArgs =3D child.property_get_referen=
ce_args(name, nargs, 0)?;

Is there some reason we can just pass 2 in rather than nargs? Seems
overly verbose for my tastes.

> +            dev_info!(dev, "'{name}'=3D'{prop:?}'\n");
> +        }
> +
>          Ok(())
>      }
>  }
> --
> 2.49.0
>
