Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF660267AF8
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 16:41:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745426520; cv=none; b=eOwQqBCPC/MhAVpqbdpBSXaTjBzhzcvAaSepfhl3kuvXIQ7DZvVpHdl9HTERaxmit+JpNO7/M8Z1qiPtIHqMFItFOCCUNQz9bDduo/EsCnHSXB2mnApAiZ835YrHbxaNsWl32DdKPgwNrAd110jc5bGNO+Zol18pz09NO7xP3VE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745426520; c=relaxed/simple;
	bh=Rv20Kwlnc1pDh0PfW3S5iO2+1VDLAygwKfhHuAJ8oqI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PamXt0GvQk0YV9qqe2kOEuvI48vp8Hb+N+9jfnFjuLhfPSUYIkDjMi1f8RvkjYkAFneqfkDP0JRBtR5RHuUzJYoa6aYONAa956bNJUNotYWGdheO8/NbvbjSfT4px38vSKHS471mmR9V+QbdbfBiDIEL/FBCV5Vj09YYgNwopro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mfe@pengutronix.de>)
	id 1u7dAV-0006Bt-CI; Wed, 23 Apr 2025 18:41:51 +0200
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1u7dAU-001kTn-2z;
	Wed, 23 Apr 2025 18:41:50 +0200
Received: from mfe by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1u7dAU-00H6mz-2a;
	Wed, 23 Apr 2025 18:41:50 +0200
Date: Wed, 23 Apr 2025 18:41:50 +0200
From: Marco Felsch <m.felsch@pengutronix.de>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v2 3/3] soc: imx8m: Dump higher 64bits UID
Message-ID: <20250423164150.3pqytl5zqwfnsx7i@pengutronix.de>
References: <20250423-uid-128-v2-0-327c30fe59a9@nxp.com>
 <20250423-uid-128-v2-3-327c30fe59a9@nxp.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250423-uid-128-v2-3-327c30fe59a9@nxp.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-kernel@vger.kernel.org

On 25-04-23, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> i.MX8MP UID is actually 128bits and partitioned into two parts.
> The 1st 64bits are at 0x410 and 0x420, and 2nd 64bits are at 0xE00
> and 0xE10.
> 
> Dump the whole 128bits for i.MX8MP, by set soc_uid as an array with two
> u64.
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  drivers/soc/imx/soc-imx8m.c | 22 ++++++++++++++++------
>  1 file changed, 16 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/soc/imx/soc-imx8m.c b/drivers/soc/imx/soc-imx8m.c
> index 2186f6ab3eddd6c9369c691c845b3b78acaabe23..04a1b60f2f2b52cc374714f9a1205496c1762f39 100644
> --- a/drivers/soc/imx/soc-imx8m.c
> +++ b/drivers/soc/imx/soc-imx8m.c
> @@ -24,6 +24,7 @@
>  #define OCOTP_UID_HIGH			0x420
>  
>  #define IMX8MP_OCOTP_UID_OFFSET		0x10
> +#define IMX8MP_OCOTP_UID_HIGH		0xE00
>  
>  /* Same as ANADIG_DIGPROG_IMX7D */
>  #define ANADIG_DIGPROG_IMX8MM	0x800
> @@ -96,9 +97,13 @@ static int imx8mp_soc_uid(struct platform_device *pdev, u64 *socuid)
>  	struct imx8_soc_drvdata *drvdata = platform_get_drvdata(pdev);
>  	void __iomem *ocotp_base = drvdata->ocotp_base;
>  
> -	*socuid = readl_relaxed(ocotp_base + OCOTP_UID_HIGH + IMX8MP_OCOTP_UID_OFFSET);
> -	*socuid <<= 32;
> -	*socuid |= readl_relaxed(ocotp_base + OCOTP_UID_LOW + IMX8MP_OCOTP_UID_OFFSET);
> +	socuid[0] = readl_relaxed(ocotp_base + OCOTP_UID_HIGH + IMX8MP_OCOTP_UID_OFFSET);
> +	socuid[0] <<= 32;
> +	socuid[0] |= readl_relaxed(ocotp_base + OCOTP_UID_LOW + IMX8MP_OCOTP_UID_OFFSET);
						^
Nit: while on it, we can add a IMX8MP_OCOTP_UID_LOW define.

With or without the change, the patch lgtm.

Reviewed-by: Marco Felsch <m.felsch@pengutronix.de>


> +
> +	socuid[1] = readl_relaxed(ocotp_base + IMX8MP_OCOTP_UID_HIGH + 0x10);
> +	socuid[1] <<= 32;
> +	socuid[1] |= readl_relaxed(ocotp_base + IMX8MP_OCOTP_UID_HIGH);
>  
>  	return 0;
>  }
> @@ -220,7 +225,7 @@ static int imx8m_soc_probe(struct platform_device *pdev)
>  	const struct of_device_id *id;
>  	struct soc_device *soc_dev;
>  	u32 soc_rev = 0;
> -	u64 soc_uid = 0;
> +	u64 soc_uid[2] = {0, 0};
>  	int ret;
>  
>  	soc_dev_attr = devm_kzalloc(dev, sizeof(*soc_dev_attr), GFP_KERNEL);
> @@ -258,7 +263,7 @@ static int imx8m_soc_probe(struct platform_device *pdev)
>  			}
>  		}
>  		if (data->soc_uid) {
> -			ret = data->soc_uid(pdev, &soc_uid);
> +			ret = data->soc_uid(pdev, soc_uid);
>  			if (ret) {
>  				imx8m_soc_unprepare(pdev);
>  				return ret;
> @@ -271,7 +276,12 @@ static int imx8m_soc_probe(struct platform_device *pdev)
>  	if (!soc_dev_attr->revision)
>  		return -ENOMEM;
>  
> -	soc_dev_attr->serial_number = devm_kasprintf(dev, GFP_KERNEL, "%016llX", soc_uid);
> +	if (soc_uid[1])
> +		soc_dev_attr->serial_number = devm_kasprintf(dev, GFP_KERNEL, "%016llX%016llX",
> +							     soc_uid[1], soc_uid[0]);
> +	else
> +		soc_dev_attr->serial_number = devm_kasprintf(dev, GFP_KERNEL, "%016llX",
> +							     soc_uid[0]);
>  	if (!soc_dev_attr->serial_number)
>  		return -ENOMEM;
>  
> 
> -- 
> 2.37.1
> 
> 
