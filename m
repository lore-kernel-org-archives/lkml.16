Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AC9225DD17;
	Fri, 25 Apr 2025 15:25:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745594744; cv=none; b=jbjC5KaFBXdGRIyiX451t6dN0sU9ZNgkUdSYEAgaaBpB0pM7uI+1BM24glyCGa5EArLkcG0PVsZr5dPXldF6D8C7pQ3Q9HuFbPSX7edkUgw1ovismTjppgXLOzqmDDPTagwgpOmn+jY6st66m0cSvymrUXw6HJ+tqcvgE2RdYQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745594744; c=relaxed/simple;
	bh=UR9k8ahkK/rABhgGKrX88aGg3brU18RdD8D4FOi+JRA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VjVDHg4D7VJkSaF1WmrmlBlbiCLtxGLv+hz4NEYvnzskTvRdVbs8ocNc7un01PhGWUUHjCaIiSKOhY/57ygsRkUF7BW6wvhhTfzQ5/ndVR5suRvBoF3RSLVyYKJrt+cm2jl5OAFIG4DM9bg8PoKJ/ijVJvl60Sa6u4E0DJ9GeJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VUkehgWo; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VUkehgWo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FCA8C4CEE9;
	Fri, 25 Apr 2025 15:25:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745594743;
	bh=UR9k8ahkK/rABhgGKrX88aGg3brU18RdD8D4FOi+JRA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VUkehgWo5fSGTa3UIQfH+yUBoVgaHtTOZynzfixsa9peJma4/QfWx247Wktax5Utt
	 CrQkpDE8AWDhp+VRiDgcvqN0lg6DhiVrD4VfVn05IZmwRgM64xSv3F+E7c1PDfyZDd
	 yZlNWxfsgKDjMZMkEGU6awvDpFhwZ1IV9XhZDb5Vn2+tWokki4W2wcpNyF6GH3AShh
	 mcbXH3difhfvhOdalpfpBLHGi0krnqLOUjWqom0got04TR8J4tGIMV2evlOFMQZLZF
	 3FcqvLMrWfJDGEv7E+qzo2cm0nsYUwIWcNTwiUhTwlOa9g0YR5t6ghhtT4d2JbjW76
	 fKxcbpuf1HiUw==
Date: Fri, 25 Apr 2025 17:25:36 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Remo Senekowitsch <remo@buenzli.dev>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Dirk Behme <dirk.behme@de.bosch.com>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v3 1/7] rust: property: Move property_present to separate
 file
Message-ID: <aAupcPT7GWgndVuA@pollux>
References: <20250425150130.13917-1-remo@buenzli.dev>
 <20250425150130.13917-2-remo@buenzli.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250425150130.13917-2-remo@buenzli.dev>

On Fri, Apr 25, 2025 at 05:01:24PM +0200, Remo Senekowitsch wrote:
> Not all property-related APIs can be exposed directly on a device.
> For example, iterating over child nodes of a device will yield
> fwnode_handle. Thus, in order to access properties on these child nodes,
> the property access methods must be implemented on the abstraction over
> fwnode_handle.
> 
> While it's possible to expose similar methods on `Device` directly for
> convenience, those methods would have to get the `FwNode` first, which
> is a fallible operation, making the API inconsistent. For this reason,
> such duplicated methods are omitted. Users who need to read properties
> of a device will have to explictily get the `FwNode` first (handle the
> `None` case) and then read properties on that.

I think I mentioned that in v2 [1]; when the commit subject says "rust:
property: Move property_present to separate", the commit shouldn't do anything
beyond this scope.

I can see that you switch from device_property_present() to
fwnode_property_present(), without fixing users, so obviously the former is
unused.

Please make the implementation of the FwNode abstraction and the removal of
device_property_present() separate commits.

[1] https://lore.kernel.org/lkml/Z_0xGRsI74PsAL_E@cassiopeiae/

> 
> Signed-off-by: Remo Senekowitsch <remo@buenzli.dev>
> ---
>  MAINTAINERS                              |  3 +-
>  rust/helpers/helpers.c                   |  1 +
>  rust/helpers/property.c                  |  8 +++
>  rust/kernel/{device.rs => device/mod.rs} |  9 +--
>  rust/kernel/device/property.rs           | 70 ++++++++++++++++++++++++
>  5 files changed, 83 insertions(+), 8 deletions(-)
>  create mode 100644 rust/helpers/property.c
>  rename rust/kernel/{device.rs => device/mod.rs} (97%)
>  create mode 100644 rust/kernel/device/property.rs
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index c8d9e8187..4585f9e7f 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -7112,7 +7112,8 @@ F:	include/linux/kobj*
>  F:	include/linux/property.h
>  F:	include/linux/sysfs.h
>  F:	lib/kobj*
> -F:	rust/kernel/device.rs
> +F:	rust/kernel/device/mod.rs
> +F:	rust/kernel/device/property.rs

This should just be

	F:	rust/kernel/device/

>  F:	rust/kernel/device_id.rs
>  F:	rust/kernel/devres.rs
>  F:	rust/kernel/driver.rs
> diff --git a/rust/helpers/helpers.c b/rust/helpers/helpers.c
> index 0640b7e11..b4eec5bf2 100644
> --- a/rust/helpers/helpers.c
> +++ b/rust/helpers/helpers.c
> @@ -23,6 +23,7 @@
>  #include "platform.c"
>  #include "pci.c"
>  #include "pid_namespace.c"
> +#include "property.c"
>  #include "rbtree.c"
>  #include "rcu.c"
>  #include "refcount.c"
> diff --git a/rust/helpers/property.c b/rust/helpers/property.c
> new file mode 100644
> index 000000000..08f68e2da
> --- /dev/null
> +++ b/rust/helpers/property.c
> @@ -0,0 +1,8 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +#include <linux/property.h>
> +
> +void rust_helper_fwnode_handle_put(struct fwnode_handle *fwnode)
> +{
> +	fwnode_handle_put(fwnode);
> +}
> diff --git a/rust/kernel/device.rs b/rust/kernel/device/mod.rs
> similarity index 97%
> rename from rust/kernel/device.rs
> rename to rust/kernel/device/mod.rs
> index db2d9658b..e49107452 100644
> --- a/rust/kernel/device.rs
> +++ b/rust/kernel/device/mod.rs
> @@ -6,7 +6,6 @@
>  
>  use crate::{
>      bindings,
> -    str::CStr,
>      types::{ARef, Opaque},
>  };
>  use core::{fmt, ptr};
> @@ -14,6 +13,8 @@
>  #[cfg(CONFIG_PRINTK)]
>  use crate::c_str;
>  
> +pub mod property;
> +
>  /// A reference-counted device.
>  ///
>  /// This structure represents the Rust abstraction for a C `struct device`. This implementation
> @@ -181,12 +182,6 @@ unsafe fn printk(&self, klevel: &[u8], msg: fmt::Arguments<'_>) {
>              )
>          };
>      }
> -
> -    /// Checks if property is present or not.
> -    pub fn property_present(&self, name: &CStr) -> bool {
> -        // SAFETY: By the invariant of `CStr`, `name` is null-terminated.
> -        unsafe { bindings::device_property_present(self.as_raw().cast_const(), name.as_char_ptr()) }
> -    }
>  }
>  
>  // SAFETY: Instances of `Device` are always reference-counted.
> diff --git a/rust/kernel/device/property.rs b/rust/kernel/device/property.rs
> new file mode 100644
> index 000000000..d89715f7d
> --- /dev/null
> +++ b/rust/kernel/device/property.rs
> @@ -0,0 +1,70 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +//! Unified device property interface.
> +//!
> +//! C header: [`include/linux/property.h`](srctree/include/linux/property.h)
> +
> +use core::ptr;
> +
> +use crate::{bindings, device::Device, str::CStr, types::Opaque};
> +
> +impl Device {
> +    /// Obtain the fwnode corresponding to the device.
> +    pub fn fwnode(&self) -> Option<&FwNode> {
> +        // SAFETY: `self` is valid.
> +        let fwnode_handle = unsafe { bindings::__dev_fwnode(self.as_raw()) };
> +        if fwnode_handle.is_null() {
> +            return None;
> +        }
> +        // SAFETY: `fwnode_handle` is valid. Its lifetime is tied to `&self`. We
> +        // return a reference instead of an `ARef<FwNode>` because `dev_fwnode()`
> +        // doesn't increment the refcount. It is safe to cast from a
> +        // `struct fwnode_handle*` to a `*const FwNode` because `FwNode` is
> +        // defined as a `#[repr(transparent)]` wrapper around `fwnode_handle`.
> +        Some(unsafe { &*fwnode_handle.cast() })
> +    }
> +}

Given that the cover letter says "Remove the duplicated property reading methods
on Device.", I assume that's the only Device method you introduce? If so, please
keep this one in the impl block of device/mod.rs.

Please also rebase onto driver-core-next and put this method in the following
impl block.

	impl<Ctx: DeviceContext> Device<Ctx>

I assume this is valid to call from any device context.
