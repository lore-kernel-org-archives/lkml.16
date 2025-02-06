Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 033861A0BFE
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 19:00:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738868418; cv=none; b=PKfws4jJttoegr8d0uepau9p8bOAQ1RldjykpoFpKaOuP8jnBEq3nXHn2aqXrzTfLHoruOTTNZOlO8U3lvy2lYHjv9b9gx26swGFH37s3GmFnhGR9vCwzV6OJpfYb2jng3DxvOjPzivqeiwkwQcNqe/oqVVvwoszedrdCnJkS6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738868418; c=relaxed/simple;
	bh=Cn4eq1k8dAgyWfxUeHjyHTRscbHZbWgjF1bOTfoBM6o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LOPf/Ng9VtYrGVPjUHjAGGx7y2uezxktOEauEmVBHkYkRo9CqHMy8U0YliDAG1zQfojCfsD+qNxKuVS37DzgoTXXRRctHTmbN0EgZjSwSO71gxVJVdwo2SeBouSmH9WiE0KFW0CTqPCnkgiHA09sL1BMm3FozxjodzQRoRXDPJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GJtxcMRz; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GJtxcMRz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738868416; x=1770404416;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Cn4eq1k8dAgyWfxUeHjyHTRscbHZbWgjF1bOTfoBM6o=;
  b=GJtxcMRzd7d9w39GGwrV8VCEwa+c8VijYZOxCZLhD0T7uI8Hutq9Uibs
   rf66TwqdCsyibI+8cnArBSlgqzFd8OdqeN4YRwfllZQfNy5thnLNFpc7G
   nOlUMK2zDKsw2OoVFJ9rLysOtDKkwjyLuThd7/nIk7i/q51L7/eAv6VcY
   9iuzjSg8E4be4VBSbgLZ35+PgQYznxdjOLix0qvKmxBUMrK1Xz1Q8sVGo
   VCA6Uo+I6R6DMhqC1l2vAlIIMkqi08ElKVOzPJ1LtmQQyQMossZ/mN71i
   ZZMPuwrZ5Bc6731+qjDD4p6VvkbKtBL1gV81juP8h1Em6p7uFFI9yKhZs
   Q==;
X-CSE-ConnectionGUID: bvX75ahZRL2a/lzxNQJ6/A==
X-CSE-MsgGUID: VKh0Xi9nSSul18rBKP0WWQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="49738406"
X-IronPort-AV: E=Sophos;i="6.13,265,1732608000"; 
   d="scan'208";a="49738406"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2025 11:00:15 -0800
X-CSE-ConnectionGUID: mHIofV3ESaWWbCdPLrZeMA==
X-CSE-MsgGUID: tgD2jQYDQU+Mi+WRiW2QCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,265,1732608000"; 
   d="scan'208";a="111137652"
Received: from smile.fi.intel.com ([10.237.72.58])
  by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2025 11:00:12 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tg76g-00000008p36-0yNR;
	Thu, 06 Feb 2025 21:00:10 +0200
Date: Thu, 6 Feb 2025 21:00:09 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Mark Brown <broonie@kernel.org>
Cc: Matti Vaittinen <mazziesaccount@gmail.com>,
	linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>
Subject: Re: [PATCH v1 1/1] regmap: irq: Use one way of setting all bits in
 the register
Message-ID: <Z6UGue-OUujUKYi6@smile.fi.intel.com>
References: <20250206162933.1127937-1-andriy.shevchenko@linux.intel.com>
 <1a60ef2d-365b-49ea-99b1-b83faee910c2@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1a60ef2d-365b-49ea-99b1-b83faee910c2@sirena.org.uk>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Thu, Feb 06, 2025 at 04:51:35PM +0000, Mark Brown wrote:
> On Thu, Feb 06, 2025 at 06:29:33PM +0200, Andy Shevchenko wrote:
> > Currently there are two ways of how we represent all bits set, i.e.
> > UINT_MAX and GENMASK(31, 0). Use the latter as the single way of
> > doing that, which is crystal clear on how many bits we are talking
> > about.
> 
> I think I'd rather go to UINT_MAX since it's more obviously correct if
> we see platforms with int that isn't 32 bits.

Okay!

-- 
With Best Regards,
Andy Shevchenko


