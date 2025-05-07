Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA57028A73F;
	Wed,  7 May 2025 16:41:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746636095; cv=none; b=E5dl6OUHOFs9gHpX9Xzcv7C2B/4jK3FFa0uTDbBmTz4WSreOYqy4wi0qVfIy2YjvRnDo1aKvCesLe/lMC7nltEOr+NTuY4FLgrXz3ZMRQeIPtkxgxQ4yL8BcO3gn9XA/hezbo4EHJXcKi5+zK1wp/z+2zL2wC9/op08E7rfUZAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746636095; c=relaxed/simple;
	bh=iu4DqH0BiPBmHQ3Yxxgy5dmtT9CVDW/JTaBvXtsoyVM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BjCLn1s7Fj23xlBdDLCHX8uTiAi1/+IITRJuWwJCgIrYGlogDpktoBsywQ/De0/SbMZ9f4HbtJBAgZ7I1F9HPZyruEUlAZ1AewgKQGRO5IcHDXC/W1Zmpv5iipeG7LbIWDp4WjCEIWYxw8rQga7kRrx6nMvQepW6jygN4voh7rU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=WqmJ7wZC; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="WqmJ7wZC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1746636091;
	bh=iu4DqH0BiPBmHQ3Yxxgy5dmtT9CVDW/JTaBvXtsoyVM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WqmJ7wZCGoPV75a1CSt5fFVV8hrvOqfCXQ0JPVfKoPTPhbHeRx4CnRdrVacfFgkw6
	 ZyBkuUrakoPGIFob+t4tXeZF0bqBAR0RcoqSw6Lxl4LeFkHhIcZePw8nJUW037Q0l9
	 +XYqQGkw0UHbU5S80EWBf/miDl1sTjzjwfLTVt4PuE6NyAXbWIIfrYjhUtxERDpUEI
	 +wNcJ8nnwgIUgcGoWK52d/XXRG8e6n05o3z+UvAgOA8x93+GfjpOERpguPMLhmvj37
	 dD+3TVjgDSNCoEVQHqicrGFRCMBWH7i3EqXSMya3BBb6oIRG5Q2O+HSnD5lpo19NZ4
	 flhNyI2SI20kA==
Received: from notapiano (unknown [70.107.117.78])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id BEA5417E04C0;
	Wed,  7 May 2025 18:41:29 +0200 (CEST)
Date: Wed, 7 May 2025 12:41:27 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Alexandre Mergnat <amergnat@baylibre.com>,
	Zoran Zhan <zoran.zhan@mediatek.com>, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] ASoC: mediatek: mt8188-mt6359: select
 CONFIG_SND_SOC_MT6359_ACCDET
Message-ID: <d9642581-3fed-47d8-9661-4335ec1e9c27@notapiano>
References: <20250505052106.1811802-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250505052106.1811802-1-arnd@kernel.org>

On Mon, May 05, 2025 at 07:20:52AM +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The driver support was added without selecting the codec, which leads to
> a link failure:
> 
> aarch64-linux-ld: sound/soc/mediatek/mt8188/mt8188-mt6359.o: in function `mt8188_mt6359_init':
> mt8188-mt6359.c:(.text+0x19f0): undefined reference to `mt6359_accdet_enable_jack_detect'

Hm, I cannot seem to reproduce this. I just tried to build on today's next with
CONFIG_SND_SOC_MT6359_ACCDET disabled and have tried
CONFIG_SND_SOC_MT8188_MT6359 both =m and =y, but in both cases it compiles fine.

I wonder if somehow your tree was missing "ASoC: mediatek: mt6359: Add stub for
mt6359_accdet_enable_jack_detect" [1], or if it's due to a difference in
compiler versions used...

(I'm using gcc-linaro-12.3.1-2023.06-x86_64_aarch64-linux-gnu)

Thanks,
Nícolas

[1] https://lore.kernel.org/all/20250306-mt8188-accdet-v3-3-7828e835ff4b@collabora.com/

> 
> Fixes: f35d834d67ad ("ASoC: mediatek: mt8188-mt6359: Add accdet headset jack detect support")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  sound/soc/mediatek/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/sound/soc/mediatek/Kconfig b/sound/soc/mediatek/Kconfig
> index 3033e2d3fe16..e148d4d94160 100644
> --- a/sound/soc/mediatek/Kconfig
> +++ b/sound/soc/mediatek/Kconfig
> @@ -229,6 +229,7 @@ config SND_SOC_MT8188_MT6359
>  	tristate "ASoC Audio driver for MT8188 with MT6359 and I2S codecs"
>  	depends on SND_SOC_MT8188 && MTK_PMIC_WRAP
>  	depends on I2C
> +	select SND_SOC_MT6359_ACCDET
>  	select SND_SOC_MT6359
>  	select SND_SOC_HDMI_CODEC
>  	select SND_SOC_DMIC
> -- 
> 2.39.5
> 
