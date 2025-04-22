Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EB3953365;
	Tue, 22 Apr 2025 08:39:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.132.182.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745311172; cv=none; b=srjfX9UCADBkk44KM1Pv1TfMEOYEve75tbPDqifVxMp7lhpuzuaN8YZOEM4zxp2kwjHv3agTW3rZZ8jV8Y75eskZ6fQ9sgbOeGkU/gJKImE3+XvN7sUXWRFGB/ba6ynzSKAsij3cyyDaR8cO9+gIexHiU77AgMJqvQdMSnT0O/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745311172; c=relaxed/simple;
	bh=oJIN19zQgzez3l06SIhTIk1FH+znpSFgnJG9QeeBL/U=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Z6ffDgyWL/JzBJmPaOph+tS5e7KyfJl1AQrmPTy+SX0S5yPZC43h+aVJLOcmC8fZ7AO77DsZvXvs2Te17kYj/4ANk/bU4CiEhvigVcbbv4DyndAxjoUDw6IhumQ6owJNtIUueC1223NXJrS7/9ZMdiDlfrOG/tqU9A0V4m1Rh4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=aC/BBYhR; arc=none smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="aC/BBYhR"
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53M7dHvO023461;
	Tue, 22 Apr 2025 10:39:00 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	p1HgdGedqFLflmSyTqaih9yVCR93DL2hpGbz6kInKgQ=; b=aC/BBYhR30IsKwaq
	tyXav00NKeBxVSsNoWFNtYcD6H9WlT1jyliHwkZlkjlzTA/WZMWKKmL1deiqVbVt
	htwGqnGex+KHq+8vJt+g2M2eKMEjYxkefrVasUGA+dllSKegRZD+nrgwCVl5xrqO
	28E+zfrbHA4tUUPmN/WDR7Yy7kGKVi1imh1Eb8ZRj9AR4uDs4Z3Zppptoz2grf2E
	KVt0F1ClLRjN/9OxEVWjHE4QFDnJWRS64EP72K59/tWbg483bcB33G2JXE+cKOVq
	JKVfhOSs/rDH8J7y2lEvP5MD4D3mupygVYw9iv1EkuSD2Z7Cydpze78W8zX9iFiN
	rQdc2g==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 464nd3y1w8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Apr 2025 10:39:00 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id B88C340059;
	Tue, 22 Apr 2025 10:37:54 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E93E99D6100;
	Tue, 22 Apr 2025 10:37:04 +0200 (CEST)
Received: from [10.48.87.62] (10.48.87.62) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 22 Apr
 2025 10:37:04 +0200
Message-ID: <2bdbee00-07d2-4f6d-830a-1e5e6982d5a6@foss.st.com>
Date: Tue, 22 Apr 2025 10:37:03 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 2/3] memory: Add STM32 Octo Memory Manager driver
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maxime Coquelin
	<mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon
	<will@kernel.org>
CC: <christophe.kerello@foss.st.com>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>
References: <20250410-upstream_ospi_v6-v9-0-cf119508848a@foss.st.com>
 <20250410-upstream_ospi_v6-v9-2-cf119508848a@foss.st.com>
 <3dd741ef-4589-49cd-967f-8a2d72e75cf4@kernel.org>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <3dd741ef-4589-49cd-967f-8a2d72e75cf4@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-22_04,2025-04-21_02,2024-11-22_01



On 4/15/25 08:00, Krzysztof Kozlowski wrote:
> On 10/04/2025 11:27, Patrice Chotard wrote:
>> +	for (i = 0; i < omm->nb_child; i++) {
>> +		idx = of_property_match_string(dev->of_node,
>> +					       "memory-region-names",
>> +					       mm_name[i]);
>> +		if (idx < 0)
>> +			continue;
>> +
>> +		/* res1 only used on second loop iteration */
>> +		res1.start = res.start;
>> +		res1.end = res.end;
>> +
>> +		node = of_parse_phandle(dev->of_node, "memory-region", idx);
>> +		if (!node)
>> +			continue;
>> +
>> +		ret = of_address_to_resource(node, 0, &res);
>> +		if (ret) {
>> +			of_node_put(node);
>> +			dev_err(dev, "unable to resolve memory region\n");
>> +			return ret;
>> +		}
>> +
>> +		/* check that memory region fits inside OMM memory map area */
>> +		if (!resource_contains(omm->mm_res, &res)) {
>> +			dev_err(dev, "%s doesn't fit inside OMM memory map area\n",
>> +				mm_name[i]);
>> +			dev_err(dev, "%pR doesn't fit inside %pR\n", &res, omm->mm_res);
>> +
> 
> I don't understand. I already pointed out that you leak OF reference.
> You fixed it in one place, ignoring all the rest. You must fix it
> everywhere.
> 

Hi Krzysztof

My bad, i will add all missing of_node_put().

Thanks
Patrice

>> +			return -EFAULT;
>> +		}
>> +
> 
> 
> Best regards,
> Krzysztof
