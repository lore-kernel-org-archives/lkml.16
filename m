Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF09A25F96D;
	Mon, 30 Jun 2025 11:39:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751283586; cv=none; b=l5v8xMpnzNcZaz4j5NAf+L+BZU3O7ruzkOTLmZ/+CXXbKHvJ9Oer61CT8fJytBS/W6GQoH1v9AWHKaOrGFD6CtjRpAV6ZASjALfvmhXsYksaSb1/ftjvsasrmQbuxlJKv37YtFki/TqgU16vjJUMHRjNRepgWFBzGdF2QW+HKQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751283586; c=relaxed/simple;
	bh=g00J8v4gyeoxiUOeUEh5TcENqOjHiixTY1cv2B+/Uqw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZoTBhS+sXRXqw8RWOJfbkuOr4g90ABbJxomMB+iXn4Phxal+lmO8xNupvbwCyZ/cecsEGgYpMkPSa9zak8MiAmZYSDYX9+3ukhVZnyyuW+hVLive7H1ZvLc9MziH/1j+tr3fMfSuJ4WpDWKulPYgDer6wm1AnnfE5Vjllq7Tbfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JRjOwJx+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JRjOwJx+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2EA8BC4CEE3;
	Mon, 30 Jun 2025 11:39:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751283585;
	bh=g00J8v4gyeoxiUOeUEh5TcENqOjHiixTY1cv2B+/Uqw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JRjOwJx+hZhuv+e867xmxOlJ1ongkF7wjsXd+A4LZ5xt0Snxdther9/cQ5bgNAles
	 7zb4l3oRbknTqpmmlnc9hhIJPTs4oNgU3NjtwYaJNuO8hLpB2tgBfJsTFqbO7VSw+M
	 WFoE6/XIQjex5EuOkiKm8kvDQjWPE2+3JWKukMvMhT9GuEo5T9e3EYBpO8WsotTVHc
	 XewWNw4aFJ6YsWpvSpfZso9FscCksJH1b5+vNsXMPcFmMBUFxHgVyiA+HyKRfh3T/V
	 1FpyCU487PgnMrwU1/PYiXm7fAMKO8kjefPN6Bg4DUECHjLWyn1Nh93PGmHN/r+3FN
	 s7hg0hC8Iw1Yg==
Date: Mon, 30 Jun 2025 19:39:37 +0800
From: "Peter Chen (CIX)" <peter.chen@kernel.org>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: linux-usb@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	LKML <linux-kernel@vger.kernel.org>,
	kernel-janitors@vger.kernel.org, Chen Ni <nichen@iscas.ac.cn>,
	Xu Yang <xu.yang_2@nxp.com>
Subject: Re: [PATCH] usb: chipidea: udc: Use usb_endpoint_is_isoc_in() rather
 than duplicating its implementation
Message-ID: <20250630113937.GA222582@nchen-desktop>
References: <e9b363cb-1223-41fa-8613-73ff9a1d4a30@web.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e9b363cb-1223-41fa-8613-73ff9a1d4a30@web.de>

On 25-06-24 17:40:17, Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Tue, 24 Jun 2025 17:30:52 +0200
> 
> Reuse existing functionality from usb_endpoint_is_isoc_in() instead of
> keeping duplicate source code.
> 
> The source code was transformed by using the Coccinelle software.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

Acked-by: Peter Chen <peter.chen@kernel.org>

Peter
> ---
>  drivers/usb/chipidea/udc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/chipidea/udc.c b/drivers/usb/chipidea/udc.c
> index 64a421ae0f05..75705089136c 100644
> --- a/drivers/usb/chipidea/udc.c
> +++ b/drivers/usb/chipidea/udc.c
> @@ -1992,7 +1992,7 @@ static struct usb_ep *ci_udc_match_ep(struct usb_gadget *gadget,
>  	struct ci_hdrc *ci = container_of(gadget, struct ci_hdrc, gadget);
>  	struct usb_ep *ep;
>  
> -	if (usb_endpoint_xfer_isoc(desc) && usb_endpoint_dir_in(desc)) {
> +	if (usb_endpoint_is_isoc_in(desc)) {
>  		list_for_each_entry_reverse(ep, &ci->gadget.ep_list, ep_list) {
>  			if (ep->caps.dir_in && !ep->claimed)
>  				return ep;
> -- 
> 2.50.0
> 

-- 

Best regards,
Peter
