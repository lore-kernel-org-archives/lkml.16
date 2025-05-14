Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27FAC191F98;
	Wed, 14 May 2025 13:49:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747230594; cv=none; b=qDF5v/aCJwv7z+RJsqgPOkmujk1/aIUgEVCqJn3BV6g2o0fis83AVPlf5+d0CnplQP/iVr0mmqIuhgNi5PQ29ArIqZfsWPSaohb4xxdztn0dHBGEQtIfIeLykFXXvAZXPGkV8Xhdu3FfQU1FuLyGtY+p1J8xXxNbQsylkXhFM5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747230594; c=relaxed/simple;
	bh=Yk429GiPAFuJVzjfNeoldvMCZDwsaLo6v8MgUY9M/+c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=er8JLH/e3BrXcwiFqarbeZXQ9bV81okO7Q11CamTiJAcedbbQV5rW0XGa1nLaqyNuLuNLC6JihZ/DWCVTMg/X+803IhilwaMfaxuqs40CRKFtXvLtVqVCXrWiF6JICsNiAbmvm3+OZluz62pu4CaRsjI6JAquxCyPHp5j8p6k64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=m/RSoirp; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="m/RSoirp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1747230590;
	bh=Yk429GiPAFuJVzjfNeoldvMCZDwsaLo6v8MgUY9M/+c=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=m/RSoirpdeGVcMmIvnU/gALfQ8h1Yup5G6CrfgIS7t/a0hIsMaiMYMcazRUS48QdX
	 p/iUNFxMCzlBg4BUJd7Pux9AH43/C9W85CmBNhXmLMpzVK8uV6ZuBA7xQdnImEAoKT
	 xsh3Qy4uK6HRyULd/xRlhJ11KuGNQ7Ejy1qJGW1LQpmn0/PYXq3f/Juz3dlxSckJ8+
	 OqVdl05Q5Yfa5RAwOAoM2IoES014wmPNQcptAYNllpzWsM21sHFKEldkDRZ4kl3LOo
	 PmtXruNGNLfk9nmc71uvFRougCge83GMCabS+eN8nfKOSglFnKiWdxHid6moYR29B9
	 VthpjWTslEykg==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9D0E617E07F2;
	Wed, 14 May 2025 15:49:49 +0200 (CEST)
Message-ID: <86b55c96-7ec3-48ed-83b4-f434d7fcb5c2@collabora.com>
Date: Wed, 14 May 2025 15:49:48 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] ASoC: mediatek: mt8183-afe-pcm: Shorten source code
To: Chen-Yu Tsai <wenst@chromium.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Jiaxin Yu <jiaxin.yu@mediatek.com>, linux-sound@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 Darren Ye <darren.ye@mediatek.com>
References: <20250425082551.1467042-1-wenst@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250425082551.1467042-1-wenst@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 25/04/25 10:25, Chen-Yu Tsai ha scritto:
> Hi folks,
> 
> This series is meant as an example on how to use macros and range cases
> to shorten the MediaTek audio frontend drivers. The drivers have large
> tables describing the registers and register fields for every supported
> audio DMA interface. (Some are actually skipped!) There's a lot of
> duplication which can be eliminated using macros. This should serve as
> a reference for the MT8196 AFE driver that I had commented on.
> 
> The three patches tackle separate tables in the driver. The remaining
> one that could be tackled is the list of DAIs; but that one has more
> differences between each entry, so I haven't done it yet.
> 
> Please take a look.
> 


Sorry for the very long wait here; the entire series is

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Cheers,
Angelo

