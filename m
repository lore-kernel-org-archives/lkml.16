Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5C64189F3F
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 10:30:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747909843; cv=none; b=eJDAFSuFQjKHG1nu1OSVuj6Ma15mNZf+s/9k0nSc66xWg8LWC+dDa3m+TDA/8YtbMr4EiY+9LwwJYKABeCl+WK2HDtscrkNE94PwAOLF09REJ5gZC8aNolrpze1wJ+WswDMH4/4lp+R/lrbBT3IIkcw/mRnEE8uGSVPdhyOskUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747909843; c=relaxed/simple;
	bh=8iGntFQbL8GyTwozwP1vKL9KhhFgtY8ccE9Bf576A2k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OIFzOrY5feOv7Yaf3uBGDf0aZpFQeLtx80sigUsIZ8jmkZVdNcr+b0SfSwRUvKF4qf9kV/TOhQSjZF3eQG0VGUPCaxmYSj8UwrjqcGiL9ndhLc3DqPXt54kl14fa/eH16gqi0cubW+DCdkVGkt+cM6Re8HN5zWEWPCA5oE+jqDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=MVVZqxhl; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="MVVZqxhl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1747909837;
	bh=8iGntFQbL8GyTwozwP1vKL9KhhFgtY8ccE9Bf576A2k=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=MVVZqxhl4Gbge9gbMkOlT+f4gnKPpv87Zwj0xWaV5byaRKY09dD3b4XPfH/e+IzUw
	 Z7UjslOoRz4XTo/DN9bGkAXn9m6kVgSeDNcZntMnk5ADdYWU85PdisjdH9sQwVrWbi
	 OAB6g/5VkfdX78uyCH8UL1zvlqC9U+kE9rkIHp8F3vCqsoBuLgbduGJRjhZs9QwOYI
	 DH3tlpegyKX77Bn6LA5ovZiPyIDfXU2aUU09Do6J7iGA2w9HUl5KpCB73pDVwwoi5r
	 joFD/1NveBRB/8IeKIvFt+tCuw59l1mL5Hy5iXOUIoQ6+oANkhapcKSLiB04oO868J
	 0Afx7dsIrgxTQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id AFA4117E0FCE;
	Thu, 22 May 2025 12:30:36 +0200 (CEST)
Message-ID: <aed94e06-455f-4aa3-8740-57bd1facad22@collabora.com>
Date: Thu, 22 May 2025 12:30:36 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/mediatek: Add wait_event_timeout when disabling plane
To: Jason-JH Lin <jason-jh.lin@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: Nancy Lin <nancy.lin@mediatek.com>, Singo Chang
 <singo.chang@mediatek.com>, Paul-PL Chen <paul-pl.chen@mediatek.com>,
 Yongqiang Niu <yongqiang.niu@mediatek.com>,
 Zhenxing Qin <zhenxing.qin@mediatek.com>,
 Sirius Wang <sirius.wang@mediatek.com>,
 Xavier Chang <xavier.chang@mediatek.com>, Fei Shao <fshao@chromium.org>,
 Chen-yu Tsai <wenst@chromium.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20250522085149.3361598-1-jason-jh.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250522085149.3361598-1-jason-jh.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 22/05/25 10:34, Jason-JH Lin ha scritto:
> Our hardware registers are set through GCE, not by the CPU.
> DRM might assume the hardware is disabled immediately after calling
> atomic_disable() of drm_plane, but it is only truly disabled after the
> GCE IRQ is triggered.
> 
> Additionally, the cursor plane in DRM uses async_commit, so DRM will
> not wait for vblank and will free the buffer immediately after calling
> atomic_disable().
> 
> To prevent the framebuffer from being freed before the layer disable
> settings are configured into the hardware, which can cause an IOMMU
> fault error, a wait_event_timeout has been added to wait for the
> ddp_cmdq_cb() callback,indicating that the GCE IRQ has been triggered.
> 
> Fixes: 119f5173628a ("drm/mediatek: Add DRM Driver for Mediatek SoC MT8173.")
> Signed-off-by: Jason-JH Lin <jason-jh.lin@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


