Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E66C27703E;
	Mon, 19 May 2025 12:57:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747659431; cv=none; b=nBj5VnBzi0njAh+EsHVScg17GbwcxctE0+QONZW+7iXww2jLOFZDY7pJzXR4PO+qxU0ex3rcbGdGtDTvXkWXlRnJajfw0Ir2Y3JR43WXAFn4mk9c13g83zKR0NXe/J1mL/p/j6BpMrygf7mcUtXIKP2mpjif62CQHuDDXvjh340=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747659431; c=relaxed/simple;
	bh=+Hj/d6ssy2LIaoVs+qT/pmyMB1aHgw67hcTEXsHqb8Y=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=eVodSwzoMaOeTjaqBEku64bJSJIqc+JC8+GvS0ikD3gmwW82d0ql1LxnWyxNgI+zOQ4Pd7l+/F0KxAp8hX/s3OV9LQOU5lRc0xkZf+o5/xPFTQTt2iJft+YlRhEJ+qqv6u71oEGtNHD6DtBM7FeLHyYHihalXedJApjpc3BvPPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kArS0jIK; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kArS0jIK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747659429; x=1779195429;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=+Hj/d6ssy2LIaoVs+qT/pmyMB1aHgw67hcTEXsHqb8Y=;
  b=kArS0jIKrUVTyZ7nN8kt3EDHvzpWC+HNHZsrINIWJyFy/XUjlaAwuS9M
   2R5a2ThzbAy3TUpSP3HxypxbY1VqSRfLtxiwzuRyfUHiWglt8ADQfgtfg
   jnmK/gNGlV8YuQ42MqP4HusOZmHLLLpDeiO5D4tk9zjhbNkW8s4BhU6S3
   IkmdivyzIhict/slh4eUlpUgjenxIqIXvJ8ZM9aKmjtRYe4iHIzO/MLRU
   LWLOhfhO+30RkXhnb5kNvyPc5uZ6h9sVbfWxLEZ46pY3vDe3AnyZAJY0N
   hNm9yRAGFNENshFgQ/HtBc7SrBVEHzIPddhF/fdAZU9RFginzOKw04cjU
   g==;
X-CSE-ConnectionGUID: 1Scl1h1DSKeu9hg+h4oI4w==
X-CSE-MsgGUID: 2xwr/dvORmif95NRxDykqQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11438"; a="66970070"
X-IronPort-AV: E=Sophos;i="6.15,300,1739865600"; 
   d="scan'208";a="66970070"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2025 05:57:08 -0700
X-CSE-ConnectionGUID: 6yq14e2aTuOsVRMsmjF0VA==
X-CSE-MsgGUID: 8WEbuWthT/uztNSZMGFpUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,300,1739865600"; 
   d="scan'208";a="140248978"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.35])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2025 05:56:59 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 19 May 2025 15:56:55 +0300 (EEST)
To: Mark Pearson <mpearson-lenovo@squebb.ca>
cc: Hans de Goede <hdegoede@redhat.com>, platform-driver-x86@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] platform/x86: think-lmi: Fix attribute name usage for
 non-compliant items
In-Reply-To: <20250517023825.2968200-1-mpearson-lenovo@squebb.ca>
Message-ID: <0fbeced8-a225-4151-dda5-086490f8345a@linux.intel.com>
References: <mpearson-lenovo@squebb.ca> <20250517023825.2968200-1-mpearson-lenovo@squebb.ca>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 16 May 2025, Mark Pearson wrote:

> A few, quite rare, WMI attributes have names that are not compatible with
> filenames. e.g. "Intel VT for Directed I/O (VT-d)".

filenames. -> filenames,

> For these cases the '/' gets replaced with '\' for display, but doesn't
> get switched again when doing the WMI access.
> 
> Fix this by keeping the original attribute name and using that for sending
> commands to the BIOS
> 
> Signed-off-by: Mark Pearson <mpearson-lenovo@squebb.ca>

Fixes tag?

> ---
>  drivers/platform/x86/think-lmi.c | 27 +++++++++++++++------------
>  drivers/platform/x86/think-lmi.h |  1 +
>  2 files changed, 16 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/platform/x86/think-lmi.c b/drivers/platform/x86/think-lmi.c
> index 0fc275e461be..be01085055a1 100644
> --- a/drivers/platform/x86/think-lmi.c
> +++ b/drivers/platform/x86/think-lmi.c
> @@ -137,6 +137,7 @@ MODULE_PARM_DESC(debug_support, "Enable debug command support");
>   * You must reboot the computer before the changes will take effect.
>   */
>  #define LENOVO_CLEAR_BIOS_CERT_GUID  "B2BC39A7-78DD-4D71-B059-A510DEC44890"
> +
>  /*
>   * Name: CertToPassword
>   * Description: Switch from certificate to password authentication.

An unrelated change.

> @@ -1061,8 +1062,8 @@ static ssize_t current_value_store(struct kobject *kobj,
>  			ret = -EINVAL;
>  			goto out;
>  		}
> -		set_str = kasprintf(GFP_KERNEL, "%s,%s,%s", setting->display_name,
> -					new_setting, tlmi_priv.pwd_admin->signature);
> +		set_str = kasprintf(GFP_KERNEL, "%s,%s,%s", setting->name,
> +				    new_setting, tlmi_priv.pwd_admin->signature);
>  		if (!set_str) {
>  			ret = -ENOMEM;
>  			goto out;
> @@ -1092,7 +1093,7 @@ static ssize_t current_value_store(struct kobject *kobj,
>  				goto out;
>  		}
>  
> -		set_str = kasprintf(GFP_KERNEL, "%s,%s;", setting->display_name,
> +		set_str = kasprintf(GFP_KERNEL, "%s,%s;", setting->name,
>  				    new_setting);
>  		if (!set_str) {
>  			ret = -ENOMEM;
> @@ -1120,11 +1121,11 @@ static ssize_t current_value_store(struct kobject *kobj,
>  		}
>  
>  		if (auth_str)
> -			set_str = kasprintf(GFP_KERNEL, "%s,%s,%s", setting->display_name,
> -					new_setting, auth_str);
> +			set_str = kasprintf(GFP_KERNEL, "%s,%s,%s", setting->name,
> +					    new_setting, auth_str);
>  		else
> -			set_str = kasprintf(GFP_KERNEL, "%s,%s;", setting->display_name,
> -					new_setting);
> +			set_str = kasprintf(GFP_KERNEL, "%s,%s;", setting->name,
> +					    new_setting);
>  		if (!set_str) {
>  			ret = -ENOMEM;
>  			goto out;
> @@ -1629,9 +1630,6 @@ static int tlmi_analyze(struct wmi_device *wdev)
>  			continue;
>  		}
>  
> -		/* It is not allowed to have '/' for file name. Convert it into '\'. */
> -		strreplace(item, '/', '\\');
> -
>  		/* Remove the value part */
>  		strreplace(item, ',', '\0');
>  
> @@ -1644,11 +1642,16 @@ static int tlmi_analyze(struct wmi_device *wdev)
>  		}
>  		setting->wdev = wdev;
>  		setting->index = i;
> +
> +		strscpy(setting->name, item);
> +		/* It is not allowed to have '/' for file name. Convert it into '\'. */
> +		strreplace(item, '/', '\\');
>  		strscpy(setting->display_name, item);
> +
>  		/* If BIOS selections supported, load those */
>  		if (tlmi_priv.can_get_bios_selections) {
> -			ret = tlmi_get_bios_selections(setting->display_name,
> -					&setting->possible_values);
> +			ret = tlmi_get_bios_selections(setting->name,
> +						       &setting->possible_values);
>  			if (ret || !setting->possible_values)
>  				pr_info("Error retrieving possible values for %d : %s\n",
>  						i, setting->display_name);
> diff --git a/drivers/platform/x86/think-lmi.h b/drivers/platform/x86/think-lmi.h
> index a80452482227..9b014644d316 100644
> --- a/drivers/platform/x86/think-lmi.h
> +++ b/drivers/platform/x86/think-lmi.h
> @@ -90,6 +90,7 @@ struct tlmi_attr_setting {
>  	struct kobject kobj;
>  	struct wmi_device *wdev;
>  	int index;
> +	char name[TLMI_SETTINGS_MAXLEN];
>  	char display_name[TLMI_SETTINGS_MAXLEN];
>  	char *possible_values;
>  };
> 

-- 
 i.

