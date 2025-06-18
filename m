Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27A0A1B4121;
	Wed, 18 Jun 2025 15:32:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750260732; cv=none; b=AJZUcqCsP/oy1EZLoGgukybKFEermjGsV9keUy0g8HfB0yaP1QR95zlH1nmm6q2ft+7chUp8gpeX6BL5qbduMhfQ50MR0msGOij4gduXr3CrajHGVD7GRFeU1NPHh3ARyVqVhcfE57RZPutoHVoUBoG6aAZbaPjxLHnvETqKKJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750260732; c=relaxed/simple;
	bh=9fyrUDii4EsU5ZWomQRcPWSUxRdw4RrXECeKD8bewZ0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eLmHP7HxI0mtPytOYQ7W8i0WzsFsQuCry842A7doU/5DTwpEuJWUT5F2XV7iQtfpspg6x8rkmDcIWGmq17XDc3ngICeOWjJ4/Tn2B1YC3umv/25rSUu4GyTF0pzJ9THa5+122r4L1e1tKHydvmpX9/OC4FCv/RXTagvBr/yCC20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N2DgnRIS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N2DgnRIS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D2FFC4CEE7;
	Wed, 18 Jun 2025 15:32:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750260730;
	bh=9fyrUDii4EsU5ZWomQRcPWSUxRdw4RrXECeKD8bewZ0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=N2DgnRISxj2lHw5r7scLZ4hQ7KP60wvoxXDN518bbJw3/tNLUfFfGnWeyAey9mXFB
	 zHquRdU+LvUTXNRM4zsiD1yLBjxtksXBI9T3UTVkIlpp1oS2e06CxPDXfePCxBg22q
	 sY6Bw0yuNe1R2uFB/sNg4lJGcsPCBDYugt+OXReXZtGJRc8dn+T0ZJStTwhx3gyyw7
	 v2YxqaotyZ+pe4DWWQDSjHa/Q5GVPwuVJ596KX+nG8f1gXl1OoPa0MupSueHjt1O1D
	 wv3rwBLi354hz9VhJKov0Sjiu2jZPjRe3aTYGXTq4k92Jl7z+y9TMskwVPrX9V3x2p
	 Rtv1xR2OPNoKQ==
Date: Wed, 18 Jun 2025 17:32:04 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Matthew Maurer <mmaurer@google.com>
Cc: Alice Ryhl <aliceryhl@google.com>, Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	Timur Tabi <ttabi@nvidia.com>, Benno Lossin <lossin@kernel.org>,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v6 3/5] rust: debugfs: Support arbitrary owned backing
 for File
Message-ID: <aFLb9CcL5W-y_TBl@pollux>
References: <20250618-debugfs-rust-v6-0-72cae211b133@google.com>
 <20250618-debugfs-rust-v6-3-72cae211b133@google.com>
 <aFJ2fJ_pX8mWCQo6@google.com>
 <CAGSQo00fwu-UEi9D+Q4F5WpfUUuz562odhaDhp=F99cJyd9WyQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAGSQo00fwu-UEi9D+Q4F5WpfUUuz562odhaDhp=F99cJyd9WyQ@mail.gmail.com>

On Wed, Jun 18, 2025 at 08:00:51AM -0700, Matthew Maurer wrote:
> > We may want to consider using the ForeignOwnable trait here instead. The
> 
> I was considering trying to switch over to `StableDeref`-like trait
> [1] in a follow-up patchset. The core property I need is that moving
> the `D` cannot result in the pointer it would `deref` to changing.
> 
> The problem with `ForeignOwnable` is that it forbids the user from
> passing in a `Box<dyn Foo>`, because that doesn't fit in a `void*` A
> `StableDeref` version would not have this issue. I agree that
> `ForeignOwnable` would be a strict upgrade to what I have now, since a
> user can still pass in a `Box<Box<dyn Foo>>` and have it work with
> `ForeignOwnable`, and if we ever added `StableDeref`, then
> `ForeignOwnable` would have a blanket impl for it.
> 
> I'll send a new version using `ForeignOwnable`, and we can consider
> the `StableDeref` version in the future.

Yes, please do that for now. It's rather common case that drivers want to expose
reference counted data, i.e. an Arc, through debugfs and having to go through
the indirection with an additional Box isn't quite nice.

> [1]: https://docs.rs/gimli/latest/gimli/trait.StableDeref.html
> 
> 
> > trait is implemented by anything that can be converted to/from a void
> > pointer, so you can:
> >
> > * When creating the file, convert it to a void pointer that you store in
> >   File and pass to debugfs_create_file_full.
> > * When displaying the file, create a borrowed version of the void
> >   pointer and display that.
> > * When freeing the File, convert the void pointer back into an owned
> >   value and drop it.
> >
> > For cases where a box really is necessary, the user can create a box and
> > pass it themselves. But if the user already has a pointer type (e.g. and
> > Arc<T> or &'static T) then they can pass that pointer directly and the
> > pointer is stored as a void pointer without the Box indirection.
> >
> > Alice
