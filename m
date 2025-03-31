Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C31F01E8353;
	Mon, 31 Mar 2025 17:13:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.246
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743441200; cv=none; b=ZNjc9tY577eL8kAoRB1TuO85SSnyZm85adql4g1GCdrmxeXCb7jmYVWDkHVhL276+B4wgj1U6Ewnh0zq7UuGeba0WfJ1IwUqjUA8fkl4Kjd6wSM/B3gAPMcWGjCQbDVltLWct78/dUpF5qJEYH6kNcm8xZtZinz8ZdX23B57AWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743441200; c=relaxed/simple;
	bh=G0bH2jzA4q7ckLRfUrXAfRLO9DVM71Dxz0C2Fma344g=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=n50rrvAaIaZUakABH4j7l10bj3QeJ4qi4br6E6NmdxNml4KnKuCJOnVGV4FAc7AFDXOmSEt4rZxEZZuBg9S7+3Vnh0MzWImmeko0pwBYXZLZ/zgDxLpoFeBnd/IkGD/6cF96P6gJW7scGLFcMHl53an4CDihHeniMTjEnAGQVc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=bAmm4YXq; arc=none smtp.client-ip=198.47.19.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="bAmm4YXq"
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 52VHCvqt3453330
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Mon, 31 Mar 2025 12:12:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1743441177;
	bh=O7HJ7f+PG7orm6PUuCg998Qmjvc4fQBqZVlF/u5gGlM=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=bAmm4YXq0hs6RVOaZD7z+0GzcoqhHnKs9SM7y3CGSDe7RMPQdy8ltm5N1vuCQvRwv
	 p0leKkbwMWYK+87zKs5+WXXEj7Rr2qfsdBKhfh5Hg5ngPvUrvte98TeQxjHLigeLCz
	 Fdk2apTuvfzLwqCAFf4DpTrct4RmnZ5fgk9dAJLw=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52VHCvWg046850;
	Mon, 31 Mar 2025 12:12:57 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 31
 Mar 2025 12:12:57 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 31 Mar 2025 12:12:57 -0500
Received: from [10.249.141.75] ([10.249.141.75])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52VHCrxj034716;
	Mon, 31 Mar 2025 12:12:54 -0500
Message-ID: <1ad2d8c2-6a0d-419d-984d-4974adb0e1f0@ti.com>
Date: Mon, 31 Mar 2025 22:42:52 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: ti: k3-am62p-j722s: add rng node
To: Michael Walle <mwalle@kernel.org>, Nishanth Menon <nm@ti.com>,
        Vignesh
 Raghavendra <vigneshr@ti.com>,
        Tero Kristo <kristo@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <u-kumar1@ti.com>
References: <20250313144155.2382316-1-mwalle@kernel.org>
 <837cba5f-f49e-4cbf-9cbe-2b25f7c9d4b8@ti.com>
 <D8UECOJ2NMCU.3ALYIKSODJ479@kernel.org>
Content-Language: en-US
From: "Kumar, Udit" <u-kumar1@ti.com>
In-Reply-To: <D8UECOJ2NMCU.3ALYIKSODJ479@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Thanks Michael,

On 3/31/2025 4:28 PM, Michael Walle wrote:
> Hi Udit,
>
>>> Add the node for the random number generator inside the crypto module.
>>>
>>> Signed-off-by: Michael Walle <mwalle@kernel.org>
>>> ---
>>> This was tested on a J722S/AM67A. Also, according to the TRM this is the
>> Could you re-confirm please , after adding this node.  you selected trng
>> offered by Linux
> # cat /sys/devices/virtual/misc/hw_random/rng_current
> 40910000.rng
> # cat /sys/devices/virtual/misc/hw_random/rng_available
> 40910000.rng
> # dd if=/dev/hwrng bs=16 count=1 | hexdump -C
> 1+0 records in
> 1+0 records out
> 00000000  92 f5 44 09 fd 86 6b a2  39 d6 ad f3 e6 ec 03 4a  |..D...k.9......J|
> 00000010
> # dd if=/dev/hwrng bs=16 count=1 | hexdump -C
> 1+0 records in
> 1+0 records out
> 00000000  a3 73 da d2 5b 94 83 2a  75 11 ca b3 99 d3 87 88  |.s..[..*u.......|
> 00000010

Thanks for checking this


>
>>> MCU instance of the SA3UL. But it's defined in -main.dtsi. Is this
>>> correct?
>> Yes this is correct,
>>
>> please refer
>>
>> https://www.ti.com/lit/zip/sprujb3  SPRUJB3A.pdf
>>
>> table 2.1 Main Memory map, this node falls under main domain
> Ok. Not sure, how I came to the conclusion that this is an MCU
> instance.
>
>>> ---
>>>    arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi | 8 ++++++++
>>>    1 file changed, 8 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi b/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi
>>> index 6e3beb5c2e01..e868e006318e 100644
>>> --- a/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi
>>> [..]
>> For completeness , this is ok to add this node but should be kept disabled
> Shouldn't it be "reserved" then, see [1].

yes, should be reserved.

With marking status as reserved.

Please use Reviewed-by: Udit Kumar <u-kumar1@ti.com>


>
>> similar to
>>
>> https://github.com/torvalds/linux/blob/master/arch/arm64/boot/dts/ti/k3-j7200-mcu-wakeup.dtsi#L662
> j784s4, j721e and j721s2 have them enabled. What is the rule here?

J784s4, j721e and j721s2 SOCs has two TRNG blocks,

example for j721e, one is used by kernel [0] and another by optee [1].


>
> You also disable the hwrng in optee in your evm according to [2]:
> CFG_WITH_SOFTWARE_PRNG=y

We are planning to use this hardware block by secure firmware.

Therefore request not to use by optee as well


>
> -michael

[0] 
https://github.com/torvalds/linux/blob/master/arch/arm64/boot/dts/ti/k3-j721e-main.dtsi#L531 


[1] 
https://github.com/OP-TEE/optee_os/blob/master/core/arch/arm/plat-k3/platform_config.h#L67 



> [1] https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html?highlight=reservered#status
> [2] https://docs.u-boot.org/en/latest/board/ti/j722s_evm.html
