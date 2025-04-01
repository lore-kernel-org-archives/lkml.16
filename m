Received: from mail2-relais-roc.national.inria.fr (mail2-relais-roc.national.inria.fr [192.134.164.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 964065103F
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 22:25:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.134.164.83
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743546358; cv=none; b=jiNNZFpluFfNFhRHEQQcFyHhWGYIaPwMvA/eYjdaHQB5bSFhCT5fCpY5n1AEcuSnNDmKI5f+dYav4FDvj1JMaL0eYac+72DJ4IEkNBR8ckxiJP8pDDWuhh+9hq9x3/GzNSRfO1rlwwuCAMGFjlGeAZ5SXPuPkEp+obyjgWtAEQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743546358; c=relaxed/simple;
	bh=JN/QycLrGKr/wbtswaQkxhJvnjze1O+6FHHC4go8UgY=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=NNhvjTEE9dw/gOWQB31IbyltKxU/sajMFY8LgxxxQvfe4Sg7zpB/MRNr1Xy7hjcXzh2pO0qJzfJ+kFKMidDGrTS/H1qt2mDuqOv88+38jFr2TPYu/4NHhCt3wr4ca+6+SzSQn0cUlbmsBORCb34YyFPCc4+MZ1E8DGayrIeTmXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr; spf=pass smtp.mailfrom=inria.fr; dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b=a5U5X5Yo; arc=none smtp.client-ip=192.134.164.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inria.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b="a5U5X5Yo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=PDVQm3Mkn38EYRoBI8UUfEVJrc7olWqPUg/H33d4eJo=;
  b=a5U5X5YoGYPrDs7mhCka0jcahsR48ofd2tGuKw+kcDk2ARI50kFS8mM3
   +zwHiY5OMN0sBYuw9A4Nmj/aehFLz+4nHdkbT3e3KNSgO5+uMsiiU5Xy2
   G2X90ks+uXUmJQuJFmksScCCFBO5JuVKVRlcukPZR6OjCi+LzapCmwd+I
   8=;
Authentication-Results: mail2-relais-roc.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.14,294,1736809200"; 
   d="scan'208";a="215888912"
Received: from a81-173-67-6.dsl.pocosnet.nl (HELO hadrien) ([81.173.67.6])
  by mail2-relais-roc.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2025 00:25:53 +0200
Date: Wed, 2 Apr 2025 00:25:53 +0200 (CEST)
From: Julia Lawall <julia.lawall@inria.fr>
To: Erick Karanja <karanja99erick@gmail.com>
cc: gregkh@linuxfoundation.org, outreachy@lists.linux.dev, 
    philipp.g.hortmann@gmail.com, linux-staging@lists.linux.dev, 
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 5/5] staging: rtl8723bs: no space before tabs
In-Reply-To: <4e39b1295d68aea947aa5757e3148a2e401b72bc.1743524096.git.karanja99erick@gmail.com>
Message-ID: <8f286d26-6a9f-2d24-10dd-e5f12e28564a@inria.fr>
References: <cover.1743524096.git.karanja99erick@gmail.com> <4e39b1295d68aea947aa5757e3148a2e401b72bc.1743524096.git.karanja99erick@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII



On Tue, 1 Apr 2025, Erick Karanja wrote:

> Remove spaces before tabs to comply with the Linux kernel coding style
> guidelines. Proper indentation using tabs improves code consistency
> and readability.

Now you are mixing spaces and tabs with simply deleting commented code in
one patch.  They should be in separate patches, because those are
different things.

>
> Reported by checkpatch:
>
>     WARNING: please, no space before tabs
>
> Signed-off-by: Erick Karanja <karanja99erick@gmail.com>
> ---
>  drivers/staging/rtl8723bs/hal/hal_btcoex.c | 33 ++++------------------
>  1 file changed, 6 insertions(+), 27 deletions(-)
>
> diff --git a/drivers/staging/rtl8723bs/hal/hal_btcoex.c b/drivers/staging/rtl8723bs/hal/hal_btcoex.c
> index 9105594d2dde..44f73baf1cb4 100644
> --- a/drivers/staging/rtl8723bs/hal/hal_btcoex.c
> +++ b/drivers/staging/rtl8723bs/hal/hal_btcoex.c
> @@ -9,14 +9,14 @@
>  #include <hal_btcoex.h>
>  #include <Mp_Precomp.h>
>
> -/* 		Global variables */
> +/*Global variables */

There should be a space after the /*

>
>  struct btc_coexist GLBtCoexist;
>  static u8 GLBtcWiFiInScanState;
>  static u8 GLBtcWiFiInIQKState;
>
>  /*  */
> -/* 		Debug related function */
> +/*Debug related function */
>  /*  */
>  static u8 halbtcoutsrc_IsBtCoexistAvailable(struct btc_coexist *pBtCoexist)
>  {
> @@ -84,9 +84,9 @@ static void halbtcoutsrc_LeaveLowPower(struct btc_coexist *pBtCoexist)
>  	ready = _FAIL;
>  #ifdef LPS_RPWM_WAIT_MS
>  	timeout = LPS_RPWM_WAIT_MS;
> -#else /*  !LPS_RPWM_WAIT_MS */
> +#else
>  	timeout = 30;
> -#endif /*  !LPS_RPWM_WAIT_MS */
> +#endif

I would be inclined to keep the comments on the #else and #endif.  That's
more documentation about which #if they belong with.

julia

>
>  	stime = jiffies;
>  	do {
> @@ -401,9 +401,6 @@ static u8 halbtcoutsrc_Get(void *pBtcContext, u8 getType, void *pOutBuf)
>
>  	case BTC_GET_U1_MAC_PHY_MODE:
>  		*pu8 = BTC_SMSP;
> -/* 			*pU1Tmp = BTC_DMSP; */
> -/* 			*pU1Tmp = BTC_DMDP; */
> -/* 			*pU1Tmp = BTC_MP_UNKNOWN; */
>  		break;
>
>  	case BTC_GET_U1_AP_NUM:
> @@ -561,7 +558,7 @@ static u8 halbtcoutsrc_Set(void *pBtcContext, u8 setType, void *pInBuf)
>  }
>
>  /*  */
> -/* 		IO related function */
> +/* IO related function */
>  /*  */
>  static u8 halbtcoutsrc_Read1Byte(void *pBtcContext, u32 RegAddr)
>  {
> @@ -772,7 +769,7 @@ static void halbtcoutsrc_FillH2cCmd(void *pBtcContext, u8 elementId, u32 cmdLen,
>  }
>
>  /*  */
> -/* 		Extern functions called by other module */
> +/* Extern functions called by other module */
>  /*  */
>  static u8 EXhalbtcoutsrc_BindBtCoexWithAdapter(void *padapter)
>  {
> @@ -808,8 +805,6 @@ void hal_btcoex_Initialize(void *padapter)
>
>  	pBtCoexist = &GLBtCoexist;
>
> -	/* pBtCoexist->statistics.cntBind++; */
> -
>  	pBtCoexist->chipInterface = BTC_INTF_SDIO;
>
>  	EXhalbtcoutsrc_BindBtCoexWithAdapter(padapter);
> @@ -900,14 +895,12 @@ void EXhalbtcoutsrc_IpsNotify(struct btc_coexist *pBtCoexist, u8 type)
>  		ipsType = BTC_IPS_ENTER;
>
>  	/*  All notify is called in cmd thread, don't need to leave low power again */
> -/* 	halbtcoutsrc_LeaveLowPower(pBtCoexist); */
>
>  	if (pBtCoexist->boardInfo.btdmAntNum == 2)
>  		EXhalbtc8723b2ant_IpsNotify(pBtCoexist, ipsType);
>  	else if (pBtCoexist->boardInfo.btdmAntNum == 1)
>  		EXhalbtc8723b1ant_IpsNotify(pBtCoexist, ipsType);
>
> -/* 	halbtcoutsrc_NormalLowPower(pBtCoexist); */
>  }
>
>  void EXhalbtcoutsrc_LpsNotify(struct btc_coexist *pBtCoexist, u8 type)
> @@ -952,14 +945,12 @@ void EXhalbtcoutsrc_ScanNotify(struct btc_coexist *pBtCoexist, u8 type)
>  	}
>
>  	/*  All notify is called in cmd thread, don't need to leave low power again */
> -/* 	halbtcoutsrc_LeaveLowPower(pBtCoexist); */
>
>  	if (pBtCoexist->boardInfo.btdmAntNum == 2)
>  		EXhalbtc8723b2ant_ScanNotify(pBtCoexist, scanType);
>  	else if (pBtCoexist->boardInfo.btdmAntNum == 1)
>  		EXhalbtc8723b1ant_ScanNotify(pBtCoexist, scanType);
>
> -/* 	halbtcoutsrc_NormalLowPower(pBtCoexist); */
>  }
>
>  void EXhalbtcoutsrc_ConnectNotify(struct btc_coexist *pBtCoexist, u8 action)
> @@ -978,14 +969,12 @@ void EXhalbtcoutsrc_ConnectNotify(struct btc_coexist *pBtCoexist, u8 action)
>  		assoType = BTC_ASSOCIATE_FINISH;
>
>  	/*  All notify is called in cmd thread, don't need to leave low power again */
> -/* 	halbtcoutsrc_LeaveLowPower(pBtCoexist); */
>
>  	if (pBtCoexist->boardInfo.btdmAntNum == 2)
>  		EXhalbtc8723b2ant_ConnectNotify(pBtCoexist, assoType);
>  	else if (pBtCoexist->boardInfo.btdmAntNum == 1)
>  		EXhalbtc8723b1ant_ConnectNotify(pBtCoexist, assoType);
>
> -/* 	halbtcoutsrc_NormalLowPower(pBtCoexist); */
>  }
>
>  void EXhalbtcoutsrc_MediaStatusNotify(struct btc_coexist *pBtCoexist, enum
> @@ -1006,14 +995,12 @@ void EXhalbtcoutsrc_MediaStatusNotify(struct btc_coexist *pBtCoexist, enum
>  		mStatus = BTC_MEDIA_DISCONNECT;
>
>  	/*  All notify is called in cmd thread, don't need to leave low power again */
> -/* 	halbtcoutsrc_LeaveLowPower(pBtCoexist); */
>
>  	if (pBtCoexist->boardInfo.btdmAntNum == 2)
>  		EXhalbtc8723b2ant_MediaStatusNotify(pBtCoexist, mStatus);
>  	else if (pBtCoexist->boardInfo.btdmAntNum == 1)
>  		EXhalbtc8723b1ant_MediaStatusNotify(pBtCoexist, mStatus);
>
> -/* 	halbtcoutsrc_NormalLowPower(pBtCoexist); */
>  }
>
>  void EXhalbtcoutsrc_SpecialPacketNotify(struct btc_coexist *pBtCoexist, u8 pktType)
> @@ -1037,14 +1024,12 @@ void EXhalbtcoutsrc_SpecialPacketNotify(struct btc_coexist *pBtCoexist, u8 pktTy
>  	}
>
>  	/*  All notify is called in cmd thread, don't need to leave low power again */
> -/* 	halbtcoutsrc_LeaveLowPower(pBtCoexist); */
>
>  	if (pBtCoexist->boardInfo.btdmAntNum == 2)
>  		EXhalbtc8723b2ant_SpecialPacketNotify(pBtCoexist, packetType);
>  	else if (pBtCoexist->boardInfo.btdmAntNum == 1)
>  		EXhalbtc8723b1ant_SpecialPacketNotify(pBtCoexist, packetType);
>
> -/* 	halbtcoutsrc_NormalLowPower(pBtCoexist); */
>  }
>
>  void EXhalbtcoutsrc_BtInfoNotify(struct btc_coexist *pBtCoexist, u8 *tmpBuf, u8 length)
> @@ -1055,14 +1040,12 @@ void EXhalbtcoutsrc_BtInfoNotify(struct btc_coexist *pBtCoexist, u8 *tmpBuf, u8
>  	pBtCoexist->statistics.cntBtInfoNotify++;
>
>  	/*  All notify is called in cmd thread, don't need to leave low power again */
> -/* 	halbtcoutsrc_LeaveLowPower(pBtCoexist); */
>
>  	if (pBtCoexist->boardInfo.btdmAntNum == 2)
>  		EXhalbtc8723b2ant_BtInfoNotify(pBtCoexist, tmpBuf, length);
>  	else if (pBtCoexist->boardInfo.btdmAntNum == 1)
>  		EXhalbtc8723b1ant_BtInfoNotify(pBtCoexist, tmpBuf, length);
>
> -/* 	halbtcoutsrc_NormalLowPower(pBtCoexist); */
>  }
>
>  void EXhalbtcoutsrc_HaltNotify(struct btc_coexist *pBtCoexist)
> @@ -1102,14 +1085,12 @@ void EXhalbtcoutsrc_Periodical(struct btc_coexist *pBtCoexist)
>
>  	/*  Periodical should be called in cmd thread, */
>  	/*  don't need to leave low power again */
> -/* 	halbtcoutsrc_LeaveLowPower(pBtCoexist); */
>
>  	if (pBtCoexist->boardInfo.btdmAntNum == 2)
>  		EXhalbtc8723b2ant_Periodical(pBtCoexist);
>  	else if (pBtCoexist->boardInfo.btdmAntNum == 1)
>  		EXhalbtc8723b1ant_Periodical(pBtCoexist);
>
> -/* 	halbtcoutsrc_NormalLowPower(pBtCoexist); */
>  }
>
>  void EXhalbtcoutsrc_SetAntNum(u8 type, u8 antNum)
> @@ -1119,10 +1100,8 @@ void EXhalbtcoutsrc_SetAntNum(u8 type, u8 antNum)
>  		GLBtCoexist.boardInfo.btdmAntNum = antNum;
>  	} else if (type == BT_COEX_ANT_TYPE_ANTDIV) {
>  		GLBtCoexist.boardInfo.btdmAntNum = antNum;
> -		/* GLBtCoexist.boardInfo.btdmAntPos = BTC_ANTENNA_AT_MAIN_PORT; */
>  	} else if (type == BT_COEX_ANT_TYPE_DETECTED) {
>  		GLBtCoexist.boardInfo.btdmAntNum = antNum;
> -		/* GLBtCoexist.boardInfo.btdmAntPos = BTC_ANTENNA_AT_MAIN_PORT; */
>  	}
>  }
>
> --
> 2.43.0
>
>
>
