Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 176BA1D5CE5
	for <linux-kernel@vger.kernel.org>; Sat,  5 Apr 2025 10:23:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743848589; cv=none; b=aFltjEpcF5P8HLCWvXwmnolIq4PQuBWiYP3vFgPuy1dCRy0V6SyVzy/Ec9XM/3/bPNrkHxMJoLx8D2jwk0ADvTi3fYHi3dDhrEIa8xhUSSgSmJdWEWMqrVySNqu20APM0/ffftq0wlCIlNsmJDl8cnLqL4a/gOAod7e0megiNts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743848589; c=relaxed/simple;
	bh=LQoXCy3C9VwA5C+genR0+5B8sIyqiFvTBQns0zyEoi8=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=PwgTTpxsDAYRG11LSXQX0nGeoZ8U/QJl8w34y8kBltBBw882dQ5EKyWEECEDdq2wz6Kmp3uLI28tGHXYCecNv6mCZfkDauDo9Bsx5xPgIh6vZoipK6lSeyaXTa72+qW9AxbIDPC++Slo8dfLRBcPOcHdih4VPRUDp4dVUCX5I6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S7st6LgF; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S7st6LgF"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-43d2d952eb1so19329495e9.1
        for <linux-kernel@vger.kernel.org>; Sat, 05 Apr 2025 03:23:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743848585; x=1744453385; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=A6ANVDffKB5a7k3lKDrduC2bc6LE9Y5SzPbxjSFLe6Q=;
        b=S7st6LgFgv9zxYKxdslp2i2GCtJtrFGlvvusVzPfPGb1qGas/6FQljQ9gVhZk/XVku
         7J/ZUDvx9npEZik/HEZcnzgR3aRpzlXqXd/wsjuOas5YjZXpoCAF4qk7hUr8EwN4Zzv7
         eA64v599oO+GYEj3yJYrcoAZdxSqjLqlVQmfMi7S9zsFTMQwKYYK1YYsjOTFoHdXOvvG
         DB1HSRwDCN+c5zZtUWGibQw0C2lTbFq5xKJkuxu576x6coOSh5JjYoAj7fWwLc/0odpD
         ngOHPeWbxy+oTQa9dIs1rpG28lpcrf7NsRHk7lW2KZMqsgdYtZZ/Jq8j2gkhS9k0zowV
         KeAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743848585; x=1744453385;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=A6ANVDffKB5a7k3lKDrduC2bc6LE9Y5SzPbxjSFLe6Q=;
        b=TlKd0PBb/l3ZFM0+rGM61rLw/Eu8F8GSjv6qkTt+wGLuBJS7y4l6fp+yqAKlbo+F6y
         DgT/oC+Muhz+s8sW+fJMeXrOntAU2ZzfwTzJMk5+9DpM65p3LpdMJkScgP7xwA9BMA67
         N0n2IWuHfXhX45hws3XYdKXKBN/8mSYEW9WWIv7bWG9AWbSF0ebMnN79CSNd4FK6MgSJ
         nngV1OkxsZ3MyxDTnJNb00Xz6aqKkajBwOjs1v5PwLPfGhO2bDXSv3zuYoBbsuYIXAF4
         qeCp8uT1knVOAGD0tMG4VTr9RJJN0FKXdq3Am0Mrb98uvmIUAKByIq+5fma0Mvsy84kG
         DSzA==
X-Forwarded-Encrypted: i=1; AJvYcCUuRaOzkdalZDnYu1ctxalOR4RbBsTHolpKlHTS6fBVLeULx/otiQg8r8MVCDwZYUDfz/rhgA8lTKhWAJE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwDKYyJd9+UwdtdXnhxyGptj0U/8qpVPP/oayeZZzz4xF2AqlJB
	zx6S9ZkbxENOPacAisusRTKMhjbmfTISFGF7mnGDiYsACjZgEZypdzqSp1LCB4g=
X-Gm-Gg: ASbGncs8GrJa7KIjNIfNjYOGN7W1POJJtC2jJMRCd6deLA9O02IqMCLQ40UpRGHAx05
	Nqq1Lq6bj2bxlCAq86e4zNZjn6C4eDs64ucewyGz4YlMhnSIy5rTirdmKfxzOwYyN1NZhSPCr2F
	71NakDjkC7Nn1T3xSmn0ytoLmChBffL8t74jPM2QF6nlTpHs2OaHyT1giS2Ja4ALeI+S6KAEkHS
	PCauSKuPKrzOYP2FJe6GwZeMCjcgGjCbNVAvdmJ9eLWVKoDpLRjNMeyerRUQUQB/N/UXpZHVLj+
	rT2UMkTLs1QkKsDkN6YpYGQA4ASZeofMPuuB7WhlSQURCPg1Bb2kXmni8w==
X-Google-Smtp-Source: AGHT+IEO0Sds6ItyeDHQ2iDiF6t7SSEaooMlQzpgflWir5VsESYPRL3cZo4+3dEO/+t0ESRXYi6mgQ==
X-Received: by 2002:a05:600c:19cc:b0:43d:300f:fa51 with SMTP id 5b1f17b1804b1-43ee06605f9mr20644195e9.9.1743848585027;
        Sat, 05 Apr 2025 03:23:05 -0700 (PDT)
Received: from [192.168.43.251] ([197.232.62.173])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c301a79bfsm6672262f8f.36.2025.04.05.03.22.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Apr 2025 03:23:04 -0700 (PDT)
Message-ID: <c5e0fd619a04ee2f890735927aaf10a2e213f4bd.camel@gmail.com>
Subject: Re: [PATCH 1/2] staging: rtl8723bs: Optimize variable
 initialization in rtl8723b_hal_init.c
From: Erick Karanja <karanja99erick@gmail.com>
To: Julia Lawall <julia.lawall@inria.fr>
Cc: gregkh@linuxfoundation.org, outreachy@lists.linux.dev, 
	philipp.g.hortmann@gmail.com, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Date: Sat, 05 Apr 2025 13:22:51 +0300
In-Reply-To: <ee285a5a-ff49-5b87-1f29-48b68115b7d7@inria.fr>
References: <cover.1743820815.git.karanja99erick@gmail.com>
	 <f7b63d834b98aedfe2ce277d8008d7e398ea29ba.1743820815.git.karanja99erick@gmail.com>
	 <ee285a5a-ff49-5b87-1f29-48b68115b7d7@inria.fr>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Sat, 2025-04-05 at 04:45 -0400, Julia Lawall wrote:
>=20
>=20
> On Sat, 5 Apr 2025, Erick Karanja wrote:
>=20
> > Optimize variable initialization by integrating the initialization
>=20
> I would not use the work "optimize" for this.=C2=A0 "Optimize" generally
> means
> run faster, or use less resources.=C2=A0 Here you are just making the cod=
e
> more
> concise.=C2=A0 There shouldn't be any significant changes in the generate=
d
> code.
>=20
> The goal is to make the code more readable, by moving trivial
> initializations up with the declarations instead of wasting a line on
> that.=C2=A0 Since "trivial initialization" may be an opinion, the semanti=
c
> patch is not very constrained about what the initialization is.=C2=A0 But
> this
> means that the user has to use some judgement about this.=C2=A0 Many
> results
> may be unsuitable.
Hello Julia. I agree that a change in the wording is necessary. When
working on this patch I excluded spatch suggestions that would affect
the code readability and make debugging difficult. I believe I should
further inspect this scenarios as suggested.
Thank you.
>=20
> julia
>=20
> > directly into the variable declaration in cases where the
> > initialization
> > is simple and doesn't depend on other variables or complex
> > expressions.
> > This makes the code more concise and readable.
> >=20
> > Signed-off-by: Erick Karanja <karanja99erick@gmail.com>
> > ---
> > =C2=A0.../staging/rtl8723bs/hal/rtl8723b_hal_init.c | 155 +++++--------=
-
> > ----
> > =C2=A01 file changed, 41 insertions(+), 114 deletions(-)
> >=20
> > diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
> > b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
> > index e15ec6452fd0..1e980b291e90 100644
> > --- a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
> > +++ b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
> > @@ -152,13 +152,12 @@ static int _WriteFW(struct adapter *padapter,
> > void *buffer, u32 size)
> > =C2=A0void _8051Reset8723(struct adapter *padapter)
> > =C2=A0{
> > =C2=A0	u8 cpu_rst;
> > -	u8 io_rst;
> > +	u8 io_rst =3D rtw_read8(padapter, REG_RSV_CTRL + 1);
> >=20
> >=20
> > =C2=A0	/*=C2=A0 Reset 8051(WLMCU) IO wrapper */
> > =C2=A0	/*=C2=A0 0x1c[8] =3D 0 */
> > =C2=A0	/*=C2=A0 Suggested by Isaac@SD1 and Gimmy@SD1, coding by
> > Lucas@20130624 */
> > -	io_rst =3D rtw_read8(padapter, REG_RSV_CTRL+1);
> > =C2=A0	io_rst &=3D ~BIT(0);
> > =C2=A0	rtw_write8(padapter, REG_RSV_CTRL+1, io_rst);
> >=20
> > @@ -218,11 +217,10 @@ u8 g_fwdl_wintint_rdy_fail;
> > =C2=A0static s32 _FWFreeToGo(struct adapter *adapter, u32 min_cnt, u32
> > timeout_ms)
> > =C2=A0{
> > =C2=A0	s32 ret =3D _FAIL;
> > -	u32 value32;
> > +	u32 value32 =3D rtw_read32(adapter, REG_MCUFWDL);
> > =C2=A0	unsigned long start =3D jiffies;
> > =C2=A0	u32 cnt =3D 0;
> >=20
> > -	value32 =3D rtw_read32(adapter, REG_MCUFWDL);
> > =C2=A0	value32 |=3D MCUFWDL_RDY;
> > =C2=A0	value32 &=3D ~WINTINI_RDY;
> > =C2=A0	rtw_write32(adapter, REG_MCUFWDL, value32);
> > @@ -501,8 +499,7 @@ void Hal_GetEfuseDefinition(
> > =C2=A0	switch (type) {
> > =C2=A0	case TYPE_EFUSE_MAX_SECTION:
> > =C2=A0		{
> > -			u8 *pMax_section;
> > -			pMax_section =3D pOut;
> > +			u8 *pMax_section =3D pOut;
> >=20
> > =C2=A0			if (efuseType =3D=3D EFUSE_WIFI)
> > =C2=A0				*pMax_section =3D
> > EFUSE_MAX_SECTION_8723B;
> > @@ -513,8 +510,7 @@ void Hal_GetEfuseDefinition(
> >=20
> > =C2=A0	case TYPE_EFUSE_REAL_CONTENT_LEN:
> > =C2=A0		{
> > -			u16 *pu2Tmp;
> > -			pu2Tmp =3D pOut;
> > +			u16 *pu2Tmp =3D pOut;
> >=20
> > =C2=A0			if (efuseType =3D=3D EFUSE_WIFI)
> > =C2=A0				*pu2Tmp =3D
> > EFUSE_REAL_CONTENT_LEN_8723B;
> > @@ -525,8 +521,7 @@ void Hal_GetEfuseDefinition(
> >=20
> > =C2=A0	case TYPE_AVAILABLE_EFUSE_BYTES_BANK:
> > =C2=A0		{
> > -			u16 *pu2Tmp;
> > -			pu2Tmp =3D pOut;
> > +			u16 *pu2Tmp =3D pOut;
> >=20
> > =C2=A0			if (efuseType =3D=3D EFUSE_WIFI)
> > =C2=A0				*pu2Tmp =3D
> > (EFUSE_REAL_CONTENT_LEN_8723B-EFUSE_OOB_PROTECT_BYTES);
> > @@ -537,8 +532,7 @@ void Hal_GetEfuseDefinition(
> >=20
> > =C2=A0	case TYPE_AVAILABLE_EFUSE_BYTES_TOTAL:
> > =C2=A0		{
> > -			u16 *pu2Tmp;
> > -			pu2Tmp =3D pOut;
> > +			u16 *pu2Tmp =3D pOut;
> >=20
> > =C2=A0			if (efuseType =3D=3D EFUSE_WIFI)
> > =C2=A0				*pu2Tmp =3D
> > (EFUSE_REAL_CONTENT_LEN_8723B-EFUSE_OOB_PROTECT_BYTES);
> > @@ -549,8 +543,7 @@ void Hal_GetEfuseDefinition(
> >=20
> > =C2=A0	case TYPE_EFUSE_MAP_LEN:
> > =C2=A0		{
> > -			u16 *pu2Tmp;
> > -			pu2Tmp =3D pOut;
> > +			u16 *pu2Tmp =3D pOut;
> >=20
> > =C2=A0			if (efuseType =3D=3D EFUSE_WIFI)
> > =C2=A0				*pu2Tmp =3D EFUSE_MAX_MAP_LEN;
> > @@ -561,8 +554,7 @@ void Hal_GetEfuseDefinition(
> >=20
> > =C2=A0	case TYPE_EFUSE_PROTECT_BYTES_BANK:
> > =C2=A0		{
> > -			u8 *pu1Tmp;
> > -			pu1Tmp =3D pOut;
> > +			u8 *pu1Tmp =3D pOut;
> >=20
> > =C2=A0			if (efuseType =3D=3D EFUSE_WIFI)
> > =C2=A0				*pu1Tmp =3D EFUSE_OOB_PROTECT_BYTES;
> > @@ -573,8 +565,7 @@ void Hal_GetEfuseDefinition(
> >=20
> > =C2=A0	case TYPE_EFUSE_CONTENT_LEN_BANK:
> > =C2=A0		{
> > -			u16 *pu2Tmp;
> > -			pu2Tmp =3D pOut;
> > +			u16 *pu2Tmp =3D pOut;
> >=20
> > =C2=A0			if (efuseType =3D=3D EFUSE_WIFI)
> > =C2=A0				*pu2Tmp =3D
> > EFUSE_REAL_CONTENT_LEN_8723B;
> > @@ -585,8 +576,7 @@ void Hal_GetEfuseDefinition(
> >=20
> > =C2=A0	default:
> > =C2=A0		{
> > -			u8 *pu1Tmp;
> > -			pu1Tmp =3D pOut;
> > +			u8 *pu1Tmp =3D pOut;
> > =C2=A0			*pu1Tmp =3D 0;
> > =C2=A0		}
> > =C2=A0		break;
> > @@ -729,10 +719,9 @@ static void hal_ReadEFuse_WiFi(
> > =C2=A0		}
> >=20
> > =C2=A0		if (offset < EFUSE_MAX_SECTION_8723B) {
> > -			u16 addr;
> > +			u16 addr =3D offset * PGPKT_DATA_SIZE;
> > =C2=A0			/*=C2=A0 Get word enable value from PG header
> > */
> >=20
> > -			addr =3D offset * PGPKT_DATA_SIZE;
> > =C2=A0			for (i =3D 0; i < EFUSE_MAX_WORD_UNIT; i++)
> > {
> > =C2=A0				/*=C2=A0 Check word enable condition in
> > the section */
> > =C2=A0				if (!(wden & (0x01<<i))) {
> > @@ -835,9 +824,8 @@ static void hal_ReadEFuse_BT(
> > =C2=A0			}
> >=20
> > =C2=A0			if (offset < EFUSE_BT_MAX_SECTION) {
> > -				u16 addr;
> > +				u16 addr =3D offset *
> > PGPKT_DATA_SIZE;
> >=20
> > -				addr =3D offset * PGPKT_DATA_SIZE;
> > =C2=A0				for (i =3D 0; i <
> > EFUSE_MAX_WORD_UNIT; i++) {
> > =C2=A0					/*=C2=A0 Check word enable
> > condition in the section */
> > =C2=A0					if (!(wden & (0x01<<i))) {
> > @@ -1153,14 +1141,10 @@ static u8 Hal_EfuseWordEnableDataWrite(
> >=20
> > =C2=A0static struct hal_version ReadChipVersion8723B(struct adapter
> > *padapter)
> > =C2=A0{
> > -	u32 value32;
> > +	u32 value32 =3D rtw_read32(padapter, REG_SYS_CFG);
> > =C2=A0	struct hal_version ChipVersion;
> > -	struct hal_com_data *pHalData;
> > -
> > -/* YJ, TODO, move read chip type here */
> > -	pHalData =3D GET_HAL_DATA(padapter);
> > +	struct hal_com_data *pHalData =3D GET_HAL_DATA(padapter);
> >=20
> > -	value32 =3D rtw_read32(padapter, REG_SYS_CFG);
> > =C2=A0	ChipVersion.ICType =3D CHIP_8723B;
> > =C2=A0	ChipVersion.ChipType =3D ((value32 & RTL_ID) ? TEST_CHIP :
> > NORMAL_CHIP);
> > =C2=A0	ChipVersion.VendorType =3D ((value32 & VENDOR_ID) ?
> > CHIP_VENDOR_UMC : CHIP_VENDOR_TSMC);
> > @@ -1196,10 +1180,9 @@ void rtl8723b_InitBeaconParameters(struct
> > adapter *padapter)
> > =C2=A0{
> > =C2=A0	struct hal_com_data *pHalData =3D GET_HAL_DATA(padapter);
> > =C2=A0	u16 val16;
> > -	u8 val8;
> > +	u8 val8 =3D DIS_TSF_UDT;
> >=20
> >=20
> > -	val8 =3D DIS_TSF_UDT;
> > =C2=A0	val16 =3D val8 | (val8 << 8); /*=C2=A0 port0 and port1 */
> >=20
> > =C2=A0	/*=C2=A0 Enable prot0 beacon function for PSTDMA */
> > @@ -1287,22 +1270,7 @@ void
> > rtl8723b_SetBeaconRelatedRegisters(struct adapter *padapter)
> > =C2=A0	u32 value32;
> > =C2=A0	struct mlme_ext_priv *pmlmeext =3D &padapter->mlmeextpriv;
> > =C2=A0	struct mlme_ext_info *pmlmeinfo =3D &pmlmeext->mlmext_info;
> > -	u32 bcn_ctrl_reg;
> > -
> > -	/* reset TSF, enable update TSF, correcting TSF On Beacon
> > */
> > -
> > -	/* REG_BCN_INTERVAL */
> > -	/* REG_BCNDMATIM */
> > -	/* REG_ATIMWND */
> > -	/* REG_TBTT_PROHIBIT */
> > -	/* REG_DRVERLYINT */
> > -	/* REG_BCN_MAX_ERR */
> > -	/* REG_BCNTCFG (0x510) */
> > -	/* REG_DUAL_TSF_RST */
> > -	/* REG_BCN_CTRL (0x550) */
> > -
> > -
> > -	bcn_ctrl_reg =3D REG_BCN_CTRL;
> > +	u32 bcn_ctrl_reg =3D REG_BCN_CTRL;
> >=20
> > =C2=A0	/*=C2=A0 */
> > =C2=A0	/*=C2=A0 ATIM window */
> > @@ -1416,9 +1384,7 @@ void rtl8723b_set_hal_ops(struct hal_ops
> > *pHalFunc)
> >=20
> > =C2=A0void rtl8723b_InitAntenna_Selection(struct adapter *padapter)
> > =C2=A0{
> > -	u8 val;
> > -
> > -	val =3D rtw_read8(padapter, REG_LEDCFG2);
> > +	u8 val =3D rtw_read8(padapter, REG_LEDCFG2);
> > =C2=A0	/*=C2=A0 Let 8051 take control antenna setting */
> > =C2=A0	val |=3D BIT(7); /*=C2=A0 DPDT_SEL_EN, 0x4C[23] */
> > =C2=A0	rtw_write8(padapter, REG_LEDCFG2, val);
> > @@ -1426,14 +1392,10 @@ void rtl8723b_InitAntenna_Selection(struct
> > adapter *padapter)
> >=20
> > =C2=A0void rtl8723b_init_default_value(struct adapter *padapter)
> > =C2=A0{
> > -	struct hal_com_data *pHalData;
> > -	struct dm_priv *pdmpriv;
> > +	struct hal_com_data *pHalData =3D GET_HAL_DATA(padapter);
> > +	struct dm_priv *pdmpriv =3D &pHalData->dmpriv;
> > =C2=A0	u8 i;
> >=20
> > -
> > -	pHalData =3D GET_HAL_DATA(padapter);
> > -	pdmpriv =3D &pHalData->dmpriv;
> > -
> > =C2=A0	padapter->registrypriv.wireless_mode =3D WIRELESS_11BG_24N;
> >=20
> > =C2=A0	/*=C2=A0 init default value */
> > @@ -1478,9 +1440,7 @@ void rtl8723b_init_default_value(struct
> > adapter *padapter)
> > =C2=A0u8 GetEEPROMSize8723B(struct adapter *padapter)
> > =C2=A0{
> > =C2=A0	u8 size =3D 0;
> > -	u32 cr;
> > -
> > -	cr =3D rtw_read16(padapter, REG_9346CR);
> > +	u32 cr =3D rtw_read16(padapter, REG_9346CR);
> > =C2=A0	/*=C2=A0 6: EEPROM used is 93C46, 4: boot from E-Fuse. */
> > =C2=A0	size =3D (cr & BOOT_FROM_EEPROM) ? 6 : 4;
> >=20
> > @@ -1495,13 +1455,9 @@ u8 GetEEPROMSize8723B(struct adapter
> > *padapter)
> > =C2=A0s32 rtl8723b_InitLLTTable(struct adapter *padapter)
> > =C2=A0{
> > =C2=A0	unsigned long start, passing_time;
> > -	u32 val32;
> > -	s32 ret;
> > -
> > -
> > -	ret =3D _FAIL;
> > +	u32 val32 =3D rtw_read32(padapter, REG_AUTO_LLT);
> > +	s32 ret =3D _FAIL;
> >=20
> > -	val32 =3D rtw_read32(padapter, REG_AUTO_LLT);
> > =C2=A0	val32 |=3D BIT_AUTO_INIT_LLT;
> > =C2=A0	rtw_write32(padapter, REG_AUTO_LLT, val32);
> >=20
> > @@ -1559,11 +1515,10 @@ void Hal_EfuseParseIDCode(struct adapter
> > *padapter, u8 *hwinfo)
> > =C2=A0{
> > =C2=A0	struct eeprom_priv *pEEPROM =3D
> > GET_EEPROM_EFUSE_PRIV(padapter);
> > =C2=A0/*=C2=A0	struct hal_com_data	*pHalData =3D
> > GET_HAL_DATA(padapter); */
> > -	u16 EEPROMId;
> > +	u16 EEPROMId =3D le16_to_cpu(*((__le16 *)hwinfo));
> >=20
> >=20
> > =C2=A0	/*=C2=A0 Check 0x8129 again for making sure autoload status!!
> > */
> > -	EEPROMId =3D le16_to_cpu(*((__le16 *)hwinfo));
> > =C2=A0	if (EEPROMId !=3D RTL_EEPROM_ID) {
> > =C2=A0		pEEPROM->bautoload_fail_flag =3D true;
> > =C2=A0	} else
> > @@ -2273,9 +2228,8 @@ void rtl8723b_fill_fake_txdesc(
> > =C2=A0	/*=C2=A0 Encrypt the data frame if under security mode excepct
> > null data. Suggested by CCW. */
> > =C2=A0	/*=C2=A0 */
> > =C2=A0	if (bDataFrame) {
> > -		u32 EncAlg;
> > +		u32 EncAlg =3D padapter-
> > >securitypriv.dot11PrivacyAlgrthm;
> >=20
> > -		EncAlg =3D padapter-
> > >securitypriv.dot11PrivacyAlgrthm;
> > =C2=A0		switch (EncAlg) {
> > =C2=A0		case _NO_PRIVACY_:
> > =C2=A0			SET_TX_DESC_SEC_TYPE_8723B(pDesc, 0x0);
> > @@ -2378,9 +2332,7 @@ static void hw_var_set_opmode(struct adapter
> > *padapter, u8 variable, u8 *val)
> > =C2=A0static void hw_var_set_macaddr(struct adapter *padapter, u8
> > variable, u8 *val)
> > =C2=A0{
> > =C2=A0	u8 idx =3D 0;
> > -	u32 reg_macid;
> > -
> > -	reg_macid =3D REG_MACID;
> > +	u32 reg_macid =3D REG_MACID;
> >=20
> > =C2=A0	for (idx =3D 0 ; idx < 6; idx++)
> > =C2=A0		rtw_write8(GET_PRIMARY_ADAPTER(padapter),
> > (reg_macid+idx), val[idx]);
> > @@ -2389,9 +2341,7 @@ static void hw_var_set_macaddr(struct adapter
> > *padapter, u8 variable, u8 *val)
> > =C2=A0static void hw_var_set_bssid(struct adapter *padapter, u8
> > variable, u8 *val)
> > =C2=A0{
> > =C2=A0	u8 idx =3D 0;
> > -	u32 reg_bssid;
> > -
> > -	reg_bssid =3D REG_BSSID;
> > +	u32 reg_bssid =3D REG_BSSID;
> >=20
> > =C2=A0	for (idx =3D 0 ; idx < 6; idx++)
> > =C2=A0		rtw_write8(padapter, (reg_bssid+idx), val[idx]);
> > @@ -2399,15 +2349,12 @@ static void hw_var_set_bssid(struct adapter
> > *padapter, u8 variable, u8 *val)
> >=20
> > =C2=A0static void hw_var_set_bcn_func(struct adapter *padapter, u8
> > variable, u8 *val)
> > =C2=A0{
> > -	u32 bcn_ctrl_reg;
> > -
> > -	bcn_ctrl_reg =3D REG_BCN_CTRL;
> > +	u32 bcn_ctrl_reg =3D REG_BCN_CTRL;
> >=20
> > =C2=A0	if (*(u8 *)val)
> > =C2=A0		rtw_write8(padapter, bcn_ctrl_reg,
> > (EN_BCN_FUNCTION | EN_TXBCN_RPT));
> > =C2=A0	else {
> > -		u8 val8;
> > -		val8 =3D rtw_read8(padapter, bcn_ctrl_reg);
> > +		u8 val8 =3D rtw_read8(padapter, bcn_ctrl_reg);
> > =C2=A0		val8 &=3D ~(EN_BCN_FUNCTION | EN_TXBCN_RPT);
> >=20
> > =C2=A0		/*=C2=A0 Always enable port0 beacon function for PSTDMA
> > */
> > @@ -2422,12 +2369,8 @@ static void hw_var_set_correct_tsf(struct
> > adapter *padapter, u8 variable, u8 *va
> > =C2=A0{
> > =C2=A0	u8 val8;
> > =C2=A0	u64 tsf;
> > -	struct mlme_ext_priv *pmlmeext;
> > -	struct mlme_ext_info *pmlmeinfo;
> > -
> > -
> > -	pmlmeext =3D &padapter->mlmeextpriv;
> > -	pmlmeinfo =3D &pmlmeext->mlmext_info;
> > +	struct mlme_ext_priv *pmlmeext =3D &padapter->mlmeextpriv;
> > +	struct mlme_ext_info *pmlmeinfo =3D &pmlmeext->mlmext_info;
> >=20
> > =C2=A0	tsf =3D pmlmeext->TSFValue-do_div(pmlmeext->TSFValue,
> > (pmlmeinfo->bcn_interval*1024))-1024; /* us */
> >=20
> > @@ -2479,17 +2422,11 @@ static void
> > hw_var_set_mlme_disconnect(struct adapter *padapter, u8 variable,
> > u8
> >=20
> > =C2=A0static void hw_var_set_mlme_sitesurvey(struct adapter *padapter,
> > u8 variable, u8 *val)
> > =C2=A0{
> > -	u32 value_rcr, rcr_clear_bit, reg_bcn_ctl;
> > +	u32 value_rcr, rcr_clear_bit, reg_bcn_ctl =3D REG_BCN_CTRL;
> > =C2=A0	u16 value_rxfltmap2;
> > =C2=A0	u8 val8;
> > -	struct hal_com_data *pHalData;
> > -	struct mlme_priv *pmlmepriv;
> > -
> > -
> > -	pHalData =3D GET_HAL_DATA(padapter);
> > -	pmlmepriv =3D &padapter->mlmepriv;
> > -
> > -	reg_bcn_ctl =3D REG_BCN_CTRL;
> > +	struct hal_com_data *pHalData =3D GET_HAL_DATA(padapter);
> > +	struct mlme_priv *pmlmepriv =3D &padapter->mlmepriv;
> >=20
> > =C2=A0	rcr_clear_bit =3D RCR_CBSSID_BCN;
> >=20
> > @@ -2543,15 +2480,12 @@ static void hw_var_set_mlme_join(struct
> > adapter *padapter, u8 variable, u8 *val)
> > =C2=A0	u8 val8;
> > =C2=A0	u16 val16;
> > =C2=A0	u32 val32;
> > -	u8 RetryLimit;
> > -	u8 type;
> > -	struct mlme_priv *pmlmepriv;
> > +	u8 RetryLimit =3D 0x30;
> > +	u8 type =3D *(u8 *)val;
> > +	struct mlme_priv *pmlmepriv =3D &padapter->mlmepriv;
> > =C2=A0	struct eeprom_priv *pEEPROM;
> >=20
> >=20
> > -	RetryLimit =3D 0x30;
> > -	type =3D *(u8 *)val;
> > -	pmlmepriv =3D &padapter->mlmepriv;
> > =C2=A0	pEEPROM =3D GET_EEPROM_EFUSE_PRIV(padapter);
> >=20
> > =C2=A0	if (type =3D=3D 0) { /*=C2=A0 prepare to join */
> > @@ -2779,8 +2713,7 @@ void SetHwReg8723B(struct adapter *padapter,
> > u8 variable, u8 *val)
> >=20
> > =C2=A0	case HW_VAR_CHECK_BSSID:
> > =C2=A0		{
> > -			u32 val32;
> > -			val32 =3D rtw_read32(padapter, REG_RCR);
> > +			u32 val32 =3D rtw_read32(padapter, REG_RCR);
> > =C2=A0			if (*val)
> > =C2=A0				val32 |=3D
> > RCR_CBSSID_DATA|RCR_CBSSID_BCN;
> > =C2=A0			else
> > @@ -2850,12 +2783,11 @@ void SetHwReg8723B(struct adapter
> > *padapter, u8 variable, u8 *val)
> >=20
> > =C2=A0	case HW_VAR_ACK_PREAMBLE:
> > =C2=A0		{
> > -			u8 regTmp;
> > +			u8 regTmp =3D 0;
> > =C2=A0			u8 bShortPreamble =3D *val;
> >=20
> > =C2=A0			/*=C2=A0 Joseph marked out for Netgear 3500
> > TKIP channel 7 issue.(Temporarily) */
> > =C2=A0			/* regTmp =3D (pHalData-
> > >nCur40MhzPrimeSC)<<5; */
> > -			regTmp =3D 0;
> > =C2=A0			if (bShortPreamble)
> > =C2=A0				regTmp |=3D 0x80;
> > =C2=A0			rtw_write8(padapter, REG_RRSR+2, regTmp);
> > @@ -3226,9 +3158,7 @@ void GetHwReg8723B(struct adapter *padapter,
> > u8 variable, u8 *val)
> > =C2=A0 */
> > =C2=A0u8 SetHalDefVar8723B(struct adapter *padapter, enum
> > hal_def_variable variable, void *pval)
> > =C2=A0{
> > -	u8 bResult;
> > -
> > -	bResult =3D _SUCCESS;
> > +	u8 bResult =3D _SUCCESS;
> >=20
> > =C2=A0	switch (variable) {
> > =C2=A0	default:
> > @@ -3244,9 +3174,7 @@ u8 SetHalDefVar8723B(struct adapter
> > *padapter, enum hal_def_variable variable, v
> > =C2=A0 */
> > =C2=A0u8 GetHalDefVar8723B(struct adapter *padapter, enum
> > hal_def_variable variable, void *pval)
> > =C2=A0{
> > -	u8 bResult;
> > -
> > -	bResult =3D _SUCCESS;
> > +	u8 bResult =3D _SUCCESS;
> >=20
> > =C2=A0	switch (variable) {
> > =C2=A0	case HAL_DEF_MAX_RECVBUF_SZ:
> > @@ -3281,9 +3209,8 @@ u8 GetHalDefVar8723B(struct adapter
> > *padapter, enum hal_def_variable variable, v
> > =C2=A0	case HW_DEF_RA_INFO_DUMP:
> > =C2=A0		{
> > =C2=A0			u8 mac_id =3D *(u8 *)pval;
> > -			u32 cmd;
> > +			u32 cmd =3D 0x40000100 | mac_id;
> >=20
> > -			cmd =3D 0x40000100 | mac_id;
> > =C2=A0			rtw_write32(padapter,
> > REG_HMEBOX_DBG_2_8723B, cmd);
> > =C2=A0			msleep(10);
> > =C2=A0			rtw_read32(padapter, 0x2F0);	// info 1
> > --
> > 2.43.0
> >=20
> >=20
> >=20

