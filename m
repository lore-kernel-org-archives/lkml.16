Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DB9F28136C;
	Tue, 22 Apr 2025 13:29:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745328592; cv=none; b=MjCiezbWP0VkJHkbkS6df3NHomQzygkgeHpxYiyypGixMNhUEEUxU0pYlSB31BMsWygAzvvN7XiQpjT7VBd7zc3IJnpMDWofP/PLiABwXDlLLBxO1CTEWjVlS2iRBlUZxnG9ehUMUcFTyDmxh3fa5GwVsxF5GibCwqIwCQNke40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745328592; c=relaxed/simple;
	bh=tXx2918oT0BpXYspIGxIB19cZfL4dPd2d06FlPbhsJg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VvaRrcvSMe/DyngStScl226XH0AghNk+qE9rwdD4V780w77GzLF0eh2X3qGdRfOSnWUFuo77ChNazhuRXuXSIH5S7IphO7IxM0KiJSgaRyso5ZTeniBkC2ery30sM1laahTXEs+xCIuP7PuSEaO4PL1COU1fFZTlCg9SQCvnWpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=XyzTFNFQ; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="XyzTFNFQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1745328588;
	bh=tXx2918oT0BpXYspIGxIB19cZfL4dPd2d06FlPbhsJg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=XyzTFNFQ7AzdBltJU3INWGMxUJc8Y5V4IETesCUWMIChBlPks00F78XHwVMq+xS6Z
	 c2gsYBte1q+fiU/KjcpmJnoX8JSCzTpS/h3LOraB3x2lIakczhsiTeqilAEIPLyEpB
	 MafnedVZTL91295iRAbzlqGThiPFDlCYswbDBO1M1ZQ2dNwWkg0Vgw9QRKnqvm/dSm
	 FxWoaWYLgaJeydGjbDC8oz3WkgO0aqneS/9yR2GU+Huc6m+fyfOiIzFOyn7KeqdO2d
	 sQwwttnrysI8/LpC9Sin0k5FH+7DKWc17tdkcQDcwqUAmG21+3kcNEqTeuxzju+x2E
	 wHvjPXFD43UHA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 8508B17E02BE;
	Tue, 22 Apr 2025 15:29:47 +0200 (CEST)
Message-ID: <3264957c-5145-438f-b4e0-46b9244051b7@collabora.com>
Date: Tue, 22 Apr 2025 15:29:46 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/8] dt-bindings: arm: mediatek: add bpi-r4 2g5 phy
 variant
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
 <20250422132438.15735-2-linux@fw-web.de>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250422132438.15735-2-linux@fw-web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 22/04/25 15:24, Frank Wunderlich ha scritto:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> Add new compatible for Bananapi R4 with 2.5G phy.
> Base board is compatible with existing BPI-R4 only 1 SFP is replaced
> by RJ45 port and use mt7988 internal phy.
> 
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


