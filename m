Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D47C41E521B;
	Mon,  9 Jun 2025 22:21:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749507701; cv=none; b=ld3og5q3LVOPwsn33QQ51uC+jR/B5n7YtdW5m/QJV/hrMk3E8xgkN3pgqSkuVUTXqqyJwKTB1scd9EJUimVuNgbvchHE6SMtMz9oLLFY0AV0f2fjb0lP1o1qcUx1+WQYOIcQ/qmLH2LcbZUbSLepy3X2EJ3Eg9kNPoZ+2kNcOeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749507701; c=relaxed/simple;
	bh=55/zozL1WA2j69pcYw/eII5IJQRb9fqNA8Vih0PjwhQ=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=ArLVGJ8MZK/IN+FL2qUvhLVC3dF9z3RgtCRw6LVccMhrD+5Y6iLHsxH1RVBBTH8D+Mx/W8PkesO03PBDSHICIFxnDR3J359DJypY88iPdpYd5CSxhtvWvNLCuJP7kEVbKoAsky2+0cELPiv/ZxIAx9e/r0MYN8sJn0thnvTXh1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HZYnXFNE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HZYnXFNE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 079C7C4CEEB;
	Mon,  9 Jun 2025 22:21:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749507701;
	bh=55/zozL1WA2j69pcYw/eII5IJQRb9fqNA8Vih0PjwhQ=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=HZYnXFNEeuOHLuHHFTmSa2zdWu6nvFdvowgFWZoWqH5c/HzMe7XpMHOgq2VhHHYmK
	 fGFlEWL4lhfuD5gPlwetQluNaf69tatEBwCBImO6gkZ2JejJZSnlrxRALq2e1yM4TX
	 MQwIsgEylaaflARXQ9IyY5lmJ3JUhTw5Oi4v68RpDXw+aVtm6ohLhU0K0vkOgkmybB
	 5Qxo77lR6CteqwV0ksrWfbHdcdthBZCh63yxGKAbWvy47LqvRtSyKdg6cvIFCojR2E
	 0hltYstYaKf2mUaNk/7176LORS14RG+wLf7WvAWqGesFexfScK17WPaOw73R6Ca2pC
	 2tY0wLxPc99+A==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 10 Jun 2025 00:21:37 +0200
Message-Id: <DAICPWRW9TCE.356EEFQOHYWFN@kernel.org>
Cc: <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH] rust: math: Add KernelMathExt trait with a mul_div
 helper
From: "Benno Lossin" <lossin@kernel.org>
To: "Michal Wilczynski" <m.wilczynski@samsung.com>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng"
 <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>,
 "Marek Szyprowski" <m.szyprowski@samsung.com>
X-Mailer: aerc 0.20.1
References: <CGME20250609215523eucas1p22f6d7d84b403badfb77af7df973b97a9@eucas1p2.samsung.com> <20250609-math-rust-v1-v1-1-285fac00031f@samsung.com>
In-Reply-To: <20250609-math-rust-v1-v1-1-285fac00031f@samsung.com>

On Mon Jun 9, 2025 at 11:53 PM CEST, Michal Wilczynski wrote:
> The PWM subsystem and other kernel modules often need to perform a
> 64 by 64-bit multiplication followed by a 64-bit division. Performing
> this naively in Rust risks overflow on the intermediate multiplication.
> The kernel provides the C helper 'mul_u64_u64_div_u64' for this exact
> purpose.
>
> Introduce a safe Rust wrapper for this function to make it available to
> Rust drivers.
>
> Following feedback from the mailing list [1], this functionality is

You could turn this into a `Suggested-by`.

> provided via a 'KernelMathExt' extension trait. This allows for
> idiomatic, method style calls (e.g. val.mul_div()) and provides a
> scalable pattern for adding helpers for other integer types in the
> future.
>
> The safe wrapper is named 'mul_div' and not 'mul_u64_u64_div_u64' [2]
> because its behavior differs from the underlying C function. The C
> helper traps on a division by zero, whereas this safe wrapper returns
> `None`, thus exhibiting different and safer behavior.
>
> This is required for the Rust PWM TH1520 driver [3].
>
> [1] - https://lore.kernel.org/all/DAFQ19RBBSQL.3OGUXOQ0PA9YH@kernel.org/
> [2] - https://lore.kernel.org/all/CANiq72kVvLogBSVKz0eRg6V4LDB1z7b-6y1WPL=
SQfXXLW7X3cw@mail.gmail.com/
> [3] - https://lore.kernel.org/all/20250524-rust-next-pwm-working-fan-for-=
sending-v1-2-bdd2d5094ff7@samsung.com/

Please use the `Link: https://... [.]` format.

>
> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
> ---
>  rust/kernel/lib.rs  |  1 +
>  rust/kernel/math.rs | 34 ++++++++++++++++++++++++++++++++++
>  2 files changed, 35 insertions(+)
>
> diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
> index 6b4774b2b1c37f4da1866e993be6230bc6715841..d652c92633b82525f37e5cd8a=
040d268e0c191d1 100644
> --- a/rust/kernel/lib.rs
> +++ b/rust/kernel/lib.rs
> @@ -85,6 +85,7 @@
>  #[cfg(CONFIG_KUNIT)]
>  pub mod kunit;
>  pub mod list;
> +pub mod math;
>  pub mod miscdevice;
>  pub mod mm;
>  #[cfg(CONFIG_NET)]
> diff --git a/rust/kernel/math.rs b/rust/kernel/math.rs
> new file mode 100644
> index 0000000000000000000000000000000000000000..b89e23f9266117dcf96561fbf=
13b1c66a4851b48
> --- /dev/null
> +++ b/rust/kernel/math.rs
> @@ -0,0 +1,34 @@
> +// SPDX-License-Identifier: GPL-2.0
> +// Copyright (c) 2025 Samsung Electronics Co., Ltd.
> +// Author: Michal Wilczynski <m.wilczynski@samsung.com>
> +
> +//! Safe wrappers for kernel math helpers.

I wouldn't stress the fact that these are safe, they better be!

> +//!
> +//! This module provides safe, idiomatic Rust wrappers for C functions, =
whose
> +//! FFI bindings are auto-generated in the `bindings` crate.
> +
> +use crate::bindings;
> +
> +/// An extension trait that provides access to kernel math helpers on pr=
imitive integer types.
> +pub trait KernelMathExt: Sized {

We should add this trait to the prelude.

> +    /// Multiplies self by `multiplier and divides by divisor.
> +    ///
> +    /// This wrapper around the kernel's `mul_u64_u64_div_u64` C helper =
ensures that no

The trait shouldn't make a reference to `u64`.

> +    /// overflow occurs during the intermediate multiplication.
> +    ///
> +    /// # Returns
> +    /// * Some(result) if the division is successful.

Use backtics (`) for code in documentation and comments.

> +    /// * None if the divisor is zero.
> +    fn mul_div(self, multiplier: Self, divisor: Self) -> Option<Self>;
> +}
> +
> +impl KernelMathExt for u64 {

Can you also implement this for the other types that have a
`mul_..._div` function in the kernel?

> +    fn mul_div(self, multiplier: u64, divisor: u64) -> Option<u64> {
> +        if divisor =3D=3D 0 {
> +            return None;
> +        }
> +        // SAFETY: The C function `mul_u64_u64_div_u64` is safe to call =
because the divisor
> +        // is guaranteed to be non-zero. The FFI bindings use `u64`, mat=
ching our types.

Let's not talk about "safe to call", but rather say it like this:

    // SAFETY: `mul_u64_u64_div_u64` requires the divisor to be non-zero
    // which is checked above. It has no other requirements.

---
Cheers,
Benno

> +        Some(unsafe { bindings::mul_u64_u64_div_u64(self, multiplier, di=
visor) })
> +    }
> +}
>
> ---
> base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
> change-id: 20250609-math-rust-v1-d3989515e32e
>
> Best regards,

