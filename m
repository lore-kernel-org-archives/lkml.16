Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4EDF13B7A3;
	Thu, 15 May 2025 15:11:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747321880; cv=none; b=Q6Efo/wFT0Ua3PSg6EFpMkOwVJYoRYgoxkbGa2ArhtAeRy1L/DLFXFKPK+KVbNXLb47GsHpn+vzuji0wXtfrJhyPXy7SWcZ2zbmgxk9jJm6oc1gh4g6LsrVDbX7Mm8lw3ZlzJsKUoSjO20zS3Jihda9CAHmn6w1wD0mp6hFwmOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747321880; c=relaxed/simple;
	bh=X3Dg1aIIyiODeevYtcoMV/eCFObvTdGT9GPFfSk5gis=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dmSMILOBxZiIwl+Lx3A+HEc5zWT+I5TnqgNzl15XvWnsUVHemScKOsu5Vj4pmzEcvWlANRh1ZjRd+PFu9AXs0ypSQt7R1BbUv8hgnzV0CiJQmXAJSHXXctFlZ+Hfd9mykBBG9ZbdXmqXRAe2PFUqc1A/TVYl2ptFzU6gtNzRcQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=LReNZ4m2; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="LReNZ4m2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1747321874;
	bh=X3Dg1aIIyiODeevYtcoMV/eCFObvTdGT9GPFfSk5gis=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=LReNZ4m2ieD9KPscuI37q3qPeSnhXB4sbnjqzBI/3cDxVPK/OQysaTXJDNqBiJc4W
	 0BEQFt6ssqmEaErwYOisMATNcuGkLR1HPkDXBvGIYrCiLtGj2lZQafz89Gki3zGPOv
	 sXmPiJ+vun1YCBkKx+u2Uia+Gbuhrz7oMu32w8b35uqORf7m8Tt7+vHHwGA2au58vO
	 uKse1vMMbCFyWnmuCIu1BoGrV+10ijkAl8/8CxBd+87cT/m4RYFfm+yBCGA1581zwi
	 8JzZvjt3abMvkOC1ABtbPQOfj/qFfRKq5wEwdXIkjn0s2eimCNMzXyTIxglNdGxySi
	 /Dgg9YyEY0vEA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id BFAF017E05F0;
	Thu, 15 May 2025 17:11:13 +0200 (CEST)
Message-ID: <cbd170a3-cbfe-4b4f-a059-efe33fed0e5d@collabora.com>
Date: Thu, 15 May 2025 17:11:13 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: clock: mediatek: Add #reset-cells
 property for MT8188
To: Conor Dooley <conor@kernel.org>,
 Julien Massot <julien.massot@collabora.com>
Cc: kernel@collabora.com, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Garmin Chang <garmin.chang@mediatek.com>,
 Friday Yang <friday.yang@mediatek.com>,
 Conor Dooley <conor.dooley@microchip.com>, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20250515-dtb-check-mt8188-v1-0-cda383cbeb4f@collabora.com>
 <20250515-dtb-check-mt8188-v1-1-cda383cbeb4f@collabora.com>
 <20250515-playpen-dislodge-80245fb8b7a9@spud>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250515-playpen-dislodge-80245fb8b7a9@spud>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 15/05/25 17:03, Conor Dooley ha scritto:
> On Thu, May 15, 2025 at 03:31:43PM +0200, Julien Massot wrote:
>> The '#reset-cells' property is required for some of the MT8188
>> clock controllers, but not listed as a valid property.
> 
> "required for some" but not marked required on those platforms.
> Why not?
> 

Yeah now that I read that for the third time, the wording is a bit incorrect.

It's not "required", some clock controllers do have reset controllers, but it
is facultative to actually use the latter.

I'm not sure if the ones that do have reset controllers inside should have the
#reset-cells property as required...

Conor, what do you think?

Cheers,
Angelo

>>
>> Fixes: 9a5cd59640ac ("dt-bindings: clock: mediatek: Add SMI LARBs reset for MT8188")
>> Signed-off-by: Julien Massot <julien.massot@collabora.com>
>> ---
>>   Documentation/devicetree/bindings/clock/mediatek,mt8188-clock.yaml | 3 +++
>>   1 file changed, 3 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/clock/mediatek,mt8188-clock.yaml b/Documentation/devicetree/bindings/clock/mediatek,mt8188-clock.yaml
>> index 2985c8c717d72888dd49f1f6249a9e2594d8a38d..5403242545ab12a7736ed4fbac26008aa955c724 100644
>> --- a/Documentation/devicetree/bindings/clock/mediatek,mt8188-clock.yaml
>> +++ b/Documentation/devicetree/bindings/clock/mediatek,mt8188-clock.yaml
>> @@ -52,6 +52,9 @@ properties:
>>     '#clock-cells':
>>       const: 1
>>   
>> +  '#reset-cells':
>> +    const: 1
>> +
>>   required:
>>     - compatible
>>     - reg
>>
>> -- 
>> 2.49.0
>>

