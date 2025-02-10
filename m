Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 223681C6F70;
	Mon, 10 Feb 2025 10:56:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739185005; cv=none; b=XC/QL49+M62hqAwLDZ1L0f5qd6WqwTEEruWN6C2NclfV0M28Hy6PLXEUv86MLYNOjmuIg/azezu0hK0GIwnEefF7b9+Oob9Z0D9phHW9vOAiCASymRGFXULYwu/uTulqKWVZgzV895ozUFdFKoX9wrab3RrWyUdHFsnG4LmP1sw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739185005; c=relaxed/simple;
	bh=ktC9CGjjL2cK7vFGI+t8o65NobGAFD0a2MtqEaxpWTI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=knb6vrM5Nvgnw/wb/DStzD00p+rIGgAANqjVkkpA2BIMQUQPbf9+dZ+Ehgri9z83v/pH5h2eCmhGixpSjkwtpST3GQFsIHpZ4TRifo36UrKzmooB8QLnA6M6djBZITX/rVmJyUWW3lVn2LaLPCdixjBHW8/wUd2IZv2CHvLsokI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=VDIALnGM; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="VDIALnGM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1739185002;
	bh=ktC9CGjjL2cK7vFGI+t8o65NobGAFD0a2MtqEaxpWTI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=VDIALnGMNk86NrAPmfAd//FQLk4s/j7kOe0F0n8rU1AgHnkN+pGf2mMHWtgI2EcLT
	 EJuZCOQfrFUko7tDluFAUWNZ+QgrJ/t0yExuxM+74rynDfLRqcsFoJf23rVUQQlB26
	 TwrHNQxxJdHe5gcN+8SsrU7j5IVjGvzgu0TvvCtCwx10WGhQV2WC7X0RBjUwt7mmkW
	 QrW+7OO7oAR6TbKLfDGGroGrKflj6HdDOmsDI+WDwqsvxJ1lSRlNEGgINxLDJtrdcn
	 mCX83JTYosnDUGW4HNpIM4CQupfp2bHWXNP6A/mSxhGuCW0yfzBc9iUhPsm14DKUiH
	 wxQwbGJSDiGDg==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9E57917E0EA4;
	Mon, 10 Feb 2025 11:56:41 +0100 (CET)
Message-ID: <b56a7597-fa39-4e02-b601-db05bfa48472@collabora.com>
Date: Mon, 10 Feb 2025 11:56:40 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: mediatek: mt7988a-bpi-r4: allow hw variants
 of bpi-r4
To: Frank Wunderlich <linux@fw-web.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: Frank Wunderlich <frank-w@public-files.de>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20250207135501.30741-1-linux@fw-web.de>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250207135501.30741-1-linux@fw-web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 07/02/25 14:54, Frank Wunderlich ha scritto:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> Sinovoip has released other variants of Bananapi-R4 board.
> The known changes affecting only the LAN SFP+ slot which is replaced
> by a 2.5G phy with optional PoE.
> 
> As the SFP-Ports are not upstreamed yet this patch simply renames the
> current board dts to dtsi, creating new dts for the board including
> the new dtsi and move i2c-mux channel for sfp lan to board dts.
> 
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>

I understand what's going on, and I agree, but this change alone doesn't make a lot
of sense, does it?

If I were to see a commit that moves everything in a dtsi, and justifies that by
adding two dts for the two variants, though, things would be different.... :-)

Cheers,
Angelo

> ---
>   .../dts/mediatek/mt7988a-bananapi-bpi-r4.dts  | 404 +-----------------
>   .../dts/mediatek/mt7988a-bananapi-bpi-r4.dtsi | 403 +++++++++++++++++
>   2 files changed, 407 insertions(+), 400 deletions(-)
>   create mode 100644 arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtsi
> 
