Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52EEE376;
	Sun, 22 Jun 2025 07:26:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750577198; cv=none; b=atOK5Lf8hlX/sKh4jPmXLq/DsdIjOxgMmk5eo+2IcVbuIqxgauu4aPgpSNgU/Ff6E53zDU0JFPmettpTzreZt3HUj0PyioVs5ONNhseex9FJwGyvehplX1VdxJZ3MBuEcuBEuu94VuUbVPyitG9jViSLRsnbeHqpVOZSwBP8u2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750577198; c=relaxed/simple;
	bh=KJd8/9pB4BBLfTmsmqhD1838pzERSEA7W+NIgN4qq7A=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=WCKtMgmw1wUOWRKKm4PkeJ+I0gFgjFebkbWyRnClRCRyhJg6xKgR136rflgxrGyz+Kq1sfCGlVXhN7uWpJNyot/yUuaiZiVEkoXOei9WNFsnkV5rD/wdSDk63jp1Aw4E0l74CqfM3gwXNj3wwY7XvNkD3dDhUTHVUq7sAPH74SQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZPLoazpJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZPLoazpJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3419EC4CEE3;
	Sun, 22 Jun 2025 07:26:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750577197;
	bh=KJd8/9pB4BBLfTmsmqhD1838pzERSEA7W+NIgN4qq7A=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=ZPLoazpJuDwkYelJ6IfkVyObObGMZNkPGhHxRefgnwWZvaYPn1oXY/774U5npfASl
	 kh6REOLJt7dkiH0mhwuRsZkGz81SxgmP2fVTK8LdD0bgdC6pypBSUkf0Yqxdcumwz+
	 89TWbpnpLlsSFeUKI+xbo3KiJFRS/lurW4QDDRf4EO6PsVyI6evfyq4laI/bqe/SNm
	 AtXr+reP75ZgzM7JQ32bSn2e7xLxJMjaKpLzcrcXmpbWEw+IyLL/uEHHOKgoK6zYU0
	 xVMsr4WaQREWokknz2a0tYyYN/GesPbQ5hrAdPq3e5Ctel04yUez5aGfxhFpxwkQEA
	 emyYmeyTGxt9A==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 22 Jun 2025 09:26:33 +0200
Message-Id: <DASVTOJU2OE8.GU1NH3MZ3SX@kernel.org>
Cc: <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 4/4] rust: devres: implement register_foreign_release()
From: "Benno Lossin" <lossin@kernel.org>
To: "Danilo Krummrich" <dakr@kernel.org>, <gregkh@linuxfoundation.org>,
 <rafael@kernel.org>, <ojeda@kernel.org>, <alex.gaynor@gmail.com>,
 <boqun.feng@gmail.com>, <gary@garyguo.net>, <bjorn3_gh@protonmail.com>,
 <benno.lossin@proton.me>, <a.hindborg@kernel.org>, <aliceryhl@google.com>,
 <tmgross@umich.edu>
X-Mailer: aerc 0.20.1
References: <20250612145145.12143-1-dakr@kernel.org>
 <20250612145145.12143-5-dakr@kernel.org>
In-Reply-To: <20250612145145.12143-5-dakr@kernel.org>

On Thu Jun 12, 2025 at 4:51 PM CEST, Danilo Krummrich wrote:
> register_foreign_release() is useful when a device resource has
> associated data, but does not require the capability of accessing it or
> manually releasing it.
>
> If we would want to be able to access the device resource and release the
> device resource manually before the device is unbound, but still keep
> access to the associated data, we could implement it as follows.
>
> 	struct Registration<T> {
> 	   inner: Devres<RegistrationInner>,
> 	   data: T,
> 	}
>
> However, if we never need to access the resource or release it manually,
> register_foreign_release() is great optimization for the above, since it
> does not require the synchronization of the Devres type.
>
> Suggested-by: Alice Ryhl <aliceryhl@google.com>
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>
> ---
>  rust/kernel/devres.rs | 80 +++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 80 insertions(+)

Idea & implementation look good, I'm just a little unsatisfied with the
names & docs...

> diff --git a/rust/kernel/devres.rs b/rust/kernel/devres.rs
> index 4ee9037f4ad4..495dca6240fc 100644
> --- a/rust/kernel/devres.rs
> +++ b/rust/kernel/devres.rs
> @@ -16,6 +16,7 @@
>      sync::{rcu, Completion},
>      types::{ARef, ForeignOwnable},
>  };
> +use core::ops::Deref;
> =20
>  /// This abstraction is meant to be used by subsystems to containerize [=
`Device`] bound resources to
>  /// manage their lifetime.
> @@ -303,3 +304,82 @@ pub fn register_foreign_boxed<T, E>(
> =20
>      register_foreign(dev, data)
>  }
> +
> +/// To be implemented by an object passed to [`register_foreign_release`=
].

    /// [`Devres`]-releaseable resource.
    ///
    /// Register an object implementing this trait with [`register_foreign_=
release`]. It's `release`
    /// function will be called once the device unbinds.

> +pub trait Release {
> +    /// Called once the [`Device`] given to [`register_foreign_release`]=
 is unbound.
> +    fn release(&self);

Would it make sense to also supply the `Device` that this is attached
to? In case you have one object in multiple `register_foreign_release`
calls with different devices, or is that something that doesn't happen?

> +}
> +
> +impl<T: Release> Release for crate::sync::ArcBorrow<'_, T> {
> +    fn release(&self) {
> +        self.deref().release();
> +    }
> +}
> +
> +impl<T: Release> Release for Pin<&'_ T> {
> +    fn release(&self) {
> +        self.deref().release();
> +    }
> +}

We should also implement it for `&T`, since that is `Box`'s `Borrowed`.

> +
> +/// Consume the `data`, [`Release::release`] and [`Drop::drop`] `data` o=
nce `dev` is unbound.
> +///
> +/// # Examples
> +///
> +/// ```no_run
> +/// use kernel::{device::{Bound, Device}, devres, devres::Release, sync:=
:Arc};
> +///
> +/// struct Registration<T> {

Maybe add some explanation above/below this example. It looks like a new
bus registration?

---
Cheers,
Benno

> +///     data: T,
> +/// }
> +///
> +/// impl<T> Registration<T> {
> +///     fn new(data: T) -> Result<Arc<Self>> {
> +///         // register (e.g. class device, IRQ, etc.)
> +///
> +///         Ok(Arc::new(Self { data }, GFP_KERNEL)?)
> +///     }
> +/// }
> +///
> +/// impl<T> Release for Registration<T> {
> +///     fn release(&self) {
> +///        // unregister
> +///     }
> +/// }
> +///
> +/// fn from_bound_context(dev: &Device<Bound>) -> Result {
> +///     let reg =3D Registration::new(0x42)?;
> +///
> +///     devres::register_foreign_release(dev, reg.clone())
> +/// }
> +/// ```
> +pub fn register_foreign_release<P>(dev: &Device<Bound>, data: P) -> Resu=
lt
> +where
> +    P: ForeignOwnable,
> +    for<'a> P::Borrowed<'a>: Release,
> +{
> +    let ptr =3D data.into_foreign();
> +
> +    #[allow(clippy::missing_safety_doc)]
> +    unsafe extern "C" fn callback<P>(ptr: *mut kernel::ffi::c_void)
> +    where
> +        P: ForeignOwnable,
> +        for<'a> P::Borrowed<'a>: Release,
> +    {
> +        // SAFETY: `ptr` is the pointer to the `ForeignOwnable` leaked a=
bove and hence valid.
> +        unsafe { P::borrow(ptr.cast()) }.release();
> +
> +        // SAFETY: `ptr` is the pointer to the `ForeignOwnable` leaked a=
bove and hence valid.
> +        let _ =3D unsafe { P::from_foreign(ptr.cast()) };
> +    }
> +
> +    // SAFETY:
> +    // - `dev.as_raw()` is a pointer to a valid and bound device.
> +    // - `ptr` is a valid pointer the `ForeignOwnable` devres takes owne=
rship of.
> +    to_result(unsafe {
> +        // `devm_add_action_or_reset()` also calls `callback` on failure=
, such that the
> +        // `ForeignOwnable` is released eventually.
> +        bindings::devm_add_action_or_reset(dev.as_raw(), Some(callback::=
<P>), ptr.cast())
> +    })
> +}

