Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57ADE1E47B3
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 19:56:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748462193; cv=none; b=kUjbRstx2CSGKJdOjfjEYsB3GDhWHTFaVnmZfmKVV6KOnE98rzc1hmckrc2ii+TBsJrtC9lUUNzxljfBKYiuHBsCD7brG0ABgUyzz0c+kQXJBm1smnv8U7kT+Geyg/dE7ulkWY7qNQuKpm6DPTkIkQc8euuGsXjOkQG6AkOt/Gk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748462193; c=relaxed/simple;
	bh=OB7MWLP4yrp3bJtXUUZYYFMCjCcMT3kpUGeeUVvJ74k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=q0RlLSmup1jD1oiStDEzEDDGADBQSHf0PKSZ7eQEoTrcWA1+tUpHEL6QGiDoRwH0YgBcgj6VbVxOWBpr+3mwMLwCUoiXAc/4YPpPY8/WUK6mvgYkTg21sAAE5TbHn1ReicCfRBwtMCDaB51QPDp9cXdOeqb9YHQA6R+5yfQkOpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=OyO5BUz4; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="OyO5BUz4"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-450cd6b511cso1717235e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 12:56:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748462189; x=1749066989; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W8L7PhpfmS2m6BHlUu71cqULvSSH20y8r59Td9C3Kyo=;
        b=OyO5BUz4bG+CxcffXm8uoRbB8uHasH35ebE4tze4v2HHZklsVzC/CYnp8Zxt0/FYeB
         RFkc9vj/yoAfcWvt1NKanDqu3Hom8t3g4lTITym12QgI2CuAdh9uSti1a2NoouY3zgpZ
         jllcn0uNSghGELlI+mO18k3d45ktGYbcB8FTr2NIPtTn0QIPF/C11UcKTpQXpuu8vO0+
         niUjbzmsvz7SAM4agRnxmFSxQY/iepQF9niUN94kxNnlzlM1+khoEF9IxqwsNR2RzDw9
         iQl6iy6/pJsKyqDgPwCRzc+iwjagrv4MwTje8qCNWeMGKDzEl6STc9r20XA60uIDDcnx
         GUsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748462189; x=1749066989;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W8L7PhpfmS2m6BHlUu71cqULvSSH20y8r59Td9C3Kyo=;
        b=UDRKMk+ZCOp9xyUyIdt+KZWZoVGlbZpwvjNjesHW8cmRKAXTudLUgRmiz0NFiBNsZ8
         A3iKdjYy1vuGo8dPYSgwiafgf6YhG+UxjittpStHC8MEeoWjxOj89jIh9l1Bm0en1Qxo
         Lg0wvEFFV+krb+VERa9uyi2fag+MPiRr5sY0gYxFDDJHDz4GXLG+9MyaDMsgvepxi/J0
         Px1UIvCfgSL89DSWXXPjTbarlwPdfvzmovbe5jdXwqlstikv3Y8wt+rLCUTZUPg1iMTw
         tE5Cr3WmghsrSJd0Ngz5Qngs546rXtHxdz6Kh3PLjExt63wgcZk4egEium4GKuQo5AHk
         j0/g==
X-Forwarded-Encrypted: i=1; AJvYcCVXN2lHjLjDr6qEKCszjbkF5YPbqMHS8yukECqDZQHhEVrKCvHziQWCq9ZfWO4xm7+fds0V4+MCaiOLoW4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3l0bf7vA/n6H8Bhgi9j41yw3Bw/HNy7JKQKMktFNZxuwoGdTo
	8JTHi2fSWLKKEV+fGOqFfLvEO1Chi9Hw5ByUm4MVroCbu26GnbB62BSGw5rCJMLL2BLVmQQH1rE
	NXH5SBu04d7ZPxfmEyCFUc/Ye6HyoWPXRkURpoJn1
X-Gm-Gg: ASbGncuL33miNeg5URWALAsNDghMtIweHpXMP8G6tKNA/5t3WI7EqByvFFn0kZclVUG
	N1GzSKR44UVpksChtqY0F5b3xrgOHZzltE+DkMJIpS0Fk9Lt9WoHHHssK2btshApDXoTXOKoykp
	J7gvs05GU5gco8nYw04P0ZqPQL9cMa8fSaeTb6DzZd073N
X-Google-Smtp-Source: AGHT+IFRVTFehgHIP4jtTiYzkqzpeEat7ZA6bJJwBruO3MHFT/UlZRIXUBmqTA+/UeIEFdiM+66uwtk4K0Bw983sfEM=
X-Received: by 2002:a05:6000:402b:b0:3a4:cbc6:9db0 with SMTP id
 ffacd0b85a97d-3a4e95818e6mr3321018f8f.51.1748462189419; Wed, 28 May 2025
 12:56:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250521-nova-frts-v4-0-05dfd4f39479@nvidia.com> <20250521-nova-frts-v4-4-05dfd4f39479@nvidia.com>
In-Reply-To: <20250521-nova-frts-v4-4-05dfd4f39479@nvidia.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 28 May 2025 21:56:17 +0200
X-Gm-Features: AX0GCFvvfi0IO-4qmWiebEf60BPOOjb4AGpy4FTSeIFi9VcgYiwZXSln0SEgVK0
Message-ID: <CAH5fLgg6s2JM3HtzR3jimUnjLY0BBBpnNLuBUdrsOYCqmx+8pg@mail.gmail.com>
Subject: Re: [PATCH v4 04/20] rust: add new `num` module with useful integer operations
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	John Hubbard <jhubbard@nvidia.com>, Ben Skeggs <bskeggs@nvidia.com>, 
	Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
	Alistair Popple <apopple@nvidia.com>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 21, 2025 at 8:45=E2=80=AFAM Alexandre Courbot <acourbot@nvidia.=
com> wrote:
>
> Introduce the `num` module, featuring the `NumExt` extension trait
> that expands unsigned integers with useful operations for the kernel.
>
> These are to be used by the nova-core driver, but they are so ubiquitous
> that other drivers should be able to take advantage of them as well.
>
> The currently implemented operations are:
>
> - align_down()
> - align_up()
> - fls()
>
> But this trait is expected to be expanded further.
>
> `NumExt` is on unsigned types using a macro. An approach using another
> trait constrained by the operator traits that we need (`Add`, `Sub`,
> etc) was also considered, but had to be dropped as we need to use
> wrapping operations, which are not provided by any trait.
>
> Co-developed-by: Joel Fernandes <joelagnelf@nvidia.com>
> Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> ---
>  rust/kernel/lib.rs |  1 +
>  rust/kernel/num.rs | 82 ++++++++++++++++++++++++++++++++++++++++++++++++=
++++++
>  2 files changed, 83 insertions(+)
>
> diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
> index ab0286857061d2de1be0279cbd2cd3490e5a48c3..be75b196aa7a29cf3eed7c902=
ed8fb98689bbb50 100644
> --- a/rust/kernel/lib.rs
> +++ b/rust/kernel/lib.rs
> @@ -67,6 +67,7 @@
>  pub mod miscdevice;
>  #[cfg(CONFIG_NET)]
>  pub mod net;
> +pub mod num;
>  pub mod of;
>  pub mod page;
>  #[cfg(CONFIG_PCI)]
> diff --git a/rust/kernel/num.rs b/rust/kernel/num.rs
> new file mode 100644
> index 0000000000000000000000000000000000000000..05d45b59313d830876c1a7b45=
2827689a6dd5400
> --- /dev/null
> +++ b/rust/kernel/num.rs
> @@ -0,0 +1,82 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +//! Numerical and binary utilities for primitive types.
> +
> +/// Extension trait providing useful methods for the kernel on integers.
> +pub trait NumExt {

I wonder if these should just be standalone methods instead of an
extension trait?

> +    /// Align `self` down to `alignment`.
> +    ///
> +    /// `alignment` must be a power of 2 for accurate results.
> +    ///
> +    /// # Examples
> +    ///
> +    /// ```
> +    /// use kernel::num::NumExt;
> +    ///
> +    /// assert_eq!(0x4fffu32.align_down(0x1000), 0x4000);
> +    /// assert_eq!(0x4fffu32.align_down(0x0), 0x0);
> +    /// ```
> +    fn align_down(self, alignment: Self) -> Self;
> +
> +    /// Align `self` up to `alignment`.
> +    ///
> +    /// `alignment` must be a power of 2 for accurate results.
> +    ///
> +    /// Wraps around to `0` if the requested alignment pushes the result=
 above the type's limits.
> +    ///
> +    /// # Examples
> +    ///
> +    /// ```
> +    /// use kernel::num::NumExt;
> +    ///
> +    /// assert_eq!(0x4fffu32.align_up(0x1000), 0x5000);
> +    /// assert_eq!(0x4000u32.align_up(0x1000), 0x4000);
> +    /// assert_eq!(0x0u32.align_up(0x1000), 0x0);
> +    /// assert_eq!(0xffffu16.align_up(0x100), 0x0);
> +    /// assert_eq!(0x4fffu32.align_up(0x0), 0x0);
> +    /// ```
> +    fn align_up(self, alignment: Self) -> Self;

I would probably make alignment into a const parameter.

fn align_up<ALIGN: usize>(value: usize) -> usize {
    const { assert!(ALIGN.is_power_of_two()) };
    self.wrapping_add(ALIGN.wrapping_sub(1)).align_down(ALIGN)
}

Here the check for power-of-two happens at compile time. Unless you
have cases where the alignment is a dynamic parameter?

Alice
