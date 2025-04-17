Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50C671DE3C8;
	Thu, 17 Apr 2025 10:57:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744887447; cv=none; b=m7OzJH9vKy3hl1KfQY69pufQ0UoNDg5oeuTl+lKNY1UVSuKIL4ChZLfVrUqrnrFW7Rc69is+sZVENWkoaITqzC9ePg3TnDruKPyulSC16FiQ4RBv6N1aV7LmOfOvBLMKS/vTztEpBp7rqJLrk3fSxL4FrS69/V3/SQgDVW9pbew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744887447; c=relaxed/simple;
	bh=hFOa2BS0aExJdAHSEfdu2JskXGSCCJ6rQUiOk0oimqM=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=XKYjfmUCdF7Jx3zvir1WELsup8JlWWBTCJguc0QEEBw9ho4DHyQPU6kaejSG4ejXODMgooEyEI2qDKU6G+gqs276NaR/pblOo0+KY3LHLqD9/dhSNQC4OGtvp7Vht2h42/+Im6/RXvmxDf9O9g8aGPkM18y4LOGx3ojihi9AC0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d01UBAQe; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d01UBAQe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744887445; x=1776423445;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=hFOa2BS0aExJdAHSEfdu2JskXGSCCJ6rQUiOk0oimqM=;
  b=d01UBAQeH64UC23PtBF8AejbYpjd3FHT3Ba9fdaGvsAP0z6QdmEtRlrZ
   63dJMytO7UzTU9avUY1n4OUmBzlvLU5X/WP65xVpKDfMu44nbI1XJiDu3
   eb0Uy2bk3/HrY79A1JzEEqaLWcAFgSTxgz6nRTX6Z7CthCyWaDnI4Gokw
   Dkci7gZ3XboDOqwKpfqb3YFqaKh5Xw13TsoQrW8hN24JrZlp7egL9ayVm
   isTT/IhQZbIf8+6/pF+skla2Y8SDHVREc2fq+7xaSyFyBjJtwXrEtO4Vk
   yo9AZJwj2w0g1u9PJcha4ZfbkFtJpmWIXVUP1XxwsPYLdcpOJfHls7IO1
   Q==;
X-CSE-ConnectionGUID: uBe6ZhEMR8Sh32+DRJ0RkQ==
X-CSE-MsgGUID: Sw4Uj+kHRueLZwb0fyrKVg==
X-IronPort-AV: E=McAfee;i="6700,10204,11405"; a="46479183"
X-IronPort-AV: E=Sophos;i="6.15,218,1739865600"; 
   d="scan'208";a="46479183"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2025 03:57:24 -0700
X-CSE-ConnectionGUID: v/7bF07rTAuPdWrC31WDEg==
X-CSE-MsgGUID: PTVWmvVNT+upn4DkBReWGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,218,1739865600"; 
   d="scan'208";a="131304273"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.144])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2025 03:57:22 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Thu, 17 Apr 2025 13:57:19 +0300 (EEST)
To: Kurt Borja <kuurtb@gmail.com>
cc: Hans de Goede <hdegoede@redhat.com>, Armin Wolf <W_Armin@gmx.de>, 
    Mario Limonciello <mario.limonciello@amd.com>, 
    platform-driver-x86@vger.kernel.org, Dell.Client.Kernel@dell.com, 
    LKML <linux-kernel@vger.kernel.org>, 
    Dan Carpenter <dan.carpenter@linaro.org>
Subject: Re: [PATCH] platform/x86: alienware-wmi-wmax: Fix uninitialized
 variable due to bad error handling
In-Reply-To: <20250416-smatch-fix-v1-1-35491b462d8f@gmail.com>
Message-ID: <14424f02-c800-a482-4d23-fd05f61cec82@linux.intel.com>
References: <20250416-smatch-fix-v1-1-35491b462d8f@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 16 Apr 2025, Kurt Borja wrote:

> wmax_thermal_information() may also return -ENOMSG, which would leave
> `id` uninitialized in thermal_profile_probe.
> 
> Reorder and modify logic to catch all errors.
> 
> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> Closes: https://lore.kernel.org/r/Z_-KVqNbD9ygvE2X@stanley.mountain
> Fixes: 27e9e6339896 ("platform/x86: alienware-wmi: Refactor thermal control methods")
> Signed-off-by: Kurt Borja <kuurtb@gmail.com>
> ---
> Hi all,
> 
> @Ilpo: This will definitely conflict with the for-next branch when
> merging.

Okay, thanks for the heads up (I'll eventually merge fixes into for-next
once I merge this fix).

> Also, the fixes tag references a commit from before the split (same
> series though), but ofc this fix is meant to be applied on top of it
> (fixes branch). Is this ok or would it be better to change the fixes
> tag to the "split" commit?

Pointing to the correct commit is preferred.

It doesn't look very likely that the series would be "split" such that 
only a part of it appears in a specific stable kernel so the difference 
shouldn't matter anyway.

In general, stable people would just send you a notification if something 
cannot be backported to some stable version due to a conflict, and they'd 
depend on you to submit the amended backport anyway so it's not much extra 
"work" for them if something ends up conflicting. (And I don't think your 
inbox would be exactly filling from stable notifications unlike mine --- 
one of those joys of being a subsystem maintainer).

-- 
 i.

> ---
>  drivers/platform/x86/dell/alienware-wmi-wmax.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/platform/x86/dell/alienware-wmi-wmax.c b/drivers/platform/x86/dell/alienware-wmi-wmax.c
> index 3d3014b5adf046c94c1ebf39a0e28a92622b40d6..b8e71f06fdde347573bff5c27a9ba53a0efcacae 100644
> --- a/drivers/platform/x86/dell/alienware-wmi-wmax.c
> +++ b/drivers/platform/x86/dell/alienware-wmi-wmax.c
> @@ -607,12 +607,10 @@ static int thermal_profile_probe(void *drvdata, unsigned long *choices)
>  	for (u32 i = 0; i < sys_desc[3]; i++) {
>  		ret = wmax_thermal_information(priv->wdev, WMAX_OPERATION_LIST_IDS,
>  					       i + first_mode, &out_data);
> -
> -		if (ret == -EIO)
> -			return ret;
> -
>  		if (ret == -EBADRQC)
>  			break;
> +		if (ret)
> +			return ret;
>  
>  		if (!is_wmax_thermal_code(out_data))
>  			continue;
> 
> ---
> base-commit: fcf27a6a926fd9eeba39e9c3fde43c9298fe284e
> change-id: 20250416-smatch-fix-d1191e2514f5
> 
> Best regards,
> 
