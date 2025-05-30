Received: from linux1587.grserver.gr (linux1587.grserver.gr [185.138.42.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E4362185A6;
	Fri, 30 May 2025 20:57:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.138.42.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748638638; cv=none; b=ZhBn+ABwtsJQaQS+GyKzL7RClbNJ4XTEyph2cuQI7usW7uB/NtnUEL4roY3gNwp20Me3kyU1/1zYM02pGEs7uBlRo+3DcRE7CJRthvTtcrdi7t7kHUD+d5y++Tn0oiW4GLqwQO5aoXd2YESKLigJcyMa57Xp3QyM9rZEGsSt47s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748638638; c=relaxed/simple;
	bh=1jOAAXk73U1S38R3gOqQ+nFatFS8jwsPrAfMT/GzH6s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=maLY9DUnZi3LzOcNQO1rstGNITA7CJHgEzrXvhS1A2yp8uhmcApYTjZj7T7O2WWyFeJ+dQ5v31bpAZCQz2qpcbyAeFxaHOF44m9ttUFliRyH50YcDfpghLdP5OmIZUJ5x3FB3Dt9WFqeLDs0LAvoE0w/UZmh1BRfAIwPnLwcOz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=pass (1024-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=rLsEP/ED; arc=none smtp.client-ip=185.138.42.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="rLsEP/ED"
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	by linux1587.grserver.gr (Postfix) with ESMTPSA id 77FBB2E0C3D6;
	Fri, 30 May 2025 23:50:43 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1748638244;
	bh=C0aowdne9wIRW/c0ibakSNgSG3zdVolJQQax96wUgZs=;
	h=Received:From:Subject:To;
	b=rLsEP/EDGAfM5remlMChlasFCwUGYemDaEHBFQrTa8tSRNLSbhC7sw1ARJmlXOIwJ
	 J5Q8o9rWFYfE+pdDDe+ksdNZK99MNkywIUt+Na04DJAlCFuk04Ze1N9oC+1m8VGahb
	 aNqzVGnbUJY+Bcg3q94qJVMm+CgRPBCL3XRV4QGA=
Authentication-Results: linux1587.grserver.gr;
        spf=pass (sender IP is 209.85.208.176) smtp.mailfrom=lkml@antheas.dev smtp.helo=mail-lj1-f176.google.com
Received-SPF: pass (linux1587.grserver.gr: connection is authenticated)
Received: by mail-lj1-f176.google.com with SMTP id
 38308e7fff4ca-32a6f5cb6f9so13308141fa.2;
        Fri, 30 May 2025 13:50:43 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCU6Hio8frhRhiUEpL2wyAfK4PdykDlM2iITY6/MaorMwpOjRa4kEGz/bsxZ+zWyV8fdnc86vehFzgw=@vger.kernel.org,
 AJvYcCVgreAxUV0FmjpU/YBpsWzEyHDVvgNb+GDvmcBAOe8Pjv8jxYssTemf4BaGuJBeljjFrtGivOfAT6hN8Pk=@vger.kernel.org,
 AJvYcCWYyIq5Cn+BWZUaA3ScNAEUMl8ggvq/8hqDd1uYHcHW7jxpwd4L2jPOw+8lqwu14GyR/GeB01A/7/uR261m@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0eKj5QBfFKGgRolSxXL32o4l+ZYH6t9wzjR1NMQ436KQeDGIx
	VkJFW4oCCguh3+kVkoWHUCseeOVf8XGaMydukZNihH13rKXWESq7QCsgt85xnAOsFnDGEvdkRdK
	QucM467zNf+EZfVDANZHauTJX1EL5VY8=
X-Google-Smtp-Source: 
 AGHT+IEi1NF4eVCadfBKrIlDQiWO7Ji5+lJrFS3RsnyGLz+rwVxAxgJllh0f0xbLc2pAoN060SkoijWAbo673p+t+C8=
X-Received: by 2002:a2e:b8c6:0:b0:32a:8916:55a1 with SMTP id
 38308e7fff4ca-32a8cd3fd89mr18496941fa.7.1748638242530; Fri, 30 May 2025
 13:50:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250511204427.327558-1-lkml@antheas.dev>
 <3a64d00e-3ca8-4a9f-9d72-e62712dc20b9@gmx.de>
In-Reply-To: <3a64d00e-3ca8-4a9f-9d72-e62712dc20b9@gmx.de>
From: Antheas Kapenekakis <lkml@antheas.dev>
Date: Fri, 30 May 2025 22:50:30 +0200
X-Gmail-Original-Message-ID: 
 <CAGwozwE1DECoLnR2Za0UR11abgomBfvTVXV601Ok9hh6CeHjVA@mail.gmail.com>
X-Gm-Features: AX0GCFuVlagV70nqO5wDgtf3buPGA8Kewx5UT9vnnXGUDV01B947RXTxAFZsfzE
Message-ID: 
 <CAGwozwE1DECoLnR2Za0UR11abgomBfvTVXV601Ok9hh6CeHjVA@mail.gmail.com>
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
 <174863824386.11456.523408226020084527@linux1587.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 0.103.11 at linux1587.grserver.gr
X-Virus-Status: Clean

On Mon, 19 May 2025 at 04:38, Armin Wolf <W_Armin@gmx.de> wrote:
>
> Am 11.05.25 um 22:44 schrieb Antheas Kapenekakis:
>
> > This draft patch series brings into parity the msi-wmi-platform driver with
> > the MSI Center M Windows application for the MSI Claw (all models).
> > Unfortunately, MSI Center M and this interface do not have a discovery API,
> > necessitating the introduction of a quirk system.
> >
> > While this patch series is fully functional and tested, there are still
> > some issues that need to be addressed:
> >    - Armin notes we need to disable fan curve support by default and quirk
> >      it as well, as it is not supported on all models. However, the way
> >      PWM enable ops work, this makes it a bit difficult, so I would like
> >      some suggestions on how to rework this.
> >    - It turns out that to fully disable the fan curve, we have to restore
> >      the default fan values. This is also what is done on the OEM software.
> >      For this, the last patch in the series is used, which is a bit dirty.
> >
> > Sleep was tested with all values being preserved during S0iX (platform
> > profile, fan curve, PL1/PL2), so we do not need suspend/resume hooks, at
> > least for the Claw devices.
> >
> > For PL1/PL2, we use firmware-attributes. So for that I +cc Kurt since if
> > his new high level interface is merged beforehand, we can use that instead.
>
> Overall the patch series looks promising, however the suspend/resume handling
> and the quirk system still needs some work.
>
> If you wish i can provide you with a patch for the EC-based quirk system. You
> can then structure your exiting patches around that.

Hi,
Sorry I have been busy with personal life. I will try to get back to
this in 1-2 weeks.

I have three minor concerns that mirror each other with using an EC based check.

1) First is that we use boardname on the userspace side to check for
the Claw. Therefore, using the EC ID kernel side introduces a failure
point I am not very fond of. 2) Second is that collecting the IDs from
users might prove more difficult 3) userspace software from MSI uses
boardname as well.

Could we use a hybrid approach perhaps? What do you think?

Antheas

> Thanks,
> Armin Wolf
>
> > Antheas Kapenekakis (8):
> >    platform/x86: msi-wmi-platform: Add unlocked msi_wmi_platform_query
> >    platform/x86: msi-wmi-platform: Add quirk system
> >    platform/x86: msi-wmi-platform: Add platform profile through shift
> >      mode
> >    platform/x86: msi-wmi-platform: Add PL1/PL2 support via firmware
> >      attributes
> >    platform/x86: msi-wmi-platform: Add charge_threshold support
> >    platform/x86: msi-wmi-platform: Drop excess fans in dual fan devices
> >    platform/x86: msi-wmi-platform: Update header text
> >    platform/x86: msi-wmi-platform: Restore fan curves on PWM disable and
> >      unload
> >
> > Armin Wolf (2):
> >    platform/x86: msi-wmi-platform: Use input buffer for returning result
> >    platform/x86: msi-wmi-platform: Add support for fan control
> >
> >   .../wmi/devices/msi-wmi-platform.rst          |   26 +
> >   drivers/platform/x86/Kconfig                  |    3 +
> >   drivers/platform/x86/msi-wmi-platform.c       | 1181 ++++++++++++++++-
> >   3 files changed, 1156 insertions(+), 54 deletions(-)
> >
> >
> > base-commit: 62b1dcf2e7af3dc2879d1a39bf6823c99486a8c2
