Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 586BA1DB363;
	Fri,  4 Apr 2025 12:29:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.132.182.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743769773; cv=none; b=uQ8cTfojseg4CSe/ia/BTs+1WDq9jfxZr5AL9dsy6BGaYu44imVXoc4QJfuCTxuDcxH8DcHTnTsRnojEHGKxGxH1VNyxEirT7cIg/QBRATFVrJ56RvuU1lS0+5qNZEPirkDeV/c+1iIaVzj3x1NqKfpE4gGr/QN84+w10qK9Lts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743769773; c=relaxed/simple;
	bh=G8ctkJROJsict+qMOKg6qi8hyo4fiy2orZctv+zdWwM=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=cZHhW6DPOIpcHI8ddK0eQMYSvH3QWZOxzcVUez/MabJU02yQLDRX7pN8+AHRGMupdrN920V/D+NaTyc0+pGTO7ZOURSvaADvqpOnGzWrkRiQ9huXymklm3ukqzIqP54oClADg1YD2LIgZiSm39R45ryc9CwuuUyztkDn9xVIQpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=OxYRj0LJ; arc=none smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="OxYRj0LJ"
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 534C4rlK019849;
	Fri, 4 Apr 2025 14:29:07 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	Lf1R2wPEeyp7BvissUb4r5z/yKuNxD0GifSjKPShPOI=; b=OxYRj0LJdcDYnhCf
	LJnjgquJDsFxwwN3stfNTh14sb4P7Bh38hOWYcgI/BFzH0hjlygSB9NJlCVVxstn
	P7s5uGeDVU3HpFyFouY+coiwePFg8qi4TwpjJ1l7SexelwghQSeP7JMK/qGN/ej7
	v07csiTrNGllJfVNMv55Sw8kl0V+g9ZfsjQheCTs2TQR0NTd819hZL5GrwL8aXV2
	Jptt5RanEzR/F5ycRksZsfYOd6mF7fo/bKC1rP4ciMx1TuJzY5lgGkK5aw6LwCHx
	GjqSBjezxCgScLecSGTMfeyX1jGlBuDbaQ6Gc6761OX/3HECEfz9rXFTf78dGyJb
	3GR2xQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 45t2cqk4s8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 04 Apr 2025 14:29:07 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id A2B994005F;
	Fri,  4 Apr 2025 14:28:07 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E97BE9234AC;
	Fri,  4 Apr 2025 14:27:32 +0200 (CEST)
Received: from [10.130.77.120] (10.130.77.120) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 4 Apr
 2025 14:27:32 +0200
Message-ID: <1c9a49cb-35a1-4bcc-abd5-b14a49d4d094@foss.st.com>
Date: Fri, 4 Apr 2025 14:17:08 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: st: add st,stm32mp2-cortex-a7-gic in intc
 node in stm32mp251.dtsi
To: Marc Zyngier <maz@kernel.org>
CC: <tglx@linutronix.de>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <mcoquelin.stm32@gmail.com>,
        <alexandre.torgue@foss.st.com>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>
References: <20250403122805.1574086-1-christian.bruel@foss.st.com>
 <20250403122805.1574086-4-christian.bruel@foss.st.com>
 <874iz5yx2c.wl-maz@kernel.org>
From: Christian Bruel <christian.bruel@foss.st.com>
Content-Language: en-US
In-Reply-To: <874iz5yx2c.wl-maz@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-04_05,2025-04-03_03,2024-11-22_01



On 4/3/25 19:27, Marc Zyngier wrote:
> On Thu, 03 Apr 2025 13:28:05 +0100,
> Christian Bruel <christian.bruel@foss.st.com> wrote:
>>
>> Add st,stm32mp2-cortex-a7-gic to enable the GICC_DIR register remap
>>
>> Signed-off-by: Christian Bruel <christian.bruel@foss.st.com>
>> ---
>>   arch/arm64/boot/dts/st/stm32mp251.dtsi | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/arch/arm64/boot/dts/st/stm32mp251.dtsi b/arch/arm64/boot/dts/st/stm32mp251.dtsi
>> index f3c6cdfd7008..030e5da67a7e 100644
>> --- a/arch/arm64/boot/dts/st/stm32mp251.dtsi
>> +++ b/arch/arm64/boot/dts/st/stm32mp251.dtsi
>> @@ -115,7 +115,7 @@ scmi_vdda18adc: regulator@7 {
>>   	};
>>   
>>   	intc: interrupt-controller@4ac00000 {
>> -		compatible = "arm,cortex-a7-gic";
>> +		compatible = "st,stm32mp2-cortex-a7-gic", "arm,cortex-a7-gic";
> 
> What nonsense is this? This is an *arm64* machine, with I expect a
> GIC400. Where is this A7 compat coming from?

Probably historical, as the first port was for aarch32. I will fix this 
separately. thanks for the head up!

Christian

> 
> 	M.
> 
