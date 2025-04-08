Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB312143748;
	Tue,  8 Apr 2025 13:01:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744117311; cv=none; b=PYrjnMk2cZauhkDdgMjZAiRQ6cMGeBaJKzJovzTJRkmz6+aUw08D96vwezGHFjcyvEKQ/HrAYuw5OTotACBtMoyYNw2eoOXPPt0UAmSJ3j63mAyh6GUHqnvpGUuoNBhbwe6O/pU8USikFXcam64c6uduVyPFx50gmRup1nlYbBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744117311; c=relaxed/simple;
	bh=3S+BmeoC6p1NXXMCLi15IH0aqogUMvG/UthfTC3l8W0=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=a00gmq8pvA1zcZumN03gP9RXxj2ffFWk//q5NtOXfmEO0xuTaUfBG9D4fm12uSnqjOy255cCA9yIe8tmUddz6Ret4FZpt5H1uYA1nZH1nW+30Ky+cBZbg9AwQ45np9KyGkjdkZYeMZExB83eQoO+YcUds3Xx/Ztaa8yagZoChlA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PAmig87C; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PAmig87C"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744117310; x=1775653310;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=3S+BmeoC6p1NXXMCLi15IH0aqogUMvG/UthfTC3l8W0=;
  b=PAmig87CfrEloA62ypPF0wkj1gezn/BhvypXArjR2fke8JAwgcgVc0lN
   0lFLarTwk/Lhyug8BKApaG6lhQGKl5eaMc77NIg36SDrwwVkCFpRt10Sg
   WfOKFIrrsq1+EthGBRnBFyVgAHhFpBCW6CIWkLDIYyunV8b24xgm3b+2q
   mToQlpMJKYsDY9r5r/VJs6tx11WBLAeLJTYHMYtGinbVKQkjwymi9We7s
   W7gdPdE4uu6nbKwkM7mpJ22skvxixMKDQiNs61LS19S6+cslMVqFGA9ZH
   bRaNmtAu/ilio6U93z3JxD5g+7bdNQhzMGxAn1vJh4nGi+8LEDziR2AWq
   w==;
X-CSE-ConnectionGUID: q60vrwSKS5i7PdyL3OI4vw==
X-CSE-MsgGUID: 2FoB3g6TRZOt7suEjQrceQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="45262605"
X-IronPort-AV: E=Sophos;i="6.15,198,1739865600"; 
   d="scan'208";a="45262605"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2025 06:01:49 -0700
X-CSE-ConnectionGUID: Huhg+IJ9SOWi28o2Z8ajow==
X-CSE-MsgGUID: Al9uaLJlSPSgaQmQXwSR3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,198,1739865600"; 
   d="scan'208";a="127997610"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.125])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2025 06:01:47 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 8 Apr 2025 16:01:44 +0300 (EEST)
To: Luke Jones <luke@ljones.dev>
cc: LKML <linux-kernel@vger.kernel.org>, Hans de Goede <hdegoede@redhat.com>, 
    platform-driver-x86@vger.kernel.org, mario.limonciello@amd.com
Subject: Re: [PATCH v8 1/8] platform/x86: asus-wmi: export symbols used for
 read/write WMI
In-Reply-To: <20250319065827.53478-2-luke@ljones.dev>
Message-ID: <7c8f4bf6-5ef7-b228-455e-85b475733591@linux.intel.com>
References: <20250319065827.53478-1-luke@ljones.dev> <20250319065827.53478-2-luke@ljones.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 19 Mar 2025, Luke Jones wrote:

> From: "Luke D. Jones" <luke@ljones.dev>
> 
> Export symbols for read/write WMI symbols using a namespace.

reading/writing ?

I don't think it needs to be mentioned they're exported into a namespace 
(it's kind of expected new things mostly use namespaces and can be 
trivially seen from the patch itself).

> Existing functions:
> - asus_wmi_evaluate_method
> - asus_wmi_set_devstate
> New function:
> - asus_wmi_get_devstate_dsts
> 
> The new function is inteded for use with DSTS WMI method only and

intended

> avoids requiring the asus_wmi driver data to select the WMI method.
> 
> Signed-off-by: Luke D. Jones <luke@ljones.dev>
> Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
> ---
>  drivers/platform/x86/asus-wmi.c            | 45 ++++++++++++++++++++--
>  include/linux/platform_data/x86/asus-wmi.h |  9 +++++
>  2 files changed, 51 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
> index cbc64d3a22ad..2784b8e6514e 100644
> --- a/drivers/platform/x86/asus-wmi.c
> +++ b/drivers/platform/x86/asus-wmi.c
> @@ -389,7 +389,7 @@ int asus_wmi_evaluate_method(u32 method_id, u32 arg0, u32 arg1, u32 *retval)
>  {
>  	return asus_wmi_evaluate_method3(method_id, arg0, arg1, 0, retval);
>  }
> -EXPORT_SYMBOL_GPL(asus_wmi_evaluate_method);
> +EXPORT_SYMBOL_NS_GPL(asus_wmi_evaluate_method, "ASUS_WMI");
>  
>  static int asus_wmi_evaluate_method5(u32 method_id,
>  		u32 arg0, u32 arg1, u32 arg2, u32 arg3, u32 arg4, u32 *retval)
> @@ -553,12 +553,51 @@ static int asus_wmi_get_devstate(struct asus_wmi *asus, u32 dev_id, u32 *retval)
>  	return 0;
>  }
>  
> -int asus_wmi_set_devstate(u32 dev_id, u32 ctrl_param,
> -				 u32 *retval)
> +
> +/**
> + * asus_wmi_get_devstate_dsts() - Get the WMI function state.
> + * @dev_id: The WMI method ID to call.
> + * @retval: A pointer to where to store the value returned from WMI.
> + *
> + * On success the return value is 0, and the retval is a valid value returned
> + * by the successful WMI function call otherwise an error is returned if the
> + * call failed, or if the WMI method ID is unsupported.

Please make return description to follow the kernel doc style guidelines.

Return: ...

Perhaps make it a bit shorter in places, e.g.,

Return: On success, %0 and @retval filled. On error, ...

Preferrably mention the errnos with %-Exx if values can be meaningfully 
discerned for different types of errors.

> + */
> +int asus_wmi_get_devstate_dsts(u32 dev_id, u32 *retval)
> +{
> +	int err;
> +
> +	err = asus_wmi_evaluate_method(ASUS_WMI_METHODID_DSTS, dev_id, 0, retval);
> +	if (err)
> +		return err;
> +
> +	if (*retval == ASUS_WMI_UNSUPPORTED_METHOD)
> +		return -ENODEV;
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_NS_GPL(asus_wmi_get_devstate_dsts, "ASUS_WMI");
> +
> +/**
> + * asus_wmi_set_devstate() - Set the WMI function state.
> + * @dev_id: The WMI function to call.
> + * @ctrl_param: The argument to be used for this WMI function.
> + * @retval: A pointer to where to store the value returned from WMI.
> + *
> + * The returned WMI function state if not checked here for error as
> + * asus_wmi_set_devstate() is not called unless first paired with a call to
> + * asus_wmi_get_devstate_dsts() to check that the WMI function is supported.

Could you please rephrase this mess? :-)

...It could have been for some similar case (I don't want to spend time 
looking from the email archives to be sure), but I think I might have 
commented this particular case already once.

> + *
> + * On success the return value is 0, and the retval is a valid value returned
> + * by the successful WMI function call. An error value is returned only if the
> + * WMI function failed.
> + */
> +int asus_wmi_set_devstate(u32 dev_id, u32 ctrl_param, u32 *retval)
>  {
>  	return asus_wmi_evaluate_method(ASUS_WMI_METHODID_DEVS, dev_id,
>  					ctrl_param, retval);
>  }
> +EXPORT_SYMBOL_NS_GPL(asus_wmi_set_devstate, "ASUS_WMI");
>  
>  /* Helper for special devices with magic return codes */
>  static int asus_wmi_get_devstate_bits(struct asus_wmi *asus,
> diff --git a/include/linux/platform_data/x86/asus-wmi.h b/include/linux/platform_data/x86/asus-wmi.h
> index a32cb8865b2f..96ff25b2b51b 100644
> --- a/include/linux/platform_data/x86/asus-wmi.h
> +++ b/include/linux/platform_data/x86/asus-wmi.h
> @@ -160,6 +160,7 @@
>  #if IS_REACHABLE(CONFIG_ASUS_WMI)
>  void set_ally_mcu_hack(bool enabled);
>  void set_ally_mcu_powersave(bool enabled);
> +int asus_wmi_get_devstate_dsts(u32 dev_id, u32 *retval);
>  int asus_wmi_set_devstate(u32 dev_id, u32 ctrl_param, u32 *retval);
>  int asus_wmi_evaluate_method(u32 method_id, u32 arg0, u32 arg1, u32 *retval);
>  #else
> @@ -175,6 +176,14 @@ static inline int asus_wmi_set_devstate(u32 dev_id, u32 ctrl_param, u32 *retval)
>  {
>  	return -ENODEV;
>  }
> +static inline int asus_wmi_get_devstate_dsts(u32 dev_id, u32 *retval)
> +{
> +	return -ENODEV;
> +}
> +static inline int asus_wmi_set_devstate(u32 dev_id, u32 ctrl_param, u32 *retval)
> +{
> +	return -ENODEV;
> +}
>  static inline int asus_wmi_evaluate_method(u32 method_id, u32 arg0, u32 arg1,
>  					   u32 *retval)
>  {
> 

-- 
 i.

