Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F15725CC50;
	Tue, 24 Jun 2025 11:22:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750764126; cv=none; b=Ml2LFKkqg4xHEbSR98BGgD3CpvbAVHhDe+VwNeUBelzBVw3sYrY2VE9o+CIYd2feg1+PKLlASzDdqEem+kWZDzvomqbWG5zhneUkuBS3k/NVe3zGyDatWZ6XTfoWjKjbL13qkHTuyNRDOTdx64Ro2DNpkCYCre1UCyQKSGMbpwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750764126; c=relaxed/simple;
	bh=8z45rPhTp9++VMaVUV9YLd8PSxd51qCeYl+pMaM7b3w=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=D/igqH0Pj68sz+33B7wMGStuEIZMqlyzdvOSbjNaDJ5TNpetF5eEXuareRO8LQ8zIXQ60sRO9DYP6Pq+7XFI0xwveGL4teo1eLrX9iywy+/KxPCly8Pg6AVBIQ74b/+ZsnOVlLUjUoePp6Ae9/V9MI8nkpNMSJCwmYV6BEjv1lw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=MTgDwYxe; arc=none smtp.client-ip=198.47.23.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="MTgDwYxe"
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 55OBLwas1774429;
	Tue, 24 Jun 2025 06:21:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1750764118;
	bh=Tghv0NnaHu52whCw12bEhrQP4iuYVJ1S9bWwB/iV8JU=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=MTgDwYxecSBYTbh7kyx1W3VkiwPCGXoRTh0enJaeGziwSLU1lmOEKs9uWc1tDG7JO
	 agYLkSuVFLCQo01JJ2hsXzk12KjiLPWuedB0xbbMh1VqbET3mxQwQH0+qKqWdn9eRt
	 94t2JThVPQScu5MHVQmBYJetpTvnRntKRFw8qAFw=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 55OBLwGD1488432
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Tue, 24 Jun 2025 06:21:58 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Tue, 24
 Jun 2025 06:21:57 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Tue, 24 Jun 2025 06:21:57 -0500
Received: from [172.24.227.38] (ula0502350.dhcp.ti.com [172.24.227.38])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 55OBLqTs1415540;
	Tue, 24 Jun 2025 06:21:53 -0500
Message-ID: <9ac27b3b-5bb3-4b32-8c18-f66b3b72af89@ti.com>
Date: Tue, 24 Jun 2025 16:51:51 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCHv4 2/6] dt-bindings: arm: ti: Add bindings for AM62D2 SoC
To: Krzysztof Kozlowski <krzk@kernel.org>, <nm@ti.com>, <vigneshr@ti.com>,
        <praneeth@ti.com>
CC: <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <khasim@ti.com>, <v-singh1@ti.com>, <afd@ti.com>, <bb@ti.com>,
        <devarsht@ti.com>
References: <20250623141253.3519546-1-p-bhagat@ti.com>
 <20250623141253.3519546-3-p-bhagat@ti.com>
 <2e26a403-fac2-4217-8525-24e39d4c92c5@kernel.org>
 <c4362d9e-62a4-4c28-b1cd-c338467f92ae@ti.com>
 <6f98274a-88c3-4afc-b324-b024f31e1628@kernel.org>
Content-Language: en-US
From: Paresh Bhagat <p-bhagat@ti.com>
In-Reply-To: <6f98274a-88c3-4afc-b324-b024f31e1628@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Hi Krzysztof,


On 24/06/25 16:25, Krzysztof Kozlowski wrote:
> On 24/06/2025 12:39, Paresh Bhagat wrote:
>>>> This SoC is of part K3 AM62x family, which includes the AM62A and AM62P
>>>> variants. While the AM62A and AM62D are largely similar, the AM62D is
>>>> specifically targeted for general-purpose DSP applications, whereas the
>>>> AM62A focuses on edge AI workloads. A key distinction is that the AM62D
>>>> does not include multimedia components such as the video encoder/decoder,
>>>> MJPEG encoder, Vision Processing Accelerator (VPAC) for image signal
>>>> processing, or the display subsystem. Additionally, the AM62D has a
>>>> different pin configuration compared to the AM62A, which impacts
>>>> embedded software development.
>>
>> This section is important as it clarifies the difference between AM62a
>> and AM62d, as we are reusing AM62a dtsi files for AM62d. Let me know if
>> you need a shorter version.
> This is not important:
>
> "While the AM62A and AM62D are largely similar, the AM62D is
> specifically targeted for general-purpose DSP applications, whereas the
> AM62A focuses on edge AI workloads."
>
> It is irrelevant. Rest is fine.
Fine will do.
>
>>
>>>> This adds dt bindings for TI's AM62D2 family of devices.
>>>>
>>>> More details about the SoCs can be found in the Technical Reference Manual:
>>>> https://www.ti.com/lit/pdf/sprujd4
>>>>
>>>> Signed-off-by: Paresh Bhagat <p-bhagat@ti.com>
>>> And what happened with the previous comments?
>>
>> Yep there were some indentation problems earlier, which is fixed in this
>> version. There was also an ack from Conor Dooley in v3. I will include that.
> Why you did not include it before?
>
> Can you start using b4 for your process of submitting patches?


I missed it. I got to know about the b4 tool internally, will use it. 
Thanks.
>
>
> Best regards,
> Krzysztof
