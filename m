Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BF1A22D790;
	Tue,  6 May 2025 14:20:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746541230; cv=none; b=dohAvdYY1/aUAB1IqmGZa8uiW9u7AA+7eVqZzjPAOl2oI8D7MvxW9dCMUdoXmngmL73D4BHYVbjdJrjESb5Lyul+oQdcNNXovJuBrfqlIoeBQD9IDxRP2wh0hDXfLvKumWgXqK8b9+Ix29ftLwTuJxQzS/8zpWRwbu8DTirl5kc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746541230; c=relaxed/simple;
	bh=3CsbtgEQnm7R5CDEADDL1z7xPHGtZynTnsO+5Kyw29Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=DColZhwLpRj/DTOCZxqyQtwVXyEW5D5lNMeeyLD5aWd7BklRXigu+ZipkOq2X2lek9qDZDYZVQoVxoSGR3z0hENXqtM9qSsPwLWHXYUO0kPJe/QvfnHcJ/W1OIPDe0PBsCRfVOKJ/Bm3ZTXRZA9cAH89ezMit2dBYn6GPKBeNAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=Cdvbh9HZ; arc=none smtp.client-ip=198.47.23.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="Cdvbh9HZ"
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 546EKLcb540463
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 6 May 2025 09:20:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1746541221;
	bh=qw2kxcgeI74CiAtO0Wk3Ge8irH3lcasW30DQVrbYrdY=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=Cdvbh9HZGD0YdYS9IAFeVQZBEG3b5TzRxaPdKbiLe20RzCW/WWMZEmgBaUSEwv7B3
	 0AEvpASl8CsgSOY1FFBHqesW1oVfYiHEeR6OL0P1d9oZJjuQnXZpRNGmVcr0c8X3xk
	 2lWlky+ZKuHDDuzS6p3y2BiDYF3kKepegWghOOw0=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 546EKKIH021102
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 6 May 2025 09:20:20 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 6
 May 2025 09:20:20 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 6 May 2025 09:20:20 -0500
Received: from [10.249.32.133] ([10.249.32.133])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 546EKJ7e113864;
	Tue, 6 May 2025 09:20:19 -0500
Message-ID: <4492a19c-9544-4240-bca5-00d82c76774f@ti.com>
Date: Tue, 6 May 2025 09:20:19 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] Add global CMA areas for few TI SoCs
To: Jayesh Choudhary <j-choudhary@ti.com>, <nm@ti.com>, <vigneshr@ti.com>,
        <linux-kernel@vger.kernel.org>
CC: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <kristo@kernel.org>, <u-kumar1@ti.com>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devarsht@ti.com>,
        <afd@ti.com>
References: <20250424084415.66457-1-j-choudhary@ti.com>
Content-Language: en-US
From: Brandon Brnich <b-brnich@ti.com>
In-Reply-To: <20250424084415.66457-1-j-choudhary@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Hi Jayesh

On 4/24/2025 3:44 AM, Jayesh Choudhary wrote:
> Hello All,
> 
> Following AM62* platforms[0], this patches add global CMA reserve area for:
> - J721S2-EVM (1056 MiB)
> - J784S4-EVM (1920 MiB)
> - AM68-SK (1008 MiB)
> - AM69-SK (1904 MiB)
> 
> These SoCs does not have MMU and hence they require contiguous memory
> pool to support various multimedia usecase.

This series will break multimedia support in our tree if accepted. I 
gave a similar response to Devarsh when trying to get CMA carveout 
accepted for AM62p[0]. Essentially, Wave5 still does not have support 
for 48 bit addressing in upstream, so memory allocation still needs to 
happen in 32-bit range. Can we force the memory carveout in this region 
using the alloc-ranges? Devarsh did this with AM62A[1].

Best,
Brandon

[0]: 
https://lore.kernel.org/all/20240614170409.zu4vaatdac4o6w2o@udba0500997/
[1]: https://lore.kernel.org/all/20240613150902.2173582-3-devarsht@ti.com/

> 
> The calculation was done considering H264 codec requirements, dual-display
> supported in each platforms and multicamera use-cases.
> Additional buffer was kept for other peripheral s and to account for
> fragmentation.
> The breakdown is mentioned in each commit message.
> 
> [0]: https://lore.kernel.org/all/20240613150902.2173582-1-devarsht@ti.com/
> 
> Jayesh Choudhary (4):
>    arm64: dts: ti: k3-j721s2-som-p0: Reserve 1056MiB of global CMA
>    arm64: dts: ti: k3-j784s4-j742s2-evm-common: Reserve 1920MiB of global
>      CMA
>    arm64: dts: ti: k3-am68-sk-som: Reserve 1008MiB of global CMA
>    arm64: dts: ti: k3-am69-sk: Reserve 1904MiB of global CMA
> 
>   arch/arm64/boot/dts/ti/k3-am68-sk-som.dtsi              | 8 ++++++++
>   arch/arm64/boot/dts/ti/k3-am69-sk.dts                   | 8 ++++++++
>   arch/arm64/boot/dts/ti/k3-j721s2-som-p0.dtsi            | 8 ++++++++
>   arch/arm64/boot/dts/ti/k3-j784s4-j742s2-evm-common.dtsi | 8 ++++++++
>   4 files changed, 32 insertions(+)
> 

