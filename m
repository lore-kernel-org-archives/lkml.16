Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87D531DE3C5;
	Mon, 10 Feb 2025 10:52:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739184763; cv=none; b=BrKIxxZKnvbp5ymIMcuKP0gbbZAwZZW/X7OV+PwU/ZKyiV622ySOgVfzIe5YT4RsvF6pdXOT0JMd84vUvFVzaQ6lJy6tfYoDwrjC0CVRbGMytUsDQgOaT30UbR1LR+wp1vX2kqeSLawvOmXim+73TVsjveQi+iGh9BB/7uEErX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739184763; c=relaxed/simple;
	bh=3XQQnMznbwiS00Y1JIDlmmzTejfYfNeecvMctR7zyx0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=t1OdXqlvxmX65Uz2X03kof/cRLuc6nCWMgzVbfQKiGCnAJy1+82nMKRKDQ317xug88jK72P3fhDiqZoO6CejCVfmW2OYgWsF42WMsj/gR89JslYISLINp75eks8EmJYynTFdAOaDLLsJVUjBaqcuA/SGvApUV2tF9h1gdQNGPno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=JIEzGoMQ; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="JIEzGoMQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1739184753;
	bh=3XQQnMznbwiS00Y1JIDlmmzTejfYfNeecvMctR7zyx0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=JIEzGoMQRT1DyZq7W7ni4SwwrNDCvYsBY7QKyW+m1gZWp4dk/9C56ZMvEvlqNuYGV
	 35/SMeBvVl0LIelx3Nzm71LQEIjTIsgEAkCyAGp6xtFz8o3GDBPPG4LDZdf+X86X/6
	 V3A53ffTkjDD3Ac4FoXyWT05KEAwO61kt3zsWrzBk2khUsA+xs7cGv5Vv6dZbz7h7J
	 Lo8Q7Lehv2mUKcyQ+ypEJD/WdRIdSjEPobi0pVjJVueZzGxn9bjYds+gmSMOujibPj
	 9sVQ7xjaSpKsSTZc8W0HcPFWuxW3MF43EcDqr/z6EmNbyrRDsqbVav0JdI+P4N7M9u
	 2oJkF7vvsFjfw==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id CE9DA17E0FCC;
	Mon, 10 Feb 2025 11:52:32 +0100 (CET)
Message-ID: <918ebb70-8c46-4bbb-8fca-7136465db39b@collabora.com>
Date: Mon, 10 Feb 2025 11:52:31 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] drm/panfrost: Add support for Mali on the MT8370
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
References: <20250207-mt8370-enable-gpu-v3-0-75e9b902f9c1@collabora.com>
 <20250207-mt8370-enable-gpu-v3-2-75e9b902f9c1@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250207-mt8370-enable-gpu-v3-2-75e9b902f9c1@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 07/02/25 16:18, Louis-Alexis Eyraud ha scritto:
> Add a compatible for the MediaTek MT8370 SoC, with an
> integrated ARM Mali G57 MC2 GPU (Valhall-JM, dual core),
> with the same platform data as MT8186 (one regulator, two power
> domains).
> Despite their different GPU architecture (making them not being
> compatible), the MT8186 platform data can still be used for MT8370
> because it only describes supplies, pm_domains and enablement of power
> management features in the panfrost driver.
> 
> Reviewed-by: Steven Price <steven.price@arm.com>
> Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


