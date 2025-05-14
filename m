Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D801722172F;
	Wed, 14 May 2025 08:50:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747212656; cv=none; b=jUPW796Is5Tpqyxt7lnF3OiMYjcqau4VWgufHU+nVM5cA48nLGbu9WP59A7L/KbVtAWaWqJb7ciUhQ+g3/HZMvfPikWOo1+GVkJZKcvM9jVVtuGweOtDDdtOR0ZkOBRls9/Ik/KGB/sc1Q7utU4v4/WrgaUu/fr6ZZWrBvCts0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747212656; c=relaxed/simple;
	bh=bPJvJAlEG0gOfJqjqZ+91FUwlJXWKk81fnhHqDaQHG8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jFfIjT/LI0HLqj0V/LWZukBnnCJicE5+pCEitObpCATBe7L9GUOVDr3X9RzirVfkVPu90ZJmGOYROGOQ3YD/j7i927+3XFEYUKCF3Kt1UCd75SpRAooL9ss6Ji+XfWZes9ikoX49VlRFrKx8eJNCLPCbx8DIdFjSH2Wt1eYE748=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=pX0TR5qW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="pX0TR5qW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 961E3C4CEE9;
	Wed, 14 May 2025 08:50:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1747212655;
	bh=bPJvJAlEG0gOfJqjqZ+91FUwlJXWKk81fnhHqDaQHG8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pX0TR5qWdb3VXmfeH9EVnwfs/BTG+FfwuDGtTzY9sXVnq36NxEW0Y7GfKRA53rGB4
	 6YZ8xIkcq7lxo+g+58KhbiCPsuQ2WGLcjJtrkDiz/UlCzDv2FmPZFwgz85NMWai5h3
	 RN3zMijGH4z8tT4bz84CGZzsY1EfTY24b+zb00RQ=
Date: Wed, 14 May 2025 10:49:06 +0200
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
Subject: Re: [PATCH v5 1/4] rust: debugfs: Bind DebugFS directory creation
Message-ID: <2025051451-charm-lankiness-8d59@gregkh>
References: <20250505-debugfs-rust-v5-0-3e93ce7bb76e@google.com>
 <20250505-debugfs-rust-v5-1-3e93ce7bb76e@google.com>
 <D9VPJFJ44PUP.3D0HGIEJC9UGY@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <D9VPJFJ44PUP.3D0HGIEJC9UGY@kernel.org>

On Wed, May 14, 2025 at 09:33:05AM +0200, Benno Lossin wrote:
> On Tue May 6, 2025 at 1:51 AM CEST, Matthew Maurer wrote:
> > +impl<'a> Dir<'a> {
> > +    /// Create a new directory in DebugFS. If `parent` is [`None`], it will be created at the root.
> > +    #[cfg(CONFIG_DEBUG_FS)]
> > +    fn create<'b>(name: &CStr, parent: Option<&'a Dir<'b>>) -> Self {
> > +        let parent_ptr = match parent {
> > +            Some(parent) => parent.0.as_ptr(),
> > +            None => core::ptr::null_mut(),
> > +        };
> > +        // SAFETY:
> > +        // * `name` argument points to a NUL-terminated string that lives across the call, by
> > +        //   invariants of `&CStr`.
> > +        // * If `parent` is `None`, `parent` accepts null pointers to mean create at root.
> > +        // * If `parent` is `Some`, `parent` accepts live dentry debugfs pointers.
> > +        //   so we can call `Self::from_ptr`.
> > +        let dir = unsafe { bindings::debugfs_create_dir(name.as_char_ptr(), parent_ptr) };
> > +
> > +        // SAFETY: `debugfs_create_dir` either returns an error code or a legal `dentry` pointer,
> > +        Self(unsafe { Entry::from_ptr(dir) })
> > +    }
> > +
> > +    #[cfg(not(CONFIG_DEBUG_FS))]
> > +    fn create<'b>(_name: &CStr, _parent: Option<&'a Dir<'b>>) -> Self {
> > +        Self(Entry::new())
> > +    }
> > +
> > +    /// Create a DebugFS subdirectory.
> 
> I'm not familiar with debugfs, if I run `Dir::create(c"foo", None)`
> twice, will both of the returned values refer to the same or different
> directories? 

You can not create a directory, or file, in the same location with the
same name.  The call will fail, so don't do that :)

> What if I give a parent?

Same thing, it will fail.

> If the answer in both cases is that they will refer to the same
> directory, then I'd change the docs to mention that.

Nope, that does not happen.

> So instead of
> "Creates" we could say "Finds or creates" or something better.

Find does not happen.

> If they refer to different files, then I am confused how that would look
> like in user-land :)

Agreed, which is why that does not happen :)

thanks,

greg k-h
