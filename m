Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 953B710F2;
	Tue, 15 Apr 2025 07:26:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744701967; cv=none; b=MuXkpa49LTwWfPJsp6MXigcTloSuIWOkjpFzZvfyNoHVURanCBbm28S0Mw8ic4wkkmlr5K32OBR4CYdgkUI81pPX/FAVuClm+yDfubC3s/r9JgGH2Algl0TH42V7CWZDIYRX3toBN43KA72rGLdpRoKv0xllCX46zbH4YQ8LwG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744701967; c=relaxed/simple;
	bh=gexzkna3532lP1292T+3u7k+7579AwNhCBaiG48e/ig=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=fUJivRT3fXXRq3uGm6UPkXOAMI99A9vJs8P3JQdSaobi5shIwqcmOErW1Bj2eQUt3whQKgy+Lt91sE53ASoI4+mmUznOaeH0OOiYYvJ/0/ghSRoN426NRxx5DI561CP8tXLcNeZgooVgZ37RJYZnWVIjgFT2bxHDvtN2fJbw4Y0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=VfLwaAOT; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="VfLwaAOT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1744701963;
	bh=gexzkna3532lP1292T+3u7k+7579AwNhCBaiG48e/ig=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=VfLwaAOTqt0rkldA6m+sC5Leio/nx3iXCEvQFuLaWHwme2tzURuBSfEPJ2uvppO6P
	 6a6ykFP5VgDHggJlvD38OIRr8wmldySQ5UpLHL6t4y4akogGbesn6RhwCU/jvlC83M
	 FSSrxmBZrVeQNJqYl9zfBcWUDa+HDVhllFq1HH24v9g5d1kMHM+FLBUx4H6jTdlKJ6
	 szTsWU6stkPLJyPwcVhSQnyNzgTpJbfRXgDhyKV81L5PIC+7q3KYhAE+UxzkceL6RE
	 rZaaGhEB6DwH2da/ZAegGq92JRYimsPcRrWieBO9NnltEIUlMTGVEYyw0ofxJsdBpm
	 lQkVJsqsWZ6Og==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 10CC117E0CA7;
	Tue, 15 Apr 2025 09:26:03 +0200 (CEST)
Message-ID: <af9ce106-474c-468c-87fe-8305708a4d11@collabora.com>
Date: Tue, 15 Apr 2025 09:26:02 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: mediatek: mt8390-genio-common: Add jack
 detection with accdet
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?=
 <nfraprado@collabora.com>
Cc: kernel@collabora.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20250304-genio700-accdet-dts-v1-1-86d77c5cc745@collabora.com>
 <174462439206.45420.6727023772221653939.b4-ty@collabora.com>
Content-Language: en-US
In-Reply-To: <174462439206.45420.6727023772221653939.b4-ty@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Il 14/04/25 11:53, AngeloGioacchino Del Regno ha scritto:
> On Tue, 04 Mar 2025 18:43:49 -0300, Nícolas F. R. A. Prado wrote:
>> Enable audio jack detection for the Genio 700 and 510 EVK boards. This
>> is handled by the MT6359 ACCDET block, which on these boards has the
>> HP_EINT pin pulled high and connected to a normally open 3.5mm jack.
>>
>> Add a phandle to the accdet in the sound card node so the machine sound
>> driver can initialize the accdet.
>>
>> [...]
> 
> Applied to v6.15-next/dts64, thanks!
> 
> [1/1] arm64: dts: mediatek: mt8390-genio-common: Add jack detection with accdet
>        commit: 691712b065d349bde7d5561aa8e1857d38b7c65a
> 
I dropped this as I have just acknowledged that bindings were not accepted.

Cheers,
Angelo
