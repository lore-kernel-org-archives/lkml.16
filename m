Received: from smtp.smtpout.orange.fr (smtp-76.smtpout.orange.fr [80.12.242.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CD611B4F17;
	Sun,  2 Feb 2025 09:04:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738487083; cv=none; b=AM5HSXqMNLF3fjmE/Ug6AU4ndcP8TGgfIkP4w02so1nc5GWYnm8mbTzwNRYKSNLZi5hDK+MwoKwvFV5AfVUFKfPqtKoiulppv9dOtqY0v9fPmttjeQbTV4FXmPiZadCZIlY9Tqz4XqAhhgV1hiupndDpo5BEp4QRA2vQIUHmY+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738487083; c=relaxed/simple;
	bh=dyO+oOLpmbRKffw0QmVICfdOqy1U06HUhhqD8KClRxo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=poSeB5oeIYvTP6XPYZfzBzBV7QuqGyukipeX6/Xj+K+Z/F6KxngW9n4wgSjjcrSmwcUnTjlBtYrkx6pGynUSS723RTW+kqwTl/l+4ksUTU2GvKzT4sHZmyLtZUlcK4X55Xk3n2jAWKZlFUJijGXI/3Fwp2rdEwlA3MHwGMhrCEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=ONl1dZ8E; arc=none smtp.client-ip=80.12.242.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="ONl1dZ8E"
Received: from [192.168.1.37] ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id eVtytmLlOJkroeVu2tTSNQ; Sun, 02 Feb 2025 10:04:32 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1738487072;
	bh=sZBSp4l8TaYQbbpAeeyk8Mb3Y59RuO3+HThMa8fdvss=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=ONl1dZ8E1bTZ9viQhIuJ1pQUb7MTmrSs6Hy8KzQ9NXmvVe3gI4u2BXh3Wuj5HmIE4
	 hQKnH56s5IB0AfpgvLG49EVXA16w/nFNkxL9WnTJy4xPd4AuP6og86Bu2CqNLh71UD
	 +hd/ZZTq97tsD0rvhOXZ+Ws54cXIAbTpLqSwtVnGB1+CxIgD9eHzn8LrJTbtw/GNRn
	 0PNejG/xfjxbI1EPvhA2EcqgLTxmjbsevI5GzRq9B+13WmgApmWZ3yZoqI72iiIOU7
	 iW+IEqWX3FLQpnhKBPWGqvdkHITB+MVty3aWrKuumF+jQQ4zXUH266N3SYJ4NLVUHV
	 YeMxMxm0Ff7MA==
X-ME-Helo: [192.168.1.37]
X-ME-Auth: bWFyaW9uLmphaWxsZXRAd2FuYWRvby5mcg==
X-ME-Date: Sun, 02 Feb 2025 10:04:32 +0100
X-ME-IP: 90.11.132.44
Message-ID: <7d9c2a9b-dfa9-40c3-8d34-92c40cea0842@wanadoo.fr>
Date: Sun, 2 Feb 2025 10:04:26 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/2] nvmem: imx-ocotp-ele: Support accessing controller
 for i.MX9
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: alexander.stein@ew.tq-group.com, conor+dt@kernel.org,
 devicetree@vger.kernel.org, festevam@gmail.com, imx@lists.linux.dev,
 kernel@pengutronix.de, krzk+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 peng.fan@nxp.com, robh@kernel.org, s.hauer@pengutronix.de,
 shawnguo@kernel.org, srinivas.kandagatla@linaro.org
References: <20250202-imx-ocotp-v7-0-5622ba16451d@nxp.com>
 <20250202-imx-ocotp-v7-2-5622ba16451d@nxp.com>
Content-Language: en-US, fr-FR
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <20250202-imx-ocotp-v7-2-5622ba16451d@nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Le 02/02/2025 à 01:49, Peng Fan (OSS) a écrit :
> From: Peng Fan <peng.fan-3arQi8VN3Tc@public.gmane.org>
> 
> i.MX9 OCOTP supports a specific peripheral or function being fused
> which means disabled, so
>   - Introduce ocotp_access_gates to be container of efuse gate info
>   - Iterate all nodes to check accessing permission. If not
>     allowed to be accessed, detach the node
...

> +struct access_gate {
> +	u32 word;
> +	u32 mask;
> +};
> +
> +struct ocotp_access_gates {
> +	u32 num_words;
> +	u32 words[OCOTP_MAX_NUM_GATE_WORDS];
> +	u32 num_gates;
> +	struct access_gate *gates;

Could be const.

> +};
> +
>   struct imx_ocotp_priv {
>   	struct device *dev;
>   	void __iomem *base;

...

> +
> +	return imx_ele_ocotp_access_control(priv);
>   }
>   
> +struct access_gate imx93_access_gate[] = {

Could be static const.

> +		[IMX93_OCOTP_NPU_GATE]		= { .word = 19, .mask = BIT(13) },
> +		[IMX93_OCOTP_A550_GATE]		= { .word = 19, .mask = BIT(14) },
> +		[IMX93_OCOTP_A551_GATE]		= { .word = 19, .mask = BIT(15) },

...

> @@ -183,7 +308,53 @@ static const struct ocotp_devtype_data imx93_ocotp_data = {
>   	},
>   };
>   
> +struct access_gate imx95_access_gate[] = {

Could be static const.

> +		[IMX95_OCOTP_CANFD1_GATE]	= { .word = 17, .mask = BIT(20) },
> +		[IMX95_OCOTP_CANFD2_GATE]	= { .word = 17, .mask = BIT(21) },
> +		[IMX95_OCOTP_CANFD3_GATE]	= { .word = 17, .mask = BIT(22) },

...

CJ


