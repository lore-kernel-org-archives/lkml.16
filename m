Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A26F615533F;
	Wed, 14 May 2025 22:18:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747261124; cv=none; b=oZJTVvydkAkXr0MUUMyHetRplsV1P33IhVLTDemk7F0xPRM/nyP1Bid5lrJhmId9Da+XxCpDF9VD32h6Qvot5NjslJrDU0aUl2tE2ObNFXOjw+5x877vePiKEvvL8WzZylU5sjtlYrdtus4IPxanM6+KbYFiokT9IH9gftyxr+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747261124; c=relaxed/simple;
	bh=7QDc+H71PWh5kC8bOnxvIY3RzBhM9CHdpXn8e5Wlxd8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k/VIJeJLBMC2OuMH3ESNgOhMLgKDq+5+KtZE76eD1cXHZijAFGRDXAnucxT2VF/cVrYYc6GFzz01DOCysjthAcAWMWFscUXjrC+TMZKAXRm0Wis+v269h8u0ypaMIhBYFLFmIjKJOyvAO6aIW3lKbFp1L6lR3Qdc6qbyE4ElfYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KmLTnafG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KmLTnafG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFD76C4CEE3;
	Wed, 14 May 2025 22:18:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747261124;
	bh=7QDc+H71PWh5kC8bOnxvIY3RzBhM9CHdpXn8e5Wlxd8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KmLTnafGI7iL9TiKTHjdx6OKzozBr6yZINo8qICJ0YP6U1N4HdKGF9cBmY4nqVCCE
	 NMx+XsrbcgWy0Zc7ZS/AW5VJdpNLXAflPWdKdQEGLnL/jn7gvNORauTnIiiszs0V67
	 rVqhbqyOz32mTFLLCo2EVXrkNoRIZpmt33ZkHOTiKUG2m65K8oRfT0mY4Jr57a4h0O
	 RHyGQJjPAPO8+T2RkeUxOfiiOgaLTrcfoBvYXOJWZzyMSgg6pR3B6FyeNTIoNax1OC
	 hPqjttMuujSiXRlZa+qBZPOjElP5sBfkwOioPOxVdXKRsVzJOwYZihawVqmcncLFMe
	 kF2xicG+45/XQ==
Date: Thu, 15 May 2025 00:18:38 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Matthew Maurer <mmaurer@google.com>
Cc: Benno Lossin <lossin@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
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
Message-ID: <aCUWvtERff_tk_7o@pollux>
References: <20250505-debugfs-rust-v5-0-3e93ce7bb76e@google.com>
 <20250505-debugfs-rust-v5-4-3e93ce7bb76e@google.com>
 <D9VPA1M45WBK.1TB4KOUXD24BD@kernel.org>
 <aCRdNJ2oq-REBotd@pollux>
 <CAGSQo0204_Dz65G33pAN3_iY=ejPXJRdAiB4ioM-nvMkAh0YXQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGSQo0204_Dz65G33pAN3_iY=ejPXJRdAiB4ioM-nvMkAh0YXQ@mail.gmail.com>

On Wed, May 14, 2025 at 02:55:02PM -0700, Matthew Maurer wrote:
> On Wed, May 14, 2025 at 2:07 AM Danilo Krummrich <dakr@kernel.org> wrote:
> >
> > On Wed, May 14, 2025 at 09:20:49AM +0200, Benno Lossin wrote:
> > > On Tue May 6, 2025 at 1:51 AM CEST, Matthew Maurer wrote:
> > > > +impl kernel::Module for RustDebugFs {
> > > > +    fn init(_this: &'static ThisModule) -> Result<Self> {
> > > > +        // Create a debugfs directory in the root of the filesystem called "sample_debugfs".
> > > > +        let debugfs = Dir::new(c_str!("sample_debugfs"));
> > > > +
> > > > +        {
> > > > +            // Create a subdirectory, so "sample_debugfs/subdir" now exists.
> > > > +            // We wrap it in `ManuallyDrop` so that the subdirectory is not automatically discarded
> > > > +            // at the end of the scope - it will be cleaned up when `debugfs` is.
> > > > +            let sub = ManuallyDrop::new(debugfs.subdir(c_str!("subdir")));
> > >
> > > I dislike the direct usage of `ManuallyDrop`. To me the usage of
> > > `ManuallyDrop` signifies that one has to opt out of `Drop` without the
> > > support of the wrapped type. But in this case, `Dir` is sometimes
> > > intended to not be dropped, so I'd rather have a `.keep()` function I
> > > saw mentioned somewhere.
> >
> > I agree, if we really want to "officially" support to forget() (sub-)directories
> > and files in order to rely on the recursive cleanup of the "root" directory, it
> > should be covered explicitly by the API. I.e. (sub-)directories and files should
> > have some kind of keep() and / or forget() method, to make it clear that this is
> > supported and by design and won't lead to any leaks.
> 
> OK, I can do this with `.keep()` just being equivalent to
> `ManuallyDrop::new`. Since we now only have "by default, things are
> dropped", rather than two states, we shouldn't need a `.destroy()`
> method.
> 
> >
> > Consequently, this would mean that we'd need something like your proposed const
> > generic on the Dir type, such that keep() / forget() cannot be called on the
> > "root" directory.
> 
> Just to ensure I understand correctly, your opinion is that on
> balance, additional complexity in the API types are worth making it
> less ergonomic to suppress drop on a root directory, keeping in mind
> that they still *can* suppress drop on that directory. You don't want
> the extra API variants to do anything else special other than change
> the ergonomics of `.keep()` (e.g. don't have subdirectories be default
> pre-`.keep()`'d).

Absolutely, yes! Having the keep() method available for "root" directories is
clearly a footgun, because it suggests that it is a valid thing to call for a
"root" directory, but actually is almost always a bug.

What do we have a powerful type system for if we don't take advantage of it to
prevent bugs? :-)
