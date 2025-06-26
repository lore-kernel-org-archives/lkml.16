Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C01F52EB5CA;
	Thu, 26 Jun 2025 15:18:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750951098; cv=none; b=D7HL23AWNh4cnYPPQDCgqeGmDgvpyV/slrWehFVVMAPgBU8PGjStuXlEqUyZYIY2/0MViwtxwRIY2kQmiNcU0Wuvxr0X8T5RB/ivEr/OMfo5PH+AtgUsJ6bg/gaNswIow9aHA6ZqJKj1B24JmCG2fl+YBgkZ4H9Z20MOY7zYIeg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750951098; c=relaxed/simple;
	bh=O/PahS6LrdahoJgUmBA8HOvNulGcN+KpvOPWLplfST4=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=N8oOMOafFQwFFzINxV+LyiheQURE15Xhg6JvgX8iXg5udgJ0G+SfZdhnj96XnJUlXTr7u5O5zTqzEPb/Sw09jp9Kew1NdozV3YmM/O8Q4IrRJQdvwGjBBIXFpTeUOZsSyT0gi39z8y7D3IyOg3f5nUsgnTROyBh1s89zKIVU4TA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ui2NLhQ5; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ui2NLhQ5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750951097; x=1782487097;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=O/PahS6LrdahoJgUmBA8HOvNulGcN+KpvOPWLplfST4=;
  b=Ui2NLhQ5cctMxhuO+NkSMPx/tQz13lDHbI6yu/vn5czITopoRulRmUTr
   NJ+sjCohPVyd40x8ZTA5i8eObsumAjOsZq7aOcbm8kiqXzDw44mfiIbto
   0kuR9C7kvEFebef96ZrgrSCcH4DR8Vt+UqikAazJovaewAUOi7T+mUi+l
   SQYTDmvPmPGgB2dy/jVeayJgaNk9ruSuYkLEFskuuJePopMccbWes290u
   PLm86uYt8NI0EKCTBnvWgA7UWlpXMsDFIZSCYrdfxvXbn8WrxkxjExsUN
   /1g1Ga7dXaX5Ml+JlVHM3x9go9fPKIU3TW8oa25jp+g1ID533a/ntpdIZ
   A==;
X-CSE-ConnectionGUID: hKmQa6LkS1CXAYavPeKaiQ==
X-CSE-MsgGUID: qmNxp4ouTliF7f7eiz9yig==
X-IronPort-AV: E=McAfee;i="6800,10657,11476"; a="78688262"
X-IronPort-AV: E=Sophos;i="6.16,267,1744095600"; 
   d="scan'208";a="78688262"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2025 08:18:16 -0700
X-CSE-ConnectionGUID: +TsuNq6pRkeISQ6zV4HevQ==
X-CSE-MsgGUID: QhoFw5F/Q66u4O/fZY9sbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,267,1744095600"; 
   d="scan'208";a="183576678"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.144])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2025 08:18:12 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Thu, 26 Jun 2025 18:18:07 +0300 (EEST)
To: Arnd Bergmann <arnd@kernel.org>
cc: Hans de Goede <hansg@kernel.org>, 
    Pratap Nirujogi <pratap.nirujogi@amd.com>, 
    Benjamin Chan <benjamin.chan@amd.com>, 
    Mario Limonciello <mario.limonciello@amd.com>, 
    Arnd Bergmann <arnd@arndb.de>, kernel test robot <lkp@intel.com>, 
    Armin Wolf <W_Armin@gmx.de>, Basavaraj Natikar <Basavaraj.Natikar@amd.com>, 
    Suma Hegde <suma.hegde@amd.com>, platform-driver-x86@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] platform/x86/amd_isp4: prevent built-in configuration
In-Reply-To: <20250620115448.202425-1-arnd@kernel.org>
Message-ID: <49a6a302-8660-5072-27b9-abc61253f608@linux.intel.com>
References: <20250620115448.202425-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 20 Jun 2025, Arnd Bergmann wrote:

> From: Arnd Bergmann <arnd@arndb.de>
> 
> Checking the module owner of the device only works when modules are
> enabled, and the device is created from a module:
> 
> drivers/platform/x86/amd/amd_isp4.c:154:28: error: incomplete definition of type 'struct module'
> 
> Building the driver as a loadable module avoids the build failure,
> though this should probably be fixed in a different way that still
> works if the device was created from built-in code.
> 
> Fixes: 90b85567e457 ("platform/x86: Add AMD ISP platform config for OV05C10")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202506150313.UHoIoVhR-lkp@intel.com/
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/platform/x86/amd/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/platform/x86/amd/Kconfig b/drivers/platform/x86/amd/Kconfig
> index 63e4bd985699..9e150500e37e 100644
> --- a/drivers/platform/x86/amd/Kconfig
> +++ b/drivers/platform/x86/amd/Kconfig
> @@ -36,6 +36,7 @@ config AMD_WBRF
>  config AMD_ISP_PLATFORM
>  	tristate "AMD ISP4 platform driver"
>  	depends on I2C && X86_64 && ACPI
> +	depends on m
>  	help
>  	  Platform driver for AMD platforms containing image signal processor
>  	  gen 4. Provides camera sensor module board information to allow
> 

The fix series should finally be on its way to Linus through i2c tree. 
I'm sorry for the unexpected delay in getting the real fix applied.

-- 
 i.

