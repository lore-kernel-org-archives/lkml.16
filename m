Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C97F21F03C8;
	Tue,  1 Apr 2025 10:02:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743501778; cv=none; b=PJWdgjB0HUkQKAo0Hy2q2VNaJO303p781cLgvwg5DqWyuY4X0wbk7aPG/nIEUr6AylhTuI5y+49o6zDh7c79dDcWvTNAYyd9Zu9dL+NGqbDbGw4AfHV1qYadd3OESAOgylFA8UOrqbng9ISV77mFmqPXfFSKg+tG1oMJ0LatumQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743501778; c=relaxed/simple;
	bh=u2i4mlN/0Dmrd2yO9FNTt299FDdaLIVxK3E6+jXa8Yg=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=RepM4OP6gthjsgz+3RArZBB0VObAIiHjxDYgauvbAoGJYSKk5w/iYItMWJsaMGAZjb7efO2n8IDZQNmqvMx+axEsucyQ2NaJDCHp2foQt05PbFDmxp18mZS4WvbXOAbOGxMiR/neClxIELoWHS/ym6dUrEKJta6WjQwFXXN7A7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=UetnMjUU; arc=none smtp.client-ip=198.47.23.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="UetnMjUU"
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 531A2aVu3072633
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 1 Apr 2025 05:02:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1743501756;
	bh=X9wRt7wss9ZrIeV++Wc1A527R0EIL7GzO7MaVVI+mas=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=UetnMjUUWQlCq4LcsKytSq2lLWX3IoLwG4tblaahnNh2LP+X7YZhMLe2yBnKGA4Ge
	 pfR3ZIk4ebPEQ2WyHm7ELCbJ58TxG2pKC/k6RL1cczYVpm4RSHPF+HqLJ4K/NEjuMx
	 yqhGCaN7okaMjI4Wg3DLIXXP4y4Zt9a0YihVVfRQ=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 531A2Z4b116224
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 1 Apr 2025 05:02:35 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 1
 Apr 2025 05:02:35 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 1 Apr 2025 05:02:35 -0500
Received: from [172.24.18.65] (lt5cd2489kgj.dhcp.ti.com [172.24.18.65])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 531A2VZq127627;
	Tue, 1 Apr 2025 05:02:32 -0500
Message-ID: <e2a37e72-d9c8-4329-8a5a-f2c9865cdb5d@ti.com>
Date: Tue, 1 Apr 2025 15:32:31 +0530
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
	<conor+dt@kernel.org>, <u-kumar1@ti.com>
CC: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20250313144155.2382316-1-mwalle@kernel.org>
 <837cba5f-f49e-4cbf-9cbe-2b25f7c9d4b8@ti.com>
 <D8UECOJ2NMCU.3ALYIKSODJ479@kernel.org>
 <1ad2d8c2-6a0d-419d-984d-4974adb0e1f0@ti.com>
 <D8V323NBB32P.3P8H103L83HZK@kernel.org>
Content-Language: en-US
From: "Kumar, Udit" <u-kumar1@ti.com>
In-Reply-To: <D8V323NBB32P.3P8H103L83HZK@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Hi Michael

On 4/1/2025 11:50 AM, Michael Walle wrote:
> Hi Udit,
>
>>>>> --- a/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi
>>>>> [..]
>>>> For completeness , this is ok to add this node but should be kept disabled
>>> Shouldn't it be "reserved" then, see [1].
>> yes, should be reserved.
>>
>> With marking status as reserved.
>>
>> Please use Reviewed-by: Udit Kumar <u-kumar1@ti.com>
> Thanks.
>
>>>> similar to
>>>>
>>>> https://github.com/torvalds/linux/blob/master/arch/arm64/boot/dts/ti/k3-j7200-mcu-wakeup.dtsi#L662
>>> j784s4, j721e and j721s2 have them enabled. What is the rule here?
>> J784s4, j721e and j721s2 SOCs has two TRNG blocks,
>>
>> example for j721e, one is used by kernel [0] and another by optee [1].
>>
>>
>>> You also disable the hwrng in optee in your evm according to [2]:
>>> CFG_WITH_SOFTWARE_PRNG=y
>> We are planning to use this hardware block by secure firmware.
>>
>> Therefore request not to use by optee as well
> How will you be able to access the RNG from linux and u-boot? I'm
> asking because I'll need it in u-boot for the lwip stack and the
> HTTPS protocol.

For now,  If you need TRNG then I can suggest to use optee TRNG (ie 
build optee with HW TRNG).


>
> -michael
