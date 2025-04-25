Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E74C76026
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 01:32:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745544771; cv=none; b=g0By5dWs3Y7PEZdGRkswRbVXmgCNiE4uTQQ9iXzIBLnJczt3SN+3d32y6ZifwSva8ypFoV/qTLbvPBh6sAdq3FGoM5aSvN4RLl/JjDEU6fc6wDHGYUH4FHZ55dLLWbKxtrynKvWnYVsnCOgUUjiCjBCX8hG+Kl1k6/UNcoQC52I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745544771; c=relaxed/simple;
	bh=dnJXG3LMrwipMLRepbBfhx8FqWsb9/eFY8UQ6DFN59Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=kwBCb2zIkECK+EjgBP3aADo4IkheIXbbeDBkNeO3Js/rzsH5WoxChk20PMPdqjIJOzFZMXeqAA2nz8pC3ypahTOlkS5T/6GnZoXaxtfgE0S0bDkpMAj8KceUaTc0DvV12vGpRKu6VEDi4lUupei3ynnwEi+g3Bac9g0BQ8xHc+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=om4JOWba; arc=none smtp.client-ip=198.47.23.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="om4JOWba"
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53P1WRab2803412
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 24 Apr 2025 20:32:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1745544747;
	bh=wIOxnoc70kR5bhgT0T/889MsOFpWtiefqaMQ7rtCI5w=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=om4JOWbaB4bHfy/HK4qUfxUfUAKAuABgqd4N2+FHNf5GcpDXdYsK7z6csD+oUek1g
	 7RwHbIxJ/4FNcyhYV1BIF4UbTshNA2EbmGoPh5ESsVnOXrUmCPfXck1e6zRQGuauRD
	 GriuAy9M4QxtmeyNnWXVoRECvoblWhwLILnuA0zk=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53P1WRpB000426
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 24 Apr 2025 20:32:27 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 24
 Apr 2025 20:32:26 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 24 Apr 2025 20:32:26 -0500
Received: from [10.249.141.75] ([10.249.141.75])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53P1WJse041608;
	Thu, 24 Apr 2025 20:32:20 -0500
Message-ID: <3f44ec0b-216c-4534-a6de-7b17929cb9e1@ti.com>
Date: Fri, 25 Apr 2025 07:02:18 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] drm/bridge: ti-sn65dsi86: Enable HPD functionality
To: Jayesh Choudhary <j-choudhary@ti.com>, <dianders@chromium.org>,
        <andrzej.hajda@intel.com>, <neil.armstrong@linaro.org>,
        <rfoss@kernel.org>, <Laurent.pinchart@ideasonboard.com>,
        <dri-devel@lists.freedesktop.org>, <tomi.valkeinen@ideasonboard.com>
CC: <jonas@kwiboo.se>, <jernej.skrabec@gmail.com>,
        <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
        <tzimmermann@suse.de>, <airlied@gmail.com>, <simona@ffwll.ch>,
        <linux-kernel@vger.kernel.org>, <u-kumar1@ti.com>
References: <20250424105432.255309-1-j-choudhary@ti.com>
Content-Language: en-US
From: "Kumar, Udit" <u-kumar1@ti.com>
In-Reply-To: <20250424105432.255309-1-j-choudhary@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Hello Jayesh,

On 4/24/2025 4:24 PM, Jayesh Choudhary wrote:
> For TI SoC J784S4, the display pipeline looks like:
> TIDSS -> CDNS-DSI -> SN65DSI86 -> DisplayConnector -> DisplaySink
> This requires HPD to detect connection form the connector.
> By default, the HPD is disabled for eDP. So enable it conditionally
> based on a new flag 'keep-hpd' as mentioned in the comments in the
> driver.
>
> Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
> ---
>
> Hello All,
>
> Sending this RFC patch to get some thoughts on hpd for sn65dsi86.
>
> Now that we have a usecase for hpd in sn65dsi86, I wanted to get
> some comments on this approach to "NOT DISABLE" hpd in the bridge.
> As the driver considers the eDP case, it disables hpd by default.
> So I have added another property in the binding for keeping hpd
> functionality (the name used is still debatable) and used it in
> the driver.
>
> Is this approach okay?
> Also should this have a "Fixes" tag?

>
>   .../bindings/display/bridge/ti,sn65dsi86.yaml      |  6 ++++++
>   drivers/gpu/drm/bridge/ti-sn65dsi86.c              | 14 +++++++++-----
>   2 files changed, 15 insertions(+), 5 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.yaml b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.yaml
> index c93878b6d718..5948be612849 100644
> --- a/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.yaml
> +++ b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.yaml
> @@ -34,6 +34,12 @@ properties:
>         Set if the HPD line on the bridge isn't hooked up to anything or is
>         otherwise unusable.
>   
> +  keep-hpd:
> +    type: boolean
> +    description:
> +      HPD is disabled in the bridge by default. Set it if HPD line makes
> +      sense and is used.
> +

Here are my suggestions

1) use interrupt in binding as optional instead of keep-hpd

2) use interrupt field (if present to enable of disable HPD functions in 
driver)


>     vccio-supply:
>       description: A 1.8V supply that powers the digital IOs.
>   
> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> index f72675766e01..4081cc957c6c 100644
> --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> @@ -191,6 +191,7 @@ struct ti_sn65dsi86 {
>   	u8				ln_polrs;
>   	bool				comms_enabled;
>   	struct mutex			comms_mutex;
> +	bool				keep_hpd;
>   
>   #if defined(CONFIG_OF_GPIO)
>   	struct gpio_chip		gchip;
> @@ -348,12 +349,15 @@ static void ti_sn65dsi86_enable_comms(struct ti_sn65dsi86 *pdata,
>   	 * 200 ms.  We'll assume that the panel driver will have the hardcoded
>   	 * delay in its prepare and always disable HPD.
>   	 *
> -	 * If HPD somehow makes sense on some future panel we'll have to
> -	 * change this to be conditional on someone specifying that HPD should
> -	 * be used.
> +	 * If needed, use 'keep-hpd' property in the hardware description in
> +	 * board file as a conditional specifying that HPD should be used.
>   	 */
> -	regmap_update_bits(pdata->regmap, SN_HPD_DISABLE_REG, HPD_DISABLE,
> -			   HPD_DISABLE);
> +
> +	pdata->keep_hpd = of_property_read_bool(pdata->dev->of_node, "keep-hpd");
> +
> +	if (!pdata->keep_hpd)
> +		regmap_update_bits(pdata->regmap, SN_HPD_DISABLE_REG, HPD_DISABLE,
> +				   HPD_DISABLE);

you may want to extend interrupt support in this driver if HPD is enabled.


>   
>   	pdata->comms_enabled = true;
>   
