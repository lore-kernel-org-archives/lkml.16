Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C33E61DE4D2;
	Wed, 25 Jun 2025 06:40:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750833612; cv=none; b=Viz2MguYP9eebbCLOZDuy5laI7UXDPgVXjNwEvoTG4aBaptBwH3sTtLhC4tcZs4kcZuPNmfm0SrhHtezMK+L9umoz+OF7JQmHVS++WsmPWMTJMgT7dNIIgbd7YKO1rAj7hg6cx9qJGEGEUSwd8oqnrnZZ7ha0PLDfY7p9ndpiZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750833612; c=relaxed/simple;
	bh=WvclcHiT+DnHLH2WR+iDlvHyg2rAKG6EvtwH8ed+/00=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h3G8nRh+JTDlLlJxyNHJ6vL7W/iiFCb0m2dPCcp5EATda7va73MmP0g2SXU7Uwy65i6dCYtjsChc3TODBhtKuWYLtv3P5YO6aEGqPGM9YQ6/Sqdsiwu2zU8w38LVuLTOQBL23M96VHtSMMlO+GyVbOHnMByT6BCG5xjSuhVlEew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VoO4Xi3t; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VoO4Xi3t"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750833611; x=1782369611;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=WvclcHiT+DnHLH2WR+iDlvHyg2rAKG6EvtwH8ed+/00=;
  b=VoO4Xi3tQCmCZ8R3DD4xa97nKCjrVXIkyowFNtXwk/nT7DwC+qzhqijm
   V3uyHH8RNiN3mvcqhmpv4m8o4OVSdAwHpOMxGESaTUF4zRn/492WxWRIR
   bLptvB1Z0iPp+KFrUj10nSa1rIU3hpZXMp32uFQz8wkn76tXKGB5CYsB6
   lAjlwjS+95k+cQRDUoIH3EK6x4j4Nv9H0bWV4NST1GCwTcVRDC8Fe48Nf
   iP5rP5pVq/7FhWJTqjcw6+gQ9PYquAtmNd6HzGj+5Wybz+AJgLWmfBoWY
   c8JtvAs1wyA5Galug9MP6oMYbHjBBDlU6/Bla7ZIFWzh7EyrKpVIGVOp8
   g==;
X-CSE-ConnectionGUID: iUgQOOT7S5SR5SybiLkYEg==
X-CSE-MsgGUID: M2DGR9YTQpufHIOOn1vgAQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11474"; a="64527454"
X-IronPort-AV: E=Sophos;i="6.16,264,1744095600"; 
   d="scan'208";a="64527454"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2025 23:40:10 -0700
X-CSE-ConnectionGUID: ZIF/0KJFQFW+uymoaBwZcQ==
X-CSE-MsgGUID: Y85IJJu9T068YmCA47aOxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,264,1744095600"; 
   d="scan'208";a="152259090"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa006.fm.intel.com with ESMTP; 24 Jun 2025 23:40:07 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id 1E648138; Wed, 25 Jun 2025 09:40:06 +0300 (EEST)
Date: Wed, 25 Jun 2025 09:40:06 +0300
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: zhangjianrong <zhangjianrong5@huawei.com>
Cc: andreas.noever@gmail.com, michael.jamet@intel.com,
	YehezkelShB@gmail.com, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, guhengsheng@hisilicon.com,
	caiyadong@huawei.com, xuetao09@huawei.com, lixinghang1@huawei.com
Subject: Re: [PATCH] thunderbolt: Process xdomain response packets
 synchronously
Message-ID: <20250625064006.GE2824380@black.fi.intel.com>
References: <20250625062505.1596787-1-zhangjianrong5@huawei.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250625062505.1596787-1-zhangjianrong5@huawei.com>

On Wed, Jun 25, 2025 at 02:25:05PM +0800, zhangjianrong wrote:
> Xdomain response packets don't belong to async event. It seems
> no harm now but better to be fixed.

It seems odd but the protocol actually uses RESP packets also with requests
(probably a typo in the original specs but this is what Apple also
implemented so we need to support it). So we need to deal with them.

Did you try if this patch works against macOS for example?

> 
> Signed-off-by: zhangjianrong <zhangjianrong5@huawei.com>
> ---
>  drivers/thunderbolt/ctl.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/thunderbolt/ctl.c b/drivers/thunderbolt/ctl.c
> index 4bdb2d45e0bf..1873b64caf7c 100644
> --- a/drivers/thunderbolt/ctl.c
> +++ b/drivers/thunderbolt/ctl.c
> @@ -461,6 +461,7 @@ static void tb_ctl_rx_callback(struct tb_ring *ring, struct ring_frame *frame,
>  	case TB_CFG_PKG_ERROR:
>  	case TB_CFG_PKG_OVERRIDE:
>  	case TB_CFG_PKG_RESET:
> +	case TB_CFG_PKG_XDOMAIN_RESP:
>  		if (*(__be32 *)(pkg->buffer + frame->size) != crc32) {
>  			tb_ctl_err(pkg->ctl,
>  				   "RX: checksum mismatch, dropping packet\n");
> @@ -474,7 +475,6 @@ static void tb_ctl_rx_callback(struct tb_ring *ring, struct ring_frame *frame,
>  		break;
>  
>  	case TB_CFG_PKG_EVENT:
> -	case TB_CFG_PKG_XDOMAIN_RESP:
>  	case TB_CFG_PKG_XDOMAIN_REQ:
>  		if (*(__be32 *)(pkg->buffer + frame->size) != crc32) {
>  			tb_ctl_err(pkg->ctl,
> -- 
> 2.34.1
