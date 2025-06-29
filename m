Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F5368828;
	Sun, 29 Jun 2025 06:10:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751177409; cv=none; b=D4CKXBogJR0WqoLJ2rzToc7+QouJ0AG5FNAxpbwrFp7cfj/1Fskod0emWUqZgGbrhzMcYxBLO1HeaLW+iWfT9m/FW9xrHso7doLjJvS4ghK6LrW8gRU9c8nsds97uhiAn39vSCRk4QJwWYhRzUgbAhQ9OKdhmg6jouAbsOu3Ql8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751177409; c=relaxed/simple;
	bh=3GqO9beA1CUEREbd/6qQA7wr6zOhMTxI03P3vkcI4MM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RqjfGRFf/LHtRGdQQkh4B9kTuV3NN9o+z3hINybQw/8JrBnHNj4KLLrDRCsd6EJMD1dIiVPq6VDdR1YqUgEi+YKtRQCWWEppB3yB/IiyIiqU8003Dtn+Ktw4svc7aN1tEBQxctkMb1HH8luuXrac7/04WQgIH0vpPykb+ei9YgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=BIxJvw2f; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="BIxJvw2f"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49E42C4CEEB;
	Sun, 29 Jun 2025 06:10:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1751177408;
	bh=3GqO9beA1CUEREbd/6qQA7wr6zOhMTxI03P3vkcI4MM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BIxJvw2fKDNzYPBi43M4JBFxlqFVGwpup8J/yT9cBWPmZxBtfRaCWch98hqOpDPcN
	 ttf/jvbXYQPtZjDbsiyCzChecGQ1jj18UM0qTr5HKZ485rD90d2vWNXC5XzoQEnPd0
	 TvjZ/UDdE4taiGKP5GF3Zyd0KjDv7ijd1yoHM2wI=
Date: Sun, 29 Jun 2025 08:10:05 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Seungjin Bae <eeodqql09@gmail.com>
Cc: Kyungtae Kim <Kyungtae.Kim@dartmouth.edu>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@kernel.org>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: gadget: m66592-udc: Ignore feature requests for EP0
Message-ID: <2025062956-finalize-canal-9145@gregkh>
References: <20250629025951.17581-3-eeodqql09@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250629025951.17581-3-eeodqql09@gmail.com>

On Sat, Jun 28, 2025 at 10:59:53PM -0400, Seungjin Bae wrote:
> The `set_feature() and clear_feature() functions handle requests to set or clear the ENDPOINT_HALT feature.
> Currently, these requests are processed for any endpoint, including the control endpoint (EP0).
> 
> The ENDPOINT_HALT feature is not defined for control endpoints according to the USB specification 9.4.5.

Nit, shouldn't you wrap these lines at 72 columns?  Didn't checkpatch
complain about this?

> 
> Fixes: 4cf2503c6801a ("USB: m66592-udc: peripheral controller driver for M66592")
> Co-developed-by: Kyungtae Kim <Kyungtae.Kim@dartmouth.edu>
> Signed-off-by: Kyungtae Kim <Kyungtae.Kim@dartmouth.edu>
> Signed-off-by: Seungjin Bae <eeodqql09@gmail.com>
> ---

Any reason why you didn't also cc: stable for this?

>  drivers/usb/gadget/udc/m66592-udc.c | 14 ++++++++++++--
>  1 file changed, 12 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/gadget/udc/m66592-udc.c b/drivers/usb/gadget/udc/m66592-udc.c
> index 715791737499..38cc11ae80b6 100644
> --- a/drivers/usb/gadget/udc/m66592-udc.c
> +++ b/drivers/usb/gadget/udc/m66592-udc.c
> @@ -1010,8 +1010,13 @@ static void clear_feature(struct m66592 *m66592, struct usb_ctrlrequest *ctrl)
>  		struct m66592_ep *ep;
>  		struct m66592_request *req;
>  		u16 w_index = le16_to_cpu(ctrl->wIndex);
> +		u16 ep_num = w_index & USB_ENDPOINT_NUMBER_MASK;
>  
> -		ep = m66592->epaddr2ep[w_index & USB_ENDPOINT_NUMBER_MASK];
> +		if (ep_num == 0) {
> +			control_end(m66592, 1);
> +			break;
> +		}
> +		ep = m66592->epaddr2ep[ep_num];

What in-kernel user calls this function for endpoint 0?


>  		pipe_stop(m66592, ep->pipenum);
>  		control_reg_sqclr(m66592, ep->pipenum);
>  
> @@ -1067,8 +1072,13 @@ static void set_feature(struct m66592 *m66592, struct usb_ctrlrequest *ctrl)
>  	case USB_RECIP_ENDPOINT: {
>  		struct m66592_ep *ep;
>  		u16 w_index = le16_to_cpu(ctrl->wIndex);
> +		u16 ep_num = w_index & USB_ENDPOINT_NUMBER_MASK;
>  
> -		ep = m66592->epaddr2ep[w_index & USB_ENDPOINT_NUMBER_MASK];
> +		if (ep_num == 0) {
> +			control_end(m66592, 1);
> +			break;
> +		}
> +		ep = m66592->epaddr2ep[ep_num];

Same here, what in-kernel user calls this for endpoint 0?

And was this tested on real hardware?

thanks,

greg k-h
