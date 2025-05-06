Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8212824169A;
	Tue,  6 May 2025 08:26:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746520014; cv=none; b=pDScQtklVF7u5i1tYDrs7GqL9EMrtA405/PMWz/vbaO5L3LJgW3ZCqNIRupNd/tq64z1doQ4UrIBg14znzIFAp5A8oFokHTPvCJheF0gKI2k6KBfRjZVRC5jr9tROlXCcODMxlYvHOrOPndOL8qv43GaeKJ+Hb/sknDpBkWpvSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746520014; c=relaxed/simple;
	bh=5/lvtCn4OfSHJYnftDRpHjKKhmJr21mm7IievYxQBb4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=da0A9/t4xBNAdalclYWhPl/1dEs7yoCJj8lxWLzRIvhIA6CSYKex7/2qFd+reU+R+CLvNY91txn+PUKm0e11J9ef3wMRAL8MaPdStTKs74BMhduyhks7sf/7omhO5eY+IJK8+I7lYqz3nZIYJwWkrQGIR1IsCc1Tp8RWZBYNXr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=LLveXn7h; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="LLveXn7h"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1746520010;
	bh=5/lvtCn4OfSHJYnftDRpHjKKhmJr21mm7IievYxQBb4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=LLveXn7h/ttAVVmYwDGRrcsuwvaMPFlND0X+9PymIKVpGY20nEPS/SOtUWocGhMis
	 7ec5hu4g0fshcIjQPVGzrE0II1HTjZxR6Qe+ppNCOrzSQIub7nB6LuNK46YxGW+V1g
	 6Gr0sfbALi2/RauvU+s2UKJL5pXFQKItXY+SltPSNK+BJQ7/4FncvJaaRwIww4Abah
	 RB6dDSSunYddR92XjWVNOTSRdQET3BT+tLlW/a1hZd87yD7AwLE22XP3WbTAkR3RDZ
	 fwdqJGlEAscui8Rrc9a204xzE8CLP/z/w7Ra/wEHikAfyYkrAbeLEq5W6DiJxh07dD
	 f2L8HyqDzScJA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 82DA017E09BE;
	Tue,  6 May 2025 10:26:49 +0200 (CEST)
Message-ID: <0fd0c066-d203-437f-940e-ca355100bbc6@collabora.com>
Date: Tue, 6 May 2025 10:26:48 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: mediatek: mt8365: Describe infracfg-nao
 as a pure syscon
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Alexandre Mergnat <amergnat@baylibre.com>,
 Amjad Ouled-Ameur <aouledameur@baylibre.com>,
 =?UTF-8?Q?Bernhard_Rosenkr=C3=A4nzer?= <bero@baylibre.com>,
 Fabien Parent <fparent@baylibre.com>
Cc: kernel@collabora.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20250502-mt8365-infracfg-nao-compatible-v1-0-e40394573f98@collabora.com>
 <20250502-mt8365-infracfg-nao-compatible-v1-2-e40394573f98@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250502-mt8365-infracfg-nao-compatible-v1-2-e40394573f98@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Il 02/05/25 18:43, Nícolas F. R. A. Prado ha scritto:
> The infracfg-nao register space at 0x1020e000 has different registers
> than the infracfg space at 0x10001000, and most importantly, doesn't
> contain any clock controls. Therefore it shouldn't use the same
> compatible used for the mt8365 infracfg clocks driver:
> mediatek,mt8365-infracfg. Since it currently does, probe errors are
> reported in the kernel logs:
> 
>    [    0.245959] Failed to register clk ifr_pmic_tmr: -EEXIST
>    [    0.245998] clk-mt8365 1020e000.infracfg: probe with driver clk-mt8365 failed with error -17
> 
> This register space is used only as a syscon for bus control by the
> power domain controller, so in order to properly describe it and fix the
> errors, set its compatible to a distinct compatible used exclusively as
> a syscon, drop the clock-cells, and while at it rename the node to
> 'syscon' following the naming convention.
> 
> Fixes: 6ff945376556 ("arm64: dts: mediatek: Initial mt8365-evk support")
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


