Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEC7042A82;
	Wed, 14 May 2025 11:24:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747221879; cv=none; b=QHnqv1LztKbiVKT59JGDgVaJs0+bLPWqpqfj3HAo9am8+rd/boX0FWAuVeu+4DhCcRXt2QYZS+DZYxqPn+SHNciwp1OazTvqhfNwZj6tL4XlkjnJwj0LYCtj/fIoe6+4ejjaVz5+XOXHYgVO1juyZZ8DaJx1a2xItHYuBIpT6jU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747221879; c=relaxed/simple;
	bh=gmgCElPVE0zz99nGO29XUN1y5zd8AhbRBwx8UQ5oge0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pBI/+01yO8CsErIUtgGK29nP6uBNG8ruNc7W9Wvdw14kug2MsLyyOmpo008r99ghzH77FD3qFCt2wnK/slskN6Sn5Hc7tTyvSu2l4LWbu/UYrxcJ9nG83yrenVySMU7GLXzN5r7lJPk/fFHgHsUYd+QN3PWqufwjpmEKTF5m8b8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Zm9x/9i+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Zm9x/9i+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6EB61C4CEE9;
	Wed, 14 May 2025 11:24:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747221878;
	bh=gmgCElPVE0zz99nGO29XUN1y5zd8AhbRBwx8UQ5oge0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Zm9x/9i+2KZphUfiROiOwodWUrnsqA1D0MV/8szPyZ023qNfYsDNL32vfi23VN5lY
	 EUqSm2eLLeLWH2qUKyot73kzMQtGcxwtOEBon0ZPDS8WZ4BTigLBK0lBC7SAaKwZAm
	 jPZLDtmUP6aUx7uk5wGPyp4Un0z8XiGanT8oEcGAdaNgRRXrDc/DAdTbS/k9pNn3sH
	 E5migZmhc+QUkaajHhKm6Nh884jwNFWYx7Iowa2jHfq1NAHRkTE2gIxNoEkp158qYp
	 gB3cjJcIim8uPbktFNfg/otib/ciPZgQO454IuZ/rGDGGjlOnaL21BfxBDms64QRuF
	 6fDs13bVBVFdw==
Date: Wed, 14 May 2025 13:24:32 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Benno Lossin <lossin@kernel.org>
Cc: Matthew Maurer <mmaurer@google.com>, Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	Timur Tabi <ttabi@nvidia.com>, linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v5 4/4] rust: samples: Add debugfs sample
Message-ID: <aCR9cD7OcSefeaUm@pollux>
References: <20250505-debugfs-rust-v5-0-3e93ce7bb76e@google.com>
 <20250505-debugfs-rust-v5-4-3e93ce7bb76e@google.com>
 <D9VPA1M45WBK.1TB4KOUXD24BD@kernel.org>
 <aCRdNJ2oq-REBotd@pollux>
 <D9VSJTPCSNXV.1LCXKGKVDGP96@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <D9VSJTPCSNXV.1LCXKGKVDGP96@kernel.org>

On Wed, May 14, 2025 at 11:54:39AM +0200, Benno Lossin wrote:
> On Wed May 14, 2025 at 11:07 AM CEST, Danilo Krummrich wrote:
> > On Wed, May 14, 2025 at 09:20:49AM +0200, Benno Lossin wrote:
> >> On Tue May 6, 2025 at 1:51 AM CEST, Matthew Maurer wrote:
> >> > +impl kernel::Module for RustDebugFs {
> >> > +    fn init(_this: &'static ThisModule) -> Result<Self> {
> >> > +        // Create a debugfs directory in the root of the filesystem called "sample_debugfs".
> >> > +        let debugfs = Dir::new(c_str!("sample_debugfs"));
> >> > +
> >> > +        {
> >> > +            // Create a subdirectory, so "sample_debugfs/subdir" now exists.
> >> > +            // We wrap it in `ManuallyDrop` so that the subdirectory is not automatically discarded
> >> > +            // at the end of the scope - it will be cleaned up when `debugfs` is.
> >> > +            let sub = ManuallyDrop::new(debugfs.subdir(c_str!("subdir")));
> >> 
> >> I dislike the direct usage of `ManuallyDrop`. To me the usage of
> >> `ManuallyDrop` signifies that one has to opt out of `Drop` without the
> >> support of the wrapped type. But in this case, `Dir` is sometimes
> >> intended to not be dropped, so I'd rather have a `.keep()` function I
> >> saw mentioned somewhere.
> >
> > I agree, if we really want to "officially" support to forget() (sub-)directories
> > and files in order to rely on the recursive cleanup of the "root" directory, it
> > should be covered explicitly by the API. I.e. (sub-)directories and files should
> > have some kind of keep() and / or forget() method, to make it clear that this is
> > supported and by design and won't lead to any leaks.
> >
> > Consequently, this would mean that we'd need something like your proposed const
> > generic on the Dir type, such that keep() / forget() cannot be called on the
> > "root" directory.
> >
> > However, I really think we should keep the code as it is in this version and
> > just don't provide an example that utilizes ManuallyDrop and forget().
> >
> > I don't see how the idea of "manually dropping" (sub-)directories and files
> > provides any real value compared to just storing their instance in a driver
> > structure as long as they should stay alive, which is much more intuitive
> > anyways.
> 
> Yeah that's whats normally done in Rust anyways. But I think that
> lifetimes bite us in this case:
> 
>     let debugfs: Dir<'static> = Dir::new(cstr!("sample_debugfs"));
> 
>     let sub: Dir<'a> = debugfs.subdir(cstr!("subdir"));
>     // lifetime `'a` starts in the line above and `sub` borrows `debugfs`
> 
>     /* code for creating the file etc */
> 
>     Ok(Self { _debugfs: debugfs, _sub: sub })
>     // lifetime `'a` has to end in the line above, since debugfs is moved but `sub` still borrows from it!
> 
> This code won't compile, since we can't store the "root" dir in the same
> struct that we want to store the subdir, because the subdir borrows from
> the root dir.
> 
> Essentially this would require self-referential structs like the
> `ouroboros` crate [1] from user-space Rust. We should rather have the
> `.keep()` function in the API than use self-referential structs.

Fair enough -- I think we should properly document those limitations, recommend
using keep() for those cases and ensure that we can't call keep() on the "root"
directory then.

Unless, we can find a better solution, which, unfortunately, I can't think of
one. The only thing I can think of is to reference count (parent) directories,
which would be contrary to how the C API works and not desirable.

> [1]: https://docs.rs/ouroboros/latest/ouroboros/attr.self_referencing.html
> 
> Another problem that only affects complicated debugfs structures is that
> you would have to store all subdirs & files somewhere. If the structure
> is dynamic and changes over the lifetime of the driver, then you'll need
> a `Vec` or store the dirs in `Arc` or similar, leading to extra
> allocations.

If it changes dynamically then it's pretty likely that we do not only want to
add entries dynamically, but also remove them, which implies that we need to be
able to drop them. So, I don't think that's a problem.

What I see more likely to happen is a situation where the "root" directory
(almost) lives forever, and hence subsequent calls, such as

	root.subdir("foo").keep()

effectively are leaks.

One specific example for that would be usb_debug_root, which is created in the
module scope of usb-common and is used by USB host / gadget / phy drivers.

The same is true for other cases where the debugfs "root" is created in the
module scope, but subsequent entries are created by driver instances. If a
driver would use keep() in such a case, we'd effectively leak memory everytime a
device is unplugged (or unbound in general).

> 
> > It either just adds complexity to the API (due to the need to distingish between
> > the "root" directory and sub-directories) or makes the API error prone by
> > providing a *valid looking* option to users to leak the "root" directory.
> 
> I agree with this, I want that `ManuallyDrop` & `forget` are only used
> rarely mostly for low-level operations.
> 
> ---
> Cheers,
> Benno
