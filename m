Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72B7F28EA;
	Sun, 22 Jun 2025 12:47:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750596423; cv=none; b=Xoa7AMN2VY8bYqUL3we+E1Io/e+RfuvdN9AwwkwiQPZQKMF4di/qIZq2PiIc6OpjrTZjumQ+T5oorM8vzV/cVxHchB5M0sTs7wC17skuFXKeoR5IXFrzJ7pH0/t7bTz489APQnOX/WSrhzsM2wh5YMhXBsD19fUdr4lWD5pb16I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750596423; c=relaxed/simple;
	bh=M8G4c7zfC5Mjf6swSzEWlGDdS479mwZg+w7skWZzUDk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eQIQWt45Rrov4MnpEla+jpzYpEU+zQv5pQb9AVZEFnooJWqf1/6zFZe0xkclIpI23OxTPPNi555ViyTIv/V4zYJKoPrLFoaS1YZJRvv6x+Xo5ecAWIEB1xWcLASPkNY3LMLVpmsV6FpEaDeA+JjQTtm57ni0+Pg4CIoHFMfDBik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YWiuoYAQ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YWiuoYAQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1CCBDC4CEE3;
	Sun, 22 Jun 2025 12:46:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750596422;
	bh=M8G4c7zfC5Mjf6swSzEWlGDdS479mwZg+w7skWZzUDk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YWiuoYAQFoBIPKZjG1JGDrcDWBnR50puMmPIY68qUJuAGDFz4ecrwsuGMElPH0w1a
	 vmww5PfuwOZfHXk2L9LmYHFHNgtFa0WiinkyetEQ4KNK936zWw+G0INzJW2d1Gurl2
	 em7iSdST+9pjOIwtWD/fLWoM/ZVRJncLZ7wpqP/cA4PlEUzaKe1z2LK4b0rxdJsu+X
	 YwIUpk4ztYMlq6Zb0X7FffeB3B45xpiP0zb79SUmoIc6/PO1sPQRXyAUd6BibZJ3Ng
	 zbaxDCrIHi4UQZ8oAwizyHfqfJlwz/fHVQhmpIY4yTpUfen4OwYjbUOXxW7sVRie8j
	 +UtC/v8wj8DLA==
Date: Sun, 22 Jun 2025 14:46:57 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Benno Lossin <lossin@kernel.org>
Cc: gregkh@linuxfoundation.org, rafael@kernel.org, ojeda@kernel.org,
	alex.gaynor@gmail.com, boqun.feng@gmail.com, gary@garyguo.net,
	bjorn3_gh@protonmail.com, benno.lossin@proton.me,
	a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/4] rust: devres: implement register_foreign_release()
Message-ID: <aFf7QVhqE6dhp0m2@pollux>
References: <20250612145145.12143-1-dakr@kernel.org>
 <20250612145145.12143-5-dakr@kernel.org>
 <DASVTOJU2OE8.GU1NH3MZ3SX@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DASVTOJU2OE8.GU1NH3MZ3SX@kernel.org>

On Sun, Jun 22, 2025 at 09:26:33AM +0200, Benno Lossin wrote:
> On Thu Jun 12, 2025 at 4:51 PM CEST, Danilo Krummrich wrote:
> > +/// To be implemented by an object passed to [`register_foreign_release`].
> 
>     /// [`Devres`]-releaseable resource.
>     ///
>     /// Register an object implementing this trait with [`register_foreign_release`]. It's `release`
>     /// function will be called once the device unbinds.

Sounds good, thanks!

> > +pub trait Release {
> > +    /// Called once the [`Device`] given to [`register_foreign_release`] is unbound.
> > +    fn release(&self);
> 
> Would it make sense to also supply the `Device` that this is attached
> to? In case you have one object in multiple `register_foreign_release`
> calls with different devices, or is that something that doesn't happen?

No, doing that wouldn't make any sense. A resource should only be bound to the
lifetime of a single device.

> > +}
> > +
> > +impl<T: Release> Release for crate::sync::ArcBorrow<'_, T> {
> > +    fn release(&self) {
> > +        self.deref().release();
> > +    }
> > +}
> > +
> > +impl<T: Release> Release for Pin<&'_ T> {
> > +    fn release(&self) {
> > +        self.deref().release();
> > +    }
> > +}
> 
> We should also implement it for `&T`, since that is `Box`'s `Borrowed`.

That should implicitly be the case when T: Release, where T is P<T>.

> > +
> > +/// Consume the `data`, [`Release::release`] and [`Drop::drop`] `data` once `dev` is unbound.
> > +///
> > +/// # Examples
> > +///
> > +/// ```no_run
> > +/// use kernel::{device::{Bound, Device}, devres, devres::Release, sync::Arc};
> > +///
> > +/// struct Registration<T> {
> 
> Maybe add some explanation above/below this example. It looks like a new
> bus registration?

*class device registration, see Registration::new() below. But I can also add a
brief comment to the struct. It's indeed a bit subtly this way. :)

> > +///     data: T,
> > +/// }
> > +///
> > +/// impl<T> Registration<T> {
> > +///     fn new(data: T) -> Result<Arc<Self>> {
> > +///         // register (e.g. class device, IRQ, etc.)
> > +///
> > +///         Ok(Arc::new(Self { data }, GFP_KERNEL)?)
> > +///     }
> > +/// }
> > +///
> > +/// impl<T> Release for Registration<T> {
> > +///     fn release(&self) {
> > +///        // unregister
> > +///     }
> > +/// }
> > +///
> > +/// fn from_bound_context(dev: &Device<Bound>) -> Result {
> > +///     let reg = Registration::new(0x42)?;
> > +///
> > +///     devres::register_foreign_release(dev, reg.clone())
> > +/// }
> > +/// ```
> > +pub fn register_foreign_release<P>(dev: &Device<Bound>, data: P) -> Result
> > +where
> > +    P: ForeignOwnable,
> > +    for<'a> P::Borrowed<'a>: Release,
> > +{
> > +    let ptr = data.into_foreign();
> > +
> > +    #[allow(clippy::missing_safety_doc)]
> > +    unsafe extern "C" fn callback<P>(ptr: *mut kernel::ffi::c_void)
> > +    where
> > +        P: ForeignOwnable,
> > +        for<'a> P::Borrowed<'a>: Release,
> > +    {
> > +        // SAFETY: `ptr` is the pointer to the `ForeignOwnable` leaked above and hence valid.
> > +        unsafe { P::borrow(ptr.cast()) }.release();
> > +
> > +        // SAFETY: `ptr` is the pointer to the `ForeignOwnable` leaked above and hence valid.
> > +        let _ = unsafe { P::from_foreign(ptr.cast()) };
> > +    }
> > +
> > +    // SAFETY:
> > +    // - `dev.as_raw()` is a pointer to a valid and bound device.
> > +    // - `ptr` is a valid pointer the `ForeignOwnable` devres takes ownership of.
> > +    to_result(unsafe {
> > +        // `devm_add_action_or_reset()` also calls `callback` on failure, such that the
> > +        // `ForeignOwnable` is released eventually.
> > +        bindings::devm_add_action_or_reset(dev.as_raw(), Some(callback::<P>), ptr.cast())
> > +    })
> > +}
> 
