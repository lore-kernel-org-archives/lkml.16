Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DCB41F37C6;
	Fri,  7 Feb 2025 13:44:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738935892; cv=none; b=OqPLGJM/zNO/MbQcuw0qYAW8lQbdaSOMMJZhFsYusAZxG1pb9MfL3yB+V/6hCU03WOSi8mBtDhTlENNEp/VPtLbwxO6XLQqdGC+KoAXWof1aw3H6QkOm8gLSMiWyAaOnqUHy4tRcVvBg7Ro8Qkgn/hZf3AKPsAWhZdBO/2tmd2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738935892; c=relaxed/simple;
	bh=1zL7Fg4vCZS/oEqct4wtAyYB2ekpq1aQUl/RbG8Z+wg=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=oGi04pNrifwxYuI7dQa4Q4itcW83+5gEu4w8fjrb1jMcXzyYi/Iph6+AcMmgMID6lIwosFfVzXRY+yieIK1+AtOI5eJH47q5f9AzEafgskGwfZ3LFTgk4EEr4J5lXYqtVAGSxdz4+dP5g0HaH0pFsLvaSOE+j74wfULksDKrazc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CysocBJC; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CysocBJC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738935890; x=1770471890;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=1zL7Fg4vCZS/oEqct4wtAyYB2ekpq1aQUl/RbG8Z+wg=;
  b=CysocBJCrLv8dCnPXiHUklRZ8X3mnLun29d7zL5AIjAuv3IagP7Ag313
   HOxQctwfQ5glvkgwk1vV6UGE3Tlpisjbf977LOjQU5tK/uGpWvAqBEwNf
   WezMZ0t7lLNUhzcVC1kBGhOY5nBo3QdFaZ2IEFkSyseimXjQAK2rD45yF
   UCB7KFCwa4as2n4W1fqhShrNfdZq93Nanw+H9JLQg1aUEMXMgXhh2VeGJ
   pFYMLojuGCTSuHKOdvI1agZa948clok/qfy+F44KDHGb91+Zk33a+gpuW
   PcSWN69DLaOSwt8mVEufgMXGx/5CzWOz6bC0kgxyEk60MyvMmIMYEs6sk
   w==;
X-CSE-ConnectionGUID: Klugmw40TGWIgjWi7nFVtw==
X-CSE-MsgGUID: XRagqok/TPyOE605TDXb2A==
X-IronPort-AV: E=McAfee;i="6700,10204,11338"; a="42417308"
X-IronPort-AV: E=Sophos;i="6.13,267,1732608000"; 
   d="scan'208";a="42417308"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2025 05:44:50 -0800
X-CSE-ConnectionGUID: NZv3X7+xSBa3hvzjmpdOFA==
X-CSE-MsgGUID: qpZyKO/IQaKqv2ruqstzCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,267,1732608000"; 
   d="scan'208";a="116575950"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.116])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2025 05:44:47 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Fri, 7 Feb 2025 15:44:44 +0200 (EET)
To: Kurt Borja <kuurtb@gmail.com>
cc: platform-driver-x86@vger.kernel.org, Armin Wolf <W_Armin@gmx.de>, 
    Mario Limonciello <mario.limonciello@amd.com>, 
    Hans de Goede <hdegoede@redhat.com>, Dell.Client.Kernel@dell.com, 
    LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v8 05/14] platform/x86: alienware-wmi: Refactor hdmi,
 amplifier, deepslp methods
In-Reply-To: <20250203182713.27446-6-kuurtb@gmail.com>
Message-ID: <2a6d6549-6033-65f3-838c-8ac9332b0749@linux.intel.com>
References: <20250203182713.27446-1-kuurtb@gmail.com> <20250203182713.27446-6-kuurtb@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 3 Feb 2025, Kurt Borja wrote:

> Refactor show/store methods for hdmi, amplifier, deepslp sysfs groups to
> use alienware_wmi_command() instead of alienware_wmax_command() which
> uses deprecated WMI methods.
> 
> Reviewed-by: Armin Wolf <W_Armin@gmx.de>
> Signed-off-by: Kurt Borja <kuurtb@gmail.com>
> ---
>  drivers/platform/x86/dell/alienware-wmi.c | 80 +++++++++++++----------
>  1 file changed, 45 insertions(+), 35 deletions(-)
> 
> diff --git a/drivers/platform/x86/dell/alienware-wmi.c b/drivers/platform/x86/dell/alienware-wmi.c
> index 525d25a1fa6c..412caf0e3b84 100644
> --- a/drivers/platform/x86/dell/alienware-wmi.c
> +++ b/drivers/platform/x86/dell/alienware-wmi.c
> @@ -711,53 +711,57 @@ static acpi_status alienware_wmax_command(void *in_args, size_t in_size,
>  static ssize_t cable_show(struct device *dev, struct device_attribute *attr,
>  			  char *buf)
>  {
> +	struct alienfx_platdata *pdata = dev_get_platdata(dev);
>  	struct wmax_basic_args in_args = {
>  		.arg = 0,
>  	};
> -	acpi_status status;
>  	u32 out_data;
> +	int ret;
> +
> +	ret = alienware_wmi_command(pdata->wdev, WMAX_METHOD_HDMI_CABLE,
> +				    &in_args, sizeof(in_args), &out_data);
>  
> -	status =
> -	    alienware_wmax_command(&in_args, sizeof(in_args),
> -				   WMAX_METHOD_HDMI_CABLE, &out_data);
> -	if (ACPI_SUCCESS(status)) {
> +	if (!ret) {
>  		if (out_data == 0)
>  			return sysfs_emit(buf, "[unconnected] connected unknown\n");
>  		else if (out_data == 1)
>  			return sysfs_emit(buf, "unconnected [connected] unknown\n");
>  	}
> -	pr_err("alienware-wmi: unknown HDMI cable status: %d\n", status);
> +
> +	pr_err("alienware-wmi: unknown HDMI cable status: %d\n", ret);
>  	return sysfs_emit(buf, "unconnected connected [unknown]\n");
>  }
>  
>  static ssize_t source_show(struct device *dev, struct device_attribute *attr,
>  			   char *buf)
>  {
> +	struct alienfx_platdata *pdata = dev_get_platdata(dev);
>  	struct wmax_basic_args in_args = {
>  		.arg = 0,
>  	};
> -	acpi_status status;
>  	u32 out_data;
> +	int ret;
>  
> -	status =
> -	    alienware_wmax_command(&in_args, sizeof(in_args),
> -				   WMAX_METHOD_HDMI_STATUS, &out_data);
> +	ret = alienware_wmi_command(pdata->wdev, WMAX_METHOD_HDMI_STATUS,
> +				    &in_args, sizeof(in_args), &out_data);
>  
> -	if (ACPI_SUCCESS(status)) {
> +	if (!ret) {
>  		if (out_data == 1)
>  			return sysfs_emit(buf, "[input] gpu unknown\n");
>  		else if (out_data == 2)
>  			return sysfs_emit(buf, "input [gpu] unknown\n");
>  	}
> -	pr_err("alienware-wmi: unknown HDMI source status: %u\n", status);
> +
> +	pr_err("alienware-wmi: unknown HDMI source status: %u\n", ret);
>  	return sysfs_emit(buf, "input gpu [unknown]\n");
>  }
>  
>  static ssize_t source_store(struct device *dev, struct device_attribute *attr,
>  			    const char *buf, size_t count)
>  {
> +	struct alienfx_platdata *pdata = dev_get_platdata(dev);
>  	struct wmax_basic_args args;
> -	acpi_status status;
> +	int ret;
>  
>  	if (strcmp(buf, "gpu\n") == 0)
>  		args.arg = 1;
> @@ -767,12 +771,12 @@ static ssize_t source_store(struct device *dev, struct device_attribute *attr,
>  		args.arg = 3;
>  	pr_debug("alienware-wmi: setting hdmi to %d : %s", args.arg, buf);
>  
> -	status = alienware_wmax_command(&args, sizeof(args),
> -					WMAX_METHOD_HDMI_SOURCE, NULL);
> +	ret = alienware_wmi_command(pdata->wdev, WMAX_METHOD_HDMI_SOURCE, &args,
> +				    sizeof(args), NULL);
> +
> +	if (ret < 0)
> +		pr_err("alienware-wmi: HDMI toggle failed: results: %u\n", ret);
>  
> -	if (ACPI_FAILURE(status))
> -		pr_err("alienware-wmi: HDMI toggle failed: results: %u\n",
> -		       status);
>  	return count;
>  }
>  
> @@ -805,22 +809,24 @@ static const struct attribute_group hdmi_attribute_group = {
>  static ssize_t status_show(struct device *dev, struct device_attribute *attr,
>  			   char *buf)
>  {
> +	struct alienfx_platdata *pdata = dev_get_platdata(dev);
>  	struct wmax_basic_args in_args = {
>  		.arg = 0,
>  	};
> -	acpi_status status;
>  	u32 out_data;
> +	int ret;
>  
> -	status =
> -	    alienware_wmax_command(&in_args, sizeof(in_args),
> -				   WMAX_METHOD_AMPLIFIER_CABLE, &out_data);
> -	if (ACPI_SUCCESS(status)) {
> +	ret = alienware_wmi_command(pdata->wdev, WMAX_METHOD_AMPLIFIER_CABLE,
> +				    &in_args, sizeof(in_args), &out_data);
> +
> +	if (!ret) {

Hi, I noticed one minor style problem while trying to apply these I'd 
like to get addressed before I take them.

Could you please remove the empty line in between the call and its error 
handling for the calls you touch. There are a few such cases at least in 
this patch.

Thanks in advance.

-- 
 i.

>  		if (out_data == 0)
>  			return sysfs_emit(buf, "[unconnected] connected unknown\n");
>  		else if (out_data == 1)
>  			return sysfs_emit(buf, "unconnected [connected] unknown\n");
>  	}
> -	pr_err("alienware-wmi: unknown amplifier cable status: %d\n", status);
> +
> +	pr_err("alienware-wmi: unknown amplifier cable status: %d\n", ret);
>  	return sysfs_emit(buf, "unconnected connected [unknown]\n");
>  }
>  
> @@ -850,15 +856,17 @@ static const struct attribute_group amplifier_attribute_group = {
>  static ssize_t deepsleep_show(struct device *dev, struct device_attribute *attr,
>  			      char *buf)
>  {
> +	struct alienfx_platdata *pdata = dev_get_platdata(dev);
>  	struct wmax_basic_args in_args = {
>  		.arg = 0,
>  	};
> -	acpi_status status;
>  	u32 out_data;
> +	int ret;
>  
> -	status = alienware_wmax_command(&in_args, sizeof(in_args),
> -					WMAX_METHOD_DEEP_SLEEP_STATUS, &out_data);
> -	if (ACPI_SUCCESS(status)) {
> +	ret = alienware_wmi_command(pdata->wdev, WMAX_METHOD_DEEP_SLEEP_STATUS,
> +				    &in_args, sizeof(in_args), &out_data);
> +
> +	if (!ret) {
>  		if (out_data == 0)
>  			return sysfs_emit(buf, "[disabled] s5 s5_s4\n");
>  		else if (out_data == 1)
> @@ -866,15 +874,17 @@ static ssize_t deepsleep_show(struct device *dev, struct device_attribute *attr,
>  		else if (out_data == 2)
>  			return sysfs_emit(buf, "disabled s5 [s5_s4]\n");
>  	}
> -	pr_err("alienware-wmi: unknown deep sleep status: %d\n", status);
> +
> +	pr_err("alienware-wmi: unknown deep sleep status: %d\n", ret);
>  	return sysfs_emit(buf, "disabled s5 s5_s4 [unknown]\n");
>  }
>  
>  static ssize_t deepsleep_store(struct device *dev, struct device_attribute *attr,
>  			       const char *buf, size_t count)
>  {
> +	struct alienfx_platdata *pdata = dev_get_platdata(dev);
>  	struct wmax_basic_args args;
> -	acpi_status status;
> +	int ret;
>  
>  	if (strcmp(buf, "disabled\n") == 0)
>  		args.arg = 0;
> @@ -884,12 +894,12 @@ static ssize_t deepsleep_store(struct device *dev, struct device_attribute *attr
>  		args.arg = 2;
>  	pr_debug("alienware-wmi: setting deep sleep to %d : %s", args.arg, buf);
>  
> -	status = alienware_wmax_command(&args, sizeof(args),
> -					WMAX_METHOD_DEEP_SLEEP_CONTROL, NULL);
> +	ret = alienware_wmi_command(pdata->wdev, WMAX_METHOD_DEEP_SLEEP_CONTROL,
> +				    &args, sizeof(args), NULL);
> +
> +	if (!ret)
> +		pr_err("alienware-wmi: deep sleep control failed: results: %u\n", ret);
>  
> -	if (ACPI_FAILURE(status))
> -		pr_err("alienware-wmi: deep sleep control failed: results: %u\n",
> -			status);
>  	return count;
>  }
>  
> 
