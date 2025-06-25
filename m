Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0130A800;
	Wed, 25 Jun 2025 12:28:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750854532; cv=none; b=tIFPOkbxCh7g2/5iGoia16Q1A6zB1NwA77xrF2OOIBJFUHByVxK5pQcZbL0aiFsORAz04jyZzTRPGJtD41pI1CvCHUL2FQujwEIFYMEpuTNK5YcyEMCA9W6QIZ4MvVzdNnyYq/e42b2EKBuan8Lg+a+dPmMBH4MjM/kHB5nQQTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750854532; c=relaxed/simple;
	bh=x+77b4i0Z6wKis3aStFQZ7veNrPOT+2KFQd69RsxdjI=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=EGToClWHKq4qDRmJ3Ibc95V6oZrpMS5VPtFYbhbLsp4K2mf7klqlKyUgRobgrexF+KmYX+uwDFi7aGb+5OQWMnWVo6lRtqAztCGA3LczD87yyT3Y46tX/wJNe7YBScuew+Bh9vzMeyoitI+mxCNN0y3n6bukdOm1+x1VvZQHyVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W37ODDGs; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W37ODDGs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750854530; x=1782390530;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=x+77b4i0Z6wKis3aStFQZ7veNrPOT+2KFQd69RsxdjI=;
  b=W37ODDGsXjcudJGDkl4cz2OzR3o3bVvonAhkzNkYW/SVUL3iah11/P+Z
   I1JWopHr+iExqxgYcojRO6kqRNd+9jSskoWnpuVLQ8BoB12Rk+41GWsei
   c0CGLdpcYWiKa4fkQeaJa1uT70xnejB/1m5jUviXYJNFR8t1BqhSTsTHe
   5HEhgvoH0wkBpBWY1/ER28csBUg92GKms74FTlbb7l+GdfxbEfZXFNURQ
   /3l1/jGPCe4OjUeK7WSGExpy1rdfvE6QVWFiRY8HkXEj6uKygyJgz/F5R
   cdqMlVMBbqfwwIrjpvttrvlAmzhoLd23OeAt+ipOdMKh9XuEanSzwl56K
   w==;
X-CSE-ConnectionGUID: fwvn+bumTIOGz7MtQDn4qw==
X-CSE-MsgGUID: mC0XEDCoQRS4yxZsEOKYSQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11474"; a="52986391"
X-IronPort-AV: E=Sophos;i="6.16,264,1744095600"; 
   d="scan'208";a="52986391"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2025 05:28:50 -0700
X-CSE-ConnectionGUID: 9xNSDUdMS+q77U3s5X5XnQ==
X-CSE-MsgGUID: sTrhSogiRLmBSxcVtSP++w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,264,1744095600"; 
   d="scan'208";a="152502198"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.13])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2025 05:28:46 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 25 Jun 2025 15:28:43 +0300 (EEST)
To: Armin Wolf <W_Armin@gmx.de>
cc: dimich.dmb@gmail.com, Hans de Goede <hdegoede@redhat.com>, 
    kuurtb@gmail.com, corbet@lwn.net, platform-driver-x86@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/2] platform/x86: wmi: Fix WMI event enablement
In-Reply-To: <20250619221440.6737-1-W_Armin@gmx.de>
Message-ID: <e23ffd29-13db-bb11-ee06-0f1203269902@linux.intel.com>
References: <20250619221440.6737-1-W_Armin@gmx.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 20 Jun 2025, Armin Wolf wrote:

> It turns out that the Windows WMI-ACPI driver always enables/disables
> WMI events regardless of whether they are marked as expensive or not.
> This finding is further reinforced when reading the documentation of
> the WMI_FUNCTION_CONTROL_CALLBACK callback used by Windows drivers
> for enabling/disabling WMI devices:
> 
> 	The DpWmiFunctionControl routine enables or disables
> 	notification of events, and enables or disables data
> 	collection for data blocks that the driver registered
> 	as expensive to collect.
> 
> Follow this behavior to fix the WMI event used for reporting hotkey
> events on the Dell Latitude 5400 and likely many more devices.
> 
> Reported-by: Dmytro Bagrii <dimich.dmb@gmail.com>
> Closes: https://bugzilla.kernel.org/show_bug.cgi?id=220246
> Tested-by: Dmytro Bagrii <dimich.dmb@gmail.com>
> Fixes: 656f0961d126 ("platform/x86: wmi: Rework WCxx/WExx ACPI method handling")
> Signed-off-by: Armin Wolf <W_Armin@gmx.de>
> ---
>  drivers/platform/x86/wmi.c | 16 +++++++++++-----
>  1 file changed, 11 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/platform/x86/wmi.c b/drivers/platform/x86/wmi.c
> index 21b7e54bd7ab..4e86a422f05f 100644
> --- a/drivers/platform/x86/wmi.c
> +++ b/drivers/platform/x86/wmi.c
> @@ -180,16 +180,22 @@ static int wmi_device_enable(struct wmi_device *wdev, bool enable)
>  	acpi_handle handle;
>  	acpi_status status;
>  
> -	if (!(wblock->gblock.flags & ACPI_WMI_EXPENSIVE))
> -		return 0;
> -
>  	if (wblock->dev.dev.type == &wmi_type_method)
>  		return 0;
>  
> -	if (wblock->dev.dev.type == &wmi_type_event)
> +	if (wblock->dev.dev.type == &wmi_type_event) {
> +		/*
> +		 * Windows always enables/disables WMI events, even when they are
> +		 * not marked as being expensive. We follow this behavior for

Hi Armin,

Is the wording in the comment reversed? (I suspect you didn't mean to 
include "not" into that statement?)

> +		 * compatibility reasons.
> +		 */
>  		snprintf(method, sizeof(method), "WE%02X", wblock->gblock.notify_id);
> -	else
> +	} else {
> +		if (!(wblock->gblock.flags & ACPI_WMI_EXPENSIVE))
> +			return 0;
> +
>  		get_acpi_method_name(wblock, 'C', method);
> +	}
>  
>  	/*
>  	 * Not all WMI devices marked as expensive actually implement the
> 

-- 
 i.

