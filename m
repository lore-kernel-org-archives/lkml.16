Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6964A1F8676;
	Thu,  5 Jun 2025 06:42:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749105731; cv=none; b=fIzSNoHnsy7H1CedSmP00NGRIEKgIoyUKuBw2j0a8sFI0ZyGKNht212Kz0GyuA7an4Pa554gRV8Z8xVfk/e0tnYoLuIYh2qMiq6KbqfTcqSLR2F3rTA1prFgZgYVe4INmCAV8gVoGeFiffkVe79kQLZuGDOUWail4gp5uBxzaCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749105731; c=relaxed/simple;
	bh=rU/1YIoV2CLoSuMbCiI2MlnXgOapUv8HsWBJc0q5cto=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=p38DxQXeufMMcQoovh2Ed05GQy937m33LiVh+/4TcLAHopM2tIAH0w2R/rUSwkWXX5UvPxlX9cpolKyDWNmeZUNc6AUCu8dTJIlcXMxZE9La+PUoJCLFqQJasLZdofvBVVP7kgoJlVcofMlneh6NYOIdrDmxwsT7VJyzn9e6cyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=I04OTXgX; arc=none smtp.client-ip=198.47.23.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="I04OTXgX"
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 5556g0I14008507;
	Thu, 5 Jun 2025 01:42:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1749105720;
	bh=OrukiiR7vvWd7A9qLRhkqN2uK3tuulRr807NT8fSWc8=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=I04OTXgXjr04Ra9WAredg55I4gqGQwkOFx7U5jZLJ7CqhTPCQFMnUtwfU3c1aayhe
	 /jItUn4dlnRHc9+eHJ1M1txtLQwx4ja48CPgtCNhOovxBqy8KzBN5pTr+x8VHuDoAW
	 IeEgr7BYwpfCimrWe+utf1uYc+qWYyB471UUNY/M=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 5556g07o952009
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 5 Jun 2025 01:42:00 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 5
 Jun 2025 01:41:59 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 5 Jun 2025 01:41:59 -0500
Received: from [172.24.227.220] (chintan-thinkstation-p360-tower.dhcp.ti.com [172.24.227.220])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5556ftHe3275682;
	Thu, 5 Jun 2025 01:41:56 -0500
Message-ID: <e70f685c-ec03-4e87-8e5b-963bd9ebb2f1@ti.com>
Date: Thu, 5 Jun 2025 12:11:54 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] mux: mmio: Extend mmio-mux driver to configure mux
 with mux-reg-masks-state
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Thorsten Blum
	<thorsten.blum@linux.dev>, Andrew Davis <afd@ti.com>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring
	<robh@kernel.org>, Peter Rosin <peda@axentia.se>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <s-vadapalli@ti.com>, <vigneshr@ti.com>, <nm@ti.com>,
        <danishanwar@ti.com>
References: <20250605063422.3813260-1-c-vankar@ti.com>
 <20250605063422.3813260-3-c-vankar@ti.com>
 <c343c5d1-9f8c-4bb3-a98e-af144ace7bfa@kernel.org>
Content-Language: en-US
From: Chintan Vankar <c-vankar@ti.com>
In-Reply-To: <c343c5d1-9f8c-4bb3-a98e-af144ace7bfa@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Hello Krzysztof,

On 05/06/25 12:06, Krzysztof Kozlowski wrote:
> On 05/06/2025 08:34, Chintan Vankar wrote:
>> MMIO mux driver is designed to parse "mux-reg-masks" and "idle-states"
>> property independently to configure mux. The current design is complex for
>> the devices with larger memory space, which requires synchronization
>> between the two properties.
>>
>> Extend mmio-mux driver to support a single property, "mux-reg-masks-state"
>> which configures mux registers without above constraint.
>>
>> Signed-off-by: Chintan Vankar <c-vankar@ti.com>
>> ---
>>   drivers/mux/mmio.c | 144 +++++++++++++++++++++++++++++++++++++--------
>>   1 file changed, 118 insertions(+), 26 deletions(-)
>>
>> diff --git a/drivers/mux/mmio.c b/drivers/mux/mmio.c
>> index 9993ce38a818..5ce9c16fd431 100644
>> --- a/drivers/mux/mmio.c
>> +++ b/drivers/mux/mmio.c
>> @@ -2,7 +2,7 @@
>>   /*
>>    * MMIO register bitfield-controlled multiplexer driver
>>    *
>> - * Copyright (C) 2017 Pengutronix, Philipp Zabel <kernel@pengutronix.de>
>> + * Copyright (C) 2017-2025 Pengutronix, Philipp Zabel <kernel@pengutronix.de>
> 
> Why are you updating someone's copyrights?
> 

Yes, I forgot to modify from the RFC series. I will keep it unmodified
in the next version.

Regards,
Chintan.

> 
> Best regards,
> Krzysztof
