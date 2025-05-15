Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C0BE1F8F09;
	Thu, 15 May 2025 14:52:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747320769; cv=none; b=qhTeGP0l6HCQFSSr9ePm7Mo6uEUR+7OlIqaMIlLuylsHX0/27t+ntIOsVg5Fvj/H/ZuEt6GQto3CEhuPqbkHOs2NP57gvumyD1stjJzq09bHKGYTuBHpAeH7824gl7kOQhXDEaQVr/GriRPWWfnAn4sQqAgpo9oydxPfFP50VV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747320769; c=relaxed/simple;
	bh=CvoF/nyQr+FhuB2AV/wsBQ217YYKKLFgLA5T25rONfM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jJO60oKgwByQjXUvP+IZY3knDHVEcX9pjZZgm6JlA9YXBpw8ZV72xWiYAIqiKC+vp5ODvCNORRKL0HIQl9VaWifOD+FPafEe2e4gG5aIN7/NEKXMRtUduvk7o5xHowF6PEi8HkD4QOymDBbvhZDAaK8qkyShsPM/pdq0Imjfoj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=BYCWfe68; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="BYCWfe68"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1747320766;
	bh=CvoF/nyQr+FhuB2AV/wsBQ217YYKKLFgLA5T25rONfM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=BYCWfe68f7m9+wktZHjXNHPregZKTWhqWgiNZtQbBok4mc7onCiocfV39x3Cr95+v
	 zb0KcIbGln0WdwVVCaoHHx2fhsv8bF/GVAVIkJZlVbFHKI/NdoSF1UM1Yubue7iYwK
	 KyOZiJNV5bJkUN4knYVlkATd/8pSnycp1//fg285VUXy/91XrZcr++0WAonAjfcUuA
	 U0B57ZbuHv8dFMKfnlFWxCmOnxmwwNJPZChaa3QuUKld7XZrkWukYCzDokwLWVgOmr
	 qPVoIy27d5OyY4/e9gPz8dcsD2fe2lErCg0N77tPC0ek1mqs00qMctUvGuRNIlVJ96
	 e31vux0tUy5yA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3C62A17E0062;
	Thu, 15 May 2025 16:52:45 +0200 (CEST)
Message-ID: <cf86023a-3dd9-4205-9643-89924114e85c@collabora.com>
Date: Thu, 15 May 2025 16:52:44 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: clock: mediatek: Add #reset-cells
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
References: <20250515-dtb-check-mt8188-v1-0-cda383cbeb4f@collabora.com>
 <20250515-dtb-check-mt8188-v1-1-cda383cbeb4f@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250515-dtb-check-mt8188-v1-1-cda383cbeb4f@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 15/05/25 15:31, Julien Massot ha scritto:
> The '#reset-cells' property is required for some of the MT8188
> clock controllers, but not listed as a valid property.
> 
> Fixes: 9a5cd59640ac ("dt-bindings: clock: mediatek: Add SMI LARBs reset for MT8188")
> Signed-off-by: Julien Massot <julien.massot@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


