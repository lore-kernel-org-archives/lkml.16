Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 752C31FDD;
	Fri, 23 May 2025 13:25:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748006740; cv=none; b=c4YpW1UrylH7O4JJsMwZPEV16L8FFr6J6XZEXFYxbTYTTWMVxbFqJKqRk/IAA9KrkhrsS3QAiRqwJv7vE2iAXzJzw2zAzufD6KD7iJibngTyup75xpg+bHKzvTwdOoHVgmKVD/GLS7srvKfsZQ48aEFtIOfBtiZu+jQaiTAh1+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748006740; c=relaxed/simple;
	bh=8e6tWzdQJXuLNBOdzFHbtTb0QEiAelckLJoP29jrl+U=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=nTNPDYKLJFJuC1KAXjNzegmSdNewAcE4Z/hUo/mAAAi4cqhMaClozfTFfmfN8gf9rgBVEl7Bo3WJXQ605mP96nIz15Fo/OGO9wkht8KA7XLhrtT9yN5n2gBmpCyGAWspekTaN83qmPPx1hCNGWpY3PG4B+Wi2qlxU/6f4SN8elQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=j2CnBNvT; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j2CnBNvT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748006739; x=1779542739;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=8e6tWzdQJXuLNBOdzFHbtTb0QEiAelckLJoP29jrl+U=;
  b=j2CnBNvT/MST0o1vfUiV32lrSMy74k9Ba8FLTyesH1bq9OyW/HpEzaWA
   +i5QDw38SqVIOY0UupMlJ+EQ8bgFQyH0TfwseLmKK+eybd2Awwys3e/Vu
   bxZaltOEu47FJvx/0ZORWfQwGwUKoGUcaYI+DFi7aIBkNOBROlL6BJ0Ci
   UuvU0QAz1NJVMM0gIljtJBkd2Zd3Z+OhqJlhr+eGSeqPdL9BzDriFPDPu
   +GATkJH7P7jHtQ0HjcJWEEQLaKGevTQEJA/dF7cZBKSrs2/w1R9+QX/NT
   87khxOwZQlvK7uc5sJJGyIT6wNyRV3i+4xPRCorZbQkR5b178wHAmFU1t
   g==;
X-CSE-ConnectionGUID: G5SB0E9KQnyZErVUomY+aw==
X-CSE-MsgGUID: CEVkEYpyQeaBbHKc9leuQw==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="49768319"
X-IronPort-AV: E=Sophos;i="6.15,308,1739865600"; 
   d="scan'208";a="49768319"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2025 06:25:38 -0700
X-CSE-ConnectionGUID: SW+QVMFFT/yjKHkSk+e7nQ==
X-CSE-MsgGUID: rfXuwkf5RYOZEFHgl4l6Ew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,308,1739865600"; 
   d="scan'208";a="146130694"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.150])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2025 06:25:35 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Fri, 23 May 2025 16:25:31 +0300 (EEST)
To: Luke Jones <luke@ljones.dev>
cc: LKML <linux-kernel@vger.kernel.org>, Hans de Goede <hdegoede@redhat.com>, 
    platform-driver-x86@vger.kernel.org, mario.limonciello@amd.com, 
    Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
    kernel test robot <lkp@intel.com>
Subject: Re: [PATCH 1/1] platform/x86: asus-wmi: fix build without
 CONFIG_SUSPEND
In-Reply-To: <20250523131451.1942578-2-luke@ljones.dev>
Message-ID: <0dc0316d-a9ae-c152-3737-be1c73a415b1@linux.intel.com>
References: <20250523131451.1942578-1-luke@ljones.dev> <20250523131451.1942578-2-luke@ljones.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 23 May 2025, Luke Jones wrote:

> The patch "Refactor Ally suspend/resume" introduced an

The commit feea7bd6b02d ("...")

> acpi_s2idle_dev_ops for use with ROG Ally which caused a build error
> if CONFIG_SUSPEND was not defined.
> 
> Signed-off-by: Luke Jones <luke@ljones.dev>
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202505090418.DaeaXe4i-lkp@intel.com/
> Fixes: feea7bd6b02d ("platform/x86: asus-wmi: Refactor Ally suspend/resume")
> ---
>  drivers/platform/x86/asus-wmi.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
> index 27f11643a00d..087318e0d595 100644
> --- a/drivers/platform/x86/asus-wmi.c
> +++ b/drivers/platform/x86/asus-wmi.c
> @@ -5005,6 +5005,7 @@ static int asus_hotk_restore(struct device *device)
>  	return 0;
>  }
>  
> +#if defined(CONFIG_SUSPEND)
>  static void asus_ally_s2idle_restore(void)
>  {
>  	if (use_ally_mcu_hack == ASUS_WMI_ALLY_MCU_HACK_ENABLED) {
> @@ -5013,6 +5014,7 @@ static void asus_ally_s2idle_restore(void)
>  		msleep(ASUS_USB0_PWR_EC0_CSEE_WAIT);
>  	}
>  }
> +#endif /* CONFIG_SUSPEND */

Move this function below asus_hotk_prepare() next to ops, so that only one 
#if block is needed for them.

>  
>  static int asus_hotk_prepare(struct device *device)
>  {
> @@ -5025,9 +5027,11 @@ static int asus_hotk_prepare(struct device *device)
>  }
>  
>  /* Use only for Ally devices due to the wake_on_ac */
> +#if defined(CONFIG_SUSPEND)
>  static struct acpi_s2idle_dev_ops asus_ally_s2idle_dev_ops = {
>  	.restore = asus_ally_s2idle_restore,
>  };
> +#endif /* CONFIG_SUSPEND */
>  
>  static const struct dev_pm_ops asus_pm_ops = {
>  	.thaw = asus_hotk_thaw,
> @@ -5060,9 +5064,11 @@ static int asus_wmi_probe(struct platform_device *pdev)
>  			return ret;
>  	}
>  
> +	#if defined(CONFIG_SUSPEND)
>  	ret = acpi_register_lps0_dev(&asus_ally_s2idle_dev_ops);
>  	if (ret)
>  		pr_warn("failed to register LPS0 sleep handler in asus-wmi\n");
> +	#endif /* CONFIG_SUSPEND */
>  
>  	return asus_wmi_add(pdev);
>  }
> @@ -5096,7 +5102,10 @@ EXPORT_SYMBOL_GPL(asus_wmi_register_driver);
>  
>  void asus_wmi_unregister_driver(struct asus_wmi_driver *driver)
>  {
> +	#if defined(CONFIG_SUSPEND)
>  	acpi_unregister_lps0_dev(&asus_ally_s2idle_dev_ops);
> +	#endif /* CONFIG_SUSPEND */

I'd have preferred these reg/unreg be solved with wrappers (see 
pmc_atom.c).


-- 
 i.

