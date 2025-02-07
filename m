Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59BA116C684;
	Fri,  7 Feb 2025 09:25:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738920313; cv=none; b=OSOz+LawDiEyx0zuWSaWThl6hPqFHhMaN3qNw+J6ngr2HzQwI5AyVBQFYd91iJ+C0m9vJPJZVzeaq5FYcofIZSjDJMCbVSax1wigIF4OvPHpoYh/qy0zHuQWe1ky1ICrfHKb8BgQkh0SX24vcwMqk/kGUhKxHRz1L1Qk5To1FmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738920313; c=relaxed/simple;
	bh=j7NZ592ObhmRqMduDCt2UpHYRpl83I9Gehluff8HqEw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Xe7Gm1nJV3PvqfFYjCiF+Bn5nHPf8GiG0XnUc5waEQraXqy4q4B3xIiYe6bLiKMKkXChjKCWv/gJ9uQyBNAVAJ1mT/W4tY9R9Pc1PoKglI9Ge0PlhKS6ypafL0SWNAAC90TrvzZF1cOSWR6YmADXb3GznwNSkB9ffVgE5kzTdXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=gw9soQPm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="gw9soQPm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2586CC4CED1;
	Fri,  7 Feb 2025 09:25:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1738920312;
	bh=j7NZ592ObhmRqMduDCt2UpHYRpl83I9Gehluff8HqEw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gw9soQPm7nVKvjwqsteAJt6dH/p8KPALYVT0GxmzjQnSmIqTDmkzYEAjAcFje/Mgm
	 tNVfWnV+3oXrulY2HhYCUQCPlrcRMuOQwHnzji+6G+z2qaZwwjme1++XiySjZTYi8o
	 t0ZKEwdi5rgsKTpsy/hQ7UAi7hLAqV66tzRV7Ftk=
Date: Fri, 7 Feb 2025 10:25:09 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Lyude Paul <lyude@redhat.com>
Cc: rust-for-linux@vger.kernel.org,
	=?iso-8859-1?Q?Ma=EDra?= Canal <mairacanal@riseup.net>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Wedson Almeida Filho <wedsonaf@gmail.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Xiangfei Ding <dingxiangfei2009@gmail.com>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] rust/kernel: Add faux device bindings
Message-ID: <2025020702-garlic-kindly-8377@gregkh>
References: <20250207004049.178049-1-lyude@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250207004049.178049-1-lyude@redhat.com>

On Thu, Feb 06, 2025 at 07:40:45PM -0500, Lyude Paul wrote:
> This introduces a crate for working with faux devices in rust, along with
> adding sample code to show how the API is used. Unlike other types of
> devices, we don't provide any hooks for device probe/removal - since these
> are optional for the faux API and are unnecessary in rust.
> 
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Maíra Canal <mairacanal@riseup.net>
> 
> ---
> V2:
> * Check for NULL on return from device_create(), not a pointer error
> * Rename Device to Registration to make its purpose more clear
> * Drop platform device comment from crate docstring.
> * Update MAINTAINERS
> 
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> ---
>  MAINTAINERS                      |  2 ++
>  rust/bindings/bindings_helper.h  |  1 +
>  rust/kernel/faux.rs              | 60 ++++++++++++++++++++++++++++++++
>  rust/kernel/lib.rs               |  1 +
>  samples/rust/Kconfig             | 10 ++++++
>  samples/rust/Makefile            |  1 +
>  samples/rust/rust_driver_faux.rs | 29 +++++++++++++++
>  7 files changed, 104 insertions(+)
>  create mode 100644 rust/kernel/faux.rs
>  create mode 100644 samples/rust/rust_driver_faux.rs
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 2f0dc98dab5fa..aa81e57b4c25c 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -7119,8 +7119,10 @@ F:	rust/kernel/device.rs
>  F:	rust/kernel/device_id.rs
>  F:	rust/kernel/devres.rs
>  F:	rust/kernel/driver.rs
> +F:	rust/kernel/faux.rs
>  F:	rust/kernel/platform.rs
>  F:	samples/rust/rust_driver_platform.rs
> +F:	samples/rust/rust_driver_faux.rs
>  
>  DRIVERS FOR OMAP ADAPTIVE VOLTAGE SCALING (AVS)
>  M:	Nishanth Menon <nm@ti.com>
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
> index 0000000000000..6c0a795b27477
> --- /dev/null
> +++ b/rust/kernel/faux.rs
> @@ -0,0 +1,60 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +

No copyright line?  I think your company would object to that, but if
not, it's fine, just note that I'm required to ask about it.

> +//! Abstractions for the faux bus.
> +//!
> +//! This crate provides bindings for working with faux devices in kernel modules.
> +//!
> +//! C header: [`include/linux/device/faux.h`]
> +use crate::{bindings, device, error::code::*, prelude::*};
> +use core::ptr::{addr_of_mut, null, NonNull};
> +
> +/// The registration of a faux device.
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
> +pub struct Registration(NonNull<bindings::faux_device>);
> +
> +impl Registration {
> +    /// Create and register a new faux device with the given name.
> +    pub fn new(name: &CStr) -> Result<Self> {
> +        // SAFETY:
> +        // - `name` is copied by this function into its own storage
> +        // - `faux_ops` is safe to leave NULL according to the C API
> +        let dev = unsafe { bindings::faux_device_create(name.as_char_ptr(), null()) };

I'm fine with null() here, but why wouldn't a rust binding want to allow
this?  What's unique here that make it this way, or is it just that the
current users you are thinking of don't care about it?


> +
> +        // The above function will return either a valid device, or NULL on failure
> +        Ok(Self(NonNull::new(dev).ok_or(ENOMEM)?))

ENODEV please, that's what I used for other return errors in drivers
when NULL was returned here.


> +    }
> +
> +    fn as_raw(&self) -> *mut bindings::faux_device {
> +        self.0.as_ptr()
> +    }
> +}
> +
> +impl AsRef<device::Device> for Registration {
> +    fn as_ref(&self) -> &device::Device {
> +        // SAFETY: The underlying `device` in `faux_device` is guaranteed by the C API to be
> +        // a valid initialized `device`.
> +        unsafe { device::Device::as_ref(addr_of_mut!((*self.as_raw()).dev)) }

Just curious, this is returning an incremented "struct device" to the
caller, right?  And then when it goes out of scope it will have the
reference decremented?  And do you need a wrapper in C to get to ".dev"
of the faux_device structure or are you ok doing it like this?

> +    }
> +}
> +
> +impl Drop for Registration {
> +    fn drop(&mut self) {
> +        // SAFETY: self.0 is a valid registered faux_device via our type invariants.
> +        unsafe { bindings::faux_device_destroy(self.as_raw()) }
> +    }
> +}
> +
> +// SAFETY: The faux device API is thread-safe
> +unsafe impl Send for Registration {}
> +
> +// SAFETY: The faux device API is thread-safe
> +unsafe impl Sync for Registration {}
> diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
> index 496ed32b0911a..398242f92a961 100644
> --- a/rust/kernel/lib.rs
> +++ b/rust/kernel/lib.rs
> @@ -46,6 +46,7 @@
>  pub mod devres;
>  pub mod driver;
>  pub mod error;
> +pub mod faux;
>  #[cfg(CONFIG_RUST_FW_LOADER_ABSTRACTIONS)]
>  pub mod firmware;
>  pub mod fs;
> diff --git a/samples/rust/Kconfig b/samples/rust/Kconfig
> index 918dbead2c0b4..3b6eae84b2977 100644
> --- a/samples/rust/Kconfig
> +++ b/samples/rust/Kconfig
> @@ -61,6 +61,16 @@ config SAMPLE_RUST_DRIVER_PLATFORM
>  
>  	  If unsure, say N.
>  
> +config SAMPLE_RUST_DRIVER_FAUX
> +	tristate "Faux Driver"
> +	help
> +	  This option builds the Rust Faux driver sample.
> +
> +	  To compile this as a module, choose M here:
> +	  the module will be called rust_driver_faux.
> +
> +	  If unsure, say N.
> +
>  config SAMPLE_RUST_HOSTPROGS
>  	bool "Host programs"
>  	help
> diff --git a/samples/rust/Makefile b/samples/rust/Makefile
> index 5a8ab0df0567c..0dbc6d90f1ef9 100644
> --- a/samples/rust/Makefile
> +++ b/samples/rust/Makefile
> @@ -6,6 +6,7 @@ obj-$(CONFIG_SAMPLE_RUST_MISC_DEVICE)		+= rust_misc_device.o
>  obj-$(CONFIG_SAMPLE_RUST_PRINT)			+= rust_print.o
>  obj-$(CONFIG_SAMPLE_RUST_DRIVER_PCI)		+= rust_driver_pci.o
>  obj-$(CONFIG_SAMPLE_RUST_DRIVER_PLATFORM)	+= rust_driver_platform.o
> +obj-$(CONFIG_SAMPLE_RUST_DRIVER_FAUX)		+= rust_driver_faux.o
>  
>  rust_print-y := rust_print_main.o rust_print_events.o
>  
> diff --git a/samples/rust/rust_driver_faux.rs b/samples/rust/rust_driver_faux.rs
> new file mode 100644
> index 0000000000000..81ec465d52651
> --- /dev/null
> +++ b/samples/rust/rust_driver_faux.rs
> @@ -0,0 +1,29 @@
> +// SPDX-License-Identifier: GPL-2.0
> +

Again, copyright line?

And above you have:
	// SPDX-License-Identifier: GPL-2.0-only

Which I know is identical to the one you list here, but in the same
commit you might want to be consistent :)



> +//! Rust faux device sample.
> +
> +use kernel::{c_str, faux::*, prelude::*, Module};
> +
> +module! {
> +    type: SampleModule,
> +    name: "rust_faux_driver",
> +    author: "Lyude Paul",
> +    description: "Rust faux device sample",
> +    license: "GPL",
> +}
> +
> +struct SampleModule {
> +    _dev: Registration,
> +}
> +
> +impl Module for SampleModule {
> +    fn init(_module: &'static ThisModule) -> Result<Self> {
> +        pr_info!("Initialising Rust Faux Device Sample\n");
> +
> +        let dev = Registration::new(c_str!("rust-faux-sample-device"))?;
> +
> +        dev_info!(dev.as_ref(), "Hello from faux device!");

Missing "\n"?

Anyway, just tiny nits, overall this looks great.  I'll be glad to apply
it to my tree when I get a version of the faux_device code merged there.

thanks,

greg k-h
