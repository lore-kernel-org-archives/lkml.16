Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7C8725F796
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 15:34:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744212868; cv=none; b=rcp8VaNMG47b4yYHrBv3aSUdkqWrYFSHd3SkUaW+qREI79/9YvNohYSOv+et5/+vcawptdf4NgVc6+f2ByfbbkBhZmaBLcV+FB1gxQuvtA84CXFRAJTof4L6bnR0v8runKWLOo3QJlsOCm7TG5v3RhBXo2cc47mpIKnRzbO87DQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744212868; c=relaxed/simple;
	bh=PPcWwuA+6UDKNbLjvBDA/JbvETZrQpjuMfImtxrbGRw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LbzqFVv9uP0jGjhVUDo8yLtoHum67oFJu0ieEXw8J3QB3bV3Z8bgEz9+b7g7lFvrWy+qMmUi9xMrh8w9fZgHqLTrGgFXWxrzctsvTNfULuWRm5+ri+sKuFb1LQ1XdxQRZYzv0zQItteuDYIFvM02A72O0k6lx2T2XQg3sD6w088=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KBnYOYzB; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KBnYOYzB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744212867; x=1775748867;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=PPcWwuA+6UDKNbLjvBDA/JbvETZrQpjuMfImtxrbGRw=;
  b=KBnYOYzBf70IpMYahoZvaCnUutme3HnamnkmyZuhFmsLuwTRkR48yhBl
   arfrchK4CoA4FR3YRkCzcHkwZqABOBdGEuX/yqzIwem9BwmzVhO94nZIm
   kuYyp0lSK8FKo8iB+M/NGixDda1kHCK9u5Tf6wZERKKtBu+vhM133Uufo
   J7+PoKiWqOLvepjRr+OKNr4tVHD2pje4YB0Nx8ou6TUmuNBrd3UdGVom8
   LQyjJKAye9+705OLWNqr2rU4hKes5+r4ji84TCOTPBA4szaazD8WkH87s
   hQ4xTYZJxmiI3WxgGFz8bVh5v6Zt3O52Dl0XvcSfeKOL9g3ga9tYHg+QH
   A==;
X-CSE-ConnectionGUID: y1tm8CHTSCywmjfvV9z9tA==
X-CSE-MsgGUID: GgOHzmxKTMa6Qd/PmLZ9Kw==
X-IronPort-AV: E=McAfee;i="6700,10204,11399"; a="63091702"
X-IronPort-AV: E=Sophos;i="6.15,200,1739865600"; 
   d="scan'208";a="63091702"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2025 08:34:27 -0700
X-CSE-ConnectionGUID: rLvAAFH4TYC7NBdjuvDOBA==
X-CSE-MsgGUID: 4nd6ddGaR8KtUaGdUAZ4hw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,200,1739865600"; 
   d="scan'208";a="133486967"
Received: from smile.fi.intel.com ([10.237.72.58])
  by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2025 08:34:25 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1u2XRW-0000000AmOr-1X3m;
	Wed, 09 Apr 2025 18:34:22 +0300
Date: Wed, 9 Apr 2025 18:34:22 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Peter Rosin <peda@axentia.se>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 04/10] [RESEND] mux: adg792a: remove incorrect
 of_match_ptr annotation
Message-ID: <Z_aTfqQvNlYeT5Id@smile.fi.intel.com>
References: <20250409122131.2766719-1-arnd@kernel.org>
 <20250409122314.2848028-1-arnd@kernel.org>
 <20250409122314.2848028-4-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250409122314.2848028-4-arnd@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, Apr 09, 2025 at 02:22:56PM +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> Building with W=1 shows a warning about adg792a_of_match being unused
> when CONFIG_OF is disabled:
> 
> drivers/mux/adg792a.c:134:34: error: unused variable 'adg792a_of_match' [-Werror,-Wunused-const-variable]

Yes, please, somebody apply this, I have got 3+ LKP emails about this in the
past.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko


