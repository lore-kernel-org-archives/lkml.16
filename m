Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56A81270EDC
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 16:54:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744217685; cv=none; b=gfekHlp9Go9MP8pRJCICVuvgC37G+yzkV+iSmJdx2BYxhoxgbFg6IfcBMKUqBS2iGECMyw+4ibaw/tY5hsqnEqKde/IP27ZnFyqrI06UBJvLfd0qyBf65cODKkY4fWO0IJpNxbI7KO9JWIWZEx2DQ9HpUpX5NtKyFXilsKiJfFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744217685; c=relaxed/simple;
	bh=CkdD8WTawyvkMWA0pApt7fupfnySbd1tQnhqBqLJ26E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VjmDG7OYXkxNA50qOjjw6nUEuw1JR9KE0LMWXTHFLDwsL1aYgwwt9Lum2UsOx5sn40S8xMgcLO1O2PHZqMUHtY0IQVvgTcQ6wGKclNXAktFLyn70hNn4Ayf+CG+06EC638SKZIhuAabc6qNYy0bMRrBRWaim8JJ66XkRJrMLnxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e48ndtje; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e48ndtje"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744217683; x=1775753683;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=CkdD8WTawyvkMWA0pApt7fupfnySbd1tQnhqBqLJ26E=;
  b=e48ndtjeNHNlSB6MWXWPfvijft3KGTjk9a81YpCse9iFBFqQ26uY3ATI
   CZIguJlUyt0EKlzmnqwJjbUsq01sgNprgNdGKKJ2o3cZxNhD3Y67G8Sxa
   aQ/D9HGvxeW7m7feWAo4Ig8VKrStG67Q8qftd55hDIsKUXpHZpixqcrsu
   5p9u/zTiLqCyb/c41Kshbik6vd1Z3LQ0pdEk/shGpGSi/44KhpPoY/U9r
   NUTJqk4CDndQk8SiqG7jrP4WcO6pC/AkXMyoxf54ssP5ao+7k0+6sPN05
   pUjcivIddPby0vEW3RN4LZ1xZvnlBf+1Z6IzxtHxx9FOxsA5O8sP0/WnK
   g==;
X-CSE-ConnectionGUID: WJK2RdtgSC+DoxxdAlOmbw==
X-CSE-MsgGUID: m+Ff/PSQTNOPt1/z9Bamgg==
X-IronPort-AV: E=McAfee;i="6700,10204,11399"; a="45720631"
X-IronPort-AV: E=Sophos;i="6.15,201,1739865600"; 
   d="scan'208";a="45720631"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2025 09:54:42 -0700
X-CSE-ConnectionGUID: yGzfegqHS0aj8hVI6JO4zg==
X-CSE-MsgGUID: EwcFTrDiRBushl/Lyvubkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,201,1739865600"; 
   d="scan'208";a="133623790"
Received: from smile.fi.intel.com ([10.237.72.58])
  by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2025 09:54:41 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1u2YhC-0000000Anhq-0o0A;
	Wed, 09 Apr 2025 19:54:38 +0300
Date: Wed, 9 Apr 2025 19:54:37 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Russell King <linux@armlinux.org.uk>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 07/10] [RESEND] ARM: fixmap: make
 __end_of_early_ioremap_region an enum value
Message-ID: <Z_amTf35QzLdHirV@smile.fi.intel.com>
References: <20250409122131.2766719-1-arnd@kernel.org>
 <20250409122314.2848028-1-arnd@kernel.org>
 <20250409122314.2848028-7-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250409122314.2848028-7-arnd@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, Apr 09, 2025 at 02:22:59PM +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> Building with W=1 shows warnings for the __end_of_fixed_addresses
> definition:
> 
>     In file included from mm/early_ioremap.c:18:
>     arch/arm/include/asm/fixmap.h:39:35: error: '__end_of_fixed_addresses' defined but not used [-Werror=unused-const-variable=]
> 
> Move the calculation slightly up in the file into the enum that
> contains __end_of_fixmap_region and __end_of_early_ioremap_region.

...


Maybe format it

> +	__end_of_fixed_addresses = __end_of_fixmap_region > __end_of_early_ioremap_region ?
> +				   __end_of_fixmap_region : __end_of_early_ioremap_region,

as

	__end_of_fixed_addresses =
		__end_of_fixmap_region > __end_of_early_ioremap_region ?
		__end_of_fixmap_region : __end_of_early_ioremap_region,

?

-- 
With Best Regards,
Andy Shevchenko


