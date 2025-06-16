Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A72129B8D9
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 10:52:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750071139; cv=none; b=Mdp9HXQLU44EpNyuOBCw5FN1pthFWZnoern1SR4flkj3CPrqBlu68P4Du1kvzkuseNOVb73DT2rXECSydhG0teHodz9ibkE5vMRivHCNyIwHzZye9SmXUXJ3Gs9SsiMBxB1DPrUgz34dfGFD8QT9CzO+c3GCUD3Bp4m+3hpuxe8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750071139; c=relaxed/simple;
	bh=pRtjn2ajpJjDDgnbUTZy/EBQ+X/hcS8YWC9E3N75B2k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OoTaT/GHd+wsZQ3snelqiAJeeSfjRpwuQ+fx7ZYCQjpRJ/1JbyuRqCHw23kOtup6aExi0MpJiZbtmAAmjF8XPM6L/A/xl6hLbHEhilr0D3M1MEYoT2IWNzgcsu9CO3w4mHXp1Q38Lyenuu26ijmIj9P7m3UYo0Gn1qc70fmCjcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=GzWTwdFC; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="GzWTwdFC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750071136;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Hk9Uc/UNTVqG7C07kBMIdRJ3hUm2mx5PXQsfSHyh+9o=;
	b=GzWTwdFCP66PSgyR96JDb0P9PcfmwzB7nAhSuAtk8sR//hYlk+sGKMQMMRCK+OLnHebzQb
	jueh0/Zo2yyBO1hhpk98s+XqXtYw0EtChI7IQ+HrlnVBSIkmKVkefIw6dKqivtz3gH2HBt
	RJUfyJKbvVSayaKFGIT7DPbeGVtkCVA=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-323-S8vyleKnPGe5MGo6b1yVow-1; Mon, 16 Jun 2025 06:52:15 -0400
X-MC-Unique: S8vyleKnPGe5MGo6b1yVow-1
X-Mimecast-MFC-AGG-ID: S8vyleKnPGe5MGo6b1yVow_1750071134
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-ad89c32a8a6so414716866b.3
        for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 03:52:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750071134; x=1750675934;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Hk9Uc/UNTVqG7C07kBMIdRJ3hUm2mx5PXQsfSHyh+9o=;
        b=QjHCoxssFGXaxO5FfEySA+lux1Sb3K/2PYyzTyhqbvqnfi77avKjzyBX3CNWpOwPUU
         jvmfpbIyIjigV6NMLLXMBXikVdKHhahIFp2RmxnC426/GsDunz+hq9NlQW7BbThZ34B5
         RH/W6X4jYsLGwv1u9+lb/a+mSyNoRWk15Coc0TzRFtbOYXYuaAGpiFix0apg4CFUg41Z
         VBFASzsu/ebEvDn2Y9jEX0OrPrTu+DFkjNChG+XvbnKDmyaT10cVQnvZOgxH7HjhtMNf
         ccEaQUbklz1mspOJ9tNkX3IVCFmUGRvHn0VQQWkvChVRNnJqYvhdxDdf4UhJgZi+D/rG
         A8gw==
X-Forwarded-Encrypted: i=1; AJvYcCUFVXx6n37RJtUUi7uiHMnU1Cn3fTZtKrCdA90oT+okXnAcU7FOSyruslrADX15F8D6QppXIz7mmT6DvNY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzJhj2rh+YIdV/0yn9GTJzXYiiEKFEybXwnEwwWjQCnm3oVutAA
	YX3M9CgxfhrcjSDd26N7sp0Ew3qpfxMhf/xS5a8isKP/InX/BjN/wQZBDANxPvdonwKqxCA106A
	++Tk+rEgqBBsUO2+mP1yeDnBJ8WzpI0izzGxrKJYYvsUWGrkgVJElmfVj4lClE3mbAA==
X-Gm-Gg: ASbGncvBNdAZD/uEE4vbjqTUbYQduce6i7wfkh+Gzds4hKSK1xQ8FGIlBqDzUW9civG
	NfmbgoyGbchCYeIXwo3QM9OVujyR/yywwbjn9dN5dPG3P90dKlGrQG59zhqWJlYzKDkUdCttWd2
	TUycALRzFI575kbueQaFq4TKi/mOoIY5wrLIhDcCFuyqu8zDft43rCk5ud7uOMdQV3BTEMUhNoL
	cEty1zbmD1ZUkP+XThN5H9sYYJFDxfUcGQ9enb4oQ0M+NXoNQBBn7Ek9pRhUd+lcupWLurlYjMY
	YXzLDAI535lPgVPBQtlJEXAs9g==
X-Received: by 2002:a17:906:7954:b0:ad5:3743:3fa1 with SMTP id a640c23a62f3a-adfad59fe96mr807304066b.50.1750071134040;
        Mon, 16 Jun 2025 03:52:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHDfE8XtZp/JlVmaxbngNN01gtbKw114f41ls9b8Zl+6xI4HTLykb1zxM1beH9uYfGTjokCZg==
X-Received: by 2002:a17:906:7954:b0:ad5:3743:3fa1 with SMTP id a640c23a62f3a-adfad59fe96mr807301666b.50.1750071133531;
        Mon, 16 Jun 2025 03:52:13 -0700 (PDT)
Received: from [10.40.98.122] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-adec899c757sm634292566b.183.2025.06.16.03.52.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Jun 2025 03:52:13 -0700 (PDT)
Message-ID: <98a85abb-5e77-4e66-a192-8db9245e7ef7@redhat.com>
Date: Mon, 16 Jun 2025 12:52:12 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] staging: rtl8723bs: remove some 5 GHz code
To: Michael Straube <straube.linux@gmail.com>, gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20250615123859.41922-1-straube.linux@gmail.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20250615123859.41922-1-straube.linux@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 15-Jun-25 14:38, Michael Straube wrote:
> Chips that use this driver are 2.4 GHz only. Remove some code that is
> executed only for 5 GHz (channel > 14) . This addresses the following
> TODO item:
> 
> - find and remove any code for other chips that is left over
> 
> Signed-off-by: Michael Straube <straube.linux@gmail.com>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hansg@kernel.org>

Regards,

Hans




> ---
> Compile tested only, due to lack of hardware.
> 
>  drivers/staging/rtl8723bs/core/rtw_ap.c        |  9 ++-------
>  drivers/staging/rtl8723bs/core/rtw_mlme.c      | 18 ++++--------------
>  drivers/staging/rtl8723bs/core/rtw_wlan_util.c |  9 ++-------
>  3 files changed, 8 insertions(+), 28 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/core/rtw_ap.c b/drivers/staging/rtl8723bs/core/rtw_ap.c
> index 383a6f7c06f4..b2e7e7267aa4 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_ap.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_ap.c
> @@ -741,13 +741,8 @@ void start_bss_network(struct adapter *padapter)
>  	if (p && ie_len) {
>  		pht_info = (struct HT_info_element *)(p + 2);
>  
> -		if (cur_channel > 14) {
> -			if ((pregpriv->bw_mode & 0xf0) > 0)
> -				cbw40_enable = 1;
> -		} else {
> -			if ((pregpriv->bw_mode & 0x0f) > 0)
> -				cbw40_enable = 1;
> -		}
> +		if ((pregpriv->bw_mode & 0x0f) > 0)
> +			cbw40_enable = 1;
>  
>  		if ((cbw40_enable) &&	 (pht_info->infos[0] & BIT(2))) {
>  			/* switch to the 40M Hz mode */
> diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
> index 1d23ea7d6f59..0b0ee023a239 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
> @@ -2252,13 +2252,8 @@ unsigned int rtw_restructure_ht_ie(struct adapter *padapter, u8 *in_ie, u8 *out_
>  	}
>  
>  	/* to disable 40M Hz support while gd_bw_40MHz_en = 0 */
> -	if (channel > 14) {
> -		if ((pregistrypriv->bw_mode & 0xf0) > 0)
> -			cbw40_enable = 1;
> -	} else {
> -		if ((pregistrypriv->bw_mode & 0x0f) > 0)
> -			cbw40_enable = 1;
> -	}
> +	if ((pregistrypriv->bw_mode & 0x0f) > 0)
> +		cbw40_enable = 1;
>  
>  	if ((cbw40_enable == 1) && (operation_bw == CHANNEL_WIDTH_40)) {
>  		ht_capie.cap_info |= cpu_to_le16(IEEE80211_HT_CAP_SUP_WIDTH);
> @@ -2366,13 +2361,8 @@ void rtw_update_ht_cap(struct adapter *padapter, u8 *pie, uint ie_len, u8 channe
>  		/* todo: */
>  	}
>  
> -	if (channel > 14) {
> -		if ((pregistrypriv->bw_mode & 0xf0) > 0)
> -			cbw40_enable = 1;
> -	} else {
> -		if ((pregistrypriv->bw_mode & 0x0f) > 0)
> -			cbw40_enable = 1;
> -	}
> +	if ((pregistrypriv->bw_mode & 0x0f) > 0)
> +		cbw40_enable = 1;
>  
>  	/* update cur_bwmode & cur_ch_offset */
>  	if ((cbw40_enable) &&
> diff --git a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c b/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
> index 73c70b016f00..0c6072d08661 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
> @@ -854,13 +854,8 @@ static void bwmode_update_check(struct adapter *padapter, struct ndis_80211_var_
>  
>  	pHT_info = (struct HT_info_element *)pIE->data;
>  
> -	if (pmlmeext->cur_channel > 14) {
> -		if ((pregistrypriv->bw_mode & 0xf0) > 0)
> -			cbw40_enable = 1;
> -	} else {
> -		if ((pregistrypriv->bw_mode & 0x0f) > 0)
> -			cbw40_enable = 1;
> -	}
> +	if ((pregistrypriv->bw_mode & 0x0f) > 0)
> +		cbw40_enable = 1;
>  
>  	if ((pHT_info->infos[0] & BIT(2)) && cbw40_enable) {
>  		new_bwmode = CHANNEL_WIDTH_40;

