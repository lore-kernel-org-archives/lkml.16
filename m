Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7952D267728;
	Tue, 20 May 2025 10:19:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747736352; cv=none; b=rgBThsZph/ZJMVRDz3dPR/enMKL1PvztkJ3Yu9iCPfVo6qCs4jWotwgKj8jcduhGvwustCiu+x2T5zR/ABvS9+NQrgiGPvryCSXxx1H/7sku1Bex2ki14f79xice+qqBKJlLL0cmQ1V9VxA54qCJv3eSo12aBPNNNedL59CXHCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747736352; c=relaxed/simple;
	bh=9IamjCqlvQvJklBW8oB2MCtgzf/uhXR8hnZBDfqkBCY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=m1SHFS7YwYtO7oAYERP/sTJgUMPKqWyOV/eoesHiuIsCk6NEmVsvlHYQ7R0GQRctD8fnYE1E+t/METQPs+Xlv+61XjcOHdiBDJHFJQCxbTzlKqycpuuvzcQz4id7Su9v+RCfkqqZ8f2Bge46yrx7EDwGsd6lbvbBfplQ3JRZLvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=ngqMnoV6; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="ngqMnoV6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1747736348;
	bh=9IamjCqlvQvJklBW8oB2MCtgzf/uhXR8hnZBDfqkBCY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ngqMnoV6TclW8p981rXnTE16VJQJ26eVm+bjym3MWdm0qLUZGena3s0d9MhDYIc+M
	 2zz21qlgzXFmKUEHfo/+eS1NAVWe3OVGhds4uH7LDB+6I5hGoqGPzqfVwLucFBXOH8
	 lvplK/HLelavKF0A5A5xE+24csGH2s8QZNTPiQPwpGVPll9ocV2QWHrwtDdZYtNn10
	 rA1kO20dkhGHRfYx4jpmL/w34jAEkO5Qln3enXr5hB+lTQc7aJGYLxfeFl4Rhg4rmH
	 Lzq1KyYblbirWYGQl0EJRG+Z3FpZPH8wPSDRKM8xfIwDm6UgxLbUOuxgvZI6Kp5/Np
	 KxvBoN+1THKmw==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id D938817E0E89;
	Tue, 20 May 2025 12:19:07 +0200 (CEST)
Message-ID: <b751c8d6-58ab-4a34-8d0e-a5300834962e@collabora.com>
Date: Tue, 20 May 2025 12:19:07 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: clock: mediatek: Add #reset-cells
 property for MT8188
To: Julien Massot <julien.massot@collabora.com>, kernel@collabora.com,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Garmin Chang <garmin.chang@mediatek.com>,
 Friday Yang <friday.yang@mediatek.com>
Cc: Conor Dooley <conor.dooley@microchip.com>, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20250516-dtb-check-mt8188-v2-0-fb60bef1b8e1@collabora.com>
 <20250516-dtb-check-mt8188-v2-1-fb60bef1b8e1@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250516-dtb-check-mt8188-v2-1-fb60bef1b8e1@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 16/05/25 16:12, Julien Massot ha scritto:
> The '#reset-cells' property is permitted for some of the MT8188
> clock controllers, but not listed as a valid property.
> 
> Fixes: 9a5cd59640ac ("dt-bindings: clock: mediatek: Add SMI LARBs reset for MT8188")
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Signed-off-by: Julien Massot <julien.massot@collabora.com>

Stephen, please don't forget to pick this one, so that we resolve all those
warnings :-)

Thanks!
Angelo

> ---
>   Documentation/devicetree/bindings/clock/mediatek,mt8188-clock.yaml | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/clock/mediatek,mt8188-clock.yaml b/Documentation/devicetree/bindings/clock/mediatek,mt8188-clock.yaml
> index 2985c8c717d72888dd49f1f6249a9e2594d8a38d..5403242545ab12a7736ed4fbac26008aa955c724 100644
> --- a/Documentation/devicetree/bindings/clock/mediatek,mt8188-clock.yaml
> +++ b/Documentation/devicetree/bindings/clock/mediatek,mt8188-clock.yaml
> @@ -52,6 +52,9 @@ properties:
>     '#clock-cells':
>       const: 1
>   
> +  '#reset-cells':
> +    const: 1
> +
>   required:
>     - compatible
>     - reg
> 


