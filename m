Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCBC61A288;
	Sat, 31 May 2025 19:24:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748719494; cv=none; b=NXQOsIuWbN1kQOdrjgsdmFZ/wdQp6UNv6KBA22lkGNBRP6PtpkFosLb5lJwbC25C1JYZWDl71paNzfwT/2RgqCrZ/uRiL2nyPHWROAItoDZcXh0+jdTA2OVaFUKykiBmVCBxKAmTv7TtNZjqlUzeHbzOwuZLggdbM5vyf8BbHek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748719494; c=relaxed/simple;
	bh=QoW1cZnLsDPdSvpdagAs8C1xegDkUJmpgu3+tJGkGUs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q7qirCBCL/LEzaqpid5lDHAmOsycl+M0Cesol/2J5i0Z63mfwgiO/Y5+iYXTTuDsK2JQDvePXWpM4J95IjK8LTAfxxkLHrI1vzU92+j9rjimzHSAxUmV/Khs98NXHOliHtkjkPeIork0Dn9gCxVGKhkTRxuHGesY9AAMTQ5/g3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QAt7a0Pc; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QAt7a0Pc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748719493; x=1780255493;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=QoW1cZnLsDPdSvpdagAs8C1xegDkUJmpgu3+tJGkGUs=;
  b=QAt7a0Pc0SLtLR5QiCUyfUXC59rC8ko1c2bPdeaQ11sFQ99AwVN3mloS
   4Oe5tzBNlFkyzXl/uL2p+DJS/JKYAkDTg8rKyJu+xbTdP4yTxJCcazJ6N
   yBJdU7n9T2jijP50DZI6FkDZyKa4D6okR1jElhu50P6qcoafw2bx0kZn3
   KjoxOEK9QctC7dYmuOGpp90/3LvlA0a9N2blLO3wrmAz4n0DUdTLOvssz
   87D99g2/zb8T7LBzPRKo2GRU+nKUskGS5DjJOYi7GRN53d94oQgN9ydYE
   X6ZMNQlbk/kFwQgk6gdXxCedbt/jjl16829Ms7ErC+rrmRUB6jUYXddMn
   w==;
X-CSE-ConnectionGUID: b+s6sZcdTImbyk0nksk3/w==
X-CSE-MsgGUID: E8u+x5STTt2KRuc4N6NxjA==
X-IronPort-AV: E=McAfee;i="6700,10204,11450"; a="50840243"
X-IronPort-AV: E=Sophos;i="6.16,199,1744095600"; 
   d="scan'208";a="50840243"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2025 12:24:53 -0700
X-CSE-ConnectionGUID: xMObRWRgTri/DSa7qbRFBQ==
X-CSE-MsgGUID: TVm4YCURTCOp8aQ+zmD8Fg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,199,1744095600"; 
   d="scan'208";a="144813500"
Received: from smile.fi.intel.com ([10.237.72.52])
  by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2025 12:24:49 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1uLRp0-00000002Mr4-2ezZ;
	Sat, 31 May 2025 22:24:46 +0300
Date: Sat, 31 May 2025 22:24:46 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Baojun Xu <baojun.xu@ti.com>
Cc: tiwai@suse.de, broonie@kernel.org, alsa-devel@alsa-project.org,
	shenghao-ding@ti.com, navada@ti.com, 13916275206@139.com,
	v-hampiholi@ti.com, v-po@ti.com, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] ALSA: hda/tas2781: Add compatible for hardware id
 TIAS2781 and TXNW2781
Message-ID: <aDtXfknr5yslSaM0@smile.fi.intel.com>
References: <20250531121733.17493-1-baojun.xu@ti.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250531121733.17493-1-baojun.xu@ti.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Sat, May 31, 2025 at 08:17:33PM +0800, Baojun Xu wrote:
> TIAS2781 is unofficial hardware id in acpi for tas2781 in HDA,

ACPI

> has been used for several projects. TXNW is the official hardware
> id for TI, will be used in new projects, including device on SPI bus.
> This patch will support both TIAS2781 and TXNW2781 in acpi

ACPI

> with tas2781 under HDA.

...

> +	hda_priv->save_calibration = tas2781_save_calibration;
> +	tas_hda->priv->global_addr = TAS2781_GLOBAL_ADDR;

No, just add these lines to a new branch.

>  	if (strstr(dev_name(&clt->dev), "TIAS2781")) {
>  		device_name = "TIAS2781";
> -		hda_priv->save_calibration = tas2781_save_calibration;
> -		tas_hda->priv->global_addr = TAS2781_GLOBAL_ADDR;
> +	} else if (strstr(dev_name(&clt->dev), "TXNW2781:00-tas2781-hda.0")) {

Why do you need to match the full device instance name?
Moreover, strstr() is incorrect. Should be strstarts() or str_has_prefix().

> +		device_name = "TXNW2781";
>  	} else if (strstr(dev_name(&clt->dev), "INT8866")) {
>  		device_name = "INT8866";
>  		hda_priv->save_calibration = tas2563_save_calibration;
>  		tas_hda->priv->global_addr = TAS2563_GLOBAL_ADDR;
> -	} else

> +	} else {
>  		return -ENODEV;
> +	}

Unrelated change.

...

>  static const struct acpi_device_id tas2781_acpi_hda_match[] = {
>  	{"TIAS2781", 0 },
> +	{"TXNW2781", 0 },
>  	{"INT8866", 0 },

Keep them sorted, please. Perhaps an additional patch?

>  	{}
>  };

-- 
With Best Regards,
Andy Shevchenko


