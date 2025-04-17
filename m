Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DCC4226D04;
	Thu, 17 Apr 2025 08:53:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744879992; cv=none; b=red9b2a8FaFtw98/MQA1LIi/AKk+FPI/A+l63syZl5sYzppzgqEPkyqmGNHdejs30gIZurR3Vg+GY5tE8dnmg9BtzyTxvVDNm+J9CfgGgT2gED8gH7uNMVKOvZqlxBXn7rT4cokhZx4a7NCs46FNSea1/342dtDDN8ksOlbtnbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744879992; c=relaxed/simple;
	bh=wKCalXk6kbea2MwUn3t6V9z/d804JF4equ6JkzR3gX0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=teTVr4ft2D3q3LoZoxsK/OPjo9xkRQCAmeOSwIPq1LrmNZlOu/hLnI6fD4+KY7PQRvLxOnorvIWHPYSNaIS7YTY2FBLJQtN2x+gAkAtDRqKTn3GZZ3h3ap8DAhxc1Y5VDizZRikeI3e/MDU0Ygj1wLl6JO4jmYXA/69sJBy+orU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i8PJsRMT; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i8PJsRMT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744879991; x=1776415991;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=wKCalXk6kbea2MwUn3t6V9z/d804JF4equ6JkzR3gX0=;
  b=i8PJsRMTczp9QrYiwzP0BKa9XqXhsxBEBraXz6Alafffn6HFXaYJ8O2R
   hgpjmTxivMC/yl3fQZHFZhBGl/6+wILtjjz3/VAQt4GCbqZnJFlmu1bBZ
   aQ5ZycRJerO5VVUD6DOKlLjuDYtOVvqXQflayeM2HxIIOlgJhdP0u1RI5
   mP0C2NqIyXMzFLNevPwBpEEvB/bnfp0atTGacIcLdNYtt3oe1SEwBigUd
   aztegEYD8OyL9qN2qeKUQokWgJ2GUmLnAT+RXB+uYErU4/byuvITE7o0c
   FMl41YfVpvpHM2m7HXl6qeP35EHVtq9LWDjXgaCVNJ3RQWBI+K8X7E2b7
   Q==;
X-CSE-ConnectionGUID: GTIwJ81xTEWoJ4hAh/St9A==
X-CSE-MsgGUID: HJAcqcD1T/ys66BHfo+QYw==
X-IronPort-AV: E=McAfee;i="6700,10204,11405"; a="45592049"
X-IronPort-AV: E=Sophos;i="6.15,218,1739865600"; 
   d="scan'208";a="45592049"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2025 01:53:09 -0700
X-CSE-ConnectionGUID: FmgieLMYRmeOrMDlpCaTHw==
X-CSE-MsgGUID: Ok8aMF9WQvqRaoKBnirFgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,218,1739865600"; 
   d="scan'208";a="130697790"
Received: from unknown (HELO [10.237.72.199]) ([10.237.72.199])
  by orviesa006.jf.intel.com with ESMTP; 17 Apr 2025 01:53:07 -0700
Message-ID: <fac2fc0a-8352-4036-80b7-1194ca382f70@linux.intel.com>
Date: Thu, 17 Apr 2025 11:54:19 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] usb: hcd: Add a usb_device argument to
 hc_driver.endpoint_reset()
To: Michal Pecio <michal.pecio@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Mathias Nyman <mathias.nyman@intel.com>,
 Minas Harutyunyan <hminas@synopsys.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Alan Stern <stern@rowland.harvard.edu>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250415111003.064e0ab8@foxbook>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <20250415111003.064e0ab8@foxbook>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 15.4.2025 12.10, Michal Pecio wrote:
> xHCI needs usb_device here, so it stored it in host_endpoint.hcpriv,
> which proved problematic due to some unexpected call sequences from
> USB core, and generally made the code more complex than it has to be.
> 
> Make USB core supply it directly and simplify xhci_endpoint_reset().
> Use the xhci_check_args() helper for preventing resets of emulated
> root hub endpoints and for argument validation.
> 
> Update other drivers which also define such callback to accept the
> new argument and ignore it, as it seems to be of no use for them.
> 
> This fixes a 6.15-rc1 regression reported by Paul, which I was able
> to reproduce, where xhci_hcd doesn't handle endpoint_reset() after
> endpoint_disable() not followed by add_endpoint(). If a configured
> device is reset, stalling endpoints start to get stuck permanently.
> 
> Reported-by: Paul Menzel <pmenzel@molgen.mpg.de>
> Closes: https://lore.kernel.org/linux-usb/c279bd85-3069-4841-b1be-20507ac9f2d7@molgen.mpg.de/
> Signed-off-by: Michal Pecio <michal.pecio@gmail.com>
> ---

All xhci changes look good to me

Acked-by: Mathias Nyman <mathias.nyman@linux.intel.com>

