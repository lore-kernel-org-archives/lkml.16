Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE41518CC08;
	Thu,  3 Apr 2025 10:25:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743675909; cv=none; b=D+xh/pWVw5Q1hHDZehyjfHovUyaXeB7rfV69XhzXF6MjAxDM4mQbDePOk99tvhlfFYLm2KFA5NT+XLGiQl1xJQ4YbtguihXL6pU+kJ2W3DLGE7Ok8DA+PWfmSnWNrepdxG/+8erZGI4MOwTbeO2vtNyMLy1Wc5USgZqzoYtyjIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743675909; c=relaxed/simple;
	bh=5ZlumXE4eA6n9IKFNUtNELbrczkDxiyZ7QspXaMiG2c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jg2FpjUG23u3cx6GLTIPIrzko/Qrj17+K594NJdq/+XnBW1dNkScL6sBvApi8/WXV3Yur4BLmDFKLg6NQzp7e/gDEr3sZJWEqgPXcDoXoIQPHWSNPz5d0CnI8C8dKUtaB235GCBbykDHRlnaMKQlfuJRO57s9cvr2c08cl7VCt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=Q1uxrlds; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="Q1uxrlds"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1743675906;
	bh=5ZlumXE4eA6n9IKFNUtNELbrczkDxiyZ7QspXaMiG2c=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Q1uxrldsJCjCKJPZ9kpcpfnYcwsfTox+YRnygYOGSPmROHyNP8kSWftO68mMg0O1r
	 HzgkM3WaTrZwSem2eQmHef/Wp1LK70x40UpliHjObtV0jnA7meaJ3BG5rg+luAqGoe
	 +YSzvlaavhc89XYxQvIJ6TYG6VrQhMTKnN35+5SUZcOLjzmoTgPtEGBSdWplSubNpc
	 i3HEl9WMLVUPtxMDPL5hvEHcubHl1WNnMEeAvJlZ1Umz3zl30ClojdKAkENT9kd0GU
	 d3jyFRw0YYKNwkRJ8hBUgNOpjX7CEn2kf4tApGDDbF2wXr+xs3IFpuoBWnL38z/lpB
	 HNs3TFcZYYvDg==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7C7EA17E0B0B;
	Thu,  3 Apr 2025 12:25:05 +0200 (CEST)
Message-ID: <d6f5568e-82fe-4e89-9943-0c63df4248db@collabora.com>
Date: Thu, 3 Apr 2025 12:25:04 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: mediatek: mt8390-genio-common: Fix pcie
 pinctrl dtbs_check error
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: kernel@collabora.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20250403-mt8390-genio-common-fix-pcie-dtbs-check-error-v1-1-70d11fc1482e@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250403-mt8390-genio-common-fix-pcie-dtbs-check-error-v1-1-70d11fc1482e@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 03/04/25 10:05, Louis-Alexis Eyraud ha scritto:
> Rename pcie pinctrl definition to fix the following dtbs_check error
> for mt8370-genio-510-evk and mt8390-genio-700-evk devicetree files:
> ```
> pinctrl@10005000: 'pcie-default' does not match any of the regexes:
>    '-pins$', 'pinctrl-[0-9]+'
> ```
> 
> Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


