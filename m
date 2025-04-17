Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6656924E4AC;
	Thu, 17 Apr 2025 13:45:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744897516; cv=none; b=mncLCWwRG7o+sX9YshEPh8Txfsixo22nyQ8FHCxC0pOwmp/t/LpFSIYvixMPHPCTZOJ6kwHmwKfO5SwVDGMmgnmU7EXvyyidZHzNxCfZSJPhw+bHgVg5/DrwIFyVpM713DcmF9TkRTKmUE23iR8sa7J9jnAiTO1QFCcVfIEE8sY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744897516; c=relaxed/simple;
	bh=GfrGivUvSyZvK9pSC84UfaaLk0j/HWC/JTBmpVfsaDM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kpCRyrZi/xq4uRMxy4lI7Y3T6ofHLYW7BZp8qKvJEUmkVCAf4X13iXZyRRR9Fffs73Z++H1aapgsp6o01mwGLpLsKK6RHqUtDPdYndT1XU+CJc1NTkN3C/+R3F5kPx6z4UMfME6tiOIuKW1HZQuQLQ2e8pyFrEKt5P5owQ/8jnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kSmoT154; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kSmoT154"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744897514; x=1776433514;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=GfrGivUvSyZvK9pSC84UfaaLk0j/HWC/JTBmpVfsaDM=;
  b=kSmoT154udohMjvnfPf8kvSqj9nM5h18nTMSuW09AjWcEL0YxOv+Ds1n
   9wZLRPCY5d8bHgWwGyoHYRYVfJCJ0qYdL5zldb/CnGBqcKXHgDj/SQal/
   gbcxY0/Jetrt6i4OzRw52JliCf3H2qkpTkrQvkqTpKKPp2uOhA+92q9OK
   CGY640axKKAdhV9SW5Umhb6cN5F7Rn/OBJA4nTcgR90K0YkCtwn1uPnbb
   RXnuzEeW4fwZbZPstxvz5I9UWrPQn1w6NXq0nTD6CJAdBeMB/sRURptJy
   2CjEAxF6xpqsh0dV+ItYyBfZ67a10kUuweIx2SSFtG+z4GFJJ8K+i9uZy
   g==;
X-CSE-ConnectionGUID: qCfUI0X5SGSYI1yjPV63Pw==
X-CSE-MsgGUID: rVzMJLrASYGPEA/tIW2akA==
X-IronPort-AV: E=McAfee;i="6700,10204,11405"; a="46380072"
X-IronPort-AV: E=Sophos;i="6.15,219,1739865600"; 
   d="scan'208";a="46380072"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2025 06:44:51 -0700
X-CSE-ConnectionGUID: I4Tp8mqQTvSd7+eZ4SF+UQ==
X-CSE-MsgGUID: O5JZ8IM+Rtq27GyBFX3KHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,219,1739865600"; 
   d="scan'208";a="135771240"
Received: from kuha.fi.intel.com ([10.237.72.152])
  by orviesa004.jf.intel.com with SMTP; 17 Apr 2025 06:44:49 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Thu, 17 Apr 2025 16:44:47 +0300
Date: Thu, 17 Apr 2025 16:44:47 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Yue Haibing <yuehaibing@huawei.com>
Cc: gregkh@linuxfoundation.org, mitltlatltl@gmail.com,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH -next] usb: typec: ucsi: Fix unmet dependencies for
 UCSI_HUAWEI_GAOKUN
Message-ID: <aAEFz_Jf8aqgzBcY@kuha.fi.intel.com>
References: <20250417122843.2667008-1-yuehaibing@huawei.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250417122843.2667008-1-yuehaibing@huawei.com>

On Thu, Apr 17, 2025 at 08:28:43PM +0800, Yue Haibing wrote:
> WARNING: unmet direct dependencies detected for DRM_AUX_HPD_BRIDGE
>   Depends on [n]: HAS_IOMEM [=y] && DRM [=n] && DRM_BRIDGE [=n] && OF [=n]
>   Selected by [m]:
>   - UCSI_HUAWEI_GAOKUN [=m] && USB_SUPPORT [=y] && TYPEC [=m] && TYPEC_UCSI [=m] && EC_HUAWEI_GAOKUN [=m]
> 
> DRM_AUX_HPD_BRIDGE depends on DRM_BRIDGE and OF, only select it with
> both for UCSI_HUAWEI_GAOKUN.
> 
> Fixes: 00327d7f2c8c ("usb: typec: ucsi: add Huawei Matebook E Go ucsi driver")
> Signed-off-by: Yue Haibing <yuehaibing@huawei.com>

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  drivers/usb/typec/ucsi/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/typec/ucsi/Kconfig b/drivers/usb/typec/ucsi/Kconfig
> index e94956d27325..8bf8fefb4f07 100644
> --- a/drivers/usb/typec/ucsi/Kconfig
> +++ b/drivers/usb/typec/ucsi/Kconfig
> @@ -94,7 +94,7 @@ config UCSI_LENOVO_YOGA_C630
>  config UCSI_HUAWEI_GAOKUN
>  	tristate "UCSI Interface Driver for Huawei Matebook E Go"
>  	depends on EC_HUAWEI_GAOKUN
> -	select DRM_AUX_HPD_BRIDGE
> +	select DRM_AUX_HPD_BRIDGE if DRM_BRIDGE && OF
>  	help
>  	  This driver enables UCSI support on the Huawei Matebook E Go tablet,
>  	  which is a sc8280xp-based 2-in-1 tablet.
> -- 
> 2.34.1

-- 
heikki
