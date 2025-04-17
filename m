Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8398C1DA634;
	Thu, 17 Apr 2025 10:20:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744885229; cv=none; b=HxsE3xrbFiVp0gWZQ93xEU/77e1QYcgc7Qh8MJSzAPd/Oo0gRBm9eJ/zZC2ftd7E3+lKZ1/vxn3kR7pCZWXsK7WkK6tcV6xad1/R1xDi9PdVTq1PziGb4GfKKnwrCePwuJ4sf4gllqQvMggwSmf353hSygHBz38TDqlQFwMokzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744885229; c=relaxed/simple;
	bh=euPKG55mbzRFcDRjbCeKgcpRHVb0QMDwPWJSl0dozv4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LMNM27vRgHYfYSdB8Ahlv7nHxCaTUG8Fp3uEyJtrX82FFkB+PelKe1OMTFZEeUKOVny1xNE+ErbF9dpsFmpyfNmqg3r27h1VvNiTvPvxF1v89Q0oFYuEv+NAoRhYMpA3XnBY6wfW8NdTqts2sdl0SZlzbaQpCOSHMzpsBXneu1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=VmlKm73U; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="VmlKm73U"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1744885225;
	bh=euPKG55mbzRFcDRjbCeKgcpRHVb0QMDwPWJSl0dozv4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=VmlKm73UT5ynd4rGl4xarSCzhHRSGSmktoLk9gbixVHTSgzSD/6dUSK1c3rr+QqHF
	 T8eITWj/slbXee0RqSnDi1eIZCV2e0pJuoSn1O/kepo+8l6iBimchVfl1CqdGde+Uc
	 6yqh3eQYxa0nKAfI2PC1kSO3lx5p3xdQjY9OHuunAakMVjjEtZ7ZfQMuIwKe36XIR2
	 lu6G5nF1sFH+u3y39UD9B41r5l17ueBYXlam+AEuoOGf3PMWllG/2iFpFXDjeWswsU
	 oTc7+2FpHqgqhtmIkpWa8sNYbYQBRd27IcNu72h4z/hs1WHQr8yBdBLRQvUOt3nyxL
	 SqcJ4M0WMt9aA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 8DAD617E0F85;
	Thu, 17 Apr 2025 12:20:24 +0200 (CEST)
Message-ID: <8ffa4ba2-6d22-4ca8-b5c9-04f91d45456b@collabora.com>
Date: Thu, 17 Apr 2025 12:20:24 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] ASoC: dt-bindings: mt8195: add compatible
 mt8195_mt6359
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
 <20250417-mt8395-audio-sof-v1-4-30587426e5dd@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250417-mt8395-audio-sof-v1-4-30587426e5dd@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 17/04/25 10:44, Julien Massot ha scritto:
> Make it also compatible for platform without external
> codecs.
> 
> Signed-off-by: Julien Massot <julien.massot@collabora.com>

For the next time - please remember that bindings commits should come before
driver changes :-)

Anyway:
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> ---
>   Documentation/devicetree/bindings/sound/mt8195-mt6359.yaml | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/sound/mt8195-mt6359.yaml b/Documentation/devicetree/bindings/sound/mt8195-mt6359.yaml
> index 2af1d8ffbd8b58f1dce42b369fd699795183a7d7..54a53d15f40c0af56a2a0221025f3a090a05b6e6 100644
> --- a/Documentation/devicetree/bindings/sound/mt8195-mt6359.yaml
> +++ b/Documentation/devicetree/bindings/sound/mt8195-mt6359.yaml
> @@ -21,6 +21,7 @@ properties:
>         - mediatek,mt8195_mt6359_rt1019_rt5682
>         - mediatek,mt8195_mt6359_rt1011_rt5682
>         - mediatek,mt8195_mt6359_max98390_rt5682
> +      - mediatek,mt8195_mt6359
>   
>     model:
>       $ref: /schemas/types.yaml#/definitions/string
> 


-- 
