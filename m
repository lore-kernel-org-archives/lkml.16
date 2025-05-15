Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3CBA819;
	Thu, 15 May 2025 11:43:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747309434; cv=none; b=gc2TU/oZZfZ7PCplj+VceDeV9Hlm2W0mDZ8KtSAJBGCabQYpkl23E90cnZ7vyMQ0ewWmh4rWERZYHGtTC8/jGWa9CAW7ic0SlKvKScim44JujGL4I4VMDWzOCvV0DuFcjcioc65wWv4GVWXva60WxJGFjNZVJmRkQiut/eEDeKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747309434; c=relaxed/simple;
	bh=cqZmizesdV382UCWkAJvVk+InOvjAczf6ib7rBZjAsY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W1bo5Gw1Zl4+pYverix2sWsn7G0VQI0ZYrlgYL1w/mW2nQx9v4xW+Gahkb50ZViPht+PdYxyuQpnXTEyZdH8wBZxkeKaQGeOO5hqNmEWqzfovo2wITLTBmmMURHbJWAj9esJdG+zorYdnRLSzOtED4Qr/TycAM3Tq6mY516Nrk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=OU2NTZIG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="OU2NTZIG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BA6FC4CEE7;
	Thu, 15 May 2025 11:43:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1747309434;
	bh=cqZmizesdV382UCWkAJvVk+InOvjAczf6ib7rBZjAsY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OU2NTZIGHmokuMikpj91WMhvhyCz0MgzU98cEhvJWzdS3i87rxoxK1kHrGWv97hRH
	 3Xwj/nOWKMfnUpNvIkk9N660xcTSSR2DJx7FN+obqBpZNIxoQBwee5eJJ/ojcOy9Tt
	 auz8T46jDdETzBwpst9dXqrt+XgvLAr7swC+PwD4=
Date: Thu, 15 May 2025 13:42:05 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH] rust: add basic ELF sections parser
Message-ID: <2025051532-gentleman-reset-58f2@gregkh>
References: <20250515-elf-v1-1-4b53745453c0@nvidia.com>
 <2025051543-override-rockiness-3ead@gregkh>
 <D9WLFTPRB9FJ.OL6I760HKALZ@nvidia.com>
 <D9WP3YU31199.Q8IEDBJZ87LU@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <D9WP3YU31199.Q8IEDBJZ87LU@nvidia.com>

On Thu, May 15, 2025 at 08:25:33PM +0900, Alexandre Courbot wrote:
> On Thu May 15, 2025 at 5:32 PM JST, Alexandre Courbot wrote:
> > Hi Greg,
> >
> > On Thu May 15, 2025 at 4:38 PM JST, Greg KH wrote:
> >> On Thu, May 15, 2025 at 03:03:51PM +0900, Alexandre Courbot wrote:
> >>> Add a simple ELF sections parser for unpacking loaded binaries from
> >>> user-space. This is not intended to become a fully-fledged ELF parser,
> >>> just a helper to parse firmwares packaged in that format.
> >>> 
> >>> This parser is notably helpful for NVIDIA's GSP firmware, which is
> >>> provided as an ELF binary using sections to separate the firmware code
> >>> to its other components like chipset-specific signatures.
> >>> 
> >>> Since the data source is likely to be user-space, checked arithmetic
> >>> operations and strict bound checking are used.
> >>> 
> >>> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> >>> ---
> >>> This will soon be needed in order to load the GSP firmware in nova-core,
> >>> so sending this early for separate review.
> >>> ---
> >>>  rust/kernel/elf.rs | 322 +++++++++++++++++++++++++++++++++++++++++++++++++++++
> >>
> >> Why is this not just done in userspace and then have userspace feed the
> >> proper elf sections to the kernel through the firmware interface?
> >> Having to parse elf seems crazy for the kernel to be forced to do here
> >> as the kernel should NOT be touching anything in a firmware blob other
> >> than passing it off to the firmware directly.
> >
> > FWIW, the GSP firmware in question is already in linux-firmware and
> > loaded by e.g. Nouveau.
> >
> > I am not sure how userspace could feed the proper ELF sections otherwise
> > than by splitting the ELF binary into as many files as there are
> > sections. Is that what you imply, or is there another means that would
> > preserve the current firmware format?
> >
> > Note also that in this particular case, the kernel cannot just pass the
> > firmware without modifying it anyway since the signatures relevant to
> > the chipset need to be patched into the right place before it is loaded.
> 
> Quick nit, as that last statement was not entirely correct: while we do
> patch some loaded firmware with signatures, this is not the case for the
> GSP (the one in ELF format). Not that it changes the point, but for the
> sake of accuracy. :)
> 
> The point being that even without using ELF as a container format, we do
> need to parse header structures in loaded firmware files anyway, so the
> kernel cannot simply act as a dumb pipe for firmware. And since we need
> to add structure, let's at least use a format that is simple, well
> accepted and which layout is already in the kernel.
> 
> Or if ELF is the problem, I don't mind introducing a WAD loader. ;)

The "problem" I'm not understanding is why does the kernel have to do
any of this parsing at all?  What does it do with these segments that
userspace can't do instead?  Why does patching have to be done within
the kernel at all?  What prevents all of this from being done elsewhere?

And ELF parsing is "tricky" in places, and you aren't using the existing
elf parser, as proof of needing a new parser in rust :)

thanks,

greg k-h
