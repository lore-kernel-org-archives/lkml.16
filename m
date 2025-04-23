Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 158EF5028C;
	Wed, 23 Apr 2025 13:28:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745414893; cv=none; b=UX3Wvj1v/hZChAKyodVLOIceKRCxT2irpNB2hOWQufDfOPELr7w9C3qABrNDzyFI48LrF3vwzMVu+SpJfqGrkfLcGMR0YY89wegPyovb6Ce0FUho1QGRQK5KeYHV8HKJOFM/+E+CcwLVgSB98VxyW4cwysKJHJdOYv+Q95YXryQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745414893; c=relaxed/simple;
	bh=ABrt+tLW6DKLly55/N1HDO65voBFEDLmFiSoBdQCQOs=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=qRKuf0wVnuamF/CMSx932stcd2xAwo6iS0d5lZkHeQCs2fdQRquM4N2GD5GORcohj9oXBBuViRqPyhtSWZXJy6lIhiTyUotn/ww3GdAmedQgqaFtjvBT3ki2nOGOqTi0I59dpXd6i71b71r5FS9ILtccsuKFUV7Sxq3W5j0ZDgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TB5j24xL; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TB5j24xL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745414891; x=1776950891;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=ABrt+tLW6DKLly55/N1HDO65voBFEDLmFiSoBdQCQOs=;
  b=TB5j24xLwSpt7YRAa5H7lgHGvaih8semZjUmrQeDlBVk1APDGp+uejBQ
   QvQdKPXdQfRv8mgoX7B6m+PVe9KsyUznij73zoftLlB+vZ47sCfkhQ2zL
   ZPnSkkZfwXxVG9K6C6bBW3wYN2WDrtIeNUPev515Kd+xLqLJgrYe5vunj
   KGT7k6BExsmX5Z1TcgHQzM1TyOJFxB0g+VVE3Ps7ixuy8yuozpYfAy3VZ
   j48pT6o87U5aZTF/v8sS5n7Aq0wH2/7hzkvLpNAd8i3B1kPpp2jWl4rgQ
   vjlF8qa50vz9cjrKrOtRiTAQh7rb1sP8Ex63UN/NY+UyyMipHGx7jT+3o
   g==;
X-CSE-ConnectionGUID: I8F+sc43T7qLB9vzDfLDbA==
X-CSE-MsgGUID: olh9n8LySXCG4mDMk6tg6A==
X-IronPort-AV: E=McAfee;i="6700,10204,11412"; a="58382242"
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; 
   d="scan'208";a="58382242"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2025 06:28:00 -0700
X-CSE-ConnectionGUID: KGNbnPf5Q8aOAdffGGvN5A==
X-CSE-MsgGUID: lGeB6RSJRn+f3YqeTZhqzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; 
   d="scan'208";a="132303521"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.36])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2025 06:27:50 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 23 Apr 2025 16:27:37 +0300 (EEST)
To: Kurt Borja <kuurtb@gmail.com>, Hans de Goede <hdegoede@redhat.com>, 
    Greg Kroah-Hartman <gregkh@linuxfoundation.org>
cc: Lyndon Sanche <lsanche@lyndeno.ca>, 
    Mario Limonciello <mario.limonciello@amd.com>, 
    platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 3/3] platform/x86: dell-pc: Transition to faux device
In-Reply-To: <20250411-dell-faux-v1-3-ea1f1c929b7e@gmail.com>
Message-ID: <2afb6e58-44cb-486e-8062-074ff397dc2c@linux.intel.com>
References: <20250411-dell-faux-v1-0-ea1f1c929b7e@gmail.com> <20250411-dell-faux-v1-3-ea1f1c929b7e@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 11 Apr 2025, Kurt Borja wrote:

> Use a faux device parent for registering the platform_profile instead of
> a "fake" platform device.
> 
> The faux bus is a minimalistic, single driver bus designed for this
> purpose.

Hi Kurt, Hans & Greg,

I'm not sure about this change. So dell-pc not a platform device but
a "fake".

I'm not saying this is wrong, but feel I'm a bit just lost where the 
dividing line is. Is it just because this driver only happens to call
dell_send_request(), etc., not contains that low-level access code within? 
Or is that dell-smbios "fake" too?

> Signed-off-by: Kurt Borja <kuurtb@gmail.com>
> ---
>  drivers/platform/x86/dell/dell-pc.c | 46 +++++++++++--------------------------
>  1 file changed, 13 insertions(+), 33 deletions(-)
> 
> diff --git a/drivers/platform/x86/dell/dell-pc.c b/drivers/platform/x86/dell/dell-pc.c
> index 794924913be0c6f13ed4aed8b01ffd21f1d34dea..48cc7511905a62d2828e3a7b593b3d2dae893e34 100644
> --- a/drivers/platform/x86/dell/dell-pc.c
> +++ b/drivers/platform/x86/dell/dell-pc.c
> @@ -13,18 +13,18 @@
>  #include <linux/bitfield.h>
>  #include <linux/bitops.h>
>  #include <linux/bits.h>
> +#include <linux/device/faux.h>
>  #include <linux/dmi.h>
>  #include <linux/err.h>
>  #include <linux/init.h>
>  #include <linux/kernel.h>
>  #include <linux/module.h>
>  #include <linux/platform_profile.h>
> -#include <linux/platform_device.h>
>  #include <linux/slab.h>
>  
>  #include "dell-smbios.h"
>  
> -static struct platform_device *platform_device;
> +static struct faux_device *dell_pc_fdev;
>  static int supported_modes;
>  
>  static const struct dmi_system_id dell_device_table[] __initconst = {
> @@ -246,7 +246,7 @@ static const struct platform_profile_ops dell_pc_platform_profile_ops = {
>  	.profile_set = thermal_platform_profile_set,
>  };
>  
> -static int thermal_init(void)
> +static int dell_pc_faux_probe(struct faux_device *fdev)
>  {
>  	struct device *ppdev;
>  	int ret;
> @@ -258,51 +258,31 @@ static int thermal_init(void)
>  	if (ret < 0)
>  		return ret;
>  
> -	platform_device = platform_device_register_simple("dell-pc", PLATFORM_DEVID_NONE, NULL, 0);
> -	if (IS_ERR(platform_device))
> -		return PTR_ERR(platform_device);
> +	ppdev = devm_platform_profile_register(&fdev->dev, "dell-pc", NULL,
> +					       &dell_pc_platform_profile_ops);
>  
> -	ppdev = devm_platform_profile_register(&platform_device->dev, "dell-pc",
> -					       NULL, &dell_pc_platform_profile_ops);
> -	if (IS_ERR(ppdev)) {
> -		ret = PTR_ERR(ppdev);
> -		goto cleanup_platform_device;
> -	}
> -
> -	return 0;
> -
> -cleanup_platform_device:
> -	platform_device_unregister(platform_device);
> -
> -	return ret;
> +	return PTR_ERR_OR_ZERO(ppdev);
>  }
>  
> -static void thermal_cleanup(void)
> -{
> -	platform_device_unregister(platform_device);
> -}
> +static const struct faux_device_ops dell_pc_faux_ops = {
> +	.probe = dell_pc_faux_probe,
> +};
>  
>  static int __init dell_init(void)
>  {
> -	int ret;
> -
>  	if (!dmi_check_system(dell_device_table))
>  		return -ENODEV;
>  
> -	ret = thermal_init();
> -	if (ret)
> -		goto fail_thermal;
> +	dell_pc_fdev = faux_device_create("dell-pc", NULL, &dell_pc_faux_ops);
> +	if (!dell_pc_fdev)
> +		return -ENODEV;
>  
>  	return 0;
> -
> -fail_thermal:
> -	thermal_cleanup();
> -	return ret;
>  }
>  
>  static void __exit dell_exit(void)
>  {
> -	thermal_cleanup();
> +	faux_device_destroy(dell_pc_fdev);
>  }
>  
>  module_init(dell_init);
> 
> 

-- 
 i.

