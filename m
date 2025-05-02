Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 033FF224B04;
	Fri,  2 May 2025 11:55:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746186912; cv=none; b=S84hHp8WHDfWncRaJsEm612kQFvvW9hcCuaeubaKS4qGO/M44v9rS4gGZ68VvmXH7OprcXQRFRB7kRf40fdkt716XPhTqHDL64JF5qaXwuhzLgSXKGWROhM/FxmLPJ+EAGsE69aHxP3Rcni9ejgJ6xspL5uthcGrZN7ebwR+4T8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746186912; c=relaxed/simple;
	bh=YL4wDpIvjBpWbiMu6F1en9Cgfe7Ezj9YrWIGpA4T7i0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=noU7BgMe01c+pv+eXpHk1QMVS+nZRzMXpWRZDQFD6qgCufT0CYQIrdu2KNQU68JpX6nqp1ezmYAGaUx8SYCTiXaJz/EZ6BErRmASrF5KS2HqpU2kC/K8vZx8NHmv6cU1ZFFX8s52UtCceGCFmjYFxeMrEFtbC5SQixA+Nwnb/AU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=x/Ebb8If; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="x/Ebb8If"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC212C4CEE4;
	Fri,  2 May 2025 11:55:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1746186911;
	bh=YL4wDpIvjBpWbiMu6F1en9Cgfe7Ezj9YrWIGpA4T7i0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=x/Ebb8Ifjse7GYC1Zov0pxqTauxSQXI5LPFqz0jjXXgL0TwFwfKiNLb7LZ2wxsf9c
	 vLyKO0WF+MKP1QSd3S89fyNppFNRmTkQXZ9/h3mIgYIuMBoP78MW8nWHV6+pAlVrAL
	 HQuZSozPOF7V/6jBX1gYfwlVjwC36uQN2nzwyofc=
Date: Fri, 2 May 2025 13:55:08 +0200
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
Message-ID: <2025050208-jot-evolve-89b6@gregkh>
References: <20250501-debugfs-rust-v3-0-850869fab672@google.com>
 <20250501-debugfs-rust-v3-1-850869fab672@google.com>
 <aBRoNKjB063QhGZo@pollux>
 <2025050230-browsing-backstab-8de9@gregkh>
 <aBRutTMBtq-uCnii@pollux>
 <2025050205-reassign-entire-4078@gregkh>
 <aBR1O6d6YBszgVlU@pollux>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aBR1O6d6YBszgVlU@pollux>

On Fri, May 02, 2025 at 09:33:15AM +0200, Danilo Krummrich wrote:
> On Fri, May 02, 2025 at 09:11:37AM +0200, Greg Kroah-Hartman wrote:
> > On Fri, May 02, 2025 at 09:05:25AM +0200, Danilo Krummrich wrote:
> > > On Fri, May 02, 2025 at 09:00:07AM +0200, Greg Kroah-Hartman wrote:
> > > > On Fri, May 02, 2025 at 08:37:40AM +0200, Danilo Krummrich wrote:
> > > > > On Thu, May 01, 2025 at 10:47:41PM +0000, Matthew Maurer wrote:
> > > > > > +/// Handle to a DebugFS directory that will stay alive after leaving scope.
> > > > > > +#[repr(transparent)]
> > > > > > +pub struct SubDir(ManuallyDrop<Dir>);
> > > > > 
> > > > > I think it's not very intuitive if the default is that a SubDir still exists
> > > > > after it has been dropped. I think your first approach being explicit about this
> > > > > with keep() consuming the SubDir was much better; please keep this approach.
> > > > 
> > > > Wait, let's step back.  Why do we care about the difference between a
> > > > "subdir" and a "dir"?  They both are the same thing, and how do you
> > > > describe a subdir of a subdir?  :)
> > > 
> > > We care about the difference, because Dir originally had keep() which drops the
> > > Dir instance without actually removing it. For subdirs this is fine, since
> > > they'll be cleaned up when the parent is removed.
> > 
> > But does that mean a subdir can not be cleaned up without dropping the
> > parent first?  For many subsystems, they make a "root" debugfs
> > directory, and then add/remove subdirs all the time within that.
> 
> In the following I will call the first top level directory created by a module /
> driver "root".
> 
> The logic I propose is that "root" is of type Dir, which means there is no
> keep() and if dropped the whole tree under root is removed.
> 
> A subdir created under a Dir is of type SubDir and has the keep() method and if
> called consumes the type instance and subsequently can only ever be removed by
> dropping root.
> 
> Alternatively a SubDir can be converted into a Dir, and hence don't has keep()
> anymore and if dropped will be removed.
> 
> So, the result is that we still can add / remove subdirs as we want.
> 
> The advantage is that we don't have keep() for root, which would be a dedicated
> API for driver / modules to create bugs. If a driver / module would call keep()
> on the root, it would not only mean that we leak the root directory, but also
> all subdirs and files that we called keep() on.
> 
> This becomes even more problematic if we start attaching data to files. Think of
> an Arc that is attached to a file, which keeps driver data alive just because we
> leaked the root.

Ok, fair enough, let's try it this way, without keep()

> > > However, we don't want users to be able to call keep() on the directory that has
> > > been created first, since if that's done we loose our root anchor to ever free
> > > the tree, which almost always would be a bug.
> > 
> > Then do a call to debugfs_lookup_and_remove() which is what I really
> > recommend doing for any C user anyway.  That way no dentry is ever
> > "stored" anywhere.
> > 
> > Anyway, if Dir always has an implicit keep() call in it, then I guess
> > this is ok.  Let's see how this shakes out with some real-world users.
> > We can always change it over time if it gets unwieldy.
> 
> I really advise against it, Rust allows us to model such subtile differences
> properly (and easily) with the type system to avoid bugs. Let's take advantage
> of that.
> 
> Using debugfs_lookup_and_remove() wouldn't change anything, since we want to
> attach the lifetime of a directory to a corresponding object.
> 
> (Otherwise we're back to where we are with C, i.e. the user has to remember to
> call the correct thing at the correct time, rather than letting the type system
> take care instead.)
> 
> So, instead of debugfs_remove() we'd call debugfs_lookup_and_remove() from
> Dir::drop(), which only changes what we store in Dir, i.e. struct dentry pointer
> vs. CString.

Ok, that's fine, and it gives me an idea of how I can fix up the C api
over time to get rid of exporting the dentry entirely :)

thanks,

greg k-h
