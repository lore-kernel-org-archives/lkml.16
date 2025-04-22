Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28E1C27602A;
	Tue, 22 Apr 2025 13:44:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745329448; cv=none; b=boRwM/JzB4ckL3/ouKoHGkC3k+wPekVOlRj9wUfg6pZSHaDZmc0SG5qC3SGV9sN/r0hD6t0BSLx7k4AVyY67doqaKBdnvcNn0cmmPeTL0X6xZ7x3iFKv5AMH/iFMAxCKSguA0ww3bisJ4s5zy/s/ER6G/63rTdYLEq8iLpMcN8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745329448; c=relaxed/simple;
	bh=4DLjZ0GtZDfpf9Y+X2fCfeTSaPWs41kU9nP2/X/cyNQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LvERvGE3KrotChR0Uso927GdwcOCo5JqpdzwCJBMuNVxYhIWL6L19g/I3HxZT049za1I3CEsaUhd4z+Ld3kTwWOHxkd46NpLFJYHwerLCPFFKSLYgy+DaWwupHpROg6RAx4PAnDbWFK/K4jwSoS9dNU5V548QFE43XuEKqnROMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=J1IHv8tU; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="J1IHv8tU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1745329444;
	bh=4DLjZ0GtZDfpf9Y+X2fCfeTSaPWs41kU9nP2/X/cyNQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=J1IHv8tU3VNYbRw81M3WLG61BspSVXRPAMqt1cHr7qQ7MUvmm1t7TdYn+ZzuOksJG
	 quEMnv9lDyFzOvHLPVoDogC1M+3+SnkMNsTOhIY9vyzCST4ot8aYVcXpaMtl3hgTYR
	 wf+Q6A9iFdOUMZyUFJgrzx7QvKzmouCx3iTT25yBOoMd2ci2Z6ws2dvbUSHv8sfqlp
	 HdDHDiVcZkLxk/r0y7vAoh4KqXgtF+KCO2NW5cb0EWK5u8ctyTiatgHnRDGtDT7aeX
	 zgOWyzkWJAGhFdB/OdYy8pG0axAzSBNr0d5uEMEOtXbeOxfVMDLaOQ9Vv7WoK6D7Br
	 C5QmxkLJ/yANw==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C1EAA17E0B9D;
	Tue, 22 Apr 2025 15:44:03 +0200 (CEST)
Message-ID: <4f4a1761-dbb3-4c95-8c68-359c7e9ae6b4@collabora.com>
Date: Tue, 22 Apr 2025 15:44:03 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: mailbox: mediatek,gce-mailbox: Add support
 for MT6893
To: Rob Herring <robh@kernel.org>
Cc: jassisinghbrar@gmail.com, krzk+dt@kernel.org, conor+dt@kernel.org,
 matthias.bgg@gmail.com, houlong.wei@mediatek.com,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 kernel@collabora.com
References: <20250416120230.147844-1-angelogioacchino.delregno@collabora.com>
 <20250421213833.GA2966253-robh@kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250421213833.GA2966253-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 21/04/25 23:38, Rob Herring ha scritto:
> On Wed, Apr 16, 2025 at 02:02:30PM +0200, AngeloGioacchino Del Regno wrote:
>> Add a compatible string for the MediaTek Dimensity 1200 (MT6893)
>> SoC using MT8195 as a fallback, and add a header for the GCE
>> mailbox found in MT6893.
>>
>> Similarly to MT8195, this SoC has two GCE hardware instances, but
>> the event values are different (hence requiring its own header).
>>
>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> ---
>>   .../mailbox/mediatek,gce-mailbox.yaml         |   4 +
>>   include/dt-bindings/gce/mediatek,mt6893-gce.h | 312 ++++++++++++++++++
>>   2 files changed, 316 insertions(+)
>>   create mode 100644 include/dt-bindings/gce/mediatek,mt6893-gce.h
>>
>> diff --git a/Documentation/devicetree/bindings/mailbox/mediatek,gce-mailbox.yaml b/Documentation/devicetree/bindings/mailbox/mediatek,gce-mailbox.yaml
>> index 73d6db34d64a..277d290d852b 100644
>> --- a/Documentation/devicetree/bindings/mailbox/mediatek,gce-mailbox.yaml
>> +++ b/Documentation/devicetree/bindings/mailbox/mediatek,gce-mailbox.yaml
>> @@ -19,6 +19,7 @@ properties:
>>       oneOf:
>>         - enum:
>>             - mediatek,mt6779-gce
>> +          - mediatek,mt6893-gce
>>             - mediatek,mt8173-gce
>>             - mediatek,mt8183-gce
>>             - mediatek,mt8186-gce
>> @@ -29,6 +30,9 @@ properties:
>>         - items:
>>             - const: mediatek,mt6795-gce
>>             - const: mediatek,mt8173-gce
>> +      - items:
>> +          - const: mediatek,mt6893-gce
>> +          - const: mediatek,mt8195-gce
> 
> You shouldn't have with and without a fallback.
> 

OOOPS! Sorry, that wasn't intentional - I was meaning to add mt6893-gce to the
enum only, without that mt8195 fallback.

Will send a v2, thanks for pointing out!

Cheers,
Angelo

>>   
>>     "#mbox-cells":
>>       const: 2



