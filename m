Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 994B4A47;
	Tue,  1 Jul 2025 05:14:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751346856; cv=none; b=ZWSg6pSSvuKeAzt6rot7kVzB/BCjIGRMKGs2bHydborcmBNNs5BfCPQB1I504mZHjRl5ZNATptlApXIYsOS1VusZl3NQ0hQawyruPpx5SRgapPhImq4e3ElEFk5XfT81xz/PLyvoHH2QRXMcWEwE58jJVHa76rAP8rMlXJSTdZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751346856; c=relaxed/simple;
	bh=4EI84xoe1kHo6E7yA1cYA+lVhLbZuwVZ6TP6KFJRjE4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ddDiiuPGgAad0uk30MkBDQiXibfLswEudQl5G8kVGumTSKryNc8WvboXu8pH9w98efnT/XJ6h7ulMpfncGurbh2lyXn8R+j06gYTZJvt4yiwQXxcmSGk+9Zidbt6O281h3sgn1nA9Lg4FacGnT+62xPRU2kAFLs2dqjKBk7o5qo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=WA/3/LVy; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="WA/3/LVy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 239C7C4CEEB;
	Tue,  1 Jul 2025 05:14:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1751346856;
	bh=4EI84xoe1kHo6E7yA1cYA+lVhLbZuwVZ6TP6KFJRjE4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WA/3/LVyMWmjOkxhgPa5g2/HPbtQ6WQ/VeFoI2fNmePUB3FNN/ECFDL2IQg/zA39Y
	 go/Tqwfdv+wees0iQsyZSimb2cEve0h8UMr9DaYREKrUVvdiuDxxWfY9fJizALhV4o
	 wa2e3qfhsufVEMHH5EJvEevcTNGdi2XKBO+yLno0=
Date: Tue, 1 Jul 2025 07:14:13 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Marcos Garcia <magazo2005@gmail.com>
Cc: philipp.g.hortmann@gmail.com, dan.carpenter@linaro.org,
	karanja99erick@gmail.com, rodrigo.gobbi.7@gmail.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH staging] staging: rtl8723bs: Replace magic numbers in
 beacon initialization
Message-ID: <2025070157-suing-uptake-356e@gregkh>
References: <38411a98-d907-4173-a528-8d50b337de0c@suswa.mountain>
 <20250630210211.3922530-1-magazo2005@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250630210211.3922530-1-magazo2005@gmail.com>

On Mon, Jun 30, 2025 at 11:02:11PM +0200, Marcos Garcia wrote:
> Replace hardcoded register values in rtl8723b_InitBeaconParameters()
> with descriptive defines to improve code readability and maintainability:
> - TBTT_PROHIBIT_DEFAULT (0x6404): Sets TBTT prohibit time to 100ms
>   (bits [15:8]) with a 2ms margin (bits [7:0]).
> - BCNTCFG_DEFAULT (0x660F): Configures maximum AIFS for beacon
>   transmission to ensure high priority, as recommended by the designer.
> 
> Preserve original comments where they provide useful context, such as
> firmware control in power-saving mode and designer notes about beacon
> contention. Fix typo "contension" to "contention" in the comment.
> 
> Signed-off-by: Marcos Garcia <magazo2005@gmail.com>
> ---
>  .../staging/rtl8723bs/hal/rtl8723b_hal_init.c | 50 +++++++++++++++----
>  kernel/sched/ext.c                            |  8 ++-
>  2 files changed, 46 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
> index cc7886d75a0b..a3438280e1ab 100644
> --- a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
> +++ b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
> @@ -1183,9 +1183,25 @@ void rtl8723b_read_chip_version(struct adapter *padapter)
>  	ReadChipVersion8723B(padapter);
>  }
>  
> -/* Beacon Configuration */
> -#define TBTT_PROHIBIT_DEFAULT_MS	0x6404  /* 100ms interval + 4ms margin */
> -#define BCNTCFG_AIFS_LARGEST		0x660F  /* Max AIFS for beacon priority */
> +/*
> + * Beacon Configuration
> + *
> + * REG_TBTT_PROHIBIT: 16-bit register where:
> + *   - Bits [15:8] = TBTT prohibit time in units of 1ms
> + *   - Bits [7:0] = TBTT prohibit margin time in units of 0.5ms
> + * Default value of 0x6404 means:
> + *   - 0x64 (100) ms prohibit time
> + *   - 0x04 (4 * 0.5 = 2) ms margin time
> + */
> +#define TBTT_PROHIBIT_100MS_2MS_MARGIN 0x6404
> +
> +/*
> + * REG_BCNTCFG: Beacon configuration register
> + * 0x660F sets AIFS to maximum value (0xF) with other default parameters
> + * This ensures beacons get highest priority (no contention window),
> + * as suggested by the original designer for test chips.
> + */
> +#define BCNTCFG_MAX_AIFS 0x660F
>  
>  void rtl8723b_InitBeaconParameters(struct adapter *padapter)
>  {
> @@ -1193,19 +1209,31 @@ void rtl8723b_InitBeaconParameters(struct adapter *padapter)
>  	u16 val16;
>  	u8 val8 = DIS_TSF_UDT;
>  
> -	val16 = val8 | (val8 << 8); /* port0 and port1 */
> -	val16 |= EN_BCN_FUNCTION;   /* Enable prot0 beacon function */
> +	/* Configure beacon control for both port 0 and port 1 */
> +	val16 = val8 | (val8 << 8);
> +	val16 |= EN_BCN_FUNCTION; /* Enable beacon function for PSTDMA */
>  	rtw_write16(padapter, REG_BCN_CTRL, val16);
>  
> -	/* Fixed: Replaced magic numbers with defines */
> -	rtw_write16(padapter, REG_TBTT_PROHIBIT, TBTT_PROHIBIT_DEFAULT_MS);
> +	/* Configure TBTT prohibit timer with 100ms interval + 2ms margin */
> +	rtw_write16(padapter, REG_TBTT_PROHIBIT, TBTT_PROHIBIT_100MS_2MS_MARGIN);
> +
> +	/*
> +	 * Firmware controls early interrupt timing in power save mode,
> +	 * so only set REG_DRVERLYINT when not in station mode
> +	 */
> +	if (!check_fwstate(&padapter->mlmepriv, WIFI_STATION_STATE))
> +		rtw_write8(padapter, REG_DRVERLYINT, DRIVER_EARLY_INT_TIME_8723B); /* 5ms */
>  
> -	if (check_fwstate(&padapter->mlmepriv, WIFI_STATION_STATE) == false)
> -		rtw_write8(padapter, REG_DRVERLYINT, DRIVER_EARLY_INT_TIME_8723B);
> +	/* Set beacon DMA interrupt time to 2ms */
> +	rtw_write8(padapter, REG_BCNDMATIM, BCN_DMA_ATIME_INT_TIME_8723B); /* 2ms */
>  
> -	rtw_write8(padapter, REG_BCNDMATIM, BCN_DMA_ATIME_INT_TIME_8723B);
> -	rtw_write16(padapter, REG_BCNTCFG, BCNTCFG_AIFS_LARGEST);
> +	/*
> +	 * Suggested by designer timchen: Set AIFS to maximum to avoid contention
> +	 * before sending beacons on test chips. By tynli, 2009.11.03
> +	 */
> +	rtw_write16(padapter, REG_BCNTCFG, BCNTCFG_MAX_AIFS);
>  
> +	/* Save initial register values for reference */
>  	pHalData->RegBcnCtrlVal = rtw_read8(padapter, REG_BCN_CTRL);
>  	pHalData->RegTxPause = rtw_read8(padapter, REG_TXPAUSE);
>  	pHalData->RegFwHwTxQCtrl = rtw_read8(padapter, REG_FWHW_TXQ_CTRL+2);
> diff --git a/kernel/sched/ext.c b/kernel/sched/ext.c
> index b498d867ba21..7cecc0ca700d 100644
> --- a/kernel/sched/ext.c
> +++ b/kernel/sched/ext.c
> @@ -4258,7 +4258,13 @@ void scx_group_set_weight(struct task_group *tg, unsigned long weight)
>  
>  void scx_group_set_idle(struct task_group *tg, bool idle)
>  {
> -	/* TODO: Implement ops->cgroup_set_idle() */
> +	struct sched_ext_ops *ops;
> +
> +	rcu_read_lock();
> +	ops = rcu_dereference(ext_ops);
> +	if (ops && ops->cgroup_set_idle)
> +		ops->cgroup_set_idle(tg, idle);
> +	rcu_read_unlock();
>  }
>  
>  static void scx_cgroup_lock(void)
> -- 
> 2.50.0
> 
> 

Hi,

This is the friendly patch-bot of Greg Kroah-Hartman.  You have sent him
a patch that has triggered this response.  He used to manually respond
to these common problems, but in order to save his sanity (he kept
writing the same thing over and over, yet to different people), I was
created.  Hopefully you will not take offence and will fix the problem
in your patch and resubmit it so that it can be accepted into the Linux
kernel tree.

You are receiving this message because of the following common error(s)
as indicated below:

- This looks like a new version of a previously submitted patch, but you
  did not list below the --- line any changes from the previous version.
  Please read the section entitled "The canonical patch format" in the
  kernel file, Documentation/process/submitting-patches.rst for what
  needs to be done here to properly describe this.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
