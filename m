Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62B782550D2;
	Thu,  8 May 2025 08:25:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746692732; cv=none; b=RPkPHj5iqxOEQrFxXQjKO9G0KR7Zr+l57bQFZORq7yFJkJBnLhQ9LS1xV/fX4YrxD4i5Rg+dtZpPKx9sOIeK061nvP6HAUbySEC/pk/SoNcVsnQzsAiuqLoK8UOcmOxFUnjCZkgTyVfH2OJmggsDMa/hSI0EkAMHDaGSGms7ZLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746692732; c=relaxed/simple;
	bh=X8K9aCfgxVUPIc1Nk89pKNYOpdNIKQWAwjZlX/4fHuI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=huXcxn2If4aUhF+6CBp5Cl25/bX7NX09ABryYNBco+cn0QPlIzYteu74zrspwq4S7eTK62uI+X7Jttyks6J0o3vqyZFw6EwtrezaeM1mxTe+poTYycVQQ1kagGjCDP0vP4ruuhWMd4gDXUHibn4Rn3IHw4r+++sqYFowjbVs9fE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=bK7yllse; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="bK7yllse"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1746692728;
	bh=X8K9aCfgxVUPIc1Nk89pKNYOpdNIKQWAwjZlX/4fHuI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=bK7yllseP/OemvHwWrRiVJohhF767V7j55lg8o4Jv6l17DHqOBHoAhokjUC9qmZLl
	 tJSQ4zf2AIGQCV87TC0U/7z8EPSPpXQiEVXUtUWgD/y+v1MGvubHRqcAd60v9MAsvE
	 oLS+BZEIV/4obG6mF+DevW459GErxDSnM8bbCTG1sJ3T2z5xjv3WBrkPCTyWz7l6nN
	 HOsjDfQ6+KkgIRCnMsSuidXQTGTPlhhn1n6gaSN/FlpjJBJEShjYnwU0SI2UPY8+iw
	 geT0qj7so72G2Lkw2XpK8TLugpFBHBMQyDGml4653iFCDPZlVMWYBThArtrHji3Pdw
	 e1RODhPsufHiw==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 90BC717E02BE;
	Thu,  8 May 2025 10:25:27 +0200 (CEST)
Message-ID: <4b12cb42-a1fc-4687-a5d0-07c2c822d778@collabora.com>
Date: Thu, 8 May 2025 10:25:27 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: mediatek: mt8188-mt6359: Depend on MT6359_ACCDET
 set or disabled
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Zoran Zhan <zoran.zhan@mediatek.com>, Arnd Bergmann <arnd@arndb.de>
Cc: kernel@collabora.com, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Arnd Bergmann <arnd@kernel.org>
References: <20250507-mt8188-mt6359-accdet-depend-v1-1-aad70ce62964@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250507-mt8188-mt6359-accdet-depend-v1-1-aad70ce62964@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Il 07/05/25 22:14, Nícolas F. R. A. Prado ha scritto:
> Commit 0116a7d84b32 ("ASoC: mediatek: mt6359: Add stub for
> mt6359_accdet_enable_jack_detect") added a stub for
> mt6359_accdet_enable_jack_detect() in order to allow the mt8188-mt6359
> driver to be enabled without requiring the mt6359-accdet to also be
> enabled, since it is not always needed.
> 
> However, in the case that CONFIG_SND_SOC_MT8188_MT6359=y and
> CONFIG_SND_SOC_MT6359_ACCDET=m, a link error will happen, which commit
> b19fa45715ce ("ASoC: mediatek: mt8188-mt6359: select
> CONFIG_SND_SOC_MT6359_ACCDET") solved by selecting
> CONFIG_SND_SOC_MT6359_ACCDET.
> 
> In order to not require CONFIG_SND_SOC_MT6359_ACCDET as originally
> intended, but also prevent the link error, depend on ACCDET being
> enabled or disabled (which will force MT8188_MT6359=m if
> MT6359_ACCDET=m).
> 
> Fixes: f35d834d67ad ("ASoC: mediatek: mt8188-mt6359: Add accdet headset jack detect support")
> Fixes: b19fa45715ce ("ASoC: mediatek: mt8188-mt6359: select CONFIG_SND_SOC_MT6359_ACCDET")
> Suggested-by: Arnd Bergmann <arnd@kernel.org>
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


