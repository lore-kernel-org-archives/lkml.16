Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFBECF9D6;
	Mon,  2 Jun 2025 21:16:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748898999; cv=none; b=Sp2ddJwG/rOcxZCQLksOTa6G6mwlh/wBiqCyrlpOsl3ZstURhELqqPv+Se3ATto8sZ8bYQ9hVmHVHKh4bumtgFlISJpl0gzm1oA+WEvyLNJcdS6qzHkN1bPgbXoQbwwSkVTO6LA86V6FK+M0oD7UqZYNQMuKeE68C4QuplJ7sAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748898999; c=relaxed/simple;
	bh=eGDgTGRDk+6qjZJu1WX/uStB+XPGGuUNfmY60eILhds=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GrmGYhzehHMo2dlvb8MtsaFsnG0D8mlWxHuCV95OEXkrq3vTdHyvy1ahh96682wBFiGAMw1XlTykB8ILot0glXByJTDQBWCidHZi3+OK7H3QwloLG1qaoouVi3mLigLeqdALm7HCLzNEkMBm9qabVxsgrc2+5w1k5C0pe3D8Kxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=boZ/eOQT; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="boZ/eOQT"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6055f106811so6827492a12.0;
        Mon, 02 Jun 2025 14:16:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748898996; x=1749503796; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5M7ySNofisoGQzkwRVQf/8TxfSImFbr6tb2heb2I308=;
        b=boZ/eOQTUjzC4G8wKN5Q+oYU4T+yaKHnHzhw0tXa3Ap0Rshfs9dLfXVvRx2pe1PjWM
         8P0I2VQSQ9Ld3hfkzLgxaGtDLSQuHeEH4hO+rCLOX+Tyf75atIJQOHfxZdGx3WwMrXNm
         qOYtgz8jVCrUAlMNgoO1Y/2HIQdLmhk10iofBC+0+ZjxU++XX3Z3XC70JBSuR2R570of
         iPVfVMoEXylDFgow3tILCKVd56jAsISYlGeHQ5P/+zMB/Oomg5xaGOVlf1fLmAzU+eK5
         jslWhaDTjsC7jp8dGsylIE3dheixzkGx4nQ57Gd7FS6cT2OGRwqnGcLhYnANd7s2Q3Wt
         u5gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748898996; x=1749503796;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5M7ySNofisoGQzkwRVQf/8TxfSImFbr6tb2heb2I308=;
        b=W/etDeOmDchHpcMBrsUYnIYHIqAUFQQ/peBp8gEPKYKS3sYLS2VivgGTPah7Eb//SN
         4hxhzhflaiffylz/bZi0H7GdEoloOK4xoqZsgx3TYhc/04t6GiyeCiKRurN5AWQsiZ6X
         L2+3R4XF4g01pU5tCCndDO0N4oT2mP9W9Jsbeu0r9rZ5yKj4hfOGSWRu/9PhhMHaH5H3
         5BaES6GcXFT3epLhLPkfjf0EExnUEJ1TBLz/0aRNAY5CvoSuB6RGvVgOIAwzLJqhA9OG
         cIQ+g+isaw78cZtZ/UTseS0SX6X3fA09GQwK88uctFWlVKyeYNigCRUV2tMtYevYoSED
         YKKQ==
X-Forwarded-Encrypted: i=1; AJvYcCUtHv/DNL4w2CNU8VJHa7+Xh40eCFu2Vioohdh46EAgXQYvKmFMa5+71RARYIVVn1X3W6RmyY/76XHtB2CT8jA=@vger.kernel.org, AJvYcCVPGn6DflpncShHBWcwGHkdtYOErvoWMreJ/Ww5DhDqyXBD8SbtD5ernYCRZ252igBy+Np+sgxrMShGP3Y=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7ssxpuI+569YDbVdTfIf3pyu8DCYaSPxyxJDmeN3xIsB9g8OE
	2hS7AtE2gDiLEiOu6ZgDwld6phsEOvVsQJT7AfbYMWz2rRPYKZofMl46
X-Gm-Gg: ASbGnctK/eWbTJeUKVBUQ8zFYz2EMwgzl+YFlOJlXAa/N7e/4S1dJT/Mvbreb2j/btK
	inH5WhXcog0Bgl5u3nyzJKXwp4ikgKS/xluDyKde30r4DPnnQ19RvQhyEfPVNHLviNF+u64lBdE
	O8n8lBPESr82em3WDkr6W0QDXwpF74oyWzku96dN+84VZx6LpKifA6UQb6ucmnyNwxs5UVC/9Hy
	ndl6pneXIPmBy0L52lLOO7XnYg8oayn8UmEcycjGKY4cTmkQ2HMhcOK44YTvTrYQJS97bXZWkFi
	l9mze3ZCsORTaiiZ1ZxylzjcjUI08fp9sw/Ypypx7TeFwdah8wln0vf76w/As+k0
X-Google-Smtp-Source: AGHT+IGsJ/GPggh+wuIs6f6L2emwjU5o5gztY4UR8qEvjw+hT23jpsPlExcD7pCBA87JwVvt9sB9iw==
X-Received: by 2002:a05:6402:348f:b0:602:e863:3a9e with SMTP id 4fb4d7f45d1cf-605b7721dfbmr8776425a12.15.1748898995931;
        Mon, 02 Jun 2025 14:16:35 -0700 (PDT)
Received: from ?IPV6:2001:871:22a:cd68::171c? ([2001:871:22a:cd68::171c])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60566c5c8easm6567046a12.28.2025.06.02.14.16.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Jun 2025 14:16:35 -0700 (PDT)
Message-ID: <3eef5777-9190-4782-8433-7b6ad4b9acd3@gmail.com>
Date: Mon, 2 Jun 2025 23:16:33 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/3] rust: miscdevice: add additional data to
 MiscDeviceRegistration
To: Benno Lossin <lossin@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
 Danilo Krummrich <dakr@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Lee Jones <lee@kernel.org>,
 Daniel Almeida <daniel.almeida@collabora.com>
Cc: =?UTF-8?Q?Gerald_Wisb=C3=B6ck?= <gerald.wisboeck@feather.ink>,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250530-b4-rust_miscdevice_registrationdata-v4-0-d313aafd7e59@gmail.com>
 <20250530-b4-rust_miscdevice_registrationdata-v4-2-d313aafd7e59@gmail.com>
 <DAACCYW3QRQE.1O75L2SHJYVPM@kernel.org>
Content-Language: en-US, de-DE
From: Christian Schrefl <chrisi.schrefl@gmail.com>
In-Reply-To: <DAACCYW3QRQE.1O75L2SHJYVPM@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 31.05.25 2:23 PM, Benno Lossin wrote:
> On Fri May 30, 2025 at 10:46 PM CEST, Christian Schrefl wrote:
>> @@ -45,32 +46,46 @@ pub const fn into_raw<T: MiscDevice>(self) -> bindings::miscdevice {
>>  /// # Invariants
>>  ///
>>  /// `inner` is a registered misc device.
>> -#[repr(transparent)]
>> +#[repr(C)]
> 
> Why do we need linear layout? `container_of!` also works with the `Rust`
> layout.

That was a leftover from a previous version, fixed.

> 
>>  #[pin_data(PinnedDrop)]
>> -pub struct MiscDeviceRegistration<T> {
>> +pub struct MiscDeviceRegistration<T: MiscDevice> {
>>      #[pin]
>>      inner: Opaque<bindings::miscdevice>,
>> +    #[pin]
>> +    data: Opaque<T::RegistrationData>,
>>      _t: PhantomData<T>,
> 
> No need to keep the `PhantomData` field around, since you're using `T`
> above.
> 

Fixed.

>>  }
>>  
>> -// SAFETY: It is allowed to call `misc_deregister` on a different thread from where you called
>> -// `misc_register`.
>> -unsafe impl<T> Send for MiscDeviceRegistration<T> {}
>> -// SAFETY: All `&self` methods on this type are written to ensure that it is safe to call them in
>> -// parallel.
>> -unsafe impl<T> Sync for MiscDeviceRegistration<T> {}
>> +// SAFETY:
>> +// - It is allowed to call `misc_deregister` on a different thread from where you called
>> +//   `misc_register`.
>> +// - Only implements `Send` if `MiscDevice::RegistrationData` is also `Send`.
>> +unsafe impl<T: MiscDevice> Send for MiscDeviceRegistration<T> where T::RegistrationData: Send {}
>> +
>> +// SAFETY:
>> +// - All `&self` methods on this type are written to ensure that it is safe to call them in
>> +//   parallel.
>> +// - `MiscDevice::RegistrationData` is always `Sync`.
>> +unsafe impl<T: MiscDevice> Sync for MiscDeviceRegistration<T> {}
> 
> I would feel better if we still add the `T::RegistrationData: Sync`
> bound here even if it is vacuous today.

Since a reference the `MiscDeviceRegistration` struct is an
argument to the open function this struct must always be Sync,
so adding bounds here doesn't make much sense.

I'll add this a safety comment in `MiscdeviceVTable::open`
about this.

Is there a good way to assert this at build to avoid regessions?
> 
>>  impl<T: MiscDevice> MiscDeviceRegistration<T> {
>>      /// Register a misc device.
>> -    pub fn register(opts: MiscDeviceOptions) -> impl PinInit<Self, Error> {
>> +    pub fn register(
>> +        opts: MiscDeviceOptions,
>> +        data: impl PinInit<T::RegistrationData, Error>,
>> +    ) -> impl PinInit<Self, Error> {
>>          try_pin_init!(Self {
>> +            data <- Opaque::pin_init(data),
>>              inner <- Opaque::try_ffi_init(move |slot: *mut bindings::miscdevice| {
>>                  // SAFETY: The initializer can write to the provided `slot`.
>>                  unsafe { slot.write(opts.into_raw::<T>()) };
>>  
>> -                // SAFETY: We just wrote the misc device options to the slot. The miscdevice will
>> -                // get unregistered before `slot` is deallocated because the memory is pinned and
>> -                // the destructor of this type deallocates the memory.
>> +                // SAFETY:
>> +                // * We just wrote the misc device options to the slot. The miscdevice will
>> +                //   get unregistered before `slot` is deallocated because the memory is pinned and
>> +                //   the destructor of this type deallocates the memory.
>> +                // * `data` is Initialized before `misc_register` so no race with `fops->open()`
>> +                //   is possible.
>>                  // INVARIANT: If this returns `Ok(())`, then the `slot` will contain a registered
>>                  // misc device.
>>                  to_result(unsafe { bindings::misc_register(slot) })
>> @@ -93,13 +108,24 @@ pub fn device(&self) -> &Device {
>>          // before the underlying `struct miscdevice` is destroyed.
>>          unsafe { Device::as_ref((*self.as_raw()).this_device) }
>>      }
>> +
>> +    /// Access the additional data stored in this registration.
>> +    pub fn data(&self) -> &T::RegistrationData {
>> +        // SAFETY:
>> +        // * No mutable reference to the value contained by `self.data` can ever be created.
>> +        // * The value contained by `self.data` is valid for the entire lifetime of `&self`.
> 
> Please add type invariants for these two requirements.
> 
>> +        unsafe { &*self.data.get() }
>> +    }
>>  }
>>  
>>  #[pinned_drop]
>> -impl<T> PinnedDrop for MiscDeviceRegistration<T> {
>> +impl<T: MiscDevice> PinnedDrop for MiscDeviceRegistration<T> {
>>      fn drop(self: Pin<&mut Self>) {
>>          // SAFETY: We know that the device is registered by the type invariants.
>>          unsafe { bindings::misc_deregister(self.inner.get()) };
>> +
>> +        // SAFETY: `self.data` is valid for dropping and nothing uses it anymore.
> 
> Ditto.

I'm not quite sure how to formulate these, what do you think of:

/// - `inner` is a registered misc device.
/// - `data` contains a valid `T::RegistrationData` for the whole lifetime of [`MiscDeviceRegistration`]
/// - `data` must be usable until `misc_deregister` (called when dropped) has returned.
/// - no mutable references to `data` may be created.

> 
>> +        unsafe { core::ptr::drop_in_place(self.data.get()) };
>>      }
>>  }
>>  
>> @@ -109,6 +135,13 @@ pub trait MiscDevice: Sized {
>>      /// What kind of pointer should `Self` be wrapped in.
>>      type Ptr: ForeignOwnable + Send + Sync;
>>  
>> +    /// The additional data carried by the [`MiscDeviceRegistration`] for this [`MiscDevice`].
>> +    /// If no additional data is required than the unit type `()` should be used.
>> +    ///
>> +    /// This data can be accessed in [`MiscDevice::open()`] using
>> +    /// [`MiscDeviceRegistration::data()`].
>> +    type RegistrationData: Sync;
> 
> Why do we require `Sync` here?

Needed for `MiscDeviceRegistration` to be `Send`, see response above.

> 
> We might want to give this a shorter name?

I think its fine, but I am open to Ideas.

Cheers
Christian
