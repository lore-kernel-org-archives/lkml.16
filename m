Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61DD723909A;
	Thu,  6 Feb 2025 22:30:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738881030; cv=none; b=WFf9pbfHFYhvUxvlT1HyxZza9JwsMxw+ZD/5H6PgeehcEKHvgvvgUp0EMBA7JYAZI/NMWzwGQgMKyEvWuknQsBJVSQadYfu6nSzauiMCkYGH2y2LXc6nmWa8MLflcCuCotS/8MccUVrJej5Kskn57ZNPwSRp1VyGULaXRJWCB8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738881030; c=relaxed/simple;
	bh=I9e8qohZ0axoeUAGmZ65q4ftkunmfJYqkr5WGaRSb4Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SETTvotu5h7Dcrwvtnc+vzciWuS+0+5Eg99bI2dX27LaCvm8eql4zpXJ12OF0YXoXrS9l0RCFcJJ8n0AlsO37afhPonPPLGssf+f2iuX4KY8/dS8mjIW2eSNRia5mUFkoqyvur4F3VLVFX3AC0Pu7BZg+meU6SiU6RkU2CnCcnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ufQQRXjd; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ufQQRXjd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1BBBC4CEE0;
	Thu,  6 Feb 2025 22:30:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738881030;
	bh=I9e8qohZ0axoeUAGmZ65q4ftkunmfJYqkr5WGaRSb4Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ufQQRXjdCdn+JGrggv8f+w5o4gJUqxK+96rzGg3PrcMbBb70fY2nexhrKj9KSfY3m
	 wrS2dP52K6znt4nkhTDtK5+ij6n3smkr6GjK6wzdhppFPyPElnlD/8jXbJoLOjnnmy
	 9ar7/NFjPz7t6kb/ZdGeRYUqmrL1TVoBFFdrytyT3+mUwsl+JU12M6t43iUWdb8XP+
	 EqpEW+5Mgx5ROgnz/NgJfF+pqaP3AAVhr/q2r1QdG5TAm1FPN0r5d9V6gWbVnghzzL
	 DmQuK5PURweTpTymNDyHZ/eCxJLZCfMNh0xUsW4A4wl5BHP4Y70YcTG/6ZWZaeOTxu
	 ksf9B11Dr9OVA==
Date: Thu, 6 Feb 2025 23:30:24 +0100
From: Danilo Krummrich <dakr@kernel.org>
To: Lyude Paul <lyude@redhat.com>
Cc: rust-for-linux@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	=?iso-8859-1?Q?Ma=EDra?= Canal <mairacanal@riseup.net>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Wedson Almeida Filho <wedsonaf@gmail.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Xiangfei Ding <dingxiangfei2009@gmail.com>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] rust/kernel: Add faux device bindings
Message-ID: <Z6U4APfuIEOgMzmd@cassiopeiae>
References: <20250206210503.102061-2-lyude@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250206210503.102061-2-lyude@redhat.com>

On Thu, Feb 06, 2025 at 04:04:56PM -0500, Lyude Paul wrote:
> This introduces a crate for working with faux devices in rust, along with
> adding sample code to show how the API is used. Unlike other types of
> devices, we don't provide any hooks for device probe/removal - since these
> are optional for the faux API and are unnecessary in rust.
> 
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Maíra Canal <mairacanal@riseup.net>
> ---
>  rust/bindings/bindings_helper.h  |  1 +
>  rust/kernel/faux.rs              | 60 ++++++++++++++++++++++++++++++++
>  rust/kernel/lib.rs               |  1 +
>  samples/rust/Kconfig             | 10 ++++++
>  samples/rust/Makefile            |  1 +
>  samples/rust/rust_driver_faux.rs | 29 +++++++++++++++
>  6 files changed, 102 insertions(+)
>  create mode 100644 rust/kernel/faux.rs
>  create mode 100644 samples/rust/rust_driver_faux.rs
> 
> diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
> index 55354e4dec14e..f46cf3bb70695 100644
> --- a/rust/bindings/bindings_helper.h
> +++ b/rust/bindings/bindings_helper.h
> @@ -11,6 +11,7 @@
>  #include <linux/blk_types.h>
>  #include <linux/blkdev.h>
>  #include <linux/cred.h>
> +#include <linux/device/faux.h>
>  #include <linux/errname.h>
>  #include <linux/ethtool.h>
>  #include <linux/file.h>
> diff --git a/rust/kernel/faux.rs b/rust/kernel/faux.rs
> new file mode 100644
> index 0000000000000..5e58f397b747a
> --- /dev/null
> +++ b/rust/kernel/faux.rs
> @@ -0,0 +1,60 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +
> +//! Abstractions for the faux bus.
> +//!
> +//! This crate provides bindings for working with faux devices in kernel modules. It should be
> +//! preferred for creating virtual devices over the platform API.

"preferred" implies a bit that platform devices are still an option for that
(even if not preferred). Maybe just not mention it at all. But if you want to,
maybe something along the lines of "faux devices are the solution for the
historical abuse of platform devices as virtual devices"?

> +//!
> +//! C header: [`include/linux/device/faux.h`]
> +use crate::{bindings, device, error::from_err_ptr, prelude::*};
> +use core::ptr::{addr_of_mut, null, NonNull};
> +
> +/// The faux device representation.
> +///
> +/// This type represents the registration of a [`struct faux_device`]. When an instance of this type
> +/// is dropped, its respective faux device will be unregistered from the system.

Ultimately, this will be used to be passed to C APIs, such as drm_dev_alloc(),
which increment the reference count of the underlying struct device.

Should we consider that in Rust we may have a need to take additional references
in the future too?

Maybe it would be more future proof to call this structure `Registration` and
leave us the option to define faux::Device for reference counting later on.
