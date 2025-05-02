Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F175221DA1;
	Fri,  2 May 2025 07:00:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746169211; cv=none; b=NL2SVZkC5DGvQ68pKzk79pKteL3FcI/IPs8KBUeNRIU7d21EZSNw4CyITyyObSURKpDzyXTBi+7+4gYzn+Xcdwc7ac5zqDT5CAAXiheZfh4xgchUK3wDCGdr1RwqTmYRupdmymqfInDJ78IjRXquPHOK5mvwhea1r+IDKk90eA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746169211; c=relaxed/simple;
	bh=P+YhjYIHYKpbJSu8CioVTFw9tPUKW2eluanOspryhR4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jkRYpvbjTeUja5rvZ/fmOTw/Csaf/zWzw19wl4P42fdP4UtTodLcqP8ULQwMuWW/tUkT08eERJCTEGm4ubHXyfZbxK8aWEs5IUELpL2vxZvJEdu1JemkgYyBZsncOQA7Qhxga7W9EtsL4rhL521LKepf87s1Z63lYD2NIp3JiAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=n5I82/LQ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="n5I82/LQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4F1EC4CEE4;
	Fri,  2 May 2025 07:00:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1746169210;
	bh=P+YhjYIHYKpbJSu8CioVTFw9tPUKW2eluanOspryhR4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=n5I82/LQpEvDfHt5WBbG2KCHqBLOBw9pmW/dgxbo7Hs6BF3MQFPNqZ6NgWyIUS3eB
	 LCowVVvgxc5/AYvWoRGidQWoDSFk7Geq2l15hLYNMjfQ6VUj2TE0Q5FsdYBIC3I/sb
	 9NL0musHKUp2LHvD0K+BfqaxrFMJnY+114fLSM90=
Date: Fri, 2 May 2025 09:00:07 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Matthew Maurer <mmaurer@google.com>, Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	Timur Tabi <ttabi@nvidia.com>, linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v3 1/4] rust: debugfs: Bind DebugFS directory creation
Message-ID: <2025050230-browsing-backstab-8de9@gregkh>
References: <20250501-debugfs-rust-v3-0-850869fab672@google.com>
 <20250501-debugfs-rust-v3-1-850869fab672@google.com>
 <aBRoNKjB063QhGZo@pollux>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aBRoNKjB063QhGZo@pollux>

On Fri, May 02, 2025 at 08:37:40AM +0200, Danilo Krummrich wrote:
> On Thu, May 01, 2025 at 10:47:41PM +0000, Matthew Maurer wrote:
> > +/// Owning handle to a DebugFS directory.
> > +///
> > +/// This directory will be cleaned up when it goes out of scope.
> > +///
> > +/// # Invariants
> > +///
> > +/// The wrapped pointer will always be `NULL`, an error, or an owned DebugFS `dentry`.
> > +#[repr(transparent)]
> > +pub struct Dir(#[cfg(CONFIG_DEBUG_FS)] *mut bindings::dentry);
> 
> Should probably use Opaque instead of a raw pointer.
> 
> > +// SAFETY: Dir is just a `dentry` under the hood, which the API promises can be transferred
> 
> [`Dir`]
> 
> > +// between threads.
> > +unsafe impl Send for Dir {}
> > +
> > +// SAFETY: All the native functions we re-export use interior locking, and the contents of the
> > +// struct are opaque to Rust.
> > +unsafe impl Sync for Dir {}
> > +
> > +impl Dir {
> > +    /// Create a new directory in DebugFS at the root.
> > +    ///
> > +    /// # Examples
> > +    ///
> > +    /// ```
> > +    /// # use kernel::c_str;
> > +    /// # use kernel::debugfs::Dir;
> > +    /// {
> > +    ///    let parent = Dir::new(c_str!("parent"));
> > +    ///    // The path "parent" exists in DebugFS here.
> > +    /// }
> > +    /// // It does not exist here.
> 
> This ready like an explanation for scopes; I think we should drop those comments
> and the scope.
> 
> > +    /// ```
> > +    pub fn new(name: &CStr) -> Self {
> > +        Self::create(name, None)
> > +    }
> > +
> > +    /// Create a DebugFS subdirectory.
> > +    ///
> > +    /// This returns a [`SubDir`], which will not be automatically cleaned up when it leaves scope.
> > +    /// To convert this to a handle governing the lifetime of the directory, use [`Dir::from`].
> > +    ///
> > +    /// # Examples
> > +    ///
> > +    /// ```
> > +    /// # use kernel::c_str;
> > +    /// # use kernel::debugfs::Dir;
> > +    /// {
> > +    ///    let parent = Dir::new(c_str!("parent"));
> > +    ///    // The path "parent" exists in DebugFS here.
> > +    ///    {
> > +    ///        let child = parent.subdir(c_str!("child"));
> > +    ///        // The path "parent/child" exists in DebugFS here.
> > +    ///    }
> > +    ///    // The path "parent/child" still exists.
> > +    ///    {
> > +    ///        let child2 = Dir::from(parent.subdir(c_str!("child2")));
> > +    ///        // The path "parent/child2" exists in DebugFS here.
> > +    ///    }
> > +    ///    // The path "parent/child2" is gone.
> > +    /// }
> > +    /// // None of the paths exist here.
> 
> I think the fact that you need all those comments here proves that it's not
> really intuitive. Please see me comment on SubDir below.
> 
> > +    /// ```
> > +    pub fn subdir(&self, name: &CStr) -> SubDir {
> > +        SubDir::new(Self::create(name, Some(self)))
> > +    }
> > +
> > +    /// Create a new directory in DebugFS. If `parent` is [`None`], it will be created at the root.
> > +    #[cfg(CONFIG_DEBUG_FS)]
> > +    fn create(name: &CStr, parent: Option<&Self>) -> Self {
> > +        let parent_ptr = match parent {
> > +            Some(parent) => parent.as_ptr(),
> > +            None => core::ptr::null_mut(),
> > +        };
> > +        // SAFETY:
> > +        // * `name` argument points to a NUL-terminated string that lives across the call, by
> > +        //   invariants of `&CStr`.
> > +        // * If `parent` is `None`, `parent` accepts null pointers to mean create at root.
> > +        // * If `parent` is `Some`, `parent` accepts live dentry debugfs pointers.
> > +        // * `debugfs_create_dir` either returns an error code or a legal `dentry` pointer,
> > +        //   so we can call `Self::from_ptr`.
> > +        unsafe { Self::from_ptr(bindings::debugfs_create_dir(name.as_char_ptr(), parent_ptr)) }
> 
> Please split up in two calls, such that we don't have two unsafe function calls
> in a single unsafe block.
> 
> > +    }
> > +
> > +    #[cfg(not(CONFIG_DEBUG_FS))]
> > +    fn create(_name: &CStr, _parent: Option<&Self>) -> Self {
> > +        Self()
> > +    }
> > +
> > +    /// Constructs a new DebugFS [`Dir`] from the underlying pointer.
> > +    ///
> > +    /// # Safety
> > +    ///
> > +    /// The pointer must either be an error code, `NULL`, or represent a transfer of ownership of a
> > +    /// live DebugFS directory.
> > +    #[cfg(CONFIG_DEBUG_FS)]
> > +    unsafe fn from_ptr(ptr: *mut bindings::dentry) -> Self {
> > +        Self(ptr)
> > +    }
> > +
> > +    /// Returns the pointer representation of the DebugFS directory.
> > +    ///
> > +    /// Due to the type invariant, the value returned from this function will always be an error
> > +    /// code, NUL, or a live DebugFS directory.
> 
> Maybe put this in a '# Guarantees' section.
> 
> > +    // If this function is ever needed with `not(CONFIG_DEBUG_FS)`, hardcode it to return `ENODEV`.
> 
> I think you mean ERR_PTR(ENODEV).
> 
> > +    #[cfg(CONFIG_DEBUG_FS)]
> > +    fn as_ptr(&self) -> *mut bindings::dentry {
> > +        self.0
> > +    }
> > +}
> > +
> > +impl Drop for Dir {
> > +    fn drop(&mut self) {
> > +        // SAFETY: `debugfs_remove` can take `NULL`, error values, and legal DebugFS dentries.
> > +        // `as_ptr` guarantees that the pointer is of this form.
> > +        #[cfg(CONFIG_DEBUG_FS)]
> > +        unsafe {
> > +            bindings::debugfs_remove(self.as_ptr())
> > +        }
> > +    }
> > +}
> > +
> > +/// Handle to a DebugFS directory that will stay alive after leaving scope.
> > +#[repr(transparent)]
> > +pub struct SubDir(ManuallyDrop<Dir>);
> 
> I think it's not very intuitive if the default is that a SubDir still exists
> after it has been dropped. I think your first approach being explicit about this
> with keep() consuming the SubDir was much better; please keep this approach.

Wait, let's step back.  Why do we care about the difference between a
"subdir" and a "dir"?  They both are the same thing, and how do you
describe a subdir of a subdir?  :)

Why the "split" here, that just adds additional mental energy to both
someone using the api, as well as someone having to review someone using
it.  A directory is a directory, no matter where in debugfs it lives, so
let's just keep it as simple as possible please.

thanks,

greg k-h
