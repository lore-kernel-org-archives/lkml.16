Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1D422AD32;
	Fri,  2 May 2025 08:12:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746173542; cv=none; b=By7TUKA/4eQZfBr3BzJH4xuTiW13Mc3p64W7Y0TZlJiJGWOmU9JhWjpvpFoBbKmAvQv3Yy/aKvDJsAHVdt6y2tEVaA7i6XVXZlcyfHUKTsbmTKSjWmvGOOQRkJKQ+/AgABEZbbvo63MLi8hseo0cndYAU5X4mH0R4pfvlo7FX+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746173542; c=relaxed/simple;
	bh=fFKF6DIMGJgI0j6u24h/rZ8wvQJckx4dGZIU8VuRAMM=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=UCDy6KaE/jyvqa8vYAXlGD0LFIYMiGcu28uY12fluYxchwcKGRLUpvytL41qVO8b+aOfs+wtJPTEEw2z5PaooaoFfvRoPP9Kn3CGmLn94Zo/wDjhiJH7cLoxOHyiB0+Fg1BGQ7CkIJ3FmticumE1QAZz3g+q6RAwWJ/WGMK4m0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JacS998m; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JacS998m"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE9CAC4CEE4;
	Fri,  2 May 2025 08:12:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746173541;
	bh=fFKF6DIMGJgI0j6u24h/rZ8wvQJckx4dGZIU8VuRAMM=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=JacS998m9s1HIsTW16mFOzxFU5Lwr8fhZkcyda2HotFjwGLMp/u28GU3qFGyFw5L7
	 p169Yx8zQ+0s16Qt4DNcqVy7tLfZZL9+a41PfMp/TWSseKhBBta344iTchd87XyIiE
	 G+t/0LEtrXZgyjrQJb8KnZdgzS2bo03iNSBxzD3xHNzrf3tC9hwRUCGWeqA1CPCW7W
	 FY0ywhg6cx3g60I6MlV40pPi1WWEHuCP33eOONB/YhHroaykYXdqkA1N4dv0ngJBoS
	 tgOSnY+3F4bD9yrB3oh4v8Bthc0YCK4w9TTRwbhOuCPhUiMxVf15Yw1D+iD9XB7gP+
	 0RR+RxqEX9APA==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 02 May 2025 10:12:15 +0200
Message-Id: <D9LIUW74XIRW.2DUQCSLYX1JP4@kernel.org>
Subject: Re: [PATCH v3 1/4] rust: debugfs: Bind DebugFS directory creation
From: "Benno Lossin" <lossin@kernel.org>
To: "Matthew Maurer" <mmaurer@google.com>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng"
 <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <benno.lossin@proton.me>, "Andreas Hindborg" <a.hindborg@kernel.org>,
 "Alice Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 "Danilo Krummrich" <dakr@kernel.org>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 "Sami Tolvanen" <samitolvanen@google.com>, "Timur Tabi" <ttabi@nvidia.com>
Cc: <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>
X-Mailer: aerc 0.20.1
References: <20250501-debugfs-rust-v3-0-850869fab672@google.com>
 <20250501-debugfs-rust-v3-1-850869fab672@google.com>
In-Reply-To: <20250501-debugfs-rust-v3-1-850869fab672@google.com>

> diff --git a/rust/kernel/debugfs.rs b/rust/kernel/debugfs.rs
> new file mode 100644
> index 0000000000000000000000000000000000000000..b589c2d9a8d169bd66e98d289=
4261784e427230e
> --- /dev/null
> +++ b/rust/kernel/debugfs.rs
> @@ -0,0 +1,155 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +// Copyright (C) 2025 Google LLC.
> +
> +//! DebugFS Abstraction
> +//!
> +//! C header: [`include/linux/debugfs.h`](srctree/include/linux/debugfs.=
h)
> +
> +use crate::str::CStr;
> +use core::mem::ManuallyDrop;
> +use core::ops::Deref;
> +
> +/// Owning handle to a DebugFS directory.
> +///
> +/// This directory will be cleaned up when it goes out of scope.

We should also document that it's a unit struct when `CONFIG_DEBUG_FS`
is disabled (and the operations are noops). Maybe even do something
like:

    #[cfg_attr(CONFIG_DEBUG_FS, doc =3D "`CONFIG_DEBUG_FS=3Dy`")]
    #[cfg_attr(not(CONFIG_DEBUG_FS), doc =3D "`CONFIG_DEBUG_FS=3Dn`")]

> +///
> +/// # Invariants
> +///
> +/// The wrapped pointer will always be `NULL`, an error, or an owned Deb=
ugFS `dentry`.
> +#[repr(transparent)]
> +pub struct Dir(#[cfg(CONFIG_DEBUG_FS)] *mut bindings::dentry);
> +
> +// SAFETY: Dir is just a `dentry` under the hood, which the API promises=
 can be transferred
> +// between threads.
> +unsafe impl Send for Dir {}
> +
> +// SAFETY: All the native functions we re-export use interior locking, a=
nd the contents of the
> +// struct are opaque to Rust.
> +unsafe impl Sync for Dir {}
> +
> +impl Dir {
> +    /// Create a new directory in DebugFS at the root.
> +    ///
> +    /// # Examples
> +    ///
> +    /// ```
> +    /// # use kernel::c_str;
> +    /// # use kernel::debugfs::Dir;
> +    /// {
> +    ///    let parent =3D Dir::new(c_str!("parent"));
> +    ///    // The path "parent" exists in DebugFS here.
> +    /// }
> +    /// // It does not exist here.
> +    /// ```
> +    pub fn new(name: &CStr) -> Self {
> +        Self::create(name, None)
> +    }
> +
> +    /// Create a DebugFS subdirectory.
> +    ///
> +    /// This returns a [`SubDir`], which will not be automatically clean=
ed up when it leaves scope.
> +    /// To convert this to a handle governing the lifetime of the direct=
ory, use [`Dir::from`].

But it will be cleaned up when the parent goes out of scope? We should
also mention that.

> +    ///
> +    /// # Examples
> +    ///
> +    /// ```
> +    /// # use kernel::c_str;
> +    /// # use kernel::debugfs::Dir;
> +    /// {
> +    ///    let parent =3D Dir::new(c_str!("parent"));
> +    ///    // The path "parent" exists in DebugFS here.
> +    ///    {
> +    ///        let child =3D parent.subdir(c_str!("child"));
> +    ///        // The path "parent/child" exists in DebugFS here.
> +    ///    }
> +    ///    // The path "parent/child" still exists.
> +    ///    {
> +    ///        let child2 =3D Dir::from(parent.subdir(c_str!("child2")))=
;
> +    ///        // The path "parent/child2" exists in DebugFS here.
> +    ///    }
> +    ///    // The path "parent/child2" is gone.
> +    /// }
> +    /// // None of the paths exist here.
> +    /// ```
> +    pub fn subdir(&self, name: &CStr) -> SubDir {
> +        SubDir::new(Self::create(name, Some(self)))
> +    }
> +
> +    /// Create a new directory in DebugFS. If `parent` is [`None`], it w=
ill be created at the root.
> +    #[cfg(CONFIG_DEBUG_FS)]
> +    fn create(name: &CStr, parent: Option<&Self>) -> Self {
> +        let parent_ptr =3D match parent {
> +            Some(parent) =3D> parent.as_ptr(),
> +            None =3D> core::ptr::null_mut(),
> +        };
> +        // SAFETY:
> +        // * `name` argument points to a NUL-terminated string that live=
s across the call, by
> +        //   invariants of `&CStr`.
> +        // * If `parent` is `None`, `parent` accepts null pointers to me=
an create at root.
> +        // * If `parent` is `Some`, `parent` accepts live dentry debugfs=
 pointers.
> +        // * `debugfs_create_dir` either returns an error code or a lega=
l `dentry` pointer,
> +        //   so we can call `Self::from_ptr`.
> +        unsafe { Self::from_ptr(bindings::debugfs_create_dir(name.as_cha=
r_ptr(), parent_ptr)) }

What about when an error got returned? Should that be exposed to the
user?

> +    }
> +
> +    #[cfg(not(CONFIG_DEBUG_FS))]
> +    fn create(_name: &CStr, _parent: Option<&Self>) -> Self {
> +        Self()
> +    }
> +

> +impl Drop for Dir {
> +    fn drop(&mut self) {
> +        // SAFETY: `debugfs_remove` can take `NULL`, error values, and l=
egal DebugFS dentries.
> +        // `as_ptr` guarantees that the pointer is of this form.
> +        #[cfg(CONFIG_DEBUG_FS)]
> +        unsafe {

I feel a bit uneasy with seeing `cfg` on `unsafe` code, since now the
correctness also depends on the configuration. Someone might add/modify
it making it incorrect under certain configurations.

This case is pretty straight forward, but I'm not so sure if we already
have such a case.

How about having two modules providing the two implementations and then
just conditionally import one or the other?

---
Cheers,
Benno

> +            bindings::debugfs_remove(self.as_ptr())
> +        }
> +    }
> +}
