Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A28E21FF22;
	Tue, 13 May 2025 09:27:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747128460; cv=none; b=kMY/6LM8kGKOO93OgzAlCGI0xmZ8agOrFiJh3kmz58iMFHqNeH2BcVwLpsuBiHelMw6bguXiCGcAapz0GO3R3VO3ogtMjXH8478cXBnn5EBSIgofR/cMDif0ncnC4HswDO7faRxWDtLN16IEMuMa4O/pEXTL9EnEhIw+kiQT/gk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747128460; c=relaxed/simple;
	bh=qQ1Xl9OeIC7tmpYfxlEHSJMzlkn339EhffkvrA20+Z8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ekSR9/9AAGrCseYcgeaDHYjplH7SZnGeOKInrRmJ6fu7bVkjRDYrqxCIqG+FlTIooZmKBYuu5I24yK24cWW5U7C/qQwZNUkajCg/fEv7ZQSsV6c6Uy8QOaFu4CCtxBp+nWTEeBFJJ3ZuAyTFK0t8t9w20LnJmvm1cIAQMXtCxm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gYC5USjh; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gYC5USjh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747128459; x=1778664459;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=qQ1Xl9OeIC7tmpYfxlEHSJMzlkn339EhffkvrA20+Z8=;
  b=gYC5USjh+SV1ArN2STnQ2OgtCRP/4iPLqOVJMbRvBbLmh7d2yzAHUKi4
   /uYe743hvQAgbhvHCubMlCecNWwybICXJjCwXabtGPlIfukIMjjhqUCZ8
   Zu6y8vP2JvCLhrh+UjsJoW8EfIaO8dLkiTGpoG0rlNkUmsJOBb8zRp0rc
   1pVaqB8ykgDC36ZL4yRyvoMC405bkjTw/PKy4bVMeFcv2vJ5PlAy2ILwR
   YIXOjzdiKMjFcItFkwDSnmmDH7wzrFCidKwnvJqAm3kK1N/wWyfAfTO3Y
   PQC/d7GqRBVa+cjqAkRJAqKgakClB57I9C7JoXgNLZzdMZIHPndRwiNR4
   A==;
X-CSE-ConnectionGUID: n8C3EoRjQL6y8qJPMBHiRw==
X-CSE-MsgGUID: TfLiL8SkQMSIp0/v95QP1A==
X-IronPort-AV: E=McAfee;i="6700,10204,11431"; a="49128820"
X-IronPort-AV: E=Sophos;i="6.15,284,1739865600"; 
   d="scan'208";a="49128820"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2025 02:27:38 -0700
X-CSE-ConnectionGUID: iDqGChQvRi+ArYgcLuNRUA==
X-CSE-MsgGUID: EzMIU7fsTLGGO3x7pPVdxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,284,1739865600"; 
   d="scan'208";a="142411317"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO [10.245.244.214]) ([10.245.244.214])
  by orviesa003.jf.intel.com with ESMTP; 13 May 2025 02:27:36 -0700
Message-ID: <76b2a5ae-31b1-4627-aa59-8ff023654c3d@intel.com>
Date: Tue, 13 May 2025 12:27:34 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC] USB: core/xhci: add a buffer in urb for host controller
 private data
To: David Wang <00107082@163.com>, gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 surenb@google.com, kent.overstreet@linux.dev
References: <20250512150724.4560-1-00107082@163.com>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@intel.com>
In-Reply-To: <20250512150724.4560-1-00107082@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi David

On 12.5.2025 18.07, David Wang wrote:
> ---
> I was checking memory allocation behaviors (via memory profiling[1]),
> when I notice a high frequent memory allocation in xhci_urb_enqueue, about
> 250/s when using a USB webcam. If those alloced buffer could be kept and
> reused, lots of memory allocations could be avoid over time.
> 
> This patch is just a POC, about 0/s memory allocation in xhci with this
> patch, when I use my USB devices, webcam/keyboard/mouse.

Thanks for looking at this, this is something that obviously needs more
attention

> 
> A dynamic cached memory would be better: URB keep host controller's
> private data, if larger size buffer needed for private data, old buffer
> released and a larger buffer alloced.
> 
> I did not observe any nagative impact with xhci's 250/s allocations
> when using my system, hence no measurement of how useful this changes
> can make to user. Just want to collect feedbacks before putting more
> effort.
> 

I think we can make a xhci internal solution that doesn't affect other hosts
or usb core.

How about adding a list of struct urb_priv nodes for every usb device, or maybe
even per endpoint? i.e. to struct xhci_virt_device or  struct xhci_virt_ep.

Add size and list_head entries to struct urb_priv.

In xhci_urb_enqueue() pick the first urb_priv node from list if it exists and is
large enough, otherwise just allocate a new one and set the size.

When giving back the URB zero everything in the struct urb_priv except the size,
and add it to the list.

When the device is freed there shouldn't be any nodes left in the list, but if
there are then warn and free them.

Isoc transfers are the ones with odd urb_priv sizes. If we have a per device or
per endpoint urb_priv list then sizes will match better.

Thanks
Mathias


