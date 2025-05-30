Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC40454652;
	Fri, 30 May 2025 22:17:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748643431; cv=none; b=XFBHbYmtnJd+vWBjxE9WXIlyO16cLjIoQ86bRFsNoz5ycZlRTZCaBdAQgfx6VhLpq+0bfkMi8qip6lxM/0Ane5MwFlmy4trxfMtpoKEdPF9U1XkXd55J1Z8Ox6g4aIMTAUwOgx2+DOM0pbB7vn3ZDBh6z5lTfO7qSUEg7OUwhsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748643431; c=relaxed/simple;
	bh=R0S3+xdmBfUjI25ccuMVTJIM7RvML05//QeEJ0lu02Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HH1cYkjlwl0kuiSuNGg8jwTj/Iy3KeK2WJaDVRz5arM9rEiSLdsSQ9WrEW0oMclCaYKgWTZUaLDGpdqTXKrR9Ak9AJmKwp4itDlvjK1/V7LSPYkFZ5mXFRU14kxFG/mthWL3D4NHjCH4VmCeQqJ2X5CzcHWxv6l++6JggRuNYvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TVc6Z6u/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TVc6Z6u/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39E9FC4CEE9;
	Fri, 30 May 2025 22:17:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748643431;
	bh=R0S3+xdmBfUjI25ccuMVTJIM7RvML05//QeEJ0lu02Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TVc6Z6u/oyU/wXCK8GTwG7p90prG3hvTSegYoqLKSxPJjMhhI9kYzVcr/IXo+uOJj
	 bowAXbByngsghBF5nL6ZuNpYakwVhNSUPTx88exTV3MpVqFp5qIVdH69+SDfTh6Uni
	 lxIM8AwwUIar6kzvXmp68vhTNakGd28zFbTCY2GRIiwFWaQn0u1XBqbJFYKs2KPFl1
	 CeaFgbbZa0UPSryni7pDftxzrX8xY8hMJR5Ul/JS81Bqr9ud41rT7gk9mnFgTPA3Sy
	 FCnCgywOaRrzIp/TqMzL8h57CtSr/CFM5l00AnCkucZ4OpmIcQwxIBX2CHLpkC81fe
	 yM4ygnpIFuQ2Q==
Date: Sat, 31 May 2025 00:17:05 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Benno Lossin <lossin@kernel.org>
Cc: gregkh@linuxfoundation.org, rafael@kernel.org, ojeda@kernel.org,
	alex.gaynor@gmail.com, boqun.feng@gmail.com, gary@garyguo.net,
	bjorn3_gh@protonmail.com, benno.lossin@proton.me,
	a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu,
	chrisi.schrefl@gmail.com, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/7] rust: miscdevice: properly support device drivers
Message-ID: <aDouYRU-xSjfgMzJ@pollux>
References: <20250530142447.166524-1-dakr@kernel.org>
 <20250530142447.166524-6-dakr@kernel.org>
 <DA9RLBPS7QKE.3CGXHMYG1CDOU@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DA9RLBPS7QKE.3CGXHMYG1CDOU@kernel.org>

On Fri, May 30, 2025 at 10:06:55PM +0200, Benno Lossin wrote:
> On Fri May 30, 2025 at 4:24 PM CEST, Danilo Krummrich wrote:
> > @@ -40,44 +41,43 @@ pub const fn into_raw<T: MiscDevice>(self) -> bindings::miscdevice {
> >      }
> >  }
> >  
> > -/// A registration of a miscdevice.
> > -///
> >  /// # Invariants
> >  ///
> > -/// `inner` is a registered misc device.
> > +/// - `inner` is a registered misc device,
> > +/// - `data` is valid for the entire lifetime of `Self`.
> >  #[repr(C)]
> >  #[pin_data(PinnedDrop)]
> > -pub struct MiscDeviceRegistration<T: MiscDevice> {
> > +struct RawDeviceRegistration<T: MiscDevice> {
> >      #[pin]
> >      inner: Opaque<bindings::miscdevice>,
> > -    #[pin]
> > -    data: Opaque<T::RegistrationData>,
> > +    data: NonNull<T::RegistrationData>,
> >      _t: PhantomData<T>,
> 
> You shouldn't need the `PhantomData` here.
> 
> Also, do we need to ask for `T: MiscDevice` here? Could we instead have
> just `T` and then below you write
> `RawDeviceRegistration<T::RegistrationData>` instead? (`new` of course
> needs to have a new generic: `U: MiscDevice<RegistrationData = T>`)

Sure, is there any advantage? Your proposal seems more complicated at a first
glance.

> >  }
> >  
> > -// SAFETY:
> > -// - It is allowed to call `misc_deregister` on a different thread from where you called
> > -//   `misc_register`.
> > -// - Only implements `Send` if `MiscDevice::RegistrationData` is also `Send`.
> > -unsafe impl<T: MiscDevice> Send for MiscDeviceRegistration<T> where T::RegistrationData: Send {}
> > -
> > -// SAFETY:
> > -// - All `&self` methods on this type are written to ensure that it is safe to call them in
> > -//   parallel.
> > -// - `MiscDevice::RegistrationData` is always `Sync`.
> > -unsafe impl<T: MiscDevice> Sync for MiscDeviceRegistration<T> {}
> > -
> > -impl<T: MiscDevice> MiscDeviceRegistration<T> {
> > -    /// Register a misc device.
> > -    pub fn register(
> > +impl<T: MiscDevice> RawDeviceRegistration<T> {
> > +    fn new<'a>(
> >          opts: MiscDeviceOptions,
> > -        data: impl PinInit<T::RegistrationData, Error>,
> > -    ) -> impl PinInit<Self, Error> {
> > +        parent: Option<&'a Device<Bound>>,
> > +        data: &'a T::RegistrationData,
> > +    ) -> impl PinInit<Self, Error> + 'a
> > +    where
> > +        T: 'a,
> > +    {
> >          try_pin_init!(Self {
> > -            data <- Opaque::pin_init(data),
> > +            // INVARIANT: `Self` is always embedded in a `MiscDeviceRegistration<T>`, hence `data`
> > +            // is guaranteed to be valid for the entire lifetime of `Self`.
> > +            data: NonNull::from(data),
> 
> Both the argument in the INVARIANT comment and way this works are a bit
> flawed.

Why is the argument flawed? Let's say we go with your proposal below, what would
the safety requirement for RawDeviceRegistration::new and the invariant of
RawDeviceRegistration look like? Wouldn't it be the exact same argument?

> Instead, I'd recommend directly taking the `NonNull` as a
> parameter. Yes the function will need to be `unsafe`, but the lifetime
> that you're creating below only lives for `'a`, but the object might
> live much longer. You might still be fine, but I'd just recommend
> staying in raw pointer land (or in this case `NonNull`).
> 
> >              inner <- Opaque::try_ffi_init(move |slot: *mut bindings::miscdevice| {
> > +                let mut value = opts.into_raw::<T>();
> > +
> > +                if let Some(parent) = parent {
> > +                    // The device core code will take care to take a reference of `parent` in
> 
> Just a question: with "take a reference of" you mean that it will
> increment the refcount?

Exactly -- will change it to "increment the refcount" for clarity.

> 
> > +                    // `device_add()` called by `misc_register()`.
> > +                    value.parent = parent.as_raw();
> > +                }
> > +
> >                  // SAFETY: The initializer can write to the provided `slot`.
> > -                unsafe { slot.write(opts.into_raw::<T>()) };
> > +                unsafe { slot.write(value) };
> >  
> >                  // SAFETY:
> >                  // * We just wrote the misc device options to the slot. The miscdevice will
> > @@ -94,12 +94,12 @@ pub fn register(
> >      }
> >  
> >      /// Returns a raw pointer to the misc device.
> > -    pub fn as_raw(&self) -> *mut bindings::miscdevice {
> > +    fn as_raw(&self) -> *mut bindings::miscdevice {
> >          self.inner.get()
> >      }
> >  
> >      /// Access the `this_device` field.
> > -    pub fn device(&self) -> &Device {
> > +    fn device(&self) -> &Device {
> >          // SAFETY: This can only be called after a successful register(), which always
> >          // initialises `this_device` with a valid device. Furthermore, the signature of this
> >          // function tells the borrow-checker that the `&Device` reference must not outlive the
> > @@ -108,6 +108,108 @@ pub fn device(&self) -> &Device {
> >          unsafe { Device::as_ref((*self.as_raw()).this_device) }
> >      }
> >  
> > +    fn data(&self) -> &T::RegistrationData {
> > +        // SAFETY: The type invariant guarantees that `data` is valid for the entire lifetime of
> > +        // `Self`.
> > +        unsafe { self.data.as_ref() }
> > +    }
> > +}
> > +
> > +#[pinned_drop]
> > +impl<T: MiscDevice> PinnedDrop for RawDeviceRegistration<T> {
> > +    fn drop(self: Pin<&mut Self>) {
> > +        // SAFETY: We know that the device is registered by the type invariants.
> > +        unsafe { bindings::misc_deregister(self.inner.get()) };
> > +    }
> > +}
> > +
> > +#[expect(dead_code)]
> > +enum DeviceRegistrationInner<T: MiscDevice> {
> > +    Raw(Pin<KBox<RawDeviceRegistration<T>>>),
> > +    Managed(Devres<RawDeviceRegistration<T>>),
> 
> These two names could be shortened (`DeviceRegistrationInner` and
> `RawDeviceRegistration`) as they are only implementation details of this
> file. How about `InnerRegistration` and `RawRegistration`? Or maybe
> something even shorter.

There's a reason why I keep them something with "DeviceRegistration" everywhere,
which is to make it clear that it's both a device instance *and* a registration,
which is actually rather uncommon and caused by the fact that device creation
and registration needs to be done under the misc_mtx in misc_register().

This is also the reason for those data structures to be a bit complicated; it
would be much simpler if device creation and registration would be independent
things.

> > +}
> > +
> > +/// A registration of a miscdevice.
> > +#[pin_data(PinnedDrop)]
> > +pub struct MiscDeviceRegistration<T: MiscDevice> {
> > +    inner: DeviceRegistrationInner<T>,
> > +    #[pin]
> > +    data: Opaque<T::RegistrationData>,
> 
> Why is it necessary to store `data` inside of `Opaque`?

It was UnsafePinned before, but Alice proposed to go with Opaque for the
meantime. Anyways, this is not introduced by this patch, it comes from
Christians patch adding T::RegistrationData.

> 
> > +    this_device: ARef<Device>,
> > +    _t: PhantomData<T>,
> > +}
> > +
> > +// SAFETY:
> > +// - It is allowed to call `misc_deregister` on a different thread from where you called
> > +//   `misc_register`.
> > +// - Only implements `Send` if `MiscDevice::RegistrationData` is also `Send`.
> > +unsafe impl<T: MiscDevice> Send for MiscDeviceRegistration<T> where T::RegistrationData: Send {}
> > +
> > +// SAFETY:
> > +// - All `&self` methods on this type are written to ensure that it is safe to call them in
> > +//   parallel.
> > +// - `MiscDevice::RegistrationData` is always `Sync`.
> > +unsafe impl<T: MiscDevice> Sync for MiscDeviceRegistration<T> {}
> > +
> > +impl<T: MiscDevice> MiscDeviceRegistration<T> {
> > +    /// Register a misc device.
> > +    pub fn register<'a>(
> > +        opts: MiscDeviceOptions,
> > +        data: impl PinInit<T::RegistrationData, Error> + 'a,
> > +        parent: Option<&'a Device<Bound>>,
> > +    ) -> impl PinInit<Self, Error> + 'a
> > +    where
> > +        T: 'a,
> > +    {
> > +        let mut dev: Option<ARef<Device>> = None;
> > +
> > +        try_pin_init!(&this in Self {
> > +            data <- Opaque::pin_init(data),
> > +            // TODO: make `inner` in-place when enums get supported by pin-init.
> > +            //
> > +            // Link: https://github.com/Rust-for-Linux/pin-init/issues/59
> 
> You might want to add that this would avoid the extra allocation in
> `DeviceRegistrationInner`.

Sure, will do.

> > +            inner: {
> > +                // SAFETY:
> > +                //   - `this` is a valid pointer to `Self`,
> > +                //   - `data` was properly initialized above.
> > +                let data = unsafe { &*(*this.as_ptr()).data.get() };
> 
> As mentioned above, this creates a reference that is valid for this
> *block*. So its lifetime will end after the `},` and before
> `this_device` is initialized.
> 
> It *might* be ok to turn it back into a raw pointer in
> `RawDeviceRegistration::new`, but I wouldn't bet on it.

Why? The reference is still valid in RawDeviceRegistration::new, no?

> > +
> > +                let raw = RawDeviceRegistration::new(opts, parent, data);
> > +
> > +                // FIXME: Work around a bug in rustc, to prevent the following warning:
> > +                //
> > +                //   "warning: value captured by `dev` is never read."
> > +                //
> > +                // Link: https://github.com/rust-lang/rust/issues/141615
> 
> Note that the bug is that the compiler complains about the wrong span.
> The original value of `dev` is `None` and that value is never used, so
> the warning is justified. So this `let _ = dev;` still needs to stay
> until `pin-init` supports accessing previously initialized fields (now
> I'm pretty certain that I will implement that soon).

Do you want to propose an alternative comment about this?

> > +                let _ = dev;
> > +
> > +                if let Some(parent) = parent {
> > +                    let devres = Devres::new(parent, raw, GFP_KERNEL)?;
> > +
> > +                    dev = Some(devres.access(parent)?.device().into());
> > +                    DeviceRegistrationInner::Managed(devres)
> > +                } else {
> > +                    let boxed = KBox::pin_init(raw, GFP_KERNEL)?;
> > +
> > +                    dev = Some(boxed.device().into());
> > +                    DeviceRegistrationInner::Raw(boxed)
> > +                }
> > +            },
> > +            // Cache `this_device` within `Self` to avoid having to access `Devres` in the managed
> > +            // case.
> > +            this_device: {
> > +                // SAFETY: `dev` is guaranteed to be set in the initializer of `inner` above.
> > +                unsafe { dev.unwrap_unchecked() }
> > +            },
> 
> No need for the extra block, just do:
> 
>     // Cache `this_device` within `Self` to avoid having to access `Devres` in the managed
>     // case.
>     // SAFETY: `dev` is guaranteed to be set in the initializer of `inner` above.
>     this_device: unsafe { dev.unwrap_unchecked() },

Yes, I know, but I found the above a bit cleaner -- I don't mind changing it
though.

> I'm also pretty sure that the compiler would optimize `.take().unwrap()`
> and also this is only executed once per `MiscDeviceRegistration`, so
> even if it isn't it wouldn't really matter. So I'd prefer if we don't
> use `unsafe` here even if it is painfully obvious (if I'm fast enough
> with implementing, you can rebase on top before you merge and then this
> will be gone anyways :)

Sounds good! :)

But I think that unsafe is better than unwrap() in such cases; unsafe requires
us to explain why it's OK to do it, which makes it less likely to create bugs.

(Just recently I wrote some code, hit the need for unsafe and, while writing up
the safety comment, I had to explain to myself, why the way I was about to
implement this was pretty broken.)

unwrap() on the other hand, doesn't require any explanation, but panics the
kernel in the worst case.

> > +            _t: PhantomData,
> > +        })
> > +    }
> > +
> > +    /// Access the `this_device` field.
> > +    pub fn device(&self) -> &Device {
> > +        &self.this_device
> > +    }
> > +
> >      /// Access the additional data stored in this registration.
> >      pub fn data(&self) -> &T::RegistrationData {
> >          // SAFETY:
> > @@ -120,9 +222,6 @@ pub fn data(&self) -> &T::RegistrationData {
> >  #[pinned_drop]
> >  impl<T: MiscDevice> PinnedDrop for MiscDeviceRegistration<T> {
> >      fn drop(self: Pin<&mut Self>) {
> > -        // SAFETY: We know that the device is registered by the type invariants.
> > -        unsafe { bindings::misc_deregister(self.inner.get()) };
> > -
> >          // SAFETY: `self.data` is valid for dropping.
> >          unsafe { core::ptr::drop_in_place(self.data.get()) };
> >      }
> > @@ -137,14 +236,13 @@ pub trait MiscDevice: Sized {
> >      /// The additional data carried by the [`MiscDeviceRegistration`] for this [`MiscDevice`].
> >      /// If no additional data is required than the unit type `()` should be used.
> >      ///
> > -    /// This data can be accessed in [`MiscDevice::open()`] using
> > -    /// [`MiscDeviceRegistration::data()`].
> > +    /// This data can be accessed in [`MiscDevice::open()`].
> >      type RegistrationData: Sync;
> >  
> >      /// Called when the misc device is opened.
> >      ///
> >      /// The returned pointer will be stored as the private data for the file.
> > -    fn open(_file: &File, _misc: &MiscDeviceRegistration<Self>) -> Result<Self::Ptr>;
> > +    fn open(_file: &File, _misc: &Device, _data: &Self::RegistrationData) -> Result<Self::Ptr>;
> 
> What is the reason that these parameters begin with `_`? In a trait
> function without a body, the compiler shouldn't war about unused
> parameters.

No idea, I just tried to be complient with the existing style of the file. :)
