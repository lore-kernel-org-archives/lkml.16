Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08852283126;
	Fri, 30 May 2025 20:06:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748635620; cv=none; b=JcFmdcHZW7OGxuzv5h1oE47FqJaYL1aINV5eInNTJxaqKxQzwtERA+ufwsLoYxvIluQNNoPrr7itbbvH5q5BmU13IUeiXARI+nQ3k4mwKKt/aFX1A8UKsLmrunSPZk0xG75L3sCwrStPzJN+DGurFIijnPCBHbFMvyuZDAQsTUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748635620; c=relaxed/simple;
	bh=xPW6dKl0u9tOAE44RcC/AR/Qp+vY0ym5kEbMu2VOHzE=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=k5EcKpYMc0rqq3Aa7GkVfuzs/1ZAVkk3zdja7m+stfhdL3rD6v+0Xxn7Bs5++L4+7hRhxaLRk5lE3/geqaAI+XFJa20dg6oOqbIO2jroTGHcAia1J+cZuZ231kXn74WQbaAeqLLHG2jdr70LLbq41UyUiGkgUWP1g6rqbKLP0IY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ugHd6+10; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ugHd6+10"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A49BC4CEEA;
	Fri, 30 May 2025 20:06:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748635619;
	bh=xPW6dKl0u9tOAE44RcC/AR/Qp+vY0ym5kEbMu2VOHzE=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=ugHd6+10EomDNuWrm+EfdbeqQNhmlA0jDx+9YtjiyLZQzE2CG4DfOdHPScUfCLlVD
	 QgtFkF8YcsNMVMfJSDYVsRW75oeZj3zJxT6CWGeYCuUUepk167o3F/0/5RniVGvUGr
	 aqglsa/Nl2a38z5xK+Cm18rGXSPQVVaRy0Ow8x43N+NJSpzEzAC6IgasL54J9XvuZz
	 70QD+o/DAZ33rMMHEuRubDDJ0VZUq5uWV93UsJr9JSo4H1cG3t7SVQIed1wuJPEWOc
	 FrzkmY71PbMueXEcAuwgSpV3jh2EpzZZzWx7zqBePnxHjXZx8FP9ZXkFK2xPzbOYuZ
	 9DJoIQ29vd1jg==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 30 May 2025 22:06:55 +0200
Message-Id: <DA9RLBPS7QKE.3CGXHMYG1CDOU@kernel.org>
Subject: Re: [PATCH 5/7] rust: miscdevice: properly support device drivers
From: "Benno Lossin" <lossin@kernel.org>
To: "Danilo Krummrich" <dakr@kernel.org>, <gregkh@linuxfoundation.org>,
 <rafael@kernel.org>, <ojeda@kernel.org>, <alex.gaynor@gmail.com>,
 <boqun.feng@gmail.com>, <gary@garyguo.net>, <bjorn3_gh@protonmail.com>,
 <benno.lossin@proton.me>, <a.hindborg@kernel.org>, <aliceryhl@google.com>,
 <tmgross@umich.edu>, <chrisi.schrefl@gmail.com>
Cc: <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.20.1
References: <20250530142447.166524-1-dakr@kernel.org>
 <20250530142447.166524-6-dakr@kernel.org>
In-Reply-To: <20250530142447.166524-6-dakr@kernel.org>

On Fri May 30, 2025 at 4:24 PM CEST, Danilo Krummrich wrote:
> @@ -40,44 +41,43 @@ pub const fn into_raw<T: MiscDevice>(self) -> binding=
s::miscdevice {
>      }
>  }
> =20
> -/// A registration of a miscdevice.
> -///
>  /// # Invariants
>  ///
> -/// `inner` is a registered misc device.
> +/// - `inner` is a registered misc device,
> +/// - `data` is valid for the entire lifetime of `Self`.
>  #[repr(C)]
>  #[pin_data(PinnedDrop)]
> -pub struct MiscDeviceRegistration<T: MiscDevice> {
> +struct RawDeviceRegistration<T: MiscDevice> {
>      #[pin]
>      inner: Opaque<bindings::miscdevice>,
> -    #[pin]
> -    data: Opaque<T::RegistrationData>,
> +    data: NonNull<T::RegistrationData>,
>      _t: PhantomData<T>,

You shouldn't need the `PhantomData` here.

Also, do we need to ask for `T: MiscDevice` here? Could we instead have
just `T` and then below you write
`RawDeviceRegistration<T::RegistrationData>` instead? (`new` of course
needs to have a new generic: `U: MiscDevice<RegistrationData =3D T>`)

>  }
> =20
> -// SAFETY:
> -// - It is allowed to call `misc_deregister` on a different thread from =
where you called
> -//   `misc_register`.
> -// - Only implements `Send` if `MiscDevice::RegistrationData` is also `S=
end`.
> -unsafe impl<T: MiscDevice> Send for MiscDeviceRegistration<T> where T::R=
egistrationData: Send {}
> -
> -// SAFETY:
> -// - All `&self` methods on this type are written to ensure that it is s=
afe to call them in
> -//   parallel.
> -// - `MiscDevice::RegistrationData` is always `Sync`.
> -unsafe impl<T: MiscDevice> Sync for MiscDeviceRegistration<T> {}
> -
> -impl<T: MiscDevice> MiscDeviceRegistration<T> {
> -    /// Register a misc device.
> -    pub fn register(
> +impl<T: MiscDevice> RawDeviceRegistration<T> {
> +    fn new<'a>(
>          opts: MiscDeviceOptions,
> -        data: impl PinInit<T::RegistrationData, Error>,
> -    ) -> impl PinInit<Self, Error> {
> +        parent: Option<&'a Device<Bound>>,
> +        data: &'a T::RegistrationData,
> +    ) -> impl PinInit<Self, Error> + 'a
> +    where
> +        T: 'a,
> +    {
>          try_pin_init!(Self {
> -            data <- Opaque::pin_init(data),
> +            // INVARIANT: `Self` is always embedded in a `MiscDeviceRegi=
stration<T>`, hence `data`
> +            // is guaranteed to be valid for the entire lifetime of `Sel=
f`.
> +            data: NonNull::from(data),

Both the argument in the INVARIANT comment and way this works are a bit
flawed. Instead, I'd recommend directly taking the `NonNull` as a
parameter. Yes the function will need to be `unsafe`, but the lifetime
that you're creating below only lives for `'a`, but the object might
live much longer. You might still be fine, but I'd just recommend
staying in raw pointer land (or in this case `NonNull`).

>              inner <- Opaque::try_ffi_init(move |slot: *mut bindings::mis=
cdevice| {
> +                let mut value =3D opts.into_raw::<T>();
> +
> +                if let Some(parent) =3D parent {
> +                    // The device core code will take care to take a ref=
erence of `parent` in

Just a question: with "take a reference of" you mean that it will
increment the refcount?

> +                    // `device_add()` called by `misc_register()`.
> +                    value.parent =3D parent.as_raw();
> +                }
> +
>                  // SAFETY: The initializer can write to the provided `sl=
ot`.
> -                unsafe { slot.write(opts.into_raw::<T>()) };
> +                unsafe { slot.write(value) };
> =20
>                  // SAFETY:
>                  // * We just wrote the misc device options to the slot. =
The miscdevice will
> @@ -94,12 +94,12 @@ pub fn register(
>      }
> =20
>      /// Returns a raw pointer to the misc device.
> -    pub fn as_raw(&self) -> *mut bindings::miscdevice {
> +    fn as_raw(&self) -> *mut bindings::miscdevice {
>          self.inner.get()
>      }
> =20
>      /// Access the `this_device` field.
> -    pub fn device(&self) -> &Device {
> +    fn device(&self) -> &Device {
>          // SAFETY: This can only be called after a successful register()=
, which always
>          // initialises `this_device` with a valid device. Furthermore, t=
he signature of this
>          // function tells the borrow-checker that the `&Device` referenc=
e must not outlive the
> @@ -108,6 +108,108 @@ pub fn device(&self) -> &Device {
>          unsafe { Device::as_ref((*self.as_raw()).this_device) }
>      }
> =20
> +    fn data(&self) -> &T::RegistrationData {
> +        // SAFETY: The type invariant guarantees that `data` is valid fo=
r the entire lifetime of
> +        // `Self`.
> +        unsafe { self.data.as_ref() }
> +    }
> +}
> +
> +#[pinned_drop]
> +impl<T: MiscDevice> PinnedDrop for RawDeviceRegistration<T> {
> +    fn drop(self: Pin<&mut Self>) {
> +        // SAFETY: We know that the device is registered by the type inv=
ariants.
> +        unsafe { bindings::misc_deregister(self.inner.get()) };
> +    }
> +}
> +
> +#[expect(dead_code)]
> +enum DeviceRegistrationInner<T: MiscDevice> {
> +    Raw(Pin<KBox<RawDeviceRegistration<T>>>),
> +    Managed(Devres<RawDeviceRegistration<T>>),

These two names could be shortened (`DeviceRegistrationInner` and
`RawDeviceRegistration`) as they are only implementation details of this
file. How about `InnerRegistration` and `RawRegistration`? Or maybe
something even shorter.

> +}
> +
> +/// A registration of a miscdevice.
> +#[pin_data(PinnedDrop)]
> +pub struct MiscDeviceRegistration<T: MiscDevice> {
> +    inner: DeviceRegistrationInner<T>,
> +    #[pin]
> +    data: Opaque<T::RegistrationData>,

Why is it necessary to store `data` inside of `Opaque`?

> +    this_device: ARef<Device>,
> +    _t: PhantomData<T>,
> +}
> +
> +// SAFETY:
> +// - It is allowed to call `misc_deregister` on a different thread from =
where you called
> +//   `misc_register`.
> +// - Only implements `Send` if `MiscDevice::RegistrationData` is also `S=
end`.
> +unsafe impl<T: MiscDevice> Send for MiscDeviceRegistration<T> where T::R=
egistrationData: Send {}
> +
> +// SAFETY:
> +// - All `&self` methods on this type are written to ensure that it is s=
afe to call them in
> +//   parallel.
> +// - `MiscDevice::RegistrationData` is always `Sync`.
> +unsafe impl<T: MiscDevice> Sync for MiscDeviceRegistration<T> {}
> +
> +impl<T: MiscDevice> MiscDeviceRegistration<T> {
> +    /// Register a misc device.
> +    pub fn register<'a>(
> +        opts: MiscDeviceOptions,
> +        data: impl PinInit<T::RegistrationData, Error> + 'a,
> +        parent: Option<&'a Device<Bound>>,
> +    ) -> impl PinInit<Self, Error> + 'a
> +    where
> +        T: 'a,
> +    {
> +        let mut dev: Option<ARef<Device>> =3D None;
> +
> +        try_pin_init!(&this in Self {
> +            data <- Opaque::pin_init(data),
> +            // TODO: make `inner` in-place when enums get supported by p=
in-init.
> +            //
> +            // Link: https://github.com/Rust-for-Linux/pin-init/issues/5=
9

You might want to add that this would avoid the extra allocation in
`DeviceRegistrationInner`.

> +            inner: {
> +                // SAFETY:
> +                //   - `this` is a valid pointer to `Self`,
> +                //   - `data` was properly initialized above.
> +                let data =3D unsafe { &*(*this.as_ptr()).data.get() };

As mentioned above, this creates a reference that is valid for this
*block*. So its lifetime will end after the `},` and before
`this_device` is initialized.

It *might* be ok to turn it back into a raw pointer in
`RawDeviceRegistration::new`, but I wouldn't bet on it.

> +
> +                let raw =3D RawDeviceRegistration::new(opts, parent, dat=
a);
> +
> +                // FIXME: Work around a bug in rustc, to prevent the fol=
lowing warning:
> +                //
> +                //   "warning: value captured by `dev` is never read."
> +                //
> +                // Link: https://github.com/rust-lang/rust/issues/141615

Note that the bug is that the compiler complains about the wrong span.
The original value of `dev` is `None` and that value is never used, so
the warning is justified. So this `let _ =3D dev;` still needs to stay
until `pin-init` supports accessing previously initialized fields (now
I'm pretty certain that I will implement that soon).

> +                let _ =3D dev;
> +
> +                if let Some(parent) =3D parent {
> +                    let devres =3D Devres::new(parent, raw, GFP_KERNEL)?=
;
> +
> +                    dev =3D Some(devres.access(parent)?.device().into())=
;
> +                    DeviceRegistrationInner::Managed(devres)
> +                } else {
> +                    let boxed =3D KBox::pin_init(raw, GFP_KERNEL)?;
> +
> +                    dev =3D Some(boxed.device().into());
> +                    DeviceRegistrationInner::Raw(boxed)
> +                }
> +            },
> +            // Cache `this_device` within `Self` to avoid having to acce=
ss `Devres` in the managed
> +            // case.
> +            this_device: {
> +                // SAFETY: `dev` is guaranteed to be set in the initiali=
zer of `inner` above.
> +                unsafe { dev.unwrap_unchecked() }
> +            },

No need for the extra block, just do:

    // Cache `this_device` within `Self` to avoid having to access `Devres`=
 in the managed
    // case.
    // SAFETY: `dev` is guaranteed to be set in the initializer of `inner` =
above.
    this_device: unsafe { dev.unwrap_unchecked() },

I'm also pretty sure that the compiler would optimize `.take().unwrap()`
and also this is only executed once per `MiscDeviceRegistration`, so
even if it isn't it wouldn't really matter. So I'd prefer if we don't
use `unsafe` here even if it is painfully obvious (if I'm fast enough
with implementing, you can rebase on top before you merge and then this
will be gone anyways :)

> +            _t: PhantomData,
> +        })
> +    }
> +
> +    /// Access the `this_device` field.
> +    pub fn device(&self) -> &Device {
> +        &self.this_device
> +    }
> +
>      /// Access the additional data stored in this registration.
>      pub fn data(&self) -> &T::RegistrationData {
>          // SAFETY:
> @@ -120,9 +222,6 @@ pub fn data(&self) -> &T::RegistrationData {
>  #[pinned_drop]
>  impl<T: MiscDevice> PinnedDrop for MiscDeviceRegistration<T> {
>      fn drop(self: Pin<&mut Self>) {
> -        // SAFETY: We know that the device is registered by the type inv=
ariants.
> -        unsafe { bindings::misc_deregister(self.inner.get()) };
> -
>          // SAFETY: `self.data` is valid for dropping.
>          unsafe { core::ptr::drop_in_place(self.data.get()) };
>      }
> @@ -137,14 +236,13 @@ pub trait MiscDevice: Sized {
>      /// The additional data carried by the [`MiscDeviceRegistration`] fo=
r this [`MiscDevice`].
>      /// If no additional data is required than the unit type `()` should=
 be used.
>      ///
> -    /// This data can be accessed in [`MiscDevice::open()`] using
> -    /// [`MiscDeviceRegistration::data()`].
> +    /// This data can be accessed in [`MiscDevice::open()`].
>      type RegistrationData: Sync;
> =20
>      /// Called when the misc device is opened.
>      ///
>      /// The returned pointer will be stored as the private data for the =
file.
> -    fn open(_file: &File, _misc: &MiscDeviceRegistration<Self>) -> Resul=
t<Self::Ptr>;
> +    fn open(_file: &File, _misc: &Device, _data: &Self::RegistrationData=
) -> Result<Self::Ptr>;

What is the reason that these parameters begin with `_`? In a trait
function without a body, the compiler shouldn't war about unused
parameters.

---
Cheers,
Benno

> =20
>      /// Called when the misc device is released.
>      fn release(device: Self::Ptr, _file: &File) {
