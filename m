Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 731E1239E78;
	Mon, 30 Jun 2025 07:52:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751269978; cv=none; b=bInw2NfxOHKSEhY0Ciwwe1AFaZ/o+rEoVfyHdZ/YueVAcE3r3MOMOKUI2IoZah0gZo+wLvzUuRStoPmpqXbD4W5o+1tMaNuFzllorHxo/F2BFAg9Fs2ZqNwgpPHXQW5JgQEGRzVXdOeHvjNW/GmTpjSvZi+jwDoxZBzUE69SzT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751269978; c=relaxed/simple;
	bh=F4dN++TbVjarRlIMkNwmoUP9mUy+taXHwWY073gkpLI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jyCuk3hTPCc7I+U7wPXChKyZQasmdb1627OA9YjSEreDxHRwMxk6WbXqTWAF3dnMrWHu2i3e90sHdsxTkeLe/A3W6P2zf4IZrD4y/n8WItVQ7hwP5J1906HkDGVAAkJYY+1Air49eB+5NNVCz8w7ORNyDkOrrczDXEE7Hp9y3xY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=X1qzCi4a; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="X1qzCi4a"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1751269974;
	bh=F4dN++TbVjarRlIMkNwmoUP9mUy+taXHwWY073gkpLI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=X1qzCi4a6sZ+fy5WJ4JZADlnr9O/1cCWEIIRDCBxrBLYUPVapMum6TTLTwo1WRkiU
	 pnjTWkvKzeRRIu2W+JiUeYhXCGo+ZgLjnRgehgEmndKhlNzKjV1597Ry9ERBOHFqcn
	 WvRoSTsqEvNu3XpwBAii7E+jOzPedFPBpdjBfty339KiF/WdSMXERm22akYtEGRQUG
	 hAvNRcxR547RCyEiRzsW7oQ3pwz7eeXt4nNjnnF3MaEqonMiIW94J089z2KePOHvCx
	 qOFZW67huLbUxkwKlR0fZXoHCDRU6vVfQ6mMC1f+z+BVo2hVcgdCi/yTAhSncWeUhV
	 dkOE94Xq2N87g==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id DD1CD17E0B0D;
	Mon, 30 Jun 2025 09:52:53 +0200 (CEST)
Message-ID: <c5dffc8c-2abe-4fd3-a062-6d1adb417d27@collabora.com>
Date: Mon, 30 Jun 2025 09:52:53 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/6] dt-bindings: regulator: Document MediaTek MT6363
 PMIC Regulators
To: Chen-Yu Tsai <wenst@chromium.org>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: broonie@kernel.org, lgirdwood@gmail.com, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, matthias.bgg@gmail.com,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 kernel@collabora.com
References: <20250624073548.29732-1-angelogioacchino.delregno@collabora.com>
 <20250624073548.29732-4-angelogioacchino.delregno@collabora.com>
 <20250627-neon-hidden-sheep-ed8dae@krzk-bin>
 <CAGXv+5GLJ7cfAQW_kbTqqe_QO+RfU7KL57n77qenpDiRS5BybA@mail.gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <CAGXv+5GLJ7cfAQW_kbTqqe_QO+RfU7KL57n77qenpDiRS5BybA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Il 30/06/25 05:25, Chen-Yu Tsai ha scritto:
> On Fri, Jun 27, 2025 at 4:24 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>>
>> On Tue, Jun 24, 2025 at 09:35:45AM +0200, AngeloGioacchino Del Regno wrote:
>>> Add bindings for the regulators found in the MediaTek MT6363 PMIC,
>>> usually found in board designs using the MT6991 Dimensity 9400 and
>>> on MT8196 Kompanio SoC for Chromebooks, along with the MT6316 and
>>> MT6373 PMICs.
>>>
>>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>>> ---
>>>   .../regulator/mediatek,mt6363-regulator.yaml  | 123 ++++++++++++++++++
>>>   1 file changed, 123 insertions(+)
>>>   create mode 100644 Documentation/devicetree/bindings/regulator/mediatek,mt6363-regulator.yaml
>>>
>>> diff --git a/Documentation/devicetree/bindings/regulator/mediatek,mt6363-regulator.yaml b/Documentation/devicetree/bindings/regulator/mediatek,mt6363-regulator.yaml
>>> new file mode 100644
>>> index 000000000000..f866c89c56f7
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/regulator/mediatek,mt6363-regulator.yaml
>>> @@ -0,0 +1,123 @@
>>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>>> +%YAML 1.2
>>> +---
>>> +$id: http://devicetree.org/schemas/regulator/mediatek,mt6363-regulator.yaml#
>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>> +
>>> +title: MediaTek MT6363 PMIC Regulators
>>> +
>>> +maintainers:
>>> +  - AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>>> +
>>> +description:
>>> +  The MT6363 SPMI PMIC provides 10 BUCK and 26 LDO (Low Dropout) regulators
>>> +  and can optionally provide overcurrent warnings with one ocp interrupt
>>> +  for each voltage regulator.
>>> +
>>> +properties:
>>> +  compatible:
>>> +    const: mediatek,mt6363-regulator
>>> +
>>> +  interrupts:
>>> +    description: Overcurrent warning interrupts
>>
>> Are you sure interrupts are physically not connected?

Yes, I'm sure, they are not.

> 
> Side note:
> 
> I wonder if we really need to describe _all_ the interrupts here.
> 
> Looking at the PMIC as a whole, the interrupt tree is something like
> 
> SoC <- SPMI inband IRQ - PMIC top level IRQ block <- sub-function IRQ blocks:
> 
>      - BUCK (buck regulator over current)
>      - LDO (LDO regulator over current)
>      - PSC (key press / system low voltage)
>      - MISC (protected registers accessed / SPMI stuff)
> 
> And some other blocks that may apply to other MediaTek PMICs:
> 
>      - HK (some threshold triggered interrupt)
>      - BM (battery management related)
> 
> The thing I'm trying to get to is that all these interrupt vectors are
> internal to the whole PMIC. Do we really need to spell them out in the
> device tree? The top level compatible should already imply how all the
> internals are wired up.
> 

Chen-Yu:

Yes, we do: not all boards need overcurrent protection on all of the rails, but
especially, in the past I have seen (multiple times) board designs (not MediaTek,
but that doesn't mean anything) that will trigger the overcurrent protection due
to a high inrush upon rail enablement - in these cases, the ocp would have to be
either ignored completely or reset and read after a while.

Not only that: since not all rails are actually used, due to EMI (and other issues
which usually mean suboptimally built boards) some of those may randomly trigger
OCP, and that's another case in which that should be ignored.

So... yes, we want to define the overcurrent interrupts in the devicetree.

> 
> ChenYu
> 
>>> +    minItems: 1
>>> +    maxItems: 36
>>> +
>>> +  interrupt-names:
>>> +    description:
>>> +      Names for the overcurrent interrupts are the same as the name
>>> +      of a regulator (hence the same as each regulator's node name).
>>> +      For example, the interrupt name for regulator vs2 will be "vs2".
>>
>> You need to define the items or pattern if this is really flexible in
>> the hardware (not drivers).

krzk:

It's flexible in the hardware... but how do I define a pattern here?
I avoided to define the items because you can miss some; I mean....

You may have, on one board:
"vs1", "vsram", "someother", "another"

on another: "vsram", "another"

...and another: "vs1", "another"

(etc etc)

Is there any way to allow missing items in between?
Because then there's 36 possible items, so there are more than 100 possible
combinations (keeping the order, but missing something in between..!).

Cheers,
Angelo



