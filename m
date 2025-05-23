Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E4822248BA;
	Fri, 23 May 2025 09:14:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747991666; cv=none; b=NCIr4KrcZHRnfbA+QJ+eChahRWagguSspWsh90Xxzv9WKFF19rcYvXpCMq1SlGNGZ52k9OAvEdfBzVIkJWW6Ad+EMRQkP7CEenqgjkOrJ9a93qM8QEQeKDbkV4Dc/HUiuhcs1c0LeSxywM21a0T4AFEl11iajwmyzK92kICBFrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747991666; c=relaxed/simple;
	bh=evsuqV8CXPKxNU1DD0AP0z+LVxBbny1LMscprxOWYTU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Gs7LPJLziiNaeFPgGTSpcJzpp9h2p8Jl4tkAbcnf6dA60kseaOdWHxhbTnLum/ryxyv/IhoffGYixpAqZThAr3/sDD7PgMnhEWpg5+5PDIGAZA3ZyXbBNNfzx2kd3wjcssYXO0JboLtXHyoGw10jQz9Z85bxOZHUNKV5OLAtJk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=OI70mICq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="OI70mICq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78382C4CEE9;
	Fri, 23 May 2025 09:14:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1747991665;
	bh=evsuqV8CXPKxNU1DD0AP0z+LVxBbny1LMscprxOWYTU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OI70mICqbFMTT4W8yqxmh/9CF1c3DUrvdIy/yc/KoezWTACp03BRS18n5uV2SF5vm
	 p18bIunzRFHkwEokDrGL01kIi0mndL6ysWHSRhmlwINiMWY5s7IpWhs5pAXiVGnyq8
	 sFcQzMqz8vMcLUlQ/HxC84OWUjBvnoM3sJJP7b0M=
Date: Fri, 23 May 2025 11:14:23 +0200
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
Message-ID: <2025052330-reverence-slideshow-d498@gregkh>
References: <CAGSQo0204_Dz65G33pAN3_iY=ejPXJRdAiB4ioM-nvMkAh0YXQ@mail.gmail.com>
 <D9WM0BP5446N.1NVNDCZ4Y2QN1@kernel.org>
 <2025051524-festival-afterglow-8483@gregkh>
 <aCzzBT96ktapP03e@google.com>
 <aC2HacSU7j5d9bzu@pollux>
 <aC5XDi7SaDJeUaAC@google.com>
 <aC7DVewqqWIKetmk@pollux>
 <aC8uNmrLUSS8sxHU@google.com>
 <2025052201-return-reprogram-add9@gregkh>
 <aC9krUYJmJqu0xVR@cassiopeiae>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aC9krUYJmJqu0xVR@cassiopeiae>

On Thu, May 22, 2025 at 07:53:49PM +0200, Danilo Krummrich wrote:
> On Thu, May 22, 2025 at 04:15:46PM +0200, Greg Kroah-Hartman wrote:
> > On Thu, May 22, 2025 at 02:01:26PM +0000, Alice Ryhl wrote:
> > > On Thu, May 22, 2025 at 08:25:25AM +0200, Danilo Krummrich wrote:
> > > > On Wed, May 21, 2025 at 10:43:26PM +0000, Alice Ryhl wrote:
> > > > > > > * Possibly we have a way to drop a Rust object without removing it from
> > > > > > >   the file system. In this case, it can never be accessed from Rust
> > > > > > >   again, and the only way to remove it is to drop its parent directory.
> > > > > > 
> > > > > > I'm not sure about this one.
> > > > > > 
> > > > > > IIUC, this basically brings back the "keep() logic", which I still think is a
> > > > > > footgun and should be avoided.
> > > > > > 
> > > > > > Also, we only needed this, since due to the borrowing design we couldn't store
> > > > > > parent and child nodes in the same structure. With reference counting (or the
> > > > > > logic above) this goes away.
> > > > > > 
> > > > > > I wrote the following in a previous conversation [1].
> > > > > > 
> > > > > > --
> > > > > > 
> > > > > > What I see more likely to happen is a situation where the "root" directory
> > > > > > (almost) lives forever, and hence subsequent calls, such as
> > > > > > 
> > > > > > 	root.subdir("foo").keep()
> > > > > > 
> > > > > > effectively are leaks.
> > > > > > 
> > > > > > One specific example for that would be usb_debug_root, which is created in the
> > > > > > module scope of usb-common and is used by USB host / gadget / phy drivers.
> > > > > > 
> > > > > > The same is true for other cases where the debugfs "root" is created in the
> > > > > > module scope, but subsequent entries are created by driver instances. If a
> > > > > > driver would use keep() in such a case, we'd effectively leak memory everytime a
> > > > > > device is unplugged (or unbound in general).
> > > > > 
> > > > > Where is the leak? If the file is still visible in the file system, then
> > > > > it's not a leak to still have the memory. If the file got removed by
> > > > > removing its parent, then my intent is that this should free the memory
> > > > > of the child object.
> > > > 
> > > > Well, take the case I described above, where the debugfs "root" is created in
> > > > the module scope, but subsequent entries are created by driver instances. If a
> > > > driver would use keep() in such a case, we'd effectively the file / directory
> > > > (and subsequently also the corresponding memory) everytime a device is unplugged
> > > > (or unbound in general)."
> > > > 
> > > > If the module is built-in the directory from the module scope is *never*
> > > > removed, but the entries the driver e.g. creates in probe() for a particular
> > > > device with keep() will pile up endlessly, especially for hot-pluggable devices.
> > > > 
> > > > (It's getting even worse when there's data bound to such a leaked file, that
> > > > might even contain a vtable that is entered from any of the fops of the file.)
> > > > 
> > > > That'd be clearly a bug, but for the driver author calling keep() seems like a
> > > > valid thing to do -- to me that's clearly a built-in footgun.
> > > 
> > > I mean, for cases such as this, I could imagine that you use `keep()` on
> > > the files stored inside of the driver directory, but don't use it on the
> > > directory. That way, you only have to keep a single reference to an
> > > entire directory around, which may be more convenient.
> > 
> > No, sorry, but debugfs files are "create and forget" type of things.
> > The caller has NO reference back to the file at all in the C version,
> > let's not add that functionality back to the rust side after I spent a
> > long time removing it from the C code :)
> 
> This response sounds like we may have a different understanding of what "keep"
> means.
> 
> Earlier versions of this patch series introduced a keep() method for both
> debugfs::File and debugfs::Dir, which would consume, and hence get rid of, the
> instance of a debugfs::File or a debugfs::Dir object, while *keeping* the
> corresponding directory / file in the filesystem.
> 
> This makes it easy for a driver to leak the directory / file in the filesystem,
> as explained in [1], which you seemed to agree with in [2].
> 
> Was this a misunderstanding?

Kind of, see below:

> > If you really want to delete a debugfs file that you have created in the
> > past, then look it up and delete it with the call that is present for
> > that.
> 
> This is promoting a C pattern (which for C code obviously makes a lot of sense),
> i.e. we have a function that creates a thing and another function that removes
> the thing given a handle of the created thing. Whether the handle is valid is
> the responsibility of the caller.
> 
> In this case the handle would be the filename. For instance:
> 
> 	debugfs_create_file("foo", parent, ...);
> 	debugfs_remove(debugfs_lookup("foo", parent));
> 
> This leaves room to the caller for making mistakes, e.g. if the caller makes a
> typo in the filename. In this case we wouldn't even recognize it from the return
> value, since there is none.
> 
> In Rust, we do things differently, i.e. we wrap things into an object that
> cleans up itself, once it goes out of scope. For instance:
> 
> 	let file = debugfs::File::new("foo", parent);
> 
> Subsequently we store file in a structure that represents the time we want this
> file to exist. Once it goes out of scope, it's removed automatically.
> 
> This is better, since we can't make any mistakes anymore, i.e. we can't mess up
> the filename or pass the wrong parent to clean things up.
> 
> Depending on whether the above was a misunderstanding and depending on how you
> think about it with this rationale, I have quite some more reasons why we don't
> want to have files / directories around in the filesystem without a
> corresponding object representation in Rust.
> 
> But before I write up a lot more text, I'd like to see if we're not already on
> the same page. :-)

Ok, let's knock up the api here first before worrying about the
implementation, as we seem to all be a bit confused as to what we want
to do.

Ideally, yes, I would like to NOT have any rust structure represent a
debugfs file, as that is the way the C api has been evolving.  We are
one step away from debugfs_create_file() being a void function that
doesn't return anything, and I don't want to see us go "backwards" here.

But the main reason I did that work was to keep people from trying to
determine if a file creation worked or not and to do different logic
based on that.  I think the Rust api CAN do both here, as you and Alice
have explained, so we should be ok.

So how about this for an example api, two structures, debugfs::Directory
and debugfs::File, which have only two types of operations that can be
done on them:

To create a debugfs directory, we do:

	let my_dir = debugfs::Directory::new("foo_dir", parent);

There is no other Directory method, other than "drop", when the object
goes out of scope, which will clean up the directory and ALL child
objects at the same time (implementation details to be figured out
later.)

That will ALWAYS succeed no matter if the backend debugfs call failed or
not, and you have no way of knowing if it really did create something or
not.  That directory you can then use to pass into debugfs file or
directory creation functions.

Same for creating a debugfs file, you would do something like:

	let my_file = debugfs::File::new("foo_file", my_dir);

depending on the "file type" you want to create, there will be different
new_* methods (new_u32, new_u64, etc.).

which also ALWAYS succeeds.  And again, as you want to keep objects
around, you have to have a reference on it at all times for it to exist
in the filesystem.  If you drop it, then it too will be removed from
debugfs.

And again, that's the only operation you can do on this object, there
are no other methods for it other than "new" and "drop".

Now there are issues with implementation details here like:
  - Do you want to keep the list of file and dir objects in the rust
    structure to manually clean them up when we go to drop the
    directory?
  - Do we want to force all files to be dropped before the directory?
    Or do we want to just let the C side clean it all up automagically
    instead?
and other things like that, but we can argue about that once we settle
on the outward-facing api first.

I can live with this type of api.  It's simple and seems hard to abuse
or get wrong from a user point-of-view, and should be pretty
straight-forward on the binding side as well.  It will take a bit more
work on the user when creating debugfs files than the C api did, but
that's something that you want to impose on this api, not me :)

Sound reasonable?  Or am I missing something else here?

thanks,

greg k-h
