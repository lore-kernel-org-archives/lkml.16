Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CE3B17BD3;
	Mon,  3 Feb 2025 08:46:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738572417; cv=none; b=mqkIrw1NOo+ix7L6f4RddkHzn1n2k5BiOUMhoIbpXESQLOe4rnWAJSEyLSEeG+fodUhSrSq2H8vZe4+Sk+5/zVLn6i+3Sbrp+5MsAM7QztnSJ8siuVDEBRMEYX/7X0q/2pjdB5pKFHvJsiXT64jpM8plj5Tn5+1UZWPDhVHWqCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738572417; c=relaxed/simple;
	bh=fqj386jbnvAP8Wc097t+fxVqlw/NW6Vd1ziqwevgQek=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bq3fwb9/zz8N8KBM8/tufqMXTLfhwTPfG+53UfKMowqjfipLxxfrnZspkv+5KqXLIDT/52Ew2jOCKHa8VIyPJRQ2Gk5r1ZXYZ3VIwFjZrlWC0yIGgvgw9oZ+X7j5jK/zPJyb7TLy4JORT7B89+vKpaO1LGT3dMj97eRAr1juC3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hVPfRfBx; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hVPfRfBx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738572416; x=1770108416;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=fqj386jbnvAP8Wc097t+fxVqlw/NW6Vd1ziqwevgQek=;
  b=hVPfRfBxgrcxz/1m6jJX6x8yo1FpdCTIRX0IQ9O7HkzrA0gKOHFP5Urv
   8sbTSO1mVpK3fkU30+Nk5x6o+wqAZM9OYFZrygBM9b/S7b2xJdCJyJ9PI
   Tpu8qt7xMaVlb+6RrnOMv0Xf45FRYqNaNmvqlpObcDaWSctGSDhDM4gi5
   WZXWQRw1cDhtLME0dL3OITYsNzAAtXtDwI1h046xHy03eBfwtYcpBGRyK
   tvz8anTPspHGArzj9jBwDgEQvSvvZ9uLsZqcOxOyNNoa/MVFEVqWGrb33
   RYt0SmgK+QAuTh1/L2xoZJPC/Dt5h2RQXi8L1EXdFEtgbHTwT7BCOdvSD
   g==;
X-CSE-ConnectionGUID: B929w0srRB+FWFGcp/1RpA==
X-CSE-MsgGUID: eZte649uReeWICfxO70cCw==
X-IronPort-AV: E=McAfee;i="6700,10204,11334"; a="61526920"
X-IronPort-AV: E=Sophos;i="6.13,255,1732608000"; 
   d="scan'208";a="61526920"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2025 00:46:55 -0800
X-CSE-ConnectionGUID: nKpJUq1JQVOv0vQQY7pc9w==
X-CSE-MsgGUID: 90lPz9VxSNKpfJGWtdDn7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="141094075"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa001.fm.intel.com with ESMTP; 03 Feb 2025 00:46:53 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id 12117214; Mon, 03 Feb 2025 10:46:51 +0200 (EET)
Date: Mon, 3 Feb 2025 10:46:51 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Mohammad Rahimi <rahimi.mhmmd@gmail.com>
Cc: andreas.noever@gmail.com, michael.jamet@intel.com,
	YehezkelShB@gmail.com, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] thunderbolt: Remove the TBT3 Not Supported bit
Message-ID: <20250203084651.GF3713119@black.fi.intel.com>
References: <20250203011842.13305-1-rahimi.mhmmd@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250203011842.13305-1-rahimi.mhmmd@gmail.com>

Hi,

On Mon, Feb 03, 2025 at 01:17:47AM +0000, Mohammad Rahimi wrote:
> Since USB4 v2 specification has removed the mandatory requirement to
> support TBT3 on a USB4 Dock UFP, the TBT3 Not Supported bit is not
> usable, as when it needs to be read there is no USB4 Link.
> 
> This change was introduced in a "USB4 2.0 ENGINEERING CHANGE NOTICE
> FORM" published in September 2024, titled "TBT3 Support on USB4 Dock
> UFP".

I think the USB4 v1 hardware still has this bit and since it is just
debugging there is no harm keeping it around.
