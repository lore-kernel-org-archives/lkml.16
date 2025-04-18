Received: from mail-10628.protonmail.ch (mail-10628.protonmail.ch [79.135.106.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 986EC26B95E;
	Fri, 18 Apr 2025 13:26:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744982765; cv=none; b=WoLUxLqc5qxaM4eUqGu1PDD0Eg6PFkzak1geD5AkyjTln2HHOxjKv8InZTsxhFF/ilwSvBCzDvXWo5o0PSL4TS4AbhkqfC2jrWblpB2vvOzOZAuTbjqod/IYRc/PVHeqd5pzqa8tGGU94pZHYfJi21q5s+StQOK52yyJiFL5fKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744982765; c=relaxed/simple;
	bh=7Fin6B/XYFqyM8b0h9Q/tsbTvqZbTBbmIDYOGrKwrJA=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=P+77Yxa+PZnYUcneiL22HoEYziN3LBQ43V62EmkQaQ5Vzxc326Vj79F/huuN4FQhj4Kx5BOhbVCPWVwq8FsV8jDlWZVfxBrpHD5AWt8bJTuOu1uuVOmv7yZkQNYPuzik//lnh0HmuDloORNJi8YuA9RASUzZ9sE2ErZa+ShMdT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=Nz5iY6n4; arc=none smtp.client-ip=79.135.106.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="Nz5iY6n4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1744982753; x=1745241953;
	bh=jB4aRnqp0Iz73opcefr15CPMTEVJfY90MoJ8lf6WMis=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=Nz5iY6n4uE0PVZBrCT98ftvFe3KBHgCBMRsmkr6p1Zn1TTch7ymAfsJOIHrvBgT0L
	 j4RL7uMVNWOtaDw8HK4yD+ADnqxK1nUZ69NLpGvFBFYUG+UTaGramhV1uD8XhVGzIP
	 tlq2cvSk8gCDdj4QnSK/jB6lCayxSLr3yQijJUXKkNb9a+kE4tW9Ml+fWfNn5iV8mL
	 FugZ4ZmRr4FkWD5EEdEW6gHek+UYpgiJV2ABvXZuevhCzDEYv4tPAzD4a6836GK9xp
	 07ia1hq66V05hkazSivl79NV7pQAoR0QNVXCftJRNnpWF+Z06JF4EPghexx9+t3DU3
	 b6IGw8hnIL6rg==
Date: Fri, 18 Apr 2025 13:25:47 +0000
To: Christian Schrefl <chrisi.schrefl@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>
From: Benno Lossin <benno.lossin@proton.me>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH RFC] rust: add UnsafePinned type
Message-ID: <D99SR99KSGLV.3TUC5AEKPHJHL@proton.me>
In-Reply-To: <20250418-rust_unsafe_pinned-v1-1-c4c7558399f8@gmail.com>
References: <20250418-rust_unsafe_pinned-v1-1-c4c7558399f8@gmail.com>
Feedback-ID: 71780778:user:proton
X-Pm-Message-ID: 2b2b13830bfc6aa53813e9c5cf60a4c5dd8c7163
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Fri Apr 18, 2025 at 2:21 PM CEST, Christian Schrefl wrote:
> `UnsafePinned<T>` is useful for cases where a value might be shared with =
C
> code but not directly used by it. In particular this is added for
> storing additional data in the `MiscDeviceRegistration` which will be
> shared between `fops->open` and the containing struct.
>
> Similar to `Opaque` but guarantees that the value is always initialized
> and that the inner value is dropped when `UnsafePinned` is dropped.
>
> This was originally proposed for the IRQ abstractions [0] and is also
> useful for other where the inner data may be aliased, but is always valid
> and automatic `Drop` is desired.
>
> Since then the `UnsafePinned` type was added to upstream Rust [1] as a
> unstable feature, therefore this patch implements the subset required
> for additional data in `MiscDeviceRegistration` on older rust versions
> and using the upstream type on new rust versions which include this
> feature.
>
> Some differences to the upstream type definition are required in the
> kernel implementation, because upstream type uses some compiler changes
> to opt out of certain optimizations, this is documented in a comment on
> the `UnsafePinned` type.
>
> The documentation on is based on the upstream rust documentation with
> minor modifications.
>
> Link: https://lore.kernel.org/rust-for-linux/CAH5fLgiOASgjoYKFz6kWwzLaH07=
DqP2ph+3YyCDh2+gYqGpABA@mail.gmail.com [0]
> Link: https://github.com/rust-lang/rust/pull/137043 [1]
> Suggested-by: Alice Ryhl <aliceryhl@google.com>
> Signed-off-by: Christian Schrefl <chrisi.schrefl@gmail.com>

This probably is another patch by itself, but we should use
`UnsafePinned` in `Opaque` instead of re-implementing it there. Feel
free to open an issue, send a patch or let me open an issue.

> ---
> This patch is mostly to show how the upstream `UnsafePinned`
> Rust type can be used once it is stable.
>
> It is probalby not desired to use the unstable feature before
> that time.

Yeah, we don't want to introduce new unstable features where possible.
If this one is stabilized quickly, then we should add it, but if not,
then we just keep the manual implementation.

>
> To test using the upsteam implementation a fairly new nightly
> rust version is required.
>
> Tested with rustc 1.88.0-nightly (78f2104e3 2025-04-16) and
> rustc 1.78.0 (9b00956e5 2024-04-29).
> ---
>  init/Kconfig                       |  3 ++
>  rust/kernel/lib.rs                 |  1 +
>  rust/kernel/types.rs               | 34 ++++++++++++++
>  rust/kernel/types/unsafe_pinned.rs | 90 ++++++++++++++++++++++++++++++++=
++++++
>  4 files changed, 128 insertions(+)

> diff --git a/rust/kernel/types.rs b/rust/kernel/types.rs
> index 9d0471afc9648f2973235488b441eb109069adb1..c4e234d5c07168295499c2a8f=
ccc70e00e83e7ca 100644
> --- a/rust/kernel/types.rs
> +++ b/rust/kernel/types.rs
> @@ -253,6 +253,9 @@ fn drop(&mut self) {
>  ///
>  /// [`Opaque<T>`] is meant to be used with FFI objects that are never in=
terpreted by Rust code.
>  ///
> +/// In cases where the contained data is only used by Rust, is not allow=
ed to be
> +/// uninitialized and automatic [`Drop`] is desired [`UnsafePinned`] sho=
uld be used instead.
> +///
>  /// It is used to wrap structs from the C side, like for example `Opaque=
<bindings::mutex>`.
>  /// It gets rid of all the usual assumptions that Rust has for a value:
>  ///
> @@ -578,3 +581,34 @@ pub enum Either<L, R> {
>  /// [`NotThreadSafe`]: type@NotThreadSafe
>  #[allow(non_upper_case_globals)]
>  pub const NotThreadSafe: NotThreadSafe =3D PhantomData;
> +
> +// When available use the upstream `UnsafePinned` type
> +#[cfg(CONFIG_RUSTC_HAS_UNSAFE_PINNED)]
> +pub use core::pin::UnsafePinned;
> +
> +// Otherwise us the kernel implementation of `UnsafePinned`
> +#[cfg(not(CONFIG_RUSTC_HAS_UNSAFE_PINNED))]
> +mod unsafe_pinned;
> +#[cfg(not(CONFIG_RUSTC_HAS_UNSAFE_PINNED))]
> +pub use unsafe_pinned::UnsafePinned;
> +
> +/// Trait for creating a [`PinInit`]ialized wrapper containing `T`.
> +// Needs to be defined in kernel crate to get around the Orphan Rule whe=
n upstream `UnsafePinned`
> +// is used.
> +pub trait TryPinInitWrapper<T: ?Sized> {
> +    /// Create an [`Self`] pin-initializer which contains `T`
> +    fn try_pin_init<E>(value: impl PinInit<T, E>) -> impl PinInit<Self, =
E>;
> +}
> +impl<T: ?Sized> TryPinInitWrapper<T> for UnsafePinned<T> {
> +    fn try_pin_init<E>(value: impl PinInit<T, E>) -> impl PinInit<Self, =
E> {
> +        // SAFETY:
> +        //   - In case of an error in `value` the error is returned, oth=
erwise `slot` is fully
> +        //     initialized, since `self.value` is initialized and `_pin`=
 is a zero sized type.
> +        //   - The `Pin` invariants of `self.value` are upheld, since no=
 moving occurs.
> +        unsafe {
> +            pin_init::pin_init_from_closure(move |slot| {
> +                value.__pinned_init(Self::raw_get_mut(slot))
> +            })
> +        }
> +    }
> +}

I'd prefer the impl for `core::pin::UnsafePinned` to exist in
`pin-init`. Do you mind creating a PR on github [1]? If not, just send a
patch and I will upstream it.

[1]: https://github.com/Rust-for-Linux/pin-init

---
Cheers,
Benno

