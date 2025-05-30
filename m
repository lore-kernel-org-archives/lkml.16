Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 275231B808;
	Fri, 30 May 2025 20:15:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748636143; cv=none; b=Xhpth2H8U4IMweqjihs5QV4bGft/GfV8/ZOAS9XyOVoNDg+ilFYmRgIalYQe376wu/Fxa0Oxdh3o+AhpDRC/B15YiBLjQ1HKpnp/F4qF4q8alJghxcRBFPKjv+Ms5HmwT96ltl46SPhAOghQY74gfoEBhSQBF1J2x2jJ0P/yK4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748636143; c=relaxed/simple;
	bh=KrOIZHhxSkUJP3vmGlK2SK7rs9E8suR8dQyCNjZZ+6A=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=hGAm2SqGBu1o9QJv7Guo6Pcd5G8Lt3jYJm5JTPcchiGMXVyigb3k8d0v9lEkgBHtaur1mzxE7+KT+doaZTvhH0Tzzox7wAPFiowq0bORr+D1EODVXu6oYZZh5xjqZ+LyfQqHY6azHjYWx1jwVnOFYY6xRFbUBnL++Rwh9rvfeyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rPb25AMk; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rPb25AMk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C649C4CEE9;
	Fri, 30 May 2025 20:15:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748636142;
	bh=KrOIZHhxSkUJP3vmGlK2SK7rs9E8suR8dQyCNjZZ+6A=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=rPb25AMkFBCUgpeNqxvLQ29tcXSqi2ZrVODYBx08eYeYlpeY79vvJDhTMV/V/9aBV
	 w0NaYqUx1rmhMP7ubS/4sqA1ciI/oGjXsoQNy07F3omYK4rDckGaGGS6F7yTKBz4JA
	 zCGynzbxzMSTd7DAS1/7/KpHYteceSiPgJ538iJ3PrKBHxYiS/TctRpLs8yOm0PajF
	 kTVtOHvl8r/6FZXTyymwcWguzQca4k48EfW3yY/lA1GTPZA7X1kjdKYm56YU56WbiQ
	 D2v9kIqtK0uxhktn9GQniQ+UoT93Leevv8g0BCTXNCB7ZhRY20+DMI2TRupCmDMs4S
	 PNXlyIPsjzUcw==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 30 May 2025 22:15:37 +0200
Message-Id: <DA9RRZVPZSMW.1LGW9H4G0RLT5@kernel.org>
Cc: <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 7/7] rust: sample: misc: implement device driver sample
From: "Benno Lossin" <lossin@kernel.org>
To: "Danilo Krummrich" <dakr@kernel.org>, <gregkh@linuxfoundation.org>,
 <rafael@kernel.org>, <ojeda@kernel.org>, <alex.gaynor@gmail.com>,
 <boqun.feng@gmail.com>, <gary@garyguo.net>, <bjorn3_gh@protonmail.com>,
 <benno.lossin@proton.me>, <a.hindborg@kernel.org>, <aliceryhl@google.com>,
 <tmgross@umich.edu>, <chrisi.schrefl@gmail.com>
X-Mailer: aerc 0.20.1
References: <20250530142447.166524-1-dakr@kernel.org>
 <20250530142447.166524-8-dakr@kernel.org>
In-Reply-To: <20250530142447.166524-8-dakr@kernel.org>

On Fri May 30, 2025 at 4:24 PM CEST, Danilo Krummrich wrote:
> In order to demonstrate and test a MiscDeviceRegistration with a parent
> device, introduce CONFIG_SAMPLE_RUST_MISC_DEVICE_WITH_PARENT.
>
> If CONFIG_SAMPLE_RUST_MISC_DEVICE_WITH_PARENT=3Dy the misc device sample
> is initialized with a parent device (faux), otherwise it is initialized
> without a parent device, i.e. the exact same way as without this patch.
>
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>
> ---
>  samples/rust/Kconfig             |  8 +++++
>  samples/rust/rust_misc_device.rs | 50 +++++++++++++++++++++++++++++---
>  2 files changed, 54 insertions(+), 4 deletions(-)
>
> diff --git a/samples/rust/Kconfig b/samples/rust/Kconfig
> index b1006ab4bc3c..9948ec0939ef 100644
> --- a/samples/rust/Kconfig
> +++ b/samples/rust/Kconfig
> @@ -30,6 +30,14 @@ config SAMPLE_RUST_MISC_DEVICE
> =20
>  	  If unsure, say N.
> =20
> +config SAMPLE_RUST_MISC_DEVICE_WITH_PARENT
> +	bool "Create a misc device with a parent device"
> +	depends on SAMPLE_RUST_MISC_DEVICE
> +	default n
> +	help
> +	  Say Y here if you want the misc device sample to create a misc
> +	  device with a parent device.
> +

Why not create a separate file? The `cfg`s might confuse newcomers
looking at the sample.

>  config SAMPLE_RUST_PRINT
>  	tristate "Printing macros"
>  	help
> diff --git a/samples/rust/rust_misc_device.rs b/samples/rust/rust_misc_de=
vice.rs
> index 9bf1a0f64e6e..175638d6d341 100644
> --- a/samples/rust/rust_misc_device.rs
> +++ b/samples/rust/rust_misc_device.rs
> @@ -167,6 +167,9 @@
>      uaccess::{UserSlice, UserSliceReader, UserSliceWriter},
>  };
> =20
> +#[cfg(CONFIG_SAMPLE_RUST_MISC_DEVICE_WITH_PARENT)]
> +use kernel::faux;
> +
>  const RUST_MISC_DEV_HELLO: u32 =3D _IO('|' as u32, 0x80);
>  const RUST_MISC_DEV_GET_VALUE: u32 =3D _IOR::<i32>('|' as u32, 0x81);
>  const RUST_MISC_DEV_SET_VALUE: u32 =3D _IOW::<i32>('|' as u32, 0x82);
> @@ -181,19 +184,33 @@
>      license: "GPL",
>  }
> =20
> +#[cfg(not(CONFIG_SAMPLE_RUST_MISC_DEVICE_WITH_PARENT))]
>  #[pin_data]
>  struct RustMiscDeviceModule {
>      #[pin]
>      _miscdev: MiscDeviceRegistration<RustMiscDevice>,
>  }
> =20
> -impl kernel::InPlaceModule for RustMiscDeviceModule {
> -    fn init(_module: &'static ThisModule) -> impl PinInit<Self, Error> {
> +#[cfg(CONFIG_SAMPLE_RUST_MISC_DEVICE_WITH_PARENT)]
> +struct RustMiscDeviceModule {
> +    _faux: faux::Registration,
> +    _miscdev: Pin<KBox<MiscDeviceRegistration<RustMiscDevice>>>,
> +}
> +
> +impl RustMiscDeviceModule {
> +    fn init() -> MiscDeviceOptions {
>          pr_info!("Initializing Rust Misc Device Sample\n");
> =20
> -        let options =3D MiscDeviceOptions {
> +        MiscDeviceOptions {
>              name: c_str!("rust-misc-device"),
> -        };
> +        }
> +    }
> +}
> +
> +#[cfg(not(CONFIG_SAMPLE_RUST_MISC_DEVICE_WITH_PARENT))]
> +impl kernel::InPlaceModule for RustMiscDeviceModule {
> +    fn init(_module: &'static ThisModule) -> impl PinInit<Self, Error> {
> +        let options =3D Self::init();
> =20
>          try_pin_init!(Self {
>              _miscdev <- MiscDeviceRegistration::register(
> @@ -205,6 +222,31 @@ fn init(_module: &'static ThisModule) -> impl PinIni=
t<Self, Error> {
>      }
>  }
> =20
> +#[cfg(CONFIG_SAMPLE_RUST_MISC_DEVICE_WITH_PARENT)]
> +impl kernel::Module for RustMiscDeviceModule {
> +    fn init(_module: &'static ThisModule) -> Result<Self> {
> +        let options =3D Self::init();
> +        let faux =3D faux::Registration::new(c_str!("rust-misc-device-sa=
mple"), None)?;
> +
> +        // For every other bus, this would be called from Driver::probe(=
), which would return a
> +        // `Result<Pin<KBox<T>>>`, but faux always binds to a "dummy" dr=
iver, hence probe() is

Not clear what `T` is supposed to be, do you mean `Self`?

> +        // not required.
> +        let misc =3D KBox::pin_init(
> +            MiscDeviceRegistration::register(
> +                options,
> +                Arc::pin_init(new_mutex!(Inner { value: 0_i32 }), GFP_KE=
RNEL),
> +                Some(faux.as_ref()),
> +            ),
> +            GFP_KERNEL,
> +        )?;

You could also initialize this module variation in-place. (this would
also require the pin-init change to reference initialized fields)

---
Cheers,
Benno

> +
> +        Ok(Self {
> +            _faux: faux,
> +            _miscdev: misc,
> +        })
> +    }
> +}
> +
>  struct Inner {
>      value: i32,
>  }

