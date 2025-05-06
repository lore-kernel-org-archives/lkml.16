Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35E2422DFB1;
	Tue,  6 May 2025 08:28:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746520119; cv=none; b=Zj+HSk4fVL6Z75MHSc03hbeOX+GXsc4Yj40EH5zGSyxkhK6HTor6Y2UQbV8PEl4ngv7BcUAfqzD4q2+NFK43VJ9oa5OklG4+MCT4MZmRI967m6yM7wlSnd3t2TbjQN1QDUhpvjrjzmUppE4GBrsoH41kWvnswevL++ySAluYBig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746520119; c=relaxed/simple;
	bh=aKexJcbDf7RX3F6f/GBWM3WTi6g2qAawNgd8dqWrYnk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GdstRSswwVdbo3d6oJ6gGCsHvaAbRBPecwUXrwuYBzBhI4IqHx1aY50rX42450Vvlb6I4KvwEpyNO5izdvULUO8jfICsoOJDinzS+DHhpVOVdPBJxcjUpBllHgRuqNy1cU6pKHH85ipbLIyGckt5K8u9B8OxmujR9ph/GgpPeqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=RyLGBYPq; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="RyLGBYPq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1746520115;
	bh=aKexJcbDf7RX3F6f/GBWM3WTi6g2qAawNgd8dqWrYnk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=RyLGBYPq8471eD7UwJB9vj9G6r0qqaxS65kOUFBDqw4QGrLM+TnxnFTJN+X5G8rCB
	 jpTZttf+CjjWZ+4e2eHvWo6HmZUhunROKFqnYnCkSfjMJaqPtNdVao1Hwjtzgp+FYx
	 8OCxe0CdGaD2rNtlSQMHryGzRCQpSJzGETCwxwXmScintUXPD0wFiIRuf8NYGxW0CQ
	 IFobyEtwrMLHWKwYZQTImV1iwTvsEV/l1ObZuo/rkVWicL3HoUlBIn2TO5aUw7BmI1
	 1CscvnNxDbjzOIyl4dnmkLvTI7sTUJMprgVoLAtmJv7Ns1sZxVONyQnX4KtKStkHpN
	 sGxLjhXmUp6og==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 720E217E09BE;
	Tue,  6 May 2025 10:28:34 +0200 (CEST)
Message-ID: <65012c1f-9888-4231-8e7f-c96b7f09053a@collabora.com>
Date: Tue, 6 May 2025 10:28:33 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/3] drm/panfrost: Add support for Mali on the MT8370
 SoC
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20250502-mt8370-enable-gpu-v5-0-98e247b30151@collabora.com>
 <20250502-mt8370-enable-gpu-v5-2-98e247b30151@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250502-mt8370-enable-gpu-v5-2-98e247b30151@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 02/05/25 14:17, Louis-Alexis Eyraud ha scritto:
> Add a compatible for the MediaTek MT8370 SoC, with an integrated ARM
> Mali G57 MC2 GPU (Valhall-JM, dual core), with new platform data for
> its support in the panfrost driver.
> It uses the same data as MT8186 for the power management features to
> describe power supplies, pm_domains and enablement (one regulator, two
> power domains) but also sets the FORCE_AARCH64_PGTABLE flag in the GPU
> configuration quirks bitfield to enable AARCH64 4K page table format
> mode.
> As MT8186 and MT8370 SoC have different GPU architecture (Mali G52 2EE
> MC2 for MT8186), making them not compatible, and this mode is only
> enabled for Mediatek SoC that are Mali G57 based (compatible with
> mediatek,mali-mt8188 or mediatek,mali-8192), having specific platform
> data allows to set this flag for MT8370 without modifying MT8186
> configuration and behaviour.
> 
> Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


