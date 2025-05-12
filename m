Received: from linux1587.grserver.gr (linux1587.grserver.gr [185.138.42.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7DF5257436;
	Mon, 12 May 2025 10:16:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.138.42.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747044994; cv=none; b=tmJ2fNMv9vflbI17VDbU5vR5b4iSTERBZSAvsHzl2qTrO5BBDhbK/DO+i1j9N0ST6f+6BlenNa8IH+iHH08XT7oba8wantxoTMzMu5BwEJkIN8yj+g2O7YfcwEzBfSpFvDx63J7zUqTpjvPfJPGyeDmHQqKSdS6imVJW5SBejJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747044994; c=relaxed/simple;
	bh=x47o99WWq54f1B7dp6ChhOM/NYXsBJx5IlYwnzky/CI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pCPIrG0dwV8BcBFc8j7zzwADi+j7ykUpEpyzEGa1omKLLq+kDwYE3BFJIuyznoCy6WRTo35UyT0z1TczF64RrLyVHUr99gxuE7lXFK2xAjB3rJn/bqcM2/yodswzL2iIQzQzeTus0pwXFcI2Pcw9vB53D1CUQ2Yh74ItsvuoZH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=pass (1024-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=pSMqnJTD; arc=none smtp.client-ip=185.138.42.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="pSMqnJTD"
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	by linux1587.grserver.gr (Postfix) with ESMTPSA id 7B9682E01935;
	Mon, 12 May 2025 13:16:26 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1747044987;
	bh=OTHX52PGxLTtNGWPpt9j694BPNPZbGM7vPRnoWGCaj8=;
	h=Received:From:Subject:To;
	b=pSMqnJTDIq+JK8bEPeaaJUPiIcr09cHS5fH77CUKXOff1moX+6RRSf6T4u5HOo4Ab
	 dbZMVO/4Hyj3Knx9RTKYaNWJmdj2S0VI7fjtVvEEBDgYbuWr6X1f1MGOjydmo68FdT
	 K+CW9LwHhGDHkgwYCIXewxCu/E0CrWdbGZHNxIYQ=
Authentication-Results: linux1587.grserver.gr;
        spf=pass (sender IP is 209.85.208.170) smtp.mailfrom=lkml@antheas.dev smtp.helo=mail-lj1-f170.google.com
Received-SPF: pass (linux1587.grserver.gr: connection is authenticated)
Received: by mail-lj1-f170.google.com with SMTP id
 38308e7fff4ca-326c1f3655eso30300531fa.1;
        Mon, 12 May 2025 03:16:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUufefQFZkYdDKJrVAY4RGdnhae9BWzyVmWsL/azG7cMZsqjxlGwp8uECx+B+GsiRg3M9493qqugas=@vger.kernel.org,
 AJvYcCWIZFIAVFAkuufdHHK0va3TG8j4X8ksaTMsFtlHKaxFOd+Znkq33CbIWYjaiSy3VwAavIRiUkY5J9pDSzA=@vger.kernel.org,
 AJvYcCXEDKJbpOL0/0NPSX2VaNhhUsDPnsXLgqVcoLKDCKBD/s0WPuVvmhGkgTMbY2MkuauS5p1ntWzmXhbj5T28@vger.kernel.org
X-Gm-Message-State: AOJu0YwRlROBLQl0kaKyleByMhKXwqV6+XuRqSxLabJt5K0BCw9ROI6B
	jFg8vY83QSqBx1Dl572Lh1zE9UVKa/GOxALq/+3HbThg4g3kiOfup1M/BQr2t9vlOhnyyxOja7X
	uIC3LRvF/20g+dxueBYCEzPxB4Bg=
X-Google-Smtp-Source: 
 AGHT+IFw5A+OcMQWiTpmDThG4iT3S00ecaSR5XN3PPYP8Daj9AbNazUCokipeEHqlGTHSZxIvj3aYKVk1S9KVQy8VpE=
X-Received: by 2002:a05:651c:30c6:b0:30b:b956:53d4 with SMTP id
 38308e7fff4ca-326c453d60cmr48709821fa.5.1747044985845; Mon, 12 May 2025
 03:16:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250511204427.327558-1-lkml@antheas.dev>
 <D9TQ0LYKISGB.3QAOHFXVL9PEO@gmail.com>
In-Reply-To: <D9TQ0LYKISGB.3QAOHFXVL9PEO@gmail.com>
From: Antheas Kapenekakis <lkml@antheas.dev>
Date: Mon, 12 May 2025 12:16:14 +0200
X-Gmail-Original-Message-ID: 
 <CAGwozwFJnR2aMhj6LJKU8aF+MDzF9FR21fXPPd7_=44M+KUJGg@mail.gmail.com>
X-Gm-Features: AX0GCFuArtFUaWkkLJa1COmLkMRLR7iabLhAEIG80zqyIm0niW2BE_gm6mMX3S4
Message-ID: 
 <CAGwozwFJnR2aMhj6LJKU8aF+MDzF9FR21fXPPd7_=44M+KUJGg@mail.gmail.com>
Subject: Re: [PATCH v1 00/10] platform/x86: msi-wmi-platform: Add fan
 curves/platform profile/tdp/battery limiting
To: Kurt Borja <kuurtb@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, Armin Wolf <W_Armin@gmx.de>,
	Jonathan Corbet <corbet@lwn.net>, Hans de Goede <hdegoede@redhat.com>,
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>,
 linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-PPP-Message-ID: 
 <174704498690.13136.1383982283804880591@linux1587.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 0.103.11 at linux1587.grserver.gr
X-Virus-Status: Clean

On Mon, 12 May 2025 at 01:30, Kurt Borja <kuurtb@gmail.com> wrote:
>
> Hi Antheas,
>
> On Sun May 11, 2025 at 5:44 PM -03, Antheas Kapenekakis wrote:
> > This draft patch series brings into parity the msi-wmi-platform driver with
> > the MSI Center M Windows application for the MSI Claw (all models).
> > Unfortunately, MSI Center M and this interface do not have a discovery API,
> > necessitating the introduction of a quirk system.
> >
> > While this patch series is fully functional and tested, there are still
> > some issues that need to be addressed:
> >   - Armin notes we need to disable fan curve support by default and quirk
> >     it as well, as it is not supported on all models. However, the way
> >     PWM enable ops work, this makes it a bit difficult, so I would like
> >     some suggestions on how to rework this.
>
> If I understood the question correctly, then you should control the
> visibility of all "curve" related attributes with the quirk.

Yep, this is what I was wondering. I will investigate this. It would
be good to get some comments on the quirk naming as well.

> The custom hwmon attribute_group has an is_visible callback, and so do
> the hwmon_ops.
>
> >   - It turns out that to fully disable the fan curve, we have to restore
> >     the default fan values. This is also what is done on the OEM software.
> >     For this, the last patch in the series is used, which is a bit dirty.
>
> I have a couple questions about this.
>
> * What are the default fan curves? Can these be statically defined?
> * Are user-defined fan curves persistent between reboots?
>
> I have some doubts about the approach you took on the last patch, but I
> want to understand how the platform works first.

So do I. Essentially here is how the Windows software works: when it
first opens, it saves the current curve in Windows registry. Then,
when the user sets a fan curve, it applies it in the same way we do
here and sets a bit in AP. When the custom curve is removed, it unsets
that bit and restores the original curve in WMI.

The logical reasoning would be that that bit controls the fan curve.
This is how it is named in the software. However, when setting that
bit on its own, it seems to only partially affect the fan curve. E.g.,
when the fan curve is 100% in all points, unsetting that bit makes it
go down to 50% when no load occurs. When using the default fan curve,
it goes to 0%. Therefore, it seems like that bit makes the fan curve
semi-autonomous?

The fan curve seems to be hardware specific and resets after reboots.
So a straightforward way to get it is to grab it on a fresh boot.

Antheas

> >
> > Sleep was tested with all values being preserved during S0iX (platform
> > profile, fan curve, PL1/PL2), so we do not need suspend/resume hooks, at
> > least for the Claw devices.
> >
> > For PL1/PL2, we use firmware-attributes. So for that I +cc Kurt since if
> > his new high level interface is merged beforehand, we can use that instead.
>
> Hopefully!
>
> --
>  ~ Kurt
>
> >
> > Antheas Kapenekakis (8):
> >   platform/x86: msi-wmi-platform: Add unlocked msi_wmi_platform_query
> >   platform/x86: msi-wmi-platform: Add quirk system
> >   platform/x86: msi-wmi-platform: Add platform profile through shift
> >     mode
> >   platform/x86: msi-wmi-platform: Add PL1/PL2 support via firmware
> >     attributes
> >   platform/x86: msi-wmi-platform: Add charge_threshold support
> >   platform/x86: msi-wmi-platform: Drop excess fans in dual fan devices
> >   platform/x86: msi-wmi-platform: Update header text
> >   platform/x86: msi-wmi-platform: Restore fan curves on PWM disable and
> >     unload
> >
> > Armin Wolf (2):
> >   platform/x86: msi-wmi-platform: Use input buffer for returning result
> >   platform/x86: msi-wmi-platform: Add support for fan control
> >
> >  .../wmi/devices/msi-wmi-platform.rst          |   26 +
> >  drivers/platform/x86/Kconfig                  |    3 +
> >  drivers/platform/x86/msi-wmi-platform.c       | 1181 ++++++++++++++++-
> >  3 files changed, 1156 insertions(+), 54 deletions(-)
> >
> >
> > base-commit: 62b1dcf2e7af3dc2879d1a39bf6823c99486a8c2
>
