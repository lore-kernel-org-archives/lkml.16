Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDF41197A8E
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 11:20:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738927261; cv=none; b=h5n5JnPtJwi9SzmA7xbulUJku3TcBVsPOm7JjSN0ztKj6z7IHVexFKORYeiljsqFlrKgoB6HeV/O3RR0YyrUSr49ZAnJOsnvoWTChv+PXr6hfVQEnZCLd9JNG6eqcPVaGZFJ23sxravHP9nyWvXet2OzdeT+CIroDIJWNKESwsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738927261; c=relaxed/simple;
	bh=qhJehbDnCc0pejxhvq0x4zcRJyh/4iNQH72cN1mBS5o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SOa2BDrfHhVMNGY+/ze2GVZSZNO2wCSNbrBN4oSfzu//8T8qSfEkmAwxLglMC3lJ0sJyOLAO4f7vbNKm7zetSYZbupjkff1QOQvuAdPL4az5h225ZZpehf9sfGFr1n1UvDyJbg7p++JOHjn3s4sU+pqyt/TGGfUR0+IWzOMGQCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ADRQx5PG; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ADRQx5PG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738927260; x=1770463260;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=qhJehbDnCc0pejxhvq0x4zcRJyh/4iNQH72cN1mBS5o=;
  b=ADRQx5PG+QDxx6kHOtrRySWRMMzPWATwD/e+IiU38iLmM8FVcP+fAR3Y
   L0JIF1OIk4YwDCSXSUSHxPx4JBjSesIF4PKFhTlJIbamD1MZ9WFx21Gtk
   0P0ZnHEjsvQbfGPWpvUlB7+jFG7Mhtm1Q2qk4gnqOdwqgFSAUoWEmU+cN
   KpXSI44qllozVFFQzAsQXwalcime9xZTKRe9U1oKxuswdSIYhaPp6pApr
   Sc2/I2AEuvdQWAcOrUZxqRRxw0XevLkhBH35NMapGnLGRrxMHnnoB7nps
   PK0mB6fXDi5sv252FUPMHG9JFfAXphopDFtatjH2x6jJtd/pdrf3w189i
   A==;
X-CSE-ConnectionGUID: W+2ucGCgRgmMx1XOhq3EZQ==
X-CSE-MsgGUID: rfMrDTTTTKeLFoJRLwJjMg==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="39591090"
X-IronPort-AV: E=Sophos;i="6.13,266,1732608000"; 
   d="scan'208";a="39591090"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2025 03:20:58 -0800
X-CSE-ConnectionGUID: xOJ3hMbDQIepXwrIHaDpxA==
X-CSE-MsgGUID: gkPwOPkpTx+o6AVrHntcPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,266,1732608000"; 
   d="scan'208";a="111463885"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.245.177.77]) ([10.245.177.77])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2025 03:20:54 -0800
Message-ID: <9e4dc499-395f-4255-b854-12b665f37cdd@linux.intel.com>
Date: Fri, 7 Feb 2025 12:20:31 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] MAINTAINERS: Add TTM reviewers
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 intel-xe@lists.freedesktop.org
Cc: Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Dave Airlie <airlied@gmail.com>, Simona Vetter <simona.vetter@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250206103544.36971-1-thomas.hellstrom@linux.intel.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@linux.intel.com>
In-Reply-To: <20250206103544.36971-1-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


On 2/6/2025 11:35 AM, Thomas Hellström wrote:
> Add Matthew Auld and Matthew Brost as TTM reviewers
>
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Christian König <christian.koenig@amd.com>
> Cc: Dave Airlie <airlied@gmail.com>
> Cc: Simona Vetter <simona.vetter@ffwll.ch>
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Reviewed-by: Christian König <christian.koenig@amd.com>
Acked-by: Nirmoy Das <nirmoy.das@intel.com>
> ---
>  MAINTAINERS | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 4dbf6a03e416..7a032ea9f109 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -7931,6 +7931,8 @@ F:	include/drm/drm_privacy_screen*
>  DRM TTM SUBSYSTEM
>  M:	Christian Koenig <christian.koenig@amd.com>
>  M:	Huang Rui <ray.huang@amd.com>
> +R:	Matthew Auld <matthew.auld@intel.com>
> +R:	Matthew Brost <matthew.brost@intel.com>
>  L:	dri-devel@lists.freedesktop.org
>  S:	Maintained
>  T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
