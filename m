Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0E50214A99
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 11:59:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738843177; cv=none; b=U1JqlJa9UEx1tW9cUTIXkAkf/i55J3kxjZqa1kXdAs1DmRzDhI96unFws6oOk8cvOOwO5p0DnZWQDfebb/p4eXT2umwWd4CnAxGgLEKRzhRIFyYRbsWusAQ6J4hzsoLi+YZIIpNljzR1E+ZniRX+XsdWJVABBxSNVhlgzHWt4IY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738843177; c=relaxed/simple;
	bh=ioPTGCPofV7P0tYMQ4o8OJoZbYdhcIwWFsqfn2L38M4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=k2AO+Kmv/P02R2zRsDKnYJufixTuHJ4PJS01NJDn53gAu5pFgD/jZcdl5nQrfy5ePJIp1wTejdk4xy6YV8swt9CRCm0wcVE8bSX6+6wMKyU8F8Pps+k/KPy9/bNCG7Uhl/kEOUyHWt3XYL1lk/BLbri/C/oIrc2d8flJfCgbTFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QT+ylbYM; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QT+ylbYM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738843176; x=1770379176;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=ioPTGCPofV7P0tYMQ4o8OJoZbYdhcIwWFsqfn2L38M4=;
  b=QT+ylbYMNb1X550tKkO6ldrf7ZgEVylgSIp7tgKOD0UaopU4DSa+buy4
   lJ1lNDyjLM70twhRbiMZ2o4WyAiYUYgggfr8QK+uiZhUQUFp2YcrPURxa
   NgPSiWbOUll6p/4DAa+AXuK/Va7CRBlHQdM/2xLVA8fgpjABpf6oQDRUY
   zWvWEvgZNneWLf7+tRLkCUA2Q9NU4jThaWtrlcKeLNCuB34AwHMi2lbYX
   PgbXzhAlOR/5vcdhgIP19regmwliIwJR0Z6u4c0wfdL+9v7e+rAujZGZs
   Zrspd7AFe7DT0RDgOe6rmrhiJpiqvOzOBmm/z6I3o0/ZCUs/ibUZcek0f
   A==;
X-CSE-ConnectionGUID: gpFxx3SASlOW2pE4wbjGqw==
X-CSE-MsgGUID: F1OYwYpHRkeI5YlwlLsChw==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="39336030"
X-IronPort-AV: E=Sophos;i="6.13,264,1732608000"; 
   d="scan'208";a="39336030"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2025 03:59:35 -0800
X-CSE-ConnectionGUID: yYgjYDCMQByCg51kYtppzQ==
X-CSE-MsgGUID: NM5ahS0wSIaMk76ftmKLVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,264,1732608000"; 
   d="scan'208";a="110972140"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO [10.245.245.197]) ([10.245.245.197])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2025 03:59:33 -0800
Message-ID: <f94d793f-bfde-411c-afa1-3325692356a6@intel.com>
Date: Thu, 6 Feb 2025 11:59:30 +0000
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
Cc: Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Dave Airlie <airlied@gmail.com>, Simona Vetter <simona.vetter@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250206103544.36971-1-thomas.hellstrom@linux.intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20250206103544.36971-1-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 06/02/2025 10:35, Thomas Hellström wrote:
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

Acked-by: Matthew Auld <matthew.auld@intel.com>

> ---
>   MAINTAINERS | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 4dbf6a03e416..7a032ea9f109 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -7931,6 +7931,8 @@ F:	include/drm/drm_privacy_screen*
>   DRM TTM SUBSYSTEM
>   M:	Christian Koenig <christian.koenig@amd.com>
>   M:	Huang Rui <ray.huang@amd.com>
> +R:	Matthew Auld <matthew.auld@intel.com>
> +R:	Matthew Brost <matthew.brost@intel.com>
>   L:	dri-devel@lists.freedesktop.org
>   S:	Maintained
>   T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git

