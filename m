Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF11D223DE2;
	Wed, 14 May 2025 09:04:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747213442; cv=none; b=MxvzL3xAHcaK11eqf3PgYLnctX4vB3CswRBvyOSaVKLPBOSCWxhWr1OJr1Fmz3wrTMrRTkqVUDzMqCUbSBdnqNb3ZxUBsc5GJWjMLrjwSMX4RBt/vPMRjxcmMpG0eS2sPgYQdDkkEMcqYtZUbOGGiA0kf60m0BY+I6JeSYw3uNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747213442; c=relaxed/simple;
	bh=5qpSsK+H3gzRPOghIYm5gN4tAAK6Kr0/kVv8FugAqL0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bRAF14sz8tSbIjl9sMdjg6JMoQiPpl6/vvGX4bQUql2Ljc8s38OTp64BECT8Sf31msPY49ni72WhHq9T3KXLu6pqgg7S/GmkaTKPXhH69rBT2OoRU4wkdBPg18xBC9opjEBP7pxovGwhEaRCz3PR17Un9C0Xm+ajgr1zoHtykIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=jW0/NDZB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="jW0/NDZB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3EC3C4CEE9;
	Wed, 14 May 2025 09:04:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1747213441;
	bh=5qpSsK+H3gzRPOghIYm5gN4tAAK6Kr0/kVv8FugAqL0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jW0/NDZB8Vc1uFZJQOrbT1TiSqzm8NEDDD2DJJfNn1tfobiuDzqf/f/g9oaOziOWZ
	 +CKcuNvq4LEhkBdsGOzPiGfdjiwaG1qINUBtqh9V5bOMC0XA2Xe3MyHBJHg2gBEtHx
	 MdJPUU8f81YgNlYouFSaI27M4Dg8o7FyIBwYBVUM=
Date: Wed, 14 May 2025 11:02:13 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Tanav Chinthapatla <tanavc01@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: rtl8723bs: fix spacing around '+' in
 rtw_cmd.c
Message-ID: <2025051457-bath-region-1c5e@gregkh>
References: <CAPGyJDMb0Ac7KtNc8AUTJ4E-Q4Vw-8JNoKWPMTFSuRU7QiFfdQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPGyJDMb0Ac7KtNc8AUTJ4E-Q4Vw-8JNoKWPMTFSuRU7QiFfdQ@mail.gmail.com>

On Tue, May 13, 2025 at 10:11:51AM -0400, Tanav Chinthapatla wrote:
> >From 25aa24c7cde7df5901674ec08090992b17afd5b4 Mon Sep 17 00:00:00 2001
> From: Tanav Chinthapatla <tanavc01@gmail.com>
> Date: Tue, 13 May 2025 00:16:29 -0500
> Subject: [PATCH] staging: rtl8723bs: fix spacing around '+' in rtw_cmd.c
> 
> Signed-off-by: Tanav Chinthapatla <tanavc01@gmail.com>
> ---
>  drivers/staging/rtl8723bs/core/rtw_cmd.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/rtl8723bs/core/rtw_cmd.c
> b/drivers/staging/rtl8723bs/core/rtw_cmd.c
> index 1c9e8b01d..98d89e836 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_cmd.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_cmd.c
> @@ -1619,7 +1619,7 @@ static void rtw_btinfo_hdl(struct adapter
> *adapter, u8 *buf, u16 buf_len)
>   buf[1] = 0;
>   else if (cmd_idx == BTINFO_BT_AUTO_RPT)
>   buf[1] = 2;
> - hal_btcoex_BtInfoNotify(adapter, len+1, &buf[1]);
> + hal_btcoex_BtInfoNotify(adapter, len + 1, &buf[1]);
>  }
> 
>  u8 rtw_c2h_packet_wk_cmd(struct adapter *padapter, u8 *pbuf, u16 length)
> -- 
> 2.34.1
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

- Your patch is malformed (tabs converted to spaces, linewrapped, etc.)
  and can not be applied.  Please read the file,
  Documentation/process/email-clients.rst in order to fix this.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
