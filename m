Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D19F175D53;
	Tue, 20 May 2025 05:29:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747718964; cv=none; b=sB5VrYHdLUwW21Ztxjf3/p+xYOL2xteKWrAimB7+pkYX0E/gTg0B8VQyZWC6D/gk4uRTA56arwzef3f1wJI0cVqDELcIrzRlykKlZdlxnz6gJf/M9+0bUVPUroY/aKJjYKzqKZCONZgvAbNUE82rNd1GNZm/byN2TMFiatpqiEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747718964; c=relaxed/simple;
	bh=44CPD8d5LkzPWw6jzu07k1yYhHtrHCclXC77bWruayc=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=DGoNuDfiGV08cmpVGUlYntpfD/Cg+Fit22YbdXxbwIKcf7fo11Ez45d9AV1I018R0FEj22t+FR5NjT6t2gKV5p/tOEKVlNJrA+BcUbv4fDIs9OuHfSCiD/w8suiHtLtMyoTZPk4Fc5/RB9PYU5PKk7fdvWBDQbhc8AuPCHtgxM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=oze1Vat9; arc=none smtp.client-ip=198.47.23.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="oze1Vat9"
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 54K5TBO81092464;
	Tue, 20 May 2025 00:29:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1747718951;
	bh=bCRAdf+6Bvwk/1/1opxVCdktcKAoZ6vtNUKZLTp5GKc=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=oze1Vat93a2B8dUxh8yo1eOqZ2GhzHjM6pmrli2+EBpTqsVMlFgxm0Vy6poj1CNCk
	 W5aYwXBJr4cvih8z4iGN0uKFVQ/uirTU0pdUjEIrqSTZeWxGyIOXG+P2b1cI6EcRBb
	 q3FM3m6HOlO/Bv9GIHnZkzz/LSMA1pjFQdtl8JPI=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 54K5TBZ11196152
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Tue, 20 May 2025 00:29:11 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 20
 May 2025 00:29:11 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 20 May 2025 00:29:10 -0500
Received: from [172.24.227.220] (chintan-thinkstation-p360-tower.dhcp.ti.com [172.24.227.220])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 54K5T6Xq066532;
	Tue, 20 May 2025 00:29:07 -0500
Message-ID: <f844e44e-6b71-442a-ae3c-7bbe74a908af@ti.com>
Date: Tue, 20 May 2025 10:59:06 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 0/2] Extend mmio-mux driver to configure mux with
 new DT property
To: Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>, Peter Rosin
	<peda@axentia.se>
CC: <s-vadapalli@ti.com>, <danishanwar@ti.com>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, Vignesh
 Raghavendra <vigneshr@ti.com>,
        Nishanth Menon <nm@ti.com>, Thomas Gleixner
	<tglx@linutronix.de>,
        Chintan Vankar <c-vankar@ti.com>
References: <20250304102306.2977836-1-c-vankar@ti.com>
Content-Language: en-US
From: Chintan Vankar <c-vankar@ti.com>
In-Reply-To: <20250304102306.2977836-1-c-vankar@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Hello Peter,

I am trying to implement a driver for hardware module called Timesync
Router which is present on almost all the SoCs of Texas Instruments and
I need your advise to implement it.

Timesync Router provides a mechanism to mux M input to N outputs, where
all M inputs are selectable to be driven per N output.

                          ________________________
                         |    Timesync INTR       +---->dma_local_events
                         |                        |
  Device sync events----->                        +---->pcie_cpts_hw_push
                         |                        |
           cpts_genf----->                        +---->cpts_hw_push
                         |________________________|


Diagram shows a very concise view of Timesync Router. It receives
signals from multiple modules and routes the same on the other side. To
configure the functionality, we need to program output registers of
Timesync Router to configure it with the input signal. One of the
application of Timesync Router is to generate a PPS signal for CPTS
module. Timesync Router receives periodic signals generated by CPTS
module as shown "cpts_genf" in diagram and it can be routed via Timesync
Router as a Hardware Push Events as shown "cpts_hw_push" in diagram.

The functionality of Timesync Router seems very much identical to the
mux-controller, specifically mmio driver present in the mux subsystem.
I have also posted a detailed explanation on how can we modify mmio
driver which can work as a generic driver for the hardware module
identical to Timesync Router at here:
https://lore.kernel.org/r/1ce1fc6b-fc16-4fb7-9f68-57b495aa5eae@ti.com/

I have also tried to implement this module with irq subsystem:
https://lore.kernel.org/r/20250205160119.136639-1-c-vankar@ti.com/, for
which I received a response from the Thomas Gleixner that why it cannot
be included in the irq subsystem:
https://lore.kernel.org/r/87ikp8jph9.ffs@tglx/.

After receiving feedback on the Interrupt Router implementation, I tried
to implement it as a mux-controller which seems more relevant subsystem
for Timesync Router. Can you please advise me whether it can be included
in the mux-controller subsystem or not ?

Regards,
Chintan.




On 04/03/25 15:53, Chintan Vankar wrote:
> This series extends mmio-mux driver's capability to configure driver in
> with extended property.
> 
> In current driver implementation, driver is parsing register's offset,
> mask and value from two different device tree property which makes it
> complex to specify a specific register or set of registers. Introducing
> mux-reg-masks-states will make it easier to specify the same values for
> particular register or set of registers.
> 
> This series is based on linux next tagged next-20250303.
> 
> Link to v1:
> https://lore.kernel.org/r/20250227202206.2551305-1-c-vankar@ti.com/
> 
> Changes from v1 to v2:
> - Updated dt-bindings for the required conditions as suggested by Conor
>    Dooley and Andrew Davis.
> - Modified driver changes as pointed out by Andrew Davis.
> 
> Chintan Vankar (2):
>    devicetree: bindings: mux: reg-mux: Update bindings for reg-mux for
>      new property
>    mux: mmio: Extend mmio-mux driver to configure mux with new DT
>      property
> 
>   .../devicetree/bindings/mux/reg-mux.yaml      |  28 +++-
>   drivers/mux/mmio.c                            | 144 ++++++++++++++----
>   2 files changed, 141 insertions(+), 31 deletions(-)
> 
