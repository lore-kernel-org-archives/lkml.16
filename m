Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7962126ACC;
	Tue,  3 Jun 2025 23:29:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748993368; cv=none; b=ly87Kt3eWltcZ/n0BvZ9TMecd2zVoxPrDjLPsk6Fi2cSZQ9PZHdI2xoHEfBr88XK3mc41LPXQnd0JQC/dyA5CTGfc+Lz22ogK4+sctN78wodylfPLaKAGE+IScEHMAYm+O4HCppfwz16oCvSVju3Mj/a4KFH+CEqqSKDbj5aPig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748993368; c=relaxed/simple;
	bh=joQU7BzzSRjYRkmZr0bkPGU0ONqqQj3fU4hsmy8jteE=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=Xe39VHBLuKjRAUE2FX1fGXDjntBDx29I9SfAEMBVTe7gUBWnFamjhQK43+Q+DLccpfm39NmdwuHWLXtVTJZ74zVF2Sbu73MpYdazjVtk3Fyjl9pIoL9yshfJ6tdAq4aMfqhBurOEaGrjaj9hcbS4IyysLz3vChMZJwWCbXz/FfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZxsjM9Am; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZxsjM9Am"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6A79C4CEED;
	Tue,  3 Jun 2025 23:29:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748993368;
	bh=joQU7BzzSRjYRkmZr0bkPGU0ONqqQj3fU4hsmy8jteE=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=ZxsjM9AmDxUGlTDtmgzr3PoaZSAjvJE9BIzGLOUjiwkYpymPWcQrTmuL43baePz1J
	 okLz8BVva5fym5xtFBUJrnEcxQQrhacbfN6o+G4yXIhXUbu+5Q2NBKqlF2veYCEk66
	 f3JuPZVO7+Qq2VXiOMPWPPaMpZwFntnV8ojs0FX5sVnpKlgUSswdbkEmcCWZf39cTK
	 dgpDDEt+Jm9ydZvM51GekdPoxrSBBSFg67a792h6xEBJ63eDgF6ktu26Lltl5nHoZA
	 mBD4Z7nVYpwXIqK5hmfkzhzha/u9FlYSDpsJ+XDyZL+LDCKuJ/irXN5JqtZ35mYXTI
	 K/qwPfOBVxSRg==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 04 Jun 2025 01:29:22 +0200
Message-Id: <DADAEIT9E1R8.1J69W5DKYAQGY@kernel.org>
Cc: =?utf-8?q?Gerald_Wisb=C3=B6ck?= <gerald.wisboeck@feather.ink>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 2/3] rust: miscdevice: add additional data to
 MiscDeviceRegistration
From: "Benno Lossin" <lossin@kernel.org>
To: "Christian Schrefl" <chrisi.schrefl@gmail.com>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Danilo Krummrich" <dakr@kernel.org>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Andreas Hindborg" <a.hindborg@kernel.org>,
 "Alice Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 "Arnd Bergmann" <arnd@arndb.de>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>, "Lee Jones" <lee@kernel.org>, "Daniel
 Almeida" <daniel.almeida@collabora.com>
X-Mailer: aerc 0.20.1
References: <20250530-b4-rust_miscdevice_registrationdata-v4-0-d313aafd7e59@gmail.com> <20250530-b4-rust_miscdevice_registrationdata-v4-2-d313aafd7e59@gmail.com> <DAACCYW3QRQE.1O75L2SHJYVPM@kernel.org> <3eef5777-9190-4782-8433-7b6ad4b9acd3@gmail.com>
In-Reply-To: <3eef5777-9190-4782-8433-7b6ad4b9acd3@gmail.com>

On Mon Jun 2, 2025 at 11:16 PM CEST, Christian Schrefl wrote:
> On 31.05.25 2:23 PM, Benno Lossin wrote:
>> On Fri May 30, 2025 at 10:46 PM CEST, Christian Schrefl wrote:
>>> +// SAFETY:
>>> +// - All `&self` methods on this type are written to ensure that it is=
 safe to call them in
>>> +//   parallel.
>>> +// - `MiscDevice::RegistrationData` is always `Sync`.
>>> +unsafe impl<T: MiscDevice> Sync for MiscDeviceRegistration<T> {}
>>=20
>> I would feel better if we still add the `T::RegistrationData: Sync`
>> bound here even if it is vacuous today.
>
> Since a reference the `MiscDeviceRegistration` struct is an
> argument to the open function this struct must always be Sync,
> so adding bounds here doesn't make much sense.

Well yes, but this statement makes `MiscDeviceRegistration` be `Sync`
even if `T::RegistrationData` is not `Sync` if that bound got removed
at some point. And this "instability" is what I'm worried about.

> I'll add this a safety comment in `MiscdeviceVTable::open`
> about this.
>
> Is there a good way to assert this at build to avoid regessions?

    const _: () =3D {
        fn assert_sync<T: ?Sized + Sync>() {}
        fn ctx<T: MiscDevice>() {
            assert_sync::<T::RegistrationData>();
        }
    };

That would also be fine with me if you insist on not adding the bound.

(the `assert_sync` function should maybe be somewhere where everyone can
use it)

>>>  impl<T: MiscDevice> MiscDeviceRegistration<T> {
>>>      /// Register a misc device.
>>> -    pub fn register(opts: MiscDeviceOptions) -> impl PinInit<Self, Err=
or> {
>>> +    pub fn register(
>>> +        opts: MiscDeviceOptions,
>>> +        data: impl PinInit<T::RegistrationData, Error>,
>>> +    ) -> impl PinInit<Self, Error> {
>>>          try_pin_init!(Self {
>>> +            data <- Opaque::pin_init(data),
>>>              inner <- Opaque::try_ffi_init(move |slot: *mut bindings::m=
iscdevice| {
>>>                  // SAFETY: The initializer can write to the provided `=
slot`.
>>>                  unsafe { slot.write(opts.into_raw::<T>()) };
>>> =20
>>> -                // SAFETY: We just wrote the misc device options to th=
e slot. The miscdevice will
>>> -                // get unregistered before `slot` is deallocated becau=
se the memory is pinned and
>>> -                // the destructor of this type deallocates the memory.
>>> +                // SAFETY:
>>> +                // * We just wrote the misc device options to the slot=
. The miscdevice will
>>> +                //   get unregistered before `slot` is deallocated bec=
ause the memory is pinned and
>>> +                //   the destructor of this type deallocates the memor=
y.
>>> +                // * `data` is Initialized before `misc_register` so n=
o race with `fops->open()`
>>> +                //   is possible.
>>>                  // INVARIANT: If this returns `Ok(())`, then the `slot=
` will contain a registered
>>>                  // misc device.
>>>                  to_result(unsafe { bindings::misc_register(slot) })
>>> @@ -93,13 +108,24 @@ pub fn device(&self) -> &Device {
>>>          // before the underlying `struct miscdevice` is destroyed.
>>>          unsafe { Device::as_ref((*self.as_raw()).this_device) }
>>>      }
>>> +
>>> +    /// Access the additional data stored in this registration.
>>> +    pub fn data(&self) -> &T::RegistrationData {
>>> +        // SAFETY:
>>> +        // * No mutable reference to the value contained by `self.data=
` can ever be created.
>>> +        // * The value contained by `self.data` is valid for the entir=
e lifetime of `&self`.
>>=20
>> Please add type invariants for these two requirements.
>>=20
>>> +        unsafe { &*self.data.get() }
>>> +    }
>>>  }
>>> =20
>>>  #[pinned_drop]
>>> -impl<T> PinnedDrop for MiscDeviceRegistration<T> {
>>> +impl<T: MiscDevice> PinnedDrop for MiscDeviceRegistration<T> {
>>>      fn drop(self: Pin<&mut Self>) {
>>>          // SAFETY: We know that the device is registered by the type i=
nvariants.
>>>          unsafe { bindings::misc_deregister(self.inner.get()) };
>>> +
>>> +        // SAFETY: `self.data` is valid for dropping and nothing uses =
it anymore.
>>=20
>> Ditto.
>
> I'm not quite sure how to formulate these, what do you think of:
>
> /// - `inner` is a registered misc device.

This doesn't really mean something to me, maybe it's better to reference
the registering function?

> /// - `data` contains a valid `T::RegistrationData` for the whole lifetim=
e of [`MiscDeviceRegistration`]

This sounds good. But help me understand, why do we need `Opaque` /
`UnsafePinned` again? If we're only using shared references, then we
could also just store the object by value?

> /// - `data` must be usable until `misc_deregister` (called when dropped)=
 has returned.

What does "usable" mean?

> /// - no mutable references to `data` may be created.

>>> +        unsafe { core::ptr::drop_in_place(self.data.get()) };
>>>      }
>>>  }
>>> =20
>>> @@ -109,6 +135,13 @@ pub trait MiscDevice: Sized {
>>>      /// What kind of pointer should `Self` be wrapped in.
>>>      type Ptr: ForeignOwnable + Send + Sync;
>>> =20
>>> +    /// The additional data carried by the [`MiscDeviceRegistration`] =
for this [`MiscDevice`].
>>> +    /// If no additional data is required than the unit type `()` shou=
ld be used.
>>> +    ///
>>> +    /// This data can be accessed in [`MiscDevice::open()`] using
>>> +    /// [`MiscDeviceRegistration::data()`].
>>> +    type RegistrationData: Sync;
>>=20
>> Why do we require `Sync` here?
>
> Needed for `MiscDeviceRegistration` to be `Send`, see response above.

You could also just ask the type there to be `Sync`, then users will get
an error when they try to use `MiscDevice` in a way where
`RegistrationData` is required to be `Sync`.

>> We might want to give this a shorter name?
>
> I think its fine, but I am open to Ideas.

`Data`?

---
Cheers,
Benno
