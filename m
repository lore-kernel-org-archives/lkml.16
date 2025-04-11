Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77E85645;
	Fri, 11 Apr 2025 05:56:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744351005; cv=none; b=TjcCjWs5wqaKEgzEuQqXDtPTez2vloubEjSJ38HQZtkQKyHHVeXrGo6yFq3tjW0GWJgMQferwOcDGKPY4hhD9qF9MNvs/DcBhwZN0WTwd7LpFZMTB8WosCa4h/gQVpSf2cedc8mfeQpsz0sZAetzePsgzTjQvLVTcgmDPbBNlhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744351005; c=relaxed/simple;
	bh=G67pLsBgKMXudRXip4K1q4VTgKNv74ZJ5I2KYYQsHUQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oFS4c0anSW/ZO/PrafFzC5xoLrw/9nf6VlcOcJAU+pp2wsVhEC1Hnz8JIeMzIU7B7NRMmuywJTIkYLaDB/2tK3J3zQsx1zHJqTsICVQ7E3r6GpV0p7JOB0/DHcvFM1DzsGCeRsVV1hCsVxLHtdnyZE5nAhTH5jlpsv17qUc6pYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Im/yDm9p; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Im/yDm9p"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 790CFC4CEE2;
	Fri, 11 Apr 2025 05:56:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1744351004;
	bh=G67pLsBgKMXudRXip4K1q4VTgKNv74ZJ5I2KYYQsHUQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Im/yDm9paiEiACr1VtOnudYq2aAVjOuBoS9O5hamAK0nq6qDSOCFCQ64MwE07cCfN
	 tuQkwPPjFUVkQjo8t71TbB4uVeRb0NuFSmSRnb8YU+G7NEDmq7j7w3BaCpiLCyPUqD
	 WLTX1q0hp8oavxJtF/ExjrTs3usXOHHPhX/8JPco=
Date: Fri, 11 Apr 2025 07:55:09 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Chance Yang <chance.yang@kneron.us>
Cc: Chunfeng Yun <chunfeng.yun@mediatek.com>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, morgan.chang@kneron.us
Subject: Re: [PATCH] usb: common: usb-conn-gpio: use a unique names for usb
 connector devices
Message-ID: <2025041131-datebook-tumble-a759@gregkh>
References: <20250411-work-next-v1-1-93c4b95ee6c1@kneron.us>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250411-work-next-v1-1-93c4b95ee6c1@kneron.us>

On Fri, Apr 11, 2025 at 11:27:33AM +0800, Chance Yang wrote:
> The current implementation uses "usb-charger" as a generic name for
> usb connector. This prevents us to have two usb connector devices
> attached as the power system will complain about the name which is
> already registered.
> 
> Use an incremental name for each usb connector attached.
> 
> Fixes: 880287910b189 ("usb: common: usb-conn-gpio: fix NULL pointer dereference of charger")
> Signed-off-by: Chance Yang <chance.yang@kneron.us>
> ---
> This patch addresses an issue in the usb-conn-gpio driver where the
> generic "usb-charger" name is used for all USB connector devices. This
> causes conflicts in the power supply subsystem when multiple USB
> connectors are present, as duplicate names are not allowed.
> 
> The fix introduces an incremental naming scheme (e.g., usb-charger-0,
> usb-charger-1) for each USB connector device, ensuring uniqueness and
> preventing registration errors.
> ---
>  drivers/usb/common/usb-conn-gpio.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/common/usb-conn-gpio.c b/drivers/usb/common/usb-conn-gpio.c
> index 1e36be2a28fd5ca5e1495b7923e4d3e25d7cedef..2702e1a26634770500febd567f9d0891e63a8c4c 100644
> --- a/drivers/usb/common/usb-conn-gpio.c
> +++ b/drivers/usb/common/usb-conn-gpio.c
> @@ -155,13 +155,19 @@ static int usb_charger_get_property(struct power_supply *psy,
>  
>  static int usb_conn_psy_register(struct usb_conn_info *info)
>  {
> +	static atomic_t usb_conn_no = ATOMIC_INIT(0);

Please use a proper data structure for this (hint, not an atomic_t, but
rather a idr, or is it ida?)

thanks,

greg k-h
