Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E74F14409;
	Fri, 28 Mar 2025 15:03:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743174205; cv=none; b=QIU06uJ8gHbhVfV2cIl23Yc4Yn77BlFYxYotI+XfQfjI2kdxGrN0iXaeUw2tI/uCRN9xWl0s4Fxl0vsfuXG+tDFsWnf57Hqg69E+E11Lgtef0xBDU65dNQCBJ6ovFRgO/mh0r9KYIv/VwdcjD2DRIuY4k52nkdeDlU1umy0q2zk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743174205; c=relaxed/simple;
	bh=ZxMGZHgGzbx9hGs4fxcqQqkbat441pGVdLCi2AfAqIo=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=CezngC+FkgMS4q1hstHhoqUd/MJFONg2tO3OYAzDpsLRnanpuRay6xXpf6zIKhBYrQa51hcVf4OWCyEvq/uZ8Ll7Zqhea6+ARjwfrL8oSlFuhyd+cBpd7ZzF3YiZN6NjiZHMubiPqSWwkYawJFNUpsQA28kCSMfdTuK1FCG1eEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b/J3eh5/; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b/J3eh5/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743174204; x=1774710204;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=ZxMGZHgGzbx9hGs4fxcqQqkbat441pGVdLCi2AfAqIo=;
  b=b/J3eh5/dHXRYwgE5QCUq859bON1xmIgLfxHAOIoFbe6oK1MlmIJVE1C
   yCVHXYAO0GtROR9BFnAF7JUJ5pWldb0IeDtMLnd1MbwxiusxDVecn8b8a
   KAD9IH/SubPINy1fdRON3IKghXo3E2t4NeWiUWm/pzIVMhY+gq1F2faED
   BkHkMX64G8W6n3XSpY2lM5ox1crtd4/xXyGl/otd9aZ/y8gUUE0HdRcn9
   Wwb69+J5uwnqFR+wDepjRiRO0Rwc50+Ja5WGGQpmaBQLcMEfD51BIpDyN
   75cST39kODqo5Slqdhy1RDcE1YYFNBTbf1K6G+Sz977I71I0iMmQDMbnM
   g==;
X-CSE-ConnectionGUID: NZrSHUI2QxKnvfEjuIiTZA==
X-CSE-MsgGUID: MEmRim5dSaS96nMogZWXHA==
X-IronPort-AV: E=McAfee;i="6700,10204,11387"; a="69902101"
X-IronPort-AV: E=Sophos;i="6.14,283,1736841600"; 
   d="scan'208";a="69902101"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2025 08:03:23 -0700
X-CSE-ConnectionGUID: /BsRb/TkRu+wq9tOxexG3w==
X-CSE-MsgGUID: 1Ied6SmDTx+4LZqahA64MA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,283,1736841600"; 
   d="scan'208";a="125697109"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.43])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2025 08:03:21 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Fri, 28 Mar 2025 17:03:18 +0200 (EET)
To: Kurt Borja <kuurtb@gmail.com>
cc: Armin Wolf <W_Armin@gmx.de>, Hans de Goede <hdegoede@redhat.com>, 
    platform-driver-x86@vger.kernel.org, Dell.Client.Kernel@dell.com, 
    LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v6 05/12] platform/x86: alienware-wmi-wmax: Improve
 platform profile probe
In-Reply-To: <20250313-hwm-v6-5-17b57f787d77@gmail.com>
Message-ID: <a9a21cb9-a0aa-4450-4573-51fbc674c9cc@linux.intel.com>
References: <20250313-hwm-v6-0-17b57f787d77@gmail.com> <20250313-hwm-v6-5-17b57f787d77@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 13 Mar 2025, Kurt Borja wrote:

> Get and store the AWCC system description in alienware_awcc_setup()
> instead of awcc_platform_profile_probe() and add a check for integer
> overflows to avoid misbehaviors.
> 
> While at it, replace set_bit() with it's non-atomic version __set_bit()
> because `choices` belong to this thread only.
> 
> Reviewed-by: Armin Wolf <W_Armin@gmx.de>
> Signed-off-by: Kurt Borja <kuurtb@gmail.com>
> ---
>  drivers/platform/x86/dell/alienware-wmi-wmax.c | 61 +++++++++++++++++++-------
>  1 file changed, 46 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/platform/x86/dell/alienware-wmi-wmax.c b/drivers/platform/x86/dell/alienware-wmi-wmax.c
> index a8a13779793abbcc8d1263474cac6227d524a6f5..0530f25b956f73f47c0354f40dac2910448c894e 100644
> --- a/drivers/platform/x86/dell/alienware-wmi-wmax.c
> +++ b/drivers/platform/x86/dell/alienware-wmi-wmax.c
> @@ -38,6 +38,9 @@
>  /* Some IDs have a BIT(8) flag that we ignore */
>  #define AWCC_RESOURCE_ID_MASK			GENMASK(7, 0)
>  
> +/* Arbitrary limit based on supported models */
> +#define AWCC_MAX_RES_COUNT			16
> +
>  static bool force_platform_profile;
>  module_param_unsafe(force_platform_profile, bool, 0);
>  MODULE_PARM_DESC(force_platform_profile, "Forces auto-detecting thermal profiles without checking if WMI thermal backend is available");
> @@ -212,6 +215,17 @@ struct wmax_u32_args {
>  
>  struct awcc_priv {
>  	struct wmi_device *wdev;
> +	union {
> +		u32 system_description;
> +		struct {
> +			u8 fan_count;
> +			u8 temp_count;
> +			u8 unknown_count;
> +			u8 profile_count;
> +		};
> +		u8 res_count[4];
> +	};
> +
>  	struct device *ppdev;
>  	u8 supported_profiles[PLATFORM_PROFILE_LAST];
>  };
> @@ -624,37 +638,40 @@ static int awcc_platform_profile_probe(void *drvdata, unsigned long *choices)
>  	enum platform_profile_option profile;
>  	struct awcc_priv *priv = drvdata;
>  	enum awcc_thermal_profile mode;
> -	u8 sys_desc[4];
> -	u32 first_mode;
> +	u8 id, offset = 0;
>  	u32 out_data;
>  	int ret;
> -	u8 id;
>  
> -	ret = awcc_thermal_information(priv->wdev, AWCC_OP_GET_SYSTEM_DESCRIPTION,
> -				       0, (u32 *) &sys_desc);
> -	if (ret < 0)
> -		return ret;
> -
> -	first_mode = sys_desc[0] + sys_desc[1];
> -
> -	for (u32 i = 0; i < sys_desc[3]; i++) {
> -		ret = awcc_op_get_resource_id(priv->wdev, i + first_mode, &out_data);
> +	/*
> +	 * Thermal profile IDs are listed last at offset
> +	 *	fan_count + temp_count + unknown_count
> +	 */
> +	for (unsigned int i = 0; i < ARRAY_SIZE(priv->res_count) - 1; i++)
> +		offset += priv->res_count[i];

Doesn't this change go slightly beyond what its changelog describes, could 
you please amend the changelog to explain it.
>  
> +	for (unsigned int i = 0; i < priv->profile_count; i++) {
> +		ret = awcc_op_get_resource_id(priv->wdev, i + offset, &out_data);
>  		if (ret == -EIO)
>  			return ret;
>  
> +		/*
> +		 * Some devices report an incorrect number of thermal profiles
> +		 * so the resource ID list may end prematurely
> +		 */
>  		if (ret == -EBADRQC)
>  			break;
>  
>  		id = FIELD_GET(AWCC_RESOURCE_ID_MASK, out_data);
> -		if (!is_awcc_thermal_profile_id(id))
> +		if (!is_awcc_thermal_profile_id(id)) {
> +			dev_dbg(&priv->wdev->dev, "Unmapped thermal profile ID 0x%02x\n", id);
>  			continue;
> +		}
>  
>  		mode = FIELD_GET(AWCC_THERMAL_MODE_MASK, id);
>  		profile = awcc_mode_to_platform_profile[mode];
>  		priv->supported_profiles[profile] = id;
>  
> -		set_bit(profile, choices);
> +		__set_bit(profile, choices);
>  	}
>  
>  	if (bitmap_empty(choices, PLATFORM_PROFILE_LAST))
> @@ -664,7 +681,7 @@ static int awcc_platform_profile_probe(void *drvdata, unsigned long *choices)
>  		priv->supported_profiles[PLATFORM_PROFILE_PERFORMANCE] =
>  			AWCC_THERMAL_MODE_GMODE;
>  
> -		set_bit(PLATFORM_PROFILE_PERFORMANCE, choices);
> +		__set_bit(PLATFORM_PROFILE_PERFORMANCE, choices);
>  	}
>  
>  	return 0;
> @@ -695,6 +712,20 @@ static int alienware_awcc_setup(struct wmi_device *wdev)
>  	if (!priv)
>  		return -ENOMEM;
>  
> +	ret = awcc_thermal_information(wdev, AWCC_OP_GET_SYSTEM_DESCRIPTION,
> +				       0, &priv->system_description);
> +	if (ret < 0)
> +		return ret;
> +
> +	/* Sanity check */
> +	for (unsigned int i = 0; i < ARRAY_SIZE(priv->res_count); i++) {
> +		if (priv->res_count[i] > AWCC_MAX_RES_COUNT) {
> +			dev_err(&wdev->dev, "Malformed system description: 0x%08x\n",
> +				priv->system_description);
> +			return -ENXIO;
> +		}
> +	}
> +
>  	priv->wdev = wdev;
>  	dev_set_drvdata(&wdev->dev, priv);
>  
> 
> 

-- 
 i.

