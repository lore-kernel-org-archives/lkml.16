Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A80B42D77F2;
	Thu,  3 Jul 2025 11:48:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751543338; cv=none; b=KN7q1U/CmaWRQQhFDKAQaOmoPn5C7J2KLh7tmV/tAb8OIcNU0idWxKklOCNx666I2gLM/tMrIL/KrYtC2YWQWRa/D1F6TIoenY77a4i4/8dF7G0q03d3gcww+B7MPCFF7+uGnoSK0CrVBx42JyK39K5Rzad/MWty8lYJZuVXYcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751543338; c=relaxed/simple;
	bh=A20LFGjNp+gZfOV/c+s4NxwTMpmAgEjZ3epNnBK6ubI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TiIuoWR1UMpBL4q/2nNax4VAw/fEnQ/c2sg7hvOdsEqAhmdxBwWggwlbZaJ0rEFrFuDgFOiyF2ZfpmyFpVcmL0jbgXQh4yirRATFOUlbzx626ck41MNgFE+cxoHZyLzb23nZYdTbPG/Rc/phKqCTMNFRsv2Xz77Wrd6vPlY+f3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=pYmAqzRK; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="pYmAqzRK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1751543333;
	bh=A20LFGjNp+gZfOV/c+s4NxwTMpmAgEjZ3epNnBK6ubI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=pYmAqzRKKwXxndgRMsp7Ue/kMz/YJIN4bFZKXJxaUMrQGS/f/MO1aa22l3DVpB3is
	 Vk284nYKACgB0LiXWw3JEWGv+5dQFVHDdQMRzmQ8jitoYGGc7W7QMMxGriePUGgMQz
	 fl30PmBCXWuFgu8ULKXUokZhiDDvrXUKvliRf/kuBgw46dbtw7JCZ4bMm9Lo51lRcQ
	 mFmf6uWIW4HawaDXDILRmBNYHoQITYS9Lv7Ejg4v44N2hmhvWQzZGgboKzoP+ple4X
	 BPP4rIoPMxtmW6LHwp5yK9CejrlKQeXwnntJvE0vqJn044Xj9IUlHn03znwAnkAdrs
	 MpozlXGbRJx8A==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 1CD5D17E07FF;
	Thu,  3 Jul 2025 13:48:53 +0200 (CEST)
Message-ID: <5ee16a72-01a0-4f2c-9bcb-e4b4b069b2dd@collabora.com>
Date: Thu, 3 Jul 2025 13:48:52 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] arm64: mediatek: Enable efuse GPU speed bin
 post-processing
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Lala Lin <lala.lin@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Andrew-CT Chen <andrew-ct.chen@mediatek.com>
References: <20250610063431.2955757-1-wenst@chromium.org>
 <CAGXv+5HDAZ-MBBMk00O+cdcq55KnsKdEAMD7E2uaAf=2LY=1cg@mail.gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <CAGXv+5HDAZ-MBBMk00O+cdcq55KnsKdEAMD7E2uaAf=2LY=1cg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Il 01/07/25 11:15, Chen-Yu Tsai ha scritto:
> Hi Angelo,
> 
> On Tue, Jun 10, 2025 at 2:34 PM Chen-Yu Tsai <wenst@chromium.org> wrote:
>>
>> Hi everyone,
>>
>> This is v2 of the MT8188 efuse GPU speed bin post-processing enablement
>> patches. In v1 [1] the change was made to the driver. Angelo, the platform
>> maintainer believes the change should be made to the DT binding instead
>> [2]. v2 adopts Angelo's argument.
>>
>> Patch 1 updates the efuse DT binding so that MT8186 is a base compatible
>> with no fallback, and MT8188 falls back to MT8186.
>>
>> Patch 2 updates the MT8188 DT to follow the new binding.
>>
>> If possible I would like to see both patches merged through the soc
>> tree once the DT binding maintainers give an ack. This avoids prolonged
>> waiting for the binding changes to land and uncertainty about whether
>> things have fully landed or not.
>>
>>
>> Thanks
>> ChenYu
>>
>> [1] https://lore.kernel.org/all/20241223100648.2166754-1-wenst@chromium.org/
>> [2] https://lore.kernel.org/all/11028242-afe4-474a-9d76-cd1bd9208987@collabora.com/
>>
>> Chen-Yu Tsai (2):
>>    dt-bindings: nvmem: mediatek: efuse: split MT8186/MT8188 from base
>>      version
>>    arm64: dts: mediatek: mt8188: Change efuse fallback compatible to
>>      mt8186
> 
> Friendly ping. Please take a look and see if this scheme is to your liking.
> 

For the whole series

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> 
> Thanks
> ChenYu
> 
>>   .../bindings/nvmem/mediatek,efuse.yaml          | 17 +++++++++++++++--
>>   arch/arm64/boot/dts/mediatek/mt8188.dtsi        |  2 +-
>>   2 files changed, 16 insertions(+), 3 deletions(-)
>>
>> --
>> 2.50.0.rc0.604.gd4ff7b7c86-goog
>>


