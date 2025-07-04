Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A023D23A58E;
	Fri,  4 Jul 2025 12:04:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751630642; cv=none; b=Zt+qRHbM9Z9S66yjQHrd+SR1kybGESvImzYOj7b3G6taUCj3jeH+8h29GP40CUFZzLl1pNOA3908W1dQYM0pM0yMKnnizi3/XXnBIV+IG9lvUSnDX5TRhAwPxX7/jYqzGBS7XqExg/7toZAxrMUP/vKnaKtx9o6xYYiSAEsMEgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751630642; c=relaxed/simple;
	bh=2fFJW2MdIKke6VHt2ftCWlbjagNoAQsgGW3Hbfd42F4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WDFrWXms85X7m6qgnS+kKabZCermUzh1rU96ONjDofAi9jun82HuAH42ltwNxOPwnA4Ggf77UJxVH5eXM86oskNvc+XYYNANCA52jTCw8ZcXCu3jwQjJbMyfwXI6zCke0JSwRq8QFEim2SCcXziy+kfK79s9gyQDn2MN+qm0Kvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=F2Ngxkwh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="F2Ngxkwh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B324FC4CEE3;
	Fri,  4 Jul 2025 12:04:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1751630642;
	bh=2fFJW2MdIKke6VHt2ftCWlbjagNoAQsgGW3Hbfd42F4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=F2NgxkwhwCoApmyPrHaNolYSP9oBlhxiahnM76MY9EzvL7XKjyH7tDQZHkK32Y485
	 gVLSf0oX62PTrcjfpNpY5aA8XoPyZkn8USpceZ26AaTEqMlhhXU+WkeBkJVwbsa4Q7
	 tdEJMJtHQYzePRxSqk4D5JoHZrWsHNLs/HLQoPhs=
Date: Fri, 4 Jul 2025 14:03:59 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Srikanth Chary Chennoju <srikanth.chary-chennoju@amd.com>
Cc: Thinh.Nguyen@synopsys.com, m.grzeschik@pengutronix.de,
	Chris.Wulff@biamp.com, tiwai@suse.de, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, punnaiah.choudary.kalluri@amd.com
Subject: Re: [PATCH 3/3] usb: gadget: f_sourcesink: Addition of SSP endpoint
 companion for Isochronous transfers
Message-ID: <2025070432-mustard-mongoose-1716@gregkh>
References: <20250704114013.3396795-1-srikanth.chary-chennoju@amd.com>
 <20250704114013.3396795-4-srikanth.chary-chennoju@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250704114013.3396795-4-srikanth.chary-chennoju@amd.com>

On Fri, Jul 04, 2025 at 05:10:13PM +0530, Srikanth Chary Chennoju wrote:
> This patch is created to support super speed plus endpoint for
> Isochronous transfers. Now super speed endpoint companion is
> accompanied by super speed plus endpoint companion.
> With this change we could see the Isoc IN and OUT performance
> reaching to ~749MB/sec which is 96K per uframe.
> The performance numbers are confirmed through Lecroy trace.

You do have a full 72 characters wide, you can use it :)

> 
> Signed-off-by: Srikanth Chary Chennoju <srikanth.chary-chennoju@amd.com>
> ---
>  drivers/usb/gadget/function/f_sourcesink.c | 23 ++++++++++++++++++++--
>  1 file changed, 21 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/gadget/function/f_sourcesink.c b/drivers/usb/gadget/function/f_sourcesink.c
> index 84f3b3bc7669..6499e95e0e9c 100644
> --- a/drivers/usb/gadget/function/f_sourcesink.c
> +++ b/drivers/usb/gadget/function/f_sourcesink.c
> @@ -232,6 +232,12 @@ static struct usb_ss_ep_comp_descriptor ss_iso_source_comp_desc = {
>  	.wBytesPerInterval =	cpu_to_le16(1024),
>  };
>  
> +static struct usb_ssp_isoc_ep_comp_descriptor ssp_iso_source_comp_desc = {
> +	.bLength =		USB_DT_SSP_ISOC_EP_COMP_SIZE,
> +	.bDescriptorType =	USB_DT_SSP_ISOC_ENDPOINT_COMP,
> +	.dwBytesPerInterval =	cpu_to_le32(1024),
> +};
> +
>  static struct usb_endpoint_descriptor ss_iso_sink_desc = {
>  	.bLength =		USB_DT_ENDPOINT_SIZE,
>  	.bDescriptorType =	USB_DT_ENDPOINT,
> @@ -250,6 +256,12 @@ static struct usb_ss_ep_comp_descriptor ss_iso_sink_comp_desc = {
>  	.wBytesPerInterval =	cpu_to_le16(1024),
>  };
>  
> +static struct usb_ssp_isoc_ep_comp_descriptor ssp_iso_sink_comp_desc = {
> +	.bLength =		USB_DT_SSP_ISOC_EP_COMP_SIZE,
> +	.bDescriptorType =	USB_DT_SSP_ISOC_ENDPOINT_COMP,
> +	.dwBytesPerInterval =	cpu_to_le32(1024),
> +};
> +
>  static struct usb_descriptor_header *ss_source_sink_descs[] = {
>  	(struct usb_descriptor_header *) &source_sink_intf_alt0,
>  	(struct usb_descriptor_header *) &ss_source_desc,
> @@ -264,8 +276,10 @@ static struct usb_descriptor_header *ss_source_sink_descs[] = {
>  	(struct usb_descriptor_header *) &ss_sink_comp_desc,
>  	(struct usb_descriptor_header *) &ss_iso_source_desc,
>  	(struct usb_descriptor_header *) &ss_iso_source_comp_desc,
> +	(struct usb_descriptor_header *)&ssp_iso_source_comp_desc,
>  	(struct usb_descriptor_header *) &ss_iso_sink_desc,
>  	(struct usb_descriptor_header *) &ss_iso_sink_comp_desc,
> +	(struct usb_descriptor_header *)&ssp_iso_sink_comp_desc,

Odd spacing :(

Please follow the format that was previously there.


>  	NULL,
>  };
>  
> @@ -428,7 +442,7 @@ sourcesink_bind(struct usb_configuration *c, struct usb_function *f)
>  	 */
>  	ss_iso_source_desc.wMaxPacketSize = ss->isoc_maxpacket;
>  	ss_iso_source_desc.bInterval = ss->isoc_interval;
> -	ss_iso_source_comp_desc.bmAttributes = ss->isoc_mult;
> +	ss_iso_source_comp_desc.bmAttributes = 0x80 | ss->isoc_mult;

What is 0x80 for?  Is that a #define somewhere?

>  	ss_iso_source_comp_desc.bMaxBurst = ss->isoc_maxburst;
>  	ss_iso_source_comp_desc.wBytesPerInterval = ss->isoc_maxpacket *
>  		(ss->isoc_mult + 1) * (ss->isoc_maxburst + 1);
> @@ -437,12 +451,17 @@ sourcesink_bind(struct usb_configuration *c, struct usb_function *f)
>  
>  	ss_iso_sink_desc.wMaxPacketSize = ss->isoc_maxpacket;
>  	ss_iso_sink_desc.bInterval = ss->isoc_interval;
> -	ss_iso_sink_comp_desc.bmAttributes = ss->isoc_mult;
> +	ss_iso_sink_comp_desc.bmAttributes = 0x80 | ss->isoc_mult;

Same here.

>  	ss_iso_sink_comp_desc.bMaxBurst = ss->isoc_maxburst;
>  	ss_iso_sink_comp_desc.wBytesPerInterval = ss->isoc_maxpacket *
>  		(ss->isoc_mult + 1) * (ss->isoc_maxburst + 1);
>  	ss_iso_sink_desc.bEndpointAddress = fs_iso_sink_desc.bEndpointAddress;
>  
> +	ssp_iso_source_comp_desc.dwBytesPerInterval = ss->isoc_maxpacket *
> +		(ss->isoc_mult + 1) * (ss->isoc_maxburst + 1) * 2;
> +	ssp_iso_sink_comp_desc.dwBytesPerInterval = ss->isoc_maxpacket *
> +		(ss->isoc_mult + 1) * (ss->isoc_maxburst + 1) * 2;

Why * 2?

thanks,

greg k-h
