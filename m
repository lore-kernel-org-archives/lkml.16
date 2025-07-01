Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3010526F44D;
	Tue,  1 Jul 2025 10:24:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751365456; cv=none; b=uMm02ck1FHnVCCXjNhQI8fuGqNf30Fn/HfB9WETr7F116rW4r84vq9KJk2qEIear/vWIeHZ4go4FsGJz+lORY3v9JAsbQDf0dNA8UqVzPXrw9IwxQzJoRJzHIKqY1uwm/HknlYNdyv/1CouwjFnAQ9yeVdpaaqmTZd6xSjsTXZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751365456; c=relaxed/simple;
	bh=0/iNVmK7c8aL1I05jqAbGL/kZXZFZiQga2eCOlwdGOQ=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:CC:References:
	 In-Reply-To:Content-Type; b=m8gWiaN28MF1mie+J5Xks0AAYGFENu4ncCXEEhJcVYFVrSkPM3PCuBt3CWDtG8B2sjI+/DHnCoNPJqvX/Vn5yjYUkqLdtaDm2XY9eJbHuZ5sIFZ0H4S52QHBN9jk98sgURRXVSEmtu1P2U8B6DSfnNw75IN2egRxqTgmiysWY6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=oHLnEtse; arc=none smtp.client-ip=198.47.23.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="oHLnEtse"
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 561AO1xV3592408;
	Tue, 1 Jul 2025 05:24:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1751365441;
	bh=EF2WJvYtMV9eDOVcZunhubkhdnTMmMeXGzCpAgn97Ec=;
	h=Date:Subject:From:To:CC:References:In-Reply-To;
	b=oHLnEtse0IUkMZku6hbfiCdfJhlVvbwHLw+EWtiZ7s1R9lj+Mjbj5MlXPpKBW4WKb
	 BdV8ZW2n9IQMNkwtIdwISHh90FgLpCal/LvT2UUM8DwAKu5ZIFgCizujuPpfN2c0Nu
	 6aoBKk854j0GpMiqDzHOHIcZsitN0njLfMDyLQ2Y=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 561AO1im3991505
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Tue, 1 Jul 2025 05:24:01 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Tue, 1
 Jul 2025 05:24:01 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Tue, 1 Jul 2025 05:24:01 -0500
Received: from [172.24.227.167] (jayesh-hp-z2-tower-g5-workstation.dhcp.ti.com [172.24.227.167])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 561ANvYS1388403;
	Tue, 1 Jul 2025 05:23:57 -0500
Message-ID: <d8a8293d-2759-4408-b1a7-a2689383b043@ti.com>
Date: Tue, 1 Jul 2025 15:53:56 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] arm64: dts: ti: k3-j721e-main: Make the "scm_conf"
 node a "simple-bus"
From: Jayesh Choudhary <j-choudhary@ti.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, <nm@ti.com>, <vigneshr@ti.com>,
        <devicetree@vger.kernel.org>
CC: <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <s-vadapalli@ti.com>, <rogerq@kernel.org>,
        <afd@ti.com>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
References: <20250603095609.33569-1-j-choudhary@ti.com>
 <20250603095609.33569-2-j-choudhary@ti.com>
 <15da3051-c35e-4876-9185-9079493dc66c@kernel.org>
 <0c69137d-93ad-4843-8512-9885b9cba452@ti.com>
Content-Language: en-US
In-Reply-To: <0c69137d-93ad-4843-8512-9885b9cba452@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Hello Krzysztof,

On 04/06/25 15:18, Jayesh Choudhary wrote:
> Hello Krzysztof,
> 
> On 03/06/25 16:32, Krzysztof Kozlowski wrote:
>> On 03/06/2025 11:56, Jayesh Choudhary wrote:
>>> The "scm_conf" bus need not be "syscon". Now that we have "pcie*_ctrl"
>>> child nodes for "ti,syscon-pcie-ctrl" property in "pcie" nodes, change
>>> "scm_conf" node to "simple-bus".
>>> Also remove "reg" property as it is not needed by "simple-bus".
>>
>> This (possibly) affects all other users of DTS which were expecting this
>> ABI. It's not only about forward-compatibility, but other projects.
>>
>> Maybe this doe snot matter for you, so explain that in commit msg and
>> provide rationale why you are affecting other users.
>>
>>
> 
> This should not affect other users of DTS. J784S4 already has this
> change and it serves as a validation that DT nodes are compatible
> with other projects (for example uboot driver handles it).
> Other SoCs are being modified with taking J784S4 as a working reference.
> 
> Considering this, do I still need to add something? Or is it okay
> since I am not exactly affecting other projects?
> Should I add something along the lines of "similar to j784s4...."?
> 

Gentle ping on the above comment.

I have checked other projects like Barebox. That supports TI K3 SoC
but only AM62x and AM62L. Nothing in this series affects it.

Warm Regards,
Jayesh


> 
>>
>> Best regards,
>> Krzysztof
