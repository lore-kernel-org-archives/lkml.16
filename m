Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F262B24C06A;
	Tue, 27 May 2025 12:47:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748350053; cv=none; b=B7KiK3ucSnVNFohAfbb0daqNO+Ncxkcl6yUf7WntqL1vB2Ay1+phRtCPLLxQUTBUuL1UcpY0Bs8UIY8y6Fyg+ympQpRLzQL6inAgYHcOtIOXMy3uEJT+nthVG0noKXdbDYXfeDY92kAnI3rLTV63wUe8q9S5zTJLFWRpSQWZqhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748350053; c=relaxed/simple;
	bh=0VbitZyLMRFuPto3X4+TyVwUXEDdw8erBrmtTrAuVrw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=f0LA/9OMd5UdwdUz0T38nmmQtbrxwCiiLDHQxaJXwPnNK0FguZnF+VBiHv5B5pE5pGgb2Iek7DErFEDc/LI1hEGMpwE5t7cI+INxekddWJ1gworFcONWTRb8XmzQLtKmSKS5k8vsQ/LhBvdgGk5T6HyIMVrBZ++h++hoVpKz/Uw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G8MkvvSX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G8MkvvSX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65C33C4CEE9;
	Tue, 27 May 2025 12:47:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748350052;
	bh=0VbitZyLMRFuPto3X4+TyVwUXEDdw8erBrmtTrAuVrw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=G8MkvvSXzc6wDje9qMe3SCqumNGBU7HM23qtOrYHVGpFC0G6F2h1ENOmz8g2HjnXM
	 8Tr5jHkv23t1tF8StTllc5/LLwO8ORpfFAM0UcJU4p/b+XZBIrAawm38f5bGQrXqrL
	 6hFubyFa98BOobgN85T+3lGD4dvOOzzjT5oZthYteZtQpTWRfUQmWNmHwTrOLUIlpd
	 ZqH+M4qdWo6APo4mImdheUiV9w2gJEbR85dNZdtkcGftGQN0aToh8f/ZXLrwjwyIMW
	 pbg2KEXQIBeBc5qp+oQ09H+yF82lfo5xaPWx8X4UC1xzYyWlS6CENWGnTHAB2XeiNX
	 VLvyxgP0MCUbQ==
Message-ID: <4cac7f91-608b-4362-99ed-4d8cd5935900@kernel.org>
Date: Tue, 27 May 2025 14:47:28 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [GIT PULL] platform-drivers-x86 for v6.16-1
To: Pavel Machek <pavel@ucw.cz>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?=
 <ilpo.jarvinen@linux.intel.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 LKML <linux-kernel@vger.kernel.org>,
 PDx86 <platform-driver-x86@vger.kernel.org>,
 Andy Shevchenko <andy@kernel.org>, Guenter Roeck <linux@roeck-us.net>,
 Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>,
 Sebastian Reichel <sre@kernel.org>
References: <pdx86-pr-20250527124435-2181824944@linux.intel.com>
 <aDWq/U57DO7fMu4K@duo.ucw.cz>
Content-Language: en-US, nl
From: Hans de Goede <hansg@kernel.org>
In-Reply-To: <aDWq/U57DO7fMu4K@duo.ucw.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Linus, Pavel, et al.,

On 27-May-25 2:07 PM, Pavel Machek wrote:
> Hi!
> 
>> warning to hid-asus. I'm expecting Pavel might want object the approach
>> used in the tuxedo driver, I largely relied on my co-maintainer Hans'
>> opinion on what to do with that change as he was much more familiar with
>> that discussion, and the pros and cons of each approach.

Let me provide some background to this from my pov.

This is not about plain backlit keyboards for which we have been
using the /sys/class/leds API for quite a while now without any
complaints.

This is about gaming laptops / peripherals with individual
addressable RGB LEDs. For keyboards this will be one or more
RGB LEDs per key, but a similar problem exists for things
like RGB light strips on the side of laptops (possibly part
of the same hw interface), on mice, game-controllers etc.

The /sys/class/leds interface is based on 1 class device
per LED, for devices with a 100+ LEDs this does not work,
especially not since we want to do realtime effects in
software (userspace sw) which requires being able to
set all LEDs with a single syscall.

We have been trying to define a new userspace API for this
there are several long threads on both the platform-drivers-x86
and the linux-leds lists. Including some proposals from
Werner, the author of the patches Pavel is objecting to.

But we've failed to come up with a workable userspace API
everyone likes because every device is very different so
defining a uniform API for this is a hard problem to solve.

Microsoft has been pushing hw-vendors to use the new(ish)
HID lamp array API / specification for this. Since Microsoft
is pushing this most hw will move to this new interface:

https://learn.microsoft.com/en-us/windows-hardware/design/component-guidelines/dynamic-lighting-devices
https://usb.org/sites/default/files/hut1_5.pdf (26 Lighting And Illumination Page (0x59))
https://github.com/microsoft/RP2040MacropadHidSample

The HID subsystem has no intention to provide a separate
API for HID lamp array devices instead userspace is expected
to use /dev/hidraw# and openrgb, the defacto standard for userspace
RGB LED control, has been working on supporting this for over
a year already:

https://gitlab.com/CalcProgrammer1/OpenRGB/-/merge_requests/2348

and this support is scheduled to get merged before the next
oprnrgb release. Also note that openrgb will need to support this
regardless of the patches we are discussing now, since other
hw is using this natively.

At some point someone suggested that existing laptops which use
vendor specific firmware interfaces to control the RGB LEDs should
just emulate a HID lamp array device. This way we get to use a well
defined API for this and userspace only needs to support the 1 API
instead of needing to support both HID lamparray + whatever we come
up as Linux specific userspace API for this.

Emulating a HID device was discussed with the HID subsys maintainers
and Benjamin Tissoires liked the approach.

Actually everyone involved like the approach. Since userspace will
need HID lamp-array support anyways why make userspace's and our
(kernel's) live harder by defining a new userspace API for this?
While at the same time we have been unable to to come to a consensus
what this new userspace API should look like.

The only person objecting against this approach is Pavel, who for
reasons which IMHO he has not been able to explain properly insists
that there *must* be a new Linux specific userspace API for this.

Benjamin, I assume you are still on favor of this approach can you
confirm this please ?

>>  drivers/platform/x86/tuxedo/nb04/wmi_ab.c          |  923 +++++
>>  drivers/platform/x86/tuxedo/nb04/wmi_util.c        |   91 +
>>  drivers/platform/x86/tuxedo/nb04/wmi_util.h        |  109 +
> 
> Yes, I'd preffer this not to go in.
> 
> Reasons:
> 
> 1) Normally, keyboard backlight is handled by LED subsystem.

This is not a keyboard backlight though, this is a keyboard with
per key addressable RGB lighting.

> This was not even Cc-ed to LED list.

Yes because it does not touch any files under drivers/leds nor
does it implement the LED class API.

This is a driver talking to a device specific firmware interface
(so platform-driver-x86 domain) implementing a HID device on top
(so drivers/hid / linux-input domain).

And both the pdx maintainers (Ilpo, me) and the HID maintainers
(Benjamin Tissoires) are in favor of doing things this way.

> 2) It introduces new kernel API. Unfortunately, that API is not
> documented in the kernel and is very much unlike anything else we have
> in the kernel.

The beauty is actually that it does not introduce a new kernel API
at all. It exposes a new HID device following the specification linked
above (which userspace will need to support anyway) and allows access
to that HID device through /dev/hidraw#.

The not needing to define a new userspace API is actually why most people
like this idea.

> 3) The code is not modular in any way, so the crazy API code is mixed
> with real driver code, making reuse hard.

This is the first and possibly only driver implementing HID lamparray
emulation. If we get more then we can factor out common code then, once
we actually will have some 

> 4) We don't have reasonable support for the new API in the userland.

This is simply not true. Openrgb's next release is planning to
include HID lamparray support.

Regards,

Hans


