Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64931225412;
	Mon,  7 Apr 2025 07:14:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744010063; cv=none; b=tQKtV3R8N1UOeWzFPVNW5/M4mWtaFWxJPEbVVV/h7wZVl+qUFuhRvVmU+awBOn6Vo5989xa0S7cXltvTwgOuLydVYrPFFRbaOE6fDh6hk3sx353Gd6LFWaMjzvjSGfrJJwK5reDUwoglDNFBM8nl7JDT0Gh04PqbeN/R+eSKU0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744010063; c=relaxed/simple;
	bh=IoJ/QPbazRVpsAOJM/Crsupeww6a0Sl51rezjRCdCOc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KAv0jg4PIaRuxFLRLPA83DwSl5VBpMp1WgwFj6Jd5FokM9t2sfKZl97x5sI0CflXvS7KPVHAmhZgXozRuHWEE9l39tJjD/neUgZ7d6FK4lbZt+GKczj8VGJnTZuGvAwwzGXjG1/pNJYZOWBbGTbBbU/JmiqOpDmMQsTJ0AtzwBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hCqZkpXd; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hCqZkpXd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744010061; x=1775546061;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=IoJ/QPbazRVpsAOJM/Crsupeww6a0Sl51rezjRCdCOc=;
  b=hCqZkpXdP84RHfJ+zAusxbHvwDMyos8PWd+nXK1RuW55JFDYJPJlSj2S
   CGCi1MpzaTRf69wqvfBxfZ6WZNgVnhSzUF62JODbWej9Uk0IdvYd6mBzS
   f3CXKt0Py6o0OlIOXS64RnRkAYTJWtQIeOJQjiu2vUdxzR4zyJQeMrZ53
   oNlo0R2E+fGFcXnkEpydWkEJiTG9Zv7sHwiPs9wGov+AjlPbYvbghHJfV
   6Y6EAnRtiIptMTbZz/83X39yb4YJu9TLtVkjzE32u5ul3pokSD4KS0+FL
   3RLAFk3tvF9X7Jn1QSnD2atbm8EqyJv5cQg2yi9eVOBFIPNtY7/BwKYz8
   A==;
X-CSE-ConnectionGUID: yDf694IxSFCK35GAaMZw/A==
X-CSE-MsgGUID: sagtfNFgRyW0Bap/q8uyjg==
X-IronPort-AV: E=McAfee;i="6700,10204,11396"; a="45269356"
X-IronPort-AV: E=Sophos;i="6.15,193,1739865600"; 
   d="scan'208";a="45269356"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 00:14:20 -0700
X-CSE-ConnectionGUID: xM0Jr1GIT5ebmpv/dAo3mQ==
X-CSE-MsgGUID: o+egIjbESJu9tvxsX3hKKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,193,1739865600"; 
   d="scan'208";a="128394866"
Received: from unknown (HELO [10.237.72.199]) ([10.237.72.199])
  by orviesa007.jf.intel.com with ESMTP; 07 Apr 2025 00:14:18 -0700
Message-ID: <dd277ca2-6225-43f6-b833-fe41c2d7f686@linux.intel.com>
Date: Mon, 7 Apr 2025 10:15:29 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: xhci: WARN Set TR Deq Ptr cmd failed due to incorrect slot or ep
 state.
To: Alan Stern <stern@rowland.harvard.edu>,
 =?UTF-8?Q?Micha=C5=82_Pecio?= <michal.pecio@gmail.com>
Cc: Paul Menzel <pmenzel@molgen.mpg.de>,
 Mathias Nyman <mathias.nyman@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>
References: <c279bd85-3069-4841-b1be-20507ac9f2d7@molgen.mpg.de>
 <b356f743-44b5-4f48-a289-fae0afe106ff@linux.intel.com>
 <84b400f8-2943-44e0-8803-f3aac3b670af@molgen.mpg.de>
 <20250406002311.2a76fc64@foxbook>
 <ade0d77a-651a-4b03-bf21-00369fdc22f8@rowland.harvard.edu>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <ade0d77a-651a-4b03-bf21-00369fdc22f8@rowland.harvard.edu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 6.4.2025 5.40, Alan Stern wrote:
> On Sun, Apr 06, 2025 at 12:23:11AM +0200, Michał Pecio wrote:
>> Looks like some URB stalled and usb_storage reset the device without
>> usb_clear_halt(). Then the core didn't usb_hcd_reset_endpoint() either.
>> And apparently EP_STALLED is still set in xhci_hcd after all that time.
>>
>> Then usb_storage submits one URB which never executes because the EP
>> is in Running-Idle state and the doorbell is inhibited by EP_STALLED.
>> 30s later it times out, unlinks the URB and resets again. Set TR Deq
>> fails because the endpoint is Running.
> 
>> Not sure if it's a USB core bug or something that xHCI should take
>> care of on its own. For now, reverting those two "stall" patches ought
>> to clean up the noise.
> 
> The core believes that resetting a device should erase the endpoint
> information in the HCD.  There is a callback in hub_port_reset() to that
> effect:
> 
> 		if (hcd->driver->reset_device)
> 			hcd->driver->reset_device(hcd, udev);
> 
> So after this the EP should not be in the Running-Idle state; in fact it
> should not exist at all (unless it is ep0, but in this case I think it
> isn't).
> 

> Is the implementation of the reset_device callback in xhci-hcd missing
> something?
> 
> Alan Stern

Thanks, I believe this is at least part of the issue here, thanks for the tip.

We don't clear the virt_dev->eps[ep_index].ep_state flags after device reset.

And the two new patches Michal pointed out rely even more of ep_state flags than
before, causing a regression.

0c74d232578b xhci: Avoid queuing redundant Stop Endpoint command for stalled endpoint
860f5d0d3594 xhci: Prevent early endpoint restart when handling STALL errors.

Does this oneliner help?

diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index 0452b8d65832..044c70c17746 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -3930,6 +3930,7 @@ static int xhci_discover_or_reset_device(struct usb_hcd *hcd,
					&virt_dev->eps[i],
					virt_dev->tt_info);
		xhci_clear_endpoint_bw_info(&virt_dev->eps[i].bw_info);
+		ep->ep_state = 0;
	}
	/* If necessary, update the number of active TTs on this root port */
	xhci_update_tt_active_eps(xhci, virt_dev, old_active_eps);

Thanks
Mathias

