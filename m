Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD3E1A926
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 13:40:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744033237; cv=none; b=na/wp3jDMcMPmqLb2j46sLml/VlogyGHWrj6gKYVpnuoP+tbwlbdLkEUJkZHufzG71tPFBCtiKyvEktQBlUPi+JNOg27UfZUXSeM05IW2mP0ek3i4WozePqJtASZxSBw+uACQqPhk541z2ECBIORsjCp2xt56fFEAVun/f1s9xA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744033237; c=relaxed/simple;
	bh=2+8xpWDE1JSa1sgMFp+UIO4irSIqbfQMvph9iOUZezQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GD2Ale+5JLXM1sYs4APauGe46N9EDVY/O5Is0fMXk51X2cTqoegCKmTckIxHwuwhey6S/lsSMpz7hEFHwi9tKN7dcA/p/B7NDcwqmMOgzNy9Yer7U1if8+JWzar2Q/nJ0LGuqTWtQiRAqDGH7get7X+CqDrBcHbzpq2HB5Wx2y0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M2qELMEy; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M2qELMEy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744033235; x=1775569235;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=2+8xpWDE1JSa1sgMFp+UIO4irSIqbfQMvph9iOUZezQ=;
  b=M2qELMEyO0OFXbVNZB3+/Skgk/ZhMLgxReTKRlmYCUjQmOsSW57tkNX9
   DGGVUIT9bTroOETxiYYj7+8pH/xncbYxGr+31kBDnCLKl0Ss4OcaI6t+c
   Mf1UcnMSayULX6Cqsz4f3Mc114vFidNA/ACiFPXwDb34XGGPe81RcP16C
   SFeViF+BvubNqrGOeDlSVT/eMRtd5gVaceRdF9Anwbxh5fU2zzrFBB7os
   ihVbKoHwiNm0hCi5FUpKUvRRaq4tPmocgiiK9r3Nhspr4bQiKiT5VDgFL
   4g6huboPT8FXKIaYjui+kHImbj8KZWshohUz39LbTCWN0q9xq4gYirDYn
   w==;
X-CSE-ConnectionGUID: IanGWpgzSJOj4VuFPrN2bw==
X-CSE-MsgGUID: rwpQ1CRITai+79MsizHeyA==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="45309229"
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; 
   d="scan'208";a="45309229"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 06:40:35 -0700
X-CSE-ConnectionGUID: KdokhP2wTFe2ZhORUHPceg==
X-CSE-MsgGUID: 484JDqSkQoOPMb+Q+c2BWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; 
   d="scan'208";a="132934246"
Received: from smile.fi.intel.com ([10.237.72.58])
  by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 06:40:34 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1u1miF-0000000A5Cw-0TiG;
	Mon, 07 Apr 2025 16:40:31 +0300
Date: Mon, 7 Apr 2025 16:40:30 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Raag Jadav <raag.jadav@intel.com>
Cc: gregkh@linuxfoundation.org, rafael@kernel.org, dakr@kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] devres: simplify devm_kstrdup() using devm_kmemdup()
Message-ID: <Z_PVztG9gGd7g03N@smile.fi.intel.com>
References: <20250407121311.1702521-1-raag.jadav@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250407121311.1702521-1-raag.jadav@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Apr 07, 2025 at 05:43:11PM +0530, Raag Jadav wrote:
> devm_kstrdup() logic pretty much reflects devm_kmemdup() for strings,
> so just reuse it.

...

>  char *devm_kstrdup(struct device *dev, const char *s, gfp_t gfp)
>  {
> -	size_t size;
> -	char *buf;

> -	if (!s)
> -		return NULL;

There is no point to touch these lines.
And this is the style used in the file elsewhere.

> -	size = strlen(s) + 1;
> -	buf = devm_kmalloc(dev, size, gfp);
> -	if (buf)
> -		memcpy(buf, s, size);
> -	return buf;
> +	return s ? devm_kmemdup(dev, s, strlen(s) + 1, gfp) : NULL;
>  }

-- 
With Best Regards,
Andy Shevchenko


