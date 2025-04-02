Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7CBA2356B5;
	Wed,  2 Apr 2025 10:07:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743588441; cv=none; b=BD+B6JrWK6TQESq4LDQ0i8Ad0u53u3YD7KsrfvTbk9SPpFMWDE2daVqvRJWtVhtjm7ESXZGfn8/Ird06BtMVKWBx67w09Q7ZBTg0XRQC7Yp0PtO5ErcY9VQbOkiTNKbHXEmgvMBPQPcQXWQosXye5GgIggHszM7YOxu3hug/wrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743588441; c=relaxed/simple;
	bh=2D6/DR0EXXMZUwjDNtwoQO9absaDWxDLctt6KqIzTtk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cNJi0GaCBQHpo9hn/MTpjqIIBcmYC2LSiKocoqpSU0QNSskK0/pu4FH7/GyZhbnOXX6eFSOfnBsk740feZhMo67PYd00Es3CPAGbMvEresBeE7i5W0tYY+cmbkHoX3PFTQC24iQ66ntua49f51Mc7g4YU7eD3hbWymEe09MG0TI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=OBLXlWny; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="OBLXlWny"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1743588438;
	bh=2D6/DR0EXXMZUwjDNtwoQO9absaDWxDLctt6KqIzTtk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=OBLXlWnyHq6JdVN3P6jRHM/ZEfvWqjIkMff5S17AXozGFVJD8+T25e5SOJ2rDvCir
	 VJYEPY20GmlzALb5qrFyf82SkOpkhZrCG81ToTAIUlSe1FTqTUzetppJW4aZBRMNJF
	 l70RML5a6Aw3SaxmaRjAgqcBd0JAk7jV0/q6Pzl5Zkckd0iPFt7tlw32RC7kyMhBai
	 Yas+vjFIwx2z9k0tQznooWZdLTYPzoWQnKCoHSorH2zYJ7zcMle6Y025AY08ApikUn
	 psnRPM5tydbFegILx8t3Z58Mmj/gJ6CsPrLp08wKE9OnHtiJfwBDZmYkWyxxLtmzts
	 N0LpZr/6fKs1w==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 5B96917E02BE;
	Wed,  2 Apr 2025 12:07:17 +0200 (CEST)
Message-ID: <33847b76-11b5-4233-a5e6-9f8fd3c691a2@collabora.com>
Date: Wed, 2 Apr 2025 12:07:16 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/2] arm64: dts: mediatek: mt8195: Add subsys clks for
 PCIe power domains
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: linux-mediatek@lists.infradead.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, matthias.bgg@gmail.com, weiyi.lu@mediatek.com,
 tinghan.shen@mediatek.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 kernel@collabora.com
References: <20250402090615.25871-1-angelogioacchino.delregno@collabora.com>
 <20250402090615.25871-2-angelogioacchino.delregno@collabora.com>
 <CAGXv+5GHf5D3JDh+OZ-Cxf91PTAGYk2+jvuwK1gymy=k1YOo_A@mail.gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <CAGXv+5GHf5D3JDh+OZ-Cxf91PTAGYk2+jvuwK1gymy=k1YOo_A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Il 02/04/25 11:34, Chen-Yu Tsai ha scritto:
> On Wed, Apr 2, 2025 at 5:10 PM AngeloGioacchino Del Regno
> <angelogioacchino.delregno@collabora.com> wrote:
>>
>> The PCIe MAC needs the sram to be powered on for internal IP
>> access and it has always worked before because the bootloader
>> on Chromebooks was leaving the PCIe PERI_AO MEM clocks on
>> before booting the kernel.
>> Add the SRAM (mem) clock as a subsystem clock on the PCIe MAC
>> P0 and P1 to correctly describe the hardware and to avoid any
>> issue with bootloaders behaving differently.
>>
>> Fixes: 2b515194bf0c ("arm64: dts: mt8195: Add power domains controller")
>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> ---
>>   arch/arm64/boot/dts/mediatek/mt8195.dtsi | 4 ++++
>>   1 file changed, 4 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
>> index b33726da900b..0cb96cba727a 100644
>> --- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
>> +++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
>> @@ -792,12 +792,16 @@ power-domain@MT8195_POWER_DOMAIN_CAM_MRAW {
>>
>>                                  power-domain@MT8195_POWER_DOMAIN_PCIE_MAC_P0 {
>>                                          reg = <MT8195_POWER_DOMAIN_PCIE_MAC_P0>;
>> +                                       clocks = <&pericfg_ao CLK_PERI_AO_PCIE_P0_MEM>;
>> +                                       clock-names = "ss-pextp0-mem";
> 
> Doesn't the PCIe host controller already reference this clock?
> 
>>                                          mediatek,infracfg = <&infracfg_ao>;
>>                                          #power-domain-cells = <0>;
>>                                  };
>>
>>                                  power-domain@MT8195_POWER_DOMAIN_PCIE_MAC_P1 {
>>                                          reg = <MT8195_POWER_DOMAIN_PCIE_MAC_P1>;
>> +                                       clocks = <&pericfg_ao CLK_PERI_AO_PCIE_P1_MEM>;
>> +                                       clock-names = "ss-pextp1-mem";
> 
> Not this one though, since:
> 
>           /* Designer has connect pcie1 with peri_mem_p0 clock */
>           <&pericfg_ao CLK_PERI_AO_PCIE_P0_MEM>;
> 

I'm not sure what this comment refers to - as in, whether this is referring
to the board designer or to the SoC//IP designer...

...but if MediaTek can clarify, I'd be happy :-)

Cheers,
Angelo

> 
> ChenYu
> 
>>                                          mediatek,infracfg = <&infracfg_ao>;
>>                                          #power-domain-cells = <0>;
>>                                  };
>> --
>> 2.48.1
>>
>>

