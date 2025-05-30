Received: from linux1587.grserver.gr (linux1587.grserver.gr [185.138.42.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30556382;
	Fri, 30 May 2025 21:28:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.138.42.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748640524; cv=none; b=H6Nz+Mj2jRXBsEIVB8wD49HC8shFicrf75UQyyEnFd0YYiWDGwa18LDVmH7ypyoOjvJ79/48AbEoNoH2kRZhWlxOf4j5lWU4LOFyTnSzm/esuskn9fFzoWCULAt2+qXM0+li12y6Q01v6cPDCwKYEp92gmnFN3Sn5eigqbv9gkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748640524; c=relaxed/simple;
	bh=WeHiXyfP0Y9qkCw/DKGnRqm1QYRsuILIFpHOygsxI8Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Mb0AnuPIr+3JfI6FzOSyJnyqYl30Ze+87Zox94f29a0r7cY8p48/6zlQ7kNwsetGzQxKaoj5Y4fHG4ZbYwX1Jk9ATeAk1zWKm7a3IZvOfqdGjKFD0xJopnCWMGg2wTMpLjsSJKfch0ewDC8zkbyzfjoW+oEBZFt85FRqbk+5CjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=pass (1024-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=Y7fVuWX7; arc=none smtp.client-ip=185.138.42.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="Y7fVuWX7"
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	by linux1587.grserver.gr (Postfix) with ESMTPSA id BB7D72E0C3C5;
	Sat, 31 May 2025 00:28:36 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1748640517;
	bh=FdULvj0CDLi010cImR4FDmoRalOU2VN1FAC6q14Z4Vc=;
	h=Received:From:Subject:To;
	b=Y7fVuWX7FaBmxSQ+HgZkjhH9yCZioOfB7MJvwriOO/19A8bFV7TIAcabb46jHFG8X
	 oXUFs39a1Xa7rlX0txwEL+2YRnTdPMLBIOoJyjfrN7pSeSD/TMz7USHSVqB/c5k9G9
	 kRVhQZ1XIT11fsisnhgzA8QMWwTc5wnTjDk2jNao=
Authentication-Results: linux1587.grserver.gr;
        spf=pass (sender IP is 209.85.208.173) smtp.mailfrom=lkml@antheas.dev smtp.helo=mail-lj1-f173.google.com
Received-SPF: pass (linux1587.grserver.gr: connection is authenticated)
Received: by mail-lj1-f173.google.com with SMTP id
 38308e7fff4ca-30db1bd3bddso22781711fa.3;
        Fri, 30 May 2025 14:28:36 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCVSCi6rxTRxndMh+8RP8biclukas/07veHgRbt4d7j7C79JI/tNxZIUp3Op4AGkmEVfEzgYUaesftA=@vger.kernel.org,
 AJvYcCVph9XI6XqX7KMZhlkfQnzZUWhujAvH9TidhwqqbQwzEXryZ7dNrmmdksAEFmyno+OfmgWPT2t+blvBJcg=@vger.kernel.org,
 AJvYcCWH1PgQ/4o6OkKV7tawWPtJRwUM8bbFGrJqIHyw29LZmXxN1f/Fo4uSW833YPcIA9uvB1Nw4lS6KNdPrrSB@vger.kernel.org
X-Gm-Message-State: AOJu0YxpocJix3K4DAJHJFKHlndMwtdxpMZw/V+6dyJBczUwzwSrx2cj
	MwBUQIj8PEnIe+c+pxWlDV+0PR+zQUSQIufKOGHybUS0Bl3sf6lqzXUnrxDAWRbrTJtGr57c8L6
	b2+fFBFIb6WSwmiW0B3CL0SAPpxN2bFU=
X-Google-Smtp-Source: 
 AGHT+IGOhtIkNHuxZF9ISxC+8v+jZZgt8Re3VXNRNpEOBqb29bpvFXp0UG4NVYJuAINvZr6VErM6rcSGfhmR1YEG9Jw=
X-Received: by 2002:a05:651c:198a:b0:32a:7f39:1a44 with SMTP id
 38308e7fff4ca-32a906cb306mr15162991fa.10.1748640515930; Fri, 30 May 2025
 14:28:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250511204427.327558-1-lkml@antheas.dev>
 <3a64d00e-3ca8-4a9f-9d72-e62712dc20b9@gmx.de>
 <CAGwozwE1DECoLnR2Za0UR11abgomBfvTVXV601Ok9hh6CeHjVA@mail.gmail.com>
 <2ea3d887-b9e3-444c-ac79-6f882557bc78@gmx.de>
In-Reply-To: <2ea3d887-b9e3-444c-ac79-6f882557bc78@gmx.de>
From: Antheas Kapenekakis <lkml@antheas.dev>
Date: Fri, 30 May 2025 23:28:24 +0200
X-Gmail-Original-Message-ID: 
 <CAGwozwG8rGwwcNVwxC7zP+-pg2x=7ZA2VMTGKY6XF1arEAZhBA@mail.gmail.com>
X-Gm-Features: AX0GCFu-evQKstGWaRoyTywDd8zXDISCB1zSBOwt46qHYSXa_tSgWLwJ7HofZIo
Message-ID: 
 <CAGwozwG8rGwwcNVwxC7zP+-pg2x=7ZA2VMTGKY6XF1arEAZhBA@mail.gmail.com>
Subject: Re: [PATCH v1 00/10] platform/x86: msi-wmi-platform: Add fan
 curves/platform profile/tdp/battery limiting
To: Armin Wolf <W_Armin@gmx.de>
Cc: platform-driver-x86@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
	Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>,
 Kurt Borja <kuurtb@gmail.com>,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-PPP-Message-ID: 
 <174864051714.32335.14572498962236971082@linux1587.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 0.103.11 at linux1587.grserver.gr
X-Virus-Status: Clean

On Fri, 30 May 2025 at 23:16, Armin Wolf <W_Armin@gmx.de> wrote:
>
> Am 30.05.25 um 22:50 schrieb Antheas Kapenekakis:
>
> > On Mon, 19 May 2025 at 04:38, Armin Wolf <W_Armin@gmx.de> wrote:
> >> Am 11.05.25 um 22:44 schrieb Antheas Kapenekakis:
> >>
> >>> This draft patch series brings into parity the msi-wmi-platform driver with
> >>> the MSI Center M Windows application for the MSI Claw (all models).
> >>> Unfortunately, MSI Center M and this interface do not have a discovery API,
> >>> necessitating the introduction of a quirk system.
> >>>
> >>> While this patch series is fully functional and tested, there are still
> >>> some issues that need to be addressed:
> >>>     - Armin notes we need to disable fan curve support by default and quirk
> >>>       it as well, as it is not supported on all models. However, the way
> >>>       PWM enable ops work, this makes it a bit difficult, so I would like
> >>>       some suggestions on how to rework this.
> >>>     - It turns out that to fully disable the fan curve, we have to restore
> >>>       the default fan values. This is also what is done on the OEM software.
> >>>       For this, the last patch in the series is used, which is a bit dirty.
> >>>
> >>> Sleep was tested with all values being preserved during S0iX (platform
> >>> profile, fan curve, PL1/PL2), so we do not need suspend/resume hooks, at
> >>> least for the Claw devices.
> >>>
> >>> For PL1/PL2, we use firmware-attributes. So for that I +cc Kurt since if
> >>> his new high level interface is merged beforehand, we can use that instead.
> >> Overall the patch series looks promising, however the suspend/resume handling
> >> and the quirk system still needs some work.
> >>
> >> If you wish i can provide you with a patch for the EC-based quirk system. You
> >> can then structure your exiting patches around that.
> > Hi,
> > Sorry I have been busy with personal life. I will try to get back to
> > this in 1-2 weeks.
> >
> > I have three minor concerns that mirror each other with using an EC based check.
> >
> > 1) First is that we use boardname on the userspace side to check for
> > the Claw. Therefore, using the EC ID kernel side introduces a failure
> > point I am not very fond of. 2) Second is that collecting the IDs from
> > users might prove more difficult 3) userspace software from MSI uses
> > boardname as well.
>
> Actually the EC ID contains the board name (among other data). I envisioned that we
> rely on the board name reported by the EC instead of the board name reported over SMBIOS.
> This would allow us to better support model variations that share a common board name.
>
> Maybe we can still expose some data (EC ID, debugfs interface) even if a given board is
> not whitelisted. This way users can easily retrieve the EC ID with the board name even
> on unknown boards.

Would a hybrid approach be an option perhaps?

In my mind, Id say an info message in dmesg if the board is not
supported should be enough. That's what MSI-EC does. Are there any
other platform drivers that bind to EC ID?

Antheas

> Thanks,
> Armin Wolf
>
> > Could we use a hybrid approach perhaps? What do you think?
> >
> > Antheas
> >
> >> Thanks,
> >> Armin Wolf
> >>
> >>> Antheas Kapenekakis (8):
> >>>     platform/x86: msi-wmi-platform: Add unlocked msi_wmi_platform_query
> >>>     platform/x86: msi-wmi-platform: Add quirk system
> >>>     platform/x86: msi-wmi-platform: Add platform profile through shift
> >>>       mode
> >>>     platform/x86: msi-wmi-platform: Add PL1/PL2 support via firmware
> >>>       attributes
> >>>     platform/x86: msi-wmi-platform: Add charge_threshold support
> >>>     platform/x86: msi-wmi-platform: Drop excess fans in dual fan devices
> >>>     platform/x86: msi-wmi-platform: Update header text
> >>>     platform/x86: msi-wmi-platform: Restore fan curves on PWM disable and
> >>>       unload
> >>>
> >>> Armin Wolf (2):
> >>>     platform/x86: msi-wmi-platform: Use input buffer for returning result
> >>>     platform/x86: msi-wmi-platform: Add support for fan control
> >>>
> >>>    .../wmi/devices/msi-wmi-platform.rst          |   26 +
> >>>    drivers/platform/x86/Kconfig                  |    3 +
> >>>    drivers/platform/x86/msi-wmi-platform.c       | 1181 ++++++++++++++++-
> >>>    3 files changed, 1156 insertions(+), 54 deletions(-)
> >>>
> >>>
> >>> base-commit: 62b1dcf2e7af3dc2879d1a39bf6823c99486a8c2
