Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41AB713D521;
	Thu,  5 Jun 2025 17:27:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749144429; cv=none; b=iQn6dMt/s2nNoXI1VxO5xNF6zjni9Cr8IkB19QefcK+7drDATf5hOIQcwMHMnzwQms+KPvhzdPTJY4VniXyG9AuCeCdND+WQRB24nC62UbFQqwGUmtW9X5G0JkjMj7UlOitWQPN87YOOXFOsxETyVYybir8xIl3mU/JdlE282Ok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749144429; c=relaxed/simple;
	bh=qhhsf28tLC9W5bYRZe+HBHM2rQskAaB3uTZkwcVqSRU=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=J2r1q/tHznr5ALQ2TKaWB+ju+qTY7iOmqD/C1jsgEmsthnznP7SJCSf/N5SmBro10evLPePFsndVop3OVtZbPuCWtmQShkCiJrtNB6yZy3Mvg2z+9FvNUHEwql2cXSryeW8XX4GlFERalfsyYYZj7MkaXxPCeGq22KLnSBr+hqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sr4HCN+W; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sr4HCN+W"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 927A2C4CEE7;
	Thu,  5 Jun 2025 17:27:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749144428;
	bh=qhhsf28tLC9W5bYRZe+HBHM2rQskAaB3uTZkwcVqSRU=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=sr4HCN+WmvEP9chhht8q/IMJHxYfjspTZmTUpJQ6KyFPYCFSRYzanSS1cgwL/qISL
	 uVS2yawsSNjMvDmCHM5CElEKfF2+gCaBHSPlRuqzgz8PZ3PGBRHOz9+5RGsISO9eY0
	 5f7TjVBepBMdgVdSkXejubTfSpuCN8dqZNu84qC/Yzr1wNp+CefhcBQ4TDOEe4U8gd
	 0CW1TsF4YLLlUnzs9QMzi5TZ1uwBCSouVtPMUs0GZl/JG3aiH/Vot7s+XYC5rwXWC/
	 qNLNv9gsqUi9krChdvfzRXACBZIjpcDwKiLg9ovr+xMsP4h8xSeQ9U1xJLDNHeALGZ
	 KuPRTv8DPXbbQ==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 05 Jun 2025 19:27:03 +0200
Message-Id: <DAERY78ROO76.2WSPPIC01XQ5H@kernel.org>
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
References: <20250530-b4-rust_miscdevice_registrationdata-v4-0-d313aafd7e59@gmail.com> <20250530-b4-rust_miscdevice_registrationdata-v4-2-d313aafd7e59@gmail.com> <DAACCYW3QRQE.1O75L2SHJYVPM@kernel.org> <3eef5777-9190-4782-8433-7b6ad4b9acd3@gmail.com> <DADAEIT9E1R8.1J69W5DKYAQGY@kernel.org> <3c1c0563-7f48-4222-a28d-316f885bcad4@gmail.com> <DAEQ7VRHEP4W.4O0KV31IPJFG@kernel.org> <89066f83-db7f-405c-b3b5-ce553f8e6b48@gmail.com>
In-Reply-To: <89066f83-db7f-405c-b3b5-ce553f8e6b48@gmail.com>

On Thu Jun 5, 2025 at 6:52 PM CEST, Christian Schrefl wrote:
> On 05.06.25 6:05 PM, Benno Lossin wrote:
>> On Thu Jun 5, 2025 at 4:57 PM CEST, Christian Schrefl wrote:
>>> On 04.06.25 1:29 AM, Benno Lossin wrote:
>>>> On Mon Jun 2, 2025 at 11:16 PM CEST, Christian Schrefl wrote:
>>>>> On 31.05.25 2:23 PM, Benno Lossin wrote:
>>>>>> On Fri May 30, 2025 at 10:46 PM CEST, Christian Schrefl wrote:
>>>>>>>  #[pinned_drop]
>>>>>>> -impl<T> PinnedDrop for MiscDeviceRegistration<T> {
>>>>>>> +impl<T: MiscDevice> PinnedDrop for MiscDeviceRegistration<T> {
>>>>>>>      fn drop(self: Pin<&mut Self>) {
>>>>>>>          // SAFETY: We know that the device is registered by the ty=
pe invariants.
>>>>>>>          unsafe { bindings::misc_deregister(self.inner.get()) };
>>>>>>> +
>>>>>>> +        // SAFETY: `self.data` is valid for dropping and nothing u=
ses it anymore.
>>>>>>
>>>>>> Ditto.
>>>>>
>>>>> I'm not quite sure how to formulate these, what do you think of:
>>>>>
>>>>> /// - `inner` is a registered misc device.
>>>>
>>>> This doesn't really mean something to me, maybe it's better to referen=
ce
>>>> the registering function?
>>>
>>> That is from previous code so this should probably not be changed
>>> in this series.
>>=20
>> I personally wouldn't mind a commit that fixes this up, but if you don't
>> want to do it, let me know then we can make this a good-first-issue.
>
> I can do it, but I think it would make a good-first-issue so lets go
> with that for now.

Feel free to open the issue :)

>>>>> /// - `data` contains a valid `T::RegistrationData` for the whole lif=
etime of [`MiscDeviceRegistration`]
>>>>
>>>> This sounds good. But help me understand, why do we need `Opaque` /
>>>> `UnsafePinned` again? If we're only using shared references, then we
>>>> could also just store the object by value?
>>>
>>> Since the Module owns the `MiscDeviceRegistration` it may create `&mut =
MiscDeviceRegistration`,
>>> so from what I understand having a `& RegistrationData` reference into =
that is UB without
>>> `UnsafePinned` (or `Opaque` since that includes `UnsafePinned` semantic=
s).
>>=20
>> And the stored `T::RegistrationData` is shared as read-only with the C
>> side? Yes in that case we want `UnsafePinned<UnsafeCell<>>` (or for the
>> moment `Opaque`).
>
> Not really shared with the C side, but with the `open` implementation in
> `MiscDevice` that is (indirectly) called by C. (`UnsafeCell` will probabl=
y not be
> needed, as `UnsafePinned` will almost certainly have `UnsafeCell` semanti=
cs in upstream).

Ah yes, I meant "shared with other Rust code through the C side" ie the
pointer round-trips through C (that isn't actually relevant, but that's
why I mentioned C).

> Thinking about this has made me realize that the current code already is =
a bit
> iffy, since `MiscDevice::open` gets `&MiscDeviceRegistration<Self>` as an=
 argument. (It
> should be fine since `UnsafeCell` and `UnsafePinned` semantics also apply=
 to "parrent" types
> i.e. `&MiscDeviceRegistration` also has the semantics of `Opaque`).

It's fine, since all non-ZST fields are `Opaque`. Otherwise we'd need to
wrap all fields with that.

>>>>> /// - no mutable references to `data` may be created.
>>>>
>>>>>>> +        unsafe { core::ptr::drop_in_place(self.data.get()) };
>>>>>>>      }
>>>>>>>  }
>>>>>>> =20
>>>>>>> @@ -109,6 +135,13 @@ pub trait MiscDevice: Sized {
>>>>>>>      /// What kind of pointer should `Self` be wrapped in.
>>>>>>>      type Ptr: ForeignOwnable + Send + Sync;
>>>>>>> =20
>>>>>>> +    /// The additional data carried by the [`MiscDeviceRegistratio=
n`] for this [`MiscDevice`].
>>>>>>> +    /// If no additional data is required than the unit type `()` =
should be used.
>>>>>>> +    ///
>>>>>>> +    /// This data can be accessed in [`MiscDevice::open()`] using
>>>>>>> +    /// [`MiscDeviceRegistration::data()`].
>>>>>>> +    type RegistrationData: Sync;
>>>>>>
>>>>>> Why do we require `Sync` here?
>>>>>
>>>>> Needed for `MiscDeviceRegistration` to be `Send`, see response above.
>>>>
>>>> You could also just ask the type there to be `Sync`, then users will g=
et
>>>> an error when they try to use `MiscDevice` in a way where
>>>> `RegistrationData` is required to be `Sync`.
>>>
>>> I don't think there is any point to allow defining a `MiscDevice` imple=
mentation
>>> that cant actually be used/registered.
>>=20
>> Sure, but the bound asserting that it is `Sync` doesn't need to be here,
>> having it just on the `impl Sync for MiscDeviceRegistration` is good
>> enough. (though one could argue that people would get an earlier error
>> if it is already asserted here. I think we should have some general
>> guidelines here :)
>
> That would require a `Send` bound in the `register` function,
> since a `MiscDevice` with `!Sync` `Data` would be valid now
> (meaning that `MiscDeviceRegistration` may also be `!Sync`).
>
> If you want I can go with that. I'm not really sure if its
> really better (tough I don't feel that strongly either
> way).

We don't lose anything by doing this, so I think we should do it.
If in the future someone invents a way `MiscDevice` that's only in the
current thread and it can be registered (so like a "thread-local"
`MiscDevice` :), then this will be less painful to change.

---
Cheers,
Benno
