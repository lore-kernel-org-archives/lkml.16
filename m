Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A64314B1E4A;
	Fri, 16 May 2025 13:17:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747401422; cv=none; b=Ydbay5Z2Z84eCAqFwV90w9MhQzLQtwC+NSEMjLY7iVKN9SWkr8L0J4Z8lQo6DVogtkT6Ncgr60X3h+lNoFDTTgK1D+OJUAaJAMmGCUlw3W3G9MPNEVnyWQZeKYPaAaU+/8typA0ceKrImFFwxKFz44rqDNLb+9l7xzJtKTLKYZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747401422; c=relaxed/simple;
	bh=R1rj1kecMietGTIXFY8TxpvZyKXJeN7GH3gGjW8Japc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sSB3obiqFLVL/WKr/GWjo2nI6hT0scG1MbHYvbig1rDTv98ygOEuNxGvIvkYmnWSPjnlX+N7jBKsZJTI1z/GjLrTZBiGSI296ai42mxv+2Uah+le/Pcm8uZihbDvI3Aa0XTSgFCkMGcugQTrql4l0PyME6kuRnmUZw+JWa+2DVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=1kY1eeJw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="1kY1eeJw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95A68C4CEE4;
	Fri, 16 May 2025 13:17:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1747401422;
	bh=R1rj1kecMietGTIXFY8TxpvZyKXJeN7GH3gGjW8Japc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=1kY1eeJwRXp3nr6muCDAiu6Gg+ETTXIHv5AN8XhJzdt0zK4uO1lZgbb3cwaf1janD
	 tk0WxoA5mlSWVZgI4Er4sRQ6XnqhiX4o36V6790o9Pv1bd8XfNicNBURPAiKc1Vfx6
	 xJFi3oeMXmo2xGx2ELwaRq+OlST7AJFEq4ton/BE=
Date: Fri, 16 May 2025 15:15:14 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: John Hubbard <jhubbard@nvidia.com>
Cc: Timur Tabi <timur@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH] rust: add basic ELF sections parser
Message-ID: <2025051647-urology-think-b8e0@gregkh>
References: <20250515-elf-v1-1-4b53745453c0@nvidia.com>
 <2025051543-override-rockiness-3ead@gregkh>
 <D9WLFTPRB9FJ.OL6I760HKALZ@nvidia.com>
 <D9WP3YU31199.Q8IEDBJZ87LU@nvidia.com>
 <2025051532-gentleman-reset-58f2@gregkh>
 <CAOZdJXWKLu0y+kwC+Bm8nBCLizQVpsDdDUoS--hVgz2vnuZJQg@mail.gmail.com>
 <8b14b078-b899-42e8-8522-599daa65bc63@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8b14b078-b899-42e8-8522-599daa65bc63@nvidia.com>

On Thu, May 15, 2025 at 12:17:00PM -0700, John Hubbard wrote:
> On 5/15/25 7:30 AM, Timur Tabi wrote:
> > On Thu, May 15, 2025 at 6:43 AM Greg KH <gregkh@linuxfoundation.org> wrote:
> >>> Or if ELF is the problem, I don't mind introducing a WAD loader. ;)
> >>
> >> The "problem" I'm not understanding is why does the kernel have to do
> >> any of this parsing at all?
> > 
> > Nova will need to parse ELF headers in order to properly load and boot
> > Nvidia firmware images.  Nouveau does this already:
> > 
> > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c#n2931
> 
> Hi Greg!
> 
> Nouveau influenced us heavily here, because having firmware that we
> can post once, and use everywhere (Nouveau and Nova), is very attractive.
> 
> Alex and Timur discuss other details that explain why the standard 
> user-space approach is less simple and clean than it might appear at
> first glance, but I wanted to emphasize that the firmware re-use point
> a little bit, too.
> 
> Oh, and also: the ELF images are going to remain extremely simple,
> because there is nothing now (nor can I see anything in the future)
> that would drive anyone to do complicated things. For example, if
> there is some exotic new thing in the future, it could be put into
> its own firmware image if necessary--because we understand that
> this parser here is intended to be a simple subset of ELF, and
> left alone really.

Ok, then why not just bury this down in the driver that is going to
actually use it?  This patch series was adding it to ALL kernels, if you
need/want it or not, and as such would be seen as a generic way to
handle all ELF images.  But as that's not the case here, just copy what
you did in the existing C driver and make it private to your code, so
that no one else has to worry about accidentally thinking it would also
work for their code :)

And I still think that having the kernel do this is a mistake, firmware
should always just be a "pass through" otherwise you open yourself up to
all sorts of complexity and vulnerabilities in the kernel, both of which
is generally not a good idea.

thanks,

greg k-h
