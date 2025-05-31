Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 094B04086A;
	Sat, 31 May 2025 05:45:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748670317; cv=none; b=nMd3sOhRpku/GUEHgfxuR16qxUqZpVLIaG2rW3K5UsPuOSmMjAUcPOE0Rg00Xmt3v++7K5p2fijC3a53feWc0XRMIZuEGivdeFFEMjLRWn6RXDOd6o8VYcX/K6rPCFbqwCPaTkZKgN/0Urx0V3eWyaI4F89IRHS59zItinZrras=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748670317; c=relaxed/simple;
	bh=9DPwdQ9fOhkzloYxT6a3qcqYtN6xqO4YaxWc/Ow3mZE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LlndSaFohHKCeEx7fR8OfF8GAlnO5DcyQ4wt0mBlZnyhCesdMip7q5k/Bfu73xaiXSVY9rwBbqBJSgdUoGrOCspr1w7FBFrzHsK9w0lECsqFjk7TGzMpeWo+o2jRao0R9BHKoAFN2+O3t0RcAQ5OvVd6OqISoUB/cN10OQZUV18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=VlJcit32; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="VlJcit32"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7C74C4CEE3;
	Sat, 31 May 2025 05:45:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1748670316;
	bh=9DPwdQ9fOhkzloYxT6a3qcqYtN6xqO4YaxWc/Ow3mZE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VlJcit32in30wSJfXmZiTdpNu9/h9pAwZ/nuRUQHSxzPuff6/pgIj8OW5cj0xuLVB
	 tcSm6c6KA12rFXC7+VWLlrN5sDq92LoCF0M01MYCluDPzpPLdWVEAg7TwsOIoLuLp3
	 ZW8DGIO+389mzWL8EgLYudDBOqFfCojeksDN8FRA=
Date: Sat, 31 May 2025 07:45:13 +0200
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
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH] rust: add basic ELF sections parser
Message-ID: <2025053148-gore-badass-1d1d@gregkh>
References: <D9Y0VJKOAQAY.2GJSAZ5II54VV@nvidia.com>
 <DA8G3G918FS4.X8D7PQMT4TGB@nvidia.com>
 <2025052932-pyramid-unvisited-68f7@gregkh>
 <DA935OIFBM1H.3CMSHQ46LLG4P@nvidia.com>
 <2025053047-theology-unsaid-d6ac@gregkh>
 <DA9AU3OBT29Z.3CX827C91I3IH@nvidia.com>
 <2025053050-maggot-landfall-d5eb@gregkh>
 <DA9KIGDH4IF6.2T383ZVLTJN0G@nvidia.com>
 <2025053039-reselect-thinness-e0a2@gregkh>
 <CAOZdJXVvmDro0Mv36grqQ6LB_1O5GzwPx+Dde+wsfu9Cu_me7A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAOZdJXVvmDro0Mv36grqQ6LB_1O5GzwPx+Dde+wsfu9Cu_me7A@mail.gmail.com>

On Fri, May 30, 2025 at 01:10:50PM -0500, Timur Tabi wrote:
> On Fri, May 30, 2025 at 10:42 AM Greg KH <gregkh@linuxfoundation.org> wrote:
> >
> > On Fri, May 30, 2025 at 11:34:02PM +0900, Alexandre Courbot wrote:
> > > So to try to answer your question, I am not disagreeing that userspace
> > > is capable of doing what we currently do in the kernel. My follow-up
> > > questions to that are: how do we command userspace to do that work for
> > > us when we request the firmware, how do we provide the result to the
> > > kernel, and is this something that distros can adopt easily? I'm happy
> > > to consider doing things this way, but would need a few pointers to look
> > > into.
> >
> > Again, look at how your firmware for your devices in your laptop are
> > loaded today.

Note, I am talking about non-gpu firmare images here (wifi, usb
controllers, etc.) that are using the firmware download subsystem for
ages as examples of what to look at as to how to trigger a firmware
image to be loaded by userspace into the device.

> Today, Nouveau loads and parses these binary images (that are already
> in linux-firmware) in the driver.  As I said before, Nova/Nouveau are
> using ELF simply as a packaging format, so that these small binary
> blobs are kept together and processed as one.  It makes no sense for
> Nouveau to consume them as-is, but Nova has to have user-space break
> them up first.
> 
> We could easily have said that the format is proprietary and not used
> the word "elf" in the parser.

And even if you did that, I would say "do it in userspace as firmware
images should be pass-through only".

> IMHO, Nova should really do what Nouveau does, and just have the image
> parser in the driver itself, without any generic Rust code to do it.
> After all, what Nova needs to do with these images is driver-specific.

Again, no, do not do any firmware image parsing in the kernel please
unless you can prove exactly why it MUST be done there.

thanks,

greg k-h
