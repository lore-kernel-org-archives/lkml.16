Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68D6F86349;
	Sun, 22 Jun 2025 07:05:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750575956; cv=none; b=KuS3mRCCBiqHNhfoVd4nOBgo1cFVa2mwJNe5w6wUDh5YvK6o+CwEjqleS/nc6LFRYFeJ0+Dbeh/Z/4rAruRXWTnIf0sPybWNC/LdhA5homzc7L5Z0eYl1bHxTl+7cyjiA8Gr8MyfRk5K+XprIcVid8kBnf+ZFTUyvhEfHkHal+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750575956; c=relaxed/simple;
	bh=YkxubIcQLmfJyvwsEw366DxtPsNo0wtKw+ArxTKGfTg=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=tUQaoTXBYzSKQdzovRH0mIHuOlg4AnQdKsuDt3nnzufc/tqQxIA4a9KA7/GYTojAJm/fFaEFvqrw2iZStQvfOllGjTNjwNhrY7Bf2bwvgSaAtxK2wneeVo7Nfv1lQQ0n7/KNIZHWlPWNcTYmq1f2p8tHpGvIylvx/voom5t1bps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GA11JH0S; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GA11JH0S"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7AC32C4CEE3;
	Sun, 22 Jun 2025 07:05:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750575956;
	bh=YkxubIcQLmfJyvwsEw366DxtPsNo0wtKw+ArxTKGfTg=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=GA11JH0SMLkdZNYztXqN5ZOQr5tz/5DfUqYiwmGtb4fQ6Cdz/Faz0PqXbE183qnyX
	 5ZWfVKjRhxOERIabu/KYABf+NI72dgQ+uyLdvb7KH65OWfTKSz0uagPUOf0BnvkMR+
	 ohYsvyvS6K38WEvs7IrBl0qY/a0fTBKjyHSy/o3yA6Zqh0qaaiCB4Arm8sw6bcqHZ+
	 vd8NNp41lfR60Nvt3ygLd1x3KWFO7D4Iqr6K2Vh/Dck/7TaOIzVdl9qj2fwXkSpdXv
	 tWtjtkqmXtIpiDN6SYKTZdQ5jau7iigX0kQijoEyHYkaGp1yL5/j4Ss3F5U4QS7IAW
	 fPddLC9qDIMQg==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 22 Jun 2025 09:05:51 +0200
Message-Id: <DASVDU1WY5RH.1VLCIQ4TIS0FP@kernel.org>
Cc: <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 3/4] rust: devres: get rid of Devres' inner Arc
From: "Benno Lossin" <lossin@kernel.org>
To: "Danilo Krummrich" <dakr@kernel.org>, <gregkh@linuxfoundation.org>,
 <rafael@kernel.org>, <ojeda@kernel.org>, <alex.gaynor@gmail.com>,
 <boqun.feng@gmail.com>, <gary@garyguo.net>, <bjorn3_gh@protonmail.com>,
 <benno.lossin@proton.me>, <a.hindborg@kernel.org>, <aliceryhl@google.com>,
 <tmgross@umich.edu>
X-Mailer: aerc 0.20.1
References: <20250612145145.12143-1-dakr@kernel.org>
 <20250612145145.12143-4-dakr@kernel.org>
In-Reply-To: <20250612145145.12143-4-dakr@kernel.org>

On Thu Jun 12, 2025 at 4:51 PM CEST, Danilo Krummrich wrote:
> So far Devres uses an inner memory allocation and reference count, i.e.
> an inner Arc, in order to ensure that the devres callback can't run into
> a use-after-free in case where the Devres object is dropped while the
> devres callback runs concurrently.
>
> Instead, use a completion in order to avoid a potential UAF: In
> Devres::drop(), if we detect that we can't remove the devres action
> anymore, we wait for the completion that is completed from the devres
> callback. If, in turn, we were able to successfully remove the devres
> action, we can just go ahead.
>
> This, again, allows us to get rid of the internal Arc, and instead let
> Devres consume an `impl PinInit<T, E>` in order to return an
> `impl PinInit<Devres<T>, E>`, which enables us to get away with less
> memory allocations.
>
> Additionally, having the resulting explicit synchronization in
> Devres::drop() prevents potential subtle undesired side effects of the
> devres callback dropping the final Arc reference asynchronously within
> the devres callback.
>
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

This is really nice, good to see the extra allocations gone :)

> ---
>  drivers/gpu/nova-core/driver.rs |   7 +-
>  drivers/gpu/nova-core/gpu.rs    |   6 +-
>  rust/kernel/devres.rs           | 187 +++++++++++++++-----------------
>  rust/kernel/pci.rs              |  20 ++--
>  samples/rust/rust_driver_pci.rs |  19 ++--
>  5 files changed, 117 insertions(+), 122 deletions(-)

> @@ -86,100 +76,93 @@ struct DevresInner<T> {
>  /// # fn no_run(dev: &Device<Bound>) -> Result<(), Error> {
>  /// // SAFETY: Invalid usage for example purposes.
>  /// let iomem =3D unsafe { IoMem::<{ core::mem::size_of::<u32>() }>::new=
(0xBAAAAAAD)? };
> -/// let devres =3D Devres::new(dev, iomem, GFP_KERNEL)?;
> +/// let devres =3D KBox::pin_init(Devres::new(dev, iomem), GFP_KERNEL)?;
>  ///
>  /// let res =3D devres.try_access().ok_or(ENXIO)?;
>  /// res.write8(0x42, 0x0);
>  /// # Ok(())
>  /// # }
>  /// ```
> -pub struct Devres<T>(Arc<DevresInner<T>>);
> -
> -impl<T> DevresInner<T> {
> -    fn new(dev: &Device<Bound>, data: T, flags: Flags) -> Result<Arc<Dev=
resInner<T>>> {
> -        let inner =3D Arc::pin_init(
> -            try_pin_init!( DevresInner {
> -                dev: dev.into(),
> -                callback: Self::devres_callback,
> -                data <- Revocable::new(data),
> -                revoke <- Completion::new(),
> -            }),
> -            flags,
> -        )?;
> -
> -        // Convert `Arc<DevresInner>` into a raw pointer and make devres=
 own this reference until
> -        // `Self::devres_callback` is called.
> -        let data =3D inner.clone().into_raw();
> +#[pin_data(PinnedDrop)]
> +pub struct Devres<T> {
> +    dev: ARef<Device>,
> +    callback: unsafe extern "C" fn(*mut c_void),

Do I remember correctly that we at some point talked about adding a
comment here for why this is needed? (ie it's needed, because
`Self::callback` might return different addresses?)

> +    #[pin]
> +    data: Revocable<T>,
> +    #[pin]
> +    devm: Completion,
> +    #[pin]
> +    revoke: Completion,

Probably a good idea to add some doc comments explaining what these two
completions track.

(feel free to do these in another patch or in a follow-up)

> +}
> =20
> -        // SAFETY: `devm_add_action` guarantees to call `Self::devres_ca=
llback` once `dev` is
> -        // detached.
> -        let ret =3D
> -            unsafe { bindings::devm_add_action(dev.as_raw(), Some(inner.=
callback), data as _) };
> +impl<T> Devres<T> {
> +    /// Creates a new [`Devres`] instance of the given `data`. The `data=
` encapsulated within the

Missing double newline after the first sentence.

> +    /// returned `Devres` instance' `data` will be revoked once the devi=
ce is detached.

Maybe we should link to `Revocable` on the word `revoked`?

> +    pub fn new<'a, E>(
> +        dev: &'a Device<Bound>,
> +        data: impl PinInit<T, E> + 'a,
> +    ) -> impl PinInit<Self, Error> + 'a
> +    where
> +        T: 'a,
> +        Error: From<E>,
> +    {
> +        let callback =3D Self::devres_callback;

> -        Ok(Devres(inner))
> +    fn remove_action(&self) -> bool {
> +        // SAFETY:
> +        // - `self.dev` is a valid `Device`,
> +        // - the `action` and `data` pointers are the exact same ones as=
 given to devm_add_action()
> +        //   previously,
> +        // - `self` is always valid, even if the action has been release=
d already.
> +        (unsafe {
> +            bindings::devm_remove_action_nowarn(
> +                self.dev.as_raw(),
> +                Some(self.callback),
> +                self.as_ptr().cast_mut().cast(),
> +            )
> +        } =3D=3D 0)

I don't think the parenthesis are required?

>      }
> =20
>      /// Obtain `&'a T`, bypassing the [`Revocable`].

> -impl<T> Drop for Devres<T> {
> -    fn drop(&mut self) {
> +#[pinned_drop]
> +impl<T> PinnedDrop for Devres<T> {
> +    fn drop(self: Pin<&mut Self>) {
>          // SAFETY: When `drop` runs, it is guaranteed that nobody is acc=
essing the revocable data
>          // anymore, hence it is safe not to wait for the grace period to=
 finish.
> -        if unsafe { self.0.data.revoke_nosync() } {
> -            // We revoked `self.0.data` before the devres action did, he=
nce try to remove it.
> -            if !DevresInner::remove_action(&self.0) {
> +        if unsafe { self.data.revoke_nosync() } {
> +            // We revoked `self.data` before the devres action did, henc=
e try to remove it.
> +            if !self.remove_action() {
>                  // We could not remove the devres action, which means th=
at it now runs concurrently,
> -                // hence signal that `self.0.data` has been revoked succ=
essfully.
> -                self.0.revoke.complete_all();
> +                // hence signal that `self.data` has been revoked by us =
successfully.
> +                self.revoke.complete_all();
> +
> +                // Wait for `Self::devres_callback` to be done using thi=
s object.
> +                self.devm.wait_for_completion();
>              }
> +        } else {
> +            // `Self::devres_callback` revokes `self.data` for us, hence=
 wait for it to be done
> +            // using this object.
> +            self.devm.wait_for_completion();

I don't understand this change, maybe it's best to move that into a
separate commit?

---
Cheers,
Benno
