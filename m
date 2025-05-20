Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D356F25228B
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 16:32:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.207.212.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747758727; cv=none; b=ekBskw8SJJo70J7dzSNAj43+7L3j/ARK3HWtGjUwivFh2CuvWhS6wE/nShdhOenI2NN3dxXqk+D4qXS+D3YhlLJdS8SBKkzQPobMzrSVFd0B7J9kAubrKNHp3OtTRaN+a6gB6Z/VjFIPCT706AFlXEJUIJRCUVEt08h6zZQf7tM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747758727; c=relaxed/simple;
	bh=POmbrIHo60gDWrhh/e54NXyzo1C9QXa4uEQ3RXx3osc=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:CC:References:
	 In-Reply-To:Content-Type; b=dwZ/vtpoTTUQqOeBqbf/jrIqBAIz94NQDNhyL3+1UEYvFEcvZALFnWW5RTQUCde18fMpFZnyFbXJvSNE+fOZMm9PtFCSmqErLgwEer8N7itH+g2qSLppeF3b4qfhrA1Pkxs1NbuZ7yiofSImBKX2ksRrvnASzJ/mjmAWkX56p4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=nPDeI+8d; arc=none smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="nPDeI+8d"
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54KEk9RU024592;
	Tue, 20 May 2025 18:32:01 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	WLtDt6YanhmPfaOmDE+0nd7iiaBZS7FD9MJadgVpl0c=; b=nPDeI+8dm9CPaejc
	Q0ud6zvn0FTXf8V0HOukof9Nyx6XE7pG7hhP1R8AVQCRQ+aOwkUl1UdpJp4T5uMo
	HMFWkMJxF/0djHZO8q8QrM6GmL4pqk2qnVvXjmnPDVUMZCvLCHtw2MZ/Nb/sgQvG
	9rAO16C+RmI/8cIMgvrCPAmIN8XW0KQazsRsAH3yIG6CORMz+39trn9VT1CgrEyb
	yAn+dYv5ewgQW3d9OAssi8PY/fzgR0knsWWCRBfCbS5aYtvv+orefp6qVkp28RQ/
	41Ai9ry1o46/dSFmKH0/0+k8BrGORrrLAJktIgkBZazll5P1uEclk/ZFF6/ht05A
	dCx+cQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 46phbgnvc5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 20 May 2025 18:32:01 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id AF92A4004F;
	Tue, 20 May 2025 18:31:02 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D2C93B190B2;
	Tue, 20 May 2025 18:29:44 +0200 (CEST)
Received: from [10.252.30.65] (10.252.30.65) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 20 May
 2025 18:29:44 +0200
Message-ID: <25eec2f8-8883-489e-a68b-3f80056bdc76@foss.st.com>
Date: Tue, 20 May 2025 18:29:43 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [V1 1/2] arm stm32mp131.dtsi: add "encoding_mode" nvmem
 definition
From: Yann Gautier <yann.gautier@foss.st.com>
To: Rodolfo Giometti <giometti@enneenne.com>, <linux-kernel@vger.kernel.org>
CC: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue
	<alexandre.torgue@foss.st.com>,
        Eric Fourmont <eric.fourmont-ext@st.com>
References: <20250519130859.3389704-1-giometti@enneenne.com>
 <20250519130859.3389704-2-giometti@enneenne.com>
 <f1ffb147-459a-4b3b-b109-9b07b25c99ac@foss.st.com>
Content-Language: en-US
In-Reply-To: <f1ffb147-459a-4b3b-b109-9b07b25c99ac@foss.st.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-20_06,2025-05-20_03,2025-03-28_01

On 5/20/25 10:26, Yann Gautier wrote:
> On 5/19/25 15:08, Rodolfo Giometti wrote:
>> This patch adds the definition for the nvmem location "encoding_mode"
>> related to the "cpu0" node.
>>
>> Signed-off-by: Rodolfo Giometti <giometti@enneenne.com>
>> ---
>>   arch/arm/boot/dts/st/stm32mp131.dtsi | 7 +++++++
>>   1 file changed, 7 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/st/stm32mp131.dtsi 
>> b/arch/arm/boot/dts/st/stm32mp131.dtsi
>> index e555717c0048..52bf497e26bb 100644
>> --- a/arch/arm/boot/dts/st/stm32mp131.dtsi
>> +++ b/arch/arm/boot/dts/st/stm32mp131.dtsi
>> @@ -24,6 +24,9 @@ cpu0: cpu@0 {
>>               clocks = <&scmi_perf 0>;
>>               clock-names = "cpu";
>>               #cooling-cells = <2>;
>> +
>> +            nvmem-cells = <&encoding_mode_otp>;
>> +            nvmem-cell-names = "encoding_mode";
>>           };
>>       };
>> @@ -1167,6 +1170,10 @@ part_number_otp: part-number-otp@4 {
>>                   reg = <0x4 0x2>;
>>                   bits = <0 12>;
>>               };
>> +            encoding_mode_otp: encoding-mode-otp@4 {
> 
> This node should end with @0 instead of 4.
> It should also be placed before part-number-otp node.

I forgot that this node already was in TF-A, with a different name.
This is better to align it here, the the node would become:

			cfg0_otp: cfg0-otp@0 {
				reg = <0x0 0x2>;
				bits = <0 9>;
			};

Best regards,
Yann

> 
>> +                reg = <0x0 0x1>;
> 
> If I'm not mistaken, this should be:
>      reg = <0x0 0x2>;
> 
> 
> Best regards,
> Yann
> 
>> +                bits = <0 9>;
>> +            };
>>               vrefint: vrefin-cal@52 {
>>                   reg = <0x52 0x2>;
>>               };
> 

