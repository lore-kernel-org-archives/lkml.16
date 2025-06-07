Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B581B20AF9A;
	Sat,  7 Jun 2025 11:34:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749296058; cv=none; b=X3mcGR4MPgGQbGJ9n5b60qXDudUaXIAOBgCCNWMrFyNed9ZA7o8i6wdz7rOsjIg6/n1p2VcU175VvW4FNtXjxiaWVeU2C0eQJfqeM3UIcAxw/mANuJSpj5e5FKwoZ5y1b3ukLoDoP5gduJLBb5wFFZx2Yfi3QG5A3gY16nMQlws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749296058; c=relaxed/simple;
	bh=2iEX22Qgeeywv6X8vOQY2z7W6RgQbsq70uFOkSFJIdM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aT1UldTQ4NMKRpCSJ0SW5O+srOat5x6JtRYNheeSGXXldI/RRbS7cn05q0/uX98mopax8sXTH56r1EOMVTagM50g61f3tsYoOjVGJwn4hpCRHOY4xExNiDvTCMMecF8dcV0m0LIqAZ3O3TBkm1GsMwE75XbI67uCrpSV6+gEk+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EAQkVMTE; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EAQkVMTE"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3a36e090102so1778371f8f.2;
        Sat, 07 Jun 2025 04:34:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749296055; x=1749900855; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vboVAmpFsqg3CGAMmqx8CAfmn1Bpd6R599tczZBOFyk=;
        b=EAQkVMTEmMCkDn7/lRkkmlh4Jjzcw5mWFui7ejx8sWWvt8w5Pi6TXz2yP/oxYSZZfU
         S6PhVjCIBiRPBzZ4VQh5Ra2ptqqTyfI/nIFIX64XG972qovJQVgtRXvGWfmrb0xP00/U
         zS/f/5/DjUU9JyNyEKK/vnGGc0i2EfuDhUlmb7NpAdZm7+bNQAUgnigJMAhH2EPy5EEH
         6CHjo5b7LeigvjkLgioz0ckNcLEtxsWZ4G7Yx8Oa+kFwJUeESTNrM6c8AUwWnKoxfh8A
         +up0pUK0rohEWDL/p3oCNqqtMKvaRyho/m01Ye0KuH3FehkyiG0chjQKlrSNlqFfjv+T
         xSjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749296055; x=1749900855;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vboVAmpFsqg3CGAMmqx8CAfmn1Bpd6R599tczZBOFyk=;
        b=NE9AxGWUkiI5gtBrzYP06EoQn7ZeK8adYOwyOzql3y9LhE3RxxS42difbcwsM4ZtMU
         EaV5+Tztn+ZsOMaxUZW/xGbcN1HMGeshfZYWFE1vcMBBQkvaEQDLFhRjG8zPotDLLGUU
         sQdMVDtWXh7JRdzvVtGuR0q468LfZ3vo6qcMmaILvdhJZrA8hA610Uos49TcScP/mbuO
         vSQLetzgBGceO5c1IVL4CHjpY4iKtyLiix1tdj7nxff8Vy+aLFdv9ERFqWNZE76YTx2w
         ehS6ajlqFUv50mZNy6P5WWtaYbcZbPK5DgA2lOYa9pcSZ5JZ4NkQMzL91n3YKdw5KVlp
         PVqA==
X-Forwarded-Encrypted: i=1; AJvYcCWlfRvFKmHoiAoY0g6sJCTYg/4SHKlEMbOgsVH5cIjvMp5h+IrIv8WA4zw2HduootTBh4AB/Bw5KPQ2AfI=@vger.kernel.org, AJvYcCXD1CYewksEwFhx4e5C2mlHEKDwIRcg9N79kmLu8I9XoKLpWDm5wRiNG4IbN0AkIv+fLUhlNyefkU+F7W7qxII=@vger.kernel.org
X-Gm-Message-State: AOJu0YwUG/rIq5qDJVXV9/rueTtsipO+HUY0EzMONHzQ/bjHxM0Rchsz
	3DBq2lRcMM3o9KaNXASI2gUgsj3qLdB4gRBCytS+5Xb60v9jgFTTNx2U
X-Gm-Gg: ASbGnctvomQvmsDI+2dsfzJI96Eht7WgIQvDndRZxotWVz5bZd+ADwCaOkJd13KzjS0
	d8O85eQsvxUtkQ0uOwTa5fQ+Mt6X/Y32wf6RKtnNuX9blks0c1Dj7hRIub3zg0ni4EqTnU2iEt/
	yf1y80zc+3v7Msxz9H86ykMt3n0w46NC8F+KHDLAkHYwFZuk79nPKRRl6WgOPoKm/c41daUy3Yj
	kHqHt2Ua89Hc930oCZnVIRP8TVzIC1f77Yw+fvxm/iJqWaaaIf/mHkq0Gjvol0b/SXHSZm/RjzW
	IrTlDnTXmSr305vpgr6hyQ0QvfjS/nOqnQwDNoXrnyZnPTGbED3CgtV1w0WX0eXvAoNSLJlpUCM
	=
X-Google-Smtp-Source: AGHT+IFW/e2Vsa8uYU1XGeXMAiZFne8VpCCuWVnRQ/dhAWqmLX5rT5lvPEvMzYy/ZeWNnMVF5FbDxg==
X-Received: by 2002:a05:6000:2305:b0:3a4:f722:f00b with SMTP id ffacd0b85a97d-3a53188a524mr5548011f8f.11.1749296054728;
        Sat, 07 Jun 2025 04:34:14 -0700 (PDT)
Received: from ?IPV6:2001:871:22a:3372::171c? ([2001:871:22a:3372::171c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-452137290b9sm54356135e9.34.2025.06.07.04.34.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 07 Jun 2025 04:34:14 -0700 (PDT)
Message-ID: <8f491c61-e7b2-4a1f-b4f8-8ff691015655@gmail.com>
Date: Sat, 7 Jun 2025 13:34:11 +0200
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
 <89066f83-db7f-405c-b3b5-ce553f8e6b48@gmail.com>
 <DAERY78ROO76.2WSPPIC01XQ5H@kernel.org>
Content-Language: en-US, de-DE
From: Christian Schrefl <chrisi.schrefl@gmail.com>
In-Reply-To: <DAERY78ROO76.2WSPPIC01XQ5H@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05.06.25 7:27 PM, Benno Lossin wrote:
> On Thu Jun 5, 2025 at 6:52 PM CEST, Christian Schrefl wrote:
>> On 05.06.25 6:05 PM, Benno Lossin wrote:
>>> On Thu Jun 5, 2025 at 4:57 PM CEST, Christian Schrefl wrote:
>>>> On 04.06.25 1:29 AM, Benno Lossin wrote:
>>>>> On Mon Jun 2, 2025 at 11:16 PM CEST, Christian Schrefl wrote:
>>>>>> On 31.05.25 2:23 PM, Benno Lossin wrote:
>>>>>>> On Fri May 30, 2025 at 10:46 PM CEST, Christian Schrefl wrote:
>>>>>>>>  #[pinned_drop]
>>>>>>>> -impl<T> PinnedDrop for MiscDeviceRegistration<T> {
>>>>>>>> +impl<T: MiscDevice> PinnedDrop for MiscDeviceRegistration<T> {
>>>>>>>>      fn drop(self: Pin<&mut Self>) {
>>>>>>>>          // SAFETY: We know that the device is registered by the type invariants.
>>>>>>>>          unsafe { bindings::misc_deregister(self.inner.get()) };
>>>>>>>> +
>>>>>>>> +        // SAFETY: `self.data` is valid for dropping and nothing uses it anymore.
>>>>>>>
>>>>>>> Ditto.
>>>>>>
>>>>>> I'm not quite sure how to formulate these, what do you think of:
>>>>>>
>>>>>> /// - `inner` is a registered misc device.
>>>>>
>>>>> This doesn't really mean something to me, maybe it's better to reference
>>>>> the registering function?
>>>>
>>>> That is from previous code so this should probably not be changed
>>>> in this series.
>>>
>>> I personally wouldn't mind a commit that fixes this up, but if you don't
>>> want to do it, let me know then we can make this a good-first-issue.
>>
>> I can do it, but I think it would make a good-first-issue so lets go
>> with that for now.
> 
> Feel free to open the issue :)

I've opened [0]. I don't have the permissions to add tags for that.
[0]: https://github.com/Rust-for-Linux/linux/issues/1168

> 
>>>>>> /// - `data` contains a valid `T::RegistrationData` for the whole lifetime of [`MiscDeviceRegistration`]
>>>>>
>>>>> This sounds good. But help me understand, why do we need `Opaque` /
>>>>> `UnsafePinned` again? If we're only using shared references, then we
>>>>> could also just store the object by value?
>>>>
>>>> Since the Module owns the `MiscDeviceRegistration` it may create `&mut MiscDeviceRegistration`,
>>>> so from what I understand having a `& RegistrationData` reference into that is UB without
>>>> `UnsafePinned` (or `Opaque` since that includes `UnsafePinned` semantics).
>>>
>>> And the stored `T::RegistrationData` is shared as read-only with the C
>>> side? Yes in that case we want `UnsafePinned<UnsafeCell<>>` (or for the
>>> moment `Opaque`).
>>
>> Not really shared with the C side, but with the `open` implementation in
>> `MiscDevice` that is (indirectly) called by C. (`UnsafeCell` will probably not be
>> needed, as `UnsafePinned` will almost certainly have `UnsafeCell` semantics in upstream).
> 
> Ah yes, I meant "shared with other Rust code through the C side" ie the
> pointer round-trips through C (that isn't actually relevant, but that's
> why I mentioned C).
> 
>> Thinking about this has made me realize that the current code already is a bit
>> iffy, since `MiscDevice::open` gets `&MiscDeviceRegistration<Self>` as an argument. (It
>> should be fine since `UnsafeCell` and `UnsafePinned` semantics also apply to "parrent" types
>> i.e. `&MiscDeviceRegistration` also has the semantics of `Opaque`).
> 
> It's fine, since all non-ZST fields are `Opaque`. Otherwise we'd need to
> wrap all fields with that.

Yeah I understand that its not UB, but to me it seems a bit fragile and opaque why it is allowed.
That's what I meant by "a bit iffy".

> 
>>>>>> /// - no mutable references to `data` may be created.
>>>>>
>>>>>>>> +        unsafe { core::ptr::drop_in_place(self.data.get()) };
>>>>>>>>      }
>>>>>>>>  }
>>>>>>>>  
>>>>>>>> @@ -109,6 +135,13 @@ pub trait MiscDevice: Sized {
>>>>>>>>      /// What kind of pointer should `Self` be wrapped in.
>>>>>>>>      type Ptr: ForeignOwnable + Send + Sync;
>>>>>>>>  
>>>>>>>> +    /// The additional data carried by the [`MiscDeviceRegistration`] for this [`MiscDevice`].
>>>>>>>> +    /// If no additional data is required than the unit type `()` should be used.
>>>>>>>> +    ///
>>>>>>>> +    /// This data can be accessed in [`MiscDevice::open()`] using
>>>>>>>> +    /// [`MiscDeviceRegistration::data()`].
>>>>>>>> +    type RegistrationData: Sync;
>>>>>>>
>>>>>>> Why do we require `Sync` here?
>>>>>>
>>>>>> Needed for `MiscDeviceRegistration` to be `Send`, see response above.
>>>>>
>>>>> You could also just ask the type there to be `Sync`, then users will get
>>>>> an error when they try to use `MiscDevice` in a way where
>>>>> `RegistrationData` is required to be `Sync`.
>>>>
>>>> I don't think there is any point to allow defining a `MiscDevice` implementation
>>>> that cant actually be used/registered.
>>>
>>> Sure, but the bound asserting that it is `Sync` doesn't need to be here,
>>> having it just on the `impl Sync for MiscDeviceRegistration` is good
>>> enough. (though one could argue that people would get an earlier error
>>> if it is already asserted here. I think we should have some general
>>> guidelines here :)
>>
>> That would require a `Send` bound in the `register` function,
>> since a `MiscDevice` with `!Sync` `Data` would be valid now
>> (meaning that `MiscDeviceRegistration` may also be `!Sync`).
>>
>> If you want I can go with that. I'm not really sure if its
>> really better (tough I don't feel that strongly either
>> way).
> 
> We don't lose anything by doing this, so I think we should do it.
> If in the future someone invents a way `MiscDevice` that's only in the
> current thread and it can be registered (so like a "thread-local"
> `MiscDevice` :), then this will be less painful to change.

Alright but I doubt that realistic, since the `Data` would always at
least be shared between the owner of `MiscDeviceRegistration` and the
`fops` implementation. Meaning its always shared with syscall context
and I don't think it makes sense to have a registration owed in 
that context.

Cheers
Christian
