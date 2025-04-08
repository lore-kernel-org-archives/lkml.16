Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE0C28F6B;
	Tue,  8 Apr 2025 13:19:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.207.212.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744118385; cv=none; b=SpzpPzESEzpBUNxx64i6i4pE3ugiiAj8SYPUlruB8JLu9g7OE6aJsxLHsamseVnOumFUSlMg0FCOVRUEKJ04RkWSOtFFE4/czt0LV4cEg5yQJS8eoOfO2hIYqjKCcIDwOi7e6PCCvmEyaByo6rcUiMBluFdIQDvwOevVWBiAdcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744118385; c=relaxed/simple;
	bh=xEVrG4B1nYdezxiQZj8Kas2wxn7JL8kKvyFsHxUk1sk=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=N8bqWC1NYiga2V/C5x7/CR+HFymXD5dtyivXqARTOZ9trqLAs5hVIPwU+8ZW4LCcbfEIoIZX3ejMwrstvw+5G1gmmRWzHQVfhHvw3xVtgF/BtfIpGNjBtll2ip5OIwudYt+V25W0Iyb8NENwN56xIHcY66ySdbQH4PmSyH1yiDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=SnPhGGZ4; arc=none smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="SnPhGGZ4"
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 538AxRwX008721;
	Tue, 8 Apr 2025 15:19:06 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	idy7unnjHF724gRlX6xdG7LoWiV2Db9Z6YWr6CtXLEw=; b=SnPhGGZ4sX07yhN4
	4MXSfSo/N5BcZyt3zL9A+tmFTt1eZ9BObWHhjYPK+KrbsG9Bt/9mDh7E1QiqoAVC
	C0qlRdPJnKp0byut2kxVtwPJQrmxbqTjj0SmaBwDxXUr+CQgPFXKAmVaaogJ+zEN
	3CDvdvcxQM/oLtYXa7MTp6mxlLDhge4YG9vi4/XG/jD5tpatwvH+z7TxtD3I+4xw
	kMR7S2YwOscP/L7aDDp2U5uBGXzDtea/vtYQ7lkzttpfy8Mx7A3rgY2t77Ai3vfZ
	eG5OA7zOXLsF1tIaunn/UcXQE7gElQfhe1OCo09Mdt+vqBzfQ8C71RkZdYCrpm+Y
	UF+Ogg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 45tw2gw664-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 08 Apr 2025 15:19:06 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id B6C9740047;
	Tue,  8 Apr 2025 15:17:57 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D64E59A469C;
	Tue,  8 Apr 2025 15:16:32 +0200 (CEST)
Received: from [10.48.87.62] (10.48.87.62) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 8 Apr
 2025 15:16:32 +0200
Message-ID: <1f737628-6a0b-4265-96bc-4ddacd244e7a@foss.st.com>
Date: Tue, 8 Apr 2025 15:16:31 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 2/7] dt-bindings: memory-controllers: Add STM32 Octo
 Memory Manager controller
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
        Maxime
 Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue
	<alexandre.torgue@foss.st.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Catalin Marinas
	<catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, <christophe.kerello@foss.st.com>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>
References: <20250407-upstream_ospi_v6-v8-0-7b7716c1c1f6@foss.st.com>
 <20250407-upstream_ospi_v6-v8-2-7b7716c1c1f6@foss.st.com>
 <20250408-magic-arrogant-hound-0f2de5@shite>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20250408-magic-arrogant-hound-0f2de5@shite>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-08_05,2025-04-08_02,2024-11-22_01



On 4/8/25 08:45, Krzysztof Kozlowski wrote:
> On Mon, Apr 07, 2025 at 03:27:33PM GMT, Patrice Chotard wrote:
>> +  st,syscfg-amcr:
>> +    $ref: /schemas/types.yaml#/definitions/phandle-array
>> +    description: |
>> +      The Address Mapping Control Register (AMCR) is used to split the 256MB
>> +      memory map area shared between the 2 OSPI instance. The Octo Memory
>> +      Manager sets the AMCR depending of the memory-region configuration.
>> +      The memory split bitmask description is:
>> +        - 000: OCTOSPI1 (256 Mbytes), OCTOSPI2 unmapped
>> +        - 001: OCTOSPI1 (192 Mbytes), OCTOSPI2 (64 Mbytes)
>> +        - 010: OCTOSPI1 (128 Mbytes), OCTOSPI2 (128 Mbytes)
>> +        - 011: OCTOSPI1 (64 Mbytes), OCTOSPI2 (192 Mbytes)
>> +        - 1xx: OCTOSPI1 unmapped, OCTOSPI2 (256 Mbytes)
>> +    items:
>> +      items:
> 
> That's not what Rob asked. Are we goign to repeat the story of Benjamin
> and VD55G1? You got the exact code to use, which only need corrections
> in indentation probably. Why not using it?
> 
> You miss here '-'.

Hi Krzysztof

Sorry but Errare humanum est and dtbs_check didn't detect this.
I will fix it. 

Thanks
Patrice

> 
> Best regards,
> Krzysztof
> 
