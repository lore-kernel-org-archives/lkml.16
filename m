Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A115F21D5B3;
	Fri, 30 May 2025 09:00:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748595651; cv=none; b=rYIePvZM7IUsjyhmrsRAa28kBz6d8RrjABuqyZ2VcAVqZjf8dSg3Zzqosw4FA4B9w+aWcj9uKErjokWJBOnFj8RZgdx+HvVZ292NtF0pjW8FX16SAbb4/b7Rq7uFKAoPn62aEKHT26y6Q/bvdr1ga1DnbnP7i8jwb725gJdz8QI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748595651; c=relaxed/simple;
	bh=gNIbx1N9UqqVUej1ctL6a3XA1FWPgsPdOnRM+BgoZi8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CH4ToLeF22esUuQow1jcFXYrUmrhzDP3XYMJYeNzoWXZ9cLdaHfXn9pQcRGn/diNLxbIgnCY921JAW7rQNES7uU8B8JVlsLNLmzKZm8+9osMPOZfGZV5gUwWZRz6uTdgrOA9jzT4vP/N+v/NhkFPFUD9fOwVAQAZQZhVXTDtL98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=ctSgh+iR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="ctSgh+iR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89F68C4CEE9;
	Fri, 30 May 2025 09:00:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1748595651;
	bh=gNIbx1N9UqqVUej1ctL6a3XA1FWPgsPdOnRM+BgoZi8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ctSgh+iRBTE0Y46oJJpPc80V1gnDTrbvbXOzn92/BCBveHrTWnWihWl/dUiZNcfDJ
	 E7woVkfr6xJaBP7/dFRNI4rwarqEw3l/xygMcNazwNX61PMmCknsS+i0TCI2nnZ20P
	 sF2J3I+X89jk3CFk8tdIQmVcAtZsnzOkhV+xS+BE=
Date: Fri, 30 May 2025 11:00:47 +0200
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
Message-ID: <2025053007-playtime-french-c2fa@gregkh>
References: <D9XMAV4ERYK7.39TLQBLYTX3TU@nvidia.com>
 <aCc_PSOPkLWTcTru@pollux>
 <D9XNS413TVXB.3SWWJE4JGEN8B@nvidia.com>
 <CAOZdJXW+PoFgxH+wPEum-kYvRmSRd8c4kaxvbNAq5dfZJiXapA@mail.gmail.com>
 <D9Y0VJKOAQAY.2GJSAZ5II54VV@nvidia.com>
 <DA8G3G918FS4.X8D7PQMT4TGB@nvidia.com>
 <2025052932-pyramid-unvisited-68f7@gregkh>
 <DA935OIFBM1H.3CMSHQ46LLG4P@nvidia.com>
 <2025053058-siding-emperor-d8fd@gregkh>
 <DA9AS88BCFX2.FET64FP3J2WO@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DA9AS88BCFX2.FET64FP3J2WO@nvidia.com>

On Fri, May 30, 2025 at 03:56:37PM +0900, Alexandre Courbot wrote:
> On Fri May 30, 2025 at 3:21 PM JST, Greg KH wrote:
> > On Fri, May 30, 2025 at 09:58:02AM +0900, Alexandre Courbot wrote:
> >> > But for now, doing it in generic code, that all systems end up loading,
> >> > yet very very very few would ever actually use makes no sense.  And
> >> > adding it to a driver also doesn't make sense as you can define your
> >> > user/kernel api now, it's not set in stone at all given that there is no
> >> > existing code merged.
> >> 
> >> Eschewing this from the driver would require duplicating the GSP
> >> firmware (a healthy 26MB compressed binary) in linux-firmware to provide
> >> both ELF and non-ELF versions of the same code, and also store the other
> >> ELF sections as their own files. I expect this to be a hard sell for
> >> linux-firmware.
> >
> > Why would the linux-firmware people care about the size of firmware
> > blobs being given to them?  That's the whole reason for their existance,
> > to put them in one place instead of having to download them from random
> > locations on the internet, or to have them in the kernel tree itself.
> >
> > It's already 300MB or so for the whole project, what's 26MB more?
> 
> Roughtly 1/10th of the current total size as avoidable overhead. ^_^;

It's just storage on a disk, that's not an issue.  Storage sizes just
increased by more than that in the days we've taken on this email
thread :)
