Received: from mail3-relais-sop.national.inria.fr (mail3-relais-sop.national.inria.fr [192.134.164.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A334D1C1AB4
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 14:55:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.134.164.104
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743173712; cv=none; b=vCCHy9Tw9mbJT3n2gFx4CxrNEddw8f+gVpYva8boRtbMOAHNlx0QGE0Yh6MVlklq/aFhGEFNlZCZXLX/sEMqVDS0HvuCvT5wl8Vufko+ZKL5vNt7f/b2AZ/XOjj4N1Qe/NqPS65YnrZgv2vc4HS4NYN1fTb3mACSeThjVml9xH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743173712; c=relaxed/simple;
	bh=wWAAGIvnE3QpTr0giTRFZtAHNXL1x33FV5Dckbd6WfY=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=Is6CZxFqYuPeMwTLf85DO1lZYlsB7eKoyIF9O2uMpq+5ISfLMrSQnxZVIr7T//bdBch33YHMWJH/RJqu8Zz5Vs6HDvg0utIQMH9x7ASkskolProFG0mpbmIEtUbz0pl8k9tWcgfhhK0Nhc/jVVFzVyPzkzSRKOXG888QYWqJYhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr; spf=pass smtp.mailfrom=inria.fr; dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b=kC9ysh4t; arc=none smtp.client-ip=192.134.164.104
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inria.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b="kC9ysh4t"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=OdjsjzVTff9n5mM0sggjRtyY+7xARLMR5lQ3pqLEXaU=;
  b=kC9ysh4tm1JPWmcaF9IOPlahKR3LvJrG6Xgkokj1jrQiLhFFk+N1C+3+
   1a8SZTxI5Y2krSbj1Q0PxhKRf3+uSrz0X9cBxeFede81C0QaB6a9Ih17b
   u2ydvvepv7QXFFwi4QD/JiQnXOD5RzTk/X3zwbL8IFPrdN38ZUR/8ntJb
   I=;
Authentication-Results: mail3-relais-sop.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.14,283,1736809200"; 
   d="scan'208";a="112883127"
Received: from dt-lawall.paris.inria.fr ([128.93.67.65])
  by mail3-relais-sop.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2025 15:55:01 +0100
Date: Fri, 28 Mar 2025 15:55:00 +0100 (CET)
From: Julia Lawall <julia.lawall@inria.fr>
To: Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>
cc: outreachy@lists.linux.dev, gregkh@linuxfoundation.org, 
    linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/5] staging: rtl8723bs: modify variable names to comply
 with kernel naming convention
In-Reply-To: <dd32dfe6c837d88dd13a546aadcb0bc207b997d6.1743163801.git.abrahamadekunle50@gmail.com>
Message-ID: <21e624e7-c18f-6aa2-2a16-7cd46e706d47@inria.fr>
References: <cover.1743163800.git.abrahamadekunle50@gmail.com> <dd32dfe6c837d88dd13a546aadcb0bc207b997d6.1743163801.git.abrahamadekunle50@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII



On Fri, 28 Mar 2025, Abraham Samuel Adekunle wrote:

> The variable names use the camelCase naming convention which is not consistent
> with Linux kernel naming convention.
>
> Modify the names to use snake_case in adherence to the Linux kernel approved
> naming convention for consistency with the codebase.

There is another naming issue that checkpatch perhaps doesn't warn about
which is the encoding of types in variable names.  You can see some
variables with names that start with b for boolean and p for pointer.
Those letters shouldn't be used in kernel code.

julia

>
> Reported by checkpatch:
>
> CHECK: Avoid camelCase:
>
> Signed-off-by: Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>
> ---
>  drivers/staging/rtl8723bs/core/rtw_cmd.c      | 22 +++++-----
>  drivers/staging/rtl8723bs/core/rtw_efuse.c    | 42 +++++++++----------
>  drivers/staging/rtl8723bs/core/rtw_mlme_ext.c |  8 ++--
>  drivers/staging/rtl8723bs/core/rtw_pwrctrl.c  | 14 +++----
>  .../staging/rtl8723bs/core/rtw_wlan_util.c    | 18 ++++----
>  5 files changed, 52 insertions(+), 52 deletions(-)
>
> diff --git a/drivers/staging/rtl8723bs/core/rtw_cmd.c b/drivers/staging/rtl8723bs/core/rtw_cmd.c
> index ad949b0e2b97..ae22b2bf5446 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_cmd.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_cmd.c
> @@ -1132,10 +1132,10 @@ static void collect_traffic_statistics(struct adapter *padapter)
>
>  u8 traffic_status_watchdog(struct adapter *padapter, u8 from_timer)
>  {
> -	u8 bEnterPS = false;
> -	u16 BusyThresholdHigh = 25;
> -	u16 BusyThresholdLow = 10;
> -	u16 BusyThreshold = BusyThresholdHigh;
> +	u8 b_enter_ps = false;
> +	u16 busy_threshold_high = 25;
> +	u16 busy_threshold_low = 10;
> +	u16 busy_threshold = busy_threshold_high;
>  	u8 bBusyTraffic = false, bTxBusyTraffic = false, bRxBusyTraffic = false;
>  	u8 bHigherBusyTraffic = false, bHigherBusyRxTraffic = false, bHigherBusyTxTraffic = false;
>  	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
> @@ -1149,10 +1149,10 @@ u8 traffic_status_watchdog(struct adapter *padapter, u8 from_timer)
>  		/*&& !MgntInitAdapterInProgress(pMgntInfo)*/) {
>  		/*  if we raise bBusyTraffic in last watchdog, using lower threshold. */
>  		if (pmlmepriv->LinkDetectInfo.bBusyTraffic)
> -			BusyThreshold = BusyThresholdLow;
> +			busy_threshold = busy_threshold_low;
>
> -		if (pmlmepriv->LinkDetectInfo.NumRxOkInPeriod > BusyThreshold ||
> -			pmlmepriv->LinkDetectInfo.NumTxOkInPeriod > BusyThreshold) {
> +		if (pmlmepriv->LinkDetectInfo.NumRxOkInPeriod > busy_threshold ||
> +			pmlmepriv->LinkDetectInfo.NumTxOkInPeriod > busy_threshold) {
>  			bBusyTraffic = true;
>
>  			if (pmlmepriv->LinkDetectInfo.NumRxOkInPeriod > pmlmepriv->LinkDetectInfo.NumTxOkInPeriod)
> @@ -1175,7 +1175,7 @@ u8 traffic_status_watchdog(struct adapter *padapter, u8 from_timer)
>  		/*  check traffic for  powersaving. */
>  		if (((pmlmepriv->LinkDetectInfo.NumRxUnicastOkInPeriod + pmlmepriv->LinkDetectInfo.NumTxOkInPeriod) > 8) ||
>  			(pmlmepriv->LinkDetectInfo.NumRxUnicastOkInPeriod > 2)) {
> -			bEnterPS = false;
> +			b_enter_ps = false;
>
>  			if (bBusyTraffic) {
>  				if (pmlmepriv->LinkDetectInfo.TrafficTransitionCount <= 4)
> @@ -1193,11 +1193,11 @@ u8 traffic_status_watchdog(struct adapter *padapter, u8 from_timer)
>  				pmlmepriv->LinkDetectInfo.TrafficTransitionCount = 0;
>
>  			if (pmlmepriv->LinkDetectInfo.TrafficTransitionCount == 0)
> -				bEnterPS = true;
> +				b_enter_ps = true;
>  		}
>
>  		/*  LeisurePS only work in infra mode. */
> -		if (bEnterPS) {
> +		if (b_enter_ps) {
>  			if (!from_timer)
>  				LPS_Enter(padapter, "TRAFFIC_IDLE");
>  		} else {
> @@ -1227,7 +1227,7 @@ u8 traffic_status_watchdog(struct adapter *padapter, u8 from_timer)
>  	pmlmepriv->LinkDetectInfo.bHigherBusyRxTraffic = bHigherBusyRxTraffic;
>  	pmlmepriv->LinkDetectInfo.bHigherBusyTxTraffic = bHigherBusyTxTraffic;
>
> -	return bEnterPS;
> +	return b_enter_ps;
>
>  }
>
> diff --git a/drivers/staging/rtl8723bs/core/rtw_efuse.c b/drivers/staging/rtl8723bs/core/rtw_efuse.c
> index 62a2919086f3..6a2fc4dfa07e 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_efuse.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_efuse.c
> @@ -10,21 +10,21 @@
>
>
>  /* Define global variables */
> -u8 fakeEfuseBank;
> -u32 fakeEfuseUsedBytes;
> -u8 fakeEfuseContent[EFUSE_MAX_HW_SIZE] = {0};
> -u8 fakeEfuseInitMap[EFUSE_MAX_MAP_LEN] = {0};
> -u8 fakeEfuseModifiedMap[EFUSE_MAX_MAP_LEN] = {0};
> -
> -u32 BTEfuseUsedBytes;
> -u8 BTEfuseContent[EFUSE_MAX_BT_BANK][EFUSE_MAX_HW_SIZE];
> -u8 BTEfuseInitMap[EFUSE_BT_MAX_MAP_LEN] = {0};
> -u8 BTEfuseModifiedMap[EFUSE_BT_MAX_MAP_LEN] = {0};
> -
> -u32 fakeBTEfuseUsedBytes;
> -u8 fakeBTEfuseContent[EFUSE_MAX_BT_BANK][EFUSE_MAX_HW_SIZE];
> -u8 fakeBTEfuseInitMap[EFUSE_BT_MAX_MAP_LEN] = {0};
> -u8 fakeBTEfuseModifiedMap[EFUSE_BT_MAX_MAP_LEN] = {0};
> +u8 fake_efuse_bank;
> +u32 fake_efuse_used_bytes;
> +u8 fake_efuse_content[EFUSE_MAX_HW_SIZE] = {0};
> +u8 fake_efuse_init_map[EFUSE_MAX_MAP_LEN] = {0};
> +u8 fake_efuse_modified_map[EFUSE_MAX_MAP_LEN] = {0};
> +
> +u32 bte_fuse_used_bytes;
> +u8 bte_fuse_content[EFUSE_MAX_BT_BANK][EFUSE_MAX_HW_SIZE];
> +u8 bte_use_init_map[EFUSE_BT_MAX_MAP_LEN] = {0};
> +u8 bte_use_modified_map[EFUSE_BT_MAX_MAP_LEN] = {0};
> +
> +u32 fakebte_fuse_used_bytes;
> +u8 fakebte_fuse_content[EFUSE_MAX_BT_BANK][EFUSE_MAX_HW_SIZE];
> +u8 fakebte_use_init_map[EFUSE_BT_MAX_MAP_LEN] = {0};
> +u8 fakebte_use_modified_map[EFUSE_BT_MAX_MAP_LEN] = {0};
>
>  #define REG_EFUSE_CTRL		0x0030
>  #define EFUSE_CTRL			REG_EFUSE_CTRL		/*  E-Fuse Control. */
> @@ -33,10 +33,10 @@ static bool Efuse_Read1ByteFromFakeContent(u16 Offset, u8 *Value)
>  {
>  	if (Offset >= EFUSE_MAX_HW_SIZE)
>  		return false;
> -	if (fakeEfuseBank == 0)
> -		*Value = fakeEfuseContent[Offset];
> +	if (fake_efuse_bank == 0)
> +		*Value = fake_efuse_content[Offset];
>  	else
> -		*Value = fakeBTEfuseContent[fakeEfuseBank - 1][Offset];
> +		*Value = fakebte_fuse_content[fake_efuse_bank - 1][Offset];
>  	return true;
>  }
>
> @@ -44,10 +44,10 @@ static bool Efuse_Write1ByteToFakeContent(u16 Offset, u8 Value)
>  {
>  	if (Offset >= EFUSE_MAX_HW_SIZE)
>  		return false;
> -	if (fakeEfuseBank == 0)
> -		fakeEfuseContent[Offset] = Value;
> +	if (fake_efuse_bank == 0)
> +		fake_efuse_content[Offset] = Value;
>  	else
> -		fakeBTEfuseContent[fakeEfuseBank - 1][Offset] = Value;
> +		fakebte_fuse_content[fake_efuse_bank - 1][Offset] = Value;
>  	return true;
>  }
>
> diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
> index 183c3046ca1f..90966b7034ab 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
> @@ -3579,7 +3579,7 @@ void issue_action_BA(struct adapter *padapter, unsigned char *raddr, unsigned ch
>  	dump_mgntframe(padapter, pmgntframe);
>  }
>
> -static void issue_action_BSSCoexistPacket(struct adapter *padapter)
> +static void issue_action_bss_coexist_packet(struct adapter *padapter)
>  {
>  	struct list_head		*plist, *phead;
>  	unsigned char category, action;
> @@ -3901,9 +3901,9 @@ void site_survey(struct adapter *padapter)
>  			pmlmeext->chan_scan_time = SURVEY_TO;
>  			pmlmeext->sitesurvey_res.state = SCAN_DISABLE;
>
> -			issue_action_BSSCoexistPacket(padapter);
> -			issue_action_BSSCoexistPacket(padapter);
> -			issue_action_BSSCoexistPacket(padapter);
> +			issue_action_bss_coexist_packet(padapter);
> +			issue_action_bss_coexist_packet(padapter);
> +			issue_action_bss_coexist_packet(padapter);
>  		}
>  	}
>
> diff --git a/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c b/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
> index 84109e338c86..75ce5f15f996 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
> @@ -406,14 +406,14 @@ void rtw_set_ps_mode(struct adapter *padapter, u8 ps_mode, u8 smart_ps, u8 bcn_a
>  s32 LPS_RF_ON_check(struct adapter *padapter, u32 delay_ms)
>  {
>  	unsigned long start_time;
> -	u8 bAwake = false;
> +	u8 b_awake = false;
>  	s32 err = 0;
>
>
>  	start_time = jiffies;
>  	while (1) {
> -		rtw_hal_get_hwreg(padapter, HW_VAR_FWLPS_RF_ON, &bAwake);
> -		if (bAwake)
> +		rtw_hal_get_hwreg(padapter, HW_VAR_FWLPS_RF_ON, &b_awake);
> +		if (b_awake)
>  			break;
>
>  		if (padapter->bSurpriseRemoved) {
> @@ -558,11 +558,11 @@ void LPS_Leave_check(struct adapter *padapter)
>  {
>  	struct pwrctrl_priv *pwrpriv;
>  	unsigned long	start_time;
> -	u8 bReady;
> +	u8 b_ready;
>
>  	pwrpriv = adapter_to_pwrctl(padapter);
>
> -	bReady = false;
> +	b_ready = false;
>  	start_time = jiffies;
>
>  	cond_resched();
> @@ -573,11 +573,11 @@ void LPS_Leave_check(struct adapter *padapter)
>  		if (padapter->bSurpriseRemoved ||
>  		    !(padapter->hw_init_completed) ||
>  		    (pwrpriv->pwr_mode == PS_MODE_ACTIVE))
> -			bReady = true;
> +			b_ready = true;
>
>  		mutex_unlock(&pwrpriv->lock);
>
> -		if (bReady)
> +		if (b_ready)
>  			break;
>
>  		if (jiffies_to_msecs(jiffies - start_time) > 100)
> diff --git a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c b/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
> index 73c70b016f00..06e7677b5e3a 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
> @@ -223,16 +223,16 @@ void UpdateBrateTblForSoftAP(u8 *bssrateset, u32 bssratelen)
>
>  void Save_DM_Func_Flag(struct adapter *padapter)
>  {
> -	u8 bSaveFlag = true;
> +	u8 b_save_flag = true;
>
> -	rtw_hal_set_hwreg(padapter, HW_VAR_DM_FUNC_OP, (u8 *)(&bSaveFlag));
> +	rtw_hal_set_hwreg(padapter, HW_VAR_DM_FUNC_OP, (u8 *)(&b_save_flag));
>  }
>
>  void Restore_DM_Func_Flag(struct adapter *padapter)
>  {
> -	u8 bSaveFlag = false;
> +	u8 b_save_flag = false;
>
> -	rtw_hal_set_hwreg(padapter, HW_VAR_DM_FUNC_OP, (u8 *)(&bSaveFlag));
> +	rtw_hal_set_hwreg(padapter, HW_VAR_DM_FUNC_OP, (u8 *)(&b_save_flag));
>  }
>
>  void Switch_DM_Func(struct adapter *padapter, u32 mode, u8 enable)
> @@ -1502,7 +1502,7 @@ void update_capinfo(struct adapter *Adapter, u16 updateCap)
>  {
>  	struct mlme_ext_priv *pmlmeext = &Adapter->mlmeextpriv;
>  	struct mlme_ext_info *pmlmeinfo = &(pmlmeext->mlmext_info);
> -	bool		ShortPreamble;
> +	bool		short_preamble;
>
>  	/*  Check preamble mode, 2005.01.06, by rcnjko. */
>  	/*  Mark to update preamble value forever, 2008.03.18 by lanhsin */
> @@ -1511,16 +1511,16 @@ void update_capinfo(struct adapter *Adapter, u16 updateCap)
>  		if (updateCap & cShortPreamble) {
>  			/*  Short Preamble */
>  			if (pmlmeinfo->preamble_mode != PREAMBLE_SHORT) { /*  PREAMBLE_LONG or PREAMBLE_AUTO */
> -				ShortPreamble = true;
> +				short_preamble = true;
>  				pmlmeinfo->preamble_mode = PREAMBLE_SHORT;
> -				rtw_hal_set_hwreg(Adapter, HW_VAR_ACK_PREAMBLE, (u8 *)&ShortPreamble);
> +				rtw_hal_set_hwreg(Adapter, HW_VAR_ACK_PREAMBLE, (u8 *)&short_preamble);
>  			}
>  		} else {
>  			/*  Long Preamble */
>  			if (pmlmeinfo->preamble_mode != PREAMBLE_LONG) { /*  PREAMBLE_SHORT or PREAMBLE_AUTO */
> -				ShortPreamble = false;
> +				short_preamble = false;
>  				pmlmeinfo->preamble_mode = PREAMBLE_LONG;
> -				rtw_hal_set_hwreg(Adapter, HW_VAR_ACK_PREAMBLE, (u8 *)&ShortPreamble);
> +				rtw_hal_set_hwreg(Adapter, HW_VAR_ACK_PREAMBLE, (u8 *)&short_preamble);
>  			}
>  		}
>  	}
> --
> 2.34.1
>
>
