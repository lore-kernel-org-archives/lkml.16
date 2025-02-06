Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91F2B228C99;
	Thu,  6 Feb 2025 11:08:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738840129; cv=none; b=gnzaJI71/PiuPt1/d7suBY7ZZbNtDXOJEhW94JgY6uS3x+CGi1mZdxlmvUP716bjmVZWVzi2/QfP3LWuby8j40rI7eNDMIzGiCY/Ai++55hP0tPzB+TnuJrmlN47TP7Cs6FTacttX/OlgG9hLRTg3ylZkPhEbDI5lDub9sqJUoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738840129; c=relaxed/simple;
	bh=8iUqAlvy20/ugHD4XAj0Q41lxITTOI+gRyQEhcW7HYE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=VylRNZdd+rV1t0VO8fG9wqlqIokjDLIHVHseuvpvl4GWJFxfT+bmD7dw+Iq+i/Oq7MKmWNrE5+y005oOx8e9AYhDz9gI6mnsjnWbvXk8GTtuHZ/JskC4+i0N2Gf0GvgF5/71+SApfsf1VJsDMFTOVlsK8eEWPJRhN+qAd0aCfUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=CZOj5nDp; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="CZOj5nDp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1738840125;
	bh=8iUqAlvy20/ugHD4XAj0Q41lxITTOI+gRyQEhcW7HYE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=CZOj5nDpAp1zv5PZljzdV/FMlXFlD4v3Zb21YEOCZYH8SwwK1RMWv6skvvcp+rs3x
	 IAwmpG89URgjHBJppYniq8fjNyKVN8ZC4Dp6r5XEySURd+4gT5TuXtFz7rug+7SUfj
	 HYmnU8jzGNbEkijGY3BSh0bYiq8SnH5UzSGGSp47zjDk2z3uAeb21fk3nDy9M6wN4/
	 /94x3YHscS4uLMrCOFt1h3RKKvzpDr/WjLTK5Kj/Dn/ohZAlUX5GWs3bAVZbWfue3o
	 PjV5TjHdfugGkqgWe60+8NOAdWg/StUtwX/bSVa/uKnI0YDKhVMXm8bDa+ah4iYzNV
	 JIvftXuxIoGtg==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id B615617E0FCC;
	Thu,  6 Feb 2025 12:08:44 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Jitao Shi <jitao.shi@mediatek.com>, CK Hu <ck.hu@mediatek.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Simona Vetter <simona@ffwll.ch>, Simona Vetter <simona.vetter@ffwll.ch>, 
 amergnat@baylibre.com
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Fabien Parent <fparent@baylibre.com>
In-Reply-To: <20231023-display-support-v7-0-6703f3e26831@baylibre.com>
References: <20231023-display-support-v7-0-6703f3e26831@baylibre.com>
Subject: Re: (subset) [PATCH v7 0/6] Add display support for the MT8365-EVK
 board
Message-Id: <173884012467.110657.7286906897029273506.b4-ty@collabora.com>
Date: Thu, 06 Feb 2025 12:08:44 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2

On Fri, 10 Jan 2025 14:31:10 +0100, amergnat@baylibre.com wrote:
> The purpose of this series is to add the display support for the mt8365-evk.
> 
> This is the list of HWs / IPs support added:
> - Connectors (HW):
>   - HDMI
>   - MIPI DSI (Mobile Industry Processor Interface Display Serial Interface)
> - HDMI bridge (it66121)
> - DSI pannel (startek,kd070fhfid015)
> - SoC display blocks (IP):
>   - OVL0 (Overlay)
>   - RDMA0 (Data Path Read DMA)
>   - Color0
>   - CCorr0 (Color Correction)
>   - AAL0 (Adaptive Ambient Light)
>   - GAMMA0
>   - Dither0
>   - DSI0 (Display Serial Interface)
>   - RDMA1 (Data Path Read DMA)
>   - DPI0 (Display Parallel Interface)
> 
> [...]

Applied to v6.14-next/dts64, thanks!

[5/6] arm64: dts: mediatek: add display blocks support for the MT8365 SoC
      commit: ec207ea7f6f9abb5b0c50394b02f434aa1ca7e52
[6/6] arm64: dts: mediatek: add display support for mt8365-evk
      commit: b7b5052f6b13061db179cf2f0f16c3334e27239c

Cheers,
Angelo


