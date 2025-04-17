Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A87E22FF44;
	Thu, 17 Apr 2025 10:20:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744885237; cv=none; b=Nk6Y01Cxj/5gJsj617e7LkJZOvmYeLYclYqsrrm0m53phiwbdYOESuoqSijnEPsvwvkaIyh/0AZm4CHh/fptQgKACMVqMAF1S+tpL/SS3U9h9T+th+DjHaqDUyHSCGAporL3NLKKXdYhLHTwzMU2p4Srt03Z7BwJ01P97YK2pgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744885237; c=relaxed/simple;
	bh=8g82L4cDWPuDUUnejcyz0Ox0ZIZ3FE4nCEYjMHpwTWQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jU/D6a7qjUFEGkZQgxPoBweTol+r1jPgtx4+5RLbcr4ESvF/EetkrplaaxVIsus+Fkxy3K5+aw/PSCoXw2K3on87WCxQKGTUtyR/ptYnSE87avtQ3FyT3ZU5V6HmYbFv4bKBXxh9u7gu0d8aO4rhVd4dYxy7xqsiGEKrzERhiKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=kD03sOaI; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="kD03sOaI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1744885234;
	bh=8g82L4cDWPuDUUnejcyz0Ox0ZIZ3FE4nCEYjMHpwTWQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=kD03sOaIknYVPPLm/U/Oo9L/5QRcQ8FfHzjXq2B7cD49IoASZN/FQHAHE//egvp9C
	 lrMoTtJV+73+rekWxwxd0PJFFjfya7VBQF3Y/DbqSD8/lDiHMl4k1YFS1KobC5cix/
	 yMZJ8C4NvzTl7Y+mBaGkEGcFckQ5cVLddSF+n+5uoRPszVpsMPMIOnVQyvqkSKlTN/
	 UXGYIb4i6SZ15Fz0afNq0Wb5vb0BwPEIcUEc4dovDP+9Z0XA6hrV4c7xxLq1TLytTI
	 O5b/Fe9FghbYQtmQrvZ1sD4hwntoiCQYmuVJ0gXes27RbX72Ly8UKzLS+yoDl7XsDE
	 V8hm+lYm+18hQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 84A6417E0FA5;
	Thu, 17 Apr 2025 12:20:33 +0200 (CEST)
Message-ID: <8095ca62-0eb8-497d-a5a0-1725a8bad52d@collabora.com>
Date: Thu, 17 Apr 2025 12:20:33 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] ASoC: mediatek: mt8195: Move rt5682 specific dapm
 routes
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
 <20250417-mt8395-audio-sof-v1-1-30587426e5dd@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250417-mt8395-audio-sof-v1-1-30587426e5dd@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 17/04/25 10:44, Julien Massot ha scritto:
> 'HPOL', 'HPOR', and 'Headset Mic' are rt5682 specific,
> move these routes to mt8195_rt5682_init so we keep
> 'mt8195_rt5682_routes' for connection between mt8195 and
> mt6359.
> 
> Signed-off-by: Julien Massot <julien.massot@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

