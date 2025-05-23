Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A34BD22A4D5;
	Fri, 23 May 2025 10:22:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747995753; cv=none; b=fOhBzQk6aqRCdBasxjOPD2n1TeHuqYUCBCdC3iTjLMoabn997mE++LMxIwvFXuTk1iRpNnUbWEI+58kS4XWGznxptzDZrVaESABPNjx2exNL96wI0ujt6XOOYmf8+o+piHNFNb7YC12XRoIRgBYT/rSO4L8moeMohERtKjApDII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747995753; c=relaxed/simple;
	bh=+JYOMkeWnVnRrJhVoVfAH1CACiCVT0JUkk6MrQcQbRc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RWLDcwVmfCbAqweqokyXR1cZ0mCW3RHOaBPJBkEcuCVEoKePesLbcS/0O7anLRM0wJTOFcVEqtiQJKxZw5XQePVgYOiuCK9Foa9NgmQmOiooHgyySoI5CYS9mhvZYubxcT1+KqLIrK0x3z55O0x3pIqJXDNQR6Jl2ksrO9Qp3Hc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=xOhbt5Z9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="xOhbt5Z9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0902C4CEEA;
	Fri, 23 May 2025 10:22:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1747995752;
	bh=+JYOMkeWnVnRrJhVoVfAH1CACiCVT0JUkk6MrQcQbRc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=xOhbt5Z90KQpYKm90yX0JgBbHHRe2L2z3AM8N4sWGnefKWsqSQ98HaelYIu/EDlCn
	 Bmi/piC2SkLnm/ETAxlBpGzhVOHfacXAwo2fIGt0zGV9AmcIA3cg/SvcJU0tvBgWQj
	 diLZ/o0AMm9gxpny5BGhG+HoCBdPx2et43lOXxUk=
Date: Fri, 23 May 2025 12:22:29 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Alice Ryhl <aliceryhl@google.com>, Benno Lossin <lossin@kernel.org>,
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
Message-ID: <2025052323-glacier-shaded-e6a0@gregkh>
References: <2025051524-festival-afterglow-8483@gregkh>
 <aCzzBT96ktapP03e@google.com>
 <aC2HacSU7j5d9bzu@pollux>
 <aC5XDi7SaDJeUaAC@google.com>
 <aC7DVewqqWIKetmk@pollux>
 <aC8uNmrLUSS8sxHU@google.com>
 <2025052201-return-reprogram-add9@gregkh>
 <aC9krUYJmJqu0xVR@cassiopeiae>
 <2025052330-reverence-slideshow-d498@gregkh>
 <aDBC__rflS8625Vb@cassiopeiae>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aDBC__rflS8625Vb@cassiopeiae>

On Fri, May 23, 2025 at 11:42:23AM +0200, Danilo Krummrich wrote:
> On Fri, May 23, 2025 at 11:14:23AM +0200, Greg Kroah-Hartman wrote:
> > On Thu, May 22, 2025 at 07:53:49PM +0200, Danilo Krummrich wrote:
> > > On Thu, May 22, 2025 at 04:15:46PM +0200, Greg Kroah-Hartman wrote:
> > > > If you really want to delete a debugfs file that you have created in the
> > > > past, then look it up and delete it with the call that is present for
> > > > that.
> > > 
> > > This is promoting a C pattern (which for C code obviously makes a lot of sense),
> > > i.e. we have a function that creates a thing and another function that removes
> > > the thing given a handle of the created thing. Whether the handle is valid is
> > > the responsibility of the caller.
> > > 
> > > In this case the handle would be the filename. For instance:
> > > 
> > > 	debugfs_create_file("foo", parent, ...);
> > > 	debugfs_remove(debugfs_lookup("foo", parent));
> > > 
> > > This leaves room to the caller for making mistakes, e.g. if the caller makes a
> > > typo in the filename. In this case we wouldn't even recognize it from the return
> > > value, since there is none.
> > > 
> > > In Rust, we do things differently, i.e. we wrap things into an object that
> > > cleans up itself, once it goes out of scope. For instance:
> > > 
> > > 	let file = debugfs::File::new("foo", parent);
> > > 
> > > Subsequently we store file in a structure that represents the time we want this
> > > file to exist. Once it goes out of scope, it's removed automatically.
> > > 
> > > This is better, since we can't make any mistakes anymore, i.e. we can't mess up
> > > the filename or pass the wrong parent to clean things up.
> > > 
> > > Depending on whether the above was a misunderstanding and depending on how you
> > > think about it with this rationale, I have quite some more reasons why we don't
> > > want to have files / directories around in the filesystem without a
> > > corresponding object representation in Rust.
> > > 
> > > But before I write up a lot more text, I'd like to see if we're not already on
> > > the same page. :-)
> > 
> > Ok, let's knock up the api here first before worrying about the
> > implementation, as we seem to all be a bit confused as to what we want
> > to do.
> > 
> > Ideally, yes, I would like to NOT have any rust structure represent a
> > debugfs file, as that is the way the C api has been evolving.  We are
> > one step away from debugfs_create_file() being a void function that
> > doesn't return anything, and I don't want to see us go "backwards" here.
> > 
> > But the main reason I did that work was to keep people from trying to
> > determine if a file creation worked or not and to do different logic
> > based on that.  I think the Rust api CAN do both here, as you and Alice
> > have explained, so we should be ok.
> > 
> > So how about this for an example api, two structures, debugfs::Directory
> > and debugfs::File, which have only two types of operations that can be
> > done on them:
> > 
> > To create a debugfs directory, we do:
> > 
> > 	let my_dir = debugfs::Directory::new("foo_dir", parent);
> > 
> > There is no other Directory method, other than "drop", when the object
> > goes out of scope, which will clean up the directory and ALL child
> > objects at the same time (implementation details to be figured out
> > later.)
> > 
> > That will ALWAYS succeed no matter if the backend debugfs call failed or
> > not, and you have no way of knowing if it really did create something or
> > not.  That directory you can then use to pass into debugfs file or
> > directory creation functions.
> > 
> > Same for creating a debugfs file, you would do something like:
> > 
> > 	let my_file = debugfs::File::new("foo_file", my_dir);
> > 
> > depending on the "file type" you want to create, there will be different
> > new_* methods (new_u32, new_u64, etc.).
> > 
> > which also ALWAYS succeeds.  And again, as you want to keep objects
> > around, you have to have a reference on it at all times for it to exist
> > in the filesystem.  If you drop it, then it too will be removed from
> > debugfs.
> 
> Great! That's exactly what I think the API should look like as well. :-)
> 
> > And again, that's the only operation you can do on this object, there
> > are no other methods for it other than "new" and "drop".
> 
> We probably still want
> 
> 	let foo_dir = my_dir.subdir("foo_dir")
> 	foo_dir.file("foo_file")
> 
> for convinience, rather than having to call
> 
> 	let bar_dir = Dir::new("foo_dir", my_dir)
> 	File::new("bar_file", bar_dir)
> 
> all the time. But otherwise, sounds reasonable to me.

That would be very convenient, but given that we have 20+ different
types of debugfs files that we can create, that might get complex to
define that way.  But that's just an implementation detail to work
out...

> > Now there are issues with implementation details here like:
> >   - Do you want to keep the list of file and dir objects in the rust
> >     structure to manually clean them up when we go to drop the
> >     directory?
> >   - Do we want to force all files to be dropped before the directory?
> >     Or do we want to just let the C side clean it all up automagically
> >     instead?
> > and other things like that, but we can argue about that once we settle
> > on the outward-facing api first.
> 
> The only thing I don't want to is to allow to leak files or directories, i.e.
> 
> 	File::new("bar_file", bar_dir).leak()
> 
> which keeps the file in the filesystem, but takes away the handle from the Rust
> side, such that it won't be removed from the filesystem anymore when the handle
> goes out of scope, which can cause nasty bugs. But I think there isn't any
> benefit to allow this anyways and it isn't needed with reference counting.

I agree, I can live with that too.

> I'm open on things like having "ghost" objects as proposed by Alice or force all
> files to be dropped before the directory, etc. though.

"ghost" objects will get messy I think, and yes, cleaning up will be a
bit tricky here, which is why at the C level I am taking away the idea
of a file that can be controlled as an individual object entirely.  If
you want the Rust code to have objects for the files, that's something
that the bindings are going to have to handle well.  Somehow :)

thanks,

greg k-h
