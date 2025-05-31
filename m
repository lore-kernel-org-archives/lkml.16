Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AD2B23815B;
	Sat, 31 May 2025 12:23:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748694209; cv=none; b=U8Eo6eZx/zntFzfv9IrqB6Asx6hBwa6AXGPIrc7mVk7zpkmJfEtavTkN6JqmBAmAkj79aLN6UMAIrX/nn8jFvGRPXVeWv2dGM9dWKWAWMzp4HhupJvLb6B765Na+BHYhi7YPl0Wmo2m6u/Fv7HOoNlrs28RBl/PaoqV2+nPAb0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748694209; c=relaxed/simple;
	bh=QWLkZ5kheg/ARX1/KT1tH/POfsJpTnSnthqFZliEbE4=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=kXZXvBEqfR+QkiLQnpWP82mCmGAvLYyPVdlEotacqhm2KFnonl1KzxV4MVJYzPWF2z9agd0p8w9wQmdkuqqNEL4YIRg68z6xddz5iF8Sv+feEEGeMb2vsHEA04bhY2T0+JzL2SFAzzGJy5kJG03CEg7wTU2Gn79ndXoJad1tYvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D6S0NsHY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D6S0NsHY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7583BC4CEE3;
	Sat, 31 May 2025 12:23:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748694208;
	bh=QWLkZ5kheg/ARX1/KT1tH/POfsJpTnSnthqFZliEbE4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=D6S0NsHY9Qx7yJQp8IlDOylqwH66QIc0zUrMC4TZ3PEMebZCFnl2YiwW/Wk288pJe
	 du43UL6BKHBR5iFm2fZ7XPf7/0DsQ7C/OUJDEGzptO0otwIyjPn5geLMD5jStcCT+c
	 ZYspdnVBjjZCEHnFTHt+MAnww+qxZ6abdZu3bc7wuez9Q0YUFxV5RRPYCYzzXWTOc5
	 mSP4Pof+xdy1MRP+OnHqikmDinVUxoUvf28zDhAWXXN/RbEFhIwoZQjMQBFlt31JiT
	 DSwLm4hIOiIpvXi+yK5U7RamDYICV1zQCoDOrdNhAY9a52vsWdR62qf9zqVBLgXqIv
	 XxOrZ+YA1MQ/Q==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 31 May 2025 14:23:23 +0200
Message-Id: <DAACCYW3QRQE.1O75L2SHJYVPM@kernel.org>
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
Cc: =?utf-8?q?Gerald_Wisb=C3=B6ck?= <gerald.wisboeck@feather.ink>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 2/3] rust: miscdevice: add additional data to
 MiscDeviceRegistration
X-Mailer: aerc 0.20.1
References: <20250530-b4-rust_miscdevice_registrationdata-v4-0-d313aafd7e59@gmail.com> <20250530-b4-rust_miscdevice_registrationdata-v4-2-d313aafd7e59@gmail.com>
In-Reply-To: <20250530-b4-rust_miscdevice_registrationdata-v4-2-d313aafd7e59@gmail.com>

On Fri May 30, 2025 at 10:46 PM CEST, Christian Schrefl wrote:
> @@ -45,32 +46,46 @@ pub const fn into_raw<T: MiscDevice>(self) -> binding=
s::miscdevice {
>  /// # Invariants
>  ///
>  /// `inner` is a registered misc device.
> -#[repr(transparent)]
> +#[repr(C)]

Why do we need linear layout? `container_of!` also works with the `Rust`
layout.

>  #[pin_data(PinnedDrop)]
> -pub struct MiscDeviceRegistration<T> {
> +pub struct MiscDeviceRegistration<T: MiscDevice> {
>      #[pin]
>      inner: Opaque<bindings::miscdevice>,
> +    #[pin]
> +    data: Opaque<T::RegistrationData>,
>      _t: PhantomData<T>,

No need to keep the `PhantomData` field around, since you're using `T`
above.

>  }
> =20
> -// SAFETY: It is allowed to call `misc_deregister` on a different thread=
 from where you called
> -// `misc_register`.
> -unsafe impl<T> Send for MiscDeviceRegistration<T> {}
> -// SAFETY: All `&self` methods on this type are written to ensure that i=
t is safe to call them in
> -// parallel.
> -unsafe impl<T> Sync for MiscDeviceRegistration<T> {}
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

I would feel better if we still add the `T::RegistrationData: Sync`
bound here even if it is vacuous today.

>  impl<T: MiscDevice> MiscDeviceRegistration<T> {
>      /// Register a misc device.
> -    pub fn register(opts: MiscDeviceOptions) -> impl PinInit<Self, Error=
> {
> +    pub fn register(
> +        opts: MiscDeviceOptions,
> +        data: impl PinInit<T::RegistrationData, Error>,
> +    ) -> impl PinInit<Self, Error> {
>          try_pin_init!(Self {
> +            data <- Opaque::pin_init(data),
>              inner <- Opaque::try_ffi_init(move |slot: *mut bindings::mis=
cdevice| {
>                  // SAFETY: The initializer can write to the provided `sl=
ot`.
>                  unsafe { slot.write(opts.into_raw::<T>()) };
> =20
> -                // SAFETY: We just wrote the misc device options to the =
slot. The miscdevice will
> -                // get unregistered before `slot` is deallocated because=
 the memory is pinned and
> -                // the destructor of this type deallocates the memory.
> +                // SAFETY:
> +                // * We just wrote the misc device options to the slot. =
The miscdevice will
> +                //   get unregistered before `slot` is deallocated becau=
se the memory is pinned and
> +                //   the destructor of this type deallocates the memory.
> +                // * `data` is Initialized before `misc_register` so no =
race with `fops->open()`
> +                //   is possible.
>                  // INVARIANT: If this returns `Ok(())`, then the `slot` =
will contain a registered
>                  // misc device.
>                  to_result(unsafe { bindings::misc_register(slot) })
> @@ -93,13 +108,24 @@ pub fn device(&self) -> &Device {
>          // before the underlying `struct miscdevice` is destroyed.
>          unsafe { Device::as_ref((*self.as_raw()).this_device) }
>      }
> +
> +    /// Access the additional data stored in this registration.
> +    pub fn data(&self) -> &T::RegistrationData {
> +        // SAFETY:
> +        // * No mutable reference to the value contained by `self.data` =
can ever be created.
> +        // * The value contained by `self.data` is valid for the entire =
lifetime of `&self`.

Please add type invariants for these two requirements.

> +        unsafe { &*self.data.get() }
> +    }
>  }
> =20
>  #[pinned_drop]
> -impl<T> PinnedDrop for MiscDeviceRegistration<T> {
> +impl<T: MiscDevice> PinnedDrop for MiscDeviceRegistration<T> {
>      fn drop(self: Pin<&mut Self>) {
>          // SAFETY: We know that the device is registered by the type inv=
ariants.
>          unsafe { bindings::misc_deregister(self.inner.get()) };
> +
> +        // SAFETY: `self.data` is valid for dropping and nothing uses it=
 anymore.

Ditto.

> +        unsafe { core::ptr::drop_in_place(self.data.get()) };
>      }
>  }
> =20
> @@ -109,6 +135,13 @@ pub trait MiscDevice: Sized {
>      /// What kind of pointer should `Self` be wrapped in.
>      type Ptr: ForeignOwnable + Send + Sync;
> =20
> +    /// The additional data carried by the [`MiscDeviceRegistration`] fo=
r this [`MiscDevice`].
> +    /// If no additional data is required than the unit type `()` should=
 be used.
> +    ///
> +    /// This data can be accessed in [`MiscDevice::open()`] using
> +    /// [`MiscDeviceRegistration::data()`].
> +    type RegistrationData: Sync;

Why do we require `Sync` here?

We might want to give this a shorter name?

---
Cheers,
Benno

> +
>      /// Called when the misc device is opened.
>      ///
>      /// The returned pointer will be stored as the private data for the =
file.
