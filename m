Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D25A219A6B;
	Fri, 30 May 2025 09:01:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748595696; cv=none; b=C+aoq78/Y3tzqBjU6lgYa5EJOtNq62uRX1rZMqj0hs7xMEtJ/QnqqWJ6HaD1bUk+xXHR9VHmgXeYQcwrTC0VqMjWclF1vrGWRAaYfFdc2ZA2jj6reAQwqMrbJf2wmejraV/Q7TLmr0dGO7ymqJ+ZIzkIlOq8jDQ8tvuw7y96i9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748595696; c=relaxed/simple;
	bh=n2ZjVd2alcKnIdJEGexsGHL5f/SaS0tA+GdWnik0AJA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=spM6PmS0UMvboPv9YH9GIC2CsJ5VkNl3m5mQzLQNUs/y2ojF18x3I+2hdk3CH/UnvZYTDx5DLfCOfMyqH9eGMyc7Lrtpg4TKOKpgClcZJz2bnBvJ5lU6rQt9rvtZ/af6flcQvyENqgbJfiiBtSfV0wmpsB614Fx1P1DzXoL3rhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Avn/4MnJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Avn/4MnJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 798A3C4CEE9;
	Fri, 30 May 2025 09:01:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1748595696;
	bh=n2ZjVd2alcKnIdJEGexsGHL5f/SaS0tA+GdWnik0AJA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Avn/4MnJETTZAVpGapLc++uqRuOHnjEy1YQwrhob1PttsF3wn9f2O5mhPJryZ+mEp
	 qAwuh7CMsn8cip9NyyLxi7TaBdjk0GoRJWzW7giwrZ3g9GZPLwDuWE6wura//uQ5pw
	 p8jQl8bcZJLMYM002Hl8GEIRr0mh8FcTMDpFrZg4=
Date: Fri, 30 May 2025 11:01:33 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Timur Tabi <timur@kernel.org>,
	John Hubbard <jhubbard@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH] rust: add basic ELF sections parser
Message-ID: <2025053050-maggot-landfall-d5eb@gregkh>
References: <D9XMAV4ERYK7.39TLQBLYTX3TU@nvidia.com>
 <aCc_PSOPkLWTcTru@pollux>
 <D9XNS413TVXB.3SWWJE4JGEN8B@nvidia.com>
 <CAOZdJXW+PoFgxH+wPEum-kYvRmSRd8c4kaxvbNAq5dfZJiXapA@mail.gmail.com>
 <D9Y0VJKOAQAY.2GJSAZ5II54VV@nvidia.com>
 <DA8G3G918FS4.X8D7PQMT4TGB@nvidia.com>
 <2025052932-pyramid-unvisited-68f7@gregkh>
 <DA935OIFBM1H.3CMSHQ46LLG4P@nvidia.com>
 <2025053047-theology-unsaid-d6ac@gregkh>
 <DA9AU3OBT29Z.3CX827C91I3IH@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DA9AU3OBT29Z.3CX827C91I3IH@nvidia.com>

On Fri, May 30, 2025 at 03:59:03PM +0900, Alexandre Courbot wrote:
> On Fri May 30, 2025 at 3:22 PM JST, Greg KH wrote:
> > On Fri, May 30, 2025 at 09:58:02AM +0900, Alexandre Courbot wrote:
> >> However, Nova also supports a couple of older chip generations that use
> >> the same GSP firmware -  it is for these that the ELF unpacking must
> >> occur in the kernel. IIUC this has to do with the capabilities of the
> >> microcontroller that ultimately does the loading (more capable RISC-V on
> >> Hopper+ vs. older and more limited Falcon).
> >
> > Why specifically does the kernel have to get involved here?  What
> > requires it to do it that userspace can not?
> 
> I don't know of a user-space tool that is readily available and could
> perform such extraction of the ELF content upon kernel request. Is there
> anything like this?

libelf provides you with the needed tools for this.

And you didn't answer my question.
