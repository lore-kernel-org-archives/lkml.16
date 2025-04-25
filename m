Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8DFA2701D7
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 06:12:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745561548; cv=none; b=sx+wf4cl74ljliF/rhK8y2yUVB6J/gZyZt9E+QpRsQUU9+mWrgF/s+C5pHSUL3qGt8TQc8sdKxXRBXJiImwxdN9wUSiorVN/+ntIxaQ5ZIKM0PMPxhVoI/NcQWuVJ9RRAWXd5/kCn0jGqE63rqVccO3ijMw9jOD18iktETapAEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745561548; c=relaxed/simple;
	bh=/nG4vNyP1COCiNOBKO3nrVUdbDkroVg1evrUeQmwSwk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZeLQS1bW4rMBRf+GsYqL0NWwQJsEEJa0yXkZCk8CpMP2TQo6BdjQ9HVOygj5h3MhToAeJO5HvkXDFgpYsvLFHejYOifDt5M/hnqv6r6hByWdj2S+tOsLzlU0onDHMzCcXXQrRi9lIK6l8YzNGdC4zb9cNll6+MJkfoVQAOfj4C0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=pdY9ofal; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="pdY9ofal"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1745561543;
	bh=/nG4vNyP1COCiNOBKO3nrVUdbDkroVg1evrUeQmwSwk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=pdY9ofalToAHJECOkQcTKUweBtDNNM6Az4/arBlM9Lofq+JgU/FTuva62TzDFmFwf
	 u47nh4ZO33wnYoDvrLZAm7vNAIHvHSFrdyXTOdcu8dfDxTSoti1EIMa96U3YY8FZU8
	 LADZ+vMUCgpgLu/SKZcn9qWOgtaNG3hIH1Ce7kn5MoJGHbI8d8oyW0JYlyWcPhk+gC
	 gBstkCAdT+z1Mkt65fEyWIB6keZ1D+KWpsWR3FsfXqdkvte76qRH3JvkIEDKk+c1gA
	 ZbVq4b1UrmMYvU0knUWYsN7MlKAxIrNiRLEGLwRCM9ijvnPNiedXZMqUST/yK7tXTW
	 Ydo2fgrAPNMbg==
Received: from [192.168.1.90] (unknown [82.76.59.226])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7935F17E0808;
	Fri, 25 Apr 2025 08:12:23 +0200 (CEST)
Message-ID: <eb1f0bf7-3827-488e-925f-18c8fee9b1a2@collabora.com>
Date: Fri, 25 Apr 2025 09:12:22 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] phy: phy-rockchip-samsung-hdptx: Fix PHY PLL output
 50.25MHz error
To: Algea Cao <algea.cao@rock-chips.com>, vkoul@kernel.org,
 kishon@kernel.org, heiko@sntech.de, andy.yan@rock-chips.com
Cc: linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250425023720.3296069-1-algea.cao@rock-chips.com>
Content-Language: en-US
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <20250425023720.3296069-1-algea.cao@rock-chips.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Algea,

On 4/25/25 5:37 AM, Algea Cao wrote:
> When using HDMI PLL frequency division coefficient at 50.25MHz
> that calculated by rk_hdptx_phy_clk_pll_calc(), it is failed to

s/that/that is/
s/is failed/it fails/

> get PHY LANE lock. Although the calculated values are within the
> allowable range of PHY PLL configuration.
> 
> So we manually calculated PHY PLL frequency division coefficient
> at 50.25Mhz and added it to ropll_tmds_cfg. Manually calculated
> value  can make PHY LANE lock normally and output 50.25MHz normally.

I'd reword this paragraph using imperative sentences, e.g.:

In order to fix the PHY LANE lock error and provide the expected
50.25MHz output, manually compute the required PHY PLL frequency
division coefficient and add it to ropll_tmds_cfg configuration table.

> Signed-off-by: Algea Cao <algea.cao@rock-chips.com>
> ---
>  drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c b/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
> index fe7c05748356..77236f012a1f 100644
> --- a/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
> +++ b/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
> @@ -476,6 +476,8 @@ static const struct ropll_config ropll_tmds_cfg[] = {
>  	  1, 1, 0, 0x20, 0x0c, 1, 0x0e, 0, 0, },
>  	{ 650000, 162, 162, 1, 1, 11, 1, 1, 1, 1, 1, 1, 1, 54, 0, 16, 4, 1,
>  	  1, 1, 0, 0x20, 0x0c, 1, 0x0e, 0, 0, },
> +	{ 502500, 84, 84, 1, 1, 7, 1, 1, 1, 1, 1, 1, 1, 11, 1, 4, 5,
> +	  4, 11, 1, 0, 0x20, 0x0c, 1, 0x0e, 0, 0, },
>  	{ 337500, 0x70, 0x70, 1, 1, 0xf, 1, 1, 1, 1, 1, 1, 1, 0x2, 0, 0x01, 5,
>  	  1, 1, 1, 0, 0x20, 0x0c, 1, 0x0e, 0, 0, },
>  	{ 400000, 100, 100, 1, 1, 11, 1, 1, 0, 1, 0, 1, 1, 0x9, 0, 0x05, 0,

With the above fixed,

Reviewed-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>

Thanks,
Cristian
