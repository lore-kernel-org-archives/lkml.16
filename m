Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B46C19BBC
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 13:47:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747230443; cv=none; b=SvqIFJjTh8NqJUqJt9cQPFTFRApcGukjYyp0S0bHDiBiTWo2n+M512agcIfTDFB8ZXGx6/Ub7KmMN5XBXLlgzp/4Cf381b1i1JNEitJYbD+vDzKPGEI2AhK5cT0Uqs2KO1JAZmeT8IjQJ560CbOiX2d3bZXAsIVLQQ1jRcVno4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747230443; c=relaxed/simple;
	bh=TAI5mLJlWhLbo7cCFBPagCfirhUukvsVXETiU+P9guk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EU1JRLOPTbvZepZdrEUvEvi8GmzY3C1XdqTzhxcs5auQXoG8CJ6NHiBVz/YmlgNWt9lPLlLxcc/XCbJg0OoUaKFvdVfx/hREt7zaff0TqfJzl1KB4dodLLhAf6jn3dFVjJLYPUfbrQqmIFfC5oLEUZ5M9Z76gPzSl760Glv8pDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=cUq51uMX; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="cUq51uMX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1747230439;
	bh=TAI5mLJlWhLbo7cCFBPagCfirhUukvsVXETiU+P9guk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=cUq51uMX3IhXkewKfUs4Xfj11uVh9M5qVYU5q6qQZ2eFcIyruQYj9TwJ8+kUphtxh
	 C9P/SkBSPukStCYQRxYpBOg826nKe6dnu1bf93wOpJT0UswPsEQfAMUGOq07q+hMWc
	 zkv8G3nG3Qj/g/byEQbUqI4eE/SygEmhTGdcX9rbjExU2Ct/o7IqmEkKjBZGUEs0Bg
	 LJwM2pdWJRKK/qAs6H5di1iHZ4rGAnjveM8yqHG/DJNmiy+z2lHlSGhhI4oPjV9S95
	 fMIX9TF7Gxx0HEcdXppXAI9k2u5cdq76XAhpaXcxoDV6klqwY7ezlHGbCeC05SAcrB
	 AWFMKUts3kC3w==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 138B017E07F2;
	Wed, 14 May 2025 15:47:18 +0200 (CEST)
Message-ID: <8df2c0c4-600b-4410-b578-cd77170d5e37@collabora.com>
Date: Wed, 14 May 2025 15:47:17 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] arm64: defconfig: mediatek: enable PHY drivers
To: Vignesh Raman <vignesh.raman@collabora.com>,
 linux-mediatek@lists.infradead.org
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, nfraprado@collabora.com,
 krzk@kernel.org, daniels@collabora.com, airlied@gmail.com,
 simona.vetter@ffwll.ch, arnd@kernel.org, ck.hu@mediatek.com,
 laura.nao@collabora.com, matthias.bgg@gmail.com, tzimmermann@suse.de,
 mripard@kernel.org, lumag@kernel.org, ville.syrjala@linux.intel.com,
 jani.nikula@intel.com, arnd@arndb.de, geert+renesas@glider.be,
 wenst@chromium.org, linux-arm-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250512131933.1247830-1-vignesh.raman@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250512131933.1247830-1-vignesh.raman@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Il 12/05/25 15:19, Vignesh Raman ha scritto:
> The mediatek display driver fails to probe on mt8173-elm-hana and
> mt8183-kukui-jacuzzi-juniper-sku16 in v6.14-rc4 due to missing PHY
> configurations.
> 
> Commit 924d66011f24 ("drm/mediatek: stop selecting foreign drivers")
> stopped selecting the MediaTek PHY drivers, requiring them to be
> explicitly enabled in defconfig.
> 
> Enable the following PHY drivers for MediaTek platforms:
> CONFIG_PHY_MTK_HDMI=m for HDMI display
> CONFIG_PHY_MTK_MIPI_DSI=m for DSI display
> CONFIG_PHY_MTK_DP=m for DP display
> 
> Fixes: 924d66011f24 ("drm/mediatek: stop selecting foreign drivers")
> Reviewed-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


