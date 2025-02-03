Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4791978F3A
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 08:21:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738570861; cv=none; b=Z5b8oNly9B3ibxuJf8SW/UCLGv5itq6r0lg//9nxMGXeOC0ky9j8JAGk/AYBHIWm5O7J0v0LpttZUvYc/loba2dl/+Pr1EbHOj887JmZodpBRsLbqk6uHJRQwGjX2r/poogRU6MLZh+jGp61BCE/rimZ2r3F+aaWIb4pnqz6px8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738570861; c=relaxed/simple;
	bh=nFkN+ogxYrl/pv6K+knulEU6vn9R/gMDzZnKP4IwLFI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lGkq9i46VfuVslIB+280SdboE34b3pGFzaEMDITeqDAxJnAgeiILTcgSDERUsk2MY0Y6eUCGmNHZ6hf79O88AV7Gz+OuEJeh0eWiwSikCTlWSHNNGOvzQIm4wd6pXeNff5eAKjyfgCrO/yMAvzU7lAaKiJkVrXxaeksAxh/pwlA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=vidqG8kJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="vidqG8kJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8C06C4CED2;
	Mon,  3 Feb 2025 08:20:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1738570860;
	bh=nFkN+ogxYrl/pv6K+knulEU6vn9R/gMDzZnKP4IwLFI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vidqG8kJTzwpekwo4muEai4dllbBZMYFUGU5sS6pHw5rSge71FpuUXRMmBzH3lib0
	 3ygrVpu8CTYqCgg6nug2S8q22sq+xYgtVIvHGs+cA2FmvrRMAGIEoNFo5Sl+hE2WTE
	 CTqftHzTDg+vnKlGnIK4wNdsKaeOYbwXVeWUssEg=
Date: Mon, 3 Feb 2025 09:19:59 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Linus Torvalds <torvalds@linux-foundation.org>,
	Mark Salyzyn <salyzyn@android.com>
Cc: Dave Airlie <airlied@gmail.com>, LKML <linux-kernel@vger.kernel.org>,
	dri-devel <dri-devel@lists.freedesktop.org>,
	"Luis R. Rodriguez" <mcgrof@kernel.org>, russ.weight@linux.dev
Subject: Re: question about firmware caching and relying on it
 (CONFIG_FW_CACHE)
Message-ID: <2025020347-chewy-paradox-ce71@gregkh>
References: <CAPM=9twyvq3EWkwUeoTdMMj76u_sRPmUDHWrzbzEZFQ8eL++BQ@mail.gmail.com>
 <CAHk-=whRBX0aQq1J5S5nHXE2GvXnQ5z+cqu=iTY9xU34kvYMzw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=whRBX0aQq1J5S5nHXE2GvXnQ5z+cqu=iTY9xU34kvYMzw@mail.gmail.com>

On Sun, Feb 02, 2025 at 12:54:07PM -0800, Linus Torvalds wrote:
> On Sun, 2 Feb 2025 at 12:15, Dave Airlie <airlied@gmail.com> wrote:
> >
> > Currently FW_CACHE is an optional feature (that distros may or may not
> > configure off), where we will cache loaded firmwares to avoid problems
> > over suspend/resume (and speed up resume).
> >
> > I've just discovered a problem in nouveau's suspend code when the
> > FW_CACHE is turned off, it tries to load a few in it's suspend path
> > for certain scenarios. Enabling FW_CACHE fixes this, but I'm unsure if
> > that is considered properly fixing it or should FW_CACHE just be
> > considered an optimisation.
> 
> Honestly, if the alternative is "driver hacks up its own caching",
> then I think it definitely should just say "select FW_CACHE".
> 
> You need to make it conditional on PM_SLEEP to make Kconfig happy, but
> arguably that acts as documentation (ie it kind of ends up being a
> "this is *why* we select FW_CACHE").
> 
> So a simple
> 
>         select FW_CACHE if PM_SLEEP
> 
> sounds like the right thing to do for nouveau.
> 
> And in fact, that was how things used to be globally (with no driver
> selection noise needed). There was no FW_CACHE option, we would just
> enable it unconditionally for PM_SLEEP, exactly so that drivers would
> *not* try to load firmware during resume when the filesystem may be
> off-limits.
> 
> HOWEVER.
> 
> We apparently have some completely cray-cray "uevent messages" thing
> going on, which caused commit 030cc787c30e ("firmware_class: make
> firmware caching configurable")
> 
> Honestly, I'm not sure what broken thing that is all about. What
> uevent messages? Firmwas caching should cause *less* uevent noise, not
> more, because now we don't need to talk to user space as much.
> 
> Is that some Android-only thing, or is it some inherent stupidity in
> the FW_CACHE code that I just don't see off-hand?
> 
> I do *not* see any real explanation for that commit, only that
> statement about netlink that appears very odd.
> 
> That commit really makes me angry. It has that pattern that I
> absolutely hate: no actual background, and a "Link:" that makes me
> follow it ("Yay! Explanation!") that then only points back to the
> patch submission ("#^&% this thing").
> 
> Useless. Annoying. I absolutely *detest* those links that give no
> actual useful backstory to what the thing is about and only point back
> to the patch that I'm wondering about. The disappointment it causes is
> intense and real.

The "Link:" there is to the original patch submission, so yes, it's
useless in that point, but it can find the original patch which is why
we add them in this case, because many times the original patch did have
discussions on it before it was accepted.

> Anyway, I would say that particularly for a driver that wants caching,
> adding that select is very much the right thing to do.
> 
> I'd rather get rid of that stupid config option entirely, but since I
> don't know what the background is for it having been added, I guess we
> can't do that.
> 
> Greg, Luis, can you explain that odd uevent message / netlink issue?

There was reports from Android devices that the uevent was causing the
system to wake up from the netlink messages that were sent when going to
sleep and so it would get caught in a loop and never actually go to
sleep.  I can't remember any more than that, maybe Mark can recall the
specifics and dig up the Android bug reports for it?

thanks,

greg k-h
