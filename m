Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6A5417A30C;
	Thu, 17 Apr 2025 13:13:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744895597; cv=none; b=E7NqIOT2iEb+4i7R+45Q0XhWUG04pwCHMsYG7QP818riST0KSGu3REybOMXEMmtkubg8qFmcATxePBNlXab0v2e5KTXUdrW1eXqAZFO5f5zD7r7hMGPN8qGBd4iz6w1NcHZ7PbYn5NtB1nv2lhmRdZ/8WdUuZhD2f3EBanoKNXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744895597; c=relaxed/simple;
	bh=xS9haWivXOrYvXrbE0+xVmjp1D8AU3MxcKTOGFhicDo=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=s6fD+tfqzj5uJHyL47iXoENn95/PWrz+rnsxLI/tOqC382+itUj7vl2nKn0NqUDv/ogGdbkkH5QmZPNeUUr+Vuv/+x0oaq0+5o5F5oaQ22mpi0+uhoXTLZLuXTkDIgZq1HVWcimjPHe6gxoG6o5D/7jCcaGNiH0GvaTaICAf6Fk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YBA9X9Ts; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YBA9X9Ts"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744895596; x=1776431596;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=xS9haWivXOrYvXrbE0+xVmjp1D8AU3MxcKTOGFhicDo=;
  b=YBA9X9TsLWAHMLzL4WqC5yqgGJDC1iJZcNOPpawz7gYiCAwBMBsheZZA
   VmLpUaY6umCD8vAN7Pr6/Ulg486VanFggqGvLedC37ToTRdK+sgH9Joue
   IYNpLnVMUZhzXSkNS9cfPZ1lft32oqG4IRy02jwISPcIDjTl4SOEWNcjF
   AUSz4wsyocFzqXjdHt3Wg8LqhuJrcSoEwA6BRkK6JKE/LNmv633eRIJ8a
   civJOS1HHZfibdNZ0C0uDqgdS+97Ij+02P+vY8DpKdKtXpZgbnJRD8/IV
   bUHr84ww25888FVjmso1GFafDm2k2BpnObDvJ1NwcucB1LDPVsxCxacol
   g==;
X-CSE-ConnectionGUID: LUL9K+pvQhiMP3xHUHS3pw==
X-CSE-MsgGUID: /PJHkXaOSJSVKM0dh1bGhQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11405"; a="63890361"
X-IronPort-AV: E=Sophos;i="6.15,219,1739865600"; 
   d="scan'208";a="63890361"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2025 06:13:15 -0700
X-CSE-ConnectionGUID: ahEHEBz2Qqex81VSXF754A==
X-CSE-MsgGUID: mp/GT/N8RAe8YHBMK1zlLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,219,1739865600"; 
   d="scan'208";a="161838593"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.144])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2025 06:13:12 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Thu, 17 Apr 2025 16:13:08 +0300 (EEST)
To: Purva Yeshi <purvayeshi550@gmail.com>
cc: irenic.rajneesh@gmail.com, david.e.box@intel.com, 
    Hans de Goede <hdegoede@redhat.com>, platform-driver-x86@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] platform/x86: intel_pmc_core: Fix uninitialized pmc/map
 in pmc_core_send_ltr_ignore
In-Reply-To: <20250417075229.20540-1-purvayeshi550@gmail.com>
Message-ID: <2b6412f7-28d7-e7c4-6c61-aac9be6dd84c@linux.intel.com>
References: <20250417075229.20540-1-purvayeshi550@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 17 Apr 2025, Purva Yeshi wrote:

> Fix Smatch-detected issue:
> 
> drivers/platform/x86/intel/pmc/core.c:501 pmc_core_send_ltr_ignore()
> error: uninitialized symbol 'pmc'.
> 
> drivers/platform/x86/intel/pmc/core.c:501 pmc_core_send_ltr_ignore()
> error: uninitialized symbol 'map'.
> 
> drivers/platform/x86/intel/pmc/core.c:501 pmc_core_send_ltr_ignore()
> error: we previously assumed 'pmc' could be null (see line 479)
> 
> 
> Prevents uninitialized symbol warnings detected by smatch.
> 
> Ensures map is not accessed if pmc is NULL, preventing dereferencing
> of uninitialized pointers
> 
> Add defensive check for pmc and map to catch any unexpected edge cases
> and ensure all required pointers are valid.
> 
> Signed-off-by: Purva Yeshi <purvayeshi550@gmail.com>
> ---
>  drivers/platform/x86/intel/pmc/core.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/platform/x86/intel/pmc/core.c b/drivers/platform/x86/intel/pmc/core.c
> index 7a1d11f2914f..e674b940e29e 100644
> --- a/drivers/platform/x86/intel/pmc/core.c
> +++ b/drivers/platform/x86/intel/pmc/core.c
> @@ -462,8 +462,8 @@ DEFINE_SHOW_ATTRIBUTE(pmc_core_pll);
>  
>  int pmc_core_send_ltr_ignore(struct pmc_dev *pmcdev, u32 value, int ignore)
>  {
> -	struct pmc *pmc;
> -	const struct pmc_reg_map *map;
> +	struct pmc *pmc = NULL;
> +	const struct pmc_reg_map *map = NULL;
>  	u32 reg;
>  	unsigned int pmc_index;
>  	int ltr_index;
> @@ -480,6 +480,9 @@ int pmc_core_send_ltr_ignore(struct pmc_dev *pmcdev, u32 value, int ignore)
>  			continue;
>  
>  		map = pmc->map;
> +		if (!map)
> +			continue;

How can this happen?? If pmc is created, it should have a valid ->map 
AFAICT. Did you even read that code at all???

> +
>  		if (ltr_index <= map->ltr_ignore_max)
>  			break;
>  
> @@ -491,7 +494,7 @@ int pmc_core_send_ltr_ignore(struct pmc_dev *pmcdev, u32 value, int ignore)
>  		ltr_index = ltr_index - (map->ltr_ignore_max + 2) - 1;
>  	}
>  
> -	if (pmc_index >= ARRAY_SIZE(pmcdev->pmcs) || ltr_index < 0)
> +	if (pmc_index >= ARRAY_SIZE(pmcdev->pmcs) || ltr_index < 0 || !pmc || !map)

What are the situations pmc_index >= ARRAY_SIZE(pmcdev->pmcs) check 
didn't catch where these new checks do something useful??

Lots of noise but little real substance in this patch?

-- 
 i.

