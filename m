Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E15926B2D3;
	Thu, 22 May 2025 08:28:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747902501; cv=none; b=Wryb8NKin56pFO440TQCd+0f3Pw/v9PhCRp8dCpXAyPi631TrgDjel/+IRCkL5Ynx+6R/1J8EaXKXchTWYohCyf1Zufz1aH+hVishYfFqJfLwBvf+3vSLUr/4rlIavOLrLlO5xl/wydL0sjzLLqE4qfAFOzQpP2HO3AZyub3adc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747902501; c=relaxed/simple;
	bh=wLrOCLGIk2sHrBM7J3gCEivUUz9lY+nBBrO98EeHkIY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mDNimSeKY13g96TmKGThK0Rgn59dNdvyXAxt9ltzl+9V1H5Na5WmKaGPJ6hgVdHyWM+HgfmoylxIoDckJjH5NWP+0XpZj2tHc7S+GVgWm2IhGKWVmzczQP1oh6iUiaKJU+A7fcwchVxf2/TELeNRNnwpJ0c+PmWpWaYwi/yUZg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=b8MDX/l2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="b8MDX/l2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 765B9C4CEE4;
	Thu, 22 May 2025 08:28:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1747902498;
	bh=wLrOCLGIk2sHrBM7J3gCEivUUz9lY+nBBrO98EeHkIY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=b8MDX/l2Phyt3n5kFbNpT32rS/R3+oOd5bbptvyF5aUSK50qt6O8EYevLvLCSVV3O
	 7Xo7JUCB0kkVuy+NVPuHFWIz5Wer3p/fCJ41llYHsCPhfYX1RKuv712PxHf/aB+Ijo
	 6NEGFLOajUeYCJ/CR473aWQBUADE0aSd3uVkSAcg=
Date: Thu, 22 May 2025 10:28:14 +0200
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
Message-ID: <2025052205-thing-daylight-1115@gregkh>
References: <20250505-debugfs-rust-v5-4-3e93ce7bb76e@google.com>
 <D9VPA1M45WBK.1TB4KOUXD24BD@kernel.org>
 <aCRdNJ2oq-REBotd@pollux>
 <CAGSQo0204_Dz65G33pAN3_iY=ejPXJRdAiB4ioM-nvMkAh0YXQ@mail.gmail.com>
 <D9WM0BP5446N.1NVNDCZ4Y2QN1@kernel.org>
 <2025051524-festival-afterglow-8483@gregkh>
 <aCzzBT96ktapP03e@google.com>
 <aC2HacSU7j5d9bzu@pollux>
 <aC5XDi7SaDJeUaAC@google.com>
 <aC7DVewqqWIKetmk@pollux>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aC7DVewqqWIKetmk@pollux>

On Thu, May 22, 2025 at 08:25:25AM +0200, Danilo Krummrich wrote:
> On Wed, May 21, 2025 at 10:43:26PM +0000, Alice Ryhl wrote:
> > On Wed, May 21, 2025 at 09:57:29AM +0200, Danilo Krummrich wrote:
> > > On Tue, May 20, 2025 at 09:24:21PM +0000, Alice Ryhl wrote:
> > > > * If you remove a directory before the removing objects inside it, then
> > > >   the Rust objects become "ghost" objects that are still usable, but not
> > > >   visible in the file system anywhere. I.e. calling methods on them
> > > >   succeed but are no-ops.
> > > 
> > > If we would want to keep an entry alive as long as there are more leaves, we'd
> > > obviously need to reference count things.
> > > 
> > > But what do we need reference counting for with this logic? Shouldn't this be
> > > also possible without?
> > 
> > Well, my understanding is that when you remove the parent directory, the
> > dentries for child directories and files are freed, so trying to use the
> > Rust objects that correspond to those child dentries would be a UAF. I
> > want to refcount those child entries so that they at least remain valid
> > memory even if they're no longer visible in the file system.
> 
> Yes, that makes sense.
> 
> Instead of using the dentry pointer as a handle, we could also use the entry's
> path and do a lookup whenever the entry is used. Not saying this is better
> though.

Either is fine, as long as that "handle" isn't exported out of the
internal binding for anyone to access directly.

> > > What I see more likely to happen is a situation where the "root" directory
> > > (almost) lives forever, and hence subsequent calls, such as
> > > 
> > > 	root.subdir("foo").keep()
> > > 
> > > effectively are leaks.
> > > 
> > > One specific example for that would be usb_debug_root, which is created in the
> > > module scope of usb-common and is used by USB host / gadget / phy drivers.
> > > 
> > > The same is true for other cases where the debugfs "root" is created in the
> > > module scope, but subsequent entries are created by driver instances. If a
> > > driver would use keep() in such a case, we'd effectively leak memory everytime a
> > > device is unplugged (or unbound in general).
> > 
> > Where is the leak? If the file is still visible in the file system, then
> > it's not a leak to still have the memory. If the file got removed by
> > removing its parent, then my intent is that this should free the memory
> > of the child object.
> 
> Well, take the case I described above, where the debugfs "root" is created in
> the module scope, but subsequent entries are created by driver instances. If a
> driver would use keep() in such a case, we'd effectively the file / directory
> (and subsequently also the corresponding memory) everytime a device is unplugged
> (or unbound in general)."
> 
> If the module is built-in the directory from the module scope is *never*
> removed, but the entries the driver e.g. creates in probe() for a particular
> device with keep() will pile up endlessly, especially for hot-pluggable devices.
> 
> (It's getting even worse when there's data bound to such a leaked file, that
> might even contain a vtable that is entered from any of the fops of the file.)
> 
> That'd be clearly a bug, but for the driver author calling keep() seems like a
> valid thing to do -- to me that's clearly a built-in footgun.

Yeah, I like the keep() thing less and less and I think it can be done
without it entirely.

thanks,

greg k-h
