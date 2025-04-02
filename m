Received: from mail2-relais-roc.national.inria.fr (mail2-relais-roc.national.inria.fr [192.134.164.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02CC32376F7
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 12:55:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.134.164.83
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743598503; cv=none; b=ahgMuOBPGOYemsOAyjk9MgSPwHjepYvK5kfktrRqIUCe3V2DoqEKfsC2rt8s5/ABXgUVcoayph+mJAvwKgjXoNdz0OWUQXMoIru9Zp/NVDgdxdm9QHiFL03lIcX/BvKy8THs0M9/BXJCbVtzc3tI+VA6sj+RK/pXV3r3VRr5uJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743598503; c=relaxed/simple;
	bh=M1yLQbvCDDis+zBGPAFAampa/wB/POy9mrMqLxOQyA8=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=E7HjQu7h/v4msjrHX6g79SIwIO+JH3HfY3mVL7/VyW8b9I0ECrpxSleC+Rt2Yi4z7cEtrN8CuLN/M+P0SXWZSY0UOchbGScVfCxj5RwzS93FQ+JwCIg8eDqrgVXfvarwcSP/+DkldIIuTQhgnQCFUdQPQxxICV5KCus3978F0Ao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr; spf=pass smtp.mailfrom=inria.fr; dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b=Koy0U3Ce; arc=none smtp.client-ip=192.134.164.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inria.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b="Koy0U3Ce"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=bTgtCv5vSk5g2whT/VvMeVHJheiS02PeRtIM5dobjnU=;
  b=Koy0U3CePdWRTHWDHiRxCHg+hL4r3tMi+0UXCfKxKrPi6ug0YY2e0KaG
   JytAd4Ye7+qIDjY/PklkChhNXtsRrfsG+qpmjlU2fBFACuzTg/8kS0yXC
   ImHomAN8Bor/dW0DZdIvhnBprZmqTpIzox7QXzxQvSxn0LUXv14Ss6uQR
   8=;
Authentication-Results: mail2-relais-roc.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.15,182,1739833200"; 
   d="scan'208";a="216010494"
Received: from powered-by.xenosite.net (HELO hadrien) ([89.255.17.162])
  by mail2-relais-roc.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2025 14:54:59 +0200
Date: Wed, 2 Apr 2025 14:54:58 +0200 (CEST)
From: Julia Lawall <julia.lawall@inria.fr>
To: Erick Karanja <karanja99erick@gmail.com>
cc: gregkh@linuxfoundation.org, outreachy@lists.linux.dev, 
    philipp.g.hortmann@gmail.com, linux-staging@lists.linux.dev, 
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] staging: rtl8723bs: Use true/false instead of 1/0
In-Reply-To: <eca5a63d92f5bbbecb642d324a5e0641f697d0bf.1743596287.git.karanja99erick@gmail.com>
Message-ID: <40862a76-94bb-bf75-c3ee-8042404ea235@inria.fr>
References: <cover.1743596287.git.karanja99erick@gmail.com> <eca5a63d92f5bbbecb642d324a5e0641f697d0bf.1743596287.git.karanja99erick@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-249229286-1743598499=:3176"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-249229286-1743598499=:3176
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT



On Wed, 2 Apr 2025, Erick Karanja wrote:

> Standardize boolean representation by replacing 1/0
> with true/false in cases where boolean logic is implied.
> This improves code clarity and aligns with the kernel’s bool type usage.

It would be nice to point out that true/false is used elsewhere in this
file for this structure field.  We can't see this in the patch.

julia

>
> Signed-off-by: Erick Karanja <karanja99erick@gmail.com>
> ---
>  drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
> index 952ce6dd5af9..8f2c9c3e853c 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
> @@ -1173,7 +1173,7 @@ unsigned int OnAssocReq(struct adapter *padapter, union recv_frame *precv_frame)
>
>  	/*  check if there is WMM IE & support WWM-PS */
>  	pstat->flags &= ~WLAN_STA_WME;
> -	pstat->qos_option = 0;
> +	pstat->qos_option = false;
>  	pstat->qos_info = 0;
>  	pstat->has_legacy_ac = true;
>  	pstat->uapsd_vo = 0;
> @@ -1189,7 +1189,7 @@ unsigned int OnAssocReq(struct adapter *padapter, union recv_frame *precv_frame)
>
>  					pstat->flags |= WLAN_STA_WME;
>
> -					pstat->qos_option = 1;
> +					pstat->qos_option = true;
>  					pstat->qos_info = *(p+8);
>
>  					pstat->max_sp_len = (pstat->qos_info>>5)&0x3;
> --
> 2.43.0
>
>
>
--8323329-249229286-1743598499=:3176--
