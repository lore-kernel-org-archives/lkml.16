Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70FE0264A9C
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 13:59:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750859957; cv=none; b=lc8ryWlfXxe5noMOtRoWbFLJXMCUW8jpL0FH8T5/AEGfgsx90A3gnOS5CYPfBywK/Bm035zrnkaFNcZMzfmezABPO5FxrngRm5Rtxu8HFjxsLa7Q4e9NSvpRtIxbYPJWrbhTqhBL35/W5I6xjMvrc8HUrB6Dr/JmjK7vkZcsMu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750859957; c=relaxed/simple;
	bh=z6KwqZF+sEV50fj8SbrBHrXmDWlvuqDf00T6QA4XK3A=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=tkij17KgMfBADmAuTj9d0gbzEEGd0Ik5bw0xnohFGuAqnXOjFKfkGbakZZMGFx8ZIObW1/4T6HW03atd3Fk2zuxCKcgnRD/Gg9Egd7hY6XwCdJpdhvZ7nbzgQdT4oFy7NDRZ/eDzKNz39nkiNdP+NMJ/y1fjgfKur6XO0/EP7g8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=REm88+4+; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="REm88+4+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1750859953;
	bh=z6KwqZF+sEV50fj8SbrBHrXmDWlvuqDf00T6QA4XK3A=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=REm88+4+zz3+IyPKjLA0OJL6d8PS+BNPUGGHAhKYRDmp1waQFubcjN8ieSfLcGiW4
	 ErR0V2g+nDUxOyyOQ/uvZDgR5GkAgnI7V7TL7yDIhUgi15zuQOHeolcAKs3R/o9Dk6
	 +63M2CXDKny0mbzuZ9Yn0a/7i+2cr1FhnNaLh/Adk9rBv1NPpw4zjY1/oYt1OJZmQD
	 TKAssXn0AQNv/jISsP3zXqdM1lG1qF5wZf1mrF8PDnUlL1pMIv08MBE5pJyoxqDrDV
	 dTfk+Lf0rv+sY8lHhFBHDSD2TnhzUKDEcM43gzAMHee896E82TiEqzWFbcxPqrro/q
	 k1HdKQnp0hR9g==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 8EF6E17E090E;
	Wed, 25 Jun 2025 15:59:12 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Jason-JH Lin <jason-jh.lin@mediatek.com>
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
In-Reply-To: <20250624103928.408194-1-jason-jh.lin@mediatek.com>
References: <20250624103928.408194-1-jason-jh.lin@mediatek.com>
Subject: Re: [PATCH v2] soc: mediatek: mtk-mutex: Fix confusing usage of
 MUTEX_MOD2
Message-Id: <175085995249.270142.13954093211913290780.b4-ty@collabora.com>
Date: Wed, 25 Jun 2025 15:59:12 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2

On Tue, 24 Jun 2025 18:39:03 +0800, Jason-JH Lin wrote:
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
> [...]

Applied to v6.16-next/soc, thanks!

[1/1] soc: mediatek: mtk-mutex: Fix confusing usage of MUTEX_MOD2
      commit: 331db44e70dacfb6bf1e17d92fae7b1c9517ca6c

Cheers,
Angelo


