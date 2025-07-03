Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28C3423ABAA;
	Thu,  3 Jul 2025 10:01:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751536910; cv=none; b=n7hy6hx2Zd97fHVbqpn8DnxUdt13a8PwjSsrraCU77zS1MberQGQX1tL370cP9kZjHwHlkVk5OcFE8fwzMAnR/cVZMoa/Xe51YOJzi5TUX3OouxCNu8jnyM3CN7zkwSKWVx/CJgP9MMXRmqdbZ/d/LZvF4FofF5mgcn9pCwJx/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751536910; c=relaxed/simple;
	bh=Y8ZGHYZZdyplrxxLrqeJW0tHCY9Hf4INmh82+Vc3Ce8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XEVlEiCRUE7RHE1EPWxIg0r4BCxZUEhIw+V9JEvpcgXr/P58yKeubPX/x4BkEP8IOJUejl6KG61WwuawBpvKpbmCzPkCjT9ny0jfB0Xo+58BkArZtCRBuOnj/1sXNkbmKOb/Cn+fQCIU6dNW0xAdh3i/H1SLW1dgUQQ1b36wcW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=hoQ1Egnu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="hoQ1Egnu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B355C4CEEB;
	Thu,  3 Jul 2025 10:01:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1751536909;
	bh=Y8ZGHYZZdyplrxxLrqeJW0tHCY9Hf4INmh82+Vc3Ce8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hoQ1Egnuo8AeGA1QA6NoA7y4MBK+v6/swpeSU/zxCcS/DVznA82q3hIZLE+kig5DD
	 xK+nKN6U9ognE3i0ldrUh7tMNE3r7sUUmpFmTEmcIozLCNrm4TtrOGDziraJLedz9w
	 wBM5ehvtlenvp8Qfrn1JiVN9xZn+ggoP+wLTkMX8=
Date: Thu, 3 Jul 2025 12:01:47 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Jie Deng <dengjie03@kylinos.cn>
Cc: stern@rowland.harvard.edu, linux-usb@vger.kernel.org,
	usb-storage@lists.one-eyed-alien.net, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: storage: Ignore UAS driver for SanDisk Extreme Pro
 55AF storage device
Message-ID: <2025070329-rinse-engaged-e7af@gregkh>
References: <20250703092946.939936-1-dengjie03@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250703092946.939936-1-dengjie03@kylinos.cn>

On Thu, Jul 03, 2025 at 05:29:46PM +0800, Jie Deng wrote:
> diff --git a/drivers/usb/storage/unusual_uas.h b/drivers/usb/storage/unusual_uas.h
> index 1477e31d7763..9f093a6af7f9 100644
> --- a/drivers/usb/storage/unusual_uas.h
> +++ b/drivers/usb/storage/unusual_uas.h
> @@ -199,3 +199,10 @@ UNUSUAL_DEV(0x4971, 0x8024, 0x0000, 0x9999,
>  		"External HDD",
>  		USB_SC_DEVICE, USB_PR_DEVICE, NULL,
>  		US_FL_ALWAYS_SYNC),
> +
> +/* Reported-by: Jie Deng <dengjie03@kylinos.cn> */
> +UNUSUAL_DEV(0x0781, 0x55af, 0x0000, 0x9999,
> +		"SanDisk",
> +		"Extreme Pro 55AF",
> +		USB_SC_DEVICE, USB_PR_DEVICE, NULL,
> +		US_FL_IGNORE_UAS),
> -- 
> 2.25.1
> 
> 

Please read the comment at the top of this file for where to put the
entry.

thanks,

greg k-h
