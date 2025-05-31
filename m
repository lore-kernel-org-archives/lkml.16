Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 676627260A;
	Sat, 31 May 2025 12:10:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748693413; cv=none; b=GFSyk/6GSSZbDreYTGZoDI3NtlL4cj3JDVJMEy83JOfLrzrosXK2utBZJn7Zn2FgNemafgnvTSpqAOTHx/ibNXH5aeZHe96hbvHPdjj8i1UIwQM47linSa0hTmV/pQkJkRbllNzG2iuDzw483P639xr7w+yNbLL6cDu+3xBj+wI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748693413; c=relaxed/simple;
	bh=edR2Sg60IDTAJd9y49ifvck9u5o43rpFtj/a1phDKnU=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=ZjPA19OqjzOwRHSlDjKxyMxVT22RsrmeNQBDfvSw7L3hND/H9NdvpTZet/IYa/hffo879SG96uXkdcLxEO04VakuTQQXTPfzVVsV7C+7fH5s2KRu5ELeF0Rqo8H5A4an3j0QQtg2dv+eVqXCKaaadiFMuaUUX2Cd5cuua0tSKTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=s2lo5/yV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="s2lo5/yV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3519C4CEE3;
	Sat, 31 May 2025 12:10:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748693412;
	bh=edR2Sg60IDTAJd9y49ifvck9u5o43rpFtj/a1phDKnU=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=s2lo5/yV8L1MdzxV6i+KTg7CjrN6u6q7afEoin8eBHaZR+Pz33o1zZOiJ5H0ERjQ5
	 hHO3uJ7kbzA+9dww4dmY+oJqgpCrG7IVXVHZh6tEnTXiIjYhURhbq3+lMvYLfLWkn+
	 0s73VHRnC5yhFWAljLcsF6g50vV96vbwdtxscfg1ukSdrAjACY2m9Vk1OLW4mOOhKu
	 D5/yobhDgcesmRPZCPMjkOEgWIQjImPvdx8dorlaDz4rfNl9/jPE7/GOyDWRni+//n
	 KcYpXdcsMZshTWURyQkC5GYUDjllGkOwXyrPi9L1nhjhSNbeH1YFRW92safsN2rj9N
	 CYkCXOFUNmnrA==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 31 May 2025 14:10:08 +0200
Message-Id: <DAAC2TIAOAEY.16STTUX7D2UNR@kernel.org>
Cc: <gregkh@linuxfoundation.org>, <rafael@kernel.org>, <ojeda@kernel.org>,
 <alex.gaynor@gmail.com>, <boqun.feng@gmail.com>, <gary@garyguo.net>,
 <bjorn3_gh@protonmail.com>, <benno.lossin@proton.me>,
 <a.hindborg@kernel.org>, <aliceryhl@google.com>, <tmgross@umich.edu>,
 <chrisi.schrefl@gmail.com>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 6/7] rust: miscdevice: expose the parent device as
 &Device<Bound>
From: "Benno Lossin" <lossin@kernel.org>
To: "Danilo Krummrich" <dakr@kernel.org>
X-Mailer: aerc 0.20.1
References: <20250530142447.166524-1-dakr@kernel.org>
 <20250530142447.166524-7-dakr@kernel.org>
 <DAA7CJOUJPNL.F7UH9KD8JANF@kernel.org> <aDreGUcvyR4kjMGl@pollux>
In-Reply-To: <aDreGUcvyR4kjMGl@pollux>

On Sat May 31, 2025 at 12:46 PM CEST, Danilo Krummrich wrote:
> On Sat, May 31, 2025 at 10:27:44AM +0200, Benno Lossin wrote:
>> On Fri May 30, 2025 at 4:24 PM CEST, Danilo Krummrich wrote:
>> > @@ -227,11 +229,21 @@ fn drop(self: Pin<&mut Self>) {
>> >      }
>> >  }
>> > =20
>> > +/// The arguments passed to the file operation callbacks of a [`MiscD=
eviceRegistration`].
>> > +pub struct MiscArgs<'a, T: MiscDevice> {
>> > +    /// The [`Device`] representation of the `struct miscdevice`.
>> > +    pub device: &'a Device,
>> > +    /// The parent [`Device`] of [`Self::device`].
>> > +    pub parent: Option<&'a Device<Bound>>,
>> > +    /// The `RegistrationData` passed to [`MiscDeviceRegistration::re=
gister`].
>> > +    pub data: &'a T::RegistrationData,
>>=20
>> Here I would also just use `T`, remove the `MiscDevice` bound and then
>> use `MiscArgs<'_, Self::RegistrationData>` below.
>
> It has the disadvantage that the documentation of the `data` field above =
needs
> to be much more vague, since we can't claim that it's the `RegistrationDa=
ta`
> passed to `MiscDeviceRegistration::register` anymore -- given that, I'm n=
ot sure
> it's worth changing.

Yeah that's not ideal... Then keep it this way.

>> > +}
>> > +
>> >  /// Trait implemented by the private data of an open misc device.
>> >  #[vtable]
>> >  pub trait MiscDevice: Sized {
>> >      /// What kind of pointer should `Self` be wrapped in.
>> > -    type Ptr: ForeignOwnable + Send + Sync;
>> > +    type Ptr: Send + Sync;
>>=20
>> There is no info about this change in the commit message. Why are we
>> changing this? This seems a bit orthogonal to the other change, maybe do
>> it in a separate patch?
>
> It's a consequence of the implementation:
>
> A `Ptr` instance is created in the misc device's file operations open() c=
allback
> and dropped in the fops release() callback.
>
> Previously, this was stored in the private data pointer of the struct fil=
e that
> is passed for every file operation in open().
>
> Also note that when open is called the private data pointer in a struct f=
ile
> points to the corresponding struct miscdevice.
>
> With this patch, we keep the pointer to the struct miscdevice in the priv=
ate
> data pointer of struct file, but instead store the `Ptr` instance in
> `RawDeviceRegistration::private`.
>
> Subsequently, ForeignOwnable is not a required trait anymore.

That's true, but it also wouldn't hurt to keep it for this patch and do
the change in a separate one. Or mention it in the commit message :)

> We need this in order to keep access to the `RawDeviceRegistration` throu=
ghout
> file operations to be able to pass the misc device's parent as &Device<Bo=
und>
> through the `MiscArgs` above.
>
>> Also `Ptr` doesn't make much sense for the name, since now that the
>> `ForeignOwnable` bound is gone, I could set this to `Self` and then have
>> access to `&Self` in the callbacks.
>
> We can't make it `Self`, it might still be some pointer type, require pin=
-init,
> etc. So, it has to be a generic type.

`MiscDevice::open` could return an `impl PinInit<Self, Error>` :)

> But, I agree that we should not name it `Ptr`, probably should never have=
 been
> named `Ptr`, but `Data`, `Private` or similar.
>
>> Would that also make sense to use as a general change? So don't store
>> `Self::Ptr`, but `Self` directly?
>
> I think it can't be `Self`, see above.

The rust_misc_device example would still work if we changed this to
`Self`. Now it's not a complicated user of the API and someone might
want to store `Self` in an `Arc` and then store that as the private
data, as the MiscDevice is also referenced from somewhere else. But I
don't know if that is common or an intended use-case :)

For simple use-cases however, I think that `Self` definitely is the
right choice (as opposed to `Pin<KBox<Self>>` for example, as that has
an extra allocation :)

---
Cheers,
Benno
