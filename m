Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7158E2367A6
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 09:35:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750671346; cv=none; b=k7jJh2Y/CVTfmU+g0RgCq6erQDJW/GO1cYvj0xxntncK8nkOhJxBq7HNWXCuAc8bR5AlJgC6K9cToGpyBdq1gVqJltD8bIygoQMsrOB5vLjLA6FJIfTf8mupc5tQDtcMaUUr+SP17Y0jSzwb70CU1sJ/SmI7I9sCCFHaSrBGxwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750671346; c=relaxed/simple;
	bh=Elxj9GYOHcazH6V54iHsSYqjb7QlABuqYV7BQAi2XqY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NxjlNmAc4+bOXN1sYxL/Q7fqoYDrfR446c/TDPwyYvSkmwC2o5laTgI5TscohanL911A7BktLTfqLbyKSK/D/397gfpCaXavdFkXPTnlw3mTncdzfGkWkMLJVS1ShVu7WOPdvcp6n5v1LmzFJsSMcWdbtsKluNQrGUIO2AOnIiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=GL4UZv5f; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="GL4UZv5f"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1750671342;
	bh=Elxj9GYOHcazH6V54iHsSYqjb7QlABuqYV7BQAi2XqY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=GL4UZv5fAgtltu9INSScSxlnP6N1thlBP+S+R0Bx2trCWoveWDVAV237v9mAfKNva
	 b8ET1c0wfamymcQqANzW3lkP3i/dBC2jqwNPJuLOkuKFxiySu5jiGhpoOhxpN76h3M
	 i92jKI8dWuHpPIMChTxtUe7tQW5ldy2iN0rT3nBEWkf1SYJ7HSDnfQiklbb8Ub2xR+
	 V6VOUFSmSHbLtlfdtzfiXg2/8NhtiIUhvj7mkJRANXfjipggtRiZGHYK0GtwCeNcTQ
	 43i8oX9U5eOkl1HCytszbqTFshL1UyaAO2p5vxpZverOTIbLekxqswajBRP9ejnsoa
	 ZppUcarbyXj1w==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A339217E090E;
	Mon, 23 Jun 2025 11:35:41 +0200 (CEST)
Message-ID: <75d0fe76-2fa3-4ffc-920e-a6a49f428036@collabora.com>
Date: Mon, 23 Jun 2025 11:35:41 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] soc: mediatek: mtk-mutex: Fix confusing usage of
 MUTEX_MOD2
To: Jason-JH Lin <jason-jh.lin@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 Nancy Lin <nancy.lin@mediatek.com>, Singo Chang <singo.chang@mediatek.com>,
 Paul-PL Chen <paul-pl.chen@mediatek.com>,
 Yongqiang Niu <yongqiang.niu@mediatek.com>,
 Zhenxing Qin <zhenxing.qin@mediatek.com>,
 Xiandong Wang <xiandong.wang@mediatek.com>,
 Sirius Wang <sirius.wang@mediatek.com>,
 Xavier Chang <xavier.chang@mediatek.com>,
 Jarried Lin <jarried.lin@mediatek.com>, Fei Shao <fshao@chromium.org>,
 Chen-yu Tsai <wenst@chromium.org>, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20250620024305.2303935-1-jason-jh.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250620024305.2303935-1-jason-jh.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 20/06/25 04:40, Jason-JH Lin ha scritto:
> The usage of MUTEX_MOD1 and MUTEX_MOD2 for calculating mod settings
> over 32 has been confusing. To improve consistency and clarity, these
> defines need to fit into the same MUTEX_MOD define as possible.
> 
> However, MUTEX_MOD1 cannot be directly used for all SoCs because,
> for example, the mod1 register (0x34) of MT2712 is not adjacent to
> its mod0 register (0x2c). To address this, a `mutex_mod1_reg` field
> is introduced in the mutex driver data structure. This allows all
> SoCs to use a unified MUTEX_MOD to determine their register offsets.
> 
> With this change, the separate usage of MUTEX_MOD1 and MUTEX_MOD2 is
> eliminated, simplifying the logic for obtaining offsets and mod IDs.

Yeah, okay, that makes sense, but...

> 
> Fixes: e1e4f7fea375 ("soc / drm: mediatek: Move mtk mutex driver to soc folder")

...this is an improvement, it's not a fix, so please drop the Fixes tag.

> Signed-off-by: Jason-JH Lin <jason-jh.lin@mediatek.com>

After which:

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


