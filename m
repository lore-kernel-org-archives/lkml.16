Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 505B6292B3D;
	Mon, 16 Jun 2025 12:59:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.90.84.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750078799; cv=none; b=fiHzan1WZOG91o6Rm4Pllq2wQHxrCfmqGbORjasdE8HDPGWKLZ5MePUYwC2SZ9KCy6s73gPvqSRIShMS9QfoYgneo95+S/Qcv3lS0iG6bmr6/9xB6wot1nJrr2QXPA4/hR+eXtoQWNbmPKtqskoUk8Y6kGaNTyCPgF4H84Cm0J0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750078799; c=relaxed/simple;
	bh=6l+7fWDupKPx1PUKtngix+Asbt9XDd+GPScH8eDOZbI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oPMIMHOBU6sYuLBWX/4QbKHXMbSXskrmWeJ1x2GFFJ/hmI0UsdfCazW5m/1xk0LKodcz5vCIuj3BPSYIbzojSz8vpu/vQEnOgAiy9pJ2J7l2ELpKFY0t9sFZxTGXs7ymArunkkWwU1NZTveM+9/Bq/fhuQiV84Tg7D7889LK/48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com; spf=pass smtp.mailfrom=tuxedocomputers.com; dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b=Z0DmCtsq; arc=none smtp.client-ip=157.90.84.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="Z0DmCtsq"
Received: from [192.168.42.116] (pd9e59880.dip0.t-ipconnect.de [217.229.152.128])
	(Authenticated sender: wse@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPSA id AF5022FC0059;
	Mon, 16 Jun 2025 14:59:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1750078792;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bOS4yfJw7ZHsR6k3jAVfS8tq+SMQ7zP/6jth4m1s9qg=;
	b=Z0DmCtsqd/SfZwstPDE7axeeYVE03ZwMDIFPDbChTXAxhqH0Qt+cyKmIY+uxOFvTdjoxkh
	loaFFTORxGNcYUvHjhDiHQ45cG+E1gDF4oQ61eqK49NxUWGendg/5rv+nE4VTajHGjDiO1
	BcalKN8iB7ddZdSGnQRzThccjnnZASc=
Authentication-Results: mail.tuxedocomputers.com;
	auth=pass smtp.auth=wse@tuxedocomputers.com smtp.mailfrom=wse@tuxedocomputers.com
Message-ID: <50c4d166-0254-4f5e-b006-85aef8d9dd02@tuxedocomputers.com>
Date: Mon, 16 Jun 2025 14:59:52 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 0/3] platform/x86: Add support for Uniwill laptop
 features
To: Armin Wolf <W_Armin@gmx.de>, ilpo.jarvinen@linux.intel.com,
 hdegoede@redhat.com, chumuzero@gmail.com, corbet@lwn.net, cs@tuxedo.de,
 ggo@tuxedocomputers.com
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 platform-driver-x86@vger.kernel.org
References: <20250615175957.9781-1-W_Armin@gmx.de>
Content-Language: en-US
From: Werner Sembach <wse@tuxedocomputers.com>
In-Reply-To: <20250615175957.9781-1-W_Armin@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Armin,

Am 15.06.25 um 19:59 schrieb Armin Wolf:
> This patch series adds support for the various features found on
> laptops manufactured by Uniwill. Those features are:
>
>   - battery charge limiting
>   - RGB lightbar control
>   - hwmon support
>   - improved hotkey support
>   - keyboard-related settings
>
> This patch series is based on the following out-of-tree drivers:
>
>   - https://github.com/pobrn/qc71_laptop
>   - https://github.com/tuxedocomputers/tuxedo-drivers
Better use https://gitlab.com/tuxedocomputers/development/packages/tuxedo-drivers
>
> Additionally the OEM software of the Intel Nuc x15 was
> reverse-engineered to have a better understanding about the underlying
> hardware interface.
>
> The first patch introduces the uniwill-wmi driver used for handling
> WMI events on Uniwill devices. Due to a grave design error inside the
> underlying WMI firmware interface (the WMI GUID was copied from the
> Windows driver samples and is thus not unique) the driver cannot be
> autoloaded. Instead drivers using this module will load it as an
> module dependency.
>
> The second patch introduces the uniwill-laptop driver that does the
> majority of the work. This driver talks to the embedded controller
> yet another WMI interface to control the various features. Sadly this
> WMI firmware interfaces suffers from the exact same issue (the WMI
> GUID is not unique) and thus a DMI whitelist has to be used for
> loading the driver.
>
> The last patch finally adds some documentation for configuring and
> using both drivers.
>
> Special thanks go to:
>
>   - github user cyear for bring up this topic on the lm-sensors issue
>     tracker and being the tester for various prototype versions
>   - github user dumingqiao for testing the battery, lightbar and
>     keyboard-related features
>   - Tuxedo computers for giving advice on how to design the userspace
>     interface
>
> I send this series as an RFC to gather feedback and to request any
> involved developers if they want to have their Co-developed-by tags
> on the final patch series.

Afaik most of the initial uniwill module in tuxedo-drivers was written by 
Christoffer, he is currently on holiday, but I will ask him when he is back. I 
also did later added to it later.

Since this driver is a complete rewrite I'm not sure if a Co-developed by for 
Christoffer and me is appropriate, but we would ofc be happy about it. Maybe for 
finding out the EC register meanings that you probably at least partially copied 
over from tuxedo-drivers?

Or do you see another label more fitting?

Best regards,

Werner

>
> Armin Wolf (3):
>    platform/x86: Add Uniwill WMI driver
>    platform/x86: Add Uniwill laptop driver
>    Documentation: laptops: Add documentation for uniwill laptops
>
>   .../ABI/testing/sysfs-driver-uniwill-laptop   |   53 +
>   Documentation/admin-guide/laptops/index.rst   |    1 +
>   .../admin-guide/laptops/uniwill-laptop.rst    |   68 +
>   Documentation/wmi/devices/uniwill-laptop.rst  |  109 ++
>   Documentation/wmi/devices/uniwill-wmi.rst     |   52 +
>   MAINTAINERS                                   |   17 +
>   drivers/platform/x86/Kconfig                  |    2 +
>   drivers/platform/x86/Makefile                 |    3 +
>   drivers/platform/x86/uniwill/Kconfig          |   49 +
>   drivers/platform/x86/uniwill/Makefile         |    8 +
>   drivers/platform/x86/uniwill/uniwill-laptop.c | 1477 +++++++++++++++++
>   drivers/platform/x86/uniwill/uniwill-wmi.c    |  178 ++
>   drivers/platform/x86/uniwill/uniwill-wmi.h    |  122 ++
>   13 files changed, 2139 insertions(+)
>   create mode 100644 Documentation/ABI/testing/sysfs-driver-uniwill-laptop
>   create mode 100644 Documentation/admin-guide/laptops/uniwill-laptop.rst
>   create mode 100644 Documentation/wmi/devices/uniwill-laptop.rst
>   create mode 100644 Documentation/wmi/devices/uniwill-wmi.rst
>   create mode 100644 drivers/platform/x86/uniwill/Kconfig
>   create mode 100644 drivers/platform/x86/uniwill/Makefile
>   create mode 100644 drivers/platform/x86/uniwill/uniwill-laptop.c
>   create mode 100644 drivers/platform/x86/uniwill/uniwill-wmi.c
>   create mode 100644 drivers/platform/x86/uniwill/uniwill-wmi.h
>
