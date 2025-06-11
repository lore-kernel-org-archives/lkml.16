Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 194AD22DFA2
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 09:07:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749632834; cv=none; b=J0Q8z2f4Lba1ea1o8zU2vZzVyfNPvGwaA87T9agFvbPGw9EmiWxbDAJcIq/M3FlE1FdkoeOKuRaJOfyGj7ZnwuGmC3wemgzJus9US0+rXgg4lEfhRscRAjbS2cBQyHxEH/FxI0ajc+iO4q49pa5tHxFN9vkVdJ1M9boYDUxNHmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749632834; c=relaxed/simple;
	bh=3Ip4QlReFFhe2GLgKmX5HdTzhz5q7Ydnp6NSKHxRFlA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oBCREa4h0iRKQ62ZSIoW1pGo0jvONiXUOLOOP2e+DzJX246PCnaBSeMXP+Vua8jQjuE98PKW6IGuIzfLw7BbKdiILASIWa3scPf3Xz1tPPAfx7jJmCVFDDUB76CzUhJ4pWM5jViynMsOJKGwlDwPKjLyXCXWnI1e0FduilogPxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=oeBR2Cdk; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="oeBR2Cdk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1749632830;
	bh=3Ip4QlReFFhe2GLgKmX5HdTzhz5q7Ydnp6NSKHxRFlA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=oeBR2Cdkvw5FS5Uj+EMSWDpyYAIRfmum/UQEmEmc2NH+uR3ykyn782Cwk++CJV68w
	 lTMYB9QLbBFILVapHjXCVkxxn5HO6MNp5wabOBINNpPKg+zMFNdNpnUQQOPFquqLki
	 G9rTB3wl25n8txJ16MHKJVl39rzd4R5a7jQNZGPJTpKr3oTnBa56QUxTzwSUsiih8j
	 SMDxAGmHpK87FuHPmv3PDqQLHn0otU7xM6ldZhTSKbLwT/3bCNvLeBHqWQLz7BaQSv
	 Z/n5sTMwJwpoIo4bJVvlISXhbuZrlJieYT/6XSceGYnn42SPeGunysx+E0yd0dHrTw
	 a5EWbwjgoQwkA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 858FC17E1045;
	Wed, 11 Jun 2025 11:07:09 +0200 (CEST)
Message-ID: <c197ad80-cd12-4168-b1db-9826cc42760f@collabora.com>
Date: Wed, 11 Jun 2025 11:07:08 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/mediatek: mtk_dpi: Reorder output formats on
 MT8195/88
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20250606-mtk_dpi-mt8195-fix-wrong-color-v1-1-47988101b798@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250606-mtk_dpi-mt8195-fix-wrong-color-v1-1-47988101b798@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 06/06/25 14:50, Louis-Alexis Eyraud ha scritto:
> Reorder output format arrays in both MT8195 DPI and DP_INTF block
> configuration by decreasing preference order instead of alphanumeric
> one, as expected by the atomic_get_output_bus_fmts callback function
> of drm_bridge controls, so the RGB ones are used first during the
> bus format negotiation process.
> 
> Fixes: 20fa6a8fc588 ("drm/mediatek: mtk_dpi: Allow additional output formats on MT8195/88")
> Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>

Well actually there is a way to make this still behave while having those
alphabetically sorted, which I was thinking that was already properly implemented
for MediaTek drivers.

Apparently it's not true for *all* of them... but then, just keeping things ordered
by preference is a simpler solution and probably the best one for now.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


