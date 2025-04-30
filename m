Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ED3A190676;
	Wed, 30 Apr 2025 16:58:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746032330; cv=none; b=clhBcH60POzKkdgmq2/Qf83yuqroZh2hW98HYCkZ8EwFeD5nLIetHlI3IYORkEhSj5u5eHkx8qt+w8vLtKLPUMdQ6eEaSMrfRO2+fSeVSPqZ7LOLHGlPb9SQXC4KqUKhradz21S5I9X72szrJG1zTn3WCchxszLS7e8cSltmq94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746032330; c=relaxed/simple;
	bh=KbNoo8IuXKgkWpm6XiUqHyCkzgi2Y5PoLRe84tOlwAA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y3G5ermMFpvkDD7XlD03oWgL2LqWUG2Cg33S0oJecVdCHXPh5NdTaIxe4gCjwYiRfAMiZA47I8ZDTLnbE7tt8czWavnPmNpx3zmDADWO9HfO0lWBkDx0NzC0c/UxnOFkZ0e9MBLvH6pTIzH+XDeZcvTq2q43ALrHjkdaJ6NEs1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=gJgSmQL3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="gJgSmQL3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53919C4CEE7;
	Wed, 30 Apr 2025 16:58:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1746032330;
	bh=KbNoo8IuXKgkWpm6XiUqHyCkzgi2Y5PoLRe84tOlwAA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gJgSmQL3PEHgOBv+tqynMPpReBjxDR0nmy13htO/qBvlNxrN/P9XDsgHlCq4KBh40
	 P+3WASGL14uiwG0OTNmFe3nomkOdnbLszeW6m5Hkl4QCV0raTp1ceq5D1Vn95gkJNR
	 vbLiD66gtJu21icCwQd52v2ZjDoOkjeGRj+iz+dc=
Date: Wed, 30 Apr 2025 18:58:46 +0200
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
Message-ID: <2025043059-unlined-plausible-644e@gregkh>
References: <20250429-debugfs-rust-v1-0-6b6e7cb7929f@google.com>
 <20250429-debugfs-rust-v1-1-6b6e7cb7929f@google.com>
 <2025043021-plaza-grip-2916@gregkh>
 <CAGSQo00Kg2QV56LYFg6nRY+yS2KtiVAPaggKaKFCdprjBfXCcA@mail.gmail.com>
 <2025043022-travesty-slicing-2089@gregkh>
 <CAGSQo00nE+n41ehYdAuE1XrJmLZJNLEhKYee6qfF0Gp7b0X5Cw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGSQo00nE+n41ehYdAuE1XrJmLZJNLEhKYee6qfF0Gp7b0X5Cw@mail.gmail.com>

On Wed, Apr 30, 2025 at 08:31:29AM -0700, Matthew Maurer wrote:
> On Wed, Apr 30, 2025 at 8:23 AM Greg Kroah-Hartman
> <gregkh@linuxfoundation.org> wrote:
> >
> > On Wed, Apr 30, 2025 at 08:10:44AM -0700, Matthew Maurer wrote:
> > > On Wed, Apr 30, 2025 at 5:06 AM Greg Kroah-Hartman
> > > <gregkh@linuxfoundation.org> wrote:
> > > >
> > > > On Tue, Apr 29, 2025 at 11:15:55PM +0000, Matthew Maurer wrote:
> > > > > The basic API relies on `dput` to prevent leaks. Use of `debugfs_remove`
> > > > > is delayed until the more full-featured API, because we need to avoid
> > > > > the user having an reference to a dir that is recursively removed.
> > > > >
> > > > > Signed-off-by: Matthew Maurer <mmaurer@google.com>
> > > >
> > > > First off, many thanks for doing this.  I like this in general, but I
> > > > have loads of specific questions/comments.  Don't take that as a
> > > > criticism of this feature, I really want these bindings to be in the
> > > > tree and work hopefully better/cleaner than the userspace ones do.
> > > >
> > > > First off, the main "rule" of debugfs is that you should NEVER care
> > > > about the return value of any debugfs function.  So much so that the C
> > > > side hides errors almost entirely where possible.  I'd like to see this
> > > > carried through to the Rust side as well, but I think you didn't do that
> > > > for various "traditional" reasons.
> > >
> > > Sure, I mostly had to do error checking because I was using an
> > > `ARef<Dir>` to represent a directory, which meant that the underlying
> > > directory needed to be a valid pointer. Given that you've said that
> > > the returned `dentry *` should never be used as an actual `dentry`,
> > > only as an abstract handle to a DebugFS object, that requirement goes
> > > away, and I can remove the error handling code and always successfully
> > > return a `Dir`, even in cases where an error has occurred.
> >
> > Great!
> >
> > Except when debugfs is not enabled, then what are you going to return?
> > The same structure, or an error?
> >
> > I'd vote for the same pointer to the structure, just to make it more
> > obvious that this is a totally opaque thing and that no caller should
> > ever know or care if debugfs is working or even present in the system.
> >
> > Note that some drivers will want to save a bit of space if debugfs is
> > not enabled in the build, so be prepared to make the binding work
> > somehow that way too.  Can you have an "empty" object that takes no
> > memory?  Or is this too overthinking things?
> 
> Based on what you've expressed, I think what makes sense is:
> 
> * Initial patch will always return the same `Dir`, just sometimes it
> will be a wrapper around a pointer that is an error code, and
> sometimes it will be a useful `dentry` pointer. This will match the
> current behavior of C code to my understanding.

Great.

> * Follow-up (probably still in this series) will check
> `CONFIG_DEBUG_FS`, and if it's off, will just make `Dir` into a ZST,
> and just discard the pointer. This would be an improvement upon the C
> interface, because drivers would get the shrinkage without needing to
> add conditionals on `CONFIG_DEBUG_FS` in their own driver.

You're going to have to check CONFIG_DEBUG_FS anyway for this series,
otherwise things aren't going to build properly, so this sounds like a
great way to handle that.

thanks,

greg k-h
