Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D55B7433B1;
	Sun,  1 Jun 2025 07:48:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748764096; cv=none; b=f/ogs/dN4JkAWanMz26xdqSl3+FESxLzBjuRX7iVxMghgT+ffpqnGimgfuoHNlfKre68U4YLZ/FZzapBW4HpDkYiwKoPvnvSZ5PiqwY+Ga8zvAFTNKTghg64rmdNIE2ypHiiGWPr4J1fF3vy0e+jcbhtpn1aEH5EeLhKloPpuCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748764096; c=relaxed/simple;
	bh=hLtY3w/3CdxKe2lEJBLaVhM5I4ruhl+SuVENevHlszk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OPXZh41a+J46xFmdDmysfSZa68XIN95gFw56qKhz0u8gHdFuz5oGLCsD2NEhFCvLCy7vkup0axHlSayRoIl3dB7VPGgPJztLxiTEcv5XmBP7LXnLlsBHZO6maEh/rcSnvYe/yRdvdTkV3xTCy3QqX68L/elrs2BrL3bpRqxvQ10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=wSAhf8bQ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="wSAhf8bQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1D55C4CEE7;
	Sun,  1 Jun 2025 07:48:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1748764094;
	bh=hLtY3w/3CdxKe2lEJBLaVhM5I4ruhl+SuVENevHlszk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=wSAhf8bQ0/oLWmWTGdluR26765EjQ8cKNqM23lgmgxFcWbK9MYAXy7iNmUaRyBnaK
	 WANUTAPH1Wbzudy1IAL0oTf62W7toAQXLegVYWlH0X4TB4qn6+zzjg8zq0GO7QePfC
	 eFVeg/d1G02WDETZMzo7er83X52ygCM2TPGDtc2M=
Date: Sun, 1 Jun 2025 09:48:11 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Timur Tabi <timur@kernel.org>
Cc: Alexandre Courbot <acourbot@nvidia.com>,
	Danilo Krummrich <dakr@kernel.org>,
	John Hubbard <jhubbard@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
	Timur Tabi <ttabi@nvidia.com>
Subject: Re: [PATCH] rust: add basic ELF sections parser
Message-ID: <2025060126-various-greasily-61df@gregkh>
References: <2025053047-theology-unsaid-d6ac@gregkh>
 <DA9AU3OBT29Z.3CX827C91I3IH@nvidia.com>
 <2025053050-maggot-landfall-d5eb@gregkh>
 <DA9KIGDH4IF6.2T383ZVLTJN0G@nvidia.com>
 <2025053039-reselect-thinness-e0a2@gregkh>
 <CAOZdJXVvmDro0Mv36grqQ6LB_1O5GzwPx+Dde+wsfu9Cu_me7A@mail.gmail.com>
 <2025053148-gore-badass-1d1d@gregkh>
 <CAOZdJXVSByiwGWusdajdTVma2aC3ibZtSz9XBpRy4MJrKuxfvw@mail.gmail.com>
 <2025053109-flatterer-error-7432@gregkh>
 <CAOZdJXU1ftLfem40v82NJp3S0WqZoMbqYrqQMw4vZEUbpa6Uag@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAOZdJXU1ftLfem40v82NJp3S0WqZoMbqYrqQMw4vZEUbpa6Uag@mail.gmail.com>

On Sat, May 31, 2025 at 09:38:24AM -0500, Timur Tabi wrote:
> On Sat, May 31, 2025 at 7:25 AM Greg KH <gregkh@linuxfoundation.org> wrote:
> >
> > What exactly do you mean by this?  That is what I have been asking, what
> > is the specific reason why this can't be done in userspace?  What
> > hardware "thing" can't be read by userspace, and why not?  Userspace has
> > access to PCI devices directly, surely there is nothing "secret" here.
> 
> Why in the world would you want user space to read hardware registers,
> when the driver is already doing it???????
> 
> And please note that the driver has to read and parse a lot of other
> register in order to know which register contains the fuse settings,
> and even whether that register exists, and at what address.  The fuse
> register is hardware-specific.  It doesn't exist on Turing, it does
> exist on Ampere and Ada (but just GA10x, not GA100), and it's not used
> on Hopper and Blackwell.  You want to duplicate all this code in
> user-space (assuming that registers really are accessible in user
> space), just avoid a 12-line function that already exists and works in
> Nouveau?????????

Because you are not proposing a 12 line function here, you all were
attempting to add an elf parser to the core kernel that everyone would
always load into their memory space.

> Please make it make sense, Greg.

Please read my thread where I asked for detailed specifics as to exactly
what is required here for you all to determine what is needed to load
the firmware.

have a good weekend,

greg k-h
