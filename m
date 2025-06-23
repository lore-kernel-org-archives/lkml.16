Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1B627DA7F
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 15:04:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750691085; cv=none; b=jfewuSrdyoMoN1eGx89H+eCrLChJYMwlsHsVmmjyQdjHurtdVapW8lkO1NIBBpXaZjay4sPU2/vZirp4K7zkoUuZQUsTe9PFAx/v0XoVEbU1piID+7VRBT9NirpRt8JHJgfc1VG7jpGBehyMco2SyxlNMMMDqlUpIRPma96WUFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750691085; c=relaxed/simple;
	bh=3OjQ9xf5sOW1ROvRh8iIveSikutNoP7f8cL3axNY/rQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fKHstSDPGo4GDGdoBz2c000Noh0eAestk0onEPAvxOTKrtRJfWXHK6symlQSOPm1nhl6FeT2/wRqIHKPPTk0IfdJPvjJ1/BAOI1jb7kTDVa8h3aHEmR7x+8yUE+nZwXbWl3zIMpo+nCDiRnGyJq/kvFGZw82ZcdWfduXCePJuW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NxJ9C8R1; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NxJ9C8R1"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-311bd8ce7e4so3539310a91.3
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 08:04:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750691083; x=1751295883; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=B76lja0U3ricMA/lF4InrpybN1h1UBAY2Q/OqGGhKjs=;
        b=NxJ9C8R1oleiG1Z2XB44hJs0XewvWj9pdkCdnMVWimBETQzHFPFg2gsYZtapS8OkIq
         /zca1wp7fYspG6u2/6IN7NK4Rgdf0pEKdoFz44ybsyF+DQgdGT9cSk71L0BPjghYvgXE
         FhBngkYEsc+XipkPxXOQJycs2ptYmKBhDb1PTdLZqz/9BeeXfLHecnN4FJ7UAXoMWHHc
         9z7vuFy2RjUpMuT2ri/p0AcFyE+wuuTsXlwcUysws8qtP9JE0+KJv1+MW9p2LeApA1kb
         CKb2t17YsBtUfD8s+l/w0flSbwW7coP7an7Z0609YC6u7dJ+FRFL3pUlnUgvqpUnz5aN
         OxEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750691083; x=1751295883;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B76lja0U3ricMA/lF4InrpybN1h1UBAY2Q/OqGGhKjs=;
        b=w6Bfj4/eGG0rCU/aassY5R6G0ti8O0JPCcQ8E8h0ukffm0rHLFm9HTduyCXna6ayVw
         D/oCBjg1euI5iYPvwpDst7d7d6yNzYWWFEeOq2pWEObQ2ZXw5QZA0+QIBIMR9pbGmUmE
         kZSVZZlIrfLxz110Wg7180wFnnlfAabzYJdD9m5jsOfX5kVh7sGOVfwxw2KFddqJWtJ6
         CIywiaLbS47Lr1G6w9ByRBS+DpbhmTaCNqvLyfcbM4BRgK2RRI7/zkooac4fQfAnuDdb
         e6SRGCBi3uDwQ3o9xYy7QD01ERtQZ5mbgteWMujg5dbo65wqNoGm1XPy/aoBKHF2TMJm
         LgBQ==
X-Forwarded-Encrypted: i=1; AJvYcCUNEktkLsZusNQ3NrqJ9ZGERXIzwmG6V3zSGtCkTNbRNQFWylbf4WaUcwwXkvSiw5/0Mynbfy13sxkPATE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxAd543/nBJpvRpVoZWGCZrMNNARdKWinF8A4tbwqfpVn+bUt1V
	jfLBcJnZ4VLoSbAms9ph8+N821Vf/f85YJgp93MWe7QCy/idQ3pT0mZDsGeqTpsN86E=
X-Gm-Gg: ASbGncus+mKSlTqNZutziW9vlLzbf6kK1R627W0qtfF8ExtxzRs02THwDOlIJjfT3Uv
	mQriir1jWf1BIdjp11X0lghdXtlYc3d4+yzpfnD6qG2Ssd/R0K15DSUM3YgkVMpHb+//cmWG+9h
	YMBi0a8R05+aqqnW1tr8i/fw/jL7re2LIMO6autwbw2KZuCrHWNv73oG9Jivjgn1cF6aYc9TbcC
	1GTSmW94e5OWJdDAYl1kvTSIa6T74T4iFtKSXzxc7muJ7ohuxNPwH/+6Ql3I4xe3nLTIEPNDFhl
	WIY/QkOCkPf2USSs6uYE5u+reBaHGWpK4fCsPap/hkM79zLh8Coc4rrL6DzAT64J
X-Google-Smtp-Source: AGHT+IHu9l7433gn0EAnhgFKQwsCXxEvdTHaeQKvMja0m0uBJNnzDbAjryY/LtbMGvfQPZ0rPzoLLg==
X-Received: by 2002:a17:90b:3802:b0:312:e8ed:758 with SMTP id 98e67ed59e1d1-3159d64cb4cmr21178261a91.13.1750691083145;
        Mon, 23 Jun 2025 08:04:43 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:d145:b99:ea4b:a65f])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3159e07d027sm8343474a91.43.2025.06.23.08.04.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 08:04:42 -0700 (PDT)
Date: Mon, 23 Jun 2025 09:04:38 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: andersson@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
	kernel@pengutronix.de, festevam@gmail.com,
	linux-remoteproc@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] remoteproc: imx_dsp_rproc: Add support of recovery
 process
Message-ID: <aFltBpXuEXVZ5gKn@p14s>
References: <20250618062644.3895785-1-shengjiu.wang@nxp.com>
 <20250618062644.3895785-2-shengjiu.wang@nxp.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250618062644.3895785-2-shengjiu.wang@nxp.com>

Good day,

On Wed, Jun 18, 2025 at 02:26:43PM +0800, Shengjiu Wang wrote:
> when recovery is triggered, rproc_stop() is called first then
> rproc_start(), but there is no rproc_unprepare_device() and
> rproc_prepare_device() in the flow.
> 
> So power enablement needs to be moved from prepare callback to start
> callback, power disablement needs to be moved from unprepare callback
> to stop callback, loading elf function also needs to be moved to start
> callback, the load callback only store the firmware handler.
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---
>  drivers/remoteproc/imx_dsp_rproc.c | 58 ++++++++++++++++++------------
>  1 file changed, 36 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/remoteproc/imx_dsp_rproc.c b/drivers/remoteproc/imx_dsp_rproc.c
> index 5ee622bf5352..9b9cddb224b0 100644
> --- a/drivers/remoteproc/imx_dsp_rproc.c
> +++ b/drivers/remoteproc/imx_dsp_rproc.c
> @@ -122,6 +122,7 @@ enum imx_dsp_rp_mbox_messages {
>   * @ipc_handle: System Control Unit ipc handle
>   * @rproc_work: work for processing virtio interrupts
>   * @pm_comp: completion primitive to sync for suspend response
> + * @firmware: firmware handler
>   * @flags: control flags
>   */
>  struct imx_dsp_rproc {
> @@ -139,6 +140,7 @@ struct imx_dsp_rproc {
>  	struct imx_sc_ipc			*ipc_handle;
>  	struct work_struct			rproc_work;
>  	struct completion			pm_comp;
> +	const struct firmware			*firmware;
>  	u32					flags;
>  };
>  
> @@ -211,6 +213,7 @@ static const struct imx_rproc_att imx_dsp_rproc_att_imx8ulp[] = {
>  
>  /* Initialize the mailboxes between cores, if exists */
>  static int (*imx_dsp_rproc_mbox_init)(struct imx_dsp_rproc *priv);
> +static int imx_dsp_rproc_elf_load_segments(struct rproc *rproc, const struct firmware *fw);
>  
>  /* Reset function for DSP on i.MX8MP */
>  static int imx8mp_dsp_reset(struct imx_dsp_rproc *priv)
> @@ -402,8 +405,24 @@ static int imx_dsp_rproc_start(struct rproc *rproc)
>  	const struct imx_dsp_rproc_dcfg *dsp_dcfg = priv->dsp_dcfg;
>  	const struct imx_rproc_dcfg *dcfg = dsp_dcfg->dcfg;
>  	struct device *dev = rproc->dev.parent;
> +	struct rproc_mem_entry *carveout;
>  	int ret;
>  
> +	pm_runtime_get_sync(dev);
> +
> +	/*
> +	 * Clear buffers after pm rumtime for internal ocram is not
> +	 * accessible if power and clock are not enabled.
> +	 */
> +	list_for_each_entry(carveout, &rproc->carveouts, node) {
> +		if (carveout->va)
> +			memset(carveout->va, 0, carveout->len);
> +	}
> +
> +	ret = imx_dsp_rproc_elf_load_segments(rproc, priv->firmware);
> +	if (ret)
> +		return ret;
> +
>  	switch (dcfg->method) {
>  	case IMX_RPROC_MMIO:
>  		ret = regmap_update_bits(priv->regmap,
> @@ -446,6 +465,7 @@ static int imx_dsp_rproc_stop(struct rproc *rproc)
>  
>  	if (rproc->state == RPROC_CRASHED) {
>  		priv->flags &= ~REMOTE_IS_READY;
> +		pm_runtime_put_sync(dev);

From this patch I understand that for a recovery to be successful, the
remote processor _has_ to go through a hard reset.  But here the PM runtime API
is used, meaning the remote processor won't be switched off if another device in
the same power domain still neeeds power.  If that is the case, the solution in
tihs patch won't work.

Thanks,
Mathieu

>  		return 0;
>  	}
>  
> @@ -472,6 +492,8 @@ static int imx_dsp_rproc_stop(struct rproc *rproc)
>  	else
>  		priv->flags &= ~REMOTE_IS_READY;
>  
> +	pm_runtime_put_sync(dev);
> +
>  	return ret;
>  }
>  
> @@ -774,7 +796,6 @@ static int imx_dsp_rproc_prepare(struct rproc *rproc)
>  {
>  	struct imx_dsp_rproc *priv = rproc->priv;
>  	struct device *dev = rproc->dev.parent;
> -	struct rproc_mem_entry *carveout;
>  	int ret;
>  
>  	ret = imx_dsp_rproc_add_carveout(priv);
> @@ -783,25 +804,6 @@ static int imx_dsp_rproc_prepare(struct rproc *rproc)
>  		return ret;
>  	}
>  
> -	pm_runtime_get_sync(dev);
> -
> -	/*
> -	 * Clear buffers after pm rumtime for internal ocram is not
> -	 * accessible if power and clock are not enabled.
> -	 */
> -	list_for_each_entry(carveout, &rproc->carveouts, node) {
> -		if (carveout->va)
> -			memset(carveout->va, 0, carveout->len);
> -	}
> -
> -	return  0;
> -}
> -
> -/* Unprepare function for rproc_ops */
> -static int imx_dsp_rproc_unprepare(struct rproc *rproc)
> -{
> -	pm_runtime_put_sync(rproc->dev.parent);
> -
>  	return  0;
>  }
>  
> @@ -1022,13 +1024,25 @@ static int imx_dsp_rproc_parse_fw(struct rproc *rproc, const struct firmware *fw
>  	return 0;
>  }
>  
> +static int imx_dsp_rproc_load(struct rproc *rproc, const struct firmware *fw)
> +{
> +	struct imx_dsp_rproc *priv = rproc->priv;
> +
> +	/*
> +	 * Just save the fw handler, the firmware loading will be after
> +	 * power enabled
> +	 */
> +	priv->firmware = fw;
> +
> +	return 0;
> +}
> +
>  static const struct rproc_ops imx_dsp_rproc_ops = {
>  	.prepare	= imx_dsp_rproc_prepare,
> -	.unprepare	= imx_dsp_rproc_unprepare,
>  	.start		= imx_dsp_rproc_start,
>  	.stop		= imx_dsp_rproc_stop,
>  	.kick		= imx_dsp_rproc_kick,
> -	.load		= imx_dsp_rproc_elf_load_segments,
> +	.load		= imx_dsp_rproc_load,
>  	.parse_fw	= imx_dsp_rproc_parse_fw,
>  	.handle_rsc	= imx_dsp_rproc_handle_rsc,
>  	.find_loaded_rsc_table = rproc_elf_find_loaded_rsc_table,
> -- 
> 2.34.1
> 
