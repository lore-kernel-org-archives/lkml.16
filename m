Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D09A22DFB9;
	Thu, 17 Apr 2025 10:20:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744885233; cv=none; b=cHLGkVAh4PCoxzvLPW0qfxjerO7iKlC66zFMaVpaAdPGpD31NhF3zogiBYSjO6pZu3MGfimrShK6jk+niyk+I29jy8U3yMWT7J8bg5ZTOBIaHNaRLAfRqxXwPCEbEu3U2FXaIAQjiQLqq/OmHfVxWamVaH9rb1aumsps+yPHZTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744885233; c=relaxed/simple;
	bh=prazWVCV9d6qQTwqxR3Cd31+F1sNY+NrupHwLtS3KZY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ijQZlFwJA1ydSopWliUcRiiq89ABdHOvO9y/c8pRD5LXRpwXijRyihv3Hlk1xH+Pg6ojc5jBHRGLx9bEw0n4vq8V9/DgRQ7WJeRZ2b0IOhvR71DyN3N9aW9hjvaCsQ3aic2McGkL83jm+TYjyQ6LU05Pu+gxs5bSsF/sKB1vof0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=qmxT861F; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="qmxT861F"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1744885229;
	bh=prazWVCV9d6qQTwqxR3Cd31+F1sNY+NrupHwLtS3KZY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=qmxT861F++j0VWqDgVdyBQ6qLIvUFZ5yu+pAb+EfrQqeqEeHwZqOFBj/VdF0TJmGg
	 5mI79b/V2N4lzvtCLXAzDcJl+0/YxCC7Ynh3v+CCSiWxFPth7fCOlJhRcKf5a6ZEgp
	 d3g6RItDpfrEb9+apgi3k71zo4TAq5Vn4CD1CAwl8DJSWSJsAeZK8pddDh4cTgma36
	 QAS4PeyJtLxKsvfuWkSKfu/YXmZ/NHzoAkpPPNth15yDGHcP4RGoIga0jyGpgLP1+0
	 yl2STg71eWikk2L0w4MiipSEk6urFOwxIAPb4wof7zOpW2WW0sVq16fkwRFUwPs0Fp
	 +dvauuDP12h4A==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 61F5417E08E3;
	Thu, 17 Apr 2025 12:20:28 +0200 (CEST)
Message-ID: <7f5f55e9-0276-4976-962c-37fbcc6e0966@collabora.com>
Date: Thu, 17 Apr 2025 12:20:28 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/6] ASoC: mediatek: mt8195: Add mt8195-mt6359 card
To: Julien Massot <julien.massot@collabora.com>, kernel@collabora.com,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Trevor Wu <trevor.wu@mediatek.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org
References: <20250417-mt8395-audio-sof-v1-0-30587426e5dd@collabora.com>
 <20250417-mt8395-audio-sof-v1-3-30587426e5dd@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250417-mt8395-audio-sof-v1-3-30587426e5dd@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 17/04/25 10:44, Julien Massot ha scritto:
> Other mt8195-mt6359 cards rely on external codecs,
> add a card for board that only use the mt6359 codec.
> 
> Signed-off-by: Julien Massot <julien.massot@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

