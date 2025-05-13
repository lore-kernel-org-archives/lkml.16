Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ED4B1E990E;
	Tue, 13 May 2025 20:51:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747169469; cv=none; b=CphEnNLrIHj4yU/e8eFAAh6FVR64QTdZqOq9hqbZ7YhGuq5SOfdT+FTiAkf2L5Zx58Pn+TWDt6tANAg/h/iYXqSoHy9Vkdqh7iqSjX4sKbrsYl3v69kdKciBhXLgt4fLP7gQjlB18iVCjQfYrLl4i+PxqCfHYJF2C3m69B8dI8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747169469; c=relaxed/simple;
	bh=/nZJLAhsSDA0It7xUUwsHHnU0UTmtZ4Rw9HOYZLXToI=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=WR2lGtiy8IdwTfJYs+oh0+O8g1LSoRFq1h/jLu9eyDRP2R6/fVSnjSd+xZms2CuBncHG0dOMQzkI/tVyViO/E+O8KxL5I1mHCrjveypODPXWoTNFRD+0UZp9s8ihVXpHVQEsVS6FR5KUvA8fLJ/rRB7AL3Fobz0TSi3LYg1n3fI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LGmDQsfJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LGmDQsfJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5BB3C4CEEB;
	Tue, 13 May 2025 20:51:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747169468;
	bh=/nZJLAhsSDA0It7xUUwsHHnU0UTmtZ4Rw9HOYZLXToI=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=LGmDQsfJ6O4XYzLbxjtu/upezFQEG7dFe6UmUMQP02SIypRFkgT8U2JIrUszWCy22
	 lJzAxwhIuwGnySb+V3TnBx0bBzyPl4jA0CpsffsHD9V7EBZ4nzG8l2POmTRqSYGHB7
	 iz0CIe0PEyvKw1ptTG8pubzcypTZYnvl4vGCnWGOP5DV8JPDLjsjyUDxG4IKCPNcgs
	 4dlLx448+EJtD1GFkFASzmUfx3Jxxi1buGreQx+5hhm3oAkqxKHt7PSXkCtSKDalRK
	 pOOcjytqXbPClP2AqGKhMEsHNjnojpL1IWOOuUm21wdK8FBBtmlA+s0yBkeuyK/QxY
	 1s+vyc3hLytvw==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 13 May 2025 22:51:03 +0200
Message-Id: <D9VBVURZLSNT.4BTQQ8UCTGPJ@kernel.org>
Subject: Re: [PATCH v4 1/3] rust: add UnsafePinned type
From: "Benno Lossin" <lossin@kernel.org>
To: "Christian Schrefl" <chrisi.schrefl@gmail.com>, "Sky" <sky@sky9.dev>,
 "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>,
 "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <benno.lossin@proton.me>, "Andreas Hindborg" <a.hindborg@kernel.org>,
 "Alice Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 "Danilo Krummrich" <dakr@kernel.org>, =?utf-8?q?Gerald_Wisb=C3=B6ck?=
 <gerald.wisboeck@feather.ink>, "Nathan Chancellor" <nathan@kernel.org>,
 "Nick Desaulniers" <nick.desaulniers+lkml@gmail.com>, "Bill Wendling"
 <morbo@google.com>, "Justin Stitt" <justinstitt@google.com>
Cc: <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>,
 <llvm@lists.linux.dev>
X-Mailer: aerc 0.20.1
References: <20250511-rust_unsafe_pinned-v4-0-a86c32e47e3d@gmail.com>
 <20250511-rust_unsafe_pinned-v4-1-a86c32e47e3d@gmail.com>
In-Reply-To: <20250511-rust_unsafe_pinned-v4-1-a86c32e47e3d@gmail.com>

On Sun May 11, 2025 at 8:21 PM CEST, Christian Schrefl wrote:
> `UnsafePinned<T>` is useful for cases where a value might be shared with
> C code but not directly used by it. In particular this is added for
> storing additional data in the `MiscDeviceRegistration` which will be
> shared between `fops->open` and the containing struct.
>
> Similar to `Opaque` but guarantees that the value is always initialized
> and that the inner value is dropped when `UnsafePinned` is dropped.
>
> This was originally proposed for the IRQ abstractions [0] and is also
> useful for other where the inner data may be aliased, but is always
> valid and automatic `Drop` is desired.
>
> Since then the `UnsafePinned` type was added to upstream Rust [1] by Sky
> as a unstable feature, therefore this patch implements the subset of the
> upstream API for the `UnsafePinned` type required for additional data in
> `MiscDeviceRegistration` and in the implementation of the `Opaque` type.
>
> Some differences to the upstream type definition are required in the
> kernel implementation, because upstream type uses some compiler changes
> to opt out of certain optimizations, this is documented in the
> documentation and a comment on the `UnsafePinned` type.
>
> The documentation on is based on the upstream rust documentation with
> minor modifications for the kernel implementation.
>
> Link: https://lore.kernel.org/rust-for-linux/CAH5fLgiOASgjoYKFz6kWwzLaH07=
DqP2ph+3YyCDh2+gYqGpABA@mail.gmail.com [0]
> Link: https://github.com/rust-lang/rust/pull/137043 [1]
> Suggested-by: Alice Ryhl <aliceryhl@google.com>
> Reviewed-by: Gerald Wisb=C3=B6ck <gerald.wisboeck@feather.ink>
> Reviewed-by: Alice Ryhl <aliceryhl@google.com>
> Co-developed-by: Sky <sky@sky9.dev>
> Signed-off-by: Sky <sky@sky9.dev>
> Signed-off-by: Christian Schrefl <chrisi.schrefl@gmail.com>

One nit below, with that fixed:

Reviewed-by: Benno Lossin <lossin@kernel.org>

> ---
>  rust/kernel/types.rs               |   6 ++
>  rust/kernel/types/unsafe_pinned.rs | 111 +++++++++++++++++++++++++++++++=
++++++
>  2 files changed, 117 insertions(+)
>
> diff --git a/rust/kernel/types.rs b/rust/kernel/types.rs
> index 9d0471afc9648f2973235488b441eb109069adb1..705f420fdfbc4a576de1c4546=
578f2f04cdf615e 100644
> --- a/rust/kernel/types.rs
> +++ b/rust/kernel/types.rs
> @@ -578,3 +581,6 @@ pub enum Either<L, R> {
>  /// [`NotThreadSafe`]: type@NotThreadSafe
>  #[allow(non_upper_case_globals)]
>  pub const NotThreadSafe: NotThreadSafe =3D PhantomData;
> +
> +mod unsafe_pinned;
> +pub use unsafe_pinned::UnsafePinned;

I would put `mod` to the top of the=20

---
Cheers,
Benno
