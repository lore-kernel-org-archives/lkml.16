Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CF351BFE00;
	Fri, 28 Mar 2025 14:51:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743173495; cv=none; b=NbSv8uaFPQLzCpEnUTb9wKh5FeROv2/eMTbSjIKDLCjbP8IFdlgSFS7AkWZ5AkYEBq4uPw+bkDq+ggiab9V8rh9O18RYRYBYOlzUockj1IcMqswC1EtQDdWdCtogMYj0Li84475IsQaqAWbNAsyhz0UN21N6FpUFcBmSryjBKo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743173495; c=relaxed/simple;
	bh=smwC0unOFGh8PfOUsx/7/ay83esrI2NLTBGHJtfTtkA=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=cLEI3Kn355ER2hkLkQsTEn5aGYbsL004dQjYSDl0NMPtGoZmfQrpD+jYrBtTLuVOZF4f+Rk9gfjCEgVsEcHJ1IAWCJrsHP7hWUltVrd+goi9+JDwwFM6phMKhc4DPhQPnxiJYGxr1HBQelTPhcfBLPtuH0psUPNBdwRaLYoqvXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bOC6m7Y/; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bOC6m7Y/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743173493; x=1774709493;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=smwC0unOFGh8PfOUsx/7/ay83esrI2NLTBGHJtfTtkA=;
  b=bOC6m7Y/ijeWqOdxkSsuIGWvhHe5pTVqbgJlsj2ihR5HG8xCzFA7s04E
   wLCSr8jWuqDbOr5HRXsVtSdh6zltlxeX5KSK6aVbUPWjg76LqmPZsNe94
   0E51yWWAJoh4WnI2snMfUmwM7VwGGcLy7WhDKNb+7feduc25hFkBIi8Mg
   QzImybcE3ZdzCpwAHGEQxTwJYBmCvHBCDCG0wpSo072ECbElDCkAWZJG2
   av+j2OEl9VFbPVma25Kmr8L2OxUzB7A41Vkg00U+QOG344z1BYkpcpVd4
   uWvt899IM86EL6ChQgp19y1d249oCLyvLTG2AEWlLFSrNOOI+oC4lzl7W
   w==;
X-CSE-ConnectionGUID: LVm+HXy1S5e/E+6G1WFSxg==
X-CSE-MsgGUID: KcWB0fLNSryiXqyjybO97A==
X-IronPort-AV: E=McAfee;i="6700,10204,11387"; a="44699060"
X-IronPort-AV: E=Sophos;i="6.14,283,1736841600"; 
   d="scan'208";a="44699060"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2025 07:51:33 -0700
X-CSE-ConnectionGUID: X+n/PXcGT1yhRck8hvdgeg==
X-CSE-MsgGUID: 8CUGKNeFTYypYfLJi0FKtw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,283,1736841600"; 
   d="scan'208";a="125920445"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.43])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2025 07:51:30 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Fri, 28 Mar 2025 16:51:27 +0200 (EET)
To: Kurt Borja <kuurtb@gmail.com>
cc: Armin Wolf <W_Armin@gmx.de>, Hans de Goede <hdegoede@redhat.com>, 
    platform-driver-x86@vger.kernel.org, Dell.Client.Kernel@dell.com, 
    LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v6 03/12] platform/x86: alienware-wmi-wmax: Improve
 internal AWCC API
In-Reply-To: <20250313-hwm-v6-3-17b57f787d77@gmail.com>
Message-ID: <45699e14-6d51-8116-b252-a7a20ffe8e8b@linux.intel.com>
References: <20250313-hwm-v6-0-17b57f787d77@gmail.com> <20250313-hwm-v6-3-17b57f787d77@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 13 Mar 2025, Kurt Borja wrote:

> Inline all AWCC WMI helper methods and directly return the newly
> introduced __awcc_wmi_command() helper to simplify implementation.
> 
> Drop awcc_thermal_control() in favor of awcc_op_activate_profile().
> 
> Add awcc_op_get_resource_id(), awcc_op_get_current_profile() and a new
> failure code.
> 
> Reviewed-by: Armin Wolf <W_Armin@gmx.de>
> Signed-off-by: Kurt Borja <kuurtb@gmail.com>
> ---
>  drivers/platform/x86/dell/alienware-wmi-wmax.c | 150 +++++++++++++++----------
>  1 file changed, 91 insertions(+), 59 deletions(-)
> 
> diff --git a/drivers/platform/x86/dell/alienware-wmi-wmax.c b/drivers/platform/x86/dell/alienware-wmi-wmax.c
> index 80aefba5b22d6b4ac18aeb2ca356f8c911150abd..b9dbfdc8096c571722b3c7ac3e73989e235e2eb9 100644
> --- a/drivers/platform/x86/dell/alienware-wmi-wmax.c
> +++ b/drivers/platform/x86/dell/alienware-wmi-wmax.c
> @@ -32,6 +32,7 @@
>  #define AWCC_THERMAL_MODE_GMODE			0xAB
>  
>  #define AWCC_FAILURE_CODE			0xFFFFFFFF
> +#define AWCC_FAILURE_CODE_2			0xFFFFFFFE
>  #define AWCC_THERMAL_TABLE_MASK			GENMASK(7, 4)
>  #define AWCC_THERMAL_MODE_MASK			GENMASK(3, 0)
>  /* Some IDs have a BIT(8) flag that we ignore */
> @@ -443,8 +444,7 @@ const struct attribute_group wmax_deepsleep_attribute_group = {
>  };
>  
>  /*
> - * Thermal Profile control
> - *  - Provides thermal profile control through the Platform Profile API
> + * AWCC Helpers
>   */
>  static bool is_awcc_thermal_profile_id(u8 code)
>  {
> @@ -463,72 +463,107 @@ static bool is_awcc_thermal_profile_id(u8 code)
>  	return false;
>  }
>  
> -static int awcc_thermal_information(struct wmi_device *wdev, u8 operation,
> -				    u8 arg, u32 *out_data)
> +static int __awcc_wmi_command(struct wmi_device *wdev, u32 method_id,
> +			      struct wmax_u32_args *args, u32 *out)

Why did you put __ into the name?

Some people oppose __ prefix altogether, I don't entirely agree with their 
stance but I don't really understand what the underscores here signify.

Normally I see __ being used in three main cases:
- non-__ variant does some locking around the call too the __ func (though 
  many funcs use _locked postfix these days).
- func is "dangerous" and caller has to really know what he/she is
  doing / be careful for some reason.
- non-__ variant exists and somebody cannot come up better name for the
  internally called function (not very good use case, IMHO)

I don't see any of those apply here, this looks just an ordinary wrapper 
function, thus the question.

>  {
> -	struct wmax_u32_args in_args = {
> +	int ret;
> +
> +	ret = alienware_wmi_command(wdev, method_id, args, sizeof(*args), out);
> +	if (ret)
> +		return ret;
> +
> +	if (*out == AWCC_FAILURE_CODE || *out == AWCC_FAILURE_CODE_2)
> +		return -EBADRQC;
> +
> +	return 0;
> +}
> +
> +static inline int awcc_thermal_information(struct wmi_device *wdev, u8 operation,
> +					   u8 arg, u32 *out)
> +{
> +	struct wmax_u32_args args = {
>  		.operation = operation,
>  		.arg1 = arg,
>  		.arg2 = 0,
>  		.arg3 = 0,
>  	};
> -	int ret;
>  
> -	ret = alienware_wmi_command(wdev, AWCC_METHOD_THERMAL_INFORMATION,
> -				    &in_args, sizeof(in_args), out_data);
> -	if (ret < 0)
> -		return ret;
> -
> -	if (*out_data == AWCC_FAILURE_CODE)
> -		return -EBADRQC;
> -
> -	return 0;
> +	return __awcc_wmi_command(wdev, AWCC_METHOD_THERMAL_INFORMATION, &args, out);
>  }
>  
> -static int awcc_thermal_control(struct wmi_device *wdev, u8 profile)
> +static inline int awcc_game_shift_status(struct wmi_device *wdev, u8 operation,

As a general rule, don't add inline to .c files, we leave figuring 
inlining out to the compiler.

> +					 u32 *out)
>  {
> -	struct wmax_u32_args in_args = {
> -		.operation = AWCC_OP_ACTIVATE_PROFILE,
> -		.arg1 = profile,
> -		.arg2 = 0,
> -		.arg3 = 0,
> -	};
> -	u32 out_data;
> -	int ret;
> -
> -	ret = alienware_wmi_command(wdev, AWCC_METHOD_THERMAL_CONTROL,
> -				    &in_args, sizeof(in_args), &out_data);
> -	if (ret)
> -		return ret;
> -
> -	if (out_data == AWCC_FAILURE_CODE)
> -		return -EBADRQC;
> -
> -	return 0;
> -}
> -
> -static int awcc_game_shift_status(struct wmi_device *wdev, u8 operation,
> -				  u32 *out_data)
> -{
> -	struct wmax_u32_args in_args = {
> +	struct wmax_u32_args args = {
>  		.operation = operation,
>  		.arg1 = 0,
>  		.arg2 = 0,
>  		.arg3 = 0,
>  	};
> -	int ret;
>  
> -	ret = alienware_wmi_command(wdev, AWCC_METHOD_GAME_SHIFT_STATUS,
> -				    &in_args, sizeof(in_args), out_data);
> -	if (ret < 0)
> -		return ret;
> -
> -	if (*out_data == AWCC_FAILURE_CODE)
> -		return -EOPNOTSUPP;
> -
> -	return 0;
> +	return __awcc_wmi_command(wdev, AWCC_METHOD_GAME_SHIFT_STATUS, &args, out);
>  }
>  
> +/**
> + * awcc_op_get_resource_id - Get the resource ID at a given index
> + * @wdev: AWCC WMI device
> + * @index: Index
> + * @out: Value returned by the WMI call
> + *
> + * Get the resource ID at a given index. Resource IDs are listed in the

Use @index to refer to the argument.

> + * following order:
> + *
> + *	- Fan IDs
> + *	- Sensor IDs
> + *	- Unknown IDs
> + *	- Thermal Profile IDs
> + *
> + * The total number of IDs of a given type can be obtained with
> + * AWCC_OP_GET_SYSTEM_DESCRIPTION.
> + *
> + * Return: 0 on success, -errno on failure
> + */
> +static inline int awcc_op_get_resource_id(struct wmi_device *wdev, u8 index, u32 *out)
> +{
> +	struct wmax_u32_args args = {
> +		.operation = AWCC_OP_GET_RESOURCE_ID,
> +		.arg1 = index,
> +		.arg2 = 0,
> +		.arg3 = 0,
> +	};
> +
> +	return __awcc_wmi_command(wdev, AWCC_METHOD_THERMAL_INFORMATION, &args, out);
> +}
> +
> +static inline int awcc_op_get_current_profile(struct wmi_device *wdev, u32 *out)
> +{
> +	struct wmax_u32_args args = {
> +		.operation = AWCC_OP_GET_CURRENT_PROFILE,
> +		.arg1 = 0,
> +		.arg2 = 0,
> +		.arg3 = 0,
> +	};
> +
> +	return __awcc_wmi_command(wdev, AWCC_METHOD_THERMAL_INFORMATION, &args, out);
> +}
> +
> +static inline int awcc_op_activate_profile(struct wmi_device *wdev, u8 profile)
> +{
> +	struct wmax_u32_args args = {
> +		.operation = AWCC_OP_ACTIVATE_PROFILE,
> +		.arg1 = profile,
> +		.arg2 = 0,
> +		.arg3 = 0,
> +	};
> +	u32 out;
> +
> +	return __awcc_wmi_command(wdev, AWCC_METHOD_THERMAL_CONTROL, &args, &out);
> +}
> +
> +/*
> + * Thermal Profile control
> + *  - Provides thermal profile control through the Platform Profile API
> + */
>  static int awcc_platform_profile_get(struct device *dev,
>  				     enum platform_profile_option *profile)
>  {
> @@ -536,10 +571,8 @@ static int awcc_platform_profile_get(struct device *dev,
>  	u32 out_data;
>  	int ret;
>  
> -	ret = awcc_thermal_information(priv->wdev, AWCC_OP_GET_CURRENT_PROFILE,
> -				       0, &out_data);
> -
> -	if (ret < 0)
> +	ret = awcc_op_get_current_profile(priv->wdev, &out_data);
> +	if (ret)
>  		return ret;
>  
>  	if (out_data == AWCC_THERMAL_MODE_GMODE) {
> @@ -550,7 +583,7 @@ static int awcc_platform_profile_get(struct device *dev,
>  	if (!is_awcc_thermal_profile_id(out_data))
>  		return -ENODATA;
>  
> -	out_data &= AWCC_THERMAL_MODE_MASK;
> +	out_data = FIELD_GET(AWCC_THERMAL_MODE_MASK, out_data);

Should this be part of the earlier patch??

>  	*profile = awcc_mode_to_platform_profile[out_data];
>  
>  	return 0;
> @@ -583,8 +616,8 @@ static int awcc_platform_profile_set(struct device *dev,
>  		}
>  	}
>  
> -	return awcc_thermal_control(priv->wdev,
> -				    priv->supported_thermal_profiles[profile]);
> +	return awcc_op_activate_profile(priv->wdev,
> +					priv->supported_thermal_profiles[profile]);
>  }
>  
>  static int awcc_platform_profile_probe(void *drvdata, unsigned long *choices)
> @@ -606,8 +639,7 @@ static int awcc_platform_profile_probe(void *drvdata, unsigned long *choices)
>  	first_mode = sys_desc[0] + sys_desc[1];
>  
>  	for (u32 i = 0; i < sys_desc[3]; i++) {
> -		ret = awcc_thermal_information(priv->wdev, AWCC_OP_GET_RESOURCE_ID,
> -					       i + first_mode, &out_data);
> +		ret = awcc_op_get_resource_id(priv->wdev, i + first_mode, &out_data);
>  
>  		if (ret == -EIO)
>  			return ret;
> 
> 

-- 
 i.

