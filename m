Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8713C171A1;
	Mon,  5 May 2025 07:30:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746430222; cv=none; b=KpJyvCjsPrBhLlA9oT1PVGF6MCd1h+6a9uJuqY5ZdamHSf2q/Kvy+wK1zMKYIpFn1aDyAECBaihH5gmUz80NKGobNrfJl64cxxi6HK1/aoe+Sa0tu8PbohFpTtVkfugLWHZ1grkbdQ0WogPXzYkj05EuGaxbT/y5U1ky6HhB98A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746430222; c=relaxed/simple;
	bh=9byBrgGiWivV4zXfCGyXLK7u6F5KMMq/Ap3brTL2r8E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=U/WfMm6Bg2q/zwQ6BYUu+Sl71C2kNKbeglo07w2UeKCn+oUmLvXu9UbCSv2KqDy+oR1U+TCXVmKTzbtPyj/GWpsJRcZJtMkHZJadcukygvzYxz4X+tbWK3uXClc7fgCDsgwSxfvxDaId5chIy8+O8IelFZWKCnMKISvfAkNIUnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=Xcz0r9Ny; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="Xcz0r9Ny"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1746429632;
	bh=9byBrgGiWivV4zXfCGyXLK7u6F5KMMq/Ap3brTL2r8E=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Xcz0r9Nyr/GBvTffACDxkAv0DCvVxl40GgqtQeif64zW1Jj1VKuW21++n/5L+CwcH
	 WwsLeAUQhz/pAjv0CSWKcU7esBvAb/PnjPRwW3HWWT66sGH1y/lT3HHHNN18sxHAi5
	 Q5rH3aDHLE22aoXPw49tTF1UfTC3AP57J/mAOvWopAdLWN9Kx3Qhcg5b2qd7tbFeuD
	 T9YlnGDey09aUkqj+0axPC7knUJh2m+neJ4fKnOKV25W92xM7w9i9FU6aECdSl7/cX
	 ZI8HLcMMcMhc+TuKfrn3QGt+7DIHhqTQDmYBvphkcby/PAdUsDQHOM1Z0oVHWckqlu
	 gvJrP+TM/SUnw==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 6A81517E0F89;
	Mon,  5 May 2025 09:20:31 +0200 (CEST)
Message-ID: <97b93862-8572-45fb-ba02-96a0bb747700@collabora.com>
Date: Mon, 5 May 2025 09:20:30 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: mediatek: mt8188-mt6359: select
 CONFIG_SND_SOC_MT6359_ACCDET
To: Arnd Bergmann <arnd@kernel.org>, Mark Brown <broonie@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Liam Girdwood <lgirdwood@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Alexandre Mergnat <amergnat@baylibre.com>,
 Zoran Zhan <zoran.zhan@mediatek.com>,
 =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20250505052106.1811802-1-arnd@kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250505052106.1811802-1-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 05/05/25 07:20, Arnd Bergmann ha scritto:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The driver support was added without selecting the codec, which leads to
> a link failure:
> 
> aarch64-linux-ld: sound/soc/mediatek/mt8188/mt8188-mt6359.o: in function `mt8188_mt6359_init':
> mt8188-mt6359.c:(.text+0x19f0): undefined reference to `mt6359_accdet_enable_jack_detect'
> 
> Fixes: f35d834d67ad ("ASoC: mediatek: mt8188-mt6359: Add accdet headset jack detect support")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


