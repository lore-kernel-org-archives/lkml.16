Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09E083BBF2;
	Tue,  8 Apr 2025 13:54:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744120458; cv=none; b=mnAiJupuwkCJUPNcRdF7AAZOtZp9J8wFCJidtN1B3Sr3cGAeq/W7Bzjxla3XCtFrBwF1h8oeRd2QG6JLn9mJPJh0mY660lDvb7NK5WiPmJPUExmIFjdsVZt1h/ME9PknayI/xTiCPp/KQJ8BRbIKfLTJUk6GUgy17dmBj8N9U2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744120458; c=relaxed/simple;
	bh=zZeJW8y/pLhorqi153IgAmOKNsiPwpGGNfmHZJnuqHU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=be20ymdgPvKKAsawxnSwrHSDntU8+t6BYjwDMjqaVrNUa3ngihKwt8ro61OZFcioc6en/aO2UwlK/XoOf5nN0zrGkYnK8ZL2iDAUtzM7cfJVKQY6VW1G3t6X+ypcTyUZ4A7TSiU3nwMM+bWxurVpzqyYMH9Zdnx+SlwE22NNdSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F5wrfDwL; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F5wrfDwL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744120457; x=1775656457;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=zZeJW8y/pLhorqi153IgAmOKNsiPwpGGNfmHZJnuqHU=;
  b=F5wrfDwL/FP6p8FReu15CNpU89NNqTnJHKbMr/KiOTTRv0XOxiWLvieU
   YT2rBIMVQD3h1TGDWnsDv30wRRkAeO+CAL9Bjs0kRrfVtpi+jz2sr+kFF
   WqJlMf5simpZ24DmbXSOJBJAri9iAI2+Oj8B3az2csfGxmiaYzdjffSrn
   sKwZimJBo5E8WG1of99cDaSsFoAj3blem3FeuBWSbc/CFd1s8WY1XBcHZ
   I1zyoUTlVeBDF5lbjOvzr3z+19J/XDHLtlhlSSMH174J3DpimCTkBE+rX
   wgHqjzu5Ix+NrWeqGDU1qryUEKYOjr+6HWPRRoHSW8yPxLGte/k8DX0eE
   w==;
X-CSE-ConnectionGUID: B4Dpk+M/QFKRxqjTlVO40Q==
X-CSE-MsgGUID: 04X6p3qeTY+8RjTjGytDtw==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="49211571"
X-IronPort-AV: E=Sophos;i="6.15,198,1739865600"; 
   d="scan'208";a="49211571"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2025 06:54:16 -0700
X-CSE-ConnectionGUID: CwSlN7erRwqc3SSIQGeiLQ==
X-CSE-MsgGUID: Qv/+a7BzRAOFQlEWn3aklg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,198,1739865600"; 
   d="scan'208";a="128150606"
Received: from unknown (HELO [10.237.72.199]) ([10.237.72.199])
  by fmviesa006.fm.intel.com with ESMTP; 08 Apr 2025 06:54:14 -0700
Message-ID: <357368ff-0c49-4f22-a03d-fd9560c22dae@linux.intel.com>
Date: Tue, 8 Apr 2025 16:55:24 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC RFT] usb: hcd: Add a usb_device argument to
 hc_driver.endpoint_reset()
To: =?UTF-8?Q?Micha=C5=82_Pecio?= <michal.pecio@gmail.com>,
 Alan Stern <stern@rowland.harvard.edu>,
 Mathias Nyman <mathias.nyman@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Paul Menzel <pmenzel@molgen.mpg.de>, linux-usb@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>
References: <c279bd85-3069-4841-b1be-20507ac9f2d7@molgen.mpg.de>
 <b356f743-44b5-4f48-a289-fae0afe106ff@linux.intel.com>
 <84b400f8-2943-44e0-8803-f3aac3b670af@molgen.mpg.de>
 <20250406002311.2a76fc64@foxbook>
 <ade0d77a-651a-4b03-bf21-00369fdc22f8@rowland.harvard.edu>
 <20250406095008.0dbfd586@foxbook> <20250406175032.12b7d284@foxbook>
 <14197657-0a0f-45a8-ac36-dd37b16a1565@rowland.harvard.edu>
 <20250407074905.2d236fb9@foxbook>
 <3efb52b8-0974-4125-a344-00f459fbe4e4@rowland.harvard.edu>
 <20250408121817.6ae8defd@foxbook>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <20250408121817.6ae8defd@foxbook>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 8.4.2025 13.18, Michał Pecio wrote:
> xHCI needs usb_device in this callback so it employed some hacks that
> proved unreliable in the long term and made the code a little tricky.
> 
> Make USB core supply it directly and simplify xhci_endpoint_reset().
> Use xhci_check_args() to prevent resetting emulated endpoints of root
> hubs and to deduplicate argument validation and improve debuggability.
> 
> Update ehci_endpoint_reset(), which is the only other such callback,
> to accept (and ignore) the new argument.
> 
> This fixes the root cause of a 6.15-rc1 regression reported by Paul,
> which I was able to reproduce locally. It also solves the general
> problem of xhci_endpoint_reset() becoming a no-op after device reset
> or changing configuration or altsetting. Although nobody complained
> because halted endpoints are reset automatically by xhci_hcd, it was
> a bug - sometimes class drivers want to reset not halted endpoints.
> 
> Reported-by: Paul Menzel <pmenzel@molgen.mpg.de>
> Closes: https://lore.kernel.org/linux-usb/c279bd85-3069-4841-b1be-20507ac9f2d7@molgen.mpg.de/
> Signed-off-by: Michal Pecio <michal.pecio@gmail.com>
> ---
> 
> Is such change acceptable to interested parties?

Looks like an improvement, and will help clear the EP_STALLED flag
eventually in device reset case.

There are some issues still unsolved due to how xhci endpoints end up being handled
in usb core usb_reset_and_verify_device().

usb_reset_and_verify_device()
   hub_port_init()
     hcd->driver->reset_device(hcd, udev);          /*1 xhci frees ep rings, loses td_list heads */
   usb_hcd_alloc_bandwidth(new_config, NULL, NULL)  /*2 xhci drop+add ep, allocated new ep rings */
   usb_control_msg(udev, usb_sndctrlpipe(...,USB_REQ_SET_CONFIGURATION,...)
   for (interfaces) {
     if (AlternateSetting == 0) {
       usb_disable_interface()  /*3 flush urbs, ->xhci_urb_dequeue() */
       usb_enable_interface()   /*4 clear EP_STALLED flag */
     } else {
       usb_set_interface()
     }

1. driver->reset_device will free all xhci endpoint rings, and lose td_list head, but
    keep cancelled_td_list and ep->ep_state flags. xHC issues reset device command
    setting all internal ep states in xci to "disabled".

2. usb hcd_alloc_bandwith will drop+add xhci endpoints for this configuration,
    allocate new endpoint rings, and inits new td_list head.
    Old cancelled_td_list and ep_state flags are still set, not matching ring.

3. usb_disable_interface() will flush all pending URBs calling xhci_urb_dequeue().
    xhci_urb_dequeue() makes decision based on stale ep_state flags.
    May start to cancel/giveback urbs in old cancelled_td_list for tds that existed
    on old freed ring. will also set host_ep->hcpriv to null

4. usb_enable_interface() calls xhci_endpoint_reset() that finally clears
    the EP_STALLED flag (udev now found thanks to this patch)

Disabling endpoints, like calling usb_disable_interface() in step 3 should be
done before calling  usb_hcd_alloc_bandwith().
This was fixed in other places such as usb_set_interface() and usb_reset_config()

We might need to clean up ep_state flags and give back cancelled URBs in
xhci_discover_or_reset_device() after the reset device xhci command completion.

Thanks
Mathias
