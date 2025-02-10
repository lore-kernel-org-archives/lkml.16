Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC1161C4A0A;
	Mon, 10 Feb 2025 09:43:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739180615; cv=none; b=f9Y3KqhnLP8+shEhX6IdS2mOO5FRvs+z0HFgI5JAc341X88xYwB5OoQB7dvt5tT5ldDWTTKTh5ATtS7reqyDi7MiQO1uVxEazySe1MzK6Pqw8ecAc8RbuNBNBiKnxpRhvJhlBEYaf5wC+LRhDjzPuqUYdqilIsFwmRF58aRncaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739180615; c=relaxed/simple;
	bh=0pUNFOEBOA/bUdc92ju0BJmYOTZUzllU9khd7afAmBk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OtRqujkcvNcKP1QW7GjAMf5GuQcCkHidQxF+TbQG4dSiBounrtkE5TMR2iYz7l3qqB12Luhpq8lBqF6kXKjQuLNe3SYo75/X0BzODlbNHvQAm6Gs2O28XcZdVZlIpZwGuj8pvkFIzuwRD5aJsf+HM/hD6IbV18lhnATXoT4P2TI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Sa87ltDx; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Sa87ltDx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739180614; x=1770716614;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=0pUNFOEBOA/bUdc92ju0BJmYOTZUzllU9khd7afAmBk=;
  b=Sa87ltDxS8HYG0otW5hWUsqW5srPJLFDAG4+CiTIkrLaapVZbbxr/HDe
   KPzmGyvAiTmzTqce/3bhR0oBSTZSxtQw2FnogyT0h1w/jPONsaYK45E2A
   4BJlTDGxymkMmsJiY5wDmSqYgzdAio5VsyFE/JyJ/dcU/wS4z5P1bjC92
   4+RwYoMSYCOlPV2DuYZYphClqVP1FU5+zLHlIIr5NJ25VL7yP84i5+4kM
   jJ38Xr+nrfim4JvRpSJdiqIPOcUtuL1rGDLVKktRJrtVIt2nQxQnPX9ac
   HvredeICGntXEBYCR40M1gooDLvXx7HModRhFBpULm5siSQumY1xXKc5v
   w==;
X-CSE-ConnectionGUID: ugAQTnTTSPqgg94rUj/cXg==
X-CSE-MsgGUID: vOISYeibTX2Tk5rJQIlJlA==
X-IronPort-AV: E=McAfee;i="6700,10204,11340"; a="50737151"
X-IronPort-AV: E=Sophos;i="6.13,274,1732608000"; 
   d="scan'208";a="50737151"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2025 01:43:33 -0800
X-CSE-ConnectionGUID: O7W/l4usSU6qZYIIoAae/Q==
X-CSE-MsgGUID: pcTRZCcsSBeLLVNUDYD+7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="116208180"
Received: from mgorski-mobl1.ger.corp.intel.com (HELO [10.245.84.116]) ([10.245.84.116])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2025 01:43:29 -0800
Message-ID: <43eb87f7-0d47-43a7-b34a-9180f50de3b2@linux.intel.com>
Date: Mon, 10 Feb 2025 10:43:25 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/amdxdna: Add missing include linux/slab.h
To: Su Hui <suhui@nfschina.com>, min.ma@amd.com, lizhi.hou@amd.com,
 ogabbay@kernel.org
Cc: quic_jhugo@quicinc.com, George.Yang@amd.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org
References: <20250208080548.1062441-1-suhui@nfschina.com>
Content-Language: en-US
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20250208080548.1062441-1-suhui@nfschina.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

please move the header to the include block above an keep it sorted:
#include <linux/iopoll.h>
-->#include <linux/slab.h><--
#include <linux/xarray.h>


On 2/8/2025 9:05 AM, Su Hui wrote:
> When compiling without CONFIG_IA32_EMULATION, there are some errors:
> 
> drivers/accel/amdxdna/amdxdna_mailbox.c: In function ‘mailbox_release_msg’:
> drivers/accel/amdxdna/amdxdna_mailbox.c:197:2: error: implicit declaration
> of function ‘kfree’.
>   197 |  kfree(mb_msg);
>       |  ^~~~~
> drivers/accel/amdxdna/amdxdna_mailbox.c: In function ‘xdna_mailbox_send_msg’:
> drivers/accel/amdxdna/amdxdna_mailbox.c:418:11: error:implicit declaration
> of function ‘kzalloc’.
>   418 |  mb_msg = kzalloc(sizeof(*mb_msg) + pkg_size, GFP_KERNEL);
>       |           ^~~~~~~
> 
> Add the missing include.
> 
> Fixes: b87f920b9344 ("accel/amdxdna: Support hardware mailbox")
> Signed-off-by: Su Hui <suhui@nfschina.com>
> ---
>  drivers/accel/amdxdna/amdxdna_mailbox.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/accel/amdxdna/amdxdna_mailbox.c b/drivers/accel/amdxdna/amdxdna_mailbox.c
> index 814b16bb1953..80b4b20addd6 100644
> --- a/drivers/accel/amdxdna/amdxdna_mailbox.c
> +++ b/drivers/accel/amdxdna/amdxdna_mailbox.c
> @@ -12,6 +12,7 @@
>  
>  #define CREATE_TRACE_POINTS
>  #include <trace/events/amdxdna.h>
> +#include <linux/slab.h>
>  
>  #include "amdxdna_mailbox.h"
>  

