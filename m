Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F07B922B8A9;
	Mon,  7 Apr 2025 07:26:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744010792; cv=none; b=DzN4NxXgV7a4VN/y/2QVMo+5OZHyqEb5V6Cy4cYyZHy1DnucUnNvW6A7pt1n0oQEmV6h1YyP9YoVcMI9/CfGhc77rFEKZIL3WA0nJnoyOWLeglKBOR/zZFyHQdXzCyAFpp5VdT7JyjIQUgbpk9Xy8dzi8qvg+PSCOKSW7lCM1ls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744010792; c=relaxed/simple;
	bh=scrnhWy6rMUlkpUpOweP3I5fA6E5KfGFiyvMFOn9mn8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bN7O7D4bzcu+JvtHtytMw4suPx1iVJ7JYdqllSuOH64dlyF2wbsJEQMCRIn15l4ev2veN+/9grXbmLtxMiGU0817EMZeLYLoggyTHCeKrE4fpPKZVBwz2c/y3SuhLctXKIammHEl7/P5hHLEMVjrfyJNSOKzxIh+Kaxd/nGDnUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=USsmhKH6; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="USsmhKH6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1744010788;
	bh=scrnhWy6rMUlkpUpOweP3I5fA6E5KfGFiyvMFOn9mn8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=USsmhKH6wjFeUKz++3U5jar4ryLBzBg/8KQNbXR5VJRu2VnDNyuVrqH+2Jx2zogT+
	 B7qwPw34h5WHQAtkonY/ZFb/g1pWSxd5RVdvsLExVka9X9JhGeeupsmid7pSAEDG3T
	 k2dns+2USd0dQSS7KB1keIqYoG0Onid5kfqKNiYKGLEwJ5HMc6s46Dboc9dyoDmLNd
	 L8TSR2VROM8zw7xnJWyU6U2OewadfgdM4XucDPTB7Ql2Gxa8wsRxmyM027bHvqzqZs
	 iRV6NvUInGUvHRqz9jNfVaSgqbaZME5BffHybfPWxhnABmFrYoJiwEKFQGIPSccaJZ
	 F+176LzuwrdnQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 60C9317E0CBE;
	Mon,  7 Apr 2025 09:26:27 +0200 (CEST)
Message-ID: <6d2462ee-1303-4325-a244-6d3408f4d749@collabora.com>
Date: Mon, 7 Apr 2025 09:26:27 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: dts: mediatek: mt8395-nio-12l: Add scp
 firmware-name
To: Julien Massot <julien.massot@collabora.com>, kernel@collabora.com,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Ben Lok <ben.lok@mediatek.com>,
 Macpaul Lin <macpaul.lin@mediatek.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20250404-mt8395-scp-fw-v1-0-bb8f20cd399d@collabora.com>
 <20250404-mt8395-scp-fw-v1-1-bb8f20cd399d@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250404-mt8395-scp-fw-v1-1-bb8f20cd399d@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 04/04/25 15:53, Julien Massot ha scritto:
> Set the scp firmware name to the default location.
> 
> Fixes: 96564b1e2ea4 ("arm64: dts: mediatek: Introduce the MT8395 Radxa NIO 12L board")
> 
> Signed-off-by: Julien Massot <julien.massot@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


