Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D09B2206A9;
	Tue, 27 May 2025 11:50:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748346641; cv=none; b=D2xWAnPIYDzFYsOeXojBjZ4MepmA89PdmxO7lqRGsrQZYkCAazvKQ1AXLV4EPu9tK8nh47rNHy7v3O6f10eWaXkM7UoiefN72YUQ3hCvB3LmpoL9ifKh2o6VshXalb0LvYRsp75yEyurRZgMnVjPwBirvLEpgyNnbocBkNbzTYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748346641; c=relaxed/simple;
	bh=K+EGKk67L3sHlbFio3fjCi0fF2/KmZ9AHQJYFYfExI4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IRYiLxxVrEPCGdC4ufsIXLSd3h6YQOtvxRyLUW19j83xczrk5BidepY/KAgHhPl0oYv1LYUBGAd63CqCikEttSkUa49wH44arf4l4+hUoChluwqu+lnRZH2o/niNJMQ3qPgbBP52a//1USZjHPC0+yIEE+utgnc+Eub1CvT4vck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oMx5Fz+x; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oMx5Fz+x"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2FFAC4CEE9;
	Tue, 27 May 2025 11:50:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748346641;
	bh=K+EGKk67L3sHlbFio3fjCi0fF2/KmZ9AHQJYFYfExI4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oMx5Fz+x66wdU68SgQlo2s9FBCufAnjWstwv09tyZO+bRqtUWZj8ww38IATNjYqA5
	 hx4niZ/oFJJQ3UNgbs/y2Jd7tcLr1VDK7lzTxk0HdWcdalON8rx6/3kkp/a2L0Fdqc
	 58nLFYbbHgjSleiGnnPnhgHeXvBKPYFlBVAKbz/s9jiMm6fOEM/tFHvRhHQ0L4KpxO
	 jC5DvEmSuLumR//VfxZhqqVJOXzZKfR4FOubTDswPtaNCpufYkfJV7+ilKz+6LAadt
	 C9nBX0Z5GGGplW2pj4jQ4SmLjdu3t4NPZRosggW8hM0/8MRgK/d/tQQW6OsPeRAnMf
	 bYSdSd+h2qazw==
Date: Tue, 27 May 2025 13:50:34 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Benno Lossin <lossin@kernel.org>,
	Matthew Maurer <mmaurer@google.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	Timur Tabi <ttabi@nvidia.com>, linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v5 4/4] rust: samples: Add debugfs sample
Message-ID: <aDWnCsVvlnpmYxUz@cassiopeiae>
References: <aC5XDi7SaDJeUaAC@google.com>
 <aC7DVewqqWIKetmk@pollux>
 <aC8uNmrLUSS8sxHU@google.com>
 <2025052201-return-reprogram-add9@gregkh>
 <aC9krUYJmJqu0xVR@cassiopeiae>
 <2025052330-reverence-slideshow-d498@gregkh>
 <aDBC__rflS8625Vb@cassiopeiae>
 <aDCrufEjtJeGjO6z@google.com>
 <aDG6t-HdZSuWyPGo@pollux.localdomain>
 <aDWkGmcUBVHl7QmM@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aDWkGmcUBVHl7QmM@google.com>

On Tue, May 27, 2025 at 11:38:02AM +0000, Alice Ryhl wrote:
> On Sat, May 24, 2025 at 02:25:27PM +0200, Danilo Krummrich wrote:
> > On Fri, May 23, 2025 at 05:09:13PM +0000, Alice Ryhl wrote:
> > > On Fri, May 23, 2025 at 11:42:23AM +0200, Danilo Krummrich wrote:
> > > > The only thing I don't want to is to allow to leak files or directories, i.e.
> > > > 
> > > > 	File::new("bar_file", bar_dir).leak()
> > > > 
> > > > which keeps the file in the filesystem, but takes away the handle from the Rust
> > > > side, such that it won't be removed from the filesystem anymore when the handle
> > > > goes out of scope, which can cause nasty bugs. But I think there isn't any
> > > > benefit to allow this anyways and it isn't needed with reference counting.
> > > 
> > > Why not have leak() for files only? That way, the files still go away
> > > when you drop the directory, and you don't have to keep around a bunch
> > > of File objects in your Rust structs.
> > 
> > In a previous mail I said that there are more reasons why we don't want to have
> > files (or directories) in the filesystem without an object representation in
> > Rust.
> > 
> > One of them is when attaching private data to a file, like we do with
> > debugfs_create_file().
> > 
> > When we do this, in most of the cases we want to share data between a driver
> > structure and the debugfs file (e.g. a GPU's VM to dump the virtual address
> > space layout).
> > 
> > And most likely we do this by passing an Arc<T> to dir.file(), to make the file
> > own a reference to the corresponding reference counted object (in C we just hope
> > that no one frees the object while the debugfs file holds a pointer to it).
> > 
> > The question is, what happens to this reference if we would subsequently call
> > file.leak()? We can't drop the Arc, because otherwise we risk a UAF in the
> > filesystem callback, but we can't keep it either because otherwise we *really*
> > leak this reference, even if the parent directory is removed eventually.
> > 
> > --
> > 
> > Now, one could say, what about attaching the file's private data to the directory
> > instead? (And I think this has been proposed already elsewhere.)
> > 
> > But I really don't like this approach, because it would mean that when creating
> > the directory we would necessarily need to know all the files we will ever
> > create in this directory *and* have all the corresponding private data
> > available at this point of time. But that would be an insane requirement.
> > 
> > For instance, let's assume a driver creates a directory 'clients', which for
> > every connected userspace "client" wants to provide a file with some metadata
> > for this client.
> > 
> > Sure, you can work around this somehow, e.g. by using a mutex protected Vec as
> > private data or by always creating a new directory first for dynamically created
> > debugfs entires. But this sounds pretty horrible to me.
> 
> I do agree that if we support file.leak(), then the private data should:
> 
> 1. Be provided when creating the file, not the directory.
> 2. Be stored with the directory and be freed with it.
> 3. Not be encoded in the type of the directory.
>
> Some sort of list with data to free when the directory is freed could
> work.

I think this would be problematic too.

Think of the client example I gave above: Let's assume a driver creates a
'client' directory for every bound device and we create a single file per client
connecting to the corresponding device exposed to userspace.

Let's assume clients do connect and disconnect frequently. If we'd allow
file.leak() in this case, it would mean that all the private data of the clients
that have ever been connected piles up in the 'client' directories's private
data storage until the 'client' directory is removed, which is when the device
is unbound, which might be never.

> But it sounds like we should not consider file.leak() for the
> initial API.

Yeah, let's not have file.leak() either.
