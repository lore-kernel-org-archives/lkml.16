Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E50D12628D;
	Sat, 24 May 2025 12:25:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748089534; cv=none; b=qhLUh39yqcqQOzBVGu5yhWgQ61kXxDYyH1mjrpdHy+eHtqw22R0TNlfLwJJ8s6neTm5WDKVN8+IiJc+gmie7ftIzQrVC9lKX+7Au0a4I3P26idauCDVGui+bCooOEVem/EUUMM6DHhA7NqXRrUgR1HrzDaqKaPGrBLIEUNXNuMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748089534; c=relaxed/simple;
	bh=yVYaerb/jU3BxcNZXp7iBv190F9MWlYXKuCoD8t8ycw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u15BA6yd8r5+IIC8GkKbe5Urj/SG/LbmE8Qdy1N4pejJwZPGuhIVuiJk1Swtf4TVOf8sr8fB4UHpKZnOTKDJWtGVR5Nvh9dkDYFgYifXJh1n8g4JS2ywcrzZgCEmbxCTyeVGw2IpkWhCYdnUZBtHjxLGCultGG6kJqtRRMDpis4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=p/zpeqA8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="p/zpeqA8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0670CC4CEE4;
	Sat, 24 May 2025 12:25:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748089533;
	bh=yVYaerb/jU3BxcNZXp7iBv190F9MWlYXKuCoD8t8ycw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=p/zpeqA8ezheaDjtuGcRTgNSB9q8hRQl4GYWED/+PHCIDWNW8mMbhLOsU43svDgGK
	 F2IJlphinhn4HQhOZXnUOsc/x9qoL3Qw2WeKCgZbF09epyyhjC+SwmcKbz8MwlXz3c
	 NCj5/+r2voKPPYQGub/B44mCzDB/HAJ1ttVET09SM0IeBNiaZiwzpn8T4c+1AwKzOD
	 LBYggOiRy+m7e7fwOvAFnGjmI++y826u9thYInXB2e25zZa5B2LXM2sStYSbsfZH3x
	 Ua/6LVSaTbKTwURmuZtTuLE7dCJ8RoJ1p2NogHJaWhqJ+LFCuNsAokDfWq666zniHU
	 PYsyCVLHDHxDQ==
Date: Sat, 24 May 2025 14:25:27 +0200
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
Message-ID: <aDG6t-HdZSuWyPGo@pollux.localdomain>
References: <aCzzBT96ktapP03e@google.com>
 <aC2HacSU7j5d9bzu@pollux>
 <aC5XDi7SaDJeUaAC@google.com>
 <aC7DVewqqWIKetmk@pollux>
 <aC8uNmrLUSS8sxHU@google.com>
 <2025052201-return-reprogram-add9@gregkh>
 <aC9krUYJmJqu0xVR@cassiopeiae>
 <2025052330-reverence-slideshow-d498@gregkh>
 <aDBC__rflS8625Vb@cassiopeiae>
 <aDCrufEjtJeGjO6z@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aDCrufEjtJeGjO6z@google.com>

On Fri, May 23, 2025 at 05:09:13PM +0000, Alice Ryhl wrote:
> On Fri, May 23, 2025 at 11:42:23AM +0200, Danilo Krummrich wrote:
> > The only thing I don't want to is to allow to leak files or directories, i.e.
> > 
> > 	File::new("bar_file", bar_dir).leak()
> > 
> > which keeps the file in the filesystem, but takes away the handle from the Rust
> > side, such that it won't be removed from the filesystem anymore when the handle
> > goes out of scope, which can cause nasty bugs. But I think there isn't any
> > benefit to allow this anyways and it isn't needed with reference counting.
> 
> Why not have leak() for files only? That way, the files still go away
> when you drop the directory, and you don't have to keep around a bunch
> of File objects in your Rust structs.

In a previous mail I said that there are more reasons why we don't want to have
files (or directories) in the filesystem without an object representation in
Rust.

One of them is when attaching private data to a file, like we do with
debugfs_create_file().

When we do this, in most of the cases we want to share data between a driver
structure and the debugfs file (e.g. a GPU's VM to dump the virtual address
space layout).

And most likely we do this by passing an Arc<T> to dir.file(), to make the file
own a reference to the corresponding reference counted object (in C we just hope
that no one frees the object while the debugfs file holds a pointer to it).

The question is, what happens to this reference if we would subsequently call
file.leak()? We can't drop the Arc, because otherwise we risk a UAF in the
filesystem callback, but we can't keep it either because otherwise we *really*
leak this reference, even if the parent directory is removed eventually.

--

Now, one could say, what about attaching the file's private data to the directory
instead? (And I think this has been proposed already elsewhere.)

But I really don't like this approach, because it would mean that when creating
the directory we would necessarily need to know all the files we will ever
create in this directory *and* have all the corresponding private data
available at this point of time. But that would be an insane requirement.

For instance, let's assume a driver creates a directory 'clients', which for
every connected userspace "client" wants to provide a file with some metadata
for this client.

Sure, you can work around this somehow, e.g. by using a mutex protected Vec as
private data or by always creating a new directory first for dynamically created
debugfs entires. But this sounds pretty horrible to me.
