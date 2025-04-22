Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F056284675;
	Tue, 22 Apr 2025 13:31:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745328692; cv=none; b=OTHKpg/17DOTtbZ48UaEvDi/2ikGxjbjXnpxhJJuRd5vrfdHhNKX8sgJziLyXQgSINb42bZeVUCDmq8iQitY/Nj2YBgbWYzaRdHIrXim5I0u4Y68yWe6Ec+/NFIxGrn1dvRrw97aYnA7ss8ETzd7IXnljeMyAclXg9OBm7fOFps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745328692; c=relaxed/simple;
	bh=98ZMA9A7eTgc84XLiIx3MA/4NpSIvQu1Tg8uO3Qua7Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rF2f6O+qzuVmioKCWHHCI2ok0Ik95OLS2lE1xoH8Cj0h4V6bKFSotT7vEmXltRO+LRUzIUClo2Yd7BpfDbJCRsaQcxByYVloEFVOFeW/gVfCrZtOhxfD9CSwsEq66RvOqiK/F8MnXF49rNDECYRCDtmEZEMtICti+Xb1CemADig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=lyTjGYiL; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="lyTjGYiL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1745328688;
	bh=98ZMA9A7eTgc84XLiIx3MA/4NpSIvQu1Tg8uO3Qua7Q=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=lyTjGYiLZqCn7nM3j6vvENWZxiZADq/uKrn+nuZkOsU1VBTbYnj/6teDYwkf8Uc/N
	 6zVI+WISUE14rtJaxr0o+JQV0gw8v1xXZ5fbl9XLUm2FsxyfjPy1ErpxjTrHXBG+3w
	 bzDUg8Dka3OJSSMYTUkiAHhRyCX0SAeHHKj8trdkdfx/iRwlLSLUqoEelCZyYj8ZO0
	 bDIv/ehtmTb412HJC6yEqdvF1w47mk3SFexJJ+Llv5iBU5bF0y3uWnQiLHpnog6okz
	 XsEjDLm9uZW9suL/M+L2mCi6yykocg3ZUiF0oSuzjuI4+sIYExilPUkvipBCc9alFT
	 U0e0Wtd4iZWhg==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7E87B17E155C;
	Tue, 22 Apr 2025 15:31:27 +0200 (CEST)
Message-ID: <c9af209f-8cb0-4c98-af00-bf11a2451f19@collabora.com>
Date: Tue, 22 Apr 2025 15:31:26 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/8] dt-bindings: phy: mtk-xs-phy: support type switch
 by pericfg
To: Frank Wunderlich <linux@fw-web.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Frank Wunderlich <frank-w@public-files.de>,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
 Daniel Golle <daniel@makrotopia.org>, Sean Wang <sean.wang@mediatek.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-phy@lists.infradead.org
References: <20250422132438.15735-1-linux@fw-web.de>
 <20250422132438.15735-5-linux@fw-web.de>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250422132438.15735-5-linux@fw-web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 22/04/25 15:24, Frank Wunderlich ha scritto:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> Add support for type switch by pericfg register between USB3/PCIe.
> 
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

