Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C75BC28689C;
	Fri,  4 Jul 2025 13:19:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751635147; cv=pass; b=IHJ3ivJkUhe4Drs8sC7mzXtzbrs6pa5FaBfHYseNN3v3/Nak2siBSpv6mij2Dtid8zuKfn/tbmV6WISVAAuy/8scmWjvE5nNh9kmT0Ch6EbJP3o0IMAO+njS+ruXiOoPG1ei1oaEEJHdAoOXxR0aRLsNX3uyqTyFU/srRNZV84U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751635147; c=relaxed/simple;
	bh=C4YyQnlRE7ntIlUvmRtJKM7QFSkKgE+XeKJxH5np7fs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=j/e9GkY21kp2AdNk+TKA40zd3/rTcTXLhX6tW+I82ykwJi+ocLFQmNLStjf6lw9cLbjrEUI++3WxXE76PmMDFBo5Zz3MO6Y6qj70U1GDW5KQhcOldpYjic51jpG7x+3JYzrZJv4dBQ/uV90+4Mf4jo1N+P2jZK0RnjwAbHFlxhc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b=cg7/kl1r; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="cg7/kl1r"
ARC-Seal: i=1; a=rsa-sha256; t=1751635119; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=VJZXZimEXZ4Fn6WgICDySN4ceF+3yIfRcSi3YVx7ntllMgF2muSetMKQCkAt3Ijsd1tg7YXxMGNkkWljFqnvLDjrMoeGYHDbd4i/8RBV3Z3npHJ5j25ROpTQ1Tmh0Zqen58cOvxWkC22eleAmadTHG5msmtVU7rQm9qTiaiHLzQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1751635119; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=rZIDPgdEPQCeWAs8+GXUC0qlYXmlPlQaUJsDotTrWB8=; 
	b=HTlyXO2Bzr8eZ6gAQGzvoGr8yz0fwzMSHsNwlxZShz1n/NAAUEn4JmmNy6dXDtimRQMqEjNsFb201Vi09xS6/7fZb+vgyd65wxqUCq+YqSR2nrlL+gOdiNM9+fw/HG7t/uLjUaKYVkojOzu9yxLU4N593mWdMSmtayhhPR1+KbY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1751635119;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
	bh=rZIDPgdEPQCeWAs8+GXUC0qlYXmlPlQaUJsDotTrWB8=;
	b=cg7/kl1rDLHribZIYTRsV2TRQycqUcvMHdXee3xrgBkKiM90PjnPJAxm/t7bUpNk
	uUM40cS1o/gCSTZrZVInEcSALRePaNUX6USx9TQABmdAlzcFUoYIVUCIl39D8/Z6Dba
	MoIYhi2tqXXAUytHUAV3y+9vTG3T6JPqkAnzLHc4=
Received: by mx.zohomail.com with SMTPS id 1751635117642477.38467772770343;
	Fri, 4 Jul 2025 06:18:37 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Heiko Stuebner <heiko@sntech.de>,
 "open list:ROCKCHIP SAI DRIVER" <linux-rockchip@lists.infradead.org>,
 "open list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <linux-sound@vger.kernel.org>,
 "moderated list:ARM/Rockchip SoC support"
 <linux-arm-kernel@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>, Peng Fan <peng.fan@nxp.com>
Cc: linus.walleij@linaro.org, brgl@bgdev.pl, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH] ASoC: codec: rockchip_sai: Remove including of_gpio.h
Date: Fri, 04 Jul 2025 15:18:32 +0200
Message-ID: <5011203.GXAFRqVoOG@workhorse>
In-Reply-To: <20250704130906.1207134-1-peng.fan@nxp.com>
References: <20250704130906.1207134-1-peng.fan@nxp.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

On Friday, 4 July 2025 15:09:06 Central European Summer Time Peng Fan wrote:
> of_gpio.h is deprecated. And there is no user in this driver
> using API in of_gpio.h, so remove it.
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  sound/soc/rockchip/rockchip_sai.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/sound/soc/rockchip/rockchip_sai.c b/sound/soc/rockchip/rockchip_sai.c
> index 0b9f54102d69..6695349ee561 100644
> --- a/sound/soc/rockchip/rockchip_sai.c
> +++ b/sound/soc/rockchip/rockchip_sai.c
> @@ -9,7 +9,6 @@
>  #include <linux/module.h>
>  #include <linux/mfd/syscon.h>
>  #include <linux/delay.h>
> -#include <linux/of_gpio.h>
>  #include <linux/of_device.h>
>  #include <linux/clk.h>
>  #include <linux/pm_runtime.h>
> 

Acked-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>

Thanks!

Kind regards,
Nicolas Frattaroli



