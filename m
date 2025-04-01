Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48EC61E5B7E;
	Tue,  1 Apr 2025 11:24:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743506686; cv=none; b=f0aoZDT0gcRxUWDhsD/WEJGYJb81nuKaUDeksdMiD55unvc1owLxMQm2TtnjEJo9keZHrYHCGvQSFDTv8hinrg+Wuu7gwNvdPBxWkUkTrJbRpw8AvysznJGs5QAURENFU8t9gYfJVAfk5Xp95F6d4dEbwTQ9SlPpYSdDJvdHSuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743506686; c=relaxed/simple;
	bh=Xbrgp77gFRE50MGCwTQAmoy/8Yi+tgaYrDI08q5Gl0g=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=hgHxyg1yMdQ3ty36EGWfBwK7JDGwtEvqiGFY8tv2vtkGdShyGNggLKGpteI1c831HqXUXaOE5VVbDrNAVz5/b6Zp+YO0d2KBj3UwSPFb+FoiSAueJE7Vp2FZwzO2dm+YFJweSg/Fn/DeNH64+Arl8cVPy1J3Ys28dj/GlMutnjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VxpHZ0k+; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VxpHZ0k+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743506684; x=1775042684;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=Xbrgp77gFRE50MGCwTQAmoy/8Yi+tgaYrDI08q5Gl0g=;
  b=VxpHZ0k+UNV2XgJwqqceYXthFwMCJau0t5QcxUxIVxxPDfc3DrZlodL1
   pQXXcgZz7v5ywIuGgCr7GqMpt4hTmrxMGGt2q8sOIg73xN3uicsiCRDku
   3BmUqHd6X7v7BzbMCE9i76T7s2C3WMRU0OWX5I2sV0gWPn57xVkDo6/yL
   BvURd3ZUk3dyafp1BqwRJKr6ve0zDzpoVlHRzxW163VjwoyEe0aSz3FlM
   VBsJJmUPN3rStSSahAwRqq7A/LXg5QVnzUvtCzZJkVNoxmfWze5vaY9/T
   516RT1/+eCuMEPU9X4LWk3eWeBZ+9a7RngiddDTnRZw74ZTQd7tUa0DjC
   Q==;
X-CSE-ConnectionGUID: pbXoen/oTS2JOsjMMFq6cg==
X-CSE-MsgGUID: n8suvBavS9GmnWZH5pgw2w==
X-IronPort-AV: E=McAfee;i="6700,10204,11390"; a="43972652"
X-IronPort-AV: E=Sophos;i="6.14,293,1736841600"; 
   d="scan'208";a="43972652"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2025 04:24:43 -0700
X-CSE-ConnectionGUID: O6C+VatiQgyRnu6suKRzNg==
X-CSE-MsgGUID: w9B5k5ZOTEetlRqB4PvBWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,293,1736841600"; 
   d="scan'208";a="131214921"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.126])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2025 04:24:39 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 1 Apr 2025 14:24:36 +0300 (EEST)
To: Kurt Borja <kuurtb@gmail.com>
cc: Henrique de Moraes Holschuh <hmh@hmh.eng.br>, 
    Hans de Goede <hdegoede@redhat.com>, 
    Mark Pearson <mpearson-lenovo@squebb.ca>, 
    ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>, linux-riscv@lists.infradead.org, 
    Damian Tometzki <damian@riscv-rocks.de>
Subject: Re: [PATCH] platform/x86: thinkpad_acpi: Fix NULL pointer dereferences
 while probing
In-Reply-To: <20250330-thinkpad-fix-v1-1-4906b3fe6b74@gmail.com>
Message-ID: <455d5e7d-6f1e-a0a0-773b-85c26418bf54@linux.intel.com>
References: <20250330-thinkpad-fix-v1-1-4906b3fe6b74@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sun, 30 Mar 2025, Kurt Borja wrote:

> Some subdrivers make use of the global reference tpacpi_pdev during
> initialization, which is called from the platform driver's probe.
> However, after
> 
> commit 38b9ab80db31 ("platform/x86: thinkpad_acpi: Move subdriver initialization to tpacpi_pdriver's probe.")
> 

Next time, please include these into the paragraph flow normally obeying 
the normal paragraph formatting. I changed them in this case.

> this variable is only properly initialized *after* probing and this can
> result in a NULL pointer dereference.
> 
> In order to fix this without reverting the commit, register the platform
> bundle in two steps, first create and initialize tpacpi_pdev, then
> register the driver synchronously with platform_driver_probe(). This way
> the benefits of commit 38b9ab80db31 are preserved.
> 
> Additionally,
> 
> commit 43fc63a1e8f6 ("platform/x86: thinkpad_acpi: Move HWMON initialization to tpacpi_hwmon_pdriver's probe")
> 
> introduced a similar problem, however tpacpi_sensors_pdev is only used
> once inside the probe, so replace the global reference with the one
> given by the probe.
> 
> Reported-by: Damian Tometzki <damian@riscv-rocks.de>
> Closes: https://lore.kernel.org/r/CAL=B37kdL1orSQZD2A3skDOevRXBzF__cJJgY_GFh9LZO3FMsw@mail.gmail.com/
> Fixes: 38b9ab80db31 ("platform/x86: thinkpad_acpi: Move subdriver initialization to tpacpi_pdriver's probe.")
> Fixes: 43fc63a1e8f6 ("platform/x86: thinkpad_acpi: Move HWMON initialization to tpacpi_hwmon_pdriver's probe")
> Tested-by: Damian Tometzki <damian@riscv-rocks.de>
> Signed-off-by: Kurt Borja <kuurtb@gmail.com>

Applied to the review-ilpo-fixes branch.

> ---
> Hi all,
> 
> The commit message is pretty self-explanatory. I have one question
> though. As you can see in the crash dump of the original report:
> 
> Mar 29 17:43:16.180758 fedora kernel:  ? asm_exc_page_fault+0x26/0x30
> Mar 29 17:43:16.180769 fedora kernel:  ? __pfx_klist_children_get+0x10/0x10
> Mar 29 17:43:16.180781 fedora kernel:  ? kobject_get+0xd/0x70
> Mar 29 17:43:16.180792 fedora kernel:  device_add+0x8f/0x6e0
> Mar 29 17:43:16.180804 fedora kernel:  rfkill_register+0xbc/0x2c0 [rfkill]
> Mar 29 17:43:16.180813 fedora kernel:  tpacpi_new_rfkill+0x185/0x230 [thinkpad_acpi]
> 
> The NULL dereference happens in device_add(), inside rfkill_register().
> This bothers me because, as you can see here:
> 
>  1198                 atp_rfk->rfkill = rfkill_alloc(name,
>  1199                                                 &tpacpi_pdev->dev,
>  1200                                                 rfktype,
>  1201                                                 &tpacpi_rfk_rfkill_ops,
>  1202                                                 atp_rfk);
> 
> the NULL deference happens in line 1199, inside tpacpi_new_rfkill(). I
> think this disagreement might be due to compile time optimizations?

How did you map it to line numbers? Is it just about difference in the 
compiled binaries that results in different line numbers?

-- 
 i.

> Well, if someone knows better, let me know!
> 
> (This driver is going to give me nightmares, sorry for the bug!)
> ---
>  drivers/platform/x86/thinkpad_acpi.c | 24 ++++++++++++++++--------
>  1 file changed, 16 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
> index 0384cf31187872df90f5ac3def9b1d6617e82ed5..a17efb68664c9c7723daa2aba023ba0cbc6b96dd 100644
> --- a/drivers/platform/x86/thinkpad_acpi.c
> +++ b/drivers/platform/x86/thinkpad_acpi.c
> @@ -367,6 +367,7 @@ static struct {
>  	u32 beep_needs_two_args:1;
>  	u32 mixer_no_level_control:1;
>  	u32 battery_force_primary:1;
> +	u32 platform_drv_registered:1;
>  	u32 hotkey_poll_active:1;
>  	u32 has_adaptive_kbd:1;
>  	u32 kbd_lang:1;
> @@ -11820,10 +11821,10 @@ static void thinkpad_acpi_module_exit(void)
>  		platform_device_unregister(tpacpi_sensors_pdev);
>  	}
>  
> -	if (tpacpi_pdev) {
> +	if (tp_features.platform_drv_registered)
>  		platform_driver_unregister(&tpacpi_pdriver);
> +	if (tpacpi_pdev)
>  		platform_device_unregister(tpacpi_pdev);
> -	}
>  
>  	if (proc_dir)
>  		remove_proc_entry(TPACPI_PROC_DIR, acpi_root_dir);
> @@ -11893,9 +11894,8 @@ static int __init tpacpi_pdriver_probe(struct platform_device *pdev)
>  
>  static int __init tpacpi_hwmon_pdriver_probe(struct platform_device *pdev)
>  {
> -	tpacpi_hwmon = devm_hwmon_device_register_with_groups(
> -		&tpacpi_sensors_pdev->dev, TPACPI_NAME, NULL, tpacpi_hwmon_groups);
> -
> +	tpacpi_hwmon = devm_hwmon_device_register_with_groups(&pdev->dev, TPACPI_NAME,
> +							      NULL, tpacpi_hwmon_groups);
>  	if (IS_ERR(tpacpi_hwmon))
>  		pr_err("unable to register hwmon device\n");
>  
> @@ -11965,16 +11965,24 @@ static int __init thinkpad_acpi_module_init(void)
>  		tp_features.quirks = dmi_id->driver_data;
>  
>  	/* Device initialization */
> -	tpacpi_pdev = platform_create_bundle(&tpacpi_pdriver, tpacpi_pdriver_probe,
> -					     NULL, 0, NULL, 0);
> +	tpacpi_pdev = platform_device_register_simple(TPACPI_DRVR_NAME, PLATFORM_DEVID_NONE,
> +						      NULL, 0);
>  	if (IS_ERR(tpacpi_pdev)) {
>  		ret = PTR_ERR(tpacpi_pdev);
>  		tpacpi_pdev = NULL;
> -		pr_err("unable to register platform device/driver bundle\n");
> +		pr_err("unable to register platform device\n");
>  		thinkpad_acpi_module_exit();
>  		return ret;
>  	}
>  
> +	ret = platform_driver_probe(&tpacpi_pdriver, tpacpi_pdriver_probe);
> +	if (ret) {
> +		pr_err("unable to register main platform driver\n");
> +		thinkpad_acpi_module_exit();
> +		return ret;
> +	}
> +	tp_features.platform_drv_registered = 1;
> +
>  	tpacpi_sensors_pdev = platform_create_bundle(&tpacpi_hwmon_pdriver,
>  						     tpacpi_hwmon_pdriver_probe,
>  						     NULL, 0, NULL, 0);
> 
> ---
> base-commit: 1a9239bb4253f9076b5b4b2a1a4e8d7defd77a95
> change-id: 20250330-thinkpad-fix-98db0d8c3be3
> 
> Best regards,
> 
