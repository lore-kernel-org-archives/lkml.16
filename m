Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED9D61F4CAC;
	Fri, 16 May 2025 11:41:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747395663; cv=none; b=dKYT9+FdudhbUns90gnaQNa8DRAtYfTs0ESEJyAcyTTLA5XvwOlBnJvGRkEGKSmANOGSOrcJwtcJyKJMMfT/mIIGFrAMAvxWRT8NDBsYGBrHXjojq761sOh8dporPe77j/4XcSbjI3Low8aICZsnASqS3NCvKnaV1qwwqWOQcFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747395663; c=relaxed/simple;
	bh=20aZcMbMNgVFfCVwfILHEP1FD+MzlukGpj2gEzXwLB0=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=JkqF7l6xlbIU+uxBRdjdInB4FnbVMd7esFxMGR39oiuCkuqadFER3rgGMFh0JqroRttQEoTT6tUzjM7XAUorJRMijNTYUAW1SHnMU+LhKWSKvDtKlxvOQzFTvAa5K8NEvDVCmH8Pdr3tGjVCDybOhzY9AoZ0igScPvNE+cjFZbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d50UH2x+; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d50UH2x+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747395662; x=1778931662;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=20aZcMbMNgVFfCVwfILHEP1FD+MzlukGpj2gEzXwLB0=;
  b=d50UH2x+UtFBCBfp1sdTEPtRmcoVspeIMBaB2gXHy3q7WoFW2auYS2V8
   GPqQWpFRsaSJ9DPOLLhXVqetE5PHG4Y8eL2Xigbnr4sXvAa+nP0zkAhpd
   twGPFSNwxMtJXo/RsxHLetAwCAl7EaPXDEV2e8IP4SZnsx69ZBaAGAUGE
   sH99mwDhNBinmXiAaoexuw2taad18z/YV4R0aRkVCTNeU2fmABg80q7Xp
   nzMpjWzKEEzOScSq3iUmOvEBZJydLWBIDaL5qw+BNWfUTVW6yn/8ZvaN+
   esTI1R7P0yk/up9CeHTEKIlizavgf1oixF4P63o9Vf/ArSxQCFk247NmA
   A==;
X-CSE-ConnectionGUID: Xg1T5rdDS5mFO9U9uw3vlQ==
X-CSE-MsgGUID: +6mN9JQUTOuc4CP12ryZsg==
X-IronPort-AV: E=McAfee;i="6700,10204,11434"; a="53036880"
X-IronPort-AV: E=Sophos;i="6.15,293,1739865600"; 
   d="scan'208";a="53036880"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2025 04:41:01 -0700
X-CSE-ConnectionGUID: Wlv0JIzOR76NfvTuHX3AVQ==
X-CSE-MsgGUID: wllDDEK7ShGk+AwirRAv2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,293,1739865600"; 
   d="scan'208";a="138714912"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.94])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2025 04:40:59 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Fri, 16 May 2025 14:40:56 +0300 (EEST)
To: Todd Brandt <todd.e.brandt@intel.com>
cc: platform-driver-x86@vger.kernel.org, xi.pardee@linux.intel.com, 
    LKML <linux-kernel@vger.kernel.org>, todd.e.brandt@linux.intel.com
Subject: Re: [PATCH] platform/x86/intel/pmc Fix Arrow Lake U/H support to
 intel_pmc_core driver
In-Reply-To: <3492e00e6e343d03e28bc58c4365b282e71e786d.1747360275.git.todd.e.brandt@intel.com>
Message-ID: <faee2ba9-dfb5-a4c4-77b0-7291400e0ad6@linux.intel.com>
References: <3492e00e6e343d03e28bc58c4365b282e71e786d.1747360275.git.todd.e.brandt@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 15 May 2025, Todd Brandt wrote:

> The ARL requires that the GMA and NPU devices both be in D3Hot in order
> for PC10 and S0iX to be achieved in S2idle. The original ARL-H/U addition
> to the intel_pmc_core driver attempted to do this by switching them to D3
> in the init and resume calls of the intel_pmc_core driver.
> 
> The problem is the ARL-H/U have a different NPU device and thus are not
> being properly set and thus S0iX does not work properly in ARL-H/U. This
> patch creates a new ARL-H specific device id that is correct and also
> adds the D3 fixup to the suspend callback. This way if the PCI devies
> drop from D3 to D0 after resume they can be corrected for the next
> suspend. Thus there is no dropout in S0iX.
> 

Shouldn't this have a Fixes tag?

> Signed-off-by: Todd Brandt <todd.e.brandt@intel.com>
> ---
>  drivers/platform/x86/intel/pmc/arl.c | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/platform/x86/intel/pmc/arl.c b/drivers/platform/x86/intel/pmc/arl.c
> index 320993bd6d31..5053e3dd8f5e 100644
> --- a/drivers/platform/x86/intel/pmc/arl.c
> +++ b/drivers/platform/x86/intel/pmc/arl.c
> @@ -681,6 +681,7 @@ static struct pmc_info arl_pmc_info_list[] = {
>  
>  #define ARL_NPU_PCI_DEV			0xad1d
>  #define ARL_GNA_PCI_DEV			0xae4c
> +#define ARL_H_NPU_PCI_DEV		0x7d1d
>  #define ARL_H_GNA_PCI_DEV		0x774c
>  /*
>   * Set power state of select devices that do not have drivers to D3
> @@ -694,7 +695,7 @@ static void arl_d3_fixup(void)
>  
>  static void arl_h_d3_fixup(void)
>  {
> -	pmc_core_set_device_d3(ARL_NPU_PCI_DEV);
> +	pmc_core_set_device_d3(ARL_H_NPU_PCI_DEV);
>  	pmc_core_set_device_d3(ARL_H_GNA_PCI_DEV);
>  }
>  
> @@ -705,6 +706,13 @@ static int arl_resume(struct pmc_dev *pmcdev)
>  	return cnl_resume(pmcdev);
>  }
>  
> +static void arl_h_suspend(struct pmc_dev *pmcdev)
> +{
> +	arl_h_d3_fixup();
> +
> +	cnl_suspend(pmcdev);
> +}
> +
>  static int arl_h_resume(struct pmc_dev *pmcdev)
>  {
>  	arl_h_d3_fixup();
> @@ -739,7 +747,7 @@ struct pmc_dev_info arl_h_pmc_dev = {
>  	.dmu_guid = ARL_PMT_DMU_GUID,
>  	.regmap_list = arl_pmc_info_list,
>  	.map = &mtl_socm_reg_map,
> -	.suspend = cnl_suspend,
> +	.suspend = arl_h_suspend,
>  	.resume = arl_h_resume,
>  	.init = arl_h_core_init,
>  };
> 

-- 
 i.

