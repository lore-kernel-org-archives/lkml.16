Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A7041A3155;
	Wed, 14 May 2025 07:33:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747207994; cv=none; b=cLGdwrF8HsHE9dBez7lq1S/eFe6i+etqmhh+Dte7MbVABxGCLlPvoBxV7JxDf5m2+hgmVTllwmryDK+C5jPAIY5NLeYMfZqGtVUrKCfYYKOS4Ao6k7383zzx/yv/mL/fBIl11CZi/XP52yGJGBNWQNwqNGXTp1aThRaORZUiIr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747207994; c=relaxed/simple;
	bh=aMSOQWVWeoNv0lVBaoClSjorw3TTumNswBEIUZbZhII=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ofc96Xot4ioekubvzccph/0dql05DeVsQe636Z6s0MtZTUawRq9gci86F8XfNP9MJLB/6AbcLzhvxop1GVQOubphuruPfrBI3dNKmAiKNpbxmLObnf22YHL8AOXty3kK26zbbtdL774i/Q51zQlirXyqm9bTZwqwuxtbLqqp4w4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=yBJNzP/6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="yBJNzP/6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CED6FC4CEF1;
	Wed, 14 May 2025 07:33:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1747207993;
	bh=aMSOQWVWeoNv0lVBaoClSjorw3TTumNswBEIUZbZhII=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=yBJNzP/61tfn1OQwYbB5+8TyTD+iK+MDo9jkU75tUSd7omI+LFjV5tTBaAQckGFd/
	 0TNMvaLuJc/nnkQoD5fkqlRI3LVmbchTRxExww+0IM7j85DaF4G0IyaqI6H774bJRn
	 L6lSXZhZJ12eck/2X2lap5xrg+RQiFQBhv+fO9KA=
Date: Wed, 14 May 2025 09:31:25 +0200
From: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
To: "Chen, Jay" <jay.chen@siemens.com>
Cc: "mathias.nyman@intel.com" <mathias.nyman@intel.com>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"Shao, Tzi Yang" <tziyang.shao@siemens.com>
Subject: Re: [PATCH] usb: xhci: Set avg_trb_len = 8 for EP0 during Address
 Device
Message-ID: <2025051451-pedicure-aspire-1c8d@gregkh>
References: <JH0PR06MB7294E46B393F1CA5FE0EE4F78396A@JH0PR06MB7294.apcprd06.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <JH0PR06MB7294E46B393F1CA5FE0EE4F78396A@JH0PR06MB7294.apcprd06.prod.outlook.com>

On Tue, May 13, 2025 at 09:07:00AM +0000, Chen, Jay wrote:
> From fef893bcf0add89795b85bcc1f6bdae537f1dabe Mon Sep 17 00:00:00 2001
> From: "jay.chen" <jay.chen@siemens.com>
> Date: Tue, 13 May 2025 15:03:44 +0800
> Subject: [PATCH] usb: xhci: Set avg_trb_len = 8 for EP0 during Address Device
> Command
> 
> According to the xHCI 1.2 spec (Section 6.2.3, p.454), the Average
> TRB Length (avg_trb_len) for control endpoints should be set to 8.
> 
> Currently, during the Address Device Command, EP0's avg_trb_len remains 0,
> which may cause some xHCI hardware to reject the Input Context, resulting
> in device enumeration failures. In extreme cases, using a zero avg_trb_len
> in calculations may lead to division-by-zero errors and unexpected system
> crashes.
> 
> This patch sets avg_trb_len to 8 for EP0 in
> xhci_setup_addressable_virt_dev(), ensuring compliance with the spec
> and improving compatibility across various host controller implementations.
> 
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=220033
> Signed-off-by: jay.chen <jay.chen@siemens.com>
> ---
> drivers/usb/host/xhci-mem.c | 2 ++
> 1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
> index d698095fc88d..fed9e9d1990c 100644
> --- a/drivers/usb/host/xhci-mem.c
> +++ b/drivers/usb/host/xhci-mem.c
> @@ -1166,6 +1166,8 @@ int xhci_setup_addressable_virt_dev(struct xhci_hcd *xhci, struct usb_device *ud
>       ep0_ctx->deq = cpu_to_le64(dev->eps[0].ring->first_seg->dma |
>                                  dev->eps[0].ring->cycle_state);
> 
> +      ep0_ctx->tx_info |= cpu_to_le32(EP_AVG_TRB_LENGTH(8));
> +
>       trace_xhci_setup_addressable_virt_device(dev);
> 
>        /* Steps 7 and 8 were done in xhci_alloc_virt_device() */
> -- 
> 2.43.5


Hi,

This is the friendly patch-bot of Greg Kroah-Hartman.  You have sent him
a patch that has triggered this response.  He used to manually respond
to these common problems, but in order to save his sanity (he kept
writing the same thing over and over, yet to different people), I was
created.  Hopefully you will not take offence and will fix the problem
in your patch and resubmit it so that it can be accepted into the Linux
kernel tree.

You are receiving this message because of the following common error(s)
as indicated below:

- Your patch is malformed (tabs converted to spaces, linewrapped, etc.)
  and can not be applied.  Please read the file,
  Documentation/process/email-clients.rst in order to fix this.

- This looks like a new version of a previously submitted patch, but you
  did not list below the --- line any changes from the previous version.
  Please read the section entitled "The canonical patch format" in the
  kernel file, Documentation/process/submitting-patches.rst for what
  needs to be done here to properly describe this.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
