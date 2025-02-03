Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D767F200B8C;
	Mon,  3 Feb 2025 15:34:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738596875; cv=none; b=NLnXQ4zegOnEjmaWEpt3qY9QR1jTHjkpGV+3keIzN/gQbTEKpIepyLtO2sQzAvMA5/AZlRysaEzPNzKPIaugpWt70Qn6qmvitLgeRTK0iy7/3VwTwoirGijkf+7TVKsNcMXDMUuOo04RvNVRvQdVuOev1+S5b2EzQCo0Z32THQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738596875; c=relaxed/simple;
	bh=5SzEa1JxlUYyNAN8a4VMXz7YUjG9MTEPqfd0+b1WBuw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fmlkqOU8J6a4lxg6WNKXzSlNrHgri767SO/TlJmJIfwZLWBcILHEga63KqwlhMwiMU/risOx7Zpxauaa2A5Ped48Y/uZGxx9Kldid/dHXSr0qx8TG0tihJi3KjRR+E1DTTc+IFWgMd27faWinPD4ioxq4DqipwaY1+BsT9y+MsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=LjypTLWK; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="LjypTLWK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1738596862; x=1739201662; i=w_armin@gmx.de;
	bh=rd6sVNZknlgcJC0VpNb2HMex6eIhE5fV9/oNgWEBbpA=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=LjypTLWKBSINlD+0AsySawxad+QnACSiTpudetZSF7eOXbY0sg8EOo/G0lzgYrE+
	 Y6o9JjDeRoI3LUxykD+DB1BXEWy6GPrT2i+9P3sj7lBrVfNlTLLwPqEu4aFwBHaaJ
	 AvCFG+4J9lkHKWKL2GhOqTeLZjcmMxxcYp/ABqll8VrrutXAwWOsTLq4Qi9VeevEj
	 NMIvz2A6jdGnWDn9xRbjVhJm+znb/1UEkAYVA5EwLdeckin4dz4OztKhh6eGehgGz
	 jsc5/k0lroIHKkXa5MiQ0wJDLQWAl7sLwZs3aNGcCate1+kCR3GA/se7eg+XHCw54
	 GdogakXe0ZCQdocbXA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.69] ([91.14.238.232]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MAwXr-1tYcfH1NzF-007b6J; Mon, 03
 Feb 2025 16:34:22 +0100
Message-ID: <7d4e693e-5d12-4c55-9db8-7f7dd45e8086@gmx.de>
Date: Mon, 3 Feb 2025 16:34:20 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 00/14] platform/x86: alienware-wmi driver rework
To: Kurt Borja <kuurtb@gmail.com>, platform-driver-x86@vger.kernel.org
Cc: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Hans de Goede <hdegoede@redhat.com>, Dell.Client.Kernel@dell.com,
 linux-kernel@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20250203062055.2915-1-kuurtb@gmail.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <20250203062055.2915-1-kuurtb@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:VbzyLfjVDqThDCZB0usINCGxuP5vmdD09Dhrkl2vbgixKM2/19Z
 huk27PFkx239aNZXx2GgcXvitVc+pQIMQewR0QLaOQos1WyXuScJyt5I5UKkMudT3fbO2Yf
 zhbQt5/cfhykTzXqtTFNWNwW5aTMTcqPOUu2fFWYQHkYb6rT+pQgZzIwD1a8j3P/Ca6joaF
 GUCYX9d/fv2fQsNV+LWMw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:zyPpT/Hzh8I=;4uh59PajUW+fL0/IoqYiHAOOB3g
 j5Nc3nfriDOLmlMvq7qeOCjkbSKAUguIdMiDcgC2hS0GF1Fs6vEUjTrdNK3clWOBz+MgeF+vA
 miWhBxWGsV75jMl9KplApqGxy87fUCqCTGUNFmDsXoixxm9m4nevlmEw1sJJ6rfA2mi9AINHz
 BRCo9ExmyUKc25O3E5Ly5n+HdJcv5YSCOKuC1ywlTdMUiQzG5QtjUDd5D7oNWRx9M+qZyhCDD
 dycjkwzwDo4w/YX2y1ZzZdF94TinLpkaa7sEE6stksx3JWPI6tQZMvNCtxhmhvYPXMF/GlglK
 2SPPStcD3Mm8VBbgP2D5U6z8u6rDV1jO8CLmzJS5Q12HAuyq1/19EgrxKjzUOpl2+RMhEQ7VX
 oxVSuH/TyYZ0H3R4hNPQsyeNonnVXTjwMBvKxVwSS5sC8QU8+zMSn+dbRcOYdfXmr+gMKblc5
 L1CCj9eS350KMnSY/D5+cBl269Fv5t0AYYVHb9GrO4VBZGby4xJBO+usEDgjnlhGsGE7kfn63
 rSegNg2M1lFVqkDaNPrmCFmwuq9KAI8HY8+4FCg8dqTJja5+1g5hK9U7A2PWgNkZloA1AZL1o
 7aY+IhkwIdh3ooWB8oQlbwNl6/3oNa0ivkmUj6IY7lzU7PT5zBMi9nkouLAUDMzKWVACRoMk+
 6erizPP89/Q57m/JfsL+1saJey8Xk0cadbAW8PVLp1TL2tOKDAx3TtfPaKDpK4vBYXKfXGlGq
 2OYLLJCZvLHGc07SB34ZiJKPxwv1Q08dr3vHK/zMVaft2x+4UIDUwcVqVe8RstNStGt1cyQx5
 F7fXm02ywJs92gAU2K3GZCD4dl+H8F4FWWiae60JW+ROUSG4R6YB5j7FWNAGQ/PcjYzw5JFls
 kxdkye7g+pUJyx/SMkBCiEAsKG0PtNFNQaRaH9pAI3Oty/iP2GN8cgv01xXwlmsQPMnlJry59
 LI3EJOlEJsv+OWLyNso4KFZoDZ0KSJAysUOaxkl1RB2FcTPqzirzOyrRBfyMraovVbrs09s7s
 abCGqNS0Hy33WFHaaEqgIESesWJuWfiKr7gfB6cPCmyWpxo8doPCInAlIfKbNcadQ5X1G9QOF
 R/l2iJ92KTtp7sBmk5vq52G6Ee33EOpfVPgeyTnU6zvQLQZNPO8VLrl9FbuGCWSsNIuMIXJnN
 8Pp7BN/k2ulC0+wMpn3EmJlS0JjHytAwxF5yBIOBDDGAV4qltCH8Hgzg/wIS+rWuFa0sSDTrJ
 w3imsCWlFoxCb/B7RhQcTXHLLzxBoMAG/oJos6W+tNWR1FQ5XxMN7QlGUYZNX/KXEAuX223G4
 KG5yJSjlr9eHVHUIt6pMd4/h6gJDTkCEsk3lGiwpi3wRwo=

Am 03.02.25 um 07:20 schrieb Kurt Borja:

> Hi!
>
> I bring some last minute modifications.
>
> I found commit
>
> 	8d8fc146dd7a ("nvmem: core: switch to use device_add_groups()")
>
> which states that it's unnecesary to call device_remove_groups() when
> the device is removed, so I dropped it to simplify things.

What? That sound quite strange to me. I CCed Greg because i am curious how this
should work.

>
> I also found commit
>
> 	957961b6dcc8 ("hwmon: (oxp-sensors) Move tt_toggle attribute to dev_groups")
>
> which states that no driver should add sysfs groups while probing the
> device as it races with userspace, so I re-added PROBE_FORCE_SYNCHRONOUS
> to the platform driver, so groups are added only after the device has
> finished probing.

Using PROBE_FORCE_SYNCHRONOUS is not going to solve this problem here, please remove it.

Thanks,
Armin Wolf

> I'm not 100% sure that the second commit message applies here, but it is
> revd-by Greg K-H so I added it just in case.
>
> Aside from that, I added .pprof to awcc_quirks because I'm going to add
> support for new features after this series, and it makes sense that
> force_platform_profile only forces the pprof and not other upcoming
> features.
>
> ~ Kurt
> ---
> [02/14]
>    - In alienware_alienfx_setup() add a devm action to remove the created
>      platform device
>    - Drop device_remove_groups() in WMAX .remove callback
>    - Add PROBE_FORCE_SYNCHRONOUS to the platform driver
>    - Drop .remove callbacks on both WMI drivers
>
> [03/14]
>    - Add awcc_platform_profile_init() to create the platform_profile
>      device on quirks->thermal == true condition
>
> [07/14]
>    - Add .pprof to awcc_quirks
>
> [10/14]
>    - Drop unused member `quirks` on `alienfx_priv` (remnant of another
>      version)
>
> v6: https://lore.kernel.org/platform-driver-x86/20250127040406.17112-1-kuurtb@gmail.com/
>
> Kurt Borja (14):
>    platform/x86: alienware-wmi: Add a state container for LED control
>      feature
>    platform/x86: alienware-wmi: Add WMI Drivers
>    platform/x86: alienware-wmi: Add a state container for thermal control
>      methods
>    platform/x86: alienware-wmi: Refactor LED control methods
>    platform/x86: alienware-wmi: Refactor hdmi, amplifier, deepslp methods
>    platform/x86: alienware-wmi: Refactor thermal control methods
>    platform/x86: alienware-wmi: Split DMI table
>    MAINTAINERS: Update ALIENWARE WMI DRIVER entry
>    platform/x86: Rename alienware-wmi.c
>    platform/x86: Add alienware-wmi.h
>    platform/x86: Split the alienware-wmi driver
>    platform/x86: dell: Modify Makefile alignment
>    platform/x86: Update alienware-wmi config entries
>    platform/x86: alienware-wmi: Update header and module information
>
>   MAINTAINERS                                   |    4 +-
>   drivers/platform/x86/dell/Kconfig             |   30 +-
>   drivers/platform/x86/dell/Makefile            |   45 +-
>   .../platform/x86/dell/alienware-wmi-base.c    |  496 +++++++
>   .../platform/x86/dell/alienware-wmi-legacy.c  |   95 ++
>   .../platform/x86/dell/alienware-wmi-wmax.c    |  790 +++++++++++
>   drivers/platform/x86/dell/alienware-wmi.c     | 1249 -----------------
>   drivers/platform/x86/dell/alienware-wmi.h     |  101 ++
>   8 files changed, 1534 insertions(+), 1276 deletions(-)
>   create mode 100644 drivers/platform/x86/dell/alienware-wmi-base.c
>   create mode 100644 drivers/platform/x86/dell/alienware-wmi-legacy.c
>   create mode 100644 drivers/platform/x86/dell/alienware-wmi-wmax.c
>   delete mode 100644 drivers/platform/x86/dell/alienware-wmi.c
>   create mode 100644 drivers/platform/x86/dell/alienware-wmi.h
>
>
> base-commit: 05dbaf8dd8bf537d4b4eb3115ab42a5fb40ff1f5
