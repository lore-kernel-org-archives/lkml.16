Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D25A1E1E1B;
	Sat, 31 May 2025 08:11:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748679073; cv=none; b=QaSLduNJXez8Ka20tL98j1tuOy5+uzw+ZOEJiaIX+hufjOIoinp+6RYGfnegYa68N84j1VxSEq5VWEDV0pyntKmNvxiIQTQEzEU+Y4SLmNHRTPx4b/bqGs63fpV975nCn+7E6Joau+oAc+nLik5WAXlBR7K9xffRrVGYiMFGkFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748679073; c=relaxed/simple;
	bh=5EpEz4W5NQgCGVf6NZUg8RK3U0K6LQ7ge9fPKoAs3mQ=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=Dc7E4m3wJh6Hu4tzTC1ZvtnpKksbUHmMAgHwhGsy8+biptwQfE9O74kVUipfWAmT9xif+O1mUpuGBe5o8pebUiGRCqQ3WU73x9AjvD22f+0lfH6MkgaXqKdlDj1fliSWjKEtV0IVb+jUUomtquKkT553ck52BmuQ6EMHm2LJ8Wg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=r9ivJzHU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="r9ivJzHU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B123C4CEE3;
	Sat, 31 May 2025 08:11:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748679073;
	bh=5EpEz4W5NQgCGVf6NZUg8RK3U0K6LQ7ge9fPKoAs3mQ=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=r9ivJzHUl0Zj1DERPhTbtzbQIdaQvW/6387j4di/Ur+w6uIlvQXbmz+ATKxOLifau
	 Mo1F4Fd9yQ74tDzJG8OD3GdVuBzlU7AP/KTqmF3SFoZLPZ4BLgvyLGlbSeJN9zBHeg
	 BjHbUbMjLm55KsobyL22Tt5gdO7h3ebZq6rGsYVEPS13dk4f35lZtD5YsbSlbBWhkf
	 crY96JO6JqlmeVy7/2HHmfwJq3D5VXEvVEGbSVCWFb8zEaTvfH9f394UFeUzQFimk9
	 EoMl2fDNUkttjomcLCm7R2sSL/HyEQKJtFBo28Sr2L20lZKocvbAlpekJ52o+Upm1w
	 qIgIhCYVmQcqQ==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 31 May 2025 10:11:08 +0200
Message-Id: <DAA6ZTTNP0CM.270XX92YOFGWB@kernel.org>
Subject: Re: [PATCH 7/7] rust: sample: misc: implement device driver sample
From: "Benno Lossin" <lossin@kernel.org>
To: "Danilo Krummrich" <dakr@kernel.org>
Cc: <gregkh@linuxfoundation.org>, <rafael@kernel.org>, <ojeda@kernel.org>,
 <alex.gaynor@gmail.com>, <boqun.feng@gmail.com>, <gary@garyguo.net>,
 <bjorn3_gh@protonmail.com>, <benno.lossin@proton.me>,
 <a.hindborg@kernel.org>, <aliceryhl@google.com>, <tmgross@umich.edu>,
 <chrisi.schrefl@gmail.com>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.20.1
References: <20250530142447.166524-1-dakr@kernel.org>
 <20250530142447.166524-8-dakr@kernel.org>
 <DA9RRZVPZSMW.1LGW9H4G0RLT5@kernel.org> <aDowAzvEvrQcella@pollux>
In-Reply-To: <aDowAzvEvrQcella@pollux>

On Sat May 31, 2025 at 12:24 AM CEST, Danilo Krummrich wrote:
> On Fri, May 30, 2025 at 10:15:37PM +0200, Benno Lossin wrote:
>> On Fri May 30, 2025 at 4:24 PM CEST, Danilo Krummrich wrote:
>> > In order to demonstrate and test a MiscDeviceRegistration with a paren=
t
>> > device, introduce CONFIG_SAMPLE_RUST_MISC_DEVICE_WITH_PARENT.
>> >
>> > If CONFIG_SAMPLE_RUST_MISC_DEVICE_WITH_PARENT=3Dy the misc device samp=
le
>> > is initialized with a parent device (faux), otherwise it is initialize=
d
>> > without a parent device, i.e. the exact same way as without this patch=
.
>> >
>> > Signed-off-by: Danilo Krummrich <dakr@kernel.org>
>> > ---
>> >  samples/rust/Kconfig             |  8 +++++
>> >  samples/rust/rust_misc_device.rs | 50 +++++++++++++++++++++++++++++--=
-
>> >  2 files changed, 54 insertions(+), 4 deletions(-)
>> >
>> > diff --git a/samples/rust/Kconfig b/samples/rust/Kconfig
>> > index b1006ab4bc3c..9948ec0939ef 100644
>> > --- a/samples/rust/Kconfig
>> > +++ b/samples/rust/Kconfig
>> > @@ -30,6 +30,14 @@ config SAMPLE_RUST_MISC_DEVICE
>> > =20
>> >  	  If unsure, say N.
>> > =20
>> > +config SAMPLE_RUST_MISC_DEVICE_WITH_PARENT
>> > +	bool "Create a misc device with a parent device"
>> > +	depends on SAMPLE_RUST_MISC_DEVICE
>> > +	default n
>> > +	help
>> > +	  Say Y here if you want the misc device sample to create a misc
>> > +	  device with a parent device.
>> > +
>>=20
>> Why not create a separate file? The `cfg`s might confuse newcomers
>> looking at the sample.
>
> It would be a lot of duplicated code, unless we really *only* exercise th=
e
> device creation and registration part, which would be a bit unfortunate, =
given
> that this sample is also a pretty good test.

We could separate the common parts into a single file and then
`include!` that file from the two samples. (Or if the build system
supports multi-file samples then just use that, but my gut feeling is
that it doesn't)

I really would like to avoid `cfg` in samples.

>> >  config SAMPLE_RUST_PRINT
>> >  	tristate "Printing macros"
>> >  	help
>> > diff --git a/samples/rust/rust_misc_device.rs b/samples/rust/rust_misc=
_device.rs
>> > index 9bf1a0f64e6e..175638d6d341 100644
>> > --- a/samples/rust/rust_misc_device.rs
>> > +++ b/samples/rust/rust_misc_device.rs
>> > @@ -167,6 +167,9 @@
>> >      uaccess::{UserSlice, UserSliceReader, UserSliceWriter},
>> >  };
>> > =20
>> > +#[cfg(CONFIG_SAMPLE_RUST_MISC_DEVICE_WITH_PARENT)]
>> > +use kernel::faux;
>> > +
>> >  const RUST_MISC_DEV_HELLO: u32 =3D _IO('|' as u32, 0x80);
>> >  const RUST_MISC_DEV_GET_VALUE: u32 =3D _IOR::<i32>('|' as u32, 0x81);
>> >  const RUST_MISC_DEV_SET_VALUE: u32 =3D _IOW::<i32>('|' as u32, 0x82);
>> > @@ -181,19 +184,33 @@
>> >      license: "GPL",
>> >  }
>> > =20
>> > +#[cfg(not(CONFIG_SAMPLE_RUST_MISC_DEVICE_WITH_PARENT))]
>> >  #[pin_data]
>> >  struct RustMiscDeviceModule {
>> >      #[pin]
>> >      _miscdev: MiscDeviceRegistration<RustMiscDevice>,
>> >  }
>> > =20
>> > -impl kernel::InPlaceModule for RustMiscDeviceModule {
>> > -    fn init(_module: &'static ThisModule) -> impl PinInit<Self, Error=
> {
>> > +#[cfg(CONFIG_SAMPLE_RUST_MISC_DEVICE_WITH_PARENT)]
>> > +struct RustMiscDeviceModule {
>> > +    _faux: faux::Registration,
>> > +    _miscdev: Pin<KBox<MiscDeviceRegistration<RustMiscDevice>>>,
>> > +}
>> > +
>> > +impl RustMiscDeviceModule {
>> > +    fn init() -> MiscDeviceOptions {
>> >          pr_info!("Initializing Rust Misc Device Sample\n");
>> > =20
>> > -        let options =3D MiscDeviceOptions {
>> > +        MiscDeviceOptions {
>> >              name: c_str!("rust-misc-device"),
>> > -        };
>> > +        }
>> > +    }
>> > +}
>> > +
>> > +#[cfg(not(CONFIG_SAMPLE_RUST_MISC_DEVICE_WITH_PARENT))]
>> > +impl kernel::InPlaceModule for RustMiscDeviceModule {
>> > +    fn init(_module: &'static ThisModule) -> impl PinInit<Self, Error=
> {
>> > +        let options =3D Self::init();
>> > =20
>> >          try_pin_init!(Self {
>> >              _miscdev <- MiscDeviceRegistration::register(
>> > @@ -205,6 +222,31 @@ fn init(_module: &'static ThisModule) -> impl Pin=
Init<Self, Error> {
>> >      }
>> >  }
>> > =20
>> > +#[cfg(CONFIG_SAMPLE_RUST_MISC_DEVICE_WITH_PARENT)]
>> > +impl kernel::Module for RustMiscDeviceModule {
>> > +    fn init(_module: &'static ThisModule) -> Result<Self> {
>> > +        let options =3D Self::init();
>> > +        let faux =3D faux::Registration::new(c_str!("rust-misc-device=
-sample"), None)?;
>> > +
>> > +        // For every other bus, this would be called from Driver::pro=
be(), which would return a

Missing '`' around Driver::probe().

>> > +        // `Result<Pin<KBox<T>>>`, but faux always binds to a "dummy"=
 driver, hence probe() is
>>=20
>> Not clear what `T` is supposed to be, do you mean `Self`?
>
> From the perspective of the type implementing the corresponding Driver tr=
ait it
> would indeed be `Self`. But I found it ambiguous to write `Self`, since I=
 do *not*
> mean `RustMiscDeviceModule` with `Self`.

Yeah that makes sense, I already entered into the `impl Driver` context
:) How about we use `<T as Driver>::probe()` above and then `T` makes
sense?

Another thing: faux devices don't have a `probe` in rust, so saying "not
required" doesn't make much sense, right?

>> > +        // not required.
>> > +        let misc =3D KBox::pin_init(
>> > +            MiscDeviceRegistration::register(
>> > +                options,
>> > +                Arc::pin_init(new_mutex!(Inner { value: 0_i32 }), GFP=
_KERNEL),
>> > +                Some(faux.as_ref()),
>> > +            ),
>> > +            GFP_KERNEL,
>> > +        )?;
>>=20
>> You could also initialize this module variation in-place. (this would
>> also require the pin-init change to reference initialized fields)
>
> Yes, I also thought about that. But this way is a bit closer to what thin=
gs
> would look like within a probe() callback.

Yeah then let's do that :)

---
Cheers,
Benno
