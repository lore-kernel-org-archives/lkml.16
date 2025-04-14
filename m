Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEBEF26658F;
	Mon, 14 Apr 2025 09:55:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744624523; cv=none; b=l6mOpgbcbeBGuEhDqlSX9Y5XyyicPhdkhloOMv5BdEDy2gXsncgBUa49COsRM4b1IMTaqzn0+GNklHCq7lXrB9L7kLVhr8WhinVSoGzOTGkCzMkUfkGtIKGXWpzT2ttyLQc8C966Gt0RVsE4gRJNGcM1beTVj3DyBSffgB5p1fw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744624523; c=relaxed/simple;
	bh=T4ONN1Yz2fGzXLrkieW4iad4t1ImsJfvVmB6Bgbe1kk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SKqwhWPzfa+M1YMIYfmLV4+g1vYH5qO+vbE0czph9yN/iOPn8qYWqp/uvf29MasSGEcK9Be4MLmThO5HH5cOIIjFrfE/CKDXQV8NDupRAsOR0RQL4gU/idytuHcewrL+hoCCDVXolWtdB3WwjGC8zkcwFUqqlgKK3qWPmbC9eqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=R2ZS19zn; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="R2ZS19zn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1744624520;
	bh=T4ONN1Yz2fGzXLrkieW4iad4t1ImsJfvVmB6Bgbe1kk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=R2ZS19znVleLmVEzPH8Mx7/PHjELy3JlvA3R+Y1tDL1ZgZLaT7S+NxAvawocHksgV
	 KWuCAEG3E9fvh8IS+v+C+b6RcZXDux4UDZypOV+L+uove+NA8o1jCzzU8wV/VurEjY
	 XhmKiIG37Qaj1R+AwOqhVRoDvxVvivy+2wn3AmxKprp3jszdEXIdt1y9B8ipdRunDS
	 bClxquv5mL1ZzuDgd0EsaqF6sRxxEwi1vhe7IUUK+S3BUo1XggGvh0E1Wv2HcQqF+X
	 XgIQXgsftC+CnTwxfM+p5Vkoo2uqL8Qq+jVGMeDm4D/s5RB/6MnmG88mqVOsQ4TvPx
	 bq64wTDZfnQQA==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 5629B17E0809;
	Mon, 14 Apr 2025 11:55:19 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: linux-mediatek@lists.infradead.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: lgirdwood@gmail.com,
	broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	henryc.chen@mediatek.com,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com
Subject: Re: (subset) [PATCH v1 0/5] MediaTek Dimensity 1200 - Add DVFSRC support
Date: Mon, 14 Apr 2025 11:55:11 +0200
Message-ID: <174462444556.45823.17207667106071511415.b4-ty@collabora.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250410144019.475930-1-angelogioacchino.delregno@collabora.com>
References: <20250410144019.475930-1-angelogioacchino.delregno@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Thu, 10 Apr 2025 16:40:14 +0200, AngeloGioacchino Del Regno wrote:
> In preparation for adding basic support for the OnePlus Nord 2 5G
> DN2103 smartphone, this series adds support for the DVFSRC regulators
> and prepares the DVFSRC driver to also set bandwidth limits for the
> DVFSRC EMI Interconnect found in the MediaTek Dimensity 1200 (MT6893)
> SoC.
> 
> The interconnect driver wasn't touched at all because the intended
> change here was to enable support for the DVFSRC regulators but, as
> those anyway required new platform data, laying the groundwork for
> the interconnect came natural and would've been unreasonable to just
> skip that as it anyway consists in one small struct and nothing else.
> 
> [...]

Applied to v6.15-next/soc, thanks!

[1/5] dt-bindings: soc: mediatek: dvfsrc: Add support for MT6893
      commit: ba3297872a237c8949e812ffa72c64e81da38cec
[4/5] soc: mediatek: mtk-dvfsrc: Rename and move bw constraints data
      commit: b06785283ec1c24fadce95390047feb9db840051
[5/5] soc: mediatek: mtk-dvfsrc: Add support for Dimensity 1200 MT6893
      commit: e5ea18102c9d3bc2fcb186a6e9f43c5a4aba4f98

Patch 5/5: Fixed to remove unused dvfsrc_bw_constr_mt6893 before applying.

Cheers,
Angelo

