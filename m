Received: from mail3-relais-sop.national.inria.fr (mail3-relais-sop.national.inria.fr [192.134.164.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F9D51E5B81
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 22:32:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.134.164.104
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743546740; cv=none; b=fVvduqiY5LSfyvaYxdCN5AjbWmQn7rrOAYLY9S5SXMDVpjGwtB2h4e1DvLn8HVUPlqY0VKvKNukQIo0ew3hstk5qLXYXFVjv+kBcGObqyoAT35mlDUu76bwBCoDxe6uIgG++XBTi9JHT/7tYgNeRO8iqXgIW2UBofifAAARM+ho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743546740; c=relaxed/simple;
	bh=mgq6wIEM3mJNz3RvWJEcQrluiqWgEAYaQNbj+0gDY8U=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=IPHpV4Ygt0g7Btlyw+VlT0dzvbQfXbD/WHDLGPKOT8TkBh/1F2Q+u4eLpD08gVxyqDghBmu1fN0laBN87jtXQX+COeauC4BSp6FvxtWebZ1thduWZ6aJs5ZoHYKadxvl30A2pMa2HNjdf3zEF/nZvB564QdS2jgN2I4BXu8Lc58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr; spf=pass smtp.mailfrom=inria.fr; dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b=TJPkJvZ/; arc=none smtp.client-ip=192.134.164.104
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inria.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b="TJPkJvZ/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=31VRL7ysAQBQJ2FPw0G6CeMmsjWBWRGw5wyCao/+0XI=;
  b=TJPkJvZ/41PZrrRl4mGdk/tLds9sFV7RFr5R0YhpJaRkTsMhvhy23IFc
   coUMkO+CMwF1TeSGq20pgFVGSc2mhDZKNIZAVLZATNxte43s792R0YBBI
   Jwh92B82Z8LiA9aH9rPpRLok8dNpaDbIOdhWGWJV/drI/BtCGXbJcFd9i
   w=;
Authentication-Results: mail3-relais-sop.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.14,294,1736809200"; 
   d="scan'208";a="113198105"
Received: from a81-173-67-6.dsl.pocosnet.nl (HELO hadrien) ([81.173.67.6])
  by mail3-relais-sop.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2025 00:32:10 +0200
Date: Wed, 2 Apr 2025 00:32:08 +0200 (CEST)
From: Julia Lawall <julia.lawall@inria.fr>
To: Erick Karanja <karanja99erick@gmail.com>
cc: gregkh@linuxfoundation.org, outreachy@lists.linux.dev, 
    philipp.g.hortmann@gmail.com, linux-staging@lists.linux.dev, 
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/5] staging: rtl8723bs: use preferred comparison
 order
In-Reply-To: <128b2c78fe04c358c96bff4a2fae1de8e7a6839d.1743524096.git.karanja99erick@gmail.com>
Message-ID: <3981568-f31c-21fb-2d20-927a99fe3c59@inria.fr>
References: <cover.1743524096.git.karanja99erick@gmail.com> <128b2c78fe04c358c96bff4a2fae1de8e7a6839d.1743524096.git.karanja99erick@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII



On Tue, 1 Apr 2025, Erick Karanja wrote:

> Refactor  conditions check to follow the Linux kernel
> coding style, which prefers placing the variable on the left side
> of the comparison.

You have already done thing, which looks ok.  But if you like, you could
try writing a semantic patch that makes this change.

constant c; is a metavariable that matches a constant, approximated as a
word in full capital letters.

julia

>
> Reported by checkpatch:
>
> 	WARNING: Comparisons should place the constant on the right side
>     of the test
>
> Signed-off-by: Erick Karanja <karanja99erick@gmail.com>
> ---
>  drivers/staging/rtl8723bs/hal/hal_btcoex.c | 22 +++++++++++-----------
>  1 file changed, 11 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/staging/rtl8723bs/hal/hal_btcoex.c b/drivers/staging/rtl8723bs/hal/hal_btcoex.c
> index b72cf520d576..9105594d2dde 100644
> --- a/drivers/staging/rtl8723bs/hal/hal_btcoex.c
> +++ b/drivers/staging/rtl8723bs/hal/hal_btcoex.c
> @@ -91,7 +91,7 @@ static void halbtcoutsrc_LeaveLowPower(struct btc_coexist *pBtCoexist)
>  	stime = jiffies;
>  	do {
>  		ready = rtw_register_task_alive(padapter, BTCOEX_ALIVE);
> -		if (_SUCCESS == ready)
> +		if (ready == _SUCCESS)
>  			break;
>
>  		utime = jiffies_to_msecs(jiffies - stime);
> @@ -668,7 +668,7 @@ static void halbtcoutsrc_WriteLocalReg1Byte(void *pBtcContext, u32 RegAddr, u8 D
>  	struct btc_coexist *pBtCoexist = (struct btc_coexist *)pBtcContext;
>  	struct adapter *Adapter = pBtCoexist->Adapter;
>
> -	if (BTC_INTF_SDIO == pBtCoexist->chipInterface)
> +	if (pBtCoexist->chipInterface == BTC_INTF_SDIO)
>  		rtw_write8(Adapter, SDIO_LOCAL_BASE | RegAddr, Data);
>  	else
>  		rtw_write8(Adapter, RegAddr, Data);
> @@ -894,7 +894,7 @@ void EXhalbtcoutsrc_IpsNotify(struct btc_coexist *pBtCoexist, u8 type)
>  	if (pBtCoexist->bManualControl)
>  		return;
>
> -	if (IPS_NONE == type)
> +	if (type == IPS_NONE)
>  		ipsType = BTC_IPS_LEAVE;
>  	else
>  		ipsType = BTC_IPS_ENTER;
> @@ -922,7 +922,7 @@ void EXhalbtcoutsrc_LpsNotify(struct btc_coexist *pBtCoexist, u8 type)
>  	if (pBtCoexist->bManualControl)
>  		return;
>
> -	if (PS_MODE_ACTIVE == type)
> +	if (type == PS_MODE_ACTIVE)
>  		lpsType = BTC_LPS_DISABLE;
>  	else
>  		lpsType = BTC_LPS_ENABLE;
> @@ -1000,7 +1000,7 @@ void EXhalbtcoutsrc_MediaStatusNotify(struct btc_coexist *pBtCoexist, enum
>  	if (pBtCoexist->bManualControl)
>  		return;
>
> -	if (RT_MEDIA_CONNECT == mediaStatus)
> +	if (mediaStatus == RT_MEDIA_CONNECT)
>  		mStatus = BTC_MEDIA_CONNECT;
>  	else
>  		mStatus = BTC_MEDIA_DISCONNECT;
> @@ -1026,11 +1026,11 @@ void EXhalbtcoutsrc_SpecialPacketNotify(struct btc_coexist *pBtCoexist, u8 pktTy
>  	if (pBtCoexist->bManualControl)
>  		return;
>
> -	if (PACKET_DHCP == pktType) {
> +	if (pktType == PACKET_DHCP) {
>  		packetType = BTC_PACKET_DHCP;
> -	} else if (PACKET_EAPOL == pktType) {
> +	} else if (pktType == PACKET_EAPOL) {
>  		packetType = BTC_PACKET_EAPOL;
> -	} else if (PACKET_ARP == pktType) {
> +	} else if (pktType == PACKET_ARP) {
>  		packetType = BTC_PACKET_ARP;
>  	} else {
>  		return;
> @@ -1114,13 +1114,13 @@ void EXhalbtcoutsrc_Periodical(struct btc_coexist *pBtCoexist)
>
>  void EXhalbtcoutsrc_SetAntNum(u8 type, u8 antNum)
>  {
> -	if (BT_COEX_ANT_TYPE_PG == type) {
> +	if (type == BT_COEX_ANT_TYPE_PG) {
>  		GLBtCoexist.boardInfo.pgAntNum = antNum;
>  		GLBtCoexist.boardInfo.btdmAntNum = antNum;
> -	} else if (BT_COEX_ANT_TYPE_ANTDIV == type) {
> +	} else if (type == BT_COEX_ANT_TYPE_ANTDIV) {
>  		GLBtCoexist.boardInfo.btdmAntNum = antNum;
>  		/* GLBtCoexist.boardInfo.btdmAntPos = BTC_ANTENNA_AT_MAIN_PORT; */
> -	} else if (BT_COEX_ANT_TYPE_DETECTED == type) {
> +	} else if (type == BT_COEX_ANT_TYPE_DETECTED) {
>  		GLBtCoexist.boardInfo.btdmAntNum = antNum;
>  		/* GLBtCoexist.boardInfo.btdmAntPos = BTC_ANTENNA_AT_MAIN_PORT; */
>  	}
> --
> 2.43.0
>
>
>
