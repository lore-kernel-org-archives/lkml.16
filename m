Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AE932EBB94;
	Thu, 26 Jun 2025 15:50:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750953016; cv=none; b=Cn3IW3mGpf+J5+/xyEaGN2hsu7EIej/wP7ITQiIGKmtXjyUSCOsFhLO17146lA2YuLBCzlmQ2zayVk9CqFLbKM5S4WZVSNO5Ea7ZmGvsfqegrB91lo4L+FVBh30WYAuy1Ruc3nzKRWjXrLtvPOpHqelbiI4TGriZ4shHdvgpTKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750953016; c=relaxed/simple;
	bh=IKyNrNO05dxmhNUJyWkxJMbolc2ZnJKiV6fh31BcteQ=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=Ib6DdkFgNo5bhEsFxaxrZG4uY2Lt0oDi9RN+TW477kq2JiS6NhtKRRQG+WU/JUaEYkm0Fk9YoqS3Xz/G6M0RyqjuvQ4JTbk2H2jowY4Si1vk29L1lgVCeWIRF+cLMGmf5/+yw8wKLt5cF7jKwFcUyKsSkJWWUsUyeO+xqiVbIYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IEFugxIX; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IEFugxIX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750953015; x=1782489015;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=IKyNrNO05dxmhNUJyWkxJMbolc2ZnJKiV6fh31BcteQ=;
  b=IEFugxIXqCvyB4YvPRKMqsf2q0TCa1K32BHR89DK6qwnjHC4NZ1A+WCn
   UTZVrSJrV16MRoIWZlY8tzZbZo2KXmAui+BGTSeKMOR969an99+C52nUB
   h5I06mtkMuXXPr0dToe4yVwX6BUCZhNntgH4AxGerKthS2P5NLZwJBGhg
   frf1eLpQTl26qiH6hCl565MyXHwe38KFi5a0dxlV9ytXPCnTSOHHZig4n
   wo44ito81UXlBZzxxaUn3lIwitmoNaOj7tWZRN/M13fgh3E23TodyVTbR
   hgs15wq5meBbsESGFSILyuy9j06HPUzZYm72F1r+2TuYp5kwfbYvRYpiz
   A==;
X-CSE-ConnectionGUID: 25eOgMDDTO2/3gcndKCqRg==
X-CSE-MsgGUID: PtYWQzD6TMCfCUcLPxRpMQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11476"; a="63513101"
X-IronPort-AV: E=Sophos;i="6.16,268,1744095600"; 
   d="scan'208";a="63513101"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2025 08:50:14 -0700
X-CSE-ConnectionGUID: n8tPLJOzSA+l7H/xENT91Q==
X-CSE-MsgGUID: r2uyqN55TPqeCRZzCnVDRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,268,1744095600"; 
   d="scan'208";a="152068186"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.144])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2025 08:50:12 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Thu, 26 Jun 2025 18:50:07 +0300 (EEST)
To: Shravan Kumar Ramani <shravankr@nvidia.com>
cc: Vadim Pasternak <vadimp@nvidia.com>, 
    David Thompson <davthompson@nvidia.com>, 
    platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, 
    David Thompson <davthomspson@nvidia.com>
Subject: Re: [PATCH v2 1/2] platform/mellanox: mlxbf-pmc: Replace strcmp with
 strncmp
In-Reply-To: <fbb8ab5fd566369cc47e9f23b9f4ac25dde009b8.1750245955.git.shravankr@nvidia.com>
Message-ID: <f8437991-2688-33f8-3843-4e5ffe72a308@linux.intel.com>
References: <cover.1750245955.git.shravankr@nvidia.com> <fbb8ab5fd566369cc47e9f23b9f4ac25dde009b8.1750245955.git.shravankr@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 18 Jun 2025, Shravan Kumar Ramani wrote:

> Since the input string passed via the command line appends a newline char,
> comparison using strcmp is not correct. Use the string length of the
> event_list entries to match the string using strncmp instead.

Please include () after any function name (don't forget those in the 
shortlog).

> Fixes: 1a218d312e65 ("platform/mellanox: mlxbf-pmc: Add Mellanox BlueField PMC driver")
> Signed-off-by: Shravan Kumar Ramani <shravankr@nvidia.com>
> Reviewed-by: David Thompson <davthomspson@nvidia.com>
> ---
>  drivers/platform/mellanox/mlxbf-pmc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/mellanox/mlxbf-pmc.c b/drivers/platform/mellanox/mlxbf-pmc.c
> index 900069eb186e..366c0cba447f 100644
> --- a/drivers/platform/mellanox/mlxbf-pmc.c
> +++ b/drivers/platform/mellanox/mlxbf-pmc.c
> @@ -1215,7 +1215,7 @@ static int mlxbf_pmc_get_event_num(const char *blk, const char *evt)
>  		return -EINVAL;
>  
>  	for (i = 0; i < size; ++i) {
> -		if (!strcmp(evt, events[i].evt_name))
> +		if (!strncmp(evt, events[i].evt_name, strlen(events[i].evt_name)))

So if there's extra garbage behind the input, it will also match 
spuriously? So store the len and reduce it if there's a trailing newline 
to make it more robust?

>  			return events[i].evt_num;
>  	}
>  
> 

-- 
 i.

