Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87117264FB0;
	Wed, 21 May 2025 12:28:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747830503; cv=none; b=fhT+RzvkX5u2kQc3jDlwtn6wHyKd+8X52VFW7O/Lmlznz5i+iG45zIJL0+l8QhhveFejvAs9Y8jApffyzsnKZ4GvaQmBq6CsBaB73MXObVokUXT6VI6/OGG9gPoim2PXBrkiN/NaQzkiISmEPBLT/8YBV0lBEhqTCdnHntIibU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747830503; c=relaxed/simple;
	bh=qu/epRmiXykPhanq0RDGrw+4P7/CFr+xmyjZ3UDxo0c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OHPuj6aDLkpV6cQ+R5Uyuo7Ej4iwQiI6UXrdHG9zTH6YPDOVi54OxLZRrp0NUFNHmj46X2Sx2QVgAlOPaoB/vyDDz4So+NVxoTxhG75f4WJPnWA1faMD8WIjw7n9J8m5SYcY9EkXbBK/LxRxK9D55rvW8q9or3/a7usdI2iBRik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ebaUAPLJ; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ebaUAPLJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747830502; x=1779366502;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=qu/epRmiXykPhanq0RDGrw+4P7/CFr+xmyjZ3UDxo0c=;
  b=ebaUAPLJD8bq9dgYy88qnKzUxAo0rsCe1DWf0gGbQn/i70SOUSxKmBNV
   34NV5gWFaD61dFNUrnjkeliycbURtb+l9TMcuSSD1yk771sHjE9zSzWLT
   k2W5kiBIr+MgqB7SDZCTvTAnxRL8ImmU27hqLplPDSeDMKqxyZAgkshYg
   dyt6jOx7D4Z/jBC8WzYYSoWeXVC9s1FU18RWoXzlVxuN7Q5x0hFXrB1wg
   hbbPoNmFmyXqJNLRn83a8shzrckylf8gCiceJUSOlhrrJLph7MOGOGv04
   OSQVajzH4AakGyK2DgP0ERVGMvSdhAU9t/D4R65L/ZEN52EgXqsuAbx5O
   Q==;
X-CSE-ConnectionGUID: nAFt3BalQmCQo6cvFWp/GQ==
X-CSE-MsgGUID: a+K6GEDwQX+Sb0xXaSX4nQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11440"; a="49680177"
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; 
   d="scan'208";a="49680177"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2025 05:28:21 -0700
X-CSE-ConnectionGUID: 5en+cvpgSB2571Kf+/6/5g==
X-CSE-MsgGUID: /8OMT5gLQiqQTNy//jOHZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; 
   d="scan'208";a="170924053"
Received: from unknown (HELO [10.237.72.199]) ([10.237.72.199])
  by orviesa002.jf.intel.com with ESMTP; 21 May 2025 05:28:19 -0700
Message-ID: <e6f782db-5818-4d6c-99e0-bcf300fc5b4f@intel.com>
Date: Wed, 21 May 2025 15:28:17 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] USB: core: add a memory pool to urb caching
 host-controller private data
To: David Wang <00107082@163.com>, gregkh@linuxfoundation.org
Cc: oneukum@suse.com, stern@rowland.harvard.edu, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250517083819.6127-1-00107082@163.com>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@intel.com>
In-Reply-To: <20250517083819.6127-1-00107082@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 17.5.2025 11.38, David Wang wrote:
> ---
> Changes since v2:
> 1. activat the pool only when the urb object is created via
> usb_alloc_urb()
> Thanks to Oliver Neukum <oneukum@suse.com>'s review.
> ---
> URB objects have long lifecycle, an urb can be reused between
> submit loops; The private data needed by some host controller
> has very short lifecycle, the memory is alloced when enqueue, and
> released when dequeue. For example, on a system with xhci, in
> xhci_urb_enqueue:
> Using a USB webcam would have ~250/s memory allocation;
> Using a USB mic would have ~1K/s memory allocation;
> 
> High frequent allocations for host-controller private data can be
> avoided if urb take over the ownership of memory, the memory then shares
> the longer lifecycle with urb objects.
> 
> Add a mempool to urb for hcpriv usage, the mempool only holds one block
> of memory and grows when larger size is requested.
> 
> The mempool is activated only when the URB object is created via
> usb_alloc_urb() in case some drivers create a URB object by other
> means and manage it lifecycle without corresponding usb_free_urb.

Won't this still allocate a lot of unnecessary memory for the roothub urbs?
i.e. the ones queued with rh_urb_enqueue(hcd, urb).
The host drivers don't use the urb->hcpriv of those URBs.

This would be the roothub status URB, and every hub request sent
during device enumeration for devices connected to the roothub.

Is this whole URB hcpriv mempool addition an actual issue that needs fixing?

If yes then I still think it's better to do it in the host driver like I
described earlier. I don't think it will be too complex

Thanks
-Mathias



