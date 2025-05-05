Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AD3D202F60;
	Mon,  5 May 2025 11:38:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746445115; cv=none; b=OZQxOo9q15UEWSEzp3g/40C6yHTq212yOd8C1feVfF8qrbBB15eFMdTr2MaVow/eeBIBJ1n48Gqv6cOyFaj2hxxLsTm2EV8oCRg4yfZZSUBCo1rU2zzwA/OgD0cK4S4eOX3C/o/svXD/yiW4fjkWtWu+8Bq9Q5/2YvqnWVpTAFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746445115; c=relaxed/simple;
	bh=Yn+59R/AqSxu5xAeiT3BpqSCLgl4aG/veQzcl9tLJCI=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=GfLsDsUTCq2V8Fwe7iW0xH5xN82YU0toufAp2r4nod5tLhDjGh8EAYUXt3X8c1EoSI49dsYb+wgg4IcqNKZo0ExOe9VvU0RcL5x2ZyjXon0gBm7GzUKGK7a4EsOzzre1M9fcnQl1eZtLDX3dfX+AuW6v5ilScUtYllu3G+AuUks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cwa3Mwqr; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cwa3Mwqr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746445114; x=1777981114;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=Yn+59R/AqSxu5xAeiT3BpqSCLgl4aG/veQzcl9tLJCI=;
  b=cwa3MwqrvWV/Uy4Sw1Zhed3K5D46H1pfj4o7ZKwu0aahFmGax2XjpRuw
   /QclO86PZtJgBQpc4XR30DQsXbMA2lkQedaJLvFZi0Kk1lhxBxCY/yhmA
   XPgfAIKgoGmCwXrrOK/N+kXOWOs+bvPLBHZuifkvtQcQBZRD0ZlqmXegD
   uXXAymdbE7EC39un4MQM+TNwVJ5uGswmtLrCppaXTbM+koaIy44z8p/ef
   9w9Tw3quwCq0Qqbk3aGea3wjN29TDzeMuQAGLh3GgMzJKgtoY/xuDcZ3R
   AvsvtFSXLUTKX2O3o7VPCqfg4nvRdGYzS8BGtlQF28MuT632tFJLUe0g/
   g==;
X-CSE-ConnectionGUID: HShgHXccQgmvaBhI/xIflg==
X-CSE-MsgGUID: AWRYVNhpRqiOVDtPulEaAw==
X-IronPort-AV: E=McAfee;i="6700,10204,11423"; a="59439899"
X-IronPort-AV: E=Sophos;i="6.15,262,1739865600"; 
   d="scan'208";a="59439899"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2025 04:38:32 -0700
X-CSE-ConnectionGUID: kkqhIC9/RUGBC1KWraijjQ==
X-CSE-MsgGUID: T4qlmeORQm6mbokDkReuUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,262,1739865600"; 
   d="scan'208";a="140005581"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.68])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2025 04:38:29 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 5 May 2025 14:38:26 +0300 (EEST)
To: Arnd Bergmann <arnd@kernel.org>
cc: Hans de Goede <hdegoede@redhat.com>, Vadim Pasternak <vadimp@nvidia.com>, 
    Ciju Rajan K <crajank@nvidia.com>, Arnd Bergmann <arnd@arndb.de>, 
    Michael Shych <michaelsh@nvidia.com>, platform-driver-x86@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] platform/mellanox: mlxreg-dpu: add I2C dependency
In-Reply-To: <20250502203739.2143173-1-arnd@kernel.org>
Message-ID: <60faeb10-ecf0-1027-d09b-171de50cc3eb@linux.intel.com>
References: <20250502203739.2143173-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 2 May 2025, Arnd Bergmann wrote:

> From: Arnd Bergmann <arnd@arndb.de>
> 
> REGMAP_I2C cannot be selected unless I2C is already enabled:
> 
> WARNING: unmet direct dependencies detected for REGMAP_I2C
>   Depends on [n]: I2C [=n]
>   Selected by [y]:
>   - MLXREG_DPU [=y] && MELLANOX_PLATFORM [=y]
> 
> Fixes: 3e75f2954116 ("platform/mellanox: mlxreg-dpu: Add initial support for Nvidia DPU")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/platform/mellanox/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/platform/mellanox/Kconfig b/drivers/platform/mellanox/Kconfig
> index 7204b10388ca..e3afbe62c7f6 100644
> --- a/drivers/platform/mellanox/Kconfig
> +++ b/drivers/platform/mellanox/Kconfig
> @@ -29,6 +29,7 @@ config MLX_PLATFORM
>  
>  config MLXREG_DPU
>  	tristate "Nvidia Data Processor Unit platform driver support"
> +	depends on I2C
>  	select REGMAP_I2C
>  	help
>  	  This driver provides support for the Nvidia BF3 Data Processor Units,


This has been long fixed in the review-ilpo-next branch but LKP has been 
slow to build test it so the fix hasn't propagated into fox-next. I just 
pushed the changes into for-next as it seems LKP might not build that at 
all.

-- 
 i.

