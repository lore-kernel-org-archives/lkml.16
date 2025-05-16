Received: from smtp.smtpout.orange.fr (smtp-23.smtpout.orange.fr [80.12.242.23])
	(using TLSv1.2 with cipher AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD0751AF0AE;
	Fri, 16 May 2025 15:35:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.23
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747409726; cv=none; b=pzoEV7MelSVdqUeIJhMImeC0ju0T9czmnpEs7oOQNYO5qdeyfOvcSvt1v13Zjh943LxSO7/9swE4iixmCARqxbvk6BJqGMlecpNzMy/rCWqxvEwMfe6hhHQdEg2p7vuMCH7A0NJcIHqgqcVpzQ5zAGxU9+tLI0dAEsmQVYGbLPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747409726; c=relaxed/simple;
	bh=/U/nSb15E4ccps1g6g3HFA2uL8MksQyuiZhO0hZgBwY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eUAHet8b89SfW27Pv0DuF+xkdRnp7X+bB/ZON/+X5IY3No/5xvYz6jBAe7EcPSW2349zmA8R1lHDU5dgsx/7xiCgWIg+LsB3Jy43YAjyk9wu5R1J+zzB72BM8BdrKEUgtR6wA15rw0UKQIOtVaLnPAuhjg+O6zzncJNQINwSVqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=g85XleWb; arc=none smtp.client-ip=80.12.242.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="g85XleWb"
Received: from [192.168.1.37] ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id FwwhurcklA4O7FwwhuuZlc; Fri, 16 May 2025 17:26:03 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1747409163;
	bh=bjLIqRmqM8iATan66koGC4b1mSQGnkyDHRBUgumcFk4=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=g85XleWbkPpB980J6oB9JJ1sNnATa4gE3PW4WVxKrWLck3X2699CiaVuUNLNQe/nm
	 7FQBgLBu2xl6nVyM/vCGP2U8HF/FjTFhpG+ShHwkfn/OQQnZWYKKA0wp3hLOJA6c8L
	 FcFQ0JucHXB5I03prTBqbgTfHN1RAzG1GCK5NQZ4xOVtfdvLnDYygK5oIvawoNAyS+
	 9HWdjAaitCW6bLxVPQqYpUZ+bxR7N1CG7ba0NqLEPDJ5sk54tyHh2WKFj3YYjgbkAY
	 228r3OPLIwJ9ZbHyl6/V9h+BckjGv/hpFTqAvDLQTc0gzZVaT5SUjANVkzwsMw02YL
	 UIRTJPQIgc2Jw==
X-ME-Helo: [192.168.1.37]
X-ME-Auth: bWFyaW9uLmphaWxsZXRAd2FuYWRvby5mcg==
X-ME-Date: Fri, 16 May 2025 17:26:03 +0200
X-ME-IP: 90.11.132.44
Message-ID: <eb0b9f89-8c34-4d30-87bd-c4e631f5b1b7@wanadoo.fr>
Date: Fri, 16 May 2025 17:25:59 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] firmware: arm_scmi: Use dev_err_probe() simplify the code
To: long.yunjian@zte.com.cn, sudeep.holla@arm.com
Cc: cristian.marussi@arm.com, peng.fan@nxp.com, justin.chen@broadcom.com,
 florian.fainelli@broadcom.com, arm-scmi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 fang.yumeng@zte.com.cn, mou.yi@zte.com.cn, ouyang.maochun@zte.com.cn,
 xu.lifeng1@zte.com.cn
References: <20250515203855146Sn9x-Uw9Teur35mOjn41C@zte.com.cn>
Content-Language: en-US, fr-FR
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <20250515203855146Sn9x-Uw9Teur35mOjn41C@zte.com.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Le 15/05/2025 à 14:38, long.yunjian@zte.com.cn a écrit :
> From: Yumeng Fang <fang.yumeng@zte.com.cn>
> 
> In the probe path, dev_err() can be replaced with dev_err_probe()
> which will check if error code is -EPROBE_DEFER and prints the
> error name. It also sets the defer probe reason which can be
> checked later through debugfs.
> 
> Signed-off-by: Yumeng Fang <fang.yumeng@zte.com.cn>
> ---
>   drivers/firmware/arm_scmi/transports/mailbox.c | 17 +++++++----------
>   1 file changed, 7 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/firmware/arm_scmi/transports/mailbox.c b/drivers/firmware/arm_scmi/transports/mailbox.c
> index bd041c99b92b..816e79537935 100644
> --- a/drivers/firmware/arm_scmi/transports/mailbox.c
> +++ b/drivers/firmware/arm_scmi/transports/mailbox.c
> @@ -13,6 +13,7 @@
>   #include <linux/of_address.h>
>   #include <linux/platform_device.h>
>   #include <linux/slab.h>
> +#include <linux/dev_printk.h>
> 

includes are (mostly) alphabetically ordered right-now.
So, It would be better to keep this logic, IMHO.

CJ
