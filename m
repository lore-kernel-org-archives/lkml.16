Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64D891E521;
	Sat, 31 May 2025 08:05:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748678733; cv=none; b=cpneVBDHvehFcR5sgDnBjc9q0WGSDIuk5c1If9iSoyS9udaa6Vj4hEnCYFOjt4aPy8r7kBQ6dXS6t9KHtRWBKBqEQdYOxUz+1u7bwld6tUA7Mp8ztQsioos+fkVQXBTktNIDoiCRhaOOQkkw24HslrBRSFrefpVC4K/fsry2efA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748678733; c=relaxed/simple;
	bh=F5r43w35NHKTlsrYLQ9a3zkaYnsz4VCUfbpL1mD1jqk=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=Umhtzxvs4SrjD02XBSkdSJD5A/5tea/f+aSHyHkMCLLM6uSpskqDrNnJh1A2FwKdD0YXkPvp5vPOGsf1564bMQtkrpxUjHfZzxBA7SexlI1krTLQllzN/aM1A9LIyf0/Fb1Hpg7hovE0dpWwrTHF/k0gQrLyt0TLQ/YiUhHDZv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jWpJcNER; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jWpJcNER"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 550FBC4CEE3;
	Sat, 31 May 2025 08:05:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748678733;
	bh=F5r43w35NHKTlsrYLQ9a3zkaYnsz4VCUfbpL1mD1jqk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jWpJcNEROKLWBSr/EfNTY7zodcFW+1saU83FFPZR7/ZSTVkbWutNcdRfC5O3FDY/+
	 QqnV3JyXEMKuQwjN2byxzMvyviQtRWAI4IGa7UQsGAxVUD0oGZSYSh1uMLfIAY+laq
	 s80GNoothsPukagokK+lOBCBFm1J+L3tCEwyREIwLrtWF2Y+ntSnAjgJdMWYpACWkX
	 WlDBxithuREh7De/6XoJUiOpJUeKMR8if2huQ4I8BK0PCcEL3GaFHyncRzluaCE5Jj
	 B8BYWMAdTLlmt9abfZCTcXb2yMtCtAXDrka1yRM1t6asYjIufRhiUiohRdXsCyMsGc
	 MzsV3BPNYLclQ==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 31 May 2025 10:05:28 +0200
Message-Id: <DAA6VHUTDC13.3FLLGNXYINO9I@kernel.org>
From: "Benno Lossin" <lossin@kernel.org>
To: "Danilo Krummrich" <dakr@kernel.org>
Cc: <gregkh@linuxfoundation.org>, <rafael@kernel.org>, <ojeda@kernel.org>,
 <alex.gaynor@gmail.com>, <boqun.feng@gmail.com>, <gary@garyguo.net>,
 <bjorn3_gh@protonmail.com>, <benno.lossin@proton.me>,
 <a.hindborg@kernel.org>, <aliceryhl@google.com>, <tmgross@umich.edu>,
 <chrisi.schrefl@gmail.com>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 5/7] rust: miscdevice: properly support device drivers
X-Mailer: aerc 0.20.1
References: <20250530142447.166524-1-dakr@kernel.org>
 <20250530142447.166524-6-dakr@kernel.org>
 <DA9RLBPS7QKE.3CGXHMYG1CDOU@kernel.org> <aDouYRU-xSjfgMzJ@pollux>
In-Reply-To: <aDouYRU-xSjfgMzJ@pollux>

On Sat May 31, 2025 at 12:17 AM CEST, Danilo Krummrich wrote:
> On Fri, May 30, 2025 at 10:06:55PM +0200, Benno Lossin wrote:
>> On Fri May 30, 2025 at 4:24 PM CEST, Danilo Krummrich wrote:
>> > @@ -40,44 +41,43 @@ pub const fn into_raw<T: MiscDevice>(self) -> bind=
ings::miscdevice {
>> >      }
>> >  }
>> > =20
>> > -/// A registration of a miscdevice.
>> > -///
>> >  /// # Invariants
>> >  ///
>> > -/// `inner` is a registered misc device.
>> > +/// - `inner` is a registered misc device,
>> > +/// - `data` is valid for the entire lifetime of `Self`.
>> >  #[repr(C)]
>> >  #[pin_data(PinnedDrop)]
>> > -pub struct MiscDeviceRegistration<T: MiscDevice> {
>> > +struct RawDeviceRegistration<T: MiscDevice> {
>> >      #[pin]
>> >      inner: Opaque<bindings::miscdevice>,
>> > -    #[pin]
>> > -    data: Opaque<T::RegistrationData>,
>> > +    data: NonNull<T::RegistrationData>,
>> >      _t: PhantomData<T>,
>>=20
>> You shouldn't need the `PhantomData` here.
>>=20
>> Also, do we need to ask for `T: MiscDevice` here? Could we instead have
>> just `T` and then below you write
>> `RawDeviceRegistration<T::RegistrationData>` instead? (`new` of course
>> needs to have a new generic: `U: MiscDevice<RegistrationData =3D T>`)
>
> Sure, is there any advantage? Your proposal seems more complicated at a f=
irst
> glance.

It would make `RawDeviceRegistration` simpler, but maybe it's not worth
it.

>> >  }
>> > =20
>> > -// SAFETY:
>> > -// - It is allowed to call `misc_deregister` on a different thread fr=
om where you called
>> > -//   `misc_register`.
>> > -// - Only implements `Send` if `MiscDevice::RegistrationData` is also=
 `Send`.
>> > -unsafe impl<T: MiscDevice> Send for MiscDeviceRegistration<T> where T=
::RegistrationData: Send {}
>> > -
>> > -// SAFETY:
>> > -// - All `&self` methods on this type are written to ensure that it i=
s safe to call them in
>> > -//   parallel.
>> > -// - `MiscDevice::RegistrationData` is always `Sync`.
>> > -unsafe impl<T: MiscDevice> Sync for MiscDeviceRegistration<T> {}
>> > -
>> > -impl<T: MiscDevice> MiscDeviceRegistration<T> {
>> > -    /// Register a misc device.
>> > -    pub fn register(
>> > +impl<T: MiscDevice> RawDeviceRegistration<T> {
>> > +    fn new<'a>(
>> >          opts: MiscDeviceOptions,
>> > -        data: impl PinInit<T::RegistrationData, Error>,
>> > -    ) -> impl PinInit<Self, Error> {
>> > +        parent: Option<&'a Device<Bound>>,
>> > +        data: &'a T::RegistrationData,
>> > +    ) -> impl PinInit<Self, Error> + 'a
>> > +    where
>> > +        T: 'a,
>> > +    {
>> >          try_pin_init!(Self {
>> > -            data <- Opaque::pin_init(data),
>> > +            // INVARIANT: `Self` is always embedded in a `MiscDeviceR=
egistration<T>`, hence `data`
>> > +            // is guaranteed to be valid for the entire lifetime of `=
Self`.
>> > +            data: NonNull::from(data),
>>=20
>> Both the argument in the INVARIANT comment and way this works are a bit
>> flawed.
>
> Why is the argument flawed? Let's say we go with your proposal below, wha=
t would
> the safety requirement for RawDeviceRegistration::new and the invariant o=
f
> RawDeviceRegistration look like? Wouldn't it be the exact same argument?

So what I write below it not really true. But the argument relies on the
fact that `data` is pointing to a value that will stay alive for the
duration of the existence of `self`. That should be a safety requirement
of `new` (even if we take a reference as an argument).

>> Instead, I'd recommend directly taking the `NonNull` as a
>> parameter. Yes the function will need to be `unsafe`, but the lifetime
>> that you're creating below only lives for `'a`, but the object might
>> live much longer. You might still be fine, but I'd just recommend
>> staying in raw pointer land (or in this case `NonNull`).

>> > @@ -108,6 +108,108 @@ pub fn device(&self) -> &Device {
>> >          unsafe { Device::as_ref((*self.as_raw()).this_device) }
>> >      }
>> > =20
>> > +    fn data(&self) -> &T::RegistrationData {
>> > +        // SAFETY: The type invariant guarantees that `data` is valid=
 for the entire lifetime of
>> > +        // `Self`.
>> > +        unsafe { self.data.as_ref() }
>> > +    }
>> > +}
>> > +
>> > +#[pinned_drop]
>> > +impl<T: MiscDevice> PinnedDrop for RawDeviceRegistration<T> {
>> > +    fn drop(self: Pin<&mut Self>) {
>> > +        // SAFETY: We know that the device is registered by the type =
invariants.
>> > +        unsafe { bindings::misc_deregister(self.inner.get()) };
>> > +    }
>> > +}
>> > +
>> > +#[expect(dead_code)]
>> > +enum DeviceRegistrationInner<T: MiscDevice> {
>> > +    Raw(Pin<KBox<RawDeviceRegistration<T>>>),
>> > +    Managed(Devres<RawDeviceRegistration<T>>),
>>=20
>> These two names could be shortened (`DeviceRegistrationInner` and
>> `RawDeviceRegistration`) as they are only implementation details of this
>> file. How about `InnerRegistration` and `RawRegistration`? Or maybe
>> something even shorter.
>
> There's a reason why I keep them something with "DeviceRegistration" ever=
ywhere,
> which is to make it clear that it's both a device instance *and* a regist=
ration,
> which is actually rather uncommon and caused by the fact that device crea=
tion
> and registration needs to be done under the misc_mtx in misc_register().
>
> This is also the reason for those data structures to be a bit complicated=
; it
> would be much simpler if device creation and registration would be indepe=
ndent
> things.

Then keep the longer names.

>> > +}
>> > +
>> > +/// A registration of a miscdevice.
>> > +#[pin_data(PinnedDrop)]
>> > +pub struct MiscDeviceRegistration<T: MiscDevice> {
>> > +    inner: DeviceRegistrationInner<T>,
>> > +    #[pin]
>> > +    data: Opaque<T::RegistrationData>,
>>=20
>> Why is it necessary to store `data` inside of `Opaque`?
>
> It was UnsafePinned before, but Alice proposed to go with Opaque for the
> meantime. Anyways, this is not introduced by this patch, it comes from
> Christians patch adding T::RegistrationData.

Ah then I'll re-read that discussion.

>> > +    this_device: ARef<Device>,
>> > +    _t: PhantomData<T>,
>> > +}

>> > +            inner: {
>> > +                // SAFETY:
>> > +                //   - `this` is a valid pointer to `Self`,
>> > +                //   - `data` was properly initialized above.
>> > +                let data =3D unsafe { &*(*this.as_ptr()).data.get() }=
;
>>=20
>> As mentioned above, this creates a reference that is valid for this
>> *block*. So its lifetime will end after the `},` and before
>> `this_device` is initialized.
>>=20
>> It *might* be ok to turn it back into a raw pointer in
>> `RawDeviceRegistration::new`, but I wouldn't bet on it.
>
> Why? The reference is still valid in RawDeviceRegistration::new, no?

Yes the reference is still valid in the `new` function call. I was under
the impression that the pointer created in `new` would get invalidated,
because the struct would get reborrowed in the meantime, but that's not
the case, since this pointer is obtained by `get`. So you should be
good.

>> > +
>> > +                let raw =3D RawDeviceRegistration::new(opts, parent, =
data);
>> > +
>> > +                // FIXME: Work around a bug in rustc, to prevent the =
following warning:
>> > +                //
>> > +                //   "warning: value captured by `dev` is never read.=
"
>> > +                //
>> > +                // Link: https://github.com/rust-lang/rust/issues/141=
615
>>=20
>> Note that the bug is that the compiler complains about the wrong span.
>> The original value of `dev` is `None` and that value is never used, so
>> the warning is justified. So this `let _ =3D dev;` still needs to stay
>> until `pin-init` supports accessing previously initialized fields (now
>> I'm pretty certain that I will implement that soon).
>
> Do you want to propose an alternative comment about this?

I think we don't need a comment here.

>> > +                let _ =3D dev;
>> > +
>> > +                if let Some(parent) =3D parent {
>> > +                    let devres =3D Devres::new(parent, raw, GFP_KERNE=
L)?;
>> > +
>> > +                    dev =3D Some(devres.access(parent)?.device().into=
());
>> > +                    DeviceRegistrationInner::Managed(devres)
>> > +                } else {
>> > +                    let boxed =3D KBox::pin_init(raw, GFP_KERNEL)?;
>> > +
>> > +                    dev =3D Some(boxed.device().into());
>> > +                    DeviceRegistrationInner::Raw(boxed)
>> > +                }
>> > +            },
>> > +            // Cache `this_device` within `Self` to avoid having to a=
ccess `Devres` in the managed
>> > +            // case.
>> > +            this_device: {
>> > +                // SAFETY: `dev` is guaranteed to be set in the initi=
alizer of `inner` above.
>> > +                unsafe { dev.unwrap_unchecked() }
>> > +            },
>>=20
>> No need for the extra block, just do:
>>=20
>>     // Cache `this_device` within `Self` to avoid having to access `Devr=
es` in the managed
>>     // case.
>>     // SAFETY: `dev` is guaranteed to be set in the initializer of `inne=
r` above.
>>     this_device: unsafe { dev.unwrap_unchecked() },
>
> Yes, I know, but I found the above a bit cleaner -- I don't mind changing=
 it
> though.
>
>> I'm also pretty sure that the compiler would optimize `.take().unwrap()`
>> and also this is only executed once per `MiscDeviceRegistration`, so
>> even if it isn't it wouldn't really matter. So I'd prefer if we don't
>> use `unsafe` here even if it is painfully obvious (if I'm fast enough
>> with implementing, you can rebase on top before you merge and then this
>> will be gone anyways :)
>
> Sounds good! :)
>
> But I think that unsafe is better than unwrap() in such cases; unsafe req=
uires
> us to explain why it's OK to do it, which makes it less likely to create =
bugs.

That's not exactly how I would think about it, but your argument makes
sense.

> (Just recently I wrote some code, hit the need for unsafe and, while writ=
ing up
> the safety comment, I had to explain to myself, why the way I was about t=
o
> implement this was pretty broken.)

That's great :)

> unwrap() on the other hand, doesn't require any explanation, but panics t=
he
> kernel in the worst case.

Yeah that is true. Ultimately for this case it won't matter, since I'll
just implement the access thing in pin-init.

It'll still take a while, because it will touch several parts that other
patches also touch. Thus I prefer to first pick the patches already on
the list, but for that I'll wait until the merge window closes.

---
Cheers,
Benno
