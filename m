Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3934125332A;
	Tue, 11 Feb 2025 15:40:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739288446; cv=none; b=SUKvRvUG4Kq7y05Bm/e0CQS5KCEBswf9hnFwBCY6YC6HuZN5TITkjlAPd73trlAqgB/jPw6duDKUU9B0G9nOALCT5/c7x2jpB9zQCOmMAqS3yYPmJJ0FU83iwibg/f8ASJVNDMRdbWJCs9T6VekHI56GQwGIjHyGb0xSiuTOwpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739288446; c=relaxed/simple;
	bh=IRqvT2gFAGKgf/HJpQvxM4rKmMf2ytFeZ3wxmbUMJnk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EVclyc/Swg7bZ+wMqxyQhritgDbzpm/k9t7XqENDw+L4YhK4/m1pAu84vZDnGHBwO4aJB/45RGEY8Ld9pscxP7MuXl5O4EJtQ/QWualBYfu4X5Ijdp8c2hHI2G0HFGLd1JblYhduJtJHGMk4zYRi4TX3ER/RNXVZ/xXImntk9ik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Jhwwqmc3; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Jhwwqmc3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739288445; x=1770824445;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=IRqvT2gFAGKgf/HJpQvxM4rKmMf2ytFeZ3wxmbUMJnk=;
  b=Jhwwqmc3NIHoBAPhyE4OGIktOqgyFUJv/dhY6zxFCjMF/ZpdOe7eW/9l
   SD/xXu+wk+5q3YQZmBXFlLRXGkb3fFF1wZzSSl7Asdz0+Y+EYLf7VLl6N
   vRpL6ZvNuMAFkv4TMX2Vu8UwlXnKt8oY1i4zBY4kaOgX2aT1e4GkA9+73
   9NRXxkZTxbgD8iObE62BElu3xMY3/fbBHE0pjEimMNOWBj2x7hrFc2lmU
   1mbTJ+7MoEg4kuRniWjuoI79Nayj1Q3Kmc03RojVggQZdUA6bp9sK1BP3
   RoyA13M6P9U6JQuEg+TypD4Y66TQzar6mB3bTnJkQ00mXdv5Am0+8gNq3
   g==;
X-CSE-ConnectionGUID: BhT/ROXlTBiDXMKDhhcOtg==
X-CSE-MsgGUID: cjA5z0ufQnejZcj+RthTeQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11342"; a="51307177"
X-IronPort-AV: E=Sophos;i="6.13,277,1732608000"; 
   d="scan'208";a="51307177"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2025 07:40:43 -0800
X-CSE-ConnectionGUID: pWAKKPsrRrKX/y3Ug34QtQ==
X-CSE-MsgGUID: s7huuwbJRX+TrPVK3UY41Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="149730920"
Received: from unknown (HELO [10.237.72.199]) ([10.237.72.199])
  by orviesa001.jf.intel.com with ESMTP; 11 Feb 2025 07:40:41 -0800
Message-ID: <7bb25848-c80e-4ba8-8790-8628951806b3@linux.intel.com>
Date: Tue, 11 Feb 2025 17:41:39 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] usb: xhci: Skip only one TD on Ring Underrun/Overrun
To: Michal Pecio <michal.pecio@gmail.com>,
 Mathias Nyman <mathias.nyman@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Niklas Neronin <niklas.neronin@linux.intel.com>,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250210083718.2dd337c3@foxbook>
 <20250210084220.3e5414e9@foxbook>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <20250210084220.3e5414e9@foxbook>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10.2.2025 9.42, Michal Pecio wrote:
> If skipping is deferred to events other than Missed Service Error itsef,
> it means we are running on an xHCI 1.0 host and don't know how many TDs
> were missed until we reach some ordinary transfer completion event.
> 
> And in case of ring xrun, we can't know where the xrun happened either.
> 
> If we skip all pending TDs, we may prematurely give back TDs added after
> the xrun had occurred, risking data loss or buffer UAF by the xHC.
> 
> If we skip none, a driver may become confused and stop working when all
> its URBs are missed and appear to be "in flight" forever.
> 
> Skip exactly one TD on each xrun event - the first one that was missed,
> as we can now be sure that the HC has finished processing it. Provided
> that one more TD is queued before any subsequent doorbell ring, it will
> become safe to skip another TD by the time we get an xrun again.
> 
> Signed-off-by: Michal Pecio <michal.pecio@gmail.com>
> ---
>   drivers/usb/host/xhci-ring.c | 12 ++++++++++++
>   1 file changed, 12 insertions(+)
> 
> diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
> index 878abf5b745d..049206a1db76 100644
> --- a/drivers/usb/host/xhci-ring.c
> +++ b/drivers/usb/host/xhci-ring.c
> @@ -2875,6 +2875,18 @@ static int handle_tx_event(struct xhci_hcd *xhci,
>   
>   			if (!ep_seg && usb_endpoint_xfer_isoc(&td->urb->ep->desc)) {
>   				skip_isoc_td(xhci, td, ep, status);
> +
> +				if (ring_xrun_event) {
> +					/*
> +					 * If we are here, we are on xHCI 1.0 host with no idea how
> +					 * many TDs were missed and where the xrun occurred. Don't
> +					 * skip more TDs, they may have been queued after the xrun.
> +					 */
> +					xhci_dbg(xhci, "Skipped one TD for slot %u ep %u",
> +							slot_id, ep_index);
> +					break;

This would be the same as return 0; right?

Whole series looks good, I'll add it

-Mathias

