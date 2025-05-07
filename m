Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB18D1D9346;
	Wed,  7 May 2025 19:31:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746646301; cv=none; b=cVK+xb2vrbumFnOS5+3ZM2Vca04t1pYsr6ANJo5xB05CgIGBU6+wIHvZwah00qq4AJVW24xwpn/eu3nFr1vG/A4hMJxMheE3TNZ6NIIEuXr0noXXpi9R2o9GLI7fiug2+Od81ieymbl/2lGMR0M1yc6xLr2Wm1xVRxrxppL1RCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746646301; c=relaxed/simple;
	bh=XkT3rf/GhFkQ/rhyKTyqEyqJNDGvu/1GzX9MJDAJu64=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OYDGpw9WBU3/fucJqrX/RvC+QAlSOQ9rivLM79WhRIfH22QSPB10A6KaBMnovo/9COnjFUHh1UccsBWe6blFb0HUGdz02tihTJLG8z1/FJnZ48X6mj4p2/FaCMrEl9wHhNQV4emxmrUD7ZydhfZ5SqKUClydJM1+zhMUPvFxcKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=m+buex5R; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="m+buex5R"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1746646297;
	bh=XkT3rf/GhFkQ/rhyKTyqEyqJNDGvu/1GzX9MJDAJu64=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=m+buex5RPLqc5Lxi+5UspQuvlsrpHUCgfknhkggqX56fSWjdqwBNQemBl+XLqGlNx
	 T9ajjjib1yET3HT2K6UZs0EaU3SxQPlhqtRnBte3crUksQL+6QRLMLBz9lHmwUY4v6
	 IyAPxzdMR5aiMRlJTFEOxHUwJMznAIrFl4EgAd9RUDpSi6hgyMUDs4ok0pDQcdOMwV
	 dnHCVaUZ6aYQ3K5V6apNvxzzLFp6+QgFjQeIAaSUsA3qraAx6IZyhqiRr4avwTWAWH
	 yTqd8Ym24aUYBQfQF9FENZ8whUsdWyMt7K/GgVoSBjIihkX+d4SX+Y4AA1jF/TOaw4
	 2sU1W6+UAP80g==
Received: from notapiano (unknown [70.107.117.78])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C2A4917E04C0;
	Wed,  7 May 2025 21:31:34 +0200 (CEST)
Date: Wed, 7 May 2025 15:31:32 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Arnd Bergmann <arnd@kernel.org>, Mark Brown <broonie@kernel.org>,
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
Message-ID: <5e45cf78-ea88-4a93-83e6-9022feed0421@notapiano>
References: <20250505052106.1811802-1-arnd@kernel.org>
 <d9642581-3fed-47d8-9661-4335ec1e9c27@notapiano>
 <86a3a0ab-be37-4b4d-a5a5-32d09c1a75ce@app.fastmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <86a3a0ab-be37-4b4d-a5a5-32d09c1a75ce@app.fastmail.com>

On Wed, May 07, 2025 at 07:10:54PM +0200, Arnd Bergmann wrote:
> On Wed, May 7, 2025, at 18:41, Nícolas F. R. A. Prado wrote:
> > On Mon, May 05, 2025 at 07:20:52AM +0200, Arnd Bergmann wrote:
> >> From: Arnd Bergmann <arnd@arndb.de>
> >> 
> >> The driver support was added without selecting the codec, which leads to
> >> a link failure:
> >> 
> >> aarch64-linux-ld: sound/soc/mediatek/mt8188/mt8188-mt6359.o: in function `mt8188_mt6359_init':
> >> mt8188-mt6359.c:(.text+0x19f0): undefined reference to `mt6359_accdet_enable_jack_detect'
> >
> > Hm, I cannot seem to reproduce this. I just tried to build on today's next with
> > CONFIG_SND_SOC_MT6359_ACCDET disabled and have tried
> > CONFIG_SND_SOC_MT8188_MT6359 both =m and =y, but in both cases it compiles fine.
> 
> The config that failed for me had CONFIG_SND_SOC_MT6359_ACCDET.
> 
> > I wonder if somehow your tree was missing "ASoC: mediatek: mt6359: Add stub for
> > mt6359_accdet_enable_jack_detect" [1]
> 
> > https://lore.kernel.org/all/20250306-mt8188-accdet-v3-3-7828e835ff4b@collabora.com/
> 
> I had not seen that patch, but with that applied, my patch needs to
> be revised as well. If the idea is that CONFIG_SND_SOC_MT8188_MT6359
> can work correctly without CONFIG_SND_SOC_MT6359_ACCDET, it should be
> 
>       depends on SND_SOC_MT6359_ACCDET || !SND_SOC_MT6359_ACCDET
> 
> in order to force SND_SOC_MT8188_MT6359=m if the ACCDET portion
> is in a loadable module.

Ah indeed, that's it. The stub was added to allow MT8188_MT6359 to work without 
ACCDET, but we still need to prevent the MT8188_MT6359=y and ACCDET=m case, like
you suggest. I can send that patch right away.

Thanks,
Nícolas
