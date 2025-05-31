Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD2DD2367C9;
	Sat, 31 May 2025 10:46:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748688415; cv=none; b=sG5rIJ66djXXLiPk/qpkMc8d63lZf2lYYjYTl/OpWLNMHb/qWI/R40SWrGPBMgpNzwe2JOohLovCXdxn5+46glKH1AdtDvg8uwIiwfMwOEwZryIU5rLLzU/uDzwowqERzOu5fjNyRXvZu+wHRMdTTSPuUVpoCG4yaOmCaL9NYM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748688415; c=relaxed/simple;
	bh=iQrS5JgFltebiHb7de2o18x5ZlgNqXQei0BNNbQpNpQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l5XD7aiA7joJdjJHijW4alp4DimeMwn7dV3Qjgp7Cki5oeteX7ocngu8fAIoM4sxa/lgtPyutdM0OxiY6hH+zZ6OmOtk1bV4pMAefuRpC4IhD4BjB/rBduk9yTjDWs06V1+5is0nV4exd1rR4d6fHaQ5MBgUAbPynlQ1JodDNLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q0m4bpoc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q0m4bpoc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BD71C4CEE3;
	Sat, 31 May 2025 10:46:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748688415;
	bh=iQrS5JgFltebiHb7de2o18x5ZlgNqXQei0BNNbQpNpQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Q0m4bpock+/RAVwGCQvkjx6zXGPaMkvt84Rx4avFqj2yutwrAixHzQiRg9ZY+MGhS
	 asrQQHtsE1uWvaq37rzKmiKy8XHvJlItHZJsri+NeCO+C8GVTafoTzoHQIqKLOBowp
	 Scf5whC8/pEqx5T9A5VjjboxzDhPiIF1G5DhhSbTOHz+mXepOMtdcYynHeeEimicUE
	 BZ0pBMzl0MGhH91I5Gll5LYixfvhDkgsBaIDjQpDqU/031P4+ZWN4mkWAmKb7i+eFr
	 zfrT3xXMjsN7uzTXAq4WVfzaLd4qh3akU98uS2CRVWJQrzVML3c/UJY00N8+oCLGX+
	 SHmKokW+TeTMA==
Date: Sat, 31 May 2025 12:46:49 +0200
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
Message-ID: <aDreGUcvyR4kjMGl@pollux>
References: <20250530142447.166524-1-dakr@kernel.org>
 <20250530142447.166524-7-dakr@kernel.org>
 <DAA7CJOUJPNL.F7UH9KD8JANF@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DAA7CJOUJPNL.F7UH9KD8JANF@kernel.org>

On Sat, May 31, 2025 at 10:27:44AM +0200, Benno Lossin wrote:
> On Fri May 30, 2025 at 4:24 PM CEST, Danilo Krummrich wrote:
> > @@ -227,11 +229,21 @@ fn drop(self: Pin<&mut Self>) {
> >      }
> >  }
> >  
> > +/// The arguments passed to the file operation callbacks of a [`MiscDeviceRegistration`].
> > +pub struct MiscArgs<'a, T: MiscDevice> {
> > +    /// The [`Device`] representation of the `struct miscdevice`.
> > +    pub device: &'a Device,
> > +    /// The parent [`Device`] of [`Self::device`].
> > +    pub parent: Option<&'a Device<Bound>>,
> > +    /// The `RegistrationData` passed to [`MiscDeviceRegistration::register`].
> > +    pub data: &'a T::RegistrationData,
> 
> Here I would also just use `T`, remove the `MiscDevice` bound and then
> use `MiscArgs<'_, Self::RegistrationData>` below.

It has the disadvantage that the documentation of the `data` field above needs
to be much more vague, since we can't claim that it's the `RegistrationData`
passed to `MiscDeviceRegistration::register` anymore -- given that, I'm not sure
it's worth changing.

> > +}
> > +
> >  /// Trait implemented by the private data of an open misc device.
> >  #[vtable]
> >  pub trait MiscDevice: Sized {
> >      /// What kind of pointer should `Self` be wrapped in.
> > -    type Ptr: ForeignOwnable + Send + Sync;
> > +    type Ptr: Send + Sync;
> 
> There is no info about this change in the commit message. Why are we
> changing this? This seems a bit orthogonal to the other change, maybe do
> it in a separate patch?

It's a consequence of the implementation:

A `Ptr` instance is created in the misc device's file operations open() callback
and dropped in the fops release() callback.

Previously, this was stored in the private data pointer of the struct file that
is passed for every file operation in open().

Also note that when open is called the private data pointer in a struct file
points to the corresponding struct miscdevice.

With this patch, we keep the pointer to the struct miscdevice in the private
data pointer of struct file, but instead store the `Ptr` instance in
`RawDeviceRegistration::private`.

Subsequently, ForeignOwnable is not a required trait anymore.

We need this in order to keep access to the `RawDeviceRegistration` throughout
file operations to be able to pass the misc device's parent as &Device<Bound>
through the `MiscArgs` above.

> Also `Ptr` doesn't make much sense for the name, since now that the
> `ForeignOwnable` bound is gone, I could set this to `Self` and then have
> access to `&Self` in the callbacks.

We can't make it `Self`, it might still be some pointer type, require pin-init,
etc. So, it has to be a generic type.

But, I agree that we should not name it `Ptr`, probably should never have been
named `Ptr`, but `Data`, `Private` or similar.

> Would that also make sense to use as a general change? So don't store
> `Self::Ptr`, but `Self` directly?

I think it can't be `Self`, see above.
