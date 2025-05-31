Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FD1217A305;
	Sat, 31 May 2025 12:39:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748695148; cv=none; b=S2NdL1ZsXJkyOzpOep/lmS7vqibqdEGry+TxHVSX9Zo1GX2vhnyEOeTq9cPE+fh/LBdG6wdAcz+aJgwVXkxetFt6W1xQSfXLXxUhEMslBwxIAZn5dIo4fKIwUfOqMeSxtSosUXBl0D7ZmUN/F0+ngXfyOEyfnwGG7rNL35SGJic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748695148; c=relaxed/simple;
	bh=937gUmW36AESKs9XN1Za5V8VBJiQPs9tBQbIEdzh6fQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bT7D3C3LZXKEUPmi17jCORp5az/lnpdVA6eUKwPwXUxM/2onfaHJZyR6WevjCGQUcVHyiE+E937OPtGKWJ6LcN+jy2rGESFXQgsXsiMPEFM2Q+mza1OWhMEBtzfypyyvzQ3j6KZr30u5i/WH+YhjeVxG2YDTPX5nm7RvvCRojzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k9d168P1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k9d168P1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1A56C4CEE3;
	Sat, 31 May 2025 12:39:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748695147;
	bh=937gUmW36AESKs9XN1Za5V8VBJiQPs9tBQbIEdzh6fQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=k9d168P12xhA8fm1jtFDMpw/LsRh2jsOHwpN3/xuEgTGW1kVrEWCg/17PBzzMiVSj
	 4Gk0jFzXRnTmOoVGAwzb/+fgUf8n3IOx2EJhVtFnDxY37KSCv5qPepGGFl9gmRjngP
	 o578fyIiJHCndctJMBEAPp/LzsTXKxMYMRajiWpjkqlm+q6cuCBUn7LmNFB7j2sJJm
	 eEQBiJysBvu/SgvlisJIwHfyPC2usR1d8fyBBs6+xDQQBjVfRAqk+9PQmHJYjia3qZ
	 K7i4wQELhJG0oFtSSmeo3UXW32+m2GviVGZNBXNhpIH7c2TJ3tPmJsMVgdXvkyyUR8
	 6ZBeeqhxQifSA==
Date: Sat, 31 May 2025 14:39:01 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Benno Lossin <lossin@kernel.org>
Cc: gregkh@linuxfoundation.org, rafael@kernel.org, ojeda@kernel.org,
	alex.gaynor@gmail.com, boqun.feng@gmail.com, gary@garyguo.net,
	bjorn3_gh@protonmail.com, benno.lossin@proton.me,
	a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu,
	chrisi.schrefl@gmail.com, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 6/7] rust: miscdevice: expose the parent device as
 &Device<Bound>
Message-ID: <aDr4ZUjBX9q1c89S@pollux>
References: <20250530142447.166524-1-dakr@kernel.org>
 <20250530142447.166524-7-dakr@kernel.org>
 <DAA7CJOUJPNL.F7UH9KD8JANF@kernel.org>
 <aDreGUcvyR4kjMGl@pollux>
 <DAAC2TIAOAEY.16STTUX7D2UNR@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DAAC2TIAOAEY.16STTUX7D2UNR@kernel.org>

On Sat, May 31, 2025 at 02:10:08PM +0200, Benno Lossin wrote:
> On Sat May 31, 2025 at 12:46 PM CEST, Danilo Krummrich wrote:
> > On Sat, May 31, 2025 at 10:27:44AM +0200, Benno Lossin wrote:
> >> On Fri May 30, 2025 at 4:24 PM CEST, Danilo Krummrich wrote:
> >> > @@ -227,11 +229,21 @@ fn drop(self: Pin<&mut Self>) {
> >> >      }
> >> >  }
> >> >  
> >> > +/// The arguments passed to the file operation callbacks of a [`MiscDeviceRegistration`].
> >> > +pub struct MiscArgs<'a, T: MiscDevice> {
> >> > +    /// The [`Device`] representation of the `struct miscdevice`.
> >> > +    pub device: &'a Device,
> >> > +    /// The parent [`Device`] of [`Self::device`].
> >> > +    pub parent: Option<&'a Device<Bound>>,
> >> > +    /// The `RegistrationData` passed to [`MiscDeviceRegistration::register`].
> >> > +    pub data: &'a T::RegistrationData,
> >> 
> >> Here I would also just use `T`, remove the `MiscDevice` bound and then
> >> use `MiscArgs<'_, Self::RegistrationData>` below.
> >
> > It has the disadvantage that the documentation of the `data` field above needs
> > to be much more vague, since we can't claim that it's the `RegistrationData`
> > passed to `MiscDeviceRegistration::register` anymore -- given that, I'm not sure
> > it's worth changing.
> 
> Yeah that's not ideal... Then keep it this way.
> 
> >> > +}
> >> > +
> >> >  /// Trait implemented by the private data of an open misc device.
> >> >  #[vtable]
> >> >  pub trait MiscDevice: Sized {
> >> >      /// What kind of pointer should `Self` be wrapped in.
> >> > -    type Ptr: ForeignOwnable + Send + Sync;
> >> > +    type Ptr: Send + Sync;
> >> 
> >> There is no info about this change in the commit message. Why are we
> >> changing this? This seems a bit orthogonal to the other change, maybe do
> >> it in a separate patch?
> >
> > It's a consequence of the implementation:
> >
> > A `Ptr` instance is created in the misc device's file operations open() callback
> > and dropped in the fops release() callback.
> >
> > Previously, this was stored in the private data pointer of the struct file that
> > is passed for every file operation in open().
> >
> > Also note that when open is called the private data pointer in a struct file
> > points to the corresponding struct miscdevice.
> >
> > With this patch, we keep the pointer to the struct miscdevice in the private
> > data pointer of struct file, but instead store the `Ptr` instance in
> > `RawDeviceRegistration::private`.
> >
> > Subsequently, ForeignOwnable is not a required trait anymore.
> 
> That's true, but it also wouldn't hurt to keep it for this patch and do
> the change in a separate one. Or mention it in the commit message :)
> 
> > We need this in order to keep access to the `RawDeviceRegistration` throughout
> > file operations to be able to pass the misc device's parent as &Device<Bound>
> > through the `MiscArgs` above.
> >
> >> Also `Ptr` doesn't make much sense for the name, since now that the
> >> `ForeignOwnable` bound is gone, I could set this to `Self` and then have
> >> access to `&Self` in the callbacks.
> >
> > We can't make it `Self`, it might still be some pointer type, require pin-init,
> > etc. So, it has to be a generic type.
> 
> `MiscDevice::open` could return an `impl PinInit<Self, Error>` :)
> 
> > But, I agree that we should not name it `Ptr`, probably should never have been
> > named `Ptr`, but `Data`, `Private` or similar.
> >
> >> Would that also make sense to use as a general change? So don't store
> >> `Self::Ptr`, but `Self` directly?
> >
> > I think it can't be `Self`, see above.
> 
> The rust_misc_device example would still work if we changed this to
> `Self`. Now it's not a complicated user of the API and someone might
> want to store `Self` in an `Arc` and then store that as the private
> data, as the MiscDevice is also referenced from somewhere else. But I
> don't know if that is common or an intended use-case :)
> 
> For simple use-cases however, I think that `Self` definitely is the
> right choice (as opposed to `Pin<KBox<Self>>` for example, as that has
> an extra allocation :)

The data returned by open() can be anything. It can also be some arbitrary
Arc<T> that already exists and is looked up in open(). It can also be something
new that is created within open() and requires in-place initialization.

So, if we want to change this, we could return an `impl PinInit<Self, Error>` as
you suggest above and initialize it in-place in
`RawDeviceRegistration::private`.

I agree that this is the correct thing to do, but that really sounds like a
subsequent patch.
