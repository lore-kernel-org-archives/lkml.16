Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11F92126BFF;
	Thu, 10 Apr 2025 17:04:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744304669; cv=none; b=Fcu8LGmPeAl1oVj2ddu7oXIkBnTSI/8RMtjbENhxWWLMS/uGVotmIfdNcopltkM7vQkhJIBvJXw5ItNKR7XN8xrONX3q5kL/noVg/N/mGECm/bnsTihu0vm0yRptJsfpcELCGCp+8TJaN+az4UG3teDLeqxh/FSTAhRxXyvrHFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744304669; c=relaxed/simple;
	bh=vYtJC6oVobTd9CBPOufa59mL2FSgDqugsEkV3bOCIyo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QdeRxKdj3USvDN1E4yvbEMNbdNIqBr/sHxfBAfmU17C2stsnIcrbt2RG+waQQwMP/vUPmB2pADgJpCAz0i/vqlrKHjmvu0Lb3KoiXe83sna7Ew7FlQtgCjOWPl95ZVdbuE7Dhucr68/bY1hopMXruhdN5RL66DlyYv8NY6FGVYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=0BkfbZqa; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="0BkfbZqa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB55AC4CEE8;
	Thu, 10 Apr 2025 17:04:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1744304668;
	bh=vYtJC6oVobTd9CBPOufa59mL2FSgDqugsEkV3bOCIyo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=0BkfbZqaoW2OjA6Bea50+7lcxK5ZhSGm3fuCAkJB4iL3Qae3cY+Bt4nlMn4OLiVzX
	 t7n5XoTxCUZRGndUnKEEvds9ojbZUB2GgaapI0ak6XU49cbmXtN1KQRoQE/VivIxpb
	 dJLo8ySvBODZvVRBaeu/eBIWOUelW6N9RnSJJtAU=
Date: Thu, 10 Apr 2025 19:02:52 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Zijun Hu <zijun_hu@icloud.com>
Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, Zijun Hu <quic_zijuhu@quicinc.com>
Subject: Re: [PATCH] usb: dwc3: Simplify memset struct array
Message-ID: <2025041024-napping-renewed-1b41@gregkh>
References: <20250410-simplify_memset-v1-1-c7bbd850e520@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250410-simplify_memset-v1-1-c7bbd850e520@quicinc.com>

On Thu, Apr 10, 2025 at 09:30:00PM +0800, Zijun Hu wrote:
> From: Zijun Hu <quic_zijuhu@quicinc.com>
> 
> For 'struct property_entry props[6]', Simplify its memset to
> 'memset(props, 0, sizeof(props))'.
> 
> Signed-off-by: Zijun Hu <quic_zijuhu@quicinc.com>
> ---
>  drivers/usb/dwc3/host.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/dwc3/host.c b/drivers/usb/dwc3/host.c
> index b48e108fc8fe7343446946e7babf9ba3bc0d2dc3..5a2fe4c6b0e433c32945c136b8b35e1912e3acc8 100644
> --- a/drivers/usb/dwc3/host.c
> +++ b/drivers/usb/dwc3/host.c
> @@ -158,7 +158,7 @@ int dwc3_host_init(struct dwc3 *dwc)
>  		goto err;
>  	}
>  
> -	memset(props, 0, sizeof(struct property_entry) * ARRAY_SIZE(props));
> +	memset(props, 0, sizeof(props));

What does this really help with?  It feels like churn to me.

thanks,

greg k-h
