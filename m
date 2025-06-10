Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F1B327FD6D;
	Tue, 10 Jun 2025 07:35:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749540960; cv=none; b=eqr1U7g6Mw+0BXVJAMMySjonJkxZUslKxxSkea5P+NHq/F/6KaVpyb+qQ4PDIGOfbmnsIGsoVtVliyn3HZQeQUSeqKyYOkJ6bIqj2LxzU71Z7kE5WshYu7+6C7AhXOloLkgG7zwrXqnopliq4e0ot1aCkMYlAzuIgFDCZPH3QpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749540960; c=relaxed/simple;
	bh=ElacH2Wky9DtShQPH7U56vIWBMhMOiRCTWD4CBF36RI=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=FaO4fn0FU2d3EODvvVwwhoqdO4sJG5Tx4xIEHwIMS6Rrb370BIq720cS6mkB7NY6Zkdag9Qt1rmUbhB72sGDGMk/ADnJ6EAl58myWzn3ERAME2kq6wFJw+OyGZnqq85/idzVgjN/X0PsfX8vxOT4dgyLp1qejws0giDNRzAxPCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lYxdQO+A; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lYxdQO+A"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749540958; x=1781076958;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=ElacH2Wky9DtShQPH7U56vIWBMhMOiRCTWD4CBF36RI=;
  b=lYxdQO+AKUqJRNViFAFTPJamZzWsq4vSCQHhUVOD5VpRyF6VgEXN2avz
   fbvcRYKaOHygPXKY0M8QCY7oiF5esdab2ozRohuUDBrQux4A8WrRQLsOi
   ZghKN9x7ZQHOw6zxDlFfhqreiLToYw1T+kTOFYP24dg3zA9Kkou1sunTQ
   mZGLbGdxBqklWXlYohCIOejWJ26W0J/P8yVaWAp3EfmpC6MmJyTGIpiYX
   H6I+o9gmFTr7zda8lyMB3vv7Yj3QBMVULyEBtFBsC4JAQgOtBrFcsdJOb
   IL1tT2cTk6UltO/FzBpfkvzEsqZ02A+PJ5eG8zB64GiJcOZVylqUMoW1C
   Q==;
X-CSE-ConnectionGUID: V8uR3U3xRaWKBwdsHC/mjg==
X-CSE-MsgGUID: 594ohpR1TqSQVNjbDwwPIA==
X-IronPort-AV: E=McAfee;i="6800,10657,11459"; a="61907010"
X-IronPort-AV: E=Sophos;i="6.16,224,1744095600"; 
   d="scan'208";a="61907010"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2025 00:35:58 -0700
X-CSE-ConnectionGUID: 6ozIU5eiTcuu24hAps7wLQ==
X-CSE-MsgGUID: pHH8Bb2iQtiT7ZpVY1dBsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,224,1744095600"; 
   d="scan'208";a="150592232"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.196])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2025 00:35:53 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 10 Jun 2025 10:35:50 +0300 (EEST)
To: Mark Pearson <mpearson-lenovo@squebb.ca>
cc: Hans de Goede <hdegoede@redhat.com>, corbet@lwn.net, ikepanhc@gmail.com, 
    hmh@hmh.eng.br, W_Armin@gmx.de, 
    Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
    linux-doc@vger.kernel.org, platform-driver-x86@vger.kernel.org, 
    ibm-acpi-devel@lists.sourceforge.net, LKML <linux-kernel@vger.kernel.org>, 
    kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v3 2/2] platform/x86: thinklmi: improved DMI handling
In-Reply-To: <20250609122736.3373471-2-mpearson-lenovo@squebb.ca>
Message-ID: <b792059e-44d2-82c0-574c-76c3f6a3129d@linux.intel.com>
References: <mpearson-lenovo@squebb.ca> <20250609122736.3373471-1-mpearson-lenovo@squebb.ca> <20250609122736.3373471-2-mpearson-lenovo@squebb.ca>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 9 Jun 2025, Mark Pearson wrote:

> Fix issues reported by kernel test robot.
>  - Require DMI for think-lmi.
>  - Check return from getting serial string
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202506062319.F0IpDxF6-lkp@intel.com/
> 
> Signed-off-by: Mark Pearson <mpearson-lenovo@squebb.ca>
> ---
>  - New patch added to series.
> 
>  drivers/platform/x86/lenovo/Kconfig     | 1 +
>  drivers/platform/x86/lenovo/think-lmi.c | 8 +++++---
>  2 files changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/platform/x86/lenovo/Kconfig b/drivers/platform/x86/lenovo/Kconfig
> index a4b565283768..207dd7f88ed0 100644
> --- a/drivers/platform/x86/lenovo/Kconfig
> +++ b/drivers/platform/x86/lenovo/Kconfig
> @@ -197,6 +197,7 @@ config THINKPAD_ACPI_HOTKEY_POLL
>  config THINKPAD_LMI
>  	tristate "Lenovo WMI-based systems management driver"
>  	depends on ACPI_WMI
> +	depends on DMI
>  	select FW_ATTR_CLASS
>  	help
>  	  This driver allows changing BIOS settings on Lenovo machines whose
> diff --git a/drivers/platform/x86/lenovo/think-lmi.c b/drivers/platform/x86/lenovo/think-lmi.c
> index 143d9fdedb65..8f70c60f791f 100644
> --- a/drivers/platform/x86/lenovo/think-lmi.c
> +++ b/drivers/platform/x86/lenovo/think-lmi.c
> @@ -772,6 +772,7 @@ static ssize_t certificate_store(struct kobject *kobj,
>  	struct tlmi_pwd_setting *setting = to_tlmi_pwd_setting(kobj);
>  	enum cert_install_mode install_mode = TLMI_CERT_INSTALL;
>  	char *auth_str, *new_cert;
> +	const char *serial;
>  	char *signature;
>  	char *guid;
>  	int ret;
> @@ -789,9 +790,10 @@ static ssize_t certificate_store(struct kobject *kobj,
>  			return -EACCES;
>  
>  		/* Format: 'serial#, signature' */
> -		auth_str = cert_command(setting,
> -					dmi_get_system_info(DMI_PRODUCT_SERIAL),
> -					setting->signature);
> +		serial = dmi_get_system_info(DMI_PRODUCT_SERIAL);
> +		if (!serial)
> +			return -EINVAL;

This should not return -EINVAL as it is not a problem with the input 
parameters. Perhaps -ENODEV would make sense instead?

> +		auth_str = cert_command(setting, serial, setting->signature);
>  		if (!auth_str)
>  			return -ENOMEM;
>  
> 

-- 
 i.

