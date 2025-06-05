Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCE057462;
	Thu,  5 Jun 2025 16:05:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749139545; cv=none; b=bGtHREQi5a2PyuJYmT+Pswiz+LZrH4c6qGg4NI0Fs1109kvifwpXFzZVM/pswnj3Mblg8mCTjp3K5dWSYuV7cqtpOumaAku+ly06sv/XvGCYy05mQYYtoZUGFZaDQOFJEpTmZToP7INsw54evIwNNa/OHjZB08t+ucc86veTIL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749139545; c=relaxed/simple;
	bh=11cVIudVWN6/ePt5kA4lrhZW+ZPVx+VEnQOgkKzmrBM=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=Ul9gkEH5R/We6R1LGofsJX8ILPhQzWvBuw2wem6xxOjWWSutxkjcPKhSGHJOc4DyeirXvbqpz7GE60W4XFMuY1pzeGm3v77ZITEJE913oMHVIUquYxaGW0wahoX3TgPdTG3rXTJ9UtSd8xGRCHRhaX9TmHcp3D6SYbNlCP+lRF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M9RXn8V/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M9RXn8V/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 193EDC4CEE7;
	Thu,  5 Jun 2025 16:05:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749139545;
	bh=11cVIudVWN6/ePt5kA4lrhZW+ZPVx+VEnQOgkKzmrBM=;
	h=Date:To:Cc:Subject:From:References:In-Reply-To:From;
	b=M9RXn8V/xKhyWJBB0LnxFWU1bEityvzklihzEKo620vd2I4AfS9zfQPpAtRCyhWoI
	 EXxCgW6wG4mJMhxC00N1+1hNcGUpzKhVntjLVlVJGJYGBFlUuYsau9sSJXiSdK63gj
	 7phOJt5EIlE5Fv63XEJD+W9YzdtaN3Lt6yvxKAReDDKXOSRXpuGvdatI0IPbiiTSmS
	 L9mbKqKBy9mtYM1pv4Qh+eP37w+SFopZ62537Sxhb8uDwPhAuU3cjo3Takef2HDB7V
	 1Mol0bmPLnzC+s2E7bS43upvBxM/88HnBYGBpxESInhMO4DEXDJa8amHW4jmqsMkfB
	 YWkdXb0hmo8Dg==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 05 Jun 2025 18:05:40 +0200
Message-Id: <DAEQ7VRHEP4W.4O0KV31IPJFG@kernel.org>
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
From: "Benno Lossin" <lossin@kernel.org>
X-Mailer: aerc 0.20.1
References: <20250530-b4-rust_miscdevice_registrationdata-v4-0-d313aafd7e59@gmail.com> <20250530-b4-rust_miscdevice_registrationdata-v4-2-d313aafd7e59@gmail.com> <DAACCYW3QRQE.1O75L2SHJYVPM@kernel.org> <3eef5777-9190-4782-8433-7b6ad4b9acd3@gmail.com> <DADAEIT9E1R8.1J69W5DKYAQGY@kernel.org> <3c1c0563-7f48-4222-a28d-316f885bcad4@gmail.com>
In-Reply-To: <3c1c0563-7f48-4222-a28d-316f885bcad4@gmail.com>

On Thu Jun 5, 2025 at 4:57 PM CEST, Christian Schrefl wrote:
> On 04.06.25 1:29 AM, Benno Lossin wrote:
>> On Mon Jun 2, 2025 at 11:16 PM CEST, Christian Schrefl wrote:
>>> On 31.05.25 2:23 PM, Benno Lossin wrote:
>>>> On Fri May 30, 2025 at 10:46 PM CEST, Christian Schrefl wrote:
>>>>> +// SAFETY:
>>>>> +// - All `&self` methods on this type are written to ensure that it =
is safe to call them in
>>>>> +//   parallel.
>>>>> +// - `MiscDevice::RegistrationData` is always `Sync`.
>>>>> +unsafe impl<T: MiscDevice> Sync for MiscDeviceRegistration<T> {}
>>>>
>>>> I would feel better if we still add the `T::RegistrationData: Sync`
>>>> bound here even if it is vacuous today.
>>>
>>> Since a reference the `MiscDeviceRegistration` struct is an
>>> argument to the open function this struct must always be Sync,
>>> so adding bounds here doesn't make much sense.
>>=20
>> Well yes, but this statement makes `MiscDeviceRegistration` be `Sync`
>> even if `T::RegistrationData` is not `Sync` if that bound got removed
>> at some point. And this "instability" is what I'm worried about.
>>=20
>>> I'll add this a safety comment in `MiscdeviceVTable::open`
>>> about this.
>>>
>>> Is there a good way to assert this at build to avoid regessions?
>>=20
>>     const _: () =3D {
>>         fn assert_sync<T: ?Sized + Sync>() {}
>>         fn ctx<T: MiscDevice>() {
>>             assert_sync::<T::RegistrationData>();
>>         }
>>     };
>>=20
>
> I'll add the bound and a TODO about `assert_sync`, in `open`
> where `Send` is required.
>
> I intend to write a patch for `assert_sync` later.

Great :)

>> That would also be fine with me if you insist on not adding the bound.
>>=20
>> (the `assert_sync` function should maybe be somewhere where everyone can
>> use it)
>>=20
>>>>>  impl<T: MiscDevice> MiscDeviceRegistration<T> {
>>>>>      /// Register a misc device.
>>>>> -    pub fn register(opts: MiscDeviceOptions) -> impl PinInit<Self, E=
rror> {
>>>>> +    pub fn register(
>>>>> +        opts: MiscDeviceOptions,
>>>>> +        data: impl PinInit<T::RegistrationData, Error>,
>>>>> +    ) -> impl PinInit<Self, Error> {
>>>>>          try_pin_init!(Self {
>>>>> +            data <- Opaque::pin_init(data),
>>>>>              inner <- Opaque::try_ffi_init(move |slot: *mut bindings:=
:miscdevice| {
>>>>>                  // SAFETY: The initializer can write to the provided=
 `slot`.
>>>>>                  unsafe { slot.write(opts.into_raw::<T>()) };
>>>>> =20
>>>>> -                // SAFETY: We just wrote the misc device options to =
the slot. The miscdevice will
>>>>> -                // get unregistered before `slot` is deallocated bec=
ause the memory is pinned and
>>>>> -                // the destructor of this type deallocates the memor=
y.
>>>>> +                // SAFETY:
>>>>> +                // * We just wrote the misc device options to the sl=
ot. The miscdevice will
>>>>> +                //   get unregistered before `slot` is deallocated b=
ecause the memory is pinned and
>>>>> +                //   the destructor of this type deallocates the mem=
ory.
>>>>> +                // * `data` is Initialized before `misc_register` so=
 no race with `fops->open()`
>>>>> +                //   is possible.
>>>>>                  // INVARIANT: If this returns `Ok(())`, then the `sl=
ot` will contain a registered
>>>>>                  // misc device.
>>>>>                  to_result(unsafe { bindings::misc_register(slot) })
>>>>> @@ -93,13 +108,24 @@ pub fn device(&self) -> &Device {
>>>>>          // before the underlying `struct miscdevice` is destroyed.
>>>>>          unsafe { Device::as_ref((*self.as_raw()).this_device) }
>>>>>      }
>>>>> +
>>>>> +    /// Access the additional data stored in this registration.
>>>>> +    pub fn data(&self) -> &T::RegistrationData {
>>>>> +        // SAFETY:
>>>>> +        // * No mutable reference to the value contained by `self.da=
ta` can ever be created.
>>>>> +        // * The value contained by `self.data` is valid for the ent=
ire lifetime of `&self`.
>>>>
>>>> Please add type invariants for these two requirements.
>>>>
>>>>> +        unsafe { &*self.data.get() }
>>>>> +    }
>>>>>  }
>>>>> =20
>>>>>  #[pinned_drop]
>>>>> -impl<T> PinnedDrop for MiscDeviceRegistration<T> {
>>>>> +impl<T: MiscDevice> PinnedDrop for MiscDeviceRegistration<T> {
>>>>>      fn drop(self: Pin<&mut Self>) {
>>>>>          // SAFETY: We know that the device is registered by the type=
 invariants.
>>>>>          unsafe { bindings::misc_deregister(self.inner.get()) };
>>>>> +
>>>>> +        // SAFETY: `self.data` is valid for dropping and nothing use=
s it anymore.
>>>>
>>>> Ditto.
>>>
>>> I'm not quite sure how to formulate these, what do you think of:
>>>
>>> /// - `inner` is a registered misc device.
>>=20
>> This doesn't really mean something to me, maybe it's better to reference
>> the registering function?
>
> That is from previous code so this should probably not be changed
> in this series.

I personally wouldn't mind a commit that fixes this up, but if you don't
want to do it, let me know then we can make this a good-first-issue.

>>> /// - `data` contains a valid `T::RegistrationData` for the whole lifet=
ime of [`MiscDeviceRegistration`]
>>=20
>> This sounds good. But help me understand, why do we need `Opaque` /
>> `UnsafePinned` again? If we're only using shared references, then we
>> could also just store the object by value?
>
> Since the Module owns the `MiscDeviceRegistration` it may create `&mut Mi=
scDeviceRegistration`,
> so from what I understand having a `& RegistrationData` reference into th=
at is UB without
> `UnsafePinned` (or `Opaque` since that includes `UnsafePinned` semantics)=
.

And the stored `T::RegistrationData` is shared as read-only with the C
side? Yes in that case we want `UnsafePinned<UnsafeCell<>>` (or for the
moment `Opaque`).

>>> /// - `data` must be usable until `misc_deregister` (called when droppe=
d) has returned.
>>=20
>> What does "usable" mean?
>
> I guess valid / alive might be better wording?
>
> I meant to say that the `fops` functions might use the `RegistrationData`=
 until=20
> `misc_deregister` has returned so we must ensure that these accesses are =
allowed. =20

Then use `valid`.

>>> /// - no mutable references to `data` may be created.
>>=20
>>>>> +        unsafe { core::ptr::drop_in_place(self.data.get()) };
>>>>>      }
>>>>>  }
>>>>> =20
>>>>> @@ -109,6 +135,13 @@ pub trait MiscDevice: Sized {
>>>>>      /// What kind of pointer should `Self` be wrapped in.
>>>>>      type Ptr: ForeignOwnable + Send + Sync;
>>>>> =20
>>>>> +    /// The additional data carried by the [`MiscDeviceRegistration`=
] for this [`MiscDevice`].
>>>>> +    /// If no additional data is required than the unit type `()` sh=
ould be used.
>>>>> +    ///
>>>>> +    /// This data can be accessed in [`MiscDevice::open()`] using
>>>>> +    /// [`MiscDeviceRegistration::data()`].
>>>>> +    type RegistrationData: Sync;
>>>>
>>>> Why do we require `Sync` here?
>>>
>>> Needed for `MiscDeviceRegistration` to be `Send`, see response above.
>>=20
>> You could also just ask the type there to be `Sync`, then users will get
>> an error when they try to use `MiscDevice` in a way where
>> `RegistrationData` is required to be `Sync`.
>
> I don't think there is any point to allow defining a `MiscDevice` impleme=
ntation
> that cant actually be used/registered.

Sure, but the bound asserting that it is `Sync` doesn't need to be here,
having it just on the `impl Sync for MiscDeviceRegistration` is good
enough. (though one could argue that people would get an earlier error
if it is already asserted here. I think we should have some general
guidelines here :)

>>>> We might want to give this a shorter name?
>>>
>>> I think its fine, but I am open to Ideas.
>>=20
>> `Data`?
>
> I feel that `Data` is just very ambiguous, especially since it is associa=
ted with=20
> `MiscDevice` not the `MiscDeviceRegistration` in which its used.

But it is the data of the MiscDevice, no?

> One Idea I've had was `AssociatedData` but that's less clear and not much=
 shorter
> than `RegistrationData`.

Of the two, I'd prefer `RegistrationData`.

> But I'd be alright to just with `Data` if that is wanted.

If you think that `RegistrationData` is more clear then go with that.
But I honestly don't derive much meaning from that over just `Data`. You
can still of course mention in the docs that this data is stored in the
registration.

But since there is no other way to associate data to a `MiscDevice`, I
think it makes sense to call it `Data`.

---
Cheers,
Benno
