Received: from mail2-relais-roc.national.inria.fr (mail2-relais-roc.national.inria.fr [192.134.164.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9727213E91
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 16:01:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.134.164.83
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743436896; cv=none; b=uO8AIrcH8jwyjKCl62JPvtMCvs0ybTLvvyxRio/f89LCuLtSocF0ay57nfBccZPzqjpcK0Q7XuEGVUg7W87diGt1L7mDbsKUPkrXqiQ0/yqhJDOraoxYuWVnWjkE37q3s8/ljSXJzxMUfWukak/AT5VGYKddNAZSL1YL/BfiQLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743436896; c=relaxed/simple;
	bh=kSfxVxdF6fqvmlvDQrE77vwAPceFLZzgZh77oybhSNg=;
	h=Content-Type:From:Mime-Version:Subject:Date:Message-Id:References:
	 Cc:In-Reply-To:To; b=U8q555+oiJP/mXIgTgqOEGon78FkDie4mhp4ENQ3z64gai7hv0Cvn9b1hk9JYdHO/OXF73Qseu42Alll371DvC683wzrrqopAenjhzbc2638MDMzfTJkoAa8rZyauS/Afcjrz+PpheLcaxpCMYZccn2MUYVBommA9Ben3+gx090=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr; spf=pass smtp.mailfrom=inria.fr; dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b=iSjgoPLQ; arc=none smtp.client-ip=192.134.164.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inria.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b="iSjgoPLQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=content-transfer-encoding:from:mime-version:subject:date:
   message-id:references:cc:in-reply-to:to;
  bh=vY8X0WYZci99O4C1r9fW4gTUb/On4EzlTK532BYsm0I=;
  b=iSjgoPLQB01iPmqudzxQYTFV/K+8O9ny+K+qLqjd3gjR31rVsgoingwr
   jCzODxIXZlrl6k5UJHjUmYyWmCzOlMHis42TO0wDrhean4xfrlLLzPpT1
   RHtqfrkK42od/rFHcLWFlmUAS3XQYsOxC73wSdUMehSFZxc69UPcblGAY
   8=;
Authentication-Results: mail2-relais-roc.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=Julia.Lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.14,291,1736809200"; 
   d="scan'208";a="215648079"
Received: from 3.153.128.77.rev.sfr.net (HELO smtpclient.apple) ([77.128.153.3])
  by mail2-relais-roc.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2025 18:01:30 +0200
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: Julia Lawall <Julia.Lawall@inria.fr>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH 4/5] staging: rtl8723bs: no space before tabs
Date: Mon, 31 Mar 2025 18:01:19 +0200
Message-Id: <1EC996B6-31CE-4548-8822-4E6B6FCE3C6B@inria.fr>
References: <f4e52e87e0dbaf4c728bd0d2a2c641e8d465edd2.1743434232.git.karanja99erick@gmail.com>
Cc: gregkh@linuxfoundation.org, outreachy@lists.linux.dev,
 philipp.g.hortmann@gmail.com, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, Erick Karanja <karanja99erick@gmail.com>
In-Reply-To: <f4e52e87e0dbaf4c728bd0d2a2c641e8d465edd2.1743434232.git.karanja99erick@gmail.com>
To: Erick Karanja <karanja99erick@gmail.com>
X-Mailer: iPhone Mail (22C152)


> On 31 Mar 2025, at 17:47, Erick Karanja <karanja99erick@gmail.com> wrote:
>=20
> =EF=BB=BFRemove spaces before tabs to comply with the Linux kernel coding s=
tyle
> guidelines. Proper indentation using tabs improves code consistency
> and readability.

In a lot of cases you are removing comments that contain code. You can also j=
ust remove these comments.

Julia=20


>=20
> Reported by checkpatch:
>=20
>    WARNING: please, no space before tabs
>=20
> Signed-off-by: Erick Karanja <karanja99erick@gmail.com>
> ---
> drivers/staging/rtl8723bs/hal/hal_btcoex.c | 42 +++++++++++-----------
> 1 file changed, 21 insertions(+), 21 deletions(-)
>=20
> diff --git a/drivers/staging/rtl8723bs/hal/hal_btcoex.c b/drivers/staging/=
rtl8723bs/hal/hal_btcoex.c
> index 9105594d2dde..b0e023d0435c 100644
> --- a/drivers/staging/rtl8723bs/hal/hal_btcoex.c
> +++ b/drivers/staging/rtl8723bs/hal/hal_btcoex.c
> @@ -9,14 +9,14 @@
> #include <hal_btcoex.h>
> #include <Mp_Precomp.h>
>=20
> -/*        Global variables */
> +/*Global variables */
>=20
> struct btc_coexist GLBtCoexist;
> static u8 GLBtcWiFiInScanState;
> static u8 GLBtcWiFiInIQKState;
>=20
> /*  */
> -/*        Debug related function */
> +/*Debug related function */
> /*  */
> static u8 halbtcoutsrc_IsBtCoexistAvailable(struct btc_coexist *pBtCoexist=
)
> {
> @@ -401,9 +401,9 @@ static u8 halbtcoutsrc_Get(void *pBtcContext, u8 getTy=
pe, void *pOutBuf)
>=20
>    case BTC_GET_U1_MAC_PHY_MODE:
>        *pu8 =3D BTC_SMSP;
> -/*            *pU1Tmp =3D BTC_DMSP; */
> -/*            *pU1Tmp =3D BTC_DMDP; */
> -/*            *pU1Tmp =3D BTC_MP_UNKNOWN; */
> +/* *pU1Tmp =3D BTC_DMSP; */
> +/* *pU1Tmp =3D BTC_DMDP; */
> +/* *pU1Tmp =3D BTC_MP_UNKNOWN; */
>        break;
>=20
>    case BTC_GET_U1_AP_NUM:
> @@ -561,7 +561,7 @@ static u8 halbtcoutsrc_Set(void *pBtcContext, u8 setTy=
pe, void *pInBuf)
> }
>=20
> /*  */
> -/*        IO related function */
> +/* IO related function */
> /*  */
> static u8 halbtcoutsrc_Read1Byte(void *pBtcContext, u32 RegAddr)
> {
> @@ -772,7 +772,7 @@ static void halbtcoutsrc_FillH2cCmd(void *pBtcContext,=
 u8 elementId, u32 cmdLen,
> }
>=20
> /*  */
> -/*        Extern functions called by other module */
> +/* Extern functions called by other module */
> /*  */
> static u8 EXhalbtcoutsrc_BindBtCoexWithAdapter(void *padapter)
> {
> @@ -900,14 +900,14 @@ void EXhalbtcoutsrc_IpsNotify(struct btc_coexist *pB=
tCoexist, u8 type)
>        ipsType =3D BTC_IPS_ENTER;
>=20
>    /*  All notify is called in cmd thread, don't need to leave low power a=
gain */
> -/*    halbtcoutsrc_LeaveLowPower(pBtCoexist); */
> +    /* halbtcoutsrc_LeaveLowPower(pBtCoexist); */
>=20
>    if (pBtCoexist->boardInfo.btdmAntNum =3D=3D 2)
>        EXhalbtc8723b2ant_IpsNotify(pBtCoexist, ipsType);
>    else if (pBtCoexist->boardInfo.btdmAntNum =3D=3D 1)
>        EXhalbtc8723b1ant_IpsNotify(pBtCoexist, ipsType);
>=20
> -/*    halbtcoutsrc_NormalLowPower(pBtCoexist); */
> +    /* halbtcoutsrc_NormalLowPower(pBtCoexist); */
> }
>=20
> void EXhalbtcoutsrc_LpsNotify(struct btc_coexist *pBtCoexist, u8 type)
> @@ -952,14 +952,14 @@ void EXhalbtcoutsrc_ScanNotify(struct btc_coexist *p=
BtCoexist, u8 type)
>    }
>=20
>    /*  All notify is called in cmd thread, don't need to leave low power a=
gain */
> -/*    halbtcoutsrc_LeaveLowPower(pBtCoexist); */
> +    /* halbtcoutsrc_LeaveLowPower(pBtCoexist); */
>=20
>    if (pBtCoexist->boardInfo.btdmAntNum =3D=3D 2)
>        EXhalbtc8723b2ant_ScanNotify(pBtCoexist, scanType);
>    else if (pBtCoexist->boardInfo.btdmAntNum =3D=3D 1)
>        EXhalbtc8723b1ant_ScanNotify(pBtCoexist, scanType);
>=20
> -/*    halbtcoutsrc_NormalLowPower(pBtCoexist); */
> +    /* halbtcoutsrc_NormalLowPower(pBtCoexist); */
> }
>=20
> void EXhalbtcoutsrc_ConnectNotify(struct btc_coexist *pBtCoexist, u8 actio=
n)
> @@ -978,14 +978,14 @@ void EXhalbtcoutsrc_ConnectNotify(struct btc_coexist=
 *pBtCoexist, u8 action)
>        assoType =3D BTC_ASSOCIATE_FINISH;
>=20
>    /*  All notify is called in cmd thread, don't need to leave low power a=
gain */
> -/*    halbtcoutsrc_LeaveLowPower(pBtCoexist); */
> +    /* halbtcoutsrc_LeaveLowPower(pBtCoexist); */
>=20
>    if (pBtCoexist->boardInfo.btdmAntNum =3D=3D 2)
>        EXhalbtc8723b2ant_ConnectNotify(pBtCoexist, assoType);
>    else if (pBtCoexist->boardInfo.btdmAntNum =3D=3D 1)
>        EXhalbtc8723b1ant_ConnectNotify(pBtCoexist, assoType);
>=20
> -/*    halbtcoutsrc_NormalLowPower(pBtCoexist); */
> +    /* halbtcoutsrc_NormalLowPower(pBtCoexist); */
> }
>=20
> void EXhalbtcoutsrc_MediaStatusNotify(struct btc_coexist *pBtCoexist, enum=

> @@ -1006,14 +1006,14 @@ void EXhalbtcoutsrc_MediaStatusNotify(struct btc_c=
oexist *pBtCoexist, enum
>        mStatus =3D BTC_MEDIA_DISCONNECT;
>=20
>    /*  All notify is called in cmd thread, don't need to leave low power a=
gain */
> -/*    halbtcoutsrc_LeaveLowPower(pBtCoexist); */
> +    /* halbtcoutsrc_LeaveLowPower(pBtCoexist); */
>=20
>    if (pBtCoexist->boardInfo.btdmAntNum =3D=3D 2)
>        EXhalbtc8723b2ant_MediaStatusNotify(pBtCoexist, mStatus);
>    else if (pBtCoexist->boardInfo.btdmAntNum =3D=3D 1)
>        EXhalbtc8723b1ant_MediaStatusNotify(pBtCoexist, mStatus);
>=20
> -/*    halbtcoutsrc_NormalLowPower(pBtCoexist); */
> +    /* halbtcoutsrc_NormalLowPower(pBtCoexist); */
> }
>=20
> void EXhalbtcoutsrc_SpecialPacketNotify(struct btc_coexist *pBtCoexist, u8=
 pktType)
> @@ -1037,14 +1037,14 @@ void EXhalbtcoutsrc_SpecialPacketNotify(struct btc=
_coexist *pBtCoexist, u8 pktTy
>    }
>=20
>    /*  All notify is called in cmd thread, don't need to leave low power a=
gain */
> -/*    halbtcoutsrc_LeaveLowPower(pBtCoexist); */
> +    /* halbtcoutsrc_LeaveLowPower(pBtCoexist); */
>=20
>    if (pBtCoexist->boardInfo.btdmAntNum =3D=3D 2)
>        EXhalbtc8723b2ant_SpecialPacketNotify(pBtCoexist, packetType);
>    else if (pBtCoexist->boardInfo.btdmAntNum =3D=3D 1)
>        EXhalbtc8723b1ant_SpecialPacketNotify(pBtCoexist, packetType);
>=20
> -/*    halbtcoutsrc_NormalLowPower(pBtCoexist); */
> +    /* halbtcoutsrc_NormalLowPower(pBtCoexist); */
> }
>=20
> void EXhalbtcoutsrc_BtInfoNotify(struct btc_coexist *pBtCoexist, u8 *tmpBu=
f, u8 length)
> @@ -1055,14 +1055,14 @@ void EXhalbtcoutsrc_BtInfoNotify(struct btc_coexis=
t *pBtCoexist, u8 *tmpBuf, u8
>    pBtCoexist->statistics.cntBtInfoNotify++;
>=20
>    /*  All notify is called in cmd thread, don't need to leave low power a=
gain */
> -/*    halbtcoutsrc_LeaveLowPower(pBtCoexist); */
> +    /* halbtcoutsrc_LeaveLowPower(pBtCoexist); */
>=20
>    if (pBtCoexist->boardInfo.btdmAntNum =3D=3D 2)
>        EXhalbtc8723b2ant_BtInfoNotify(pBtCoexist, tmpBuf, length);
>    else if (pBtCoexist->boardInfo.btdmAntNum =3D=3D 1)
>        EXhalbtc8723b1ant_BtInfoNotify(pBtCoexist, tmpBuf, length);
>=20
> -/*    halbtcoutsrc_NormalLowPower(pBtCoexist); */
> +    /* halbtcoutsrc_NormalLowPower(pBtCoexist); */
> }
>=20
> void EXhalbtcoutsrc_HaltNotify(struct btc_coexist *pBtCoexist)
> @@ -1102,14 +1102,14 @@ void EXhalbtcoutsrc_Periodical(struct btc_coexist *=
pBtCoexist)
>=20
>    /*  Periodical should be called in cmd thread, */
>    /*  don't need to leave low power again */
> -/*    halbtcoutsrc_LeaveLowPower(pBtCoexist); */
> +    /*  halbtcoutsrc_LeaveLowPower(pBtCoexist); */
>=20
>    if (pBtCoexist->boardInfo.btdmAntNum =3D=3D 2)
>        EXhalbtc8723b2ant_Periodical(pBtCoexist);
>    else if (pBtCoexist->boardInfo.btdmAntNum =3D=3D 1)
>        EXhalbtc8723b1ant_Periodical(pBtCoexist);
>=20
> -/*    halbtcoutsrc_NormalLowPower(pBtCoexist); */
> +    /*  halbtcoutsrc_NormalLowPower(pBtCoexist); */
> }
>=20
> void EXhalbtcoutsrc_SetAntNum(u8 type, u8 antNum)
> --
> 2.43.0
>=20
>=20

