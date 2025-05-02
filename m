Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F8B31F4285;
	Fri,  2 May 2025 21:09:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746220196; cv=none; b=EmpJXlEBC+L8NHk60OSFx3tduJnyyKRqvvH3DaQiC2YzI6IArtOiaV3T1v6MyeKxaBMv2JCA2U608LfmwreYuMCoZdQYEo8+IOSvljiAyWgwQyf6BYjgLn7qFve4SWyZbIVGD2H6CSMPdmsN6lUr0/ySGmdFhyH8+bATuRA5ARI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746220196; c=relaxed/simple;
	bh=GGE/g091IXACI6ntV1tRIE+gV0a+8K/KjSrLGMiIAUk=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=m80HpFGmNPqRcYEFSKCYuw6rT0YiftHyTzibheKXPFyGQOiPXUra4Scxk3LbS5B+Ys3rOXy2MmPcIHjokY6uIogDx0B7kwzrU3ISgapyf7tAj4T1ShgzMMCUZgYilo82/+I3CoYmV2ju50ZoJYfl1t/wJN0CaSANsgJdxe+ze4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=ekFpuuvj; arc=none smtp.client-ip=198.47.23.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="ekFpuuvj"
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 542L9iWX3947136
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 2 May 2025 16:09:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1746220184;
	bh=INlto//K/UEad13JFyWgRQjApVIpfNkOGuuB7xJWi2k=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=ekFpuuvjkK9kVSa25fmfD8jwUUVRzmvQKepvbRwtHKX9eL36xQMdxJWRzwERFIGGm
	 iMDmjM6dlYpkCF7ck222jwzlyK5PQokXqhgs0MhFL85/MlZifU6H0skXsiSzk7wMQo
	 aWHyDtbNuPBoLiOf/Mlbit+dKEHQpaX1lFz+GzK8=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 542L9ilU017320
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 2 May 2025 16:09:44 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 2
 May 2025 16:09:44 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 2 May 2025 16:09:44 -0500
Received: from [128.247.81.105] (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 542L9i8R035073;
	Fri, 2 May 2025 16:09:44 -0500
Message-ID: <61b0ef12-8ec6-4a9b-85dc-0fe650bd00c2@ti.com>
Date: Fri, 2 May 2025 16:09:44 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 06/11] arm64: dts: ti: k3-am62a7-sk: Enable IPC with
 remote processors
To: Nishanth Menon <nm@ti.com>
CC: Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Hari Nagalla
	<hnagalla@ti.com>,
        Beleswar Prasad <b-padhi@ti.com>, Andrew Davis
	<afd@ti.com>,
        Markus Schneider-Pargmann <msp@baylibre.com>,
        Devarsh Thakkar
	<devarsht@lewv0571a.ent.ti.com>
References: <20250415153147.1844076-1-jm@ti.com>
 <20250415153147.1844076-7-jm@ti.com>
 <20250502115328.mcwtslklr7m4sih7@demotion>
Content-Language: en-US
From: Judith Mendez <jm@ti.com>
In-Reply-To: <20250502115328.mcwtslklr7m4sih7@demotion>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Hi Nishanth,

On 5/2/25 6:53 AM, Nishanth Menon wrote:
> On 10:31-20250415, Judith Mendez wrote:
>> From: Devarsh Thakkar <devarsht@ti.com>
>>
>> For each remote proc, reserve memory for IPC and bind the mailbox
>> assignments. Two memory regions are reserved for each remote processor.
>> The first region of 1MB of memory is used for Vring shared buffers
>> and the second region is used as external memory to the remote processor
>> for the resource table and for tracebuffer allocations.
>>
>> Signed-off-by: Devarsh Thakkar <devarsht@ti.com>
>> Signed-off-by: Hari Nagalla <hnagalla@ti.com>
>> Signed-off-by: Judith Mendez <jm@ti.com>
>> Acked-by: Andrew Davis <afd@ti.com>
>> Reviewed-by: Beleswar Padhi <b-padhi@ti.com>
>> Reviewed-by: Jai Luthra <jai.luthra@ideasonboard.com>
> 
> Could you rebase the series on latest linux-next? it looks like we
> picked up a conflict with this series.

Ok, will rebase and respin, thanks.

~ Judith

> 
> ---
> Regards,
> Nishanth Menon
> Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D



