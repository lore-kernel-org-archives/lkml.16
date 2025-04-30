Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9938924728A;
	Wed, 30 Apr 2025 12:06:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746014766; cv=none; b=HkD7E7WwskIufzyjc9nlzR8q4cfHeXWbfIxeRd+nWMwuN5RvFnLFSanfENiNc2tbdC6SCXz/rhXJ+JQdBwicCEgoGC9j1Nses0svZbAU7PYuYScSlNjOIx9r8PmgrK6Jw1JkUiGjZiznIRi97otQHixt7CreXkj66IulIcHMTe4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746014766; c=relaxed/simple;
	bh=6QsmG5+8RXEynzoAtLsN/GVGfK6tfRkt+ypGhlBHumk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OiwDdoCWmaodROI+TIbmO1CfyT48R1zsaUiK0NxqbvIr/93ySwfS5KPPrP6Sfv4hqFjVNzaXHUaOc72jpK/EGc2ovWfOCGybVZqDW6hY6JXlUhIM82gXyA9hHK9/3y5TllB1xjUbM9w5tC4cHDPnOcKiCN1C6xngiJHOxts2Gjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=ibN1CAmJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="ibN1CAmJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63112C4CEEB;
	Wed, 30 Apr 2025 12:06:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1746014766;
	bh=6QsmG5+8RXEynzoAtLsN/GVGfK6tfRkt+ypGhlBHumk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ibN1CAmJONwSML0zge2GMgjeSVioooDndxsAyfS41RzbB4gpM9B5Tce+cgYT1aeeX
	 6ZUuwaKrXixv/LaMLlFo9rlYINEQ45PK7pUIYc6favxk7mF9Vv2vgbRVkH/by+pR7w
	 aPoZ7N2hyNz/R3FJ3LO/nSiUBPniGj23asEDd6KM=
Date: Wed, 30 Apr 2025 09:50:44 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Matthew Maurer <mmaurer@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH 1/8] rust: debugfs: Bind DebugFS directory creation
Message-ID: <2025043021-plaza-grip-2916@gregkh>
References: <20250429-debugfs-rust-v1-0-6b6e7cb7929f@google.com>
 <20250429-debugfs-rust-v1-1-6b6e7cb7929f@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250429-debugfs-rust-v1-1-6b6e7cb7929f@google.com>

On Tue, Apr 29, 2025 at 11:15:55PM +0000, Matthew Maurer wrote:
> The basic API relies on `dput` to prevent leaks. Use of `debugfs_remove`
> is delayed until the more full-featured API, because we need to avoid
> the user having an reference to a dir that is recursively removed.
> 
> Signed-off-by: Matthew Maurer <mmaurer@google.com>

First off, many thanks for doing this.  I like this in general, but I
have loads of specific questions/comments.  Don't take that as a
criticism of this feature, I really want these bindings to be in the
tree and work hopefully better/cleaner than the userspace ones do.

First off, the main "rule" of debugfs is that you should NEVER care
about the return value of any debugfs function.  So much so that the C
side hides errors almost entirely where possible.  I'd like to see this
carried through to the Rust side as well, but I think you didn't do that
for various "traditional" reasons.

Please try to unwind all of that in your next version, I'll point this
out below in one place:


> ---
>  MAINTAINERS                     |   1 +
>  rust/bindings/bindings_helper.h |   1 +
>  rust/helpers/dcache.c           |  12 +++++
>  rust/helpers/helpers.c          |   1 +
>  rust/kernel/debugfs.rs          | 100 ++++++++++++++++++++++++++++++++++++++++
>  rust/kernel/lib.rs              |   1 +
>  6 files changed, 116 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 906881b6c5cb6ff743e13b251873b89138c69a1c..a3b835e427b083a4ddd690d9e7739851f0af47ae 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -7271,6 +7271,7 @@ F:	include/linux/kobj*
>  F:	include/linux/property.h
>  F:	include/linux/sysfs.h
>  F:	lib/kobj*
> +F:	rust/kernel/debugfs.rs
>  F:	rust/kernel/device.rs
>  F:	rust/kernel/device_id.rs
>  F:	rust/kernel/devres.rs
> diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
> index 8a2add69e5d66d1c2ebed9d2c950380e61c48842..787f928467faabd02a7f3cf041378fac856c4f89 100644
> --- a/rust/bindings/bindings_helper.h
> +++ b/rust/bindings/bindings_helper.h
> @@ -13,6 +13,7 @@
>  #include <linux/blkdev.h>
>  #include <linux/cpumask.h>
>  #include <linux/cred.h>
> +#include <linux/debugfs.h>
>  #include <linux/device/faux.h>
>  #include <linux/dma-mapping.h>
>  #include <linux/errname.h>
> diff --git a/rust/helpers/dcache.c b/rust/helpers/dcache.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..2396cdaa89a95a2be69fd84ec205e0f5f1b63f0c
> --- /dev/null
> +++ b/rust/helpers/dcache.c
> @@ -0,0 +1,12 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +/*
> + * Copyright (C) 2025 Google LLC.
> + */
> +
> +#include <linux/dcache.h>
> +
> +struct dentry *rust_helper_dget(struct dentry *d)
> +{
> +	return dget(d);
> +}
> diff --git a/rust/helpers/helpers.c b/rust/helpers/helpers.c
> index f34320e6d1f2fb56cc151ee2ffe5d331713fd36a..95f486c1175191483297b7140b99f1aa364c081c 100644
> --- a/rust/helpers/helpers.c
> +++ b/rust/helpers/helpers.c
> @@ -15,6 +15,7 @@
>  #include "cpumask.c"
>  #include "cred.c"
>  #include "device.c"
> +#include "dcache.c"
>  #include "dma.c"
>  #include "err.c"
>  #include "fs.c"
> diff --git a/rust/kernel/debugfs.rs b/rust/kernel/debugfs.rs
> new file mode 100644
> index 0000000000000000000000000000000000000000..4d06cce7099607f95b684bad329f791a815d3e86
> --- /dev/null
> +++ b/rust/kernel/debugfs.rs
> @@ -0,0 +1,100 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +// Copyright (C) 2025 Google LLC.
> +
> +//! DebugFS Abstraction
> +//!
> +//! C header: [`include/linux/debugfs.h`](srctree/include/linux/debugfs.h)
> +
> +use crate::error::{from_err_ptr, Result};
> +use crate::str::CStr;
> +use crate::types::{ARef, AlwaysRefCounted, Opaque};
> +use core::ptr::NonNull;
> +
> +/// Handle to a DebugFS directory.
> +pub struct Dir {
> +    inner: Opaque<bindings::dentry>,
> +}
> +
> +// SAFETY: Dir is just a `dentry` under the hood, which the API promises can be transferred
> +// between threads.
> +unsafe impl Send for Dir {}
> +
> +// SAFETY: All the native functions we re-export use interior locking, and the contents of the
> +// struct are opaque to Rust.
> +unsafe impl Sync for Dir {}
> +
> +// SAFETY: Dir is actually `dentry`, and dget/dput are the reference counting functions
> +// for it.
> +unsafe impl AlwaysRefCounted for Dir {
> +    #[inline]
> +    fn inc_ref(&self) {
> +        // SAFETY: Since we have a reference to the directory,
> +        // it's live, so it's safe to call dget on it.
> +        unsafe {
> +            kernel::bindings::dget(self.as_ptr());
> +        }
> +    }
> +    #[inline]
> +    unsafe fn dec_ref(obj: NonNull<Self>) {
> +        // SAFETY: By the caller precondition on the trait, we know that the caller has a reference
> +        // count to the object.
> +        unsafe {
> +            kernel::bindings::dput(obj.cast().as_ptr());
> +        }
> +    }
> +}
> +
> +impl Dir {
> +    /// Create a new directory in DebugFS. If `parent` is [`None`], it will be created at the root.
> +    ///
> +    /// # Examples
> +    ///
> +    /// ```
> +    /// # use kernel::c_str;
> +    /// # use kernel::debugfs::Dir;
> +    /// {
> +    ///     let dir = Dir::new(c_str!("my_debug_dir"), None)?;
> +    ///     // The directory will exist in DebugFS here.
> +    /// }
> +    /// // The directory will no longer exist in DebugFS here.
> +    /// # Ok::<(), Error>(())
> +    /// ```
> +    ///
> +    /// ```
> +    /// # use kernel::c_str;
> +    /// # use kernel::debugfs::Dir;
> +    /// let parent = Dir::new(c_str!("parent"), None)?;

Why are you checking this?  You shouldn't, it should never return an
error.  What it returns you can ALWAYS pass back into any call that
expects to get a "debugfs::Dir" object.  You should never even be able
to know if it succeeded or not as your code should never do anything
different depending on the result.

> +    /// let child = Dir::new(c_str!("child"), Some(&parent))?;
> +    /// // parent/child exists in DebugFS here.
> +    /// drop(parent);

Wait, what?  Why would an explicit drop(parent) be required here?  That
feels wrong, and way too complex.  Why can't you rely on the child
creation to properly manage this if needed (hint, it shouldn't be.)

> +    /// // The child dentry is still valid here, but DebugFS will have neither directory.
> +    /// # Ok::<(), Error>(())

Again, no error checking please.

> +    /// ```
> +    pub fn new(name: &CStr, parent: Option<&Self>) -> Result<ARef<Self>> {
> +        let parent_ptr = match parent {
> +            Some(parent) => parent.as_ptr(),
> +            None => core::ptr::null_mut(),
> +        };
> +        // SAFETY:
> +        // * name argument points to a null terminated string that lives across the call, by
> +        //   invariants of &CStr
> +        // * If parent is None, parent accepts null pointers to mean create at root
> +        // * If parent is Some, parent accepts live dentry debugfs pointers
> +        // * `debugfs_create_dir` either returns an error code or a legal `dentry` pointer,
> +        //   so we can call `NonNull::new_unchecked`.
> +        let dir = unsafe {
> +            NonNull::new_unchecked(from_err_ptr(kernel::bindings::debugfs_create_dir(
> +                name.as_char_ptr(),
> +                parent_ptr,
> +            ))?)
> +        };
> +        // SAFETY: Dir is a transparent wrapper for an Opaque<dentry>, and we received a live
> +        // owning dentry from `debugfs_create_dir`, so we can wrap it in an ARef
> +        Ok(unsafe { ARef::from_raw(dir.cast()) })

Why do you want this wrapped?  And I think you "wrapped" it wrong here.
When the object is "gone" it should have called
debugfs_remove_recursive(), not dput(), in order to properly drop
everything.  Where is that call happening?

The debugfs core already handles the reference counting of this object,
please don't add some extra reference count calls with dput/get, that's
just going to be a mess.

You should NEVER be encoding the fact that the return value of a
debugfs_*() call is a dentry.  Just treat that as an opaque pointer that
just happens to have a common name that might refer to something else.
That pointer can be passed back into other debugfs functions, and THAT
IS IT.  No checking for it, no passing it to any vfs functions, or
anything else.

So the dput() stuff here should not be present at all (hint, no C code
that used debugfs ever calls that, so the rust bindings shouldn't
either.)

thanks,

greg k-h
