Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AF131A314C;
	Thu, 22 May 2025 06:25:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747895132; cv=none; b=sXip3qevjm1C6ifKMV5J4IQJdfFpktbIRXbevKGDlJ0qzp1gxkFj0A3KuG/RqF4qxhJSr55i9IPZJir4/EVO9GvDbRkRsCY/SstSAykGIcIGWpF9r/f2sSL6pPvv0V8XXEpcWtkvz/ggOVvQTAMSfBDlhuFEX9wa6z5uCYWoEXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747895132; c=relaxed/simple;
	bh=rqZZrgrPFKYEYT1roByKlO/+55B5s+fywF/7nzwuwJ4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YE7CobsBKJENMU3XOSDG4wcyI75FViSTgA+iDksBbeWRbFSxB+lWH2wPCskOOfGlx/EdCGybptqzGrOmfJZNC+W2PAbmdOjw/uLl2m0XXfW5oqWSIvoGhz0aeWZiEMOQKS017Bzhgyf8JiaavZv/Ro5V6g7N/NYYdn3OlzQ8J0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dEmxZY7I; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dEmxZY7I"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48CC5C4CEE4;
	Thu, 22 May 2025 06:25:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747895131;
	bh=rqZZrgrPFKYEYT1roByKlO/+55B5s+fywF/7nzwuwJ4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dEmxZY7IVmJ7dWmwNE2udc7u5aM0xnIaFlKqPPW0nYtNKLbs9902av+Mvsj4G5/kz
	 8rkw80Tt3lJOo8sTV1EutOhp9PZqAghO8h5vqf9HyISxmsrtxeuqbYd4elWdr01NQk
	 pz4+zsFRu10t6PUbZRojnJzNDTCbhw3/666iNYcrla7sMOC5vwQgHPADsSIj0lT21Z
	 75I1VobS3UvIEI4y4ik2ncFLEmb4XMfhm/VKwIPpA+Zb1QbWlumAd23yjBjInDfG5B
	 A7gA37iZwIKbfg025SSbCLhwsQmg8ISKCLf+Ggg/jV072i4PyQ9sVJ6mB5gb1XbFZs
	 WIvOmqNaOTHGA==
Date: Thu, 22 May 2025 08:25:25 +0200
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
Message-ID: <aC7DVewqqWIKetmk@pollux>
References: <20250505-debugfs-rust-v5-0-3e93ce7bb76e@google.com>
 <20250505-debugfs-rust-v5-4-3e93ce7bb76e@google.com>
 <D9VPA1M45WBK.1TB4KOUXD24BD@kernel.org>
 <aCRdNJ2oq-REBotd@pollux>
 <CAGSQo0204_Dz65G33pAN3_iY=ejPXJRdAiB4ioM-nvMkAh0YXQ@mail.gmail.com>
 <D9WM0BP5446N.1NVNDCZ4Y2QN1@kernel.org>
 <2025051524-festival-afterglow-8483@gregkh>
 <aCzzBT96ktapP03e@google.com>
 <aC2HacSU7j5d9bzu@pollux>
 <aC5XDi7SaDJeUaAC@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aC5XDi7SaDJeUaAC@google.com>

On Wed, May 21, 2025 at 10:43:26PM +0000, Alice Ryhl wrote:
> On Wed, May 21, 2025 at 09:57:29AM +0200, Danilo Krummrich wrote:
> > On Tue, May 20, 2025 at 09:24:21PM +0000, Alice Ryhl wrote:
> > > * If you remove a directory before the removing objects inside it, then
> > >   the Rust objects become "ghost" objects that are still usable, but not
> > >   visible in the file system anywhere. I.e. calling methods on them
> > >   succeed but are no-ops.
> > 
> > If we would want to keep an entry alive as long as there are more leaves, we'd
> > obviously need to reference count things.
> > 
> > But what do we need reference counting for with this logic? Shouldn't this be
> > also possible without?
> 
> Well, my understanding is that when you remove the parent directory, the
> dentries for child directories and files are freed, so trying to use the
> Rust objects that correspond to those child dentries would be a UAF. I
> want to refcount those child entries so that they at least remain valid
> memory even if they're no longer visible in the file system.

Yes, that makes sense.

Instead of using the dentry pointer as a handle, we could also use the entry's
path and do a lookup whenever the entry is used. Not saying this is better
though.

> > > * Possibly we have a way to drop a Rust object without removing it from
> > >   the file system. In this case, it can never be accessed from Rust
> > >   again, and the only way to remove it is to drop its parent directory.
> > 
> > I'm not sure about this one.
> > 
> > IIUC, this basically brings back the "keep() logic", which I still think is a
> > footgun and should be avoided.
> > 
> > Also, we only needed this, since due to the borrowing design we couldn't store
> > parent and child nodes in the same structure. With reference counting (or the
> > logic above) this goes away.
> > 
> > I wrote the following in a previous conversation [1].
> > 
> > --
> > 
> > What I see more likely to happen is a situation where the "root" directory
> > (almost) lives forever, and hence subsequent calls, such as
> > 
> > 	root.subdir("foo").keep()
> > 
> > effectively are leaks.
> > 
> > One specific example for that would be usb_debug_root, which is created in the
> > module scope of usb-common and is used by USB host / gadget / phy drivers.
> > 
> > The same is true for other cases where the debugfs "root" is created in the
> > module scope, but subsequent entries are created by driver instances. If a
> > driver would use keep() in such a case, we'd effectively leak memory everytime a
> > device is unplugged (or unbound in general).
> 
> Where is the leak? If the file is still visible in the file system, then
> it's not a leak to still have the memory. If the file got removed by
> removing its parent, then my intent is that this should free the memory
> of the child object.

Well, take the case I described above, where the debugfs "root" is created in
the module scope, but subsequent entries are created by driver instances. If a
driver would use keep() in such a case, we'd effectively the file / directory
(and subsequently also the corresponding memory) everytime a device is unplugged
(or unbound in general)."

If the module is built-in the directory from the module scope is *never*
removed, but the entries the driver e.g. creates in probe() for a particular
device with keep() will pile up endlessly, especially for hot-pluggable devices.

(It's getting even worse when there's data bound to such a leaked file, that
might even contain a vtable that is entered from any of the fops of the file.)

That'd be clearly a bug, but for the driver author calling keep() seems like a
valid thing to do -- to me that's clearly a built-in footgun.
