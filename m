Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CDDD2AE7F;
	Fri,  2 May 2025 06:52:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746168741; cv=none; b=KrMezdqoQ3/xqVW7+nCI9yvA/LfErMCVcvn5nwCcp9RJoBzssotUTE0Tt+vNqgKUiFoETkAHBz26arXTb5i+kkn1OyrS/tM+FDpSzHW7U0YSNgMB2cJo3FdBfbaCUg6B+MATnxaT+FMoDCPY9+rErYhDhMWhpp6/rYkvi3sKsW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746168741; c=relaxed/simple;
	bh=pf7KPttRxQJ1kFfCNXl2KVGEkXHQz0SwMgBjES6dxpk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lpV/5H2UQEWgNEJqCnpsJwGyqLKhO5lByXyOeGTAbvXb48K4TsPkjk5cD0ov/cDT4WDZCgxCtsKnWXMuKnsiy7HMtEBtREpsY511PvDfhOlUNkQpCF07VCgWghjVsYXzlqNZN12EWcBSRDvSKtR5N3UOStCk2VddEaOc7dNCrs8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CwdVW+6s; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CwdVW+6s"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EAAD4C4CEE4;
	Fri,  2 May 2025 06:52:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746168740;
	bh=pf7KPttRxQJ1kFfCNXl2KVGEkXHQz0SwMgBjES6dxpk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CwdVW+6sDefIQLBaT9UUY5U/vK1SoRfXReB53bRbXFmYu+hazl07JcQdF7ZJL4Inb
	 gi/SSO2JWiQVgVfqei45x7I9+LJoi/efLR0ZCMWrf5kl8h1kRBig6whcj76lgnN1mI
	 UcrHjkRv8S4o39gIH5R8f1DdyKu/pnoqJetoodinaqwHHHstd3iwWzAMfiytfFyoRb
	 3XabG6fV2nl0YXaswhlIvyU0eqba7qmHj3X49l6fD1R4uiE2MIaQF36DWPAUwi9FLz
	 Zalg3xNsLyD+vZZczqyi73ZJMoGiLibzJ4P6d3TY5KazFMYAsf+p1C1ZwQJ4zvhTFB
	 nazkxkJ4o1Tgw==
Date: Fri, 2 May 2025 08:52:14 +0200
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
Subject: Re: [PATCH v3 2/4] rust: debugfs: Bind file creation for long-lived
 Display
Message-ID: <aBRrniLfCzWX7nbR@pollux>
References: <20250501-debugfs-rust-v3-0-850869fab672@google.com>
 <20250501-debugfs-rust-v3-2-850869fab672@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250501-debugfs-rust-v3-2-850869fab672@google.com>

On Thu, May 01, 2025 at 10:47:42PM +0000, Matthew Maurer wrote:
> +/// Handle to a DebugFS file.
> +#[repr(transparent)]
> +pub struct File(ManuallyDrop<Dir>);

Same as with SubDir, please keep your original approach with keep().

Exposing this as a separate type is much better, but I still find it a bit weird
that it uses Dir internally, which still provides methods that are not
applicable.

I think it would be good to have the following types instead:

	// Generic wrapper around the dentry pointer.
	struct Entry;

	// Based on Entry; provides Dir specific methods.
	struct Dir;

	// Based on Dir; implements Keep.
	struct SubDir;

	// Based on Entry; implements Keep.
	struct File;

	// Common trait that implements keep().
	trait Keep;

> +impl File {
> +    /// Remove the file from DebugFS.
> +    ///
> +    /// # Examples
> +    /// ```
> +    /// # use kernel::c_str;
> +    /// # use kernel::debugfs::Dir;
> +    /// let dir = Dir::new(c_str!("foo"));
> +    /// {
> +    ///     let file = dir.display_file(c_str!("bar"), &0);
> +    ///     // "foo/bar" is created.
> +    /// }
> +    /// // "foo/bar" still exists.
> +    /// {
> +    ///     let file = dir.display_file(c_str!("baz"), &0);
> +    ///     // "foo/baz" is created.
> +    ///     file.remove();
> +    ///     // "foo/baz" is gone.
> +    /// }
> +    pub fn remove(self) {
> +        drop(ManuallyDrop::into_inner(self.0))
> +    }
> +}

Same as with my comment on Dir::subdir(), it really gets confusing if we invert
the normal drop() logic. Removing the file when it is dropped and keeping it
when calling keep() is much more intuitive..

> +
> +#[cfg(CONFIG_DEBUG_FS)]
> +mod helpers {
> +    use crate::seq_file::SeqFile;
> +    use crate::seq_print;
> +    use core::fmt::Display;
> +
> +    /// Implements `open` for `file_operations` via `single_open` to fill out a `seq_file`.
> +    ///
> +    /// # Safety
> +    ///
> +    /// * `inode`'s private pointer must point to a value of type `T` which will outlive the `inode`
> +    ///   and will not be mutated during this call.
> +    /// * `file` must point to a live, not-yet-initialized file object.
> +    pub(crate) unsafe extern "C" fn display_open<T: Display>(
> +        inode: *mut bindings::inode,
> +        file: *mut bindings::file,
> +    ) -> i32 {
> +        // SAFETY:
> +        // * `file` is acceptable by caller precondition.
> +        // * `print_act` will be called on a `seq_file` with private data set to the third argument,
> +        //   so we meet its safety requirements.
> +        // * The `data` pointer passed in the third argument is a valid `T` pointer that outlives
> +        //   this call by caller preconditions.
> +        unsafe { bindings::single_open(file, Some(display_act::<T>), (*inode).i_private) }

Please split up unsafe operations.

> +    }
> +
> +    /// Prints private data stashed in a seq_file to that seq file.
> +    ///
> +    /// # Safety
> +    ///
> +    /// `seq` must point to a live `seq_file` whose private data is a live pointer to a `T` which is
> +    /// not being mutated.
> +    pub(crate) unsafe extern "C" fn display_act<T: Display>(
> +        seq: *mut bindings::seq_file,
> +        _: *mut core::ffi::c_void,
> +    ) -> i32 {
> +        // SAFETY: By caller precondition, this pointer is live, points to a value of type `T`, and
> +        // is not being mutated.
> +        let data = unsafe { &*((*seq).private as *mut T) };

This creates an intermediate reference to private, which is UB. Please use
addr_of! instead.
