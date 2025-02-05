Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C06211519BE;
	Wed,  5 Feb 2025 14:21:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738765312; cv=none; b=SHZarVUiAvKca6KFUUOJIloDHGyoWnyGzqeXdkOHN/FC/twWgn2sqigo8zWlBsrWKl7hGKjdYKZhz3ve1akgNt/oALFzAgnCrjfPLhD7awu1Cp5wk6rfld5oHd+3B2sndyX5ccPMPK98I25FWT/hKWE+Fg3rEUSIQoKKgo7AJhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738765312; c=relaxed/simple;
	bh=fhMEwcALAhSfK+SWPU9qQDr85DpG/Eze5bn+xtW7Z4I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WGJ1a0ys5rr2q56E7hwtQMC/RUqcWpPMXd7NTyfvO5Y4jH4K2fKTRrUapwTIB21rdsMl6OCtvYLU0xntYGJl5bwQx5gOEQI5zMIyZ9QIg94bPtHG9Yi73Kvvy+k9efUX7FuGy0GX+xvKL92NDdhpZNATow+KgpLFprnPlosq2Oc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=Drbhifpm; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="Drbhifpm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1738765308;
	bh=fhMEwcALAhSfK+SWPU9qQDr85DpG/Eze5bn+xtW7Z4I=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=DrbhifpmzXk3n6sKkMH891McvA2rfGevLNNwxdqOuE5qZGNITVOXx6bZBzTJ/TEaX
	 wAb7wOkk7PCzGg0+DiFM0FmZdTSIJUzsKoJPWYYnKyCqDRXlsaRUSxUjpXKaCN83Gs
	 eqJqE4z2CRGnz57Z7NUeyjif7aW9XQlMM2xq51Obyg/fh0YYdAp1U6yK7glHGBQxVv
	 qXp4jKAHq4T6GH2t0W1OHAGMDoxggPLXkz7UhggqGtHDTeCIJtQQ1XibX3ZwRITdqp
	 aWcpQBY3KglIt2YK9PYTq4SZldTHOkjm9yDbBBsT9bmz6oSyVwHCAeExLuFzYCQQRs
	 ZIybmSCm7sQ2w==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3ACE517E1519;
	Wed,  5 Feb 2025 15:21:48 +0100 (CET)
Message-ID: <83a354d0-e220-449e-b03a-12012ab0d5b6@collabora.com>
Date: Wed, 5 Feb 2025 15:21:47 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] dt-bindings: arm: mediatek: add mt8370-evk board
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Sean Wang <sean.wang@mediatek.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 kernel@collabora.com
References: <20250115-dts_mt8370-genio-510-v2-0-fc9b01d08834@collabora.com>
 <20250115-dts_mt8370-genio-510-v2-1-fc9b01d08834@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250115-dts_mt8370-genio-510-v2-1-fc9b01d08834@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 15/01/25 11:29, Louis-Alexis Eyraud ha scritto:
> 1. Add compatible for MT8370.
> 2. Add bindings for the MediaTek mt8370-evk board, also known
> as the "Genio 510-EVK".
> 
> The MT8370, MT8390 and MT8188 belong to the same SoC family.
> It is a less powerful variant of MT8390 SoC and their main
> differences are:
>   - Arm Cortex-A55 cores number (4 vs 6)
>   - Arm Cortex-A78 core speed (2.0 GHz vs 2.2 Ghz)
>   - Arm Mali-G57 GPU core number (2 vs 3)
> 
> Like MT8390, MT8370 hardware register maps are identical to MT8188.
> 
> Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>

Since you have to resend the series, please remember to add Conor's Ack
that was released in v1; in v2, this commit didn't change at all.

Meanwhile... please also collect my

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
