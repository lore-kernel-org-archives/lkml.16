Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A45A1BEF77;
	Fri,  2 May 2025 11:36:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746185779; cv=none; b=Gmy6/0Bzk+Sf9WYMyuNmZ5S3ssCu/F51YCGjoKw5wHvzJx2rBRSAzHRjj5mMYccSwS+P9S0R3oxm0xvDW8WHKYYFCFYW41pOT6viUhjHJcvBMi0HvBfqCkHELyidWtMjtfNYaiBDNIasfDdi2xMec5hXYLzxmZHTw9ne99nmZ5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746185779; c=relaxed/simple;
	bh=4jQbUxmd9/xbIND4Q1vwwag8dJIJvv8UtuwlSFMxTk8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m0GEnrBkwjzVxMZx32bkLe+TSWeympOfc7b89e/K4oMjmZIahFaqutdvETR61BYJECnXQEBVbDlBXUp3VRpkwskxwOOSKDug2SRiNoSzeteD9c0K4IEsr4GAD3C0izWAnagTVmHyGmBgQhSZ5BdKqowWQJge6oSX2jXp7QthHsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=mVTQDdPD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="mVTQDdPD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4991CC4CEE4;
	Fri,  2 May 2025 11:36:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1746185778;
	bh=4jQbUxmd9/xbIND4Q1vwwag8dJIJvv8UtuwlSFMxTk8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mVTQDdPDN3ufg4fKdS9Li8yRSj5OlRJO6J8VFUD22mzhqQvt2or90tOZ7JSCXBSyX
	 PzO4cn2jh5ffmhqDamj+h9U5/m0oVMQGwtS2mocllDYGVCSMKmTplwD9uh9Arcss/8
	 knDyIxG2oY2CDk3HZkIEOKbqd6uenaxMQkiT0UB8=
Date: Fri, 2 May 2025 13:36:16 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Benno Lossin <lossin@kernel.org>
Cc: Matthew Maurer <mmaurer@google.com>, Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	Timur Tabi <ttabi@nvidia.com>, linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v3 1/4] rust: debugfs: Bind DebugFS directory creation
Message-ID: <2025050240-sublet-snarl-f7f4@gregkh>
References: <20250501-debugfs-rust-v3-0-850869fab672@google.com>
 <20250501-debugfs-rust-v3-1-850869fab672@google.com>
 <D9LIUW74XIRW.2DUQCSLYX1JP4@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <D9LIUW74XIRW.2DUQCSLYX1JP4@kernel.org>

On Fri, May 02, 2025 at 10:12:15AM +0200, Benno Lossin wrote:
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
> What about when an error got returned? Should that be exposed to the
> user?

No, not at all.  See my comments on version 1 of this patchset.  No
error should ever go back to the caller, it should never know if a
debugfs call succeeded or not so that it can just keep moving forward
and not act any differently.

Many of the C debugfs apis are already changed to be this way, let's not
go backwards and add this logic to the rust code only to rip it out in
the future.

> > +    }
> > +
> > +    #[cfg(not(CONFIG_DEBUG_FS))]
> > +    fn create(_name: &CStr, _parent: Option<&Self>) -> Self {
> > +        Self()
> > +    }
> > +
> 
> > +impl Drop for Dir {
> > +    fn drop(&mut self) {
> > +        // SAFETY: `debugfs_remove` can take `NULL`, error values, and legal DebugFS dentries.
> > +        // `as_ptr` guarantees that the pointer is of this form.
> > +        #[cfg(CONFIG_DEBUG_FS)]
> > +        unsafe {
> 
> I feel a bit uneasy with seeing `cfg` on `unsafe` code, since now the
> correctness also depends on the configuration. Someone might add/modify
> it making it incorrect under certain configurations.

The option is either enabled or not, this should be fine.

> This case is pretty straight forward, but I'm not so sure if we already
> have such a case.
> 
> How about having two modules providing the two implementations and then
> just conditionally import one or the other?

That would require a lot more duplicated code that you then have to
always keep in sync.  And from past experience, that's hard to do over
time.  So let's do it this way if at all possible.

thanks,

greg k-h
