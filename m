Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11FD05FEE6;
	Thu,  5 Jun 2025 16:52:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749142331; cv=none; b=MoGbmsmzcqcX3wnkCGqERmw8BL+0dVbr0LLQGFFlFTycMnfbTjJXtVU3K92lCds+zpLPw8WazFGcZ4Hdq6bWIEzqQAXGtKcxUbwqHNsPC2lgju3qqnUjMtsjqT1mbr7wM4Iomrrzyivgg/NERoPT5rT/XgA2XKc3nHkC+bVgXQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749142331; c=relaxed/simple;
	bh=VpcEBVNC21JC5Msk2yds3N0lyIBTNcNe4xVainlsMXg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=W9TBafJPJ+gBiou74zpIX8gc71QD1WbqEX8CLlY6i9bLF5BdzQK2mdEL45ULj+3v0R/3atWyo9FXFs4OcnOblfuzSj1GRx3OjbVmnqcYehvyRq+ElZDSnSKSr3cQp2yHGmqqLmtbkTNSPNB1y1b2llXmNH95hYRSkvKqheuC0AM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ePFBovm9; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ePFBovm9"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-606bbe60c01so2104417a12.2;
        Thu, 05 Jun 2025 09:52:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749142327; x=1749747127; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CD+XqO7uiA4B8SRIrfEANEO7Ju8rb7t0jy0+jDQzXmQ=;
        b=ePFBovm93iA6tKsbJU5dBMCo1RY1rwr6v4uwHw56jxC5ROL8n4Emq2HeNSYEM0l9+X
         5ikHn39PnNjvk5wbpCRAPTunkhSRzXNS5pP3amW6a+hN3dRVjkdMLMN6kWxf4smNMjmn
         +VmEDDVHsreOq2beeTe0BInRoAK+G/MD2cz3zstwh3JvbzI1U877z9DtIeEym7QWBGkZ
         u+OZAkcYJGnkqNUbQuhuR9ZzYisGt2bMasn/Fn61k1rQRvH5ujbRml9JdNt0Fq24LbSW
         CC1smVGIhGZr6cmDU3gwIEYZ4w4QQCvrU0vIR1Ip+39FCF2gps+6NZkpM6zz+j0gyaYX
         +Kpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749142327; x=1749747127;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CD+XqO7uiA4B8SRIrfEANEO7Ju8rb7t0jy0+jDQzXmQ=;
        b=bBc2cpEY0StJOpfsSeeiSbWXMFZC0I1turFaCLSgisA+UPRxqCu80rMPcsa8B1tsjz
         WCxruaIaW5e0WLPl2w55AcrO2H7HeP+Yt9SgHzQAsamNcEFm/uMrc05QC2Cvcbjkxi8j
         2XYLdLdZpN+gb8Xlcl7SDFVHprTgbkNlaFrBxwsJW7rVBBxU8as6xsgW9I/7t6hxGDl3
         Y1pDk0O2yNEj+sB7P3lPA3EGHI1f+c1VDs2viPIjk3c/mK+ex7saz31r5GEbQCYVSxGz
         4ymik4PGVCN8AvdcppI9Ew86sWb2W4gLk87HmhIZvmbs7TUnAK9fwvgyJdCvoEyjjfII
         5yKQ==
X-Forwarded-Encrypted: i=1; AJvYcCVtUYjxIZVlNeRqBDT0B33ipZbNmiOk/60z2oZItLUvoKlSf/0KIcjuUmpL4514H/VRZ1rq2iZwyrIdF9s=@vger.kernel.org, AJvYcCXduayMIWs0KYgds00RR5TYQxAa9a4jq3nCkgdAZj8aJdDTn9DQVsLkUfEphFychNqDxvXJ/zNlZcqgn/FBZ8A=@vger.kernel.org
X-Gm-Message-State: AOJu0YwVUZY+q/Oql1aT2MCy1ajdfJypR9b6LZdO3Qf6KaCwnEEhXUKe
	/S0p7RFx04RuYSyF62VKIlPLr7GCtGcqUujRgCFblH9hxHC4BdnyhBTAUgkfKPx2
X-Gm-Gg: ASbGncs7LYBI6suDUVxxrW+K0jeudfFsr4bLgUIgkudusqKny/JRDLWDlLlXjQ8kJH7
	qpApkw+wAeO/L2iO6tqZqjLPYrQCCllu9SfEp7vJHNH+uVgqUJ2GVLLFbdTa3sXHlZIlFde98uu
	75KHlGhiFcSotCkIpDZbpqg2TqXXuzgm774iAJBqgWpyigBg/bBmOf4+EtexFzllOaDOSPIjfMh
	o0olH1+uIFpocipqzdNGq0yGZF6m23f4l/LplNOhNjaVKxi696EpkYthtgMzEOet7XEm4g4X+sJ
	sxCZkjgxRp0DHiM8aO1Ci21eTsFswFlxMaSHVfXxftVD7ZuctbxbGNfjoG28
X-Google-Smtp-Source: AGHT+IEqzMx0urp30LIPaIhQ5MwDjILG8Jx1X5JZdDcau+kxo1zIhFaCVWo/fwmj68GIaBh+1YIBtg==
X-Received: by 2002:a05:6402:5c8:b0:604:e33f:e5c0 with SMTP id 4fb4d7f45d1cf-606ea15f6bfmr7506803a12.30.1749142326966;
        Thu, 05 Jun 2025 09:52:06 -0700 (PDT)
Received: from [10.5.1.144] ([193.170.134.247])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6070a0b401dsm2012290a12.73.2025.06.05.09.52.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Jun 2025 09:52:06 -0700 (PDT)
Message-ID: <89066f83-db7f-405c-b3b5-ce553f8e6b48@gmail.com>
Date: Thu, 5 Jun 2025 18:52:05 +0200
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
 <3c1c0563-7f48-4222-a28d-316f885bcad4@gmail.com>
 <DAEQ7VRHEP4W.4O0KV31IPJFG@kernel.org>
Content-Language: en-US, de-DE
From: Christian Schrefl <chrisi.schrefl@gmail.com>
In-Reply-To: <DAEQ7VRHEP4W.4O0KV31IPJFG@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05.06.25 6:05 PM, Benno Lossin wrote:
> On Thu Jun 5, 2025 at 4:57 PM CEST, Christian Schrefl wrote:
>> On 04.06.25 1:29 AM, Benno Lossin wrote:
>>> On Mon Jun 2, 2025 at 11:16 PM CEST, Christian Schrefl wrote:
>>>> On 31.05.25 2:23 PM, Benno Lossin wrote:
>>>>> On Fri May 30, 2025 at 10:46 PM CEST, Christian Schrefl wrote:
>>>>>> +// SAFETY:
>>>>>> +// - All `&self` methods on this type are written to ensure that it is safe to call them in
>>>>>> +//   parallel.
>>>>>> +// - `MiscDevice::RegistrationData` is always `Sync`.
>>>>>> +unsafe impl<T: MiscDevice> Sync for MiscDeviceRegistration<T> {}
>>>>>
>>>>> I would feel better if we still add the `T::RegistrationData: Sync`
>>>>> bound here even if it is vacuous today.
>>>>
>>>> Since a reference the `MiscDeviceRegistration` struct is an
>>>> argument to the open function this struct must always be Sync,
>>>> so adding bounds here doesn't make much sense.
>>>
>>> Well yes, but this statement makes `MiscDeviceRegistration` be `Sync`
>>> even if `T::RegistrationData` is not `Sync` if that bound got removed
>>> at some point. And this "instability" is what I'm worried about.
>>>
>>>> I'll add this a safety comment in `MiscdeviceVTable::open`
>>>> about this.
>>>>
>>>> Is there a good way to assert this at build to avoid regessions?
>>>
>>>     const _: () = {
>>>         fn assert_sync<T: ?Sized + Sync>() {}
>>>         fn ctx<T: MiscDevice>() {
>>>             assert_sync::<T::RegistrationData>();
>>>         }
>>>     };
>>>
>>
>> I'll add the bound and a TODO about `assert_sync`, in `open`
>> where `Send` is required.
>>
>> I intend to write a patch for `assert_sync` later.
> 
> Great :)
> 
>>> That would also be fine with me if you insist on not adding the bound.
>>>
>>> (the `assert_sync` function should maybe be somewhere where everyone can
>>> use it)
>>>
>>>>>>  impl<T: MiscDevice> MiscDeviceRegistration<T> {
>>>>>>      /// Register a misc device.
>>>>>> -    pub fn register(opts: MiscDeviceOptions) -> impl PinInit<Self, Error> {
>>>>>> +    pub fn register(
>>>>>> +        opts: MiscDeviceOptions,
>>>>>> +        data: impl PinInit<T::RegistrationData, Error>,
>>>>>> +    ) -> impl PinInit<Self, Error> {
>>>>>>          try_pin_init!(Self {
>>>>>> +            data <- Opaque::pin_init(data),
>>>>>>              inner <- Opaque::try_ffi_init(move |slot: *mut bindings::miscdevice| {
>>>>>>                  // SAFETY: The initializer can write to the provided `slot`.
>>>>>>                  unsafe { slot.write(opts.into_raw::<T>()) };
>>>>>>  
>>>>>> -                // SAFETY: We just wrote the misc device options to the slot. The miscdevice will
>>>>>> -                // get unregistered before `slot` is deallocated because the memory is pinned and
>>>>>> -                // the destructor of this type deallocates the memory.
>>>>>> +                // SAFETY:
>>>>>> +                // * We just wrote the misc device options to the slot. The miscdevice will
>>>>>> +                //   get unregistered before `slot` is deallocated because the memory is pinned and
>>>>>> +                //   the destructor of this type deallocates the memory.
>>>>>> +                // * `data` is Initialized before `misc_register` so no race with `fops->open()`
>>>>>> +                //   is possible.
>>>>>>                  // INVARIANT: If this returns `Ok(())`, then the `slot` will contain a registered
>>>>>>                  // misc device.
>>>>>>                  to_result(unsafe { bindings::misc_register(slot) })
>>>>>> @@ -93,13 +108,24 @@ pub fn device(&self) -> &Device {
>>>>>>          // before the underlying `struct miscdevice` is destroyed.
>>>>>>          unsafe { Device::as_ref((*self.as_raw()).this_device) }
>>>>>>      }
>>>>>> +
>>>>>> +    /// Access the additional data stored in this registration.
>>>>>> +    pub fn data(&self) -> &T::RegistrationData {
>>>>>> +        // SAFETY:
>>>>>> +        // * No mutable reference to the value contained by `self.data` can ever be created.
>>>>>> +        // * The value contained by `self.data` is valid for the entire lifetime of `&self`.
>>>>>
>>>>> Please add type invariants for these two requirements.
>>>>>
>>>>>> +        unsafe { &*self.data.get() }
>>>>>> +    }
>>>>>>  }
>>>>>>  
>>>>>>  #[pinned_drop]
>>>>>> -impl<T> PinnedDrop for MiscDeviceRegistration<T> {
>>>>>> +impl<T: MiscDevice> PinnedDrop for MiscDeviceRegistration<T> {
>>>>>>      fn drop(self: Pin<&mut Self>) {
>>>>>>          // SAFETY: We know that the device is registered by the type invariants.
>>>>>>          unsafe { bindings::misc_deregister(self.inner.get()) };
>>>>>> +
>>>>>> +        // SAFETY: `self.data` is valid for dropping and nothing uses it anymore.
>>>>>
>>>>> Ditto.
>>>>
>>>> I'm not quite sure how to formulate these, what do you think of:
>>>>
>>>> /// - `inner` is a registered misc device.
>>>
>>> This doesn't really mean something to me, maybe it's better to reference
>>> the registering function?
>>
>> That is from previous code so this should probably not be changed
>> in this series.
> 
> I personally wouldn't mind a commit that fixes this up, but if you don't
> want to do it, let me know then we can make this a good-first-issue.

I can do it, but I think it would make a good-first-issue so lets go
with that for now.

> 
>>>> /// - `data` contains a valid `T::RegistrationData` for the whole lifetime of [`MiscDeviceRegistration`]
>>>
>>> This sounds good. But help me understand, why do we need `Opaque` /
>>> `UnsafePinned` again? If we're only using shared references, then we
>>> could also just store the object by value?
>>
>> Since the Module owns the `MiscDeviceRegistration` it may create `&mut MiscDeviceRegistration`,
>> so from what I understand having a `& RegistrationData` reference into that is UB without
>> `UnsafePinned` (or `Opaque` since that includes `UnsafePinned` semantics).
> 
> And the stored `T::RegistrationData` is shared as read-only with the C
> side? Yes in that case we want `UnsafePinned<UnsafeCell<>>` (or for the
> moment `Opaque`).

Not really shared with the C side, but with the `open` implementation in
`MiscDevice` that is (indirectly) called by C. (`UnsafeCell` will probably not be
needed, as `UnsafePinned` will almost certainly have `UnsafeCell` semantics in upstream).

Thinking about this has made me realize that the current code already is a bit
iffy, since `MiscDevice::open` gets `&MiscDeviceRegistration<Self>` as an argument. (It
should be fine since `UnsafeCell` and `UnsafePinned` semantics also apply to "parrent" types
i.e. `&MiscDeviceRegistration` also has the semantics of `Opaque`).

> 
>>>> /// - `data` must be usable until `misc_deregister` (called when dropped) has returned.
>>>
>>> What does "usable" mean?
>>
>> I guess valid / alive might be better wording?
>>
>> I meant to say that the `fops` functions might use the `RegistrationData` until 
>> `misc_deregister` has returned so we must ensure that these accesses are allowed.  
> 
> Then use `valid`.

Alright.

> 
>>>> /// - no mutable references to `data` may be created.
>>>
>>>>>> +        unsafe { core::ptr::drop_in_place(self.data.get()) };
>>>>>>      }
>>>>>>  }
>>>>>>  
>>>>>> @@ -109,6 +135,13 @@ pub trait MiscDevice: Sized {
>>>>>>      /// What kind of pointer should `Self` be wrapped in.
>>>>>>      type Ptr: ForeignOwnable + Send + Sync;
>>>>>>  
>>>>>> +    /// The additional data carried by the [`MiscDeviceRegistration`] for this [`MiscDevice`].
>>>>>> +    /// If no additional data is required than the unit type `()` should be used.
>>>>>> +    ///
>>>>>> +    /// This data can be accessed in [`MiscDevice::open()`] using
>>>>>> +    /// [`MiscDeviceRegistration::data()`].
>>>>>> +    type RegistrationData: Sync;
>>>>>
>>>>> Why do we require `Sync` here?
>>>>
>>>> Needed for `MiscDeviceRegistration` to be `Send`, see response above.
>>>
>>> You could also just ask the type there to be `Sync`, then users will get
>>> an error when they try to use `MiscDevice` in a way where
>>> `RegistrationData` is required to be `Sync`.
>>
>> I don't think there is any point to allow defining a `MiscDevice` implementation
>> that cant actually be used/registered.
> 
> Sure, but the bound asserting that it is `Sync` doesn't need to be here,
> having it just on the `impl Sync for MiscDeviceRegistration` is good
> enough. (though one could argue that people would get an earlier error
> if it is already asserted here. I think we should have some general
> guidelines here :)

That would require a `Send` bound in the `register` function,
since a `MiscDevice` with `!Sync` `Data` would be valid now
(meaning that `MiscDeviceRegistration` may also be `!Sync`).

If you want I can go with that. I'm not really sure if its
really better (tough I don't feel that strongly either
way).

> 
>>>>> We might want to give this a shorter name?
>>>>
>>>> I think its fine, but I am open to Ideas.
>>>
>>> `Data`?
>>
>> I feel that `Data` is just very ambiguous, especially since it is associated with 
>> `MiscDevice` not the `MiscDeviceRegistration` in which its used.
> 
> But it is the data of the MiscDevice, no?
> 
>> One Idea I've had was `AssociatedData` but that's less clear and not much shorter
>> than `RegistrationData`.
> 
> Of the two, I'd prefer `RegistrationData`.
> 
>> But I'd be alright to just with `Data` if that is wanted.
> 
> If you think that `RegistrationData` is more clear then go with that.
> But I honestly don't derive much meaning from that over just `Data`. You
> can still of course mention in the docs that this data is stored in the
> registration.
> 
> But since there is no other way to associate data to a `MiscDevice`, I
> think it makes sense to call it `Data`.
> 

Alright I'll go with `Data` then.

> ---
> Cheers,
> Benno

