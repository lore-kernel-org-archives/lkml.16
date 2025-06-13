Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F8A32DFA3A;
	Fri, 13 Jun 2025 12:08:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749816500; cv=none; b=QzcQW5dQhk7D7Qc0kuBiLZacexrQ3Kki0QtxfpcOlBrJi12eI8Np1Fw5vzb8xmsKzV138lupHMGqTjNEzZbbNEnsBlBazreOqBjuauSQV8GkbX1oAMi/V/VBiPAsdiNTzAaCHy6HZ3B4sLDYWaB0G0+xtv4ymRgOCzyKYNc+bII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749816500; c=relaxed/simple;
	bh=YqWiCERgiEikzOrbIVaSoUp1Cig2dZoekYsziOR1oVg=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=jatS+ypYe0wY1r38nh/biG/CQF5KI3DU+Qs0PHDur9gcIsSxLLxaEmub6usFUi4EtwoO0Ct9LK1htGqEN5kAHmdKOGRy0nbBvo+MEerl2/95IXAdgKiAQ1rCAS/iT6UKVcCkxaSbZQ5n+rUUonzn49E3I6yVsQdhXsyERLkg7wE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GVFePW/J; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GVFePW/J"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749816499; x=1781352499;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=YqWiCERgiEikzOrbIVaSoUp1Cig2dZoekYsziOR1oVg=;
  b=GVFePW/JKNeZCEUcVtBdo2OubrhaEBaQ+1uPIh5BmC/jUhJ/Fa9APtt6
   nEoFxmuXYC7kzFlrcP0UlpKBmhWm1gQsuCdhkkwgWSS0zeIpk9kIN0Xmf
   c/iO4ZPeh3amjUB5UpbdvuNBoy0PGNefTD7s4mRsVVuVu7uDOAsGXZ2b9
   UFdn4EqxdXL40lelPZdX10nO0nlJ0+dREaAgejM8lSMRar2+4F3V37Hk4
   2TOzHlmlrr0DxEKif2J8p4h34f4PNd0VZBRGLGvVnKelU9zQDZtIimP27
   pNJXsCtJSHhr1pUGEXOhs4+d8v91VqMyeD9iRmKVq8tkJIUt1Gpfx93H2
   g==;
X-CSE-ConnectionGUID: saW4ljieRcGquqCr2uekcQ==
X-CSE-MsgGUID: cbMMBi0dTEq7ZKmCFfltrA==
X-IronPort-AV: E=McAfee;i="6800,10657,11463"; a="51746180"
X-IronPort-AV: E=Sophos;i="6.16,233,1744095600"; 
   d="scan'208";a="51746180"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2025 05:08:18 -0700
X-CSE-ConnectionGUID: nNN8x/ZORjSKHn3Ig+R5Cw==
X-CSE-MsgGUID: bwvzuqkSSYW4XyGVTAicuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,233,1744095600"; 
   d="scan'208";a="151634791"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.102])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2025 05:08:16 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Fri, 13 Jun 2025 15:08:13 +0300 (EEST)
To: Ivan Hu <ivan.hu@canonical.com>
cc: Hans de Goede <hdegoede@redhat.com>, jesse.huang@portwell.com.tw, 
    platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] platform/x86: portwell-ec: Move watchdog device under
 correct platform hierarchy
In-Reply-To: <20250613082614.28929-1-ivan.hu@canonical.com>
Message-ID: <18d60b6c-80c0-85e8-79f5-a41d8a757a46@linux.intel.com>
References: <20250613082614.28929-1-ivan.hu@canonical.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 13 Jun 2025, Ivan Hu wrote:

> Without explicitly setting a parent for the watchdog device, the device is
> registered with a NULL parent. This causes device_add() (called internally
> by devm_watchdog_register_device()) to register the device under
> /sys/devices/virtual, since no parent is provided. The result is:
> 
> DEVPATH=/devices/virtual/watchdog/watchdog0
> 
> To fix this, assign &pdev->dev as the parent of the watchdog device before
> calling devm_watchdog_register_device(). This ensures the device is
> associated with the Portwell EC platform device and placed correctly in
> sysfs as:
> 
> DEVPATH=/devices/platform/portwell-ec/watchdog/watchdog0
> 
> This aligns the device hierarchy with expectations and avoids misplacement
> under the virtual class.
> 

This is missing the Fixes tag.

> Signed-off-by: Ivan Hu <ivan.hu@canonical.com>
> ---
>  drivers/platform/x86/portwell-ec.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/platform/x86/portwell-ec.c b/drivers/platform/x86/portwell-ec.c
> index 8b788822237b..3e019c51913e 100644
> --- a/drivers/platform/x86/portwell-ec.c
> +++ b/drivers/platform/x86/portwell-ec.c
> @@ -236,6 +236,7 @@ static int pwec_probe(struct platform_device *pdev)
>  		return ret;
>  	}
>  
> +	ec_wdt_dev.parent = &pdev->dev;
>  	ret = devm_watchdog_register_device(&pdev->dev, &ec_wdt_dev);
>  	if (ret < 0) {
>  		dev_err(&pdev->dev, "failed to register Portwell EC Watchdog\n");
> 

-- 
 i.

