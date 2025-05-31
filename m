Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA5A720F081;
	Sat, 31 May 2025 10:29:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748687349; cv=none; b=dmZ4NxlIiQCk3PBorEPWy8CAvVqgAt+Xat1CVBxmHzHaqi1IuSXLXSBGuVsINSC9QHEBTZfjBvkuWcuaeIvVY43qVzzp8ZJsoUli+mo+ghKgTnIj0k5C/8RB0+Xn3Cp+LS0tpgeIE1Jxxr02uezokUQViiledpvWOoKRyPXSuaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748687349; c=relaxed/simple;
	bh=sMGuKpxgeOPx3NneVHy9Y0kTkfFIKHETcLijemOUjWY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ctUZi0XUCXKy9LNHxdHc44iPSv3UTqIhpIArkLCFOgVM5+71ZCoKNGsvGJ2hxm1Ik3Dl6iXyFp8ESFIm1zjBVuWuT0QRX6EbWDWPJdlOV6WsLe5HJewyowkqWj+FWUKpMA28/NjQ6uTloPH5cWYM51idprNtqS/KAJ2bYCorUYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OcpWqGbW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OcpWqGbW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4EA71C4CEE3;
	Sat, 31 May 2025 10:29:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748687348;
	bh=sMGuKpxgeOPx3NneVHy9Y0kTkfFIKHETcLijemOUjWY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OcpWqGbWis1DGeTMbcz1vfMEey365f+xcDZfeYcVX23L1ifgEyFul2w2F37LLPDr8
	 zHO/n7oDHR+ykevD+9FzFShEtV9LwkdyDxRk8oidheM8yIEXTg9Gy2b1bmLfW06LZA
	 T2UG0i23ZI0rv+SSI/gysVGHa9XrpojlYhFed9d9LjN7ha6Ni33mHR7Bon0qrTnpM2
	 CZNpftjQYt0srUPZOrIL66IBP0tB8IIQo7uGBRsOnLirdrKEP2p94ENdicVUjT5tB6
	 XYDrc7vf9EI5UNBB5vBW4+T+vA7DDD5hmE3sojFLLWE6nAPXseP2AxnjWAz11rseb+
	 4hzIkCPZiITjg==
Date: Sat, 31 May 2025 12:29:02 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Benno Lossin <lossin@kernel.org>
Cc: gregkh@linuxfoundation.org, rafael@kernel.org, ojeda@kernel.org,
	alex.gaynor@gmail.com, boqun.feng@gmail.com, gary@garyguo.net,
	bjorn3_gh@protonmail.com, benno.lossin@proton.me,
	a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu,
	chrisi.schrefl@gmail.com, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 7/7] rust: sample: misc: implement device driver sample
Message-ID: <aDrZ7ma_aNki3FRz@pollux>
References: <20250530142447.166524-1-dakr@kernel.org>
 <20250530142447.166524-8-dakr@kernel.org>
 <DA9RRZVPZSMW.1LGW9H4G0RLT5@kernel.org>
 <aDowAzvEvrQcella@pollux>
 <DAA6ZTTNP0CM.270XX92YOFGWB@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DAA6ZTTNP0CM.270XX92YOFGWB@kernel.org>

On Sat, May 31, 2025 at 10:11:08AM +0200, Benno Lossin wrote:
> On Sat May 31, 2025 at 12:24 AM CEST, Danilo Krummrich wrote:
> > On Fri, May 30, 2025 at 10:15:37PM +0200, Benno Lossin wrote:
> >> On Fri May 30, 2025 at 4:24 PM CEST, Danilo Krummrich wrote:
> >> > In order to demonstrate and test a MiscDeviceRegistration with a parent
> >> > device, introduce CONFIG_SAMPLE_RUST_MISC_DEVICE_WITH_PARENT.
> >> >
> >> > If CONFIG_SAMPLE_RUST_MISC_DEVICE_WITH_PARENT=y the misc device sample
> >> > is initialized with a parent device (faux), otherwise it is initialized
> >> > without a parent device, i.e. the exact same way as without this patch.
> >> >
> >> > Signed-off-by: Danilo Krummrich <dakr@kernel.org>
> >> > ---
> >> >  samples/rust/Kconfig             |  8 +++++
> >> >  samples/rust/rust_misc_device.rs | 50 +++++++++++++++++++++++++++++---
> >> >  2 files changed, 54 insertions(+), 4 deletions(-)
> >> >
> >> > diff --git a/samples/rust/Kconfig b/samples/rust/Kconfig
> >> > index b1006ab4bc3c..9948ec0939ef 100644
> >> > --- a/samples/rust/Kconfig
> >> > +++ b/samples/rust/Kconfig
> >> > @@ -30,6 +30,14 @@ config SAMPLE_RUST_MISC_DEVICE
> >> >  
> >> >  	  If unsure, say N.
> >> >  
> >> > +config SAMPLE_RUST_MISC_DEVICE_WITH_PARENT
> >> > +	bool "Create a misc device with a parent device"
> >> > +	depends on SAMPLE_RUST_MISC_DEVICE
> >> > +	default n
> >> > +	help
> >> > +	  Say Y here if you want the misc device sample to create a misc
> >> > +	  device with a parent device.
> >> > +
> >> 
> >> Why not create a separate file? The `cfg`s might confuse newcomers
> >> looking at the sample.
> >
> > It would be a lot of duplicated code, unless we really *only* exercise the
> > device creation and registration part, which would be a bit unfortunate, given
> > that this sample is also a pretty good test.
> 
> We could separate the common parts into a single file and then
> `include!` that file from the two samples. (Or if the build system
> supports multi-file samples then just use that, but my gut feeling is
> that it doesn't)

The samples are normal modules, where we can have multiple files. But I don't
see how that helps.

`include!` works, but I'm not sure it's that much better.

Another option would be to put the `cfg` on the module!() macro itself and have
two separate module types, this way there is only a `cfg` on the two module!()
invocations.

> 
> I really would like to avoid `cfg` in samples.
> 
> >> >  config SAMPLE_RUST_PRINT
> >> >  	tristate "Printing macros"
> >> >  	help
> >> > diff --git a/samples/rust/rust_misc_device.rs b/samples/rust/rust_misc_device.rs
> >> > index 9bf1a0f64e6e..175638d6d341 100644
> >> > --- a/samples/rust/rust_misc_device.rs
> >> > +++ b/samples/rust/rust_misc_device.rs
> >> > @@ -167,6 +167,9 @@
> >> >      uaccess::{UserSlice, UserSliceReader, UserSliceWriter},
> >> >  };
> >> >  
> >> > +#[cfg(CONFIG_SAMPLE_RUST_MISC_DEVICE_WITH_PARENT)]
> >> > +use kernel::faux;
> >> > +
> >> >  const RUST_MISC_DEV_HELLO: u32 = _IO('|' as u32, 0x80);
> >> >  const RUST_MISC_DEV_GET_VALUE: u32 = _IOR::<i32>('|' as u32, 0x81);
> >> >  const RUST_MISC_DEV_SET_VALUE: u32 = _IOW::<i32>('|' as u32, 0x82);
> >> > @@ -181,19 +184,33 @@
> >> >      license: "GPL",
> >> >  }
> >> >  
> >> > +#[cfg(not(CONFIG_SAMPLE_RUST_MISC_DEVICE_WITH_PARENT))]
> >> >  #[pin_data]
> >> >  struct RustMiscDeviceModule {
> >> >      #[pin]
> >> >      _miscdev: MiscDeviceRegistration<RustMiscDevice>,
> >> >  }
> >> >  
> >> > -impl kernel::InPlaceModule for RustMiscDeviceModule {
> >> > -    fn init(_module: &'static ThisModule) -> impl PinInit<Self, Error> {
> >> > +#[cfg(CONFIG_SAMPLE_RUST_MISC_DEVICE_WITH_PARENT)]
> >> > +struct RustMiscDeviceModule {
> >> > +    _faux: faux::Registration,
> >> > +    _miscdev: Pin<KBox<MiscDeviceRegistration<RustMiscDevice>>>,
> >> > +}
> >> > +
> >> > +impl RustMiscDeviceModule {
> >> > +    fn init() -> MiscDeviceOptions {
> >> >          pr_info!("Initializing Rust Misc Device Sample\n");
> >> >  
> >> > -        let options = MiscDeviceOptions {
> >> > +        MiscDeviceOptions {
> >> >              name: c_str!("rust-misc-device"),
> >> > -        };
> >> > +        }
> >> > +    }
> >> > +}
> >> > +
> >> > +#[cfg(not(CONFIG_SAMPLE_RUST_MISC_DEVICE_WITH_PARENT))]
> >> > +impl kernel::InPlaceModule for RustMiscDeviceModule {
> >> > +    fn init(_module: &'static ThisModule) -> impl PinInit<Self, Error> {
> >> > +        let options = Self::init();
> >> >  
> >> >          try_pin_init!(Self {
> >> >              _miscdev <- MiscDeviceRegistration::register(
> >> > @@ -205,6 +222,31 @@ fn init(_module: &'static ThisModule) -> impl PinInit<Self, Error> {
> >> >      }
> >> >  }
> >> >  
> >> > +#[cfg(CONFIG_SAMPLE_RUST_MISC_DEVICE_WITH_PARENT)]
> >> > +impl kernel::Module for RustMiscDeviceModule {
> >> > +    fn init(_module: &'static ThisModule) -> Result<Self> {
> >> > +        let options = Self::init();
> >> > +        let faux = faux::Registration::new(c_str!("rust-misc-device-sample"), None)?;
> >> > +
> >> > +        // For every other bus, this would be called from Driver::probe(), which would return a
> 
> Missing '`' around Driver::probe().
> 
> >> > +        // `Result<Pin<KBox<T>>>`, but faux always binds to a "dummy" driver, hence probe() is
> >> 
> >> Not clear what `T` is supposed to be, do you mean `Self`?
> >
> > From the perspective of the type implementing the corresponding Driver trait it
> > would indeed be `Self`. But I found it ambiguous to write `Self`, since I do *not*
> > mean `RustMiscDeviceModule` with `Self`.
> 
> Yeah that makes sense, I already entered into the `impl Driver` context
> :) How about we use `<T as Driver>::probe()` above and then `T` makes
> sense?

Yep, that sounds good.

> Another thing: faux devices don't have a `probe` in rust, so saying "not
> required" doesn't make much sense, right?

In Rust, faux does not have probe() indeed, but that's because it's "not
required"; I can't think of a use-case for a new driver (yet), where this isn't
just unnecessary overhead.

> >> > +        // not required.
> >> > +        let misc = KBox::pin_init(
> >> > +            MiscDeviceRegistration::register(
> >> > +                options,
> >> > +                Arc::pin_init(new_mutex!(Inner { value: 0_i32 }), GFP_KERNEL),
> >> > +                Some(faux.as_ref()),
> >> > +            ),
> >> > +            GFP_KERNEL,
> >> > +        )?;
> >> 
> >> You could also initialize this module variation in-place. (this would
> >> also require the pin-init change to reference initialized fields)
> >
> > Yes, I also thought about that. But this way is a bit closer to what things
> > would look like within a probe() callback.
> 
> Yeah then let's do that :)
> 
> ---
> Cheers,
> Benno
