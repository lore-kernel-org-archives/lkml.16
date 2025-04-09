Received: from mail2-relais-roc.national.inria.fr (mail2-relais-roc.national.inria.fr [192.134.164.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BF7A41C64
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 11:04:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.134.164.83
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744196668; cv=none; b=lOTiU6YgMHc/hxNdtRGGTyoCFIug2ddEQYw0tZ+5ciiLEaK6z3MoS27nZPXjF3QHM7lDVrXLK+MxdtIgcFNMkH2lQK3jvedEPR+Txfd83zM825YWNvaOFGmtX0xFp734ycGARo9AoRbDosgLRMAIL+RviO04g4uyggYbvoYghD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744196668; c=relaxed/simple;
	bh=f3z6gH3tbcuPStpaLhptxMCRwmFN1Il+33iJGK77vGw=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=DjnWUSmFP6VSnHSE+ioU8H9MEyb0M50Kwtr+O+YJNMUoSaZf7c5aWMjp68sVwDXGx3CH5FhhvBwp6LEhf2MrXwz9xcxgkkMMPTtHWKnK4gGk3wWiwEy/HBpmfkhhovCz++xOGJTnlNHHNa8xd6ODUh4EFyj0uu+sA5DIWCZOqk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr; spf=pass smtp.mailfrom=inria.fr; dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b=U2nc0069; arc=none smtp.client-ip=192.134.164.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inria.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b="U2nc0069"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=pfVTnKU6Y1/1EviXHs3xslSSXW+ff5mypdkKHopY+88=;
  b=U2nc0069fgFNsqudNnaWYeWXUu9bYR+WUJahRnpZO9erXgGdSVEbKfyU
   nPHZV0Dm7BrD5bB/E/xg49uRzX7jccGYShAws/q5qA9Tfgn0THpNvIksr
   IdU8cbPG78h31Dw0ZZ6YqzP3qOib/dQOMJU4RKP4dsZNoJuSsqpBiiNhr
   Q=;
Authentication-Results: mail2-relais-roc.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.15,200,1739833200"; 
   d="scan'208";a="217096650"
Received: from unknown (HELO hadrien.lan) ([172.59.115.113])
  by mail2-relais-roc.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2025 13:04:20 +0200
Date: Wed, 9 Apr 2025 07:04:18 -0400 (EDT)
From: Julia Lawall <julia.lawall@inria.fr>
To: Erick Karanja <karanja99erick@gmail.com>
cc: gregkh@linuxfoundation.org, outreachy@lists.linux.dev, 
    philipp.g.hortmann@gmail.com, linux-staging@lists.linux.dev, 
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] staging: rtl8723bs: Improve code readability
In-Reply-To: <97a2637f3ccefb3de0e15fd04f29f5f209f2a506.1744192642.git.karanja99erick@gmail.com>
Message-ID: <3dda7f97-4ed8-cf6d-9310-60ed6259a386@inria.fr>
References: <cover.1744192642.git.karanja99erick@gmail.com> <97a2637f3ccefb3de0e15fd04f29f5f209f2a506.1744192642.git.karanja99erick@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII



On Wed, 9 Apr 2025, Erick Karanja wrote:

> Make the code more readable by moving trivial
> initializations up with the declarations instead
> of wasting a line on that.
>
> Signed-off-by: Erick Karanja <karanja99erick@gmail.com>
> ---
>  .../staging/rtl8723bs/hal/rtl8723b_hal_init.c | 84 ++++++-------------
>  1 file changed, 25 insertions(+), 59 deletions(-)
>
> diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
> index e15ec6452fd0..2cf2c66140f1 100644
> --- a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
> +++ b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
> @@ -501,8 +501,7 @@ void Hal_GetEfuseDefinition(
>  	switch (type) {
>  	case TYPE_EFUSE_MAX_SECTION:
>  		{
> -			u8 *pMax_section;
> -			pMax_section = pOut;
> +			u8 *pMax_section = pOut;
>
>  			if (efuseType == EFUSE_WIFI)
>  				*pMax_section = EFUSE_MAX_SECTION_8723B;
> @@ -513,8 +512,7 @@ void Hal_GetEfuseDefinition(
>
>  	case TYPE_EFUSE_REAL_CONTENT_LEN:
>  		{
> -			u16 *pu2Tmp;
> -			pu2Tmp = pOut;
> +			u16 *pu2Tmp = pOut;
>
>  			if (efuseType == EFUSE_WIFI)
>  				*pu2Tmp = EFUSE_REAL_CONTENT_LEN_8723B;
> @@ -525,8 +523,7 @@ void Hal_GetEfuseDefinition(
>
>  	case TYPE_AVAILABLE_EFUSE_BYTES_BANK:
>  		{
> -			u16 *pu2Tmp;
> -			pu2Tmp = pOut;
> +			u16 *pu2Tmp = pOut;
>
>  			if (efuseType == EFUSE_WIFI)
>  				*pu2Tmp = (EFUSE_REAL_CONTENT_LEN_8723B-EFUSE_OOB_PROTECT_BYTES);
> @@ -537,8 +534,7 @@ void Hal_GetEfuseDefinition(
>
>  	case TYPE_AVAILABLE_EFUSE_BYTES_TOTAL:
>  		{
> -			u16 *pu2Tmp;
> -			pu2Tmp = pOut;
> +			u16 *pu2Tmp = pOut;
>
>  			if (efuseType == EFUSE_WIFI)
>  				*pu2Tmp = (EFUSE_REAL_CONTENT_LEN_8723B-EFUSE_OOB_PROTECT_BYTES);
> @@ -549,8 +545,7 @@ void Hal_GetEfuseDefinition(
>
>  	case TYPE_EFUSE_MAP_LEN:
>  		{
> -			u16 *pu2Tmp;
> -			pu2Tmp = pOut;
> +			u16 *pu2Tmp = pOut;
>
>  			if (efuseType == EFUSE_WIFI)
>  				*pu2Tmp = EFUSE_MAX_MAP_LEN;
> @@ -561,8 +556,7 @@ void Hal_GetEfuseDefinition(
>
>  	case TYPE_EFUSE_PROTECT_BYTES_BANK:
>  		{
> -			u8 *pu1Tmp;
> -			pu1Tmp = pOut;
> +			u8 *pu1Tmp = pOut;
>
>  			if (efuseType == EFUSE_WIFI)
>  				*pu1Tmp = EFUSE_OOB_PROTECT_BYTES;
> @@ -573,8 +567,7 @@ void Hal_GetEfuseDefinition(
>
>  	case TYPE_EFUSE_CONTENT_LEN_BANK:
>  		{
> -			u16 *pu2Tmp;
> -			pu2Tmp = pOut;
> +			u16 *pu2Tmp = pOut;
>
>  			if (efuseType == EFUSE_WIFI)
>  				*pu2Tmp = EFUSE_REAL_CONTENT_LEN_8723B;
> @@ -585,8 +578,7 @@ void Hal_GetEfuseDefinition(
>
>  	default:
>  		{
> -			u8 *pu1Tmp;
> -			pu1Tmp = pOut;
> +			u8 *pu1Tmp = pOut;
>  			*pu1Tmp = 0;
>  		}
>  		break;
> @@ -729,10 +721,9 @@ static void hal_ReadEFuse_WiFi(
>  		}
>
>  		if (offset < EFUSE_MAX_SECTION_8723B) {
> -			u16 addr;
> +			u16 addr = offset * PGPKT_DATA_SIZE;
>  			/*  Get word enable value from PG header */
>
> -			addr = offset * PGPKT_DATA_SIZE;

I'm not sure about this one, due to the comment.

julia

>  			for (i = 0; i < EFUSE_MAX_WORD_UNIT; i++) {
>  				/*  Check word enable condition in the section */
>  				if (!(wden & (0x01<<i))) {
> @@ -835,9 +826,8 @@ static void hal_ReadEFuse_BT(
>  			}
>
>  			if (offset < EFUSE_BT_MAX_SECTION) {
> -				u16 addr;
> +				u16 addr = offset * PGPKT_DATA_SIZE;
>
> -				addr = offset * PGPKT_DATA_SIZE;
>  				for (i = 0; i < EFUSE_MAX_WORD_UNIT; i++) {
>  					/*  Check word enable condition in the section */
>  					if (!(wden & (0x01<<i))) {
> @@ -1196,10 +1186,9 @@ void rtl8723b_InitBeaconParameters(struct adapter *padapter)
>  {
>  	struct hal_com_data *pHalData = GET_HAL_DATA(padapter);
>  	u16 val16;
> -	u8 val8;
> +	u8 val8 = DIS_TSF_UDT;
>
>
> -	val8 = DIS_TSF_UDT;
>  	val16 = val8 | (val8 << 8); /*  port0 and port1 */
>
>  	/*  Enable prot0 beacon function for PSTDMA */
> @@ -1496,10 +1485,7 @@ s32 rtl8723b_InitLLTTable(struct adapter *padapter)
>  {
>  	unsigned long start, passing_time;
>  	u32 val32;
> -	s32 ret;
> -
> -
> -	ret = _FAIL;
> +	s32 ret = _FAIL;
>
>  	val32 = rtw_read32(padapter, REG_AUTO_LLT);
>  	val32 |= BIT_AUTO_INIT_LLT;
> @@ -2273,9 +2259,8 @@ void rtl8723b_fill_fake_txdesc(
>  	/*  Encrypt the data frame if under security mode excepct null data. Suggested by CCW. */
>  	/*  */
>  	if (bDataFrame) {
> -		u32 EncAlg;
> +		u32 EncAlg = padapter->securitypriv.dot11PrivacyAlgrthm;
>
> -		EncAlg = padapter->securitypriv.dot11PrivacyAlgrthm;
>  		switch (EncAlg) {
>  		case _NO_PRIVACY_:
>  			SET_TX_DESC_SEC_TYPE_8723B(pDesc, 0x0);
> @@ -2378,9 +2363,7 @@ static void hw_var_set_opmode(struct adapter *padapter, u8 variable, u8 *val)
>  static void hw_var_set_macaddr(struct adapter *padapter, u8 variable, u8 *val)
>  {
>  	u8 idx = 0;
> -	u32 reg_macid;
> -
> -	reg_macid = REG_MACID;
> +	u32 reg_macid = REG_MACID;
>
>  	for (idx = 0 ; idx < 6; idx++)
>  		rtw_write8(GET_PRIMARY_ADAPTER(padapter), (reg_macid+idx), val[idx]);
> @@ -2389,9 +2372,7 @@ static void hw_var_set_macaddr(struct adapter *padapter, u8 variable, u8 *val)
>  static void hw_var_set_bssid(struct adapter *padapter, u8 variable, u8 *val)
>  {
>  	u8 idx = 0;
> -	u32 reg_bssid;
> -
> -	reg_bssid = REG_BSSID;
> +	u32 reg_bssid = REG_BSSID;
>
>  	for (idx = 0 ; idx < 6; idx++)
>  		rtw_write8(padapter, (reg_bssid+idx), val[idx]);
> @@ -2399,9 +2380,7 @@ static void hw_var_set_bssid(struct adapter *padapter, u8 variable, u8 *val)
>
>  static void hw_var_set_bcn_func(struct adapter *padapter, u8 variable, u8 *val)
>  {
> -	u32 bcn_ctrl_reg;
> -
> -	bcn_ctrl_reg = REG_BCN_CTRL;
> +	u32 bcn_ctrl_reg = REG_BCN_CTRL;
>
>  	if (*(u8 *)val)
>  		rtw_write8(padapter, bcn_ctrl_reg, (EN_BCN_FUNCTION | EN_TXBCN_RPT));
> @@ -2422,12 +2401,8 @@ static void hw_var_set_correct_tsf(struct adapter *padapter, u8 variable, u8 *va
>  {
>  	u8 val8;
>  	u64 tsf;
> -	struct mlme_ext_priv *pmlmeext;
> -	struct mlme_ext_info *pmlmeinfo;
> -
> -
> -	pmlmeext = &padapter->mlmeextpriv;
> -	pmlmeinfo = &pmlmeext->mlmext_info;
> +	struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
> +	struct mlme_ext_info *pmlmeinfo = &pmlmeext->mlmext_info;
>
>  	tsf = pmlmeext->TSFValue-do_div(pmlmeext->TSFValue, (pmlmeinfo->bcn_interval*1024))-1024; /* us */
>
> @@ -2543,15 +2518,12 @@ static void hw_var_set_mlme_join(struct adapter *padapter, u8 variable, u8 *val)
>  	u8 val8;
>  	u16 val16;
>  	u32 val32;
> -	u8 RetryLimit;
> -	u8 type;
> -	struct mlme_priv *pmlmepriv;
> +	u8 RetryLimit = 0x30;
> +	u8 type = *(u8 *)val;
> +	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
>  	struct eeprom_priv *pEEPROM;
>
>
> -	RetryLimit = 0x30;
> -	type = *(u8 *)val;
> -	pmlmepriv = &padapter->mlmepriv;
>  	pEEPROM = GET_EEPROM_EFUSE_PRIV(padapter);
>
>  	if (type == 0) { /*  prepare to join */
> @@ -2850,12 +2822,11 @@ void SetHwReg8723B(struct adapter *padapter, u8 variable, u8 *val)
>
>  	case HW_VAR_ACK_PREAMBLE:
>  		{
> -			u8 regTmp;
> +			u8 regTmp = 0;
>  			u8 bShortPreamble = *val;
>
>  			/*  Joseph marked out for Netgear 3500 TKIP channel 7 issue.(Temporarily) */
>  			/* regTmp = (pHalData->nCur40MhzPrimeSC)<<5; */
> -			regTmp = 0;
>  			if (bShortPreamble)
>  				regTmp |= 0x80;
>  			rtw_write8(padapter, REG_RRSR+2, regTmp);
> @@ -3226,9 +3197,7 @@ void GetHwReg8723B(struct adapter *padapter, u8 variable, u8 *val)
>   */
>  u8 SetHalDefVar8723B(struct adapter *padapter, enum hal_def_variable variable, void *pval)
>  {
> -	u8 bResult;
> -
> -	bResult = _SUCCESS;
> +	u8 bResult = _SUCCESS;
>
>  	switch (variable) {
>  	default:
> @@ -3244,9 +3213,7 @@ u8 SetHalDefVar8723B(struct adapter *padapter, enum hal_def_variable variable, v
>   */
>  u8 GetHalDefVar8723B(struct adapter *padapter, enum hal_def_variable variable, void *pval)
>  {
> -	u8 bResult;
> -
> -	bResult = _SUCCESS;
> +	u8 bResult = _SUCCESS;
>
>  	switch (variable) {
>  	case HAL_DEF_MAX_RECVBUF_SZ:
> @@ -3281,9 +3248,8 @@ u8 GetHalDefVar8723B(struct adapter *padapter, enum hal_def_variable variable, v
>  	case HW_DEF_RA_INFO_DUMP:
>  		{
>  			u8 mac_id = *(u8 *)pval;
> -			u32 cmd;
> +			u32 cmd = 0x40000100 | mac_id;
>
> -			cmd = 0x40000100 | mac_id;
>  			rtw_write32(padapter, REG_HMEBOX_DBG_2_8723B, cmd);
>  			msleep(10);
>  			rtw_read32(padapter, 0x2F0);	// info 1
> --
> 2.43.0
>
>
>
