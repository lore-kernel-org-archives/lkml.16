Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6D1941C72
	for <linux-kernel@vger.kernel.org>; Sun, 18 May 2025 11:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747569547; cv=none; b=FGgBldG4gmA6xCj8WrJK1st0WF0XxV8M50huxF/DBrFuV4O4u4mkNtyKXioGpgOry8H+lCbtjyfkIZ7iuNf3mnkTg8p7cSb8Sy8Y75jhwyQRP+5ChXd8NRDfz2ZpCMajuurvClfU88t+59HW1JN6UF+od2ycV7ZhMKEVgleSgeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747569547; c=relaxed/simple;
	bh=uBcKiv6Sl4n4n4ehs6uqn5V8UYbdTDpcBzLwCE6KGa4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rg3cjTOgAupySgKsaAVUgNaKlnTu4CPcdwiIO4L/mZ0WVUEddbOpZ92oNap6RuxC/xElIiXZxadQfaG+9eVhp2WiR9NjR9ffjQ/8CkxsFnYHAU9Gd/pMHv9DlH4Yv5vvv49JPa7kNVkb02/2fuexHhETpAVE9rpA2IWMG2BJanQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=lj9KLmhG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="lj9KLmhG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 138C3C4CEE7;
	Sun, 18 May 2025 11:59:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1747569546;
	bh=uBcKiv6Sl4n4n4ehs6uqn5V8UYbdTDpcBzLwCE6KGa4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lj9KLmhG1bi583IziWyHylXdX3ugmmJllq/b5Zj6FNfjruVZeB8mUASzQO/Prj1i8
	 wNfQznKmCxPtLZGesY2gnYzbUrlbM76oHIgYJar61MRhgBT3V6vV5A44PPJxuI+7yb
	 M7AkQy30E/y7qzQEJYQ7iwiUEp9wIQtoWp0vsJbE=
Date: Sun, 18 May 2025 13:57:17 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Jonathan Velez <jonvelez12345@gmail.com>
Cc: Thinh.Nguyen@synopsys.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs: usb: dwc3: add documentation of 'sg' field in
 dwc3_request struct
Message-ID: <2025051804-postage-tremble-d9d1@gregkh>
References: <20250518113330.8976-1-jonvelez12345@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250518113330.8976-1-jonvelez12345@gmail.com>

On Sun, May 18, 2025 at 11:33:30AM +0000, Jonathan Velez wrote:
> core: Add documentation of "sg" field in the dwc3_request struct.
> 
> Signed-off-by: Jonathan Velez <jonvelez12345@gmail.com>
> ---
>  drivers/usb/dwc3/core.h | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
> index f11570c8ffd0..bb140dde07d6 100644
> --- a/drivers/usb/dwc3/core.h
> +++ b/drivers/usb/dwc3/core.h
> @@ -942,6 +942,7 @@ struct dwc3_hwparams {
>   * @request: struct usb_request to be transferred
>   * @list: a list_head used for request queueing
>   * @dep: struct dwc3_ep owning this request
> + * @sg: pointer to the scatter-gather list for transfers
>   * @start_sg: pointer to the sg which should be queued next
>   * @num_pending_sgs: counter to pending sgs
>   * @remaining: amount of data remaining
> -- 
> 2.43.0
> 

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
