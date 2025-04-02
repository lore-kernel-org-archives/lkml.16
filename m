Received: from mail2-relais-roc.national.inria.fr (mail2-relais-roc.national.inria.fr [192.134.164.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F5A223909E
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 12:54:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.134.164.83
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743598453; cv=none; b=Tj03GsN4sUyjXlJk1shbkTAmE+RGbSDNyrs7XRKHFMOrSLqkPFc+vSDiNib4sDIzuSRfEbSoc28QHJXm/gvKHtIx27zmZAKZBsgpWnoNKNlMEQ3IfbasOOpjK6zFxkmE4KVFbyPX+ALZibm0U0Ru5T3p4/2v86nZF3OzmIEPO1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743598453; c=relaxed/simple;
	bh=5INxPsuOE6270fFWGYFq15y/ebioY3u8KiI0+M4WPMk=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=fJziJC2HQDm73P+vNjbqXW7NAOCgylP5zrbo3EneaZaxoj6bg8bU436PD+k6uf4QUs11kFSRyN22Bou11vTm5INfbWAv4VMEqRR+3ZcD9HoB/SXWNExSNkqnCzNBrMY66bgLVBnrnWGTc+rui1tatTuDKcfhZqdEuTaFSbKCK+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr; spf=pass smtp.mailfrom=inria.fr; dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b=r2csHdH/; arc=none smtp.client-ip=192.134.164.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inria.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b="r2csHdH/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=UGPDN/CtUITf4gTg1aiWC2eiejfhU3hysLculSlUEkg=;
  b=r2csHdH/5fPj8zgjiRfr/a1nfYvP3Pvt7857lOEpkoK0o2/toTlAtxpP
   lcAamEsVU2HS32vimNIOEyqpKpv1tXBEVYeWR/MocfGOR/i5ezlacLbG1
   yuMCg6ggGM79lI3/KynhCCEQS5Kgl83a7+woT0MXvDv8qgCPRNqZVIoyB
   o=;
Authentication-Results: mail2-relais-roc.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.15,182,1739833200"; 
   d="scan'208";a="216010297"
Received: from powered-by.xenosite.net (HELO hadrien) ([89.255.17.162])
  by mail2-relais-roc.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2025 14:54:08 +0200
Date: Wed, 2 Apr 2025 14:54:08 +0200 (CEST)
From: Julia Lawall <julia.lawall@inria.fr>
To: Erick Karanja <karanja99erick@gmail.com>
cc: gregkh@linuxfoundation.org, outreachy@lists.linux.dev, 
    philipp.g.hortmann@gmail.com, linux-staging@lists.linux.dev, 
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] staging: rtl8723bs: Use true/false instead of 1/0
In-Reply-To: <49c14bf7475d121e7b3f600e46b93c003851abd1.1743596287.git.karanja99erick@gmail.com>
Message-ID: <72eb7f-52ce-60f5-6c56-52c644084f7@inria.fr>
References: <cover.1743596287.git.karanja99erick@gmail.com> <49c14bf7475d121e7b3f600e46b93c003851abd1.1743596287.git.karanja99erick@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-810343527-1743598448=:3176"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-810343527-1743598448=:3176
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

You have three patches with the same subject line, which is not allowed.
You can be more specific about the files name or the structure name and
field.

julia

On Wed, 2 Apr 2025, Erick Karanja wrote:

> Standardize boolean representation by replacing 1/0
> with true/false in cases where boolean logic is implied.
> This improves code clarity and aligns with the kernel’s bool type usage.
>
> Signed-off-by: Erick Karanja <karanja99erick@gmail.com>
> ---
>  drivers/staging/rtl8723bs/core/rtw_ap.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/staging/rtl8723bs/core/rtw_ap.c b/drivers/staging/rtl8723bs/core/rtw_ap.c
> index d46a04b9a05e..199727f04516 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_ap.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_ap.c
> @@ -386,10 +386,10 @@ void update_bmc_sta(struct adapter *padapter)
>
>  		pmlmeinfo->FW_sta_info[psta->mac_id].psta = psta;
>
> -		psta->qos_option = 0;
> +		psta->qos_option = false;
>  		psta->htpriv.ht_option = false;
>
> -		psta->ieee8021x_blocked = 0;
> +		psta->ieee8021x_blocked = false;
>
>  		memset((void *)&psta->sta_stats, 0, sizeof(struct stainfo_stats));
>
> @@ -1967,17 +1967,17 @@ void sta_info_update(struct adapter *padapter, struct sta_info *psta)
>
>  	/* update wmm cap. */
>  	if (WLAN_STA_WME & flags)
> -		psta->qos_option = 1;
> +		psta->qos_option = true;
>  	else
> -		psta->qos_option = 0;
> +		psta->qos_option = false;
>
>  	if (pmlmepriv->qospriv.qos_option == 0)
> -		psta->qos_option = 0;
> +		psta->qos_option = false;
>
>  	/* update 802.11n ht cap. */
>  	if (WLAN_STA_HT & flags) {
>  		psta->htpriv.ht_option = true;
> -		psta->qos_option = 1;
> +		psta->qos_option = true;
>  	} else {
>  		psta->htpriv.ht_option = false;
>  	}
> --
> 2.43.0
>
>
>
--8323329-810343527-1743598448=:3176--
