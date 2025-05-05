Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EBBF1A3146;
	Mon,  5 May 2025 16:48:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746463707; cv=none; b=ELQTMSIoRD20Pky2tR3CzPdLH/LL2BU8cnhtXj4T/N0TyATTgqlom+iKfx8bByoQyRGdFqEUh4BndUMCzCbdM2RK5L3Wy9vgkodtjKmzCZTjbzplMLXudbW3d1xtBUMFTGf8MfW2ylk0OzSJRMT5hlwHyo0R8MA9M/6YyKO1IJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746463707; c=relaxed/simple;
	bh=5W2g15VIrTki04UaYjIsAJR6NJYW3rXBhykFdLdKGUY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=epE/K3D8V9h7Q/LczBtegMX3dM5+HWiW0//2hWzBEwLtHS9/y8BWrXTWLECmCnQgkBNrgMDbq+RkHpLOCnCpBzsNCiK7kZveS+FFLbVNH5l++1kviQcrvjoph5CpXq8CYU1dY0RxaKHNDEEwh815b7OgC7T8EtPqlUI0gghYmKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iGdng2cx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iGdng2cx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A578EC4CEE4;
	Mon,  5 May 2025 16:48:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746463706;
	bh=5W2g15VIrTki04UaYjIsAJR6NJYW3rXBhykFdLdKGUY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iGdng2cxaDohr6k3f3r8VrtQ4EIjOu4ivCrdZscvBfowCAhJPWLm2ORl3gPZsDVFp
	 Gdp8roCdRjLiPMvegnpbJDw001JTfu/jXNLaW2W347t60kbDKDiTmx4d9F4GJ0lVAt
	 XLl1uNWYDfIi89dTWFmXDGeyWNpjOC59sHtu9OIrTFfMDtkf1riGEZNHmKBOvc+Yll
	 FHOln8mSBjAXjOWcOaYjQ54OYcGxz0gIG10+i/Uz++OOXC864qayNFcNfvQ6feIY+R
	 LOoEP/gSLzZjhdklXI0lKQxNe45o+y2SV0oG29+Xyt1oOEj4tLf1qTJc2eZESktuUp
	 5r5IlkwkSxYlg==
Date: Mon, 5 May 2025 18:48:18 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Matthew Maurer <mmaurer@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
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
Subject: Re: [PATCH v4 1/4] rust: debugfs: Bind DebugFS directory creation
Message-ID: <aBjr0tdFIPly5ZY2@polis>
References: <20250502-debugfs-rust-v4-0-788a9c6c2e77@google.com>
 <20250502-debugfs-rust-v4-1-788a9c6c2e77@google.com>
 <aBYNyqTRlpGAJVuB@polis>
 <CAGSQo03Fz-U6pTYn1kL5GRsTOSpKnSnsG52oCrJii6MPM9x73Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGSQo03Fz-U6pTYn1kL5GRsTOSpKnSnsG52oCrJii6MPM9x73Q@mail.gmail.com>

On Mon, May 05, 2025 at 09:21:51AM -0700, Matthew Maurer wrote:
> On Sat, May 3, 2025 at 5:36 AM Danilo Krummrich <dakr@kernel.org> wrote:
> > On Fri, May 02, 2025 at 07:49:30PM +0000, Matthew Maurer wrote:
> > > +/// Owning handle to a DebugFS directory.
> > > +///
> > > +/// This directory will be cleaned up when it goes out of scope.
> > > +///
> > > +/// # Invariants
> > > +///
> > > +/// The wrapped pointer will always be `NULL`, an error, or an owned DebugFS `dentry`.
> > > +#[repr(transparent)]
> > > +pub struct Dir<'a, const KEEP: bool = false> {
> >
> > Why did you move to a const generic, rather than a new type? What's the
> > advantage? AFAICS, it just makes it less obvious to see from the type itself how
> > it will behave. Reading Dir<true> doesn't make it obvious what it does.
> >
> > While I prefer a new type over the const generic, I'm fine with it. But I think
> > we should use something more descriptive than a bool. Please see
> > device::DeviceContext for reference.
> 
> I'm fine with a new type or a using a more descriptive const generic -
> I did the const-generic to avoid the need to make one variant the
> derefee, which can sometimes complicate structure. I'll default to a
> more descriptive const-generic.

Sounds good to me.

> > > +    pub fn subdir<'b>(&'b self, name: &CStr) -> Dir<'b, true> {
> > > +        Dir::create(name, Some(self))
> > > +    }
> >
> > The default should be that the directory is removed when the Dir instance is
> > dropped.
> >
> > The common case (which people expect) is that an object is cleaned up on drop().
> 
> In general for Rust, I agree with you. For this particular case, I
> have a strong disagreement - take a look at calls to
> `debugfs_create_dir` in existing C code - new code chooses to discard
> subdirectory handles when done and rely on the recursive remove of the
> root directory to clean up subdirectories. If you and Greg K-H both
> agree that I should make them drop by default, I'll switch it, but I
> think this is me following the subsystem maintainer's intentions here.

I don't see how picking a (Rust) consitent default is contrary to relying on
recursive remove of directories.

I don't want this API to have "inverse drop semantics"; it's gonna confuse
people and, AFAIK, it'd be the only API doing that.

Your original code with Dir::keep() was perfectly fine and it was still
supporting the "recursive remove case" properly.

So, again this *not* an either-or case, we can have both.
