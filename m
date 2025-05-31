Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CA49DF49;
	Sat, 31 May 2025 13:30:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748698230; cv=none; b=GHYY8itIWqpG8JqUJO4rFZw+Z3eFL6y6Ch6pJdV2JN7b/BvbRHYhJc/UCTObU6zlVM8ReDDDxmRVZA1sN2qQ/NA2M5VVKhw3fQLy61t6bLOlo5Dr9rCtEXoMwf+Wat3nTQYQ4AlaxjKaaVcYPttHX/0VAawaXvhD4QHV7oHYR4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748698230; c=relaxed/simple;
	bh=zj+WBrSuNwFmmoBsrUNBJ+MTo+uK/TgeY97Q8lyyqDY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SRH7FvEnnl+hd5UY8ngSyw0MfwzDnm7DuPccWqVyrosI3eKaQXwMeW1I/GcSiN5PKtDh437R5RqQJJVMNOYjy3nSCxlBGfacHD6WjPoFXZ8wIjx5SPmapgDgL77HxxSNFtmVwB5JzRQrOzbwVoI0YMEBw8RUWhlttEjzjMjwpdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=t9uq+fwv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="t9uq+fwv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1CF31C4CEE3;
	Sat, 31 May 2025 13:30:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1748698229;
	bh=zj+WBrSuNwFmmoBsrUNBJ+MTo+uK/TgeY97Q8lyyqDY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=t9uq+fwvwNpBw6Zg2xtaPoeEFzwPv9A8f3nSC3OswmaWszFXpX2ocYpIg57T2Pjzp
	 QcYk5a8k10SRBZ5to1ZIUd3i/q9wIdRQ2WDh9x5Qr8sY9bhaAKzvQ5tIo48Jme/24f
	 x196EAAskCHYpb5/Gk4Cyd0NMbxdE/sS4k+XByWA=
Date: Sat, 31 May 2025 15:30:26 +0200
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
Message-ID: <2025053117-snowy-tradition-eb9e@gregkh>
References: <2025052932-pyramid-unvisited-68f7@gregkh>
 <DA935OIFBM1H.3CMSHQ46LLG4P@nvidia.com>
 <2025053047-theology-unsaid-d6ac@gregkh>
 <DA9AU3OBT29Z.3CX827C91I3IH@nvidia.com>
 <2025053050-maggot-landfall-d5eb@gregkh>
 <DA9KIGDH4IF6.2T383ZVLTJN0G@nvidia.com>
 <2025053039-reselect-thinness-e0a2@gregkh>
 <CAOZdJXVvmDro0Mv36grqQ6LB_1O5GzwPx+Dde+wsfu9Cu_me7A@mail.gmail.com>
 <2025053148-gore-badass-1d1d@gregkh>
 <DAACKTM8B9A1.3SI9LRGNMSBH3@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <DAACKTM8B9A1.3SI9LRGNMSBH3@nvidia.com>

On Sat, May 31, 2025 at 09:33:38PM +0900, Alexandre Courbot wrote:
> Hi Greg,
> 
> On Sat May 31, 2025 at 2:45 PM JST, Greg KH wrote:
> > On Fri, May 30, 2025 at 01:10:50PM -0500, Timur Tabi wrote:
> >> On Fri, May 30, 2025 at 10:42 AM Greg KH <gregkh@linuxfoundation.org> wrote:
> >> >
> >> > On Fri, May 30, 2025 at 11:34:02PM +0900, Alexandre Courbot wrote:
> >> > > So to try to answer your question, I am not disagreeing that userspace
> >> > > is capable of doing what we currently do in the kernel. My follow-up
> >> > > questions to that are: how do we command userspace to do that work for
> >> > > us when we request the firmware, how do we provide the result to the
> >> > > kernel, and is this something that distros can adopt easily? I'm happy
> >> > > to consider doing things this way, but would need a few pointers to look
> >> > > into.
> >> >
> >> > Again, look at how your firmware for your devices in your laptop are
> >> > loaded today.
> >
> > Note, I am talking about non-gpu firmare images here (wifi, usb
> > controllers, etc.) that are using the firmware download subsystem for
> > ages as examples of what to look at as to how to trigger a firmware
> > image to be loaded by userspace into the device.
> 
> I would really appreciate it if you could point me precisely to one
> example (a link, a function, a file) of what you are describing because
> I'm starting to wonder whether we are talking about the same thing.
> 
> Previously I mentioned udev and CONFIG_FW_LOADER_USER_HELPER, but you
> haven't confirmed whether that was what you had in mind or not. Assuming
> that udev is involved, I tried to snoop events while a
> `request_firwmare` call is performed using `udevadm monitor`, but that
> revealed no event related to firmware loading. Then looking deeper into
> the kernel documentation confirmed that the kernel does indeed a direct
> filesystem lookup in request_firmware [1]. IOW, the kernel looks for the
> requested file, and if it cannot find it it's game over. This matches my
> observations with udevadm, as I tried requesting a non-existing file and
> no uevent was generated. I don't see what user-space can do here.
> 
> I also tried to look up this "firmware download subsystem" you
> mentioned, but couldn't find anything under that name - I suspect you
> are talking about the sysfs loading mechanism, but AFAIU this depends on 
> CONFIG_FW_LOADER_USER_HELPER which doesn't seem to be widely enabled
> (not on my distro at least).

Yes, that is what I am referring to, as you all seem to want to do
"complex things without a specific filename choosen".  Look at
Documentation/driver-api/firmware/fallback-mechanisms.rst for the
details there.

Or, better yet, just have your driver name all of the individual files
that must be loaded and then no userspace things are needed.  That "big"
firmware file will have already been split up into the different parts
when you write it out to the filesystem, so no need to parse anything.

If this isn't going to work for some reason, I think we need a better
"this is EXACTLY what we need to send to the hardware for the firmware
image(s) it requires" as I'm totally confused based on the different
people talking on this thread about totally different hypotheticals
(i.e. 12 line elf parsers in C vs. a giant elf parser in rust, random
hypothetical hardware values that userspace "can not know", pointing at
obsolete crazy interfaces like remoteproc that just happen to do crazy
things, etc.)

So step back, come up with a solid design document, and let's start over
please.

thanks,

greg k-h
