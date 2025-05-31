Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A94D123AE87;
	Sat, 31 May 2025 12:25:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748694319; cv=none; b=LfZ65Ax7KLsUKX96HaPicZV9M8pYyijqO+aQdgTqs0LiRG8pLMquxi0cMetEfbuiAKARlCvkY3dr1PRv2bVH0mqknj8C047+3f60JE7EOHsd2jIX66ShnLHUpodd7GMGflPT2xjj92skxUTCNVczlpI/vxC2nEjnlLZfLXssQok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748694319; c=relaxed/simple;
	bh=bcljbFcD6OznCcHMG+UE0Av+yr3cs6EZ0rxpsiywH8s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X840llC3UUpmns4TFWgL8rvwOVsqiQjbjNHfbhJekQ3K6R8WDUmi2K2b0qIubRVQbLY4WcegkJ0mKohe/Oes5TCpZvHOQe4QQyco7zpuLxMsp3r/sMkVmMqZng6hWEWTepQiO/RwCu1SxaxnkoB8LwHWUmF7kgOUZ8Ycb0mw0H0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=fX5g9FKq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="fX5g9FKq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A96BC4CEE3;
	Sat, 31 May 2025 12:25:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1748694315;
	bh=bcljbFcD6OznCcHMG+UE0Av+yr3cs6EZ0rxpsiywH8s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fX5g9FKqEh0uwgHwGYgHFdyIX2T6Bl3aqr9bnCzZ994c3M/EyoTAYZQETdJXjWTJq
	 4L0FmcyBp9xfzKgLhno35+nl4RWKZACUUd2pCskgOhLHawepqEYbV8cGtir8P1Po9O
	 PLzr6rW9jxV8XiO1JxE0Njzh8of8HeULXocSoan4=
Date: Sat, 31 May 2025 14:25:11 +0200
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
Message-ID: <2025053109-flatterer-error-7432@gregkh>
References: <2025052932-pyramid-unvisited-68f7@gregkh>
 <DA935OIFBM1H.3CMSHQ46LLG4P@nvidia.com>
 <2025053047-theology-unsaid-d6ac@gregkh>
 <DA9AU3OBT29Z.3CX827C91I3IH@nvidia.com>
 <2025053050-maggot-landfall-d5eb@gregkh>
 <DA9KIGDH4IF6.2T383ZVLTJN0G@nvidia.com>
 <2025053039-reselect-thinness-e0a2@gregkh>
 <CAOZdJXVvmDro0Mv36grqQ6LB_1O5GzwPx+Dde+wsfu9Cu_me7A@mail.gmail.com>
 <2025053148-gore-badass-1d1d@gregkh>
 <CAOZdJXVSByiwGWusdajdTVma2aC3ibZtSz9XBpRy4MJrKuxfvw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAOZdJXVSByiwGWusdajdTVma2aC3ibZtSz9XBpRy4MJrKuxfvw@mail.gmail.com>

On Sat, May 31, 2025 at 05:17:48AM -0500, Timur Tabi wrote:
> On Sat, May 31, 2025 at 12:45 AM Greg KH <gregkh@linuxfoundation.org> wrote:
> 
> > > IMHO, Nova should really do what Nouveau does, and just have the image
> > > parser in the driver itself, without any generic Rust code to do it.
> > > After all, what Nova needs to do with these images is driver-specific.
> >
> > Again, no, do not do any firmware image parsing in the kernel please
> > unless you can prove exactly why it MUST be done there.
> 
> Nouveau is already doing all this, just in C.  This entire argument is
> over a 12-line function:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c#n1824
> 
> Nouveau needs to do this in kernel space because, once it finds the
> appropriate section in the ELF image, it reads a hardware register to
> determine how to patch it:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/gpu/drm/nouveau/nvkm/falcon/gm200.c#n342
> 
> Since this hardware register cannot be read in user-space, this needs
> to be done in the kernel.

What exactly do you mean by this?  That is what I have been asking, what
is the specific reason why this can't be done in userspace?  What
hardware "thing" can't be read by userspace, and why not?  Userspace has
access to PCI devices directly, surely there is nothing "secret" here.

> Please note that there other drivers in Linux that iterate over ELF
> sections in order to parse their firmware images:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/gpu/drm/imagination/pvr_fw_util.c#n29
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/media/platform/st/sti/c8sectpfe/c8sectpfe-core.c#n925
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/remoteproc/qcom_q6v5_mss.c#n1374

As pointed out before, those have "slipped in" and should not be used to
justify continuing to do the same thing.

Again, just do it in userspace, if it's "just" 12 lines in the kernel,
then put those 12 lines in userspace and you are fine.

And the proposed patch was NOT 12 lines of rust, so please don't
conflate the two things here.  That's not what we are talking about.

greg k-h
