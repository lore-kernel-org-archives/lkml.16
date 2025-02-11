Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97CB2250BE4
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 14:50:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739285412; cv=none; b=KWOaMuooNC/ek0nxM4NbHQWcpO1FPDgM4bjCkSDsWboiP4w2yhVr5WliuVWJy96/6rk2qgBMNqEPs0CGkUGWg4nnQQCHCFtws07AmEO/D2xDUxZhhkegaKQqFHCj/bCXFbbPjCuv5/Ve+n6z5KSJv/0IE/5g+4HKXG1IwRF3hFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739285412; c=relaxed/simple;
	bh=eJFTfdQAsK7kOdhotwhb8vYaouQUuCRznRhtGA/0hxM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=D6muPkIxRcMLhmBubbWSEc+H7UWN7iL5L4/WyLr8WJWqUCwzVcKpqYqxUD36+M2TMCjDih6YXGVefmAfzEDJeRf1pWf3d3Hq31FtYsGmET2BxbohXFAxLriUnLM/6GRalupMWeIN6SWbhjB//IcVO1fmgX+POwUZxo+xq8hrYEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=KBjzOrkg; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="KBjzOrkg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1739285407;
	bh=eJFTfdQAsK7kOdhotwhb8vYaouQUuCRznRhtGA/0hxM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=KBjzOrkggzWe2k8B4SoQGWxG5e1WFOkHY1tqM9jC2N5S+zR3os2oxN5pCeOAfCxPv
	 HnNAaA1IWmMDuTuc2UofQN/rj3h/kqg1o+3mZC0Zq9B4PGEUXpTsAZNkNZce3Ya3O3
	 uzvHXwp8b1MqjGTjS0P961b3a/TsfQ1XcsrpJ3or23M5ZNVYj6WAmDzlahmQ5XK41D
	 8hQL8/+EhExZw2rKricxTzKoY6O99+ocop6AY8wQsGqzQ7LkDpWyaSEKo8sq+eT4FR
	 5idx3yAaimqmfk22UqKCyG12bT84q/pXdOT1dZxEz4jElqvCtqNEorRNhIqMA50QZl
	 zSyTSBZg/ZQFA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 417B217E0CA2;
	Tue, 11 Feb 2025 15:50:07 +0100 (CET)
Message-ID: <bd1704a5-5504-4bb9-af6a-37c2849508a8@collabora.com>
Date: Tue, 11 Feb 2025 15:50:06 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mfd: syscon: Restore device_node_to_regmap() for
 non-syscon nodes
To: "Rob Herring (Arm)" <robh@kernel.org>, Lee Jones <lee@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Pankaj Dubey <pankaj.dubey@samsung.com>
Cc: Will McVicker <willmcvicker@google.com>,
 John Madieu <john.madieu.xa@bp.renesas.com>, Nishanth Menon <nm@ti.com>,
 Vaishnav Achath <vaishnav.a@ti.com>, linux-kernel@vger.kernel.org
References: <20250124191644.2309790-1-robh@kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250124191644.2309790-1-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 24/01/25 20:16, Rob Herring (Arm) ha scritto:
> Commit ba5095ebbc7a ("mfd: syscon: Allow syscon nodes without a
> "syscon" compatible") broke drivers which call device_node_to_regmap()
> on nodes without a "syscon" compatible. Restore the prior behavior for
> device_node_to_regmap().
> 
> This also makes using device_node_to_regmap() incompatible with
> of_syscon_register_regmap() again, so add kerneldoc for
> device_node_to_regmap() and syscon_node_to_regmap() to make it clear
> how and when each one should be used.
> 
> Fixes: ba5095ebbc7a ("mfd: syscon: Allow syscon nodes without a "syscon" compatible")
> Cc: Will McVicker <willmcvicker@google.com>
> Cc: John Madieu <john.madieu.xa@bp.renesas.com>
> Cc: Nishanth Menon <nm@ti.com>
> Reported-by: Vaishnav Achath <vaishnav.a@ti.com>
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

...and tested on

Radxa NIO 12L (MT8395/8195), MediaTek Genio 700 EVK (MT8390/MT8188), and on
MT8195 Tomato Chromebook

Tested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> ---
>   drivers/mfd/syscon.c | 29 ++++++++++++++++++++++++++---
>   1 file changed, 26 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/mfd/syscon.c b/drivers/mfd/syscon.c
> index 226915ca3c93..aa4a9940b569 100644
> --- a/drivers/mfd/syscon.c
> +++ b/drivers/mfd/syscon.c
> @@ -159,6 +159,7 @@ static struct syscon *of_syscon_register(struct device_node *np, bool check_res)
>   }
>   
>   static struct regmap *device_node_get_regmap(struct device_node *np,
> +					     bool create_regmap,
>   					     bool check_res)
>   {
>   	struct syscon *entry, *syscon = NULL;
> @@ -172,7 +173,7 @@ static struct regmap *device_node_get_regmap(struct device_node *np,
>   		}
>   
>   	if (!syscon) {
> -		if (of_device_is_compatible(np, "syscon"))
> +		if (create_regmap)
>   			syscon = of_syscon_register(np, check_res);
>   		else
>   			syscon = ERR_PTR(-EINVAL);
> @@ -233,15 +234,37 @@ int of_syscon_register_regmap(struct device_node *np, struct regmap *regmap)
>   }
>   EXPORT_SYMBOL_GPL(of_syscon_register_regmap);
>   
> +/**
> + * device_node_to_regmap() - Get or create a regmap for specified device node
> + * @np: Device tree node
> + *
> + * Get a regmap for the specified device node. If there's not an existing
> + * regmap, then one is instantiated. This function should not be used if the
> + * device node has a custom regmap driver or has resources (clocks, resets) to
> + * be managed. Use syscon_node_to_regmap() instead for those cases.
> + *
> + * Return: regmap ptr on success, negative error code on failure.
> + */
>   struct regmap *device_node_to_regmap(struct device_node *np)
>   {
> -	return device_node_get_regmap(np, false);
> +	return device_node_get_regmap(np, true, false);
>   }
>   EXPORT_SYMBOL_GPL(device_node_to_regmap);
>   
> +/**
> + * syscon_node_to_regmap() - Get or create a regmap for specified syscon device node
> + * @np: Device tree node
> + *
> + * Get a regmap for the specified device node. If there's not an existing
> + * regmap, then one is instantiated if the node is a generic "syscon". This
> + * function is safe to use for a syscon registered with
> + * of_syscon_register_regmap().
> + *
> + * Return: regmap ptr on success, negative error code on failure.
> + */
>   struct regmap *syscon_node_to_regmap(struct device_node *np)
>   {
> -	return device_node_get_regmap(np, true);
> +	return device_node_get_regmap(np, of_device_is_compatible(np, "syscon"), true);
>   }
>   EXPORT_SYMBOL_GPL(syscon_node_to_regmap);
>   

