Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0537296147;
	Tue, 24 Jun 2025 14:26:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750775178; cv=none; b=o7/9xr2wtdr59eymBOFsSMr9+wCbOxU9aZAb/mORyt8I3U4W95VyqzvuVnJLkTd273zI5ozzIn0k7t6gGaw2jHgX9kgQhgaUYeHUFdr5y9SXxqeITzu8f3mELOOcNCNlM/58yBEv+mDFRBPIdVuAKELHCqhfJmOTfd13XEivjSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750775178; c=relaxed/simple;
	bh=eynJjWUT/k3SvnJtOyrQWtBtxAlzc2GDePgrT2cjc4g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kLzvY5O9H+Se8McPTIjrQ8pSMBuqG/6QutQQZCkma9vr6ElmGDswGIPX6QeCOLBuzPAUVRkvy+Da0XOXN97VhHKoxwltG4sx9E8+G2ixRhj4k2LV7oqxrTc5kBTrzyVyt99zQ1QARFf7ScHAVGrmlX3cY5zew7s+Jlma3F2I12M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=n/uHS7PI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="n/uHS7PI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2196C4CEE3;
	Tue, 24 Jun 2025 14:26:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1750775176;
	bh=eynJjWUT/k3SvnJtOyrQWtBtxAlzc2GDePgrT2cjc4g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=n/uHS7PI/gwgLaU0FeDz/SLTX3KDeNsYSCmc7wvdJix8rg8Fx2fwcqWwxbuOdUtJr
	 T5boIQ9sgg1b+Ay/uVqbRWmh4aEEvBLg7EqCcWayF1qKAuihOpcPrIsNrsx2U4IZZo
	 b0yzpcYeQqtxsWxjRQijrxSfVErB3vr+2f7kGrUY=
Date: Tue, 24 Jun 2025 15:26:11 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Timur Tabi <timur@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
	John Hubbard <jhubbard@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH] rust: add basic ELF sections parser
Message-ID: <2025062405-stability-privacy-f965@gregkh>
References: <2025053047-theology-unsaid-d6ac@gregkh>
 <DA9AU3OBT29Z.3CX827C91I3IH@nvidia.com>
 <2025053050-maggot-landfall-d5eb@gregkh>
 <DA9KIGDH4IF6.2T383ZVLTJN0G@nvidia.com>
 <2025053039-reselect-thinness-e0a2@gregkh>
 <CAOZdJXVvmDro0Mv36grqQ6LB_1O5GzwPx+Dde+wsfu9Cu_me7A@mail.gmail.com>
 <2025053148-gore-badass-1d1d@gregkh>
 <DAACKTM8B9A1.3SI9LRGNMSBH3@nvidia.com>
 <2025053117-snowy-tradition-eb9e@gregkh>
 <DAL37D3FG3YA.TSCJ1LMJO1X8@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <DAL37D3FG3YA.TSCJ1LMJO1X8@nvidia.com>

On Fri, Jun 13, 2025 at 12:32:13PM +0900, Alexandre Courbot wrote:
> Hi Greg,
> 
> On Sat May 31, 2025 at 10:30 PM JST, Greg KH wrote:
> > On Sat, May 31, 2025 at 09:33:38PM +0900, Alexandre Courbot wrote:
> >> Hi Greg,
> >> 
> >> On Sat May 31, 2025 at 2:45 PM JST, Greg KH wrote:
> >> > On Fri, May 30, 2025 at 01:10:50PM -0500, Timur Tabi wrote:
> >> >> On Fri, May 30, 2025 at 10:42 AM Greg KH <gregkh@linuxfoundation.org> wrote:
> >> >> >
> >> >> > On Fri, May 30, 2025 at 11:34:02PM +0900, Alexandre Courbot wrote:
> >> >> > > So to try to answer your question, I am not disagreeing that userspace
> >> >> > > is capable of doing what we currently do in the kernel. My follow-up
> >> >> > > questions to that are: how do we command userspace to do that work for
> >> >> > > us when we request the firmware, how do we provide the result to the
> >> >> > > kernel, and is this something that distros can adopt easily? I'm happy
> >> >> > > to consider doing things this way, but would need a few pointers to look
> >> >> > > into.
> >> >> >
> >> >> > Again, look at how your firmware for your devices in your laptop are
> >> >> > loaded today.
> >> >
> >> > Note, I am talking about non-gpu firmare images here (wifi, usb
> >> > controllers, etc.) that are using the firmware download subsystem for
> >> > ages as examples of what to look at as to how to trigger a firmware
> >> > image to be loaded by userspace into the device.
> >> 
> >> I would really appreciate it if you could point me precisely to one
> >> example (a link, a function, a file) of what you are describing because
> >> I'm starting to wonder whether we are talking about the same thing.
> >> 
> >> Previously I mentioned udev and CONFIG_FW_LOADER_USER_HELPER, but you
> >> haven't confirmed whether that was what you had in mind or not. Assuming
> >> that udev is involved, I tried to snoop events while a
> >> `request_firwmare` call is performed using `udevadm monitor`, but that
> >> revealed no event related to firmware loading. Then looking deeper into
> >> the kernel documentation confirmed that the kernel does indeed a direct
> >> filesystem lookup in request_firmware [1]. IOW, the kernel looks for the
> >> requested file, and if it cannot find it it's game over. This matches my
> >> observations with udevadm, as I tried requesting a non-existing file and
> >> no uevent was generated. I don't see what user-space can do here.
> >> 
> >> I also tried to look up this "firmware download subsystem" you
> >> mentioned, but couldn't find anything under that name - I suspect you
> >> are talking about the sysfs loading mechanism, but AFAIU this depends on 
> >> CONFIG_FW_LOADER_USER_HELPER which doesn't seem to be widely enabled
> >> (not on my distro at least).
> >
> > Yes, that is what I am referring to, as you all seem to want to do
> > "complex things without a specific filename choosen".  Look at
> > Documentation/driver-api/firmware/fallback-mechanisms.rst for the
> > details there.
> >
> > Or, better yet, just have your driver name all of the individual files
> > that must be loaded and then no userspace things are needed.  That "big"
> > firmware file will have already been split up into the different parts
> > when you write it out to the filesystem, so no need to parse anything.
> >
> > If this isn't going to work for some reason, I think we need a better
> > "this is EXACTLY what we need to send to the hardware for the firmware
> > image(s) it requires" as I'm totally confused based on the different
> > people talking on this thread about totally different hypotheticals
> > (i.e. 12 line elf parsers in C vs. a giant elf parser in rust, random
> > hypothetical hardware values that userspace "can not know", pointing at
> > obsolete crazy interfaces like remoteproc that just happen to do crazy
> > things, etc.)
> >
> > So step back, come up with a solid design document, and let's start over
> > please.
> >
> > thanks,
> >
> > greg k-h
> 
> Sorry for the time it took to come back to you on this.
> 
> After further investigation, it appears that most of the points we
> discussed were indeed orthogonal to whether we rely on ELF or the
> filesystem to provide the different parts of the firmware, so I'd like
> to apologize for the unneeded confusion.
> 
> We had an internal discussion with our firmware team about future
> firmware releases. As it turns out, the firmware itself is undergoing an
> overhaul, so we would like to take that opportunity to re-think the
> release format and try to address this issue.
> 
> It will likely take a few months to reach a definitive design, and in
> the meantime we would like to keep making progress on bringing up Nova
> with the currently released firmware images. However, since Nova is
> still in early development, we don't need to maintain long-term support
> for these specific images.
> 
> Based on that, I would like to proceed as follows:
> 
> - Ask Danilo to include a stripped down (<30 LoC without comments) and
>   temporary version of the ELF section unpacker in nova-core so we can
>   use the images currently in linux-firmware for short-term development.
>   I want to stress that this is temporary, and stable Nova will *not*
>   support these images; this is solely to enable us to move forward for
>   the time being.

We know no user/kernel api can ever be changed in the future, so how can
we ever accept this?

> - We (NVIDIA folks involved in Nova) will continue working with the
>   firmware team to ensure that the upcoming redesign takes into account
>   the kernel's requirements, especially the need to avoid unnecessary
>   complexity in the firmware loading steps. There are other constraints
>   of course (the hardware itself continues to evolve, with consequences
>   for the firmware), and so we may or may not achieve everything we hope
>   for. But we will work to keep it as simple as possible.

Great, we can wait for that work to be done, we have no deadlines or
rush here to do it right.  Again, once we add a user/kernel api, we
can't remove it, so let's take the time to get it right.

> - Once a stable firmware ABI is established and its first instance
>   released, we will make it the minimum supported firmware version on
>   Nova and remove the band-aid mentioned in the first point.

Don't you always just move the firmware version forward on new updates
to the kernel driver anyway?  How is this different from normal
operation except that the user/kernel api will now be changed in a
non-backwards-compatible way.  What will break when this happens?

thanks,

greg k-h
