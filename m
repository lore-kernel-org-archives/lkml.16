Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com [209.85.221.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96B1029713F
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 17:06:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748020021; cv=none; b=oqIj8bCWERCgkeOMIKZkLtsDBgqSaf3qGFNYo2Q6sFtZonyhNs790kFO8osTxdy6OlofXfMJSK8MumiUKe5VnlbuuzqBnRvJgnaTvSlj+nz+ZWkEoB+RHTktem3RulVrnCWuexpCBO9NSf6oGkpOqqGximggXoAZD5lxXxaFMWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748020021; c=relaxed/simple;
	bh=V2BRL2F6z1oi5Z7o1kzugA/0LWsQhDNFDDWhi5hdfnM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=EVjJUtNDTQsxlZCaoVJ7rpM63BRpzsAYLaVymCwVr07dJO77UHjNg5FMb+RdsjF3eJATPBSXrWENFb2gbBC6k71YCg6cDh1KLGpi0+nL6Vr/KtoXqPbkJTIBYRFrrLWDqcl6AfP7CyhmzNkBXQ0vrOqtSLOMZl2SgCQOmgJqlwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Fiu8XKMl; arc=none smtp.client-ip=209.85.221.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Fiu8XKMl"
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-3a4bab50c35so67785f8f.3
        for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 10:06:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748020018; x=1748624818; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=NvZeCtyz17wMaia/VQjjVKTrRdzsemBeeYK1+YrOw2c=;
        b=Fiu8XKMlm7BDk+M8qb0uTk12lIWK0Yoaz+BNHi1vTmt8d2iq4+YeiV4Bk0np0vEqhs
         QsQ+BADmOfyHFOigYi9ptDDfB2ScfhnfdqaeQAcN3IRI9Y5V0CEAxK2qril+fOUSRHBz
         AAXGcUCLlF7HLS+faJPXwijNQJijxtogdDBujZaOPAe5+dlkcE36zJjt2u2THSrr7ZI7
         xcQ9n6O/sNYwRZBlvatPH8evXyMDuhqOiELI5Agt11N8G+wjEUiWHiSlFGkFzN28rHpD
         NNwcD2/0M63ysHBlguH88OzsKq+phbxmNwJ66J8CuEPpwM3F+3hgwbaY5hd1PS0EDRgr
         93iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748020018; x=1748624818;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NvZeCtyz17wMaia/VQjjVKTrRdzsemBeeYK1+YrOw2c=;
        b=t47Rysezdq1Vl60cRP0a06+I/XEGHRv7t6P/2vTZC3aKGixdoeKp+zJjsMMKjQ+r1k
         k3fJniYL8IhWYwwHouxkacrVTKTbzxvsN2vLG7xcnb5jd3E4Lnxs3ZykWilYWfkJxKGk
         6M9dCcrGQz3Q2BcAvul9t/XjuF19QU0Le/c9ux/b3LA1q7lph+fMVujxl01jncpWI6x3
         BjNRkfK8MdnyEUZmFDKfaBdkrERot0y8adNsjN0EVMyO7BcOq5Bl4dce6YxwB5U0IN65
         hvz5EX4xoj8/RKKrQQNGS8V5/cxDRyDFyjvN2tmkWeIacdVzRMSjFobS5PUPjImQcmtz
         7bng==
X-Forwarded-Encrypted: i=1; AJvYcCXl0yybn66SESno5Nvf0SD2Yiffe5QVK924tU02fJWgEUV5aQ4w5JPqTXAIHhrTgw51ZXij/rpJQvCFG30=@vger.kernel.org
X-Gm-Message-State: AOJu0YwuGpMiUx9jZU+MhcA8m3Pthm5l0KsdNbKmgzyB9wJAxBNVRN7F
	sdwuYnC24cMU9UFONvqcXcYxImp19dZzEdZXpgcuH0QUj4a95bInscwQgRLvV3m5+HbBpdXAY64
	Ah8vi957/qLcLVVbR8Q==
X-Google-Smtp-Source: AGHT+IHVC8RvJLPDnaqHG2+GL0MpH/NtVjIBBOTZ10GJtCZwx5sWrfYVREnYwIhuIuAEdYjm4VfjxsHn04dItMs=
X-Received: from wmbhj14.prod.google.com ([2002:a05:600c:528e:b0:442:f9ef:e460])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:2301:b0:3a3:5c40:2000 with SMTP id ffacd0b85a97d-3a4cb42fb03mr124862f8f.13.1748020017869;
 Fri, 23 May 2025 10:06:57 -0700 (PDT)
Date: Fri, 23 May 2025 17:06:56 +0000
In-Reply-To: <2025052330-reverence-slideshow-d498@gregkh>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <D9WM0BP5446N.1NVNDCZ4Y2QN1@kernel.org> <2025051524-festival-afterglow-8483@gregkh>
 <aCzzBT96ktapP03e@google.com> <aC2HacSU7j5d9bzu@pollux> <aC5XDi7SaDJeUaAC@google.com>
 <aC7DVewqqWIKetmk@pollux> <aC8uNmrLUSS8sxHU@google.com> <2025052201-return-reprogram-add9@gregkh>
 <aC9krUYJmJqu0xVR@cassiopeiae> <2025052330-reverence-slideshow-d498@gregkh>
Message-ID: <aDCrMDQYbqTz46pI@google.com>
Subject: Re: [PATCH v5 4/4] rust: samples: Add debugfs sample
From: Alice Ryhl <aliceryhl@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Danilo Krummrich <dakr@kernel.org>, Benno Lossin <lossin@kernel.org>, 
	Matthew Maurer <mmaurer@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, 
	Timur Tabi <ttabi@nvidia.com>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Fri, May 23, 2025 at 11:14:23AM +0200, Greg Kroah-Hartman wrote:
> On Thu, May 22, 2025 at 07:53:49PM +0200, Danilo Krummrich wrote:
> > On Thu, May 22, 2025 at 04:15:46PM +0200, Greg Kroah-Hartman wrote:
> > > On Thu, May 22, 2025 at 02:01:26PM +0000, Alice Ryhl wrote:
> > > > On Thu, May 22, 2025 at 08:25:25AM +0200, Danilo Krummrich wrote:
> > > > > On Wed, May 21, 2025 at 10:43:26PM +0000, Alice Ryhl wrote:
> > > > > > > > * Possibly we have a way to drop a Rust object without removing it from
> > > > > > > >   the file system. In this case, it can never be accessed from Rust
> > > > > > > >   again, and the only way to remove it is to drop its parent directory.
> > > > > > > 
> > > > > > > I'm not sure about this one.
> > > > > > > 
> > > > > > > IIUC, this basically brings back the "keep() logic", which I still think is a
> > > > > > > footgun and should be avoided.
> > > > > > > 
> > > > > > > Also, we only needed this, since due to the borrowing design we couldn't store
> > > > > > > parent and child nodes in the same structure. With reference counting (or the
> > > > > > > logic above) this goes away.
> > > > > > > 
> > > > > > > I wrote the following in a previous conversation [1].
> > > > > > > 
> > > > > > > --
> > > > > > > 
> > > > > > > What I see more likely to happen is a situation where the "root" directory
> > > > > > > (almost) lives forever, and hence subsequent calls, such as
> > > > > > > 
> > > > > > > 	root.subdir("foo").keep()
> > > > > > > 
> > > > > > > effectively are leaks.
> > > > > > > 
> > > > > > > One specific example for that would be usb_debug_root, which is created in the
> > > > > > > module scope of usb-common and is used by USB host / gadget / phy drivers.
> > > > > > > 
> > > > > > > The same is true for other cases where the debugfs "root" is created in the
> > > > > > > module scope, but subsequent entries are created by driver instances. If a
> > > > > > > driver would use keep() in such a case, we'd effectively leak memory everytime a
> > > > > > > device is unplugged (or unbound in general).
> > > > > > 
> > > > > > Where is the leak? If the file is still visible in the file system, then
> > > > > > it's not a leak to still have the memory. If the file got removed by
> > > > > > removing its parent, then my intent is that this should free the memory
> > > > > > of the child object.
> > > > > 
> > > > > Well, take the case I described above, where the debugfs "root" is created in
> > > > > the module scope, but subsequent entries are created by driver instances. If a
> > > > > driver would use keep() in such a case, we'd effectively the file / directory
> > > > > (and subsequently also the corresponding memory) everytime a device is unplugged
> > > > > (or unbound in general)."
> > > > > 
> > > > > If the module is built-in the directory from the module scope is *never*
> > > > > removed, but the entries the driver e.g. creates in probe() for a particular
> > > > > device with keep() will pile up endlessly, especially for hot-pluggable devices.
> > > > > 
> > > > > (It's getting even worse when there's data bound to such a leaked file, that
> > > > > might even contain a vtable that is entered from any of the fops of the file.)
> > > > > 
> > > > > That'd be clearly a bug, but for the driver author calling keep() seems like a
> > > > > valid thing to do -- to me that's clearly a built-in footgun.
> > > > 
> > > > I mean, for cases such as this, I could imagine that you use `keep()` on
> > > > the files stored inside of the driver directory, but don't use it on the
> > > > directory. That way, you only have to keep a single reference to an
> > > > entire directory around, which may be more convenient.
> > > 
> > > No, sorry, but debugfs files are "create and forget" type of things.
> > > The caller has NO reference back to the file at all in the C version,
> > > let's not add that functionality back to the rust side after I spent a
> > > long time removing it from the C code :)
> > 
> > This response sounds like we may have a different understanding of what "keep"
> > means.
> > 
> > Earlier versions of this patch series introduced a keep() method for both
> > debugfs::File and debugfs::Dir, which would consume, and hence get rid of, the
> > instance of a debugfs::File or a debugfs::Dir object, while *keeping* the
> > corresponding directory / file in the filesystem.
> > 
> > This makes it easy for a driver to leak the directory / file in the filesystem,
> > as explained in [1], which you seemed to agree with in [2].
> > 
> > Was this a misunderstanding?
> 
> Kind of, see below:
> 
> > > If you really want to delete a debugfs file that you have created in the
> > > past, then look it up and delete it with the call that is present for
> > > that.
> > 
> > This is promoting a C pattern (which for C code obviously makes a lot of sense),
> > i.e. we have a function that creates a thing and another function that removes
> > the thing given a handle of the created thing. Whether the handle is valid is
> > the responsibility of the caller.
> > 
> > In this case the handle would be the filename. For instance:
> > 
> > 	debugfs_create_file("foo", parent, ...);
> > 	debugfs_remove(debugfs_lookup("foo", parent));
> > 
> > This leaves room to the caller for making mistakes, e.g. if the caller makes a
> > typo in the filename. In this case we wouldn't even recognize it from the return
> > value, since there is none.
> > 
> > In Rust, we do things differently, i.e. we wrap things into an object that
> > cleans up itself, once it goes out of scope. For instance:
> > 
> > 	let file = debugfs::File::new("foo", parent);
> > 
> > Subsequently we store file in a structure that represents the time we want this
> > file to exist. Once it goes out of scope, it's removed automatically.
> > 
> > This is better, since we can't make any mistakes anymore, i.e. we can't mess up
> > the filename or pass the wrong parent to clean things up.
> > 
> > Depending on whether the above was a misunderstanding and depending on how you
> > think about it with this rationale, I have quite some more reasons why we don't
> > want to have files / directories around in the filesystem without a
> > corresponding object representation in Rust.
> > 
> > But before I write up a lot more text, I'd like to see if we're not already on
> > the same page. :-)
> 
> Ok, let's knock up the api here first before worrying about the
> implementation, as we seem to all be a bit confused as to what we want
> to do.
> 
> Ideally, yes, I would like to NOT have any rust structure represent a
> debugfs file, as that is the way the C api has been evolving.  We are
> one step away from debugfs_create_file() being a void function that
> doesn't return anything, and I don't want to see us go "backwards" here.
> 
> But the main reason I did that work was to keep people from trying to
> determine if a file creation worked or not and to do different logic
> based on that.  I think the Rust api CAN do both here, as you and Alice
> have explained, so we should be ok.
> 
> So how about this for an example api, two structures, debugfs::Directory
> and debugfs::File, which have only two types of operations that can be
> done on them:
> 
> To create a debugfs directory, we do:
> 
> 	let my_dir = debugfs::Directory::new("foo_dir", parent);
> 
> There is no other Directory method, other than "drop", when the object
> goes out of scope, which will clean up the directory and ALL child
> objects at the same time (implementation details to be figured out
> later.)
> 
> That will ALWAYS succeed no matter if the backend debugfs call failed or
> not, and you have no way of knowing if it really did create something or
> not.  That directory you can then use to pass into debugfs file or
> directory creation functions.
> 
> Same for creating a debugfs file, you would do something like:
> 
> 	let my_file = debugfs::File::new("foo_file", my_dir);
> 
> depending on the "file type" you want to create, there will be different
> new_* methods (new_u32, new_u64, etc.).
> 
> which also ALWAYS succeeds.  And again, as you want to keep objects
> around, you have to have a reference on it at all times for it to exist
> in the filesystem.  If you drop it, then it too will be removed from
> debugfs.
> 
> And again, that's the only operation you can do on this object, there
> are no other methods for it other than "new" and "drop".
> 
> Now there are issues with implementation details here like:
>   - Do you want to keep the list of file and dir objects in the rust
>     structure to manually clean them up when we go to drop the
>     directory?
>   - Do we want to force all files to be dropped before the directory?
>     Or do we want to just let the C side clean it all up automagically
>     instead?
> and other things like that, but we can argue about that once we settle
> on the outward-facing api first.
> 
> I can live with this type of api.  It's simple and seems hard to abuse
> or get wrong from a user point-of-view, and should be pretty
> straight-forward on the binding side as well.  It will take a bit more
> work on the user when creating debugfs files than the C api did, but
> that's something that you want to impose on this api, not me :)
> 
> Sound reasonable?  Or am I missing something else here?

This does sound reasonable to me. I'm fine with always succeeding. I do
agree with Danilo that I would bias towards dir.file("foo_file"), but
it's not a super big deal to me.

I think the main thing I want to say here is that we should *not* force
files to be dropped before the directory, and we should also not force
child directories to be dropped before their parent directories. Trying
to impose that requirement on callers will make the API significantly
harder to use, and it's not worth it.

Alice
