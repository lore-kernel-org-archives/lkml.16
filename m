Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 761331459F6;
	Wed,  5 Feb 2025 14:21:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738765314; cv=none; b=rBp8MaIG3CburBzh7/hw2hG/XBduqdIf2ZWX/GmeCDHXxaHJ6ILPgCTajI9hF+OvWvaMquiuvn5vLg7qKIGrA7BpG+ZJd0RUzCK7hSUP4IMPcKymRmhf05I7QA3eOFAkfae7oF/00GwTcSNcQ1QqXemnGvWnYXF4uH8MFSGC35M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738765314; c=relaxed/simple;
	bh=awJw8hGERuh9EYSPZmSq+mZgDVBmZ4HItMI82GEM1j4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZmyZ3a+YnriJq3P0TFrLDpqioDh+zQ8cuRX//QQRnxYt4cKrQ5DElUTlP8a2L0d34PmDYE40t4MD8PVfBFgtf0A9DBRcm5FiBcFIIaNAbgUhQtfDoKPQrMpM0cebWxFJUCbIO26lcXBlAYgJYxPYOKA9NNp12U4H6gNX4MM2Z+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=CPD6pYws; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="CPD6pYws"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1738765310;
	bh=awJw8hGERuh9EYSPZmSq+mZgDVBmZ4HItMI82GEM1j4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=CPD6pYws5GH58wZmmVdEdySatarUOHrKHeTC2l1n3A68FTjz5kfJxN+4qo+f0mbkr
	 oFN4XTl4ZBXoid2+Lk42UiHVw7pAaw7SA92CI1Bjdw+VbmfIEV87Mc3W8awEVKjEUT
	 km326l2LhKzJRXlfZyvzI+RDKwcjOoAW6sMcmeIwpCG6E6UhVWE43o73x3xOe9MkEB
	 SskzzkU03iFjp60QSvJRrxhZz2Q0+MqsV9DNJxyXhdmfZeeYAslUXfOnsvhH0zb/TQ
	 a6Km8YNjj/tCxePXhB4ehrm2thGvLBkrJrImx7f66XNAf52JHWk3usXh99HbXKeoMq
	 uucXNxt/e5P2A==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id D543217E1539;
	Wed,  5 Feb 2025 15:21:49 +0100 (CET)
Message-ID: <9f936145-87e9-4a02-9dcb-800659c08a17@collabora.com>
Date: Wed, 5 Feb 2025 15:21:49 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] arm64: dts: mediatek: add support for MT8370 SoC
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Sean Wang <sean.wang@mediatek.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 kernel@collabora.com
References: <20250115-dts_mt8370-genio-510-v2-0-fc9b01d08834@collabora.com>
 <20250115-dts_mt8370-genio-510-v2-2-fc9b01d08834@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250115-dts_mt8370-genio-510-v2-2-fc9b01d08834@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 15/01/25 11:29, Louis-Alexis Eyraud ha scritto:
> This commit adds the support of the Mediatek MT8370 SoC.
> It is a less powerful variant of MT8390 SoC and their
> main differences are:
> - Arm Cortex-A55 cores number (4 vs 6)
> - Arm Cortex-A78 core speed (2.0 GHz vs 2.2 Ghz)
> - Arm Mali-G57 GPU core number (2 vs 3)
> 
> Like MT8390, MT8370 hardware register maps are identical to MT8188.
> 
> Note:
> In this commit, the mt8370.dtsi does not contain the needed overrides
> to support the Mali GPU (to be done in a future commit).
> 
> Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>

Please don't say "this commit does this".

Example:
Add support for the MediaTek MT8370 SoC, a less powerful variant of....

and then [....]

Note:
The devicetree for MT8370 does not currently contain the needed overrides
to support the Mali GPU integrated into this SoC. This is scheduled to be
done with a later change.

Please fix the commit description, after which:

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


