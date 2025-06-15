Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FE08257D;
	Sun, 15 Jun 2025 18:47:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750013225; cv=none; b=EDsy+pjZm8FkDYn70PINwq73k4plkhAYagVebxOBrQNlmycwjWVJf/X3VI4WsADiZ/J+WfPPuRmYEibJ1W/MzDzB9YUdqYg/LHIutbnOr+4FLHchPKxspFYmy3fGlZ1I2N8NRcjDAiAMyNAzRtNewWbIEVyFJrgfha26GKhyeig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750013225; c=relaxed/simple;
	bh=FHLY/oMp3IbDogGka+5YygLDwtn/U071IQdBMIgMTN8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Lw7AP05FLkShpI119iRvrvi2Sqq5cDMJPn4kudlcdKHS0y3GVBNK2T6CU5PBf8Rmm3T8g/kc4/Owr9OhuELGTgcQEZYn315+Cvo5LXRfDXC+fro0bm33xHm1lKoKUBpnbnsZSx6VUBuo5LVqdo153SNLpcxw3mLl/ajH13fzo9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=ckRe+Ui0; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="ckRe+Ui0"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=s+3d1Jo34P9+huBHWpOnk8Ivu5q7A15Y3NLn06vskQU=; b=ckRe+Ui0gvZ3vwl/ITrGaSezTc
	RlabZgRufDQqnWuULDeVTdi6ghgBUm+/0BLiaYpSe78QK3IEqIMb5m3BXhA3a6vZkD8ylUcejzGTI
	EVTJi3YU1bR6IaiAaY3BuISVBnMJTti39tHPmzFTwNyL4ZLwD5xB25MoVz3NlyFHT5vJlJh6GORXA
	672CDKAj6kEfAbvgw40nSgQ8YRM5UJIqDDb+8LIpgHL4mRapZiyxNKfaRfEtOFyHa7BleMw6bi3oK
	rtsYoFOPllPHhiUrN6HCB1oi1Ae70bZn6DnPJ/YsKYKpO5ZBb6YcrzMv6Hi86IOIMABdokv4ZJWEx
	PXiw4pBw==;
Received: from [50.53.25.54] (helo=[192.168.254.17])
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQsNS-0000000F8x6-1kAH;
	Sun, 15 Jun 2025 18:46:46 +0000
Message-ID: <6e39ff76-b32b-4fc2-8747-ce6884524e41@infradead.org>
Date: Sun, 15 Jun 2025 11:46:42 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 1/3] platform/x86: Add Uniwill WMI driver
To: Armin Wolf <W_Armin@gmx.de>, ilpo.jarvinen@linux.intel.com,
 hdegoede@redhat.com, chumuzero@gmail.com, corbet@lwn.net, cs@tuxedo.de,
 wse@tuxedocomputers.com, ggo@tuxedocomputers.com
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 platform-driver-x86@vger.kernel.org
References: <20250615175957.9781-1-W_Armin@gmx.de>
 <20250615175957.9781-2-W_Armin@gmx.de>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20250615175957.9781-2-W_Armin@gmx.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi-

On 6/15/25 10:59 AM, Armin Wolf wrote:
> Add a new driver for handling WMI events on Uniwill laptops.
> The driver sadly cannot use the WMI GUID for autoloading since Uniwill
> just copied it from the Windows driver example.
> 
> The driver is reverse-engineered based on the following information:
> - https://github.com/pobrn/qc71_laptop
> - https://github.com/tuxedocomputers/tuxedo-drivers
> - various OEM software
> 
> Reported-by: cyear <chumuzero@gmail.com>
> Closes: https://github.com/lm-sensors/lm-sensors/issues/508
> Closes: https://github.com/Wer-Wolf/uniwill-laptop/issues/3
> Signed-off-by: Armin Wolf <W_Armin@gmx.de>
> ---

> diff --git a/drivers/platform/x86/uniwill/Kconfig b/drivers/platform/x86/uniwill/Kconfig
> new file mode 100644
> index 000000000000..5f1ea3e9e72f
> --- /dev/null
> +++ b/drivers/platform/x86/uniwill/Kconfig
> @@ -0,0 +1,32 @@
> +# SPDX-License-Identifier: GPL-2.0-or-later
> +#
> +# Uniwill X86 Platform Specific Drivers
> +#
> +
> +menuconfig X86_PLATFORM_DRIVERS_UNIWILL
> +	bool "Uniwill X86 Platform Specific Device Drivers"
> +	depends on X86_PLATFORM_DEVICES
> +	help
> +	  Say Y here to get to see options for device drivers for various

	  Say Y here to see options ...

> +	  Uniwill X86 platforms, including many OEM laptops originally
> +	  manufactured by Uniwill.
> +	  This option alone does not add any kernel code.
> +
> +	  If you say N, all options in this submenu will be skipped and disabled.


-- 
~Randy

