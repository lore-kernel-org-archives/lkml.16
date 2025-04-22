Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92DE92A1C9
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 15:47:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745336830; cv=none; b=JAeurJsw2ndj5SGTXmXjKPoD9hiLdaRSWG+zeEvxbM2lb8QY1Zdk4clgsmQSgA/fi3I+q/igpjE7JGu/UDKg0G4Tcf7IZmUT8zZuwcKypiaU9zexI2qfnH0fouHn7ro62fwdR0oVDXOwNBUh6YeN1oFAmjRMHYOKmVGgT0aU8s4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745336830; c=relaxed/simple;
	bh=BKvwo0yMp9dijVY+uiUruu9XSLX2sIHbW15HTejgP44=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YjS8gd0c3zY/Sr+yerYApMnaIiRG730GOl5EelquqcNbP5PmkypayZD9nlFHA4u+aQELtluhzNmvBey/Gec9NPqJjz5zzPTfGrC9Jox4xTbCNfekhyQ0bkUu4DDOaS5VLyRGy3tJIVu4K5eKHKwUWCSWXMyCyL441A2k9VB6jYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XP0b+q7F; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XP0b+q7F"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745336829; x=1776872829;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=BKvwo0yMp9dijVY+uiUruu9XSLX2sIHbW15HTejgP44=;
  b=XP0b+q7FNsAfiSLO8AKDVXXdujd8kQ9zmcaBtpirtF2JKENqEAfQ7zYL
   z0Y2QK9iz4KH9pFTCzGVmdKjOFuwYO6VMHJOMItNhwMFvGD55DAX4tuBR
   Pno8Fe/9e1xqmqRjkfyLLfTY5+Wacan6uuWOYNt1iUEz8g1pib5duUOXY
   Jy52VLXVU41utI3KZpN2DTw6w96oD7ejebzjLN9rLTL669ccGRYmRE4/b
   +p2Gbq8gL9bNQpNtRVQ6xiH0BVZvNAEZeg0PBHMiHNHQc3PvviVIBcMnu
   kdERXab5ru4t5+aW/D7iy5kyiDSJveVgmsiPKsiQjK23nmqSBdZBrdPka
   A==;
X-CSE-ConnectionGUID: LYelku7ySWeaZTc6AyGaAg==
X-CSE-MsgGUID: leR5LmoFTumQhhBvkB6meA==
X-IronPort-AV: E=McAfee;i="6700,10204,11411"; a="47083286"
X-IronPort-AV: E=Sophos;i="6.15,231,1739865600"; 
   d="scan'208";a="47083286"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2025 08:47:08 -0700
X-CSE-ConnectionGUID: Sxx+Ez7TTjeOFBYQEVogfA==
X-CSE-MsgGUID: SH18r3LBTSyj71/lHormCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,231,1739865600"; 
   d="scan'208";a="137137564"
Received: from smile.fi.intel.com ([10.237.72.58])
  by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2025 08:47:06 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1u7Fpv-0000000EllK-3fnK;
	Tue, 22 Apr 2025 18:47:03 +0300
Date: Tue, 22 Apr 2025 18:47:03 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: xiaopeitux@foxmail.com
Cc: john.g.garry@oracle.com, linux-kernel@vger.kernel.org, robh@kernel.org,
	xiaopei01@kylinos.cn, xuwei5@hisilicon.com
Subject: Re: [PATCH 1/3 V2] bus: hisi_lpc: remove unused head file in
 hisi_lpc.c
Message-ID: <aAe5937NqfE_c34-@smile.fi.intel.com>
References: <cover.1745320689.git.xiaopei01@kylinos.cn>
 <tencent_29AE601199DC77543B902D5EA227CB730E08@qq.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <tencent_29AE601199DC77543B902D5EA227CB730E08@qq.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Tue, Apr 22, 2025 at 07:31:22PM +0800, xiaopeitux@foxmail.com wrote:
> From: Pei Xiao <xiaopei01@kylinos.cn>
> 
> linux/console.h,linux/pci.h,linux/slab.h
> are not used, removes it.

There are more unused and many are missed.
My diff looks like this:

diff --git a/drivers/bus/hisi_lpc.c b/drivers/bus/hisi_lpc.c
index 53dd1573e323..4911afdac316 100644
--- a/drivers/bus/hisi_lpc.c
+++ b/drivers/bus/hisi_lpc.c
@@ -7,17 +7,22 @@
  */
 
 #include <linux/acpi.h>
-#include <linux/console.h>
+#include <linux/bits.h>
 #include <linux/delay.h>
+#include <linux/err.h>
 #include <linux/io.h>
+#include <linux/ioport.h>
 #include <linux/logic_pio.h>
+#include <linux/mod_devicetable.h>
 #include <linux/module.h>
-#include <linux/of.h>
 #include <linux/of_platform.h>
-#include <linux/pci.h>
 #include <linux/platform_device.h>
+#include <linux/property.h>
 #include <linux/serial_8250.h>
-#include <linux/slab.h>
+#include <linux/spinlock.h>
+#include <linux/types.h>
+
+#include <asm/byteorder.h>
 
 #define DRV_NAME "hisi-lpc"
 

...

>  #include <linux/acpi.h>
> -#include <linux/console.h>
>  #include <linux/delay.h>
>  #include <linux/io.h>
>  #include <linux/logic_pio.h>
>  #include <linux/module.h>
>  #include <linux/of.h>
>  #include <linux/of_platform.h>
> -#include <linux/pci.h>
>  #include <linux/platform_device.h>
>  #include <linux/serial_8250.h>
> -#include <linux/slab.h>

-- 
With Best Regards,
Andy Shevchenko


