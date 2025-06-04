Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEB7479F2
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 09:38:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749029882; cv=none; b=aIWqo0vqIyuX9X/KSQefxLWSspAb7cu6JtyjNAx0oseaeSMCzr8u/nlVahwov6xwd46YjgBRJMAvN8xBxSHoCORj8Q2RaTWbUqz50WEbeBjinZCEvZ+NSK9xHJm6O1aUZLt1D05PH5E1YOlgpPtA7vPALMKTg/JUcc5cl7vkZ7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749029882; c=relaxed/simple;
	bh=IefVJKRoaTZXyYlWJwwqwPpNNzeZVtle+HBXhnWHRus=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=igF/Qvd8Tz+UO/NBDwEFlll64viomELTpo0JjY5VhPNW28mIh7WroMR9xOZShQvMu+mK24Bbot2q96iqfBvNs0YcQ4SGtbS7PUdZ6Jte8wtzNR7Z3giJ5McvxnWIQBUbZgoPUPmgkRgZTKP5UW2+zK6+IDJQnfcVwMqO2CFO3SE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=JOGYFj+5; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="JOGYFj+5"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-450dada0f83so38485505e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Jun 2025 02:38:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749029879; x=1749634679; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=w9Z4UCGtO6U0GVT4g7AwP3ADkarkEdCLcrxioVcqn6k=;
        b=JOGYFj+5OBQXm17ZWZ/atAlN2VVVHVerzisuifHukR1jQ8N05g9NSxXDaYCctkZmRk
         R6LkH5KNfqusgDwaG/j6gDz7Kgsj2k9fQGpzQmZUwO1cGM8pXmzkYwC4zkbfUWgW2hSe
         WS7HXFauCwbkSaFGm7MB7wuFdjQZdfObuj6NkirUB/9gy1yrrT/7HgJE7eCTvbVPKw4H
         5QGOHBW2jdkW3KiCgEkO1SkYzQObDxySBjvjioerorW/J4sVYoxbzaCw3a9TRmENOzSt
         i9PoMbEqZJHzb0gbXMWevlPrDxR451n3LqCCifZuLh+kz5YuLsgWOcwT6DQ1WZWpdgsL
         bbeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749029879; x=1749634679;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=w9Z4UCGtO6U0GVT4g7AwP3ADkarkEdCLcrxioVcqn6k=;
        b=OAtEzKlgey467tX/eHJOed8xtuxccJg6/XfDx2Udi0oWlV6F2X97pA8DTWh+l0QXSD
         rH1QwcPEhImhtY1zqhQ49XGvknTjk0WxgF65ly/1J4nNTrL4u8OhOPaU8aRvP/Fy1Qo+
         d7TZUCCixKOWejWlymWpTN+xgtW8JUNzu7/S7+8PFey9aNceyoFqcBNzRptmMaM0PdO9
         k+s0sRR4U/e0PAVwWZV/tR6DIopQXS1gCHcqjf8jJ2L8GtLbCraV3xx/QqDCL0NlIyLB
         ap/VC9NR/dnfuCW3VbEYezrJUYuYmYoYA8Hn1KWcwJkA4vFyhojoDmlh0z3MBoAsWyPr
         kM5Q==
X-Forwarded-Encrypted: i=1; AJvYcCWt+MjqW/1TmxddyjCjUweRweMOS61iN6R7ftSws6dE1ogxeNZuJ3lCVa4Nd2vcRXKF4+AcH9o8HNLUU5s=@vger.kernel.org
X-Gm-Message-State: AOJu0YxFfSQhZPME7h/DcK0xlSkVfDJew63yhpAt6S+YCmB1z0ZCuxfS
	e1qPtVlJoR3E+0PD+Rwi3P/3tZDvtQhWOmGFIAY+5W3kKDG9Yz5sjyRGK58dabf+Arp63lapxjl
	XtLSKQXvUiw2s1x9SnA==
X-Google-Smtp-Source: AGHT+IHbB15ak9OkLyyLKjiL2SuiJUR5ZPZ+YNrGcnXzpsUEWmNZ70EDL0B0udyTAmN0Mlas7cyYu9RJKod5RTQ=
X-Received: from wmbay12.prod.google.com ([2002:a05:600c:1e0c:b0:43d:b30:d2df])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:35d4:b0:43c:f44c:72a6 with SMTP id 5b1f17b1804b1-451f0a63602mr16072705e9.2.1749029879077;
 Wed, 04 Jun 2025 02:37:59 -0700 (PDT)
Date: Wed, 4 Jun 2025 09:37:56 +0000
In-Reply-To: <DAACCYW3QRQE.1O75L2SHJYVPM@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250530-b4-rust_miscdevice_registrationdata-v4-0-d313aafd7e59@gmail.com>
 <20250530-b4-rust_miscdevice_registrationdata-v4-2-d313aafd7e59@gmail.com> <DAACCYW3QRQE.1O75L2SHJYVPM@kernel.org>
Message-ID: <aEAT9B669Qvi0rlR@google.com>
Subject: Re: [PATCH v4 2/3] rust: miscdevice: add additional data to MiscDeviceRegistration
From: Alice Ryhl <aliceryhl@google.com>
To: Benno Lossin <lossin@kernel.org>
Cc: Christian Schrefl <chrisi.schrefl@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Arnd Bergmann <arnd@arndb.de>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Lee Jones <lee@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, 
	"Gerald =?utf-8?Q?Wisb=C3=B6ck?=" <gerald.wisboeck@feather.ink>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Sat, May 31, 2025 at 02:23:23PM +0200, Benno Lossin wrote:
> On Fri May 30, 2025 at 10:46 PM CEST, Christian Schrefl wrote:
> > @@ -45,32 +46,46 @@ pub const fn into_raw<T: MiscDevice>(self) -> bindings::miscdevice {
> >  /// # Invariants
> >  ///
> >  /// `inner` is a registered misc device.
> > -#[repr(transparent)]
> > +#[repr(C)]
> 
> Why do we need linear layout? `container_of!` also works with the `Rust`
> layout.
> 
> >  #[pin_data(PinnedDrop)]
> > -pub struct MiscDeviceRegistration<T> {
> > +pub struct MiscDeviceRegistration<T: MiscDevice> {
> >      #[pin]
> >      inner: Opaque<bindings::miscdevice>,
> > +    #[pin]
> > +    data: Opaque<T::RegistrationData>,
> >      _t: PhantomData<T>,
> 
> No need to keep the `PhantomData` field around, since you're using `T`
> above.
> 
> >  }
> >  
> > -// SAFETY: It is allowed to call `misc_deregister` on a different thread from where you called
> > -// `misc_register`.
> > -unsafe impl<T> Send for MiscDeviceRegistration<T> {}
> > -// SAFETY: All `&self` methods on this type are written to ensure that it is safe to call them in
> > -// parallel.
> > -unsafe impl<T> Sync for MiscDeviceRegistration<T> {}
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
> 
> I would feel better if we still add the `T::RegistrationData: Sync`
> bound here even if it is vacuous today.
> 
> >  impl<T: MiscDevice> MiscDeviceRegistration<T> {
> >      /// Register a misc device.
> > -    pub fn register(opts: MiscDeviceOptions) -> impl PinInit<Self, Error> {
> > +    pub fn register(
> > +        opts: MiscDeviceOptions,
> > +        data: impl PinInit<T::RegistrationData, Error>,
> > +    ) -> impl PinInit<Self, Error> {
> >          try_pin_init!(Self {
> > +            data <- Opaque::pin_init(data),
> >              inner <- Opaque::try_ffi_init(move |slot: *mut bindings::miscdevice| {
> >                  // SAFETY: The initializer can write to the provided `slot`.
> >                  unsafe { slot.write(opts.into_raw::<T>()) };
> >  
> > -                // SAFETY: We just wrote the misc device options to the slot. The miscdevice will
> > -                // get unregistered before `slot` is deallocated because the memory is pinned and
> > -                // the destructor of this type deallocates the memory.
> > +                // SAFETY:
> > +                // * We just wrote the misc device options to the slot. The miscdevice will
> > +                //   get unregistered before `slot` is deallocated because the memory is pinned and
> > +                //   the destructor of this type deallocates the memory.
> > +                // * `data` is Initialized before `misc_register` so no race with `fops->open()`
> > +                //   is possible.
> >                  // INVARIANT: If this returns `Ok(())`, then the `slot` will contain a registered
> >                  // misc device.
> >                  to_result(unsafe { bindings::misc_register(slot) })
> > @@ -93,13 +108,24 @@ pub fn device(&self) -> &Device {
> >          // before the underlying `struct miscdevice` is destroyed.
> >          unsafe { Device::as_ref((*self.as_raw()).this_device) }
> >      }
> > +
> > +    /// Access the additional data stored in this registration.
> > +    pub fn data(&self) -> &T::RegistrationData {
> > +        // SAFETY:
> > +        // * No mutable reference to the value contained by `self.data` can ever be created.
> > +        // * The value contained by `self.data` is valid for the entire lifetime of `&self`.
> 
> Please add type invariants for these two requirements.
> 
> > +        unsafe { &*self.data.get() }
> > +    }
> >  }
> >  
> >  #[pinned_drop]
> > -impl<T> PinnedDrop for MiscDeviceRegistration<T> {
> > +impl<T: MiscDevice> PinnedDrop for MiscDeviceRegistration<T> {
> >      fn drop(self: Pin<&mut Self>) {
> >          // SAFETY: We know that the device is registered by the type invariants.
> >          unsafe { bindings::misc_deregister(self.inner.get()) };
> > +
> > +        // SAFETY: `self.data` is valid for dropping and nothing uses it anymore.
> 
> Ditto.
> 
> > +        unsafe { core::ptr::drop_in_place(self.data.get()) };
> >      }
> >  }
> >  
> > @@ -109,6 +135,13 @@ pub trait MiscDevice: Sized {
> >      /// What kind of pointer should `Self` be wrapped in.
> >      type Ptr: ForeignOwnable + Send + Sync;
> >  
> > +    /// The additional data carried by the [`MiscDeviceRegistration`] for this [`MiscDevice`].
> > +    /// If no additional data is required than the unit type `()` should be used.
> > +    ///
> > +    /// This data can be accessed in [`MiscDevice::open()`] using
> > +    /// [`MiscDeviceRegistration::data()`].
> > +    type RegistrationData: Sync;
> 
> Why do we require `Sync` here?
> 
> We might want to give this a shorter name?


