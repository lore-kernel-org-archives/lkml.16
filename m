Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E7F728151F;
	Tue,  6 May 2025 16:14:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746548069; cv=none; b=ThojGW5Rcp6MBtjE4YJ8c+ChPoeq1o+ea0qwkF6/pz37KUQjcruKjE6q8Vw4wB1Qbn6F88+SCAtef8AUl4ESYDNk18fNtj4PZR1B/94Nf1SM6ZIOVZe9jBjFAAe/ZKRrAKPcrvIfWRE6THvIoXfYmOdRp3C0ZD33xl6RIZS5OFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746548069; c=relaxed/simple;
	bh=uKeih0v5/syKJIXcgCW25FrBXvDbJP4+dA9svf+9muY=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=kGIm33PUAzjp5bJPMPb8gPkIUg1TUm2Ioqix10u5VYEDUhxVOeqNN6enrZTx3PWyqpmwnkoKtu9kkv2Dg1RsjA4Psc6uzPyJT13TL8aVqXBfMGVV8s+BFfXx48DV7UqTeeErt4VPldokDBrWFWAUUNi+P80tCC+aumoi9VIS7Jg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=ifHw/brk; arc=none smtp.client-ip=198.47.19.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="ifHw/brk"
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 546GED2D545964
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 6 May 2025 11:14:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1746548053;
	bh=vUQnO4ez7esgr9cZ1pZ2DYqYoTJgtaWVk2k59yNUhiw=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=ifHw/brkuXzBNwEKSwgb2Su7whGELtX6EQp1SQl72QstWGcMn/YHFpxr/0qJTy75k
	 7sKmqrOyOYyV8UXl/ipogXBj1kijlar5VUtNcfFfUUHCYevXzBGLsiVF2ZW0U8J0+A
	 spdfc9ONmpiKUnDoJVmNFLn144xfnjZxXfTKUK3A=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 546GEDwV116531
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 6 May 2025 11:14:13 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 6
 May 2025 11:14:13 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 6 May 2025 11:14:12 -0500
Received: from [128.247.81.105] (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 546GECH7051184;
	Tue, 6 May 2025 11:14:12 -0500
Message-ID: <4a7e7f19-68ee-4ec6-aa9c-832238be040d@ti.com>
Date: Tue, 6 May 2025 11:14:12 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] {am62,am62a}-phycore-som: Add R5F and C7xv device
 nodes
To: Daniel Schultz <d.schultz@phytec.de>, <nm@ti.com>
CC: <upstream@lists.phytec.de>, <vigneshr@ti.com>, <kristo@kernel.org>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>
References: <20250506115502.3515599-1-d.schultz@phytec.de>
Content-Language: en-US
From: Judith Mendez <jm@ti.com>
In-Reply-To: <20250506115502.3515599-1-d.schultz@phytec.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Hello Daniel,

On 5/6/25 6:54 AM, Daniel Schultz wrote:
> This patch series is based on [1] and adds these R5F and C7xv device nodes
> to the am62- and am62a-phycore-som device-trees. It also reserves main_timer2
> as well as main_rti4 for the C7 DSP firmware.
> 
> 1: https://lore.kernel.org/linux-arm-kernel/20250502220325.3230653-1-jm@ti.com/T/#t
> 

For the series,

Reviewed-by: Judith Mendez <jm@ti.com>

