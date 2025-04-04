Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5865F1A238C;
	Fri,  4 Apr 2025 12:29:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.132.182.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743769773; cv=none; b=PcrMSdAH1NLOFBC6qZ1+okrnN/v5xQDc6CMHCFCLdlpjD5toKoi5pJe4LWnr762dXBLKNy0TbTd2ZbiTBkVD0Celtqhrk1UCupIWBraX19hEnXFPzdTolEFEU53Vlc05IoXgQefDf9G1gbub8zClzV/YBa/w2WdX4lYgl2C/dpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743769773; c=relaxed/simple;
	bh=Vglg3cinDLeA9fqr89u4b8HJQ4PJ6C0jehJ/9mZQw5M=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=um3bXhkt8h3Tpo22QEQrynqNyC0ul6QMnDLtf9TiGtNhgqbiX3rnRHUnESLtk6XWv7Kx23wnx8O+kPjjDOx2lBZflhCJOcJkgv5l8f3vdFWuUSMvmOyUie0Ztu/EJLhv9v0Yuus2BiKuioFiuzDkDD1wGgZmI6lQf0zQOA7iDck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=lcrV7mf+; arc=none smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="lcrV7mf+"
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 534C4rlN019849;
	Fri, 4 Apr 2025 14:29:19 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	PX8HMUoBjUQH8f441S3m5UlI1PDj19al//F5PjyAvQM=; b=lcrV7mf+1aKq4ncl
	X8GicNvEeYlQ/YXrV0GF6CfEDJZ4e54+tzxPwNPxc9K+vJ0Pi2X5FNqGgk3SF+JR
	g/zPMpVGG/gzuaV3WyQoxz6s43dC0qmMMxRiNXOpCmFsitUwX879JKy1nO+kVm79
	7OOoKw+iNatnKMlQXzinmcLXU4B+h4vNSb90nJ0UBGv0JmymYdMn4jxXOhV4XKOZ
	8Jsakge7t/zKLrhJuD7oukXtTO9POx8Nfaw7WT90zE5lOrfADgneki4xDBespZOg
	GsEMTjFoLpVk2wB407H2FDitZiapJGyJ+pyiVrfijsdP5PoYDyA81o2f0KTszkmD
	k4BS2Q==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 45t2cqk4sw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 04 Apr 2025 14:29:18 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 2C8CD4002D;
	Fri,  4 Apr 2025 14:28:20 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 976A79234AD;
	Fri,  4 Apr 2025 14:27:33 +0200 (CEST)
Received: from [10.130.77.120] (10.130.77.120) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 4 Apr
 2025 14:27:33 +0200
Message-ID: <6e2b1717-6189-4115-ab55-01227a5a1d5a@foss.st.com>
Date: Fri, 4 Apr 2025 14:25:14 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] irqchip/gic: Use 0x10000 offset to access GICC_DIR on
 STM32MP2
To: Thomas Gleixner <tglx@linutronix.de>, <maz@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <mcoquelin.stm32@gmail.com>, <alexandre.torgue@foss.st.com>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>
References: <20250403122805.1574086-1-christian.bruel@foss.st.com>
 <20250403122805.1574086-3-christian.bruel@foss.st.com> <87mscxuu6f.ffs@tglx>
From: Christian Bruel <christian.bruel@foss.st.com>
Content-Language: en-US
In-Reply-To: <87mscxuu6f.ffs@tglx>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-04_05,2025-04-03_03,2024-11-22_01

Hello Thomas,

thanks for your comments.
After Marc's suggestion we found a better solution. So dropping this 
patch set.

Christian

On 4/3/25 17:43, Thomas Gleixner wrote:
> On Thu, Apr 03 2025 at 14:28, Christian Bruel wrote:
> 
>> When GIC_4KNOT64K bit in the GIC configuration register is
>> 0 (64KB), address block is modified in such a way than only the
> 
> s/than/that/
> 
>> first 4KB of the GIC cpu interface are accessible with default
>> offsets.
>> With this bit mapping GICC_DIR register is accessible at
> 
> What's 'this bit mapping' ? This sentence does not parse.
> 
>> offset 0x10000 instead of 0x1000, thus remap accordingly
> 
> ...
> 
>> +/*
>> + * 8kB GICC range is not accessible with the default 4kB translation
>> + * granule. 0x1000 offset is accessible at 64kB translation.
>> + */
> 
> I have a hard time to map this comment to the change log, which suggests
> to me that this is the other way round.
> 
>> +static bool gic_8kbaccess(void *data)
>> +{
>> +	struct gic_chip_data *gic = data;
>> +	void __iomem *alt;
>> +
>> +	if (!is_hyp_mode_available())
>> +		return false;
>> +
>> +	alt = ioremap(gic->cpu_phys_base, GIC_STM32MP2_CPU_DEACTIVATE + 4);
>> +	if (!alt) {
>> +		pr_err("Unable to remap GICC_DIR register\n");
>> +		return false;
> 
> That's a hack because in case that the remap fails, this leaves the
> thing enabled, but disfunctional.
> 
> Thanks,
> 
>          tglx
