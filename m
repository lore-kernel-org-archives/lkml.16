Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5AF821ABB6;
	Thu,  1 May 2025 10:37:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746095836; cv=none; b=J/Rs9EckG8Axrfdmj0eeY1D/l1oWqIBAVt3vqghkI4WIIVt370oFtO5q69GaHTXmHAIqn7bjKDD/622RmelnPsnR2zVrxMXWXz+7li6PIeu1u6OkllpT0HoEqa7TsZ796QiOAU4s4N7jeDRq2dr2i541sv2RKVTMntuGey5HSRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746095836; c=relaxed/simple;
	bh=8FjT+J+heVMHLdc5H4GZwvSsz5gfVyl7k4HW7LHxfaM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LyKNa8tJM82/s7i7W/dm6aBoCVG3WSbmBD6CrtRBzVgjRIGC+WBrL9f8l7D76CR6eM9fCX2xdEB9CBOsDKoL/AM8oAjmptDgUrLmltpZEsGeCNFXrpQtOE6ExkJVG8/AiVrBiYxXQIKActlrTVZ8LU1P68yDkc7gryFQP9CSnl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KUDDaWgm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KUDDaWgm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01725C4CEE3;
	Thu,  1 May 2025 10:37:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746095836;
	bh=8FjT+J+heVMHLdc5H4GZwvSsz5gfVyl7k4HW7LHxfaM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KUDDaWgmuwHMXd2SMAgb5nAcgOPYyUL+On6Fd/24W7Rn0v8gZTMTFYKO6bXaCG1Ti
	 d8QmYkLU+ZNmwS+H08DxDwNOc/spdy5iORGiLc7ttl7CKpUoRcv1OWObRudl+JlyR9
	 UmqvsV4ldxuq3H04Gh4WIXLKjFV3HlHUUNCIoxyDbAxNBJYAfYcpvtMfo6AVZysNnQ
	 NdNusZroGJ2Tfvp/+JwTXhQiUhFvtzMn/ZyY31bby8DrwS7UZYL905pRf/ZbmEr1RI
	 LHxjbMcz1fLkjlZYBRBgFpbZey9IwtkDDYSqrpeWS1vJjud/MT1rTQbOyp5Ea3QL1F
	 gOFSusPjZQHIQ==
Date: Thu, 1 May 2025 12:37:10 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Matthew Maurer <mmaurer@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	Timur Tabi <ttabi@nvidia.com>, linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v2 2/4] rust: debugfs: Bind file creation for long-lived
 Display
Message-ID: <aBNO1rMcAwo-TNWQ@pollux>
References: <20250430-debugfs-rust-v2-0-2e8d3985812b@google.com>
 <20250430-debugfs-rust-v2-2-2e8d3985812b@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250430-debugfs-rust-v2-2-2e8d3985812b@google.com>

On Wed, Apr 30, 2025 at 11:31:57PM +0000, Matthew Maurer wrote:
> Allows creation of files for references that live forever and lack
> metadata through the `Display` implementation.
> 
> The reference must live forever because we do not have a maximum
> lifetime for the file we are creating.
> 
> The `Display` implementation is used because `seq_printf` needs to route
> through `%pA`, which in turn routes through Arguments. A more generic
> API is provided later in the series, implemented in terms of this one.
> 
> Signed-off-by: Matthew Maurer <mmaurer@google.com>
> ---
>  rust/kernel/debugfs.rs | 102 +++++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 102 insertions(+)
> 
> diff --git a/rust/kernel/debugfs.rs b/rust/kernel/debugfs.rs
> index b533ab21aaa775d4e3f33caf89e2d67ef85592f8..87de94da3b27c2a399bb377afd47280f65208d41 100644
> --- a/rust/kernel/debugfs.rs
> +++ b/rust/kernel/debugfs.rs
> @@ -7,6 +7,7 @@
>  //! C header: [`include/linux/debugfs.h`](srctree/include/linux/debugfs.h)
>  
>  use crate::str::CStr;
> +use core::fmt::Display;
>  
>  /// Handle to a DebugFS directory.
>  // INVARIANT: The wrapped pointer will always be NULL, an error, or an owned DebugFS `dentry`
> @@ -121,6 +122,47 @@ fn as_ptr(&self) -> *mut bindings::dentry {
>      pub fn keep(self) {
>          core::mem::forget(self)
>      }
> +
> +    /// Create a file in a DebugFS directory with the provided name, and contents from invoking
> +    /// [`Display::fmt`] on the provided reference.
> +    ///
> +    /// # Examples
> +    ///
> +    /// ```
> +    /// # use kernel::c_str;
> +    /// # use kernel::debugfs::Dir;
> +    /// let dir = Dir::new(c_str!("my_debugfs_dir"));
> +    /// dir.display_file(c_str!("foo"), &200).keep();
> +    /// // "my_debugfs_dir/foo" now contains the number 200.
> +    /// ```
> +    pub fn display_file<T: Display + Sized>(&self, name: &CStr, data: &'static T) -> Self {
> +        // SAFETY:
> +        // * `name` is a NUL-terminated C string, living across the call, by CStr invariant
> +        // * `parent` is a live dentry since we have a reference to it
> +        // * `vtable` is all stock `seq_file` implementations except for `open`.
> +        //   `open`'s only requirement beyond what is provided to all open functions is that the
> +        //   inode's data pointer must point to a `T` that will outlive it, which we know because
> +        //   we have a static reference.
> +        // * debugfs_create_file_full either returns an error code or a legal dentry pointer, so
> +        //   `Self::from_ptr` is safe to call here.
> +        #[cfg(CONFIG_DEBUG_FS)]
> +        unsafe {
> +            Self::from_ptr(bindings::debugfs_create_file_full(
> +                name.as_char_ptr(),
> +                0o444,
> +                self.as_ptr(),
> +                data as *const _ as *mut _,
> +                core::ptr::null(),
> +                &<T as DisplayFile>::VTABLE,
> +            ))
> +        }
> +        #[cfg(not(CONFIG_DEBUG_FS))]
> +        {
> +            // Mark parameters used
> +            let (_, _) = (name, data);
> +            Self()
> +        }
> +    }

Analogous to SubDir, this should be a new type, such that we can't leak the root
directory. Also, methods like subdir() don't really make sense for a file, no?

Besides that, don't we also need a separate type for a file to be able to attach
non-static data anyways? I.e. something like:

	#[cfg(CONFIG_DEBUG_FS)]
	struct File<T> {
	   dentry: *mut bindings::dentry,
	   data: T,
	}

	#[cfg(not(CONFIG_DEBUG_FS))]
	struct File<T> {
	   _p: PhantomData<T>,
	}

I'm not exactly sure how v1 did this; I haven't had time to look at v1 before v2
was posted. I seems like v1 relied on a separate structure storing the data,
which also held a reference to the corresponding dentry or something along those
lines?
