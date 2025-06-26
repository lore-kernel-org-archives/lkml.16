Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C94411713;
	Thu, 26 Jun 2025 09:30:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750930232; cv=none; b=gyQlle2x+L9+sD3H920JikoOw50TkBWCZYGjPMUMboXfO83nxG8xZhbjlHdWe4d+mEPAVlcECCOH0XVo+8pkLUNZ4lLOq0ltgLM0XbhJhfgSoQcJ0xgTAOO1iHZ9DJab3D9JjbNT/aOAfecocXbLtlPDRCAWaZ3h6+axQ0ZRFNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750930232; c=relaxed/simple;
	bh=jSVIUjU+J/poTSdUN23GXuGpiPjk1GcoOf3OqnRCH00=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PF9JJ9ziqNEtk5AvE87avx3b4w44eTlGh6OzbNwvCQaoiXycyoxHBuFKOELKhNgpxC/DwZh0upCMbJ/IiUgKkaEn4XONBsMRFNRSVwgjb/0YAqiKm8uHD8yluaX9/GKQ4ZBNeypBt7OLs/5uQW7d9PpO/V1JGSNWd3IGt3s3QHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y3EUADHD; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y3EUADHD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750930232; x=1782466232;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=jSVIUjU+J/poTSdUN23GXuGpiPjk1GcoOf3OqnRCH00=;
  b=Y3EUADHD7OcDKizfhmZ6Vwg0RY0OhIAMVVgGftYN1IDUII4yo/YoEi0B
   FgGBDq5t15crXfQAYhv6Xb+uofRG+NIhLKfmiVFbp/2qoF2zlNgz0P+d7
   5saGtIlTTxY3q7O/NtqleqUGm5m+qGe1OUxdch1TNN69IVxvJUqpE+B44
   4NQxF52ESgbfgotdo6oMTrGTKHwERByDIUwEB1kaeU1L60MJs74IIeajO
   22AUgEt333IjcfYe6nEwXVWgd5jaBcqNgqyAGvo4eqCCIDWasUpaxESE7
   i1ls+e9JUos/Q6ytwhx0hDvM9xATbtgNz8oX/Wpo48JdvKkWxTA1vBr88
   g==;
X-CSE-ConnectionGUID: 7L/UJJXjRPuLqo7vujSqxA==
X-CSE-MsgGUID: Skvm+pN4T5Sf5Ii//KV6Jg==
X-IronPort-AV: E=McAfee;i="6800,10657,11475"; a="53184571"
X-IronPort-AV: E=Sophos;i="6.16,267,1744095600"; 
   d="scan'208";a="53184571"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2025 02:30:31 -0700
X-CSE-ConnectionGUID: zM8mGyeLSOS3E8LKta81zg==
X-CSE-MsgGUID: kIhc50xCQ36WGZItsSLfvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,267,1744095600"; 
   d="scan'208";a="152970913"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa008.jf.intel.com with ESMTP; 26 Jun 2025 02:30:28 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id C252421E; Thu, 26 Jun 2025 12:30:26 +0300 (EEST)
Date: Thu, 26 Jun 2025 12:30:26 +0300
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: zhangjianrong <zhangjianrong5@huawei.com>
Cc: andreas.noever@gmail.com, michael.jamet@intel.com,
	YehezkelShB@gmail.com, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, guhengsheng@hisilicon.com,
	caiyadong@huawei.com, xuetao09@huawei.com, lixinghang1@huawei.com
Subject: Re: [PATCH] thunderbolt: Confirm the necessity to configure asym
 link first
Message-ID: <20250626093026.GJ2824380@black.fi.intel.com>
References: <20250626084107.2710306-1-zhangjianrong5@huawei.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250626084107.2710306-1-zhangjianrong5@huawei.com>

Hi,

On Thu, Jun 26, 2025 at 04:41:07PM +0800, zhangjianrong wrote:
> Current implementation can cause allocation failures in
> tb_alloc_dp_bandwidth() in some cases. For example:
> allocated_down(30Gbps), allocated_up(50Gbps),
> requested_down(10Gbps).

I'm not sure I understand the above.

Can you describe in which real life situation this can happen?

> 
> Signed-off-by: zhangjianrong <zhangjianrong5@huawei.com>
> ---
>  drivers/thunderbolt/tb.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/thunderbolt/tb.c b/drivers/thunderbolt/tb.c
> index a7c6919fbf97..558455d9716b 100644
> --- a/drivers/thunderbolt/tb.c
> +++ b/drivers/thunderbolt/tb.c
> @@ -1039,6 +1039,9 @@ static int tb_configure_asym(struct tb *tb, struct tb_port *src_port,
>  			break;
>  
>  		if (downstream) {
> +			/* Does consumed + requested exceed the threshold */
> +			if (consumed_down + requested_down < asym_threshold)
> +				continue;
>  			/*
>  			 * Downstream so make sure upstream is within the 36G
>  			 * (40G - guard band 10%), and the requested is above
> @@ -1048,20 +1051,17 @@ static int tb_configure_asym(struct tb *tb, struct tb_port *src_port,
>  				ret = -ENOBUFS;
>  				break;
>  			}
> -			/* Does consumed + requested exceed the threshold */
> -			if (consumed_down + requested_down < asym_threshold)
> -				continue;
>  
>  			width_up = TB_LINK_WIDTH_ASYM_RX;
>  			width_down = TB_LINK_WIDTH_ASYM_TX;
>  		} else {
>  			/* Upstream, the opposite of above */
> +			if (consumed_up + requested_up < asym_threshold)
> +				continue;
>  			if (consumed_down + requested_down >= TB_ASYM_MIN) {
>  				ret = -ENOBUFS;
>  				break;
>  			}
> -			if (consumed_up + requested_up < asym_threshold)
> -				continue;
>  
>  			width_up = TB_LINK_WIDTH_ASYM_TX;
>  			width_down = TB_LINK_WIDTH_ASYM_RX;
> -- 
> 2.34.1
