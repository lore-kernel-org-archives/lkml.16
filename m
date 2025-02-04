Received: from sender4-pp-o92.zoho.com (sender4-pp-o92.zoho.com [136.143.188.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 673A221638A;
	Tue,  4 Feb 2025 17:07:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.92
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738688856; cv=pass; b=lgcv/nkox5NgrTu2VZoNnESoi2l6sLbAuBg1YkJ5LA8NPOPLFIdgv/7V2A6dde3xCxxbTH3RXflsBsXCBftuXgtC23umt2onvnYeK79bVS0oZPQG4o5SuS+tPgTBoW34NET/zjK733cmsGNwHQCw8KHZ9qRy1fsfXWAwcCY6y8U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738688856; c=relaxed/simple;
	bh=3aizgtkyv+vyDjr/YzeQveJFTdDlVYb50Uzzlt1Cnt4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=G68dtnXfsbcyj7YMQCvNu6OdAFaOYoU3EKttX2cjQzUn/Dc0rH639jyXSifJWv0o3soPEyTmPBczsXN4q6QB+rHcmmvYyf7ISGG8ExGldg6V5/Xs2HLMQOFhMirCHew4+W+RJVaDkHPsDDGQ4f4m7gqw0oO5sUH2rNklOwtiuBs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=zohomail.com; spf=pass smtp.mailfrom=zohomail.com; dkim=pass (1024-bit key) header.d=zohomail.com header.i=kingxukai@zohomail.com header.b=DovUD6N/; arc=pass smtp.client-ip=136.143.188.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=zohomail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zohomail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=zohomail.com header.i=kingxukai@zohomail.com header.b="DovUD6N/"
ARC-Seal: i=1; a=rsa-sha256; t=1738688834; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=UKjD3CPU5LdLmJHrs9IvCjNrg/fKunRdRaInbr0+/Vrib/z/A9Y1/1XKZ59q/TkAXdSjn4ltFL49ouoXC0NUxv6gYUksmlDF/kjlkkcD2TadX627mH1wSt/4sW+qYkWFFZnRcGCTidZkUv3Q9zqvARa8QF5EI2T/tld72PECWpo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1738688834; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=/1H455YKzcoh4msMSl2MwzBYNQnAg4q7KrJ23YCw80U=; 
	b=P10qHI1QhFsOFehZwP+Qftbs2BCN/1DOE+7ntrx7DyE2IHJ7L8Cz67cy7/umkmhWi+8XBGc3qsk73tJenuBT6Pl/VsNIYVWJcOjscF6an052OvgYicz2XHA+v9+sjqs0y1rFCRzzuoFylwe9O/J6HSkOBmq3I+8m5WBTJXLFFVc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=zohomail.com;
	spf=pass  smtp.mailfrom=kingxukai@zohomail.com;
	dmarc=pass header.from=<kingxukai@zohomail.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1738688834;
	s=zm2022; d=zohomail.com; i=kingxukai@zohomail.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Feedback-ID:Message-Id:Reply-To;
	bh=/1H455YKzcoh4msMSl2MwzBYNQnAg4q7KrJ23YCw80U=;
	b=DovUD6N/FMEEDj/H/LHxdqYExu4lEcta0tSd6oDDCiCvvifQ9UXVAl102LkTt7W0
	6ejqPQfYwKa+eYsYXwV2ZyJbOusenySUqNRT9IIn1xSbuz5fJ7yKySPTVK9ZqEqAcqH
	tsXdQX7QYuJsLVPqNiPspYMGgPrPlP4gUaVamV30=
Received: by mx.zohomail.com with SMTPS id 1738688830787231.45268121999618;
	Tue, 4 Feb 2025 09:07:10 -0800 (PST)
Message-ID: <525d4b18-4ce9-4448-a9b9-dfce4aa15ee3@zohomail.com>
Date: Wed, 5 Feb 2025 01:06:57 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v3 1/3] dt-bindings: clock: Add bindings for Canaan
 K230 clock controller
To: Samuel Holland <samuel.holland@sifive.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 Troy Mitchell <TroyMitchell988@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Conor Dooley <conor@kernel.org>
References: <20250203-b4-k230-clk-v3-0-362c79124572@zohomail.com>
 <20250203-b4-k230-clk-v3-1-362c79124572@zohomail.com>
 <237ce4e3-d66f-43ee-bd4e-38007dc750e5@sifive.com>
From: Xukai Wang <kingxukai@zohomail.com>
Content-Language: en-US
In-Reply-To: <237ce4e3-d66f-43ee-bd4e-38007dc750e5@sifive.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Feedback-ID: rr08011227a499705bedd88d51f0cfd560000033583ae4408614494e6bce16ec0ea8b0a69522ce2dfd91b3d0:zu080112276e35433809ba80609751686e00008039a89b06b66fee628922148895a733f30129b83e56e766c5:rf0801122bd12795581b912999f26052ca000078a8f2585976c3819e36b85f046ce5eb9ac08fdd07b64b353c03d6797f:ZohoMail
X-ZohoMailClient: External


On 2025/2/4 04:24, Samuel Holland wrote:
> On 2025-02-03 8:49 AM, Xukai Wang wrote:
>> This patch adds the Device Tree binding for the clock controller
>> on Canaan k230. The binding defines the new clocks available and
>> the required properties to configure them correctly.
>>
>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> Signed-off-by: Xukai Wang <kingxukai@zohomail.com>
>> ---
>>  .../devicetree/bindings/clock/canaan,k230-clk.yaml | 43 +++++++++++++++++++
>>  include/dt-bindings/clock/canaan,k230-clk.h        | 49 ++++++++++++++++++++++
>>  2 files changed, 92 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/clock/canaan,k230-clk.yaml b/Documentation/devicetree/bindings/clock/canaan,k230-clk.yaml
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..d7220fa30e4699a68fa5279c04abc63c1905fa4a
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/clock/canaan,k230-clk.yaml
>> @@ -0,0 +1,43 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/clock/canaan,k230-clk.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Canaan Kendryte K230 Clock
>> +
>> +maintainers:
>> +  - Xukai Wang <kingxukai@zohomail.com>
>> +
>> +properties:
>> +  compatible:
>> +    const: canaan,k230-clk
>> +
>> +  reg:
>> +    items:
>> +      - description: PLL control registers.
>> +      - description: Sysclk control registers.
> From the way the driver is structured, this looks rather like two separate
> hardware blocks, not two groups of registers for a single hardware block. For
> example, the driver registers two clock providers for the same DT node, with
> overlapping indexes. This doesn't work. Either you need two separate DT nodes --
> one for the PLLs and another for the sysclks -- or you need to include the PLLs
> in the binding header below at non-overlapping indexes.
>
> Regards,
> Samuel
Thank you for your feedback.

You mentioned the issue of registering two clock providers on the same
DT node with overlapping indexes, which was indeed my oversight.

The actual situation is that PLLs are only used for internal
configuration by PLL_DIVs, and since PLL_DIVs do not be directly invoked
using `clock=<PLL_DIVs Index>` in the DT node, there is no need to use
`devm_of_clk_hw_add_provider` to add them as clock providers.

Therefore, I will remove the code that registers PLL_DIVs as clock
providers ant its `onecell_get` function.

Moreover, since PLLs are only used internally by PLL_DIVs and do not
need to be exposed as clock providers externally, 

so I think there is no need to modify the implementation to separate
them into PLLs and sysclk.

If there's anything I might have overlooked or misunderstood, please
feel free to point it out.

>> +
>> +  clocks:
>> +    maxItems: 1
>> +
>> +  '#clock-cells':
>> +    const: 1
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - clocks
>> +  - '#clock-cells'
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    clock-controller@91102000 {
>> +        compatible = "canaan,k230-clk";
>> +        reg = <0x91102000 0x1000>,
>> +              <0x91100000 0x1000>;
>> +        clocks = <&osc24m>;
>> +        #clock-cells = <1>;
>> +    };
>> diff --git a/include/dt-bindings/clock/canaan,k230-clk.h b/include/dt-bindings/clock/canaan,k230-clk.h
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..47d966fda5771615dad8ade64eeec42a9b27696e
>> --- /dev/null
>> +++ b/include/dt-bindings/clock/canaan,k230-clk.h
>> @@ -0,0 +1,49 @@
>> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
>> +/*
>> + * Kendryte Canaan K230 Clock Drivers
>> + *
>> + * Author: Xukai Wang <kingxukai@zohomail.com>
>> + */
>> +
>> +#ifndef CLOCK_K230_CLK_H
>> +#define CLOCK_K230_CLK_H
>> +
>> +/* Kendryte K230 SoC clock identifiers (arbitrary values). */
>> +#define K230_CPU0_SRC			0
>> +#define K230_CPU0_ACLK			1
>> +#define K230_CPU0_PLIC			2
>> +#define K230_CPU0_NOC_DDRCP4		3
>> +#define K230_CPU0_PCLK			4
>> +#define K230_PMU_PCLK			5
>> +#define K230_HS_HCLK_HIGH_SRC		6
>> +#define K230_HS_HCLK_HIGH_GATE		7
>> +#define K230_HS_HCLK_SRC		8
>> +#define K230_HS_SD0_HS_AHB_GAT		9
>> +#define K230_HS_SD1_HS_AHB_GAT		10
>> +#define K230_HS_SSI1_HS_AHB_GA		11
>> +#define K230_HS_SSI2_HS_AHB_GA		12
>> +#define K230_HS_USB0_HS_AHB_GA		13
>> +#define K230_HS_USB1_HS_AHB_GA		14
>> +#define K230_HS_SSI0_AXI15		15
>> +#define K230_HS_SSI1			16
>> +#define K230_HS_SSI2			17
>> +#define K230_HS_QSPI_AXI_SRC		18
>> +#define K230_HS_SSI1_ACLK_GATE		19
>> +#define K230_HS_SSI2_ACLK_GATE		20
>> +#define K230_HS_SD_CARD_SRC		21
>> +#define K230_HS_SD0_CARD_TX		22
>> +#define K230_HS_SD1_CARD_TX		23
>> +#define K230_HS_SD_AXI_SRC		24
>> +#define K230_HS_SD0_AXI_GATE		25
>> +#define K230_HS_SD1_AXI_GATE		26
>> +#define K230_HS_SD0_BASE_GATE		27
>> +#define K230_HS_SD1_BASE_GATE		28
>> +#define K230_HS_OSPI_SRC		29
>> +#define K230_HS_USB_REF_50M		30
>> +#define K230_HS_SD_TIMER_SRC		31
>> +#define K230_HS_SD0_TIMER_GATE		32
>> +#define K230_HS_SD1_TIMER_GATE		33
>> +#define K230_HS_USB0_REFERENCE		34
>> +#define K230_HS_USB1_REFERENCE		35
>> +
>> +#endif /* CLOCK_K230_CLK_H */
>>
