Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 928982857DC;
	Tue, 22 Apr 2025 13:31:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745328694; cv=none; b=GxMNPrUAo7RYrfFy51JDUHB6LWwfuVP9R4D5NP+qWLZpI13eZ4ydMg4pai93DTYR8yQDpQBnfGOuj0Hod46RjQaRD+2JZWpzvYDg3qUVaTcuEkoI8vunM7wQhIgHLKikr+RwrPjgBUEX6TMdWDkFiUbJOBwjN2Osh/BJWOifA9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745328694; c=relaxed/simple;
	bh=zs2GEiCb2Fnzl5vqBIYKuQkKO6GU8T3Nv0uk80WaFIA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YUeXKFHJ+7QLnKFGSfCzY2N61pgROcP/uLf3wgX7WmuiZyD4UrLxB8UuoUMcBJbwpqDKtDoEySGctE5Gb1O4fzudfTvVTIxhGwc0kYaSP6dwj6R3w1V68X6kC6+rWD4LpphKLjU69KJwovCvT6jasJRyAoj/YUz43z8rSARvX78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=oIoPM8AY; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="oIoPM8AY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1745328690;
	bh=zs2GEiCb2Fnzl5vqBIYKuQkKO6GU8T3Nv0uk80WaFIA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=oIoPM8AYd3Kgm35rvmA8nVpIiWZvgA++wJIp9kVJvR9m/G9PvWp3lEP/M75hoYSu9
	 Jn2dGOydXQmq9oot3mrHTTxt5EfZ47SfSKwGwh2U3BKJV+qPk5YJpWFQWDIHWhKDEv
	 Ol5nd1F0bAupMEPHeglavBRDSHWEUGllJDk1BgycASRsZS+3kf9e1eyvcZ2rMZBfX5
	 ahf2syRpCk/uFFSL7Ue37GcCzhimOmeMYuSo4/a9biQ7Qe+AVxA5iWmtvmhRysEuVk
	 29sEbmzEB6Daga7SZ/au3q/4XEWZMOeoPCpZ19Zus7CPTyBqsNO9LCcjDe+mrdPUfc
	 eh+sIII3PyNhA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id EDD7417E35E8;
	Tue, 22 Apr 2025 15:31:29 +0200 (CEST)
Message-ID: <16d6740d-5a94-461c-941f-243fb1aefa92@collabora.com>
Date: Tue, 22 Apr 2025 15:31:27 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/8] dt-bindings: mfd: syscon: Add mt7988-topmisc
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
 <20250422132438.15735-6-linux@fw-web.de>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250422132438.15735-6-linux@fw-web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 22/04/25 15:24, Frank Wunderlich ha scritto:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> Add compatible for Mediatek mt7988 topmisc syscon.
> This hardware block contains 2 functional blocks
> 
> - a powercontroller which is not needed (switched by atf)
> - a multiplexer for high-speed Combo-Phy
> 
> This compatible is only for the multiplexer part.
> 
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


