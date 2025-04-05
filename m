Received: from mail2-relais-roc.national.inria.fr (mail2-relais-roc.national.inria.fr [192.134.164.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 046CA182BC
	for <linux-kernel@vger.kernel.org>; Sat,  5 Apr 2025 10:27:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.134.164.83
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743848841; cv=none; b=Ihn66+dH/T0Y8IDtu/ppibJ/BEnukLhOSp9KnYV/tAWSCYfSEVOny4wH2qzTJoc4ZOebLhkSYoLR7Rx4RMxCduPzzzLwuk8GZMzUCeIzLAhOB0txuV6QNN2Lt0iMZehMzzAK4KqogWDq3QCkI09cejPPV5Mq44ehIe89VtuMFPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743848841; c=relaxed/simple;
	bh=aQWO0wqCOttP53VNG9q2bPz85ydeXhzdLYYdm/7A9II=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=R5mW/8YmJr2jgFewNjGTSptPUYilvegZVcKe1ow3fIXgaGD5izWXuJcu5O4rIclfkPcdCeBwJp1ssmVHHEF5YNeBF389dTDVWskGEEEHbv5xH85uieF11XeswSwoupG+DoNVzAxqID20W+4NsR7uMjbj2IQrNcvFJ1AV90UlWrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr; spf=pass smtp.mailfrom=inria.fr; dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b=taz3uhH1; arc=none smtp.client-ip=192.134.164.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inria.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b="taz3uhH1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=FL52wYnV3dZXzwLUbZdJ2gZxK2zVacPTq9bGDC3b3ig=;
  b=taz3uhH1YDfo8JILYaWL263AJkk0+i2UiRF5nNklsebhW9WyVybrm+BA
   JV/O2sTgZlRFDbz0WvxsuGesalK7nTNtjZibkE77VLqBtAyol/H1DpmsN
   AYr9tghX23zW4AS2Y8rfR7+Z3pI6WJGrvHOR2ZC2GgcU1yim7GNWUdkfd
   A=;
Authentication-Results: mail2-relais-roc.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.15,191,1739833200"; 
   d="scan'208";a="216493513"
Received: from unknown (HELO hadrien) ([50.225.219.62])
  by mail2-relais-roc.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Apr 2025 12:27:15 +0200
Date: Sat, 5 Apr 2025 06:27:13 -0400 (EDT)
From: Julia Lawall <julia.lawall@inria.fr>
To: Erick Karanja <karanja99erick@gmail.com>
cc: gregkh@linuxfoundation.org, outreachy@lists.linux.dev, 
    philipp.g.hortmann@gmail.com, linux-staging@lists.linux.dev, 
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] staging: rtl8723bs: Optimize variable initialization
 in rtl8723b_hal_init.c
In-Reply-To: <c5e0fd619a04ee2f890735927aaf10a2e213f4bd.camel@gmail.com>
Message-ID: <2f1e13fe-887c-4178-8a9c-2227e042ce26@inria.fr>
References: <cover.1743820815.git.karanja99erick@gmail.com>  <f7b63d834b98aedfe2ce277d8008d7e398ea29ba.1743820815.git.karanja99erick@gmail.com>  <ee285a5a-ff49-5b87-1f29-48b68115b7d7@inria.fr> <c5e0fd619a04ee2f890735927aaf10a2e213f4bd.camel@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-595273396-1743848835=:3184"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-595273396-1743848835=:3184
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT



On Sat, 5 Apr 2025, Erick Karanja wrote:

> On Sat, 2025-04-05 at 04:45 -0400, Julia Lawall wrote:
> >
> >
> > On Sat, 5 Apr 2025, Erick Karanja wrote:
> >
> > > Optimize variable initialization by integrating the initialization
> >
> > I would not use the work "optimize" for this.  "Optimize" generally
> > means
> > run faster, or use less resources.  Here you are just making the code
> > more
> > concise.  There shouldn't be any significant changes in the generated
> > code.
> >
> > The goal is to make the code more readable, by moving trivial
> > initializations up with the declarations instead of wasting a line on
> > that.  Since "trivial initialization" may be an opinion, the semantic
> > patch is not very constrained about what the initialization is.  But
> > this
> > means that the user has to use some judgement about this.  Many
> > results
> > may be unsuitable.
> Hello Julia. I agree that a change in the wording is necessary. When
> working on this patch I excluded spatch suggestions that would affect
> the code readability and make debugging difficult. I believe I should
> further inspect this scenarios as suggested.

It takes some time to get a feeling for what others may find readable.
That's the whole point of the application period.

julia

> Thank you.
> >
> > julia
> >
> > > directly into the variable declaration in cases where the
> > > initialization
> > > is simple and doesn't depend on other variables or complex
> > > expressions.
> > > This makes the code more concise and readable.
> > >
> > > Signed-off-by: Erick Karanja <karanja99erick@gmail.com>
> > > ---
> > >  .../staging/rtl8723bs/hal/rtl8723b_hal_init.c | 155 +++++---------
> > > ----
> > >  1 file changed, 41 insertions(+), 114 deletions(-)
> > >
> > > diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
> > > b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
> > > index e15ec6452fd0..1e980b291e90 100644
> > > --- a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
> > > +++ b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
> > > @@ -152,13 +152,12 @@ static int _WriteFW(struct adapter *padapter,
> > > void *buffer, u32 size)
> > >  void _8051Reset8723(struct adapter *padapter)
> > >  {
> > >  	u8 cpu_rst;
> > > -	u8 io_rst;
> > > +	u8 io_rst = rtw_read8(padapter, REG_RSV_CTRL + 1);
> > >
> > >
> > >  	/*  Reset 8051(WLMCU) IO wrapper */
> > >  	/*  0x1c[8] = 0 */
> > >  	/*  Suggested by Isaac@SD1 and Gimmy@SD1, coding by
> > > Lucas@20130624 */
> > > -	io_rst = rtw_read8(padapter, REG_RSV_CTRL+1);
> > >  	io_rst &= ~BIT(0);
> > >  	rtw_write8(padapter, REG_RSV_CTRL+1, io_rst);
> > >
> > > @@ -218,11 +217,10 @@ u8 g_fwdl_wintint_rdy_fail;
> > >  static s32 _FWFreeToGo(struct adapter *adapter, u32 min_cnt, u32
> > > timeout_ms)
> > >  {
> > >  	s32 ret = _FAIL;
> > > -	u32 value32;
> > > +	u32 value32 = rtw_read32(adapter, REG_MCUFWDL);
> > >  	unsigned long start = jiffies;
> > >  	u32 cnt = 0;
> > >
> > > -	value32 = rtw_read32(adapter, REG_MCUFWDL);
> > >  	value32 |= MCUFWDL_RDY;
> > >  	value32 &= ~WINTINI_RDY;
> > >  	rtw_write32(adapter, REG_MCUFWDL, value32);
> > > @@ -501,8 +499,7 @@ void Hal_GetEfuseDefinition(
> > >  	switch (type) {
> > >  	case TYPE_EFUSE_MAX_SECTION:
> > >  		{
> > > -			u8 *pMax_section;
> > > -			pMax_section = pOut;
> > > +			u8 *pMax_section = pOut;
> > >
> > >  			if (efuseType == EFUSE_WIFI)
> > >  				*pMax_section =
> > > EFUSE_MAX_SECTION_8723B;
> > > @@ -513,8 +510,7 @@ void Hal_GetEfuseDefinition(
> > >
> > >  	case TYPE_EFUSE_REAL_CONTENT_LEN:
> > >  		{
> > > -			u16 *pu2Tmp;
> > > -			pu2Tmp = pOut;
> > > +			u16 *pu2Tmp = pOut;
> > >
> > >  			if (efuseType == EFUSE_WIFI)
> > >  				*pu2Tmp =
> > > EFUSE_REAL_CONTENT_LEN_8723B;
> > > @@ -525,8 +521,7 @@ void Hal_GetEfuseDefinition(
> > >
> > >  	case TYPE_AVAILABLE_EFUSE_BYTES_BANK:
> > >  		{
> > > -			u16 *pu2Tmp;
> > > -			pu2Tmp = pOut;
> > > +			u16 *pu2Tmp = pOut;
> > >
> > >  			if (efuseType == EFUSE_WIFI)
> > >  				*pu2Tmp =
> > > (EFUSE_REAL_CONTENT_LEN_8723B-EFUSE_OOB_PROTECT_BYTES);
> > > @@ -537,8 +532,7 @@ void Hal_GetEfuseDefinition(
> > >
> > >  	case TYPE_AVAILABLE_EFUSE_BYTES_TOTAL:
> > >  		{
> > > -			u16 *pu2Tmp;
> > > -			pu2Tmp = pOut;
> > > +			u16 *pu2Tmp = pOut;
> > >
> > >  			if (efuseType == EFUSE_WIFI)
> > >  				*pu2Tmp =
> > > (EFUSE_REAL_CONTENT_LEN_8723B-EFUSE_OOB_PROTECT_BYTES);
> > > @@ -549,8 +543,7 @@ void Hal_GetEfuseDefinition(
> > >
> > >  	case TYPE_EFUSE_MAP_LEN:
> > >  		{
> > > -			u16 *pu2Tmp;
> > > -			pu2Tmp = pOut;
> > > +			u16 *pu2Tmp = pOut;
> > >
> > >  			if (efuseType == EFUSE_WIFI)
> > >  				*pu2Tmp = EFUSE_MAX_MAP_LEN;
> > > @@ -561,8 +554,7 @@ void Hal_GetEfuseDefinition(
> > >
> > >  	case TYPE_EFUSE_PROTECT_BYTES_BANK:
> > >  		{
> > > -			u8 *pu1Tmp;
> > > -			pu1Tmp = pOut;
> > > +			u8 *pu1Tmp = pOut;
> > >
> > >  			if (efuseType == EFUSE_WIFI)
> > >  				*pu1Tmp = EFUSE_OOB_PROTECT_BYTES;
> > > @@ -573,8 +565,7 @@ void Hal_GetEfuseDefinition(
> > >
> > >  	case TYPE_EFUSE_CONTENT_LEN_BANK:
> > >  		{
> > > -			u16 *pu2Tmp;
> > > -			pu2Tmp = pOut;
> > > +			u16 *pu2Tmp = pOut;
> > >
> > >  			if (efuseType == EFUSE_WIFI)
> > >  				*pu2Tmp =
> > > EFUSE_REAL_CONTENT_LEN_8723B;
> > > @@ -585,8 +576,7 @@ void Hal_GetEfuseDefinition(
> > >
> > >  	default:
> > >  		{
> > > -			u8 *pu1Tmp;
> > > -			pu1Tmp = pOut;
> > > +			u8 *pu1Tmp = pOut;
> > >  			*pu1Tmp = 0;
> > >  		}
> > >  		break;
> > > @@ -729,10 +719,9 @@ static void hal_ReadEFuse_WiFi(
> > >  		}
> > >
> > >  		if (offset < EFUSE_MAX_SECTION_8723B) {
> > > -			u16 addr;
> > > +			u16 addr = offset * PGPKT_DATA_SIZE;
> > >  			/*  Get word enable value from PG header
> > > */
> > >
> > > -			addr = offset * PGPKT_DATA_SIZE;
> > >  			for (i = 0; i < EFUSE_MAX_WORD_UNIT; i++)
> > > {
> > >  				/*  Check word enable condition in
> > > the section */
> > >  				if (!(wden & (0x01<<i))) {
> > > @@ -835,9 +824,8 @@ static void hal_ReadEFuse_BT(
> > >  			}
> > >
> > >  			if (offset < EFUSE_BT_MAX_SECTION) {
> > > -				u16 addr;
> > > +				u16 addr = offset *
> > > PGPKT_DATA_SIZE;
> > >
> > > -				addr = offset * PGPKT_DATA_SIZE;
> > >  				for (i = 0; i <
> > > EFUSE_MAX_WORD_UNIT; i++) {
> > >  					/*  Check word enable
> > > condition in the section */
> > >  					if (!(wden & (0x01<<i))) {
> > > @@ -1153,14 +1141,10 @@ static u8 Hal_EfuseWordEnableDataWrite(
> > >
> > >  static struct hal_version ReadChipVersion8723B(struct adapter
> > > *padapter)
> > >  {
> > > -	u32 value32;
> > > +	u32 value32 = rtw_read32(padapter, REG_SYS_CFG);
> > >  	struct hal_version ChipVersion;
> > > -	struct hal_com_data *pHalData;
> > > -
> > > -/* YJ, TODO, move read chip type here */
> > > -	pHalData = GET_HAL_DATA(padapter);
> > > +	struct hal_com_data *pHalData = GET_HAL_DATA(padapter);
> > >
> > > -	value32 = rtw_read32(padapter, REG_SYS_CFG);
> > >  	ChipVersion.ICType = CHIP_8723B;
> > >  	ChipVersion.ChipType = ((value32 & RTL_ID) ? TEST_CHIP :
> > > NORMAL_CHIP);
> > >  	ChipVersion.VendorType = ((value32 & VENDOR_ID) ?
> > > CHIP_VENDOR_UMC : CHIP_VENDOR_TSMC);
> > > @@ -1196,10 +1180,9 @@ void rtl8723b_InitBeaconParameters(struct
> > > adapter *padapter)
> > >  {
> > >  	struct hal_com_data *pHalData = GET_HAL_DATA(padapter);
> > >  	u16 val16;
> > > -	u8 val8;
> > > +	u8 val8 = DIS_TSF_UDT;
> > >
> > >
> > > -	val8 = DIS_TSF_UDT;
> > >  	val16 = val8 | (val8 << 8); /*  port0 and port1 */
> > >
> > >  	/*  Enable prot0 beacon function for PSTDMA */
> > > @@ -1287,22 +1270,7 @@ void
> > > rtl8723b_SetBeaconRelatedRegisters(struct adapter *padapter)
> > >  	u32 value32;
> > >  	struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
> > >  	struct mlme_ext_info *pmlmeinfo = &pmlmeext->mlmext_info;
> > > -	u32 bcn_ctrl_reg;
> > > -
> > > -	/* reset TSF, enable update TSF, correcting TSF On Beacon
> > > */
> > > -
> > > -	/* REG_BCN_INTERVAL */
> > > -	/* REG_BCNDMATIM */
> > > -	/* REG_ATIMWND */
> > > -	/* REG_TBTT_PROHIBIT */
> > > -	/* REG_DRVERLYINT */
> > > -	/* REG_BCN_MAX_ERR */
> > > -	/* REG_BCNTCFG (0x510) */
> > > -	/* REG_DUAL_TSF_RST */
> > > -	/* REG_BCN_CTRL (0x550) */
> > > -
> > > -
> > > -	bcn_ctrl_reg = REG_BCN_CTRL;
> > > +	u32 bcn_ctrl_reg = REG_BCN_CTRL;
> > >
> > >  	/*  */
> > >  	/*  ATIM window */
> > > @@ -1416,9 +1384,7 @@ void rtl8723b_set_hal_ops(struct hal_ops
> > > *pHalFunc)
> > >
> > >  void rtl8723b_InitAntenna_Selection(struct adapter *padapter)
> > >  {
> > > -	u8 val;
> > > -
> > > -	val = rtw_read8(padapter, REG_LEDCFG2);
> > > +	u8 val = rtw_read8(padapter, REG_LEDCFG2);
> > >  	/*  Let 8051 take control antenna setting */
> > >  	val |= BIT(7); /*  DPDT_SEL_EN, 0x4C[23] */
> > >  	rtw_write8(padapter, REG_LEDCFG2, val);
> > > @@ -1426,14 +1392,10 @@ void rtl8723b_InitAntenna_Selection(struct
> > > adapter *padapter)
> > >
> > >  void rtl8723b_init_default_value(struct adapter *padapter)
> > >  {
> > > -	struct hal_com_data *pHalData;
> > > -	struct dm_priv *pdmpriv;
> > > +	struct hal_com_data *pHalData = GET_HAL_DATA(padapter);
> > > +	struct dm_priv *pdmpriv = &pHalData->dmpriv;
> > >  	u8 i;
> > >
> > > -
> > > -	pHalData = GET_HAL_DATA(padapter);
> > > -	pdmpriv = &pHalData->dmpriv;
> > > -
> > >  	padapter->registrypriv.wireless_mode = WIRELESS_11BG_24N;
> > >
> > >  	/*  init default value */
> > > @@ -1478,9 +1440,7 @@ void rtl8723b_init_default_value(struct
> > > adapter *padapter)
> > >  u8 GetEEPROMSize8723B(struct adapter *padapter)
> > >  {
> > >  	u8 size = 0;
> > > -	u32 cr;
> > > -
> > > -	cr = rtw_read16(padapter, REG_9346CR);
> > > +	u32 cr = rtw_read16(padapter, REG_9346CR);
> > >  	/*  6: EEPROM used is 93C46, 4: boot from E-Fuse. */
> > >  	size = (cr & BOOT_FROM_EEPROM) ? 6 : 4;
> > >
> > > @@ -1495,13 +1455,9 @@ u8 GetEEPROMSize8723B(struct adapter
> > > *padapter)
> > >  s32 rtl8723b_InitLLTTable(struct adapter *padapter)
> > >  {
> > >  	unsigned long start, passing_time;
> > > -	u32 val32;
> > > -	s32 ret;
> > > -
> > > -
> > > -	ret = _FAIL;
> > > +	u32 val32 = rtw_read32(padapter, REG_AUTO_LLT);
> > > +	s32 ret = _FAIL;
> > >
> > > -	val32 = rtw_read32(padapter, REG_AUTO_LLT);
> > >  	val32 |= BIT_AUTO_INIT_LLT;
> > >  	rtw_write32(padapter, REG_AUTO_LLT, val32);
> > >
> > > @@ -1559,11 +1515,10 @@ void Hal_EfuseParseIDCode(struct adapter
> > > *padapter, u8 *hwinfo)
> > >  {
> > >  	struct eeprom_priv *pEEPROM =
> > > GET_EEPROM_EFUSE_PRIV(padapter);
> > >  /* 	struct hal_com_data	*pHalData =
> > > GET_HAL_DATA(padapter); */
> > > -	u16 EEPROMId;
> > > +	u16 EEPROMId = le16_to_cpu(*((__le16 *)hwinfo));
> > >
> > >
> > >  	/*  Check 0x8129 again for making sure autoload status!!
> > > */
> > > -	EEPROMId = le16_to_cpu(*((__le16 *)hwinfo));
> > >  	if (EEPROMId != RTL_EEPROM_ID) {
> > >  		pEEPROM->bautoload_fail_flag = true;
> > >  	} else
> > > @@ -2273,9 +2228,8 @@ void rtl8723b_fill_fake_txdesc(
> > >  	/*  Encrypt the data frame if under security mode excepct
> > > null data. Suggested by CCW. */
> > >  	/*  */
> > >  	if (bDataFrame) {
> > > -		u32 EncAlg;
> > > +		u32 EncAlg = padapter-
> > > >securitypriv.dot11PrivacyAlgrthm;
> > >
> > > -		EncAlg = padapter-
> > > >securitypriv.dot11PrivacyAlgrthm;
> > >  		switch (EncAlg) {
> > >  		case _NO_PRIVACY_:
> > >  			SET_TX_DESC_SEC_TYPE_8723B(pDesc, 0x0);
> > > @@ -2378,9 +2332,7 @@ static void hw_var_set_opmode(struct adapter
> > > *padapter, u8 variable, u8 *val)
> > >  static void hw_var_set_macaddr(struct adapter *padapter, u8
> > > variable, u8 *val)
> > >  {
> > >  	u8 idx = 0;
> > > -	u32 reg_macid;
> > > -
> > > -	reg_macid = REG_MACID;
> > > +	u32 reg_macid = REG_MACID;
> > >
> > >  	for (idx = 0 ; idx < 6; idx++)
> > >  		rtw_write8(GET_PRIMARY_ADAPTER(padapter),
> > > (reg_macid+idx), val[idx]);
> > > @@ -2389,9 +2341,7 @@ static void hw_var_set_macaddr(struct adapter
> > > *padapter, u8 variable, u8 *val)
> > >  static void hw_var_set_bssid(struct adapter *padapter, u8
> > > variable, u8 *val)
> > >  {
> > >  	u8 idx = 0;
> > > -	u32 reg_bssid;
> > > -
> > > -	reg_bssid = REG_BSSID;
> > > +	u32 reg_bssid = REG_BSSID;
> > >
> > >  	for (idx = 0 ; idx < 6; idx++)
> > >  		rtw_write8(padapter, (reg_bssid+idx), val[idx]);
> > > @@ -2399,15 +2349,12 @@ static void hw_var_set_bssid(struct adapter
> > > *padapter, u8 variable, u8 *val)
> > >
> > >  static void hw_var_set_bcn_func(struct adapter *padapter, u8
> > > variable, u8 *val)
> > >  {
> > > -	u32 bcn_ctrl_reg;
> > > -
> > > -	bcn_ctrl_reg = REG_BCN_CTRL;
> > > +	u32 bcn_ctrl_reg = REG_BCN_CTRL;
> > >
> > >  	if (*(u8 *)val)
> > >  		rtw_write8(padapter, bcn_ctrl_reg,
> > > (EN_BCN_FUNCTION | EN_TXBCN_RPT));
> > >  	else {
> > > -		u8 val8;
> > > -		val8 = rtw_read8(padapter, bcn_ctrl_reg);
> > > +		u8 val8 = rtw_read8(padapter, bcn_ctrl_reg);
> > >  		val8 &= ~(EN_BCN_FUNCTION | EN_TXBCN_RPT);
> > >
> > >  		/*  Always enable port0 beacon function for PSTDMA
> > > */
> > > @@ -2422,12 +2369,8 @@ static void hw_var_set_correct_tsf(struct
> > > adapter *padapter, u8 variable, u8 *va
> > >  {
> > >  	u8 val8;
> > >  	u64 tsf;
> > > -	struct mlme_ext_priv *pmlmeext;
> > > -	struct mlme_ext_info *pmlmeinfo;
> > > -
> > > -
> > > -	pmlmeext = &padapter->mlmeextpriv;
> > > -	pmlmeinfo = &pmlmeext->mlmext_info;
> > > +	struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
> > > +	struct mlme_ext_info *pmlmeinfo = &pmlmeext->mlmext_info;
> > >
> > >  	tsf = pmlmeext->TSFValue-do_div(pmlmeext->TSFValue,
> > > (pmlmeinfo->bcn_interval*1024))-1024; /* us */
> > >
> > > @@ -2479,17 +2422,11 @@ static void
> > > hw_var_set_mlme_disconnect(struct adapter *padapter, u8 variable,
> > > u8
> > >
> > >  static void hw_var_set_mlme_sitesurvey(struct adapter *padapter,
> > > u8 variable, u8 *val)
> > >  {
> > > -	u32 value_rcr, rcr_clear_bit, reg_bcn_ctl;
> > > +	u32 value_rcr, rcr_clear_bit, reg_bcn_ctl = REG_BCN_CTRL;
> > >  	u16 value_rxfltmap2;
> > >  	u8 val8;
> > > -	struct hal_com_data *pHalData;
> > > -	struct mlme_priv *pmlmepriv;
> > > -
> > > -
> > > -	pHalData = GET_HAL_DATA(padapter);
> > > -	pmlmepriv = &padapter->mlmepriv;
> > > -
> > > -	reg_bcn_ctl = REG_BCN_CTRL;
> > > +	struct hal_com_data *pHalData = GET_HAL_DATA(padapter);
> > > +	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
> > >
> > >  	rcr_clear_bit = RCR_CBSSID_BCN;
> > >
> > > @@ -2543,15 +2480,12 @@ static void hw_var_set_mlme_join(struct
> > > adapter *padapter, u8 variable, u8 *val)
> > >  	u8 val8;
> > >  	u16 val16;
> > >  	u32 val32;
> > > -	u8 RetryLimit;
> > > -	u8 type;
> > > -	struct mlme_priv *pmlmepriv;
> > > +	u8 RetryLimit = 0x30;
> > > +	u8 type = *(u8 *)val;
> > > +	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
> > >  	struct eeprom_priv *pEEPROM;
> > >
> > >
> > > -	RetryLimit = 0x30;
> > > -	type = *(u8 *)val;
> > > -	pmlmepriv = &padapter->mlmepriv;
> > >  	pEEPROM = GET_EEPROM_EFUSE_PRIV(padapter);
> > >
> > >  	if (type == 0) { /*  prepare to join */
> > > @@ -2779,8 +2713,7 @@ void SetHwReg8723B(struct adapter *padapter,
> > > u8 variable, u8 *val)
> > >
> > >  	case HW_VAR_CHECK_BSSID:
> > >  		{
> > > -			u32 val32;
> > > -			val32 = rtw_read32(padapter, REG_RCR);
> > > +			u32 val32 = rtw_read32(padapter, REG_RCR);
> > >  			if (*val)
> > >  				val32 |=
> > > RCR_CBSSID_DATA|RCR_CBSSID_BCN;
> > >  			else
> > > @@ -2850,12 +2783,11 @@ void SetHwReg8723B(struct adapter
> > > *padapter, u8 variable, u8 *val)
> > >
> > >  	case HW_VAR_ACK_PREAMBLE:
> > >  		{
> > > -			u8 regTmp;
> > > +			u8 regTmp = 0;
> > >  			u8 bShortPreamble = *val;
> > >
> > >  			/*  Joseph marked out for Netgear 3500
> > > TKIP channel 7 issue.(Temporarily) */
> > >  			/* regTmp = (pHalData-
> > > >nCur40MhzPrimeSC)<<5; */
> > > -			regTmp = 0;
> > >  			if (bShortPreamble)
> > >  				regTmp |= 0x80;
> > >  			rtw_write8(padapter, REG_RRSR+2, regTmp);
> > > @@ -3226,9 +3158,7 @@ void GetHwReg8723B(struct adapter *padapter,
> > > u8 variable, u8 *val)
> > >   */
> > >  u8 SetHalDefVar8723B(struct adapter *padapter, enum
> > > hal_def_variable variable, void *pval)
> > >  {
> > > -	u8 bResult;
> > > -
> > > -	bResult = _SUCCESS;
> > > +	u8 bResult = _SUCCESS;
> > >
> > >  	switch (variable) {
> > >  	default:
> > > @@ -3244,9 +3174,7 @@ u8 SetHalDefVar8723B(struct adapter
> > > *padapter, enum hal_def_variable variable, v
> > >   */
> > >  u8 GetHalDefVar8723B(struct adapter *padapter, enum
> > > hal_def_variable variable, void *pval)
> > >  {
> > > -	u8 bResult;
> > > -
> > > -	bResult = _SUCCESS;
> > > +	u8 bResult = _SUCCESS;
> > >
> > >  	switch (variable) {
> > >  	case HAL_DEF_MAX_RECVBUF_SZ:
> > > @@ -3281,9 +3209,8 @@ u8 GetHalDefVar8723B(struct adapter
> > > *padapter, enum hal_def_variable variable, v
> > >  	case HW_DEF_RA_INFO_DUMP:
> > >  		{
> > >  			u8 mac_id = *(u8 *)pval;
> > > -			u32 cmd;
> > > +			u32 cmd = 0x40000100 | mac_id;
> > >
> > > -			cmd = 0x40000100 | mac_id;
> > >  			rtw_write32(padapter,
> > > REG_HMEBOX_DBG_2_8723B, cmd);
> > >  			msleep(10);
> > >  			rtw_read32(padapter, 0x2F0);	// info 1
> > > --
> > > 2.43.0
> > >
> > >
> > >
>
>
--8323329-595273396-1743848835=:3184--
