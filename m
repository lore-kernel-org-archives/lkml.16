Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F2364683;
	Thu,  5 Jun 2025 14:57:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749135447; cv=none; b=lBvxwRLQxL3HwtuLeIqMj0e2rs/SPmhXr5CdHu66+ev1EM4VUL+mwnLpcUCpJ9LBtY/ZuWjR3hftsc8NbJ6KFSHcnoN8FUA2Y9UpmXxjsdHyLkwelC2NIL+uBmWcjHbb3onuETWHdkJbqF3Iqc28HOKKf9mIrD0iXkKJ6o34rcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749135447; c=relaxed/simple;
	bh=uTET4G+7c2OnMbFT/eq4kko+kWPV4udCFZPod2A7CW0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=V5SupAJiVfhxPgprRre5JtP9xlAxpaC6LUj6B6DGHNxTvUYyPp5Tg+v30M2kP1Kme3EJqlzTOb/gM7SZJiDC5pbArsEDFZjpUlmBuKLWoYRg10y3XSR6cPTDQXH+oHxHVx8/93r3kBHa4GjGCkEOSeW0qtHKy+oI+s792D/kM4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NVlrABdK; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NVlrABdK"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-602c4eae8d5so2096394a12.1;
        Thu, 05 Jun 2025 07:57:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749135443; x=1749740243; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Va+8xjb09zhVfjCXCKaVmcfS2r7TJzjMNIcPdhlatyo=;
        b=NVlrABdKwLzFBX5DQ4Ox88/hNNzpqw2COUNdiyaZbMc6SBVd12wzYnQz3jFQTmk4eK
         giQ+4xm5wvzFGRL6c3a1cAvGwqbdtwb8RcVLu/K53iX0gyoesp8UL6phCXnrmjzibKBT
         lkWvSHUOV8h6j87GW6rPmiLKVFNXWJghcTUQRf7nqGpzmSPI+IfqxUnx9DuLoXgZ18eW
         +MizWBAbAYz3axJ49xzYWsA1W4CCDvcU7SIXOt+7fNGHio4M3Ma7FN0PF9JMMf8Sd5Te
         gyfYjhrXt8UAJ+MIb7XBAUmF3r7IYxdWtbsWrpTVaIFTIRXJGM34QxE/Q3tjhc8fRTsA
         gYOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749135443; x=1749740243;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Va+8xjb09zhVfjCXCKaVmcfS2r7TJzjMNIcPdhlatyo=;
        b=ib2SUg/Oohy9WE8yDkaSmoVmH6VD++gTGFWLVg9dfOWOVzKFi4DsILdpxfQVVh1EI0
         +nrlwFBgHL8WHUEhCtV2+wpAlmbOGz2OH350dS2QIwo2O8iQ0s2xyhdvKblA3/4PH5lX
         Y3keeH6BY46Pyt0k1Qaqt36AYK1Nw917LRdBhwS/E3I/GWJVl/SFchj+bNCv0OJNjOM/
         mHvqhpDe9GfSPGICZq4ImmaqurVsZMBe0eiSkiDIUezaPyIK62pLGlJv0Zx0CxRcIdt9
         2u5qfFlrVSmB/UEYRIwGzspaoHY0HQh6KRx0rqJ8WwUgXV6W+jYkCx9SLHthDYFo0VW1
         in2w==
X-Forwarded-Encrypted: i=1; AJvYcCVVsVDU43TXJ0XYmtFzGVnS7aHSulQQFvOaJ0B4npB3aRegEC3BkhVqv2X/KS+x2w+VPGwE6YHtREB63qyelEs=@vger.kernel.org, AJvYcCXhF3tA5m/vSPDaMEI0RCNsXp85ac5dACFRqd2IvwfzTong42JDSIcJoo9ESeaJ7rtxZLnMQUzN0T1EWbQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzle65iY1Do8JyU4QxX4GYeSS75NhqX048uC28pATedTKBWlI95
	KWbi9azHL2ZS4d6h/KndqRGFO48l3oLMaLwimgVeBlceojl0lfG/LaQy
X-Gm-Gg: ASbGnct0QL9KpRah/v317jZYOW2Ds54p3U9SnaCXyyAR8vfGKqQp2pytjs/DOw0QNAP
	q2fb7OXP8bImL/y0/3Wxo0yj0oaKU34G4+tX+lycIEny1JURiMfO17pn9t0gI983YzlRrT4REXW
	kl0KGVbRHSxjOs5qFsai5/REuUgnAwqwFY1EEhNzAwyE92fZNurwjJgkRINLfAfsxsd4l/3Xzct
	ZuA/RIV/iG2OSbJGE4yQjKrWSi3YszYcW0xog0trLcr5fRO9Hk9iCwS0NJvMTmKomGFDAQ3EpIR
	D/zT2xjGsr4yFeQ1QkAALLZNAbXJcHw0/Vgtq9EqhY7Ro5DLvf7ZvTLmvRTM
X-Google-Smtp-Source: AGHT+IHJ83c9JB8yfO5TjxD3kbf8DXzpbTeXwdM91a4bsry8tp4wffefKe0x6ZTZgowils3eSuLoHQ==
X-Received: by 2002:a05:6402:350c:b0:603:51cd:f1cf with SMTP id 4fb4d7f45d1cf-60722635459mr3336211a12.7.1749135442985;
        Thu, 05 Jun 2025 07:57:22 -0700 (PDT)
Received: from [10.5.1.156] ([193.170.134.247])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60566c5c5casm10512536a12.25.2025.06.05.07.57.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Jun 2025 07:57:22 -0700 (PDT)
Message-ID: <3c1c0563-7f48-4222-a28d-316f885bcad4@gmail.com>
Date: Thu, 5 Jun 2025 16:57:21 +0200
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
 <3eef5777-9190-4782-8433-7b6ad4b9acd3@gmail.com>
 <DADAEIT9E1R8.1J69W5DKYAQGY@kernel.org>
Content-Language: en-US, de-DE
From: Christian Schrefl <chrisi.schrefl@gmail.com>
In-Reply-To: <DADAEIT9E1R8.1J69W5DKYAQGY@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 04.06.25 1:29 AM, Benno Lossin wrote:
> On Mon Jun 2, 2025 at 11:16 PM CEST, Christian Schrefl wrote:
>> On 31.05.25 2:23 PM, Benno Lossin wrote:
>>> On Fri May 30, 2025 at 10:46 PM CEST, Christian Schrefl wrote:
>>>> +// SAFETY:
>>>> +// - All `&self` methods on this type are written to ensure that it is safe to call them in
>>>> +//   parallel.
>>>> +// - `MiscDevice::RegistrationData` is always `Sync`.
>>>> +unsafe impl<T: MiscDevice> Sync for MiscDeviceRegistration<T> {}
>>>
>>> I would feel better if we still add the `T::RegistrationData: Sync`
>>> bound here even if it is vacuous today.
>>
>> Since a reference the `MiscDeviceRegistration` struct is an
>> argument to the open function this struct must always be Sync,
>> so adding bounds here doesn't make much sense.
> 
> Well yes, but this statement makes `MiscDeviceRegistration` be `Sync`
> even if `T::RegistrationData` is not `Sync` if that bound got removed
> at some point. And this "instability" is what I'm worried about.
> 
>> I'll add this a safety comment in `MiscdeviceVTable::open`
>> about this.
>>
>> Is there a good way to assert this at build to avoid regessions?
> 
>     const _: () = {
>         fn assert_sync<T: ?Sized + Sync>() {}
>         fn ctx<T: MiscDevice>() {
>             assert_sync::<T::RegistrationData>();
>         }
>     };
> 

I'll add the bound and a TODO about `assert_sync`, in `open`
where `Send` is required.

I intend to write a patch for `assert_sync` later.

> That would also be fine with me if you insist on not adding the bound.
> 
> (the `assert_sync` function should maybe be somewhere where everyone can
> use it)
> 
>>>>  impl<T: MiscDevice> MiscDeviceRegistration<T> {
>>>>      /// Register a misc device.
>>>> -    pub fn register(opts: MiscDeviceOptions) -> impl PinInit<Self, Error> {
>>>> +    pub fn register(
>>>> +        opts: MiscDeviceOptions,
>>>> +        data: impl PinInit<T::RegistrationData, Error>,
>>>> +    ) -> impl PinInit<Self, Error> {
>>>>          try_pin_init!(Self {
>>>> +            data <- Opaque::pin_init(data),
>>>>              inner <- Opaque::try_ffi_init(move |slot: *mut bindings::miscdevice| {
>>>>                  // SAFETY: The initializer can write to the provided `slot`.
>>>>                  unsafe { slot.write(opts.into_raw::<T>()) };
>>>>  
>>>> -                // SAFETY: We just wrote the misc device options to the slot. The miscdevice will
>>>> -                // get unregistered before `slot` is deallocated because the memory is pinned and
>>>> -                // the destructor of this type deallocates the memory.
>>>> +                // SAFETY:
>>>> +                // * We just wrote the misc device options to the slot. The miscdevice will
>>>> +                //   get unregistered before `slot` is deallocated because the memory is pinned and
>>>> +                //   the destructor of this type deallocates the memory.
>>>> +                // * `data` is Initialized before `misc_register` so no race with `fops->open()`
>>>> +                //   is possible.
>>>>                  // INVARIANT: If this returns `Ok(())`, then the `slot` will contain a registered
>>>>                  // misc device.
>>>>                  to_result(unsafe { bindings::misc_register(slot) })
>>>> @@ -93,13 +108,24 @@ pub fn device(&self) -> &Device {
>>>>          // before the underlying `struct miscdevice` is destroyed.
>>>>          unsafe { Device::as_ref((*self.as_raw()).this_device) }
>>>>      }
>>>> +
>>>> +    /// Access the additional data stored in this registration.
>>>> +    pub fn data(&self) -> &T::RegistrationData {
>>>> +        // SAFETY:
>>>> +        // * No mutable reference to the value contained by `self.data` can ever be created.
>>>> +        // * The value contained by `self.data` is valid for the entire lifetime of `&self`.
>>>
>>> Please add type invariants for these two requirements.
>>>
>>>> +        unsafe { &*self.data.get() }
>>>> +    }
>>>>  }
>>>>  
>>>>  #[pinned_drop]
>>>> -impl<T> PinnedDrop for MiscDeviceRegistration<T> {
>>>> +impl<T: MiscDevice> PinnedDrop for MiscDeviceRegistration<T> {
>>>>      fn drop(self: Pin<&mut Self>) {
>>>>          // SAFETY: We know that the device is registered by the type invariants.
>>>>          unsafe { bindings::misc_deregister(self.inner.get()) };
>>>> +
>>>> +        // SAFETY: `self.data` is valid for dropping and nothing uses it anymore.
>>>
>>> Ditto.
>>
>> I'm not quite sure how to formulate these, what do you think of:
>>
>> /// - `inner` is a registered misc device.
> 
> This doesn't really mean something to me, maybe it's better to reference
> the registering function?

That is from previous code so this should probably not be changed
in this series.

> 
>> /// - `data` contains a valid `T::RegistrationData` for the whole lifetime of [`MiscDeviceRegistration`]
> 
> This sounds good. But help me understand, why do we need `Opaque` /
> `UnsafePinned` again? If we're only using shared references, then we
> could also just store the object by value?

Since the Module owns the `MiscDeviceRegistration` it may create `&mut MiscDeviceRegistration`,
so from what I understand having a `& RegistrationData` reference into that is UB without
`UnsafePinned` (or `Opaque` since that includes `UnsafePinned` semantics).

> 
>> /// - `data` must be usable until `misc_deregister` (called when dropped) has returned.
> 
> What does "usable" mean?

I guess valid / alive might be better wording?

I meant to say that the `fops` functions might use the `RegistrationData` until 
`misc_deregister` has returned so we must ensure that these accesses are allowed.  

> 
>> /// - no mutable references to `data` may be created.
> 
>>>> +        unsafe { core::ptr::drop_in_place(self.data.get()) };
>>>>      }
>>>>  }
>>>>  
>>>> @@ -109,6 +135,13 @@ pub trait MiscDevice: Sized {
>>>>      /// What kind of pointer should `Self` be wrapped in.
>>>>      type Ptr: ForeignOwnable + Send + Sync;
>>>>  
>>>> +    /// The additional data carried by the [`MiscDeviceRegistration`] for this [`MiscDevice`].
>>>> +    /// If no additional data is required than the unit type `()` should be used.
>>>> +    ///
>>>> +    /// This data can be accessed in [`MiscDevice::open()`] using
>>>> +    /// [`MiscDeviceRegistration::data()`].
>>>> +    type RegistrationData: Sync;
>>>
>>> Why do we require `Sync` here?
>>
>> Needed for `MiscDeviceRegistration` to be `Send`, see response above.
> 
> You could also just ask the type there to be `Sync`, then users will get
> an error when they try to use `MiscDevice` in a way where
> `RegistrationData` is required to be `Sync`.

I don't think there is any point to allow defining a `MiscDevice` implementation
that cant actually be used/registered.

> 
>>> We might want to give this a shorter name?
>>
>> I think its fine, but I am open to Ideas.
> 
> `Data`?

I feel that `Data` is just very ambiguous, especially since it is associated with 
`MiscDevice` not the `MiscDeviceRegistration` in which its used.

One Idea I've had was `AssociatedData` but that's less clear and not much shorter
than `RegistrationData`.

But I'd be alright to just with `Data` if that is wanted.

Cheers
Christian
