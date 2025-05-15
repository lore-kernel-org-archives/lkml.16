Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D6141A275;
	Thu, 15 May 2025 07:40:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747294846; cv=none; b=lCqUY5VAnXM3yMNYww7axm0AFNaux4LL1uyHlxfof7lC8HP8VqMPaQFu8ZYQgV2yDEJRZl+qlREYd/l0JrPQ4GD8dkvdqJcoNvEyKs1axu7Qt/ARNqaSiA6LIU+cCiDm++30acLvfdc9OrDZADSPq/M0QJP2yTCDhlDppn/Yz9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747294846; c=relaxed/simple;
	bh=Kj0uKYjfZ6jFWB56rsStJK6eM7peE/Sx4m/1+5Iq2x8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iQbtVIoYpwZH96lSYH8+2EvqfxZw07Iw1rHkPf3oZ9ssq9HgBr9frMOXo7gJaBDkNw4NpYjxARU232eLfQP+wHRQ0uZGgBI8iyKSAO4FIfBpTTlkW+klbQDokzBtCB1VhtrUGkeSMpP7fPUqjrZ7B1A1B3PdWavcqSlAAM3Nb90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=IcEgib+M; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="IcEgib+M"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD9E0C4CEE7;
	Thu, 15 May 2025 07:40:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1747294844;
	bh=Kj0uKYjfZ6jFWB56rsStJK6eM7peE/Sx4m/1+5Iq2x8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IcEgib+MfOY/RWaUjU3hCCGOx13MYxm3hyli2+73ubkL12cP4pO7wY5K69mHX7bPy
	 9LMPd7Ne4hsB6YmyccEYNH8JG6EaM0H5yk4IUmXANAoz9r7ApE0e5EtzX/Ee4PV3CB
	 pMR/KUvUupFfUu/50uu6EC97BiWyAvMcjv/xUQII=
Date: Thu, 15 May 2025 09:38:55 +0200
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
Message-ID: <2025051543-override-rockiness-3ead@gregkh>
References: <20250515-elf-v1-1-4b53745453c0@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250515-elf-v1-1-4b53745453c0@nvidia.com>

On Thu, May 15, 2025 at 03:03:51PM +0900, Alexandre Courbot wrote:
> Add a simple ELF sections parser for unpacking loaded binaries from
> user-space. This is not intended to become a fully-fledged ELF parser,
> just a helper to parse firmwares packaged in that format.
> 
> This parser is notably helpful for NVIDIA's GSP firmware, which is
> provided as an ELF binary using sections to separate the firmware code
> to its other components like chipset-specific signatures.
> 
> Since the data source is likely to be user-space, checked arithmetic
> operations and strict bound checking are used.
> 
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> ---
> This will soon be needed in order to load the GSP firmware in nova-core,
> so sending this early for separate review.
> ---
>  rust/kernel/elf.rs | 322 +++++++++++++++++++++++++++++++++++++++++++++++++++++

Why is this not just done in userspace and then have userspace feed the
proper elf sections to the kernel through the firmware interface?
Having to parse elf seems crazy for the kernel to be forced to do here
as the kernel should NOT be touching anything in a firmware blob other
than passing it off to the firmware directly.

thanks,

greg k-h
