Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE25A24DCF1;
	Tue, 27 May 2025 13:13:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748351609; cv=none; b=QkWz3kTApExJIIl9MeCq4UwNAstAIZT3rHHHYNgD1yES0taA07R/bOzLUwnzBNtTC/K8c6J0Rc90V2RRrrDt+Wu04lIF6nMVhrZlzYu5ex8T4Kl+wKQWnG2hCMcu8DGuN2fv6gVpKiOyfrOrbed/FYnI7N00m70Ig+E1voVusHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748351609; c=relaxed/simple;
	bh=jG394c909w+93hl23R87SLncNBijklgCCygVq3eWn+w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X17PxXR42Ea7HFh68OCkSdbYunIklQzz0GVQlEVU7ww9+HVaYaNDEXR44gXaySd49nlUvxfoCRRmrVYvgeQUs4KsDB7gJ7zxeh6nzMku02nCdPb6VI2Q0Byj7y/2i5hM1A0EhOrOPm7RDyHnVgYq5BmVpKgXclqBvZJjKn5OjN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nANZiXo/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nANZiXo/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 590AAC4CEE9;
	Tue, 27 May 2025 13:13:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748351609;
	bh=jG394c909w+93hl23R87SLncNBijklgCCygVq3eWn+w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nANZiXo/34q9RxHjpN1Fp8fT3oFNMFhxXNKvo4oTcbYR4iTgnlZd/oYkHhnYfFfsN
	 yikQp22qJ+RziHHYL/76LnySUpjF7cL9WmvRRmIR1+V5n2P0KxPVP26HzUZNELQq0q
	 etjOSPyYNlm6HKmEBMJQQzIJ6vggybA8qlRrd5pgK+PciWbiEy9pIcpSyYoY8/6t2Z
	 le5VrDS7zIP+bM1WoIX0qZJG2yjuXMDUZ4+gZTni+cmi+20bpGXoWAFm2C4drIaXbR
	 S6RCNaU1EoQ90VV/wBiX8ZdVVYdg535iOToPwutfvILHcfqun7iBUcNh2lypxZIgrx
	 ywgR2Z0lhvN8Q==
Date: Tue, 27 May 2025 15:13:24 +0200
From: Benjamin Tissoires <bentiss@kernel.org>
To: Hans de Goede <hansg@kernel.org>
Cc: Pavel Machek <pavel@ucw.cz>, 
	Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, Linus Torvalds <torvalds@linux-foundation.org>, 
	LKML <linux-kernel@vger.kernel.org>, PDx86 <platform-driver-x86@vger.kernel.org>, 
	Andy Shevchenko <andy@kernel.org>, Guenter Roeck <linux@roeck-us.net>, 
	Jiri Kosina <jikos@kernel.org>, Sebastian Reichel <sre@kernel.org>
Subject: Re: [GIT PULL] platform-drivers-x86 for v6.16-1
Message-ID: <3xuwmzjmnu63r4l6fke6cbbiagjurbefdmcohzmpxy2thaegyg@dy75rzhxtiek>
References: <pdx86-pr-20250527124435-2181824944@linux.intel.com>
 <aDWq/U57DO7fMu4K@duo.ucw.cz>
 <4cac7f91-608b-4362-99ed-4d8cd5935900@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4cac7f91-608b-4362-99ed-4d8cd5935900@kernel.org>

On May 27 2025, Hans de Goede wrote:
> Hi Linus, Pavel, et al.,
> 
> On 27-May-25 2:07 PM, Pavel Machek wrote:
> > Hi!
> > 
> >> warning to hid-asus. I'm expecting Pavel might want object the approach
> >> used in the tuxedo driver, I largely relied on my co-maintainer Hans'
> >> opinion on what to do with that change as he was much more familiar with
> >> that discussion, and the pros and cons of each approach.
> 
> Let me provide some background to this from my pov.
> 
> This is not about plain backlit keyboards for which we have been
> using the /sys/class/leds API for quite a while now without any
> complaints.
> 
> This is about gaming laptops / peripherals with individual
> addressable RGB LEDs. For keyboards this will be one or more
> RGB LEDs per key, but a similar problem exists for things
> like RGB light strips on the side of laptops (possibly part
> of the same hw interface), on mice, game-controllers etc.
> 
> The /sys/class/leds interface is based on 1 class device
> per LED, for devices with a 100+ LEDs this does not work,
> especially not since we want to do realtime effects in
> software (userspace sw) which requires being able to
> set all LEDs with a single syscall.
> 
> We have been trying to define a new userspace API for this
> there are several long threads on both the platform-drivers-x86
> and the linux-leds lists. Including some proposals from
> Werner, the author of the patches Pavel is objecting to.
> 
> But we've failed to come up with a workable userspace API
> everyone likes because every device is very different so
> defining a uniform API for this is a hard problem to solve.
> 
> Microsoft has been pushing hw-vendors to use the new(ish)
> HID lamp array API / specification for this. Since Microsoft
> is pushing this most hw will move to this new interface:
> 
> https://learn.microsoft.com/en-us/windows-hardware/design/component-guidelines/dynamic-lighting-devices
> https://usb.org/sites/default/files/hut1_5.pdf (26 Lighting And Illumination Page (0x59))
> https://github.com/microsoft/RP2040MacropadHidSample
> 
> The HID subsystem has no intention to provide a separate
> API for HID lamp array devices instead userspace is expected
> to use /dev/hidraw# and openrgb, the defacto standard for userspace
> RGB LED control, has been working on supporting this for over
> a year already:
> 
> https://gitlab.com/CalcProgrammer1/OpenRGB/-/merge_requests/2348
> 
> and this support is scheduled to get merged before the next
> oprnrgb release. Also note that openrgb will need to support this
> regardless of the patches we are discussing now, since other
> hw is using this natively.
> 
> At some point someone suggested that existing laptops which use
> vendor specific firmware interfaces to control the RGB LEDs should
> just emulate a HID lamp array device. This way we get to use a well
> defined API for this and userspace only needs to support the 1 API
> instead of needing to support both HID lamparray + whatever we come
> up as Linux specific userspace API for this.
> 
> Emulating a HID device was discussed with the HID subsys maintainers
> and Benjamin Tissoires liked the approach.
> 
> Actually everyone involved like the approach. Since userspace will
> need HID lamp-array support anyways why make userspace's and our
> (kernel's) live harder by defining a new userspace API for this?
> While at the same time we have been unable to to come to a consensus
> what this new userspace API should look like.
> 
> The only person objecting against this approach is Pavel, who for
> reasons which IMHO he has not been able to explain properly insists
> that there *must* be a new Linux specific userspace API for this.
> 
> Benjamin, I assume you are still on favor of this approach can you
> confirm this please ?

Yes, I confirm changing the custom proprietary protocol of this keyboard
to a known standard is still good to me.

> 
> >>  drivers/platform/x86/tuxedo/nb04/wmi_ab.c          |  923 +++++
> >>  drivers/platform/x86/tuxedo/nb04/wmi_util.c        |   91 +
> >>  drivers/platform/x86/tuxedo/nb04/wmi_util.h        |  109 +
> > 
> > Yes, I'd preffer this not to go in.
> > 
> > Reasons:
> > 
> > 1) Normally, keyboard backlight is handled by LED subsystem.
> 
> This is not a keyboard backlight though, this is a keyboard with
> per key addressable RGB lighting.
> 
> > This was not even Cc-ed to LED list.
> 
> Yes because it does not touch any files under drivers/leds nor
> does it implement the LED class API.

I would also add that the LED list was added at the very beginning of
the submission process on previous versions. Only that particular
implementation, not touching the LED subystem was not.

> 
> This is a driver talking to a device specific firmware interface
> (so platform-driver-x86 domain) implementing a HID device on top
> (so drivers/hid / linux-input domain).
> 
> And both the pdx maintainers (Ilpo, me) and the HID maintainers
> (Benjamin Tissoires) are in favor of doing things this way.
> 
> > 2) It introduces new kernel API. Unfortunately, that API is not
> > documented in the kernel and is very much unlike anything else we have
> > in the kernel.
> 
> The beauty is actually that it does not introduce a new kernel API
> at all. It exposes a new HID device following the specification linked
> above (which userspace will need to support anyway) and allows access
> to that HID device through /dev/hidraw#.
> 
> The not needing to define a new userspace API is actually why most people
> like this idea.

And again, I re-iterate that nobody is opposed to a well defined kernel
api, which can be implemented in the HID subsystem now.

That means a little longer path for this particular device (because
proprietary->HID->wonderful kernel API), but that means that other new
devices implementing natively HID lamp array would benefit from this
work instead of having a single device with that new kernel API.

But OTOH, nobody managed to be convincing enough that a new kernel API
would be benefitial and that cross platform projects like openrgb would
jump on it ASAP.

Cheers,
Benjamin

> 
> > 3) The code is not modular in any way, so the crazy API code is mixed
> > with real driver code, making reuse hard.
> 
> This is the first and possibly only driver implementing HID lamparray
> emulation. If we get more then we can factor out common code then, once
> we actually will have some 
> 
> > 4) We don't have reasonable support for the new API in the userland.
> 
> This is simply not true. Openrgb's next release is planning to
> include HID lamparray support.
> 
> Regards,
> 
> Hans
> 
> 
