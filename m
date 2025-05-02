Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DA382343AF;
	Fri,  2 May 2025 12:37:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746189428; cv=none; b=FbBNadpOz1WUZg7rzlFocrp4Rwu/5itXJ5Pp5eGXE7ofNV9t41qJR7Vy2KVwOG/RjgY93mUlWl0baNs4B8sgTjyjnbln6CuqT2ZBOE8TUYSpkpovP+bjeGiH8OdusHQ6Eo+Gd9ZzzOWJ330ehoCldRUbm4Xj2nGBlqCJmrFLuF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746189428; c=relaxed/simple;
	bh=3RrRQioMmY9W3U549so7dN6E6HO0z0x4sBheM1e4sgs=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=Bu9uZ1cl9kQvFmQQM7MrwpQ8bXnSysqDP1awFBSq2ZFS+krc9lP8emH2ZUtt6EeJzlUmoNBAKDmcIWiHy4/+gbU+GRPDfF+itLCoXuIPgb10kRGavBWF6tqM2aokna7ge4KiC9KB5Ilz2l5CUiqcY99ETVqpepj+8JVd6q0xKes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f6jeTHPK; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f6jeTHPK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746189427; x=1777725427;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version:content-id;
  bh=3RrRQioMmY9W3U549so7dN6E6HO0z0x4sBheM1e4sgs=;
  b=f6jeTHPK0LWnujIO9ISmaL7LGXOaICj0G5wObnI2+9ZOJhPZ/50X4F3A
   xC+10j5SpBJgl2kE1lSejg2rDvNQjkFHbrIQl++NlSqLb3thgyNqMNlWI
   /W13ydP5tfkaUAtHuyPucz7nSiGxvtx+Mjz3qYicod5bkEwrfr4SkfbaD
   4FgJVQ4lsjRWS7jxj+0MhsutneO3tUFqGMuL9fyZKXxT2EPZG6DTn+RcA
   wZMO9BmDGbdteykhJx8/25wbbdLl2MLFXjWxIQWKd/trTN/rLn6z4qWF3
   STJaozE8tI9Z3FdUVFfJpj/yzo4tN53aAsgk6LTXKefAswWTtgsnwWX3x
   Q==;
X-CSE-ConnectionGUID: znjMJG8PSuSw+13tgxOC/g==
X-CSE-MsgGUID: tIZh7qIQQ0apiqJPZk5CmA==
X-IronPort-AV: E=McAfee;i="6700,10204,11421"; a="58078335"
X-IronPort-AV: E=Sophos;i="6.15,256,1739865600"; 
   d="scan'208";a="58078335"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2025 05:37:05 -0700
X-CSE-ConnectionGUID: vGEnkxCiQ76ZBLd4Ck/A8Q==
X-CSE-MsgGUID: GWlg6MNVT0etXQpnNGIIDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,256,1739865600"; 
   d="scan'208";a="134528571"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.135])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2025 05:37:02 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Fri, 2 May 2025 15:36:58 +0300 (EEST)
To: Randy Dunlap <rdunlap@infradead.org>
cc: LKML <linux-kernel@vger.kernel.org>, Vadim Pasternak <vadimp@nvidia.com>, 
    Hans de Goede <hdegoede@redhat.com>, platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH] platform/mellanox: MLXREG_DPU depends on I2C
In-Reply-To: <20250502001622.674263-1-rdunlap@infradead.org>
Message-ID: <150c0b1b-8845-db78-39d3-388d3ca79613@linux.intel.com>
References: <20250502001622.674263-1-rdunlap@infradead.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323328-1411073070-1746189394=:958"
Content-ID: <20731f71-4262-d7d5-77e4-e0926c256de4@linux.intel.com>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1411073070-1746189394=:958
Content-Type: text/plain; CHARSET=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE
Content-ID: <5e401ceb-7dc3-8190-71ca-be626e46298f@linux.intel.com>

On Thu, 1 May 2025, Randy Dunlap wrote:

> WARNING: unmet direct dependencies detected for REGMAP_I2C
>   Depends on [m]: I2C [=3Dm]
>   Selected by [y]:
>   - MLXREG_DPU [=3Dy] && MELLANOX_PLATFORM [=3Dy]
>=20
> Without the dependency, REGMAP_I2C=3Dy since MLXREG_DPU=3Dy.
> Since CONFIG_I2C=3Dm, this causes many (> 230) unmet dependency warnings.
> E.g.:
>   Selected by [m]:
>   - EEPROM_AT24 [=3Dm] && I2C [=3Dm] && SYSFS [=3Dy]
>   - SERIAL_MAX310X [=3Dm] && TTY [=3Dy] && HAS_IOMEM [=3Dy] && SPI_MASTER=
 [=3Dy] && I2C [=3Dm]
>   - PINCTRL_AW9523 [=3Dm] && PINCTRL [=3Dy] && OF [=3Dy] && I2C [=3Dm]
>   - PINCTRL_CY8C95X0 [=3Dm] && PINCTRL [=3Dy] && I2C [=3Dm]
>   - GPIO_FXL6408 [=3Dm] && GPIOLIB [=3Dy] && I2C [=3Dm]
>   - GPIO_DS4520 [=3Dm] && GPIOLIB [=3Dy] && I2C [=3Dm]
>   - GPIO_PCA953X [=3Dm] && GPIOLIB [=3Dy] && I2C [=3Dm]
>   - IP5XXX_POWER [=3Dm] && POWER_SUPPLY [=3Dy] && I2C [=3Dm]
>   - BATTERY_CW2015 [=3Dm] && POWER_SUPPLY [=3Dy] && I2C [=3Dm]
>   - CHARGER_SBS [=3Dm] && POWER_SUPPLY [=3Dy] && I2C [=3Dm]
>=20
> Fixes: 3e75f2954116 ("platform/mellanox: mlxreg-dpu: Add initial support =
for Nvidia DPU")
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Vadim Pasternak <vadimp@nvidia.com>
> Cc: Ilpo J=E4rvinen <ilpo.jarvinen@linux.intel.com>
> Cc: Hans de Goede <hdegoede@redhat.com>
> Cc: platform-driver-x86@vger.kernel.org
> ---
>  drivers/platform/mellanox/Kconfig |    1 +
>  1 file changed, 1 insertion(+)
>=20
> --- linux-next-20250501.orig/drivers/platform/mellanox/Kconfig
> +++ linux-next-20250501/drivers/platform/mellanox/Kconfig
> @@ -29,6 +29,7 @@ config MLX_PLATFORM
> =20
>  config MLXREG_DPU
>  =09tristate "Nvidia Data Processor Unit platform driver support"
> +=09depends on I2C
>  =09select REGMAP_I2C
>  =09help
>  =09  This driver provides support for the Nvidia BF3 Data Processor Unit=
s,
>=20

Thanks for the patch but the review-ilpo-next branch already has this=20
fixed, just waiting for lkp to build test it until it propagates into=20
for-next.

--=20
 i.
--8323328-1411073070-1746189394=:958--
