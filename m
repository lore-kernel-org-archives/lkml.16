Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EC25223309;
	Thu,  6 Feb 2025 21:44:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738878288; cv=none; b=IrnrLvI7qE57UHpuLQQjspkjLYMe36XuJmc/J3bqbBcfxM7KNCMnDo53TBF6EttCZgec6rkodl/++MWxSwH1vnlU2FBFfGNGClC/B1wn9pPdrqWJV8LB/UcGFCpSqh/PBgyG4qKC7NAYjWVzEF3jLc4X8uiQP3BLZoVb63aE8Hc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738878288; c=relaxed/simple;
	bh=tMuc8lNWLyZacD543ngw7lyFrwdEqvWH9RTr+7RhSsI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Uvk10pU36ujhVgt2YNBts/k4ODs/CfLeIIlFXTV6ILPkvVPRqinLffxRleyJr47PvQS9smS8hJirSmC7lvx44bf0+rKuiZQuET1aX/+bZ3qp/attW/BA2Nvgrqwb6v2X/C8oVBNLAREEFSNs9Rs6uBVOb2+qkD9keOAs1px4WnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=pJBgoqRc; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="pJBgoqRc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1738878280;
	bh=tMuc8lNWLyZacD543ngw7lyFrwdEqvWH9RTr+7RhSsI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pJBgoqRcav3jlzs4U95lIYyvvuCPJnXj5hRHDdXREYXoi8e0zOGZ0tRrkbuTAcAIZ
	 xNH16I5IYy/xs1sZlJmI9v2075YMV90X3aLxJKHDn65+EdiITVG9o+JqqQ2p1bUVOS
	 t/4aVXuJLdoGeJ8OxFR+ePIMQYW+bmH/4wylAJWE=
Date: Thu, 6 Feb 2025 22:44:39 +0100
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: Lyude Paul <lyude@redhat.com>
Cc: rust-for-linux@vger.kernel.org, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, =?utf-8?B?TWHDrXJh?= Canal <mairacanal@riseup.net>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, 
	Xiangfei Ding <dingxiangfei2009@gmail.com>, open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] rust/kernel: Add faux device bindings
Message-ID: <7c2b7173-6979-497e-840c-7b82b0c69e01@t-8ch.de>
References: <20250206210503.102061-2-lyude@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250206210503.102061-2-lyude@redhat.com>

On 2025-02-06 16:04:56-0500, Lyude Paul wrote:
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

<snip>

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
> +//!
> +//! C header: [`include/linux/device/faux.h`]
> +use crate::{bindings, device, error::from_err_ptr, prelude::*};
> +use core::ptr::{addr_of_mut, null, NonNull};
> +
> +/// The faux device representation.
> +///
> +/// This type represents the registration of a [`struct faux_device`]. When an instance of this type
> +/// is dropped, its respective faux device will be unregistered from the system.
> +///
> +/// # Invariants
> +///
> +/// `self.0` always holds a valid pointer to an initialized and registered [`struct faux_device`].
> +///
> +/// [`struct faux_device`]: srctree/include/linux/device/faux.h
> +#[repr(transparent)]
> +pub struct Device(NonNull<bindings::faux_device>);
> +
> +impl Device {
> +    /// Create and register a new faux device with the given name.
> +    pub fn new(name: &CStr) -> Result<Self> {
> +        // SAFETY:
> +        // - `name` is copied by this function into its own storage
> +        // - `faux_ops` is safe to leave NULL according to the C API
> +        // - `faux_device_create` returns a valid non-null pointer to a `faux_device`, or error

In the v3 patch the C API returns NULL on error.

> +        from_err_ptr(unsafe { bindings::faux_device_create(name.as_char_ptr(), null()) })
> +            .map(|d| Self(unsafe { NonNull::new_unchecked(d) }))
> +    }
> +
> +    fn as_raw(&self) -> *mut bindings::faux_device {
> +        self.0.as_ptr()
> +    }
> +}
> +
> +impl AsRef<device::Device> for Device {
> +    fn as_ref(&self) -> &device::Device {
> +        // SAFETY: The underlying `device` in `faux_device` is guaranteed by the C API to be
> +        // a valid initialized `device`.
> +        unsafe { device::Device::as_ref(addr_of_mut!((*self.as_raw()).dev)) }
> +    }
> +}
> +
> +impl Drop for Device {
> +    fn drop(&mut self) {
> +        // SAFETY: self.0 is a valid registered faux_device via our type invariants.
> +        unsafe { bindings::faux_device_destroy(self.as_raw()) }
> +    }
> +}
> +
> +// SAFETY: The faux device API is thread-safe
> +unsafe impl Send for Device {}
> +
> +// SAFETY: The faux device API is thread-safe
> +unsafe impl Sync for Device {}

<snip>
