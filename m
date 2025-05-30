Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C251027D782;
	Fri, 30 May 2025 19:29:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748633385; cv=none; b=nxZcaIcwPQCYP2t7pKXve9ICgTqkUugBG2twSaMcTIc0bfVQN8sJTeKZ1M+hg2pFI4bH7w0JvFUOdolT0g2T2UDtgeP1RkZ4a6Ai+nf9KKz1aljQjDI5OyC82yFUK/LXgLWffutFTaFJGGCtY0GKes0tOyX0WThyZwwTn4fsuhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748633385; c=relaxed/simple;
	bh=Vmc8CCowR6HPAOQhbXqxKQP5HL/aFpHG6KvoQhK51/E=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=MNw08JlXKvKk6gaUiMlS4ow5cSLfeJc8Z9zCBUwTTNt9B8eG93hpkm0eqdHJy/sEC9j1PPAn4ttgyo557UpV8dCKp0gHXuYpSL1jAt8dcZio1ye2WYOKolbNh9qvkzZnDz9av8q/Iewn1GjCbApJGxT7hTyBs7lQi/5Vl/+JsM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cD6j8uGN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cD6j8uGN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A51DC4CEED;
	Fri, 30 May 2025 19:29:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748633385;
	bh=Vmc8CCowR6HPAOQhbXqxKQP5HL/aFpHG6KvoQhK51/E=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=cD6j8uGNJKBcWgVNurz1/IYRlyiWDk0srjPIJshnBdC4AEi3Mg1hXujl+BRrcBaVc
	 YaN5tjSpgp+4BoBWbpvElSudFLrfoMuOoTK+093mNaA5iqc7HuevFyqE3dAYL3KFNH
	 J8eVzbD4cHAcedAbffrlcPc8xO0+00BDKpH82Woxrnutm5aHLK3QzMkP/rB177kx60
	 Pwxk+WaTkgMEJXWSwt4iGa8xbEjRmCbfxdC7SndHn9oiSeQLZJIIZqtWZ6qrqEEP8A
	 CO7hMCO6okm0RYQlEt1tQsPyzGVLp3+dATbyo36ttC+HthkzDjkQt1GQrafafDJt8u
	 MDcY4yuifekiw==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 30 May 2025 21:29:40 +0200
Message-Id: <DA9QST4SISFK.37NSCTH594NSF@kernel.org>
Cc: <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/7] rust: types: support fallible PinInit types in
 Opaque::pin_init
From: "Benno Lossin" <lossin@kernel.org>
To: "Danilo Krummrich" <dakr@kernel.org>, <gregkh@linuxfoundation.org>,
 <rafael@kernel.org>, <ojeda@kernel.org>, <alex.gaynor@gmail.com>,
 <boqun.feng@gmail.com>, <gary@garyguo.net>, <bjorn3_gh@protonmail.com>,
 <benno.lossin@proton.me>, <a.hindborg@kernel.org>, <aliceryhl@google.com>,
 <tmgross@umich.edu>, <chrisi.schrefl@gmail.com>
X-Mailer: aerc 0.20.1
References: <20250530142447.166524-1-dakr@kernel.org>
 <20250530142447.166524-2-dakr@kernel.org>
In-Reply-To: <20250530142447.166524-2-dakr@kernel.org>

On Fri May 30, 2025 at 4:24 PM CEST, Danilo Krummrich wrote:
> Currently, Opaque::pin_init only supports infallible PinInit
> implementations, i.e. impl PinInit<T, Infallible>.
>
> This has been sufficient so far, since users such as Revocable do not
> support fallibility.
>
> Since this is about to change, make Opaque::pin_init() generic over the
> error type E.
>
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>
> ---
>  rust/kernel/types.rs | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/rust/kernel/types.rs b/rust/kernel/types.rs
> index 22985b6f6982..75c99d6facf9 100644
> --- a/rust/kernel/types.rs
> +++ b/rust/kernel/types.rs
> @@ -354,13 +354,13 @@ pub const fn zeroed() -> Self {
>      }
> =20
>      /// Create an opaque pin-initializer from the given pin-initializer.
> -    pub fn pin_init(slot: impl PinInit<T>) -> impl PinInit<Self> {
> -        Self::ffi_init(|ptr: *mut T| {
> +    pub fn pin_init<E>(slot: impl PinInit<T, E>) -> impl PinInit<Self, E=
> {
> +        Self::try_ffi_init(|ptr: *mut T| -> Result<(), E> {
>              // SAFETY:
>              //   - `ptr` is a valid pointer to uninitialized memory,
> -            //   - `slot` is not accessed on error; the call is infallib=
le,
> +            //   - `slot` is not accessed on error,
>              //   - `slot` is pinned in memory.
> -            let _ =3D unsafe { PinInit::<T>::__pinned_init(slot, ptr) };
> +            unsafe { PinInit::<T, E>::__pinned_init(slot, ptr) }

Could you move this function into an `impl pin_init::Wrapper<T>` block?
(it's the same function, but in a trait that was recently added)

Thanks!

---
Cheers,
Benno

>          })
>      }
> =20

