Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 125C32673BF
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 09:44:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747734294; cv=none; b=SZVYV+4kefgpQAL/0ESc92eW2HbCeNRvY0K+JKuk9JG9bWU7zQD4fLTsHOs6Pt2f/7uqYg3+w02V/HCJKbupJ0KN3xa5d7zJJiFEwvNuRktCktOC27kRCAwQmPP5q8V33Gj6RqgkhvQYRVb6Ra4ws1F46F0U1i36rYdDv/0tfuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747734294; c=relaxed/simple;
	bh=gjINz9uiF82laonOGCkrVhCsstIccSKEkL8/9FoB2Jg=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=KxPQK8WCM87qHUlnlN38mpaOL8znaTRr450H8VR8PO7nuHu2HWAD6MAhvknI3mzr3ZxT027NXHEw11hXZ7gcJivLHz0sTXJj1EbsUVZ9ghwRpLJP3cr8yUSQfV/r/7+YRGEberl8e1/YoBMHS0MUf/eT1axaKFVv3L9dhTYvZHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=qki1B+iD; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="qki1B+iD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1747734291;
	bh=gjINz9uiF82laonOGCkrVhCsstIccSKEkL8/9FoB2Jg=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=qki1B+iDnNJlHSVPEnvwDNvY0SpzsE5W7asy3yFGY/r5+EirpGYlvGx7VXNrf8Ba4
	 WVtVPwJyC5X6HGSdFJbptixBER+eIZWxo1EGRC4RDJXLmAiNoOEnMiSnLVd2mmi4hm
	 bhBYuOWiPFpQc1geBJuQghbL3dCy7ZdmKdaoSEkwlIgxrqzyZvvqNg9pBy4xOsfrGj
	 /xdTpTGrVvwEmyECRYlv9GcJLBsAortbL/JeIFH18uDfAROifqW1H44tRZLECycdTs
	 1P0bXlJHa4NTZ0ft75F1P63lE7gkSabQccoc695xbEE50a6PWhKiEj9cG6XT99IORX
	 xuvQQ3bMcCeVg==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 92DD717E1045;
	Tue, 20 May 2025 11:44:50 +0200 (CEST)
Message-ID: <c3162ca8-2539-409f-885e-a08696c72e27@collabora.com>
Date: Tue, 20 May 2025 11:44:49 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: defconfig: Enable configs for MediaTek Genio EVK
 boards
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>
Cc: kernel@collabora.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
References: <20250513-genio-defconfig-v1-1-c3862f91b6b2@collabora.com>
 <174773424476.2901578.7109647684484482687.b4-ty@collabora.com>
Content-Language: en-US
In-Reply-To: <174773424476.2901578.7109647684484482687.b4-ty@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Il 20/05/25 11:44, AngeloGioacchino Del Regno ha scritto:
> On Tue, 13 May 2025 16:59:41 -0400, Nícolas F. R. A. Prado wrote:
>> Enable the missing configs to get all devices on the MediaTek Genio
>> 1200, 700, 510 and 350 EVK boards probing, as indicated by the DT
>> kselftest.
>>
>> This includes support for:
>>
>> Genio 1200/700/510/350:
>> * MT6359/MT6357 PMICs Auxiliary ADC
>>
>> [...]
> 
> Applied to v6.15-next/dts64, thanks!

Wrong branch, it's v6.15-next/defconfig, sorry :-)

> 
> [1/1] arm64: defconfig: Enable configs for MediaTek Genio EVK boards
>        (no commit info)
> 
> Cheers,
> Angelo
> 
> 


