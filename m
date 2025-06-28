Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24CD713EFE3;
	Sat, 28 Jun 2025 15:04:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751123096; cv=none; b=kfPD7T+8k/QTFmr0XaWR8j3Nd8IZUgA6sjP+hCeMhoeUf7635R/NiqvXRqjuksSjUfOs0/0B/cMCbHQtznBB9oziUnyedrq6+1f2yRJYDUoqgNfJfXli6mPj0DUxkadjJKbkx9csmWhDqfCE40Xr3Ti0tR9cEWBtD3eV4m6px8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751123096; c=relaxed/simple;
	bh=0Uv+q8exRiL1GkMTHmMha2ITO2bvRewQYj2lGsHH2xk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ExMN0ypESRXgdLJ/PHoj+mnrH8vceFEju9dpe7uGai4ptyjKTxFc9i7u+c8LQzCXxf7a/CAP5OeGV1AIBqcqn39K0IqL745T6GVqld3nukLz2gwsEjtUltJg7EjbTp/o5P9pA4Q5tKIj+SWnnFTyGZs4jxJ9QxGsuv9vHJJUyS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=mvXZ011K; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="mvXZ011K"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64264C4CEEA;
	Sat, 28 Jun 2025 15:04:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1751123095;
	bh=0Uv+q8exRiL1GkMTHmMha2ITO2bvRewQYj2lGsHH2xk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mvXZ011Klyqgb/e5srWsSfAhSZLWqO6EyuJeMz9PZaNkc2XVlqGX8zblovVR1s2Bt
	 ZJkVi/EqQDqm19J7xUzgcN1kRGk0j2wgY2LYfqdSu5y8nVyepSQBPfh8hTNrQaOKTH
	 1Sn9vO3Oz8a1SAlz8o49bFRQUagIwPe90w+j3Zsk=
Date: Sat, 28 Jun 2025 17:04:53 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Sergio Perez Gonzalez <sperezglz@gmail.com>
Cc: michal.simek@amd.com, linux-usb@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	shuah@kernel.org
Subject: Re: [PATCH] usb: gadget: udc-xilinx: validate ep number before
 indexing rambase[]
Message-ID: <2025062834-botanist-crop-4aec@gregkh>
References: <20250627060125.176663-1-sperezglz@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250627060125.176663-1-sperezglz@gmail.com>

On Fri, Jun 27, 2025 at 12:01:22AM -0600, Sergio Perez Gonzalez wrote:
> Issue flagged by coverity. The size of the rambase array is 8,
> usb_enpoint_num() can return 0 to 15, prevent out of bounds reads.

But how can that happen with this hardware?  As the array states, this
hardware only has that many endpoints availble to it, so how can it ever
be larger?

> Link: https://scan7.scan.coverity.com/#/project-view/53936/11354?selectedIssue=1644635
> Signed-off-by: Sergio Perez Gonzalez <sperezglz@gmail.com>

What commit id does this fix?


> ---
>  drivers/usb/gadget/udc/udc-xilinx.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/usb/gadget/udc/udc-xilinx.c b/drivers/usb/gadget/udc/udc-xilinx.c
> index 8d803a612bb1..0c3714de2e3b 100644
> --- a/drivers/usb/gadget/udc/udc-xilinx.c
> +++ b/drivers/usb/gadget/udc/udc-xilinx.c
> @@ -814,6 +814,12 @@ static int __xudc_ep_enable(struct xusb_ep *ep,
>  	ep->is_in = ((desc->bEndpointAddress & USB_DIR_IN) != 0);
>  	/* Bit 3...0:endpoint number */
>  	ep->epnumber = usb_endpoint_num(desc);
> +	if (ep->epnumber >= XUSB_MAX_ENDPOINTS) {
> +		dev_dbg(udc->dev, "bad endpoint index %d: only 0 to %d supported\n",
> +				ep->epnumber, (XUSB_MAX_ENDPOINTS - 1));
> +		return -EINVAL;

Any hints as to how this was tested?

thanks,

greg k-h
