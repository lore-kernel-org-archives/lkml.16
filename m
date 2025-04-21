Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B2082AD2D;
	Mon, 21 Apr 2025 12:18:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.246
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745237937; cv=none; b=DLNxwwt43/R4ZmZnhMnjYhdNRIk8qweNlWI6yvzTfIgW/7WQiCcXT+suTyHEBwqhgXQ9U6z52rL2GOh+pXRmjLQUFt+xm+jRl8Kmg+FibC7mqTU2HjFKCvVpRtAp5IbYw20THvaG6RpejyQir6JmlneiKhR14lZift6FW8mcN9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745237937; c=relaxed/simple;
	bh=um4fv7mKGdJpS30iPGTyzDWjtnZo/lnitFmcd8PY2cQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=JdJVak3tA2C/mZNihu8VnJmcOdnbuDdPdeLlIeIt3Ih+DaHkJIzLploQ4wmX34S8LOFJw5cDmWMg707IgFP+F7FXtYK9Du0a17nwp6gw8M/OsTqG69XPlVFbFD4UzGvwX4eJrj8XMbQFDqnYzgWXzczBn/C/V1goEEFxVydlk4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=BZKn1Icj; arc=none smtp.client-ip=198.47.19.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="BZKn1Icj"
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53LCImUA1545741
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 21 Apr 2025 07:18:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1745237928;
	bh=HRhwr6bsuUpHJokkn7OOYPwCV0G4EhNX1INeaCHd44E=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=BZKn1IcjY/qIX90o+ZurQTtKZqjPrgXf4wjt8S5Xx7qjZ5A8ejXuDw0A8qkoSAom3
	 ENz+2z4Ak8AqrSSNbVO0nzfGcbStX1yWOGGClkkHz5FfQWb8GzwXK2jYIfn1xcv7v6
	 bFrCTZKtFAuyIv28c1EtsMqvom3owEPl2ckMubHA=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53LCImtg061686
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 21 Apr 2025 07:18:48 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 21
 Apr 2025 07:18:47 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 21 Apr 2025 07:18:47 -0500
Received: from [10.24.72.182] (jayesh-hp-z2-tower-g5-workstation.dhcp.ti.com [10.24.72.182])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53LCIiHl032378;
	Mon, 21 Apr 2025 07:18:45 -0500
Message-ID: <94e79e4b-ff72-49ba-bcd7-ba69e2296d3b@ti.com>
Date: Mon, 21 Apr 2025 17:48:43 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/7] Add DSI display support for TI's Jacinto platforms
To: "Kumar, Udit" <u-kumar1@ti.com>, <nm@ti.com>, <vigneshr@ti.com>,
        <devarsht@ti.com>, <linux-kernel@vger.kernel.org>
CC: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <kristo@kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
References: <20250411105155.303657-1-j-choudhary@ti.com>
 <02f1912f-0a05-4446-923a-7935ed305cb3@ti.com>
Content-Language: en-US
From: Jayesh Choudhary <j-choudhary@ti.com>
In-Reply-To: <02f1912f-0a05-4446-923a-7935ed305cb3@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Hello Udit,

On 19/04/25 14:23, Kumar, Udit wrote:
> 
> On 4/11/2025 4:21 PM, Jayesh Choudhary wrote:
>> Hello All,
>>
>> This series adds the dts support to enable DSI on 3 platforms for TI 
>> SoCs:
>> - J784S4-EVM
>> - J721S2-EVM
>> - AM68-SK
>>
>> [..]
>>
>> NOTE: For higher resolutions, we need bigger CMA region.
>> But for validation, the default value is enough.
> 
> I am not sure , how DSS uses CMA region
> 

The framebuffers for dss are allocated from cma-pool.
By default the cma-region is of 32MiB that is shared by various peripherals.

1920x1080 requires ~16MiB of CMA but sometimes due to fragmentation,
we cannot get even this much for framebuffer and memory is not allocated 
resulting in display failures.

And large resolutions like 4k@60fps require ~64MiB straight away.
So it is better to reserve appropriate CMA region.

Thanks
Jayesh

> 
>> I am posting another series to add CMA region to Jacinto platforms
>> similar to Sitara family soon:
>> <https://lore.kernel.org/all/20240613150902.2173582-1-devarsht@ti.com/>
>>
>> Jayesh Choudhary (5):
>>    arm64: dts: ti: k3-j784s4-j742s2-main-common: add DSI & DSI PHY
>>    arm64: dts: ti: k3-j784s4-j742s2-evm-common: Enable DisplayPort-1
>>    arm64: dts: ti: k3-j721s2-common-proc-board: Add main_i2c4 instance
>>    arm64: dts: ti: k3-j721s2-common-proc-board: Enable DisplayPort-1
>>    arm64: dts: ti: k3-am68-sk: Enable DSI on DisplayPort-0
>>
>> Rahul T R (2):
>>    arm64: dts: ti: k3-j721s2-main: add DSI & DSI PHY
>>    arm64: dts: ti: k3-j721s2-som-p0: add DSI to eDP
>>
>>   .../boot/dts/ti/k3-am68-sk-base-board.dts     |  96 ++++++++++++++
>>   .../dts/ti/k3-j721s2-common-proc-board.dts    | 116 +++++++++++++++++
>>   arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi    |  37 ++++++
>>   arch/arm64/boot/dts/ti/k3-j721s2-som-p0.dtsi  |  52 ++++++++
>>   .../dts/ti/k3-j784s4-j742s2-evm-common.dtsi   | 117 +++++++++++++++++-
>>   .../dts/ti/k3-j784s4-j742s2-main-common.dtsi  |  37 ++++++
>>   6 files changed, 454 insertions(+), 1 deletion(-)
>>
