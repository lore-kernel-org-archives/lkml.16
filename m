Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A36C224234;
	Fri, 23 May 2025 09:15:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747991725; cv=none; b=E8eYMHwdVvbiwCaqeP3LijSDg7HoinvzoHqveYqSHNaHciMrNYkCngURDcy0NBaP4GAjGCJmvi9iR5jxTqZJBCxOvaF3MGNKAB3xrhuJ+9lhtO9HwqNt/0uqpXf5x1hD4uMvWzDDiq0gTnhmEbh/2amjBJzDeaSQAzwZCs0UU9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747991725; c=relaxed/simple;
	bh=t9tqz4h/SqV0H/E8hB63MjBzcb9vgaiRhGH6hVJ+U0w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SPaN9Qfdvhlhc4xkDpTOtIsUmfvPvIvzhfNPdWO07W4bdQpYWmKP7j+mYmq6u0YEKsv0m9n6x02fVqViieG7zKXVRyThqz90i+xGoTk37pgdsOp0u8/2ZNSJrHEo1qttIxRz6D2Nf4RUJO1pAifvgTuIPt5GE0Mw3k+nPqiRekY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=cRBfhuIS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="cRBfhuIS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81EF8C4CEE9;
	Fri, 23 May 2025 09:15:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1747991725;
	bh=t9tqz4h/SqV0H/E8hB63MjBzcb9vgaiRhGH6hVJ+U0w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cRBfhuISBKElRx6rV1vv1pVGdBDrfuFVnerNDcaBrj6kmotjVsL9g7HxKr93mjbpN
	 s6kLiX7CdXfaSUalS6fMZSDNG9GGzlJw4ShQ+5dVTZdpT6Us1fo2ckqVYD2iMJ+DLL
	 3LMIaRjs0xG3Ni2sqrdN67BFzy0MTUEeSPH1TRDE=
Date: Fri, 23 May 2025 11:15:22 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Benno Lossin <lossin@kernel.org>,
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
Message-ID: <2025052344-chariot-giddiness-8f58@gregkh>
References: <CAGSQo0204_Dz65G33pAN3_iY=ejPXJRdAiB4ioM-nvMkAh0YXQ@mail.gmail.com>
 <D9WM0BP5446N.1NVNDCZ4Y2QN1@kernel.org>
 <2025051524-festival-afterglow-8483@gregkh>
 <aCzzBT96ktapP03e@google.com>
 <aC2HacSU7j5d9bzu@pollux>
 <aC5XDi7SaDJeUaAC@google.com>
 <aC7DVewqqWIKetmk@pollux>
 <aC8uNmrLUSS8sxHU@google.com>
 <2025052201-return-reprogram-add9@gregkh>
 <aC9hm9D458C6LsRW@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aC9hm9D458C6LsRW@google.com>

On Thu, May 22, 2025 at 05:40:43PM +0000, Alice Ryhl wrote:
> On Thu, May 22, 2025 at 04:15:46PM +0200, Greg Kroah-Hartman wrote:
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
> > 
> > If you really want to delete a debugfs file that you have created in the
> > past, then look it up and delete it with the call that is present for
> > that.
> > 
> > The only thing I think that might be worth "keeping" in some form, as an
> > object reference as discussed, is a debugfs directory.
> 
> That could work if we don't have any Rust value for files at all. The
> problem is that if we do have such values, then code like this:
> 
> let my_file = dir.create_file("my_file_name");
> dir.delete_file("my_file_name");
> my_file.do_something();
> 
> would be a UAF on the last line. We have to design the Rust API to avoid
> such UAF, which is why I suggested the ghost objects; the delete_file()
> call leaves my_file in a valid but useless state. And as a ghost object,
> the .do_something() call becomes a no-op since the file is now missing
> from the filesystem.

See my other response now, but I don't want there to be any
.do_something() calls that are possible here at all.  All a debugfs file
object can do is be created, or be destroyed.

thanks,

greg k-h
