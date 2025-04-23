Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C38F812E1CD;
	Wed, 23 Apr 2025 04:07:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745381273; cv=none; b=hJNB6DTlEuuxHFKuxzDiNXlw14X1G+QRl9Xgg7WGFAUWZhlHyLoI/ImPWdYiPb8WAqppatY2p1NCsU4u3htgqzQ9sijfI35u2XaEUT0yNuzocFtrCu1LFkakqfVYc2Lkg9MiqJz7wiHF0B/5NtqOIDkmTcoBK4VdQ5GQpBliEMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745381273; c=relaxed/simple;
	bh=kV8z5224tWKx0kzRUSIFU26oNwRaueVw97eKf8TxL1U=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=o9gv6UFMz24KBbwBImR0qd461J9A+5Hq844zu/gUqxAVotKbuA+bTRKOzBsZ1D9t1/eQlvcSPHRK5w+gEKVp53bbQ47dwpxnwTJhy1KO8kWoteAkx1WzJ03Glm+Q9VU36pYBvZYG+wdYA1ZG4oiLWMboTRKUz3+GMtaIPYkLsno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=Wq6yq8rE; arc=none smtp.client-ip=198.47.23.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="Wq6yq8rE"
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53N47i4O1431365
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 22 Apr 2025 23:07:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1745381264;
	bh=1gfH0CvoQ7Geo0FA4RUBrH4DyaOF0f+aUMlwOVjCD6Q=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=Wq6yq8rEK6GtFebuJ0ENZhn+v0QoUKiSuMycW1d1Vopdobge/D5R1flS/BGC1q89e
	 LirAC8x7eHLUVZWGPSjF/SsokH7RC4KlPNZ35OpubSeAVaKg2zXEESN1wteblWOXcX
	 I2SMV+MMcUeD1NjrPY/BJ8954gW8Brs36G7YXSXE=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53N47ilj081943
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 22 Apr 2025 23:07:44 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 22
 Apr 2025 23:07:43 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 22 Apr 2025 23:07:43 -0500
Received: from [172.24.22.140] (lt5cd2489kgj.dhcp.ti.com [172.24.22.140])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53N47e57034287;
	Tue, 22 Apr 2025 23:07:40 -0500
Message-ID: <d987c7f7-181a-4d1a-a88c-3b6c5aac6f63@ti.com>
Date: Wed, 23 Apr 2025 09:37:39 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 7/7] arm64: dts: ti: k3-j784s4-j742s2-main-common:
 switch to 64-bit address space for PCIe0 and PCIe1
To: Siddharth Vadapalli <s-vadapalli@ti.com>, <nm@ti.com>, <vigneshr@ti.com>,
        <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <srk@ti.com>
References: <20250422120042.3746004-1-s-vadapalli@ti.com>
 <20250422120042.3746004-8-s-vadapalli@ti.com>
Content-Language: en-US
From: "Kumar, Udit" <u-kumar1@ti.com>
In-Reply-To: <20250422120042.3746004-8-s-vadapalli@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea


On 4/22/2025 5:30 PM, Siddharth Vadapalli wrote:
> The PCIe0 and PCIe1 instances of PCIe in J742S2 and J784S4 SoCs support:
> 1. 128 MB address region in the 32-bit address space
> 2. 4 GB address region in the 64-bit address space
>
> The default configuration is that of a 128 MB address region in the
> 32-bit address space. While this might be sufficient for most use-cases,
> it is insufficient for supporting use-cases which require larger address
> spaces. Therefore, switch to using the 64-bit address space with a 4 GB
> address region.
>
> Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>
> ---
>
> [..]
> +			 <0x02000000 0x00 0x00101000 0x41 0x00101000 0x00 0xffeff000>; /* 32-bit Non-Prefetchable MEM (4 GB - 1 MB - 4 KB) */

Reviewed-by: Udit Kumar <u-kumar1@ti.com>


>   		dma-ranges = <0x02000000 0x0 0x0 0x0 0x0 0x10000 0x0>;
>   		status = "disabled";
>   	};
