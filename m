Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 004D61E51EE
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 05:55:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750830961; cv=none; b=S3AhkOSgMet33ZJOgA79jD6Zi/iNIDxa4Rngs8MMYi0/jEh8blcDt7QQXN6oBugw628a7+EVQ4SVg+8LvrbMJdnBiKR1jckvPvGk4oJtHYvWx11Uu5dvCul3AH/lUjS2u7XTpL/ZkPXsQmtjsibDUSeQ/abxtrP5RCl679M7wNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750830961; c=relaxed/simple;
	bh=5mHx2qp52LHFAY1+WNQ1++R00CeBYRXlVI+r6bb6muY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=S/eg/sjnRMjGjjPkAeUFTinxeggVJrXcAQFHGAUT1zlFs3Zhnn6oyaTCJ4lP3rN56NcIcVoLrD2RMipxylIjvV0ImTiKSu0+Izc0N1tIsYMrKRlBVYRsWarXZZ+Y2w6ZnpQdVLXTGfz2sVVi2SaGnNqyJNzT+MNWvkCXPrW3xso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jek3nG9B; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jek3nG9B"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55P5AYlv014609
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 05:55:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	urXTHU4eOYr5vlGF47ojq1bQ+A2luNE9+0Af7fyCoyM=; b=jek3nG9BJu/p1dTR
	Dy5Pea2Iebt9lqtuBwPqU1DLnTgLsZCvnwhVPRwMEJuO6rnnZbJ6Ox3gmnIoLosJ
	igKPzQaoXiLHiI4DSx+o/GMpFPm17WlWvSqwV3o5ufegdCjxhh/R7rerr0RASSi/
	X6H1BaPORYUMoEb7Ae1gu4wW2ryoQhSh5YQdkzIgiS6ArAUPm6J/+ncKKbx1NdxG
	x0bYD/nBJomM/+XU40KD/laMxRFkhio9bUeP9xewFP1W1jcfYeDFXmN0l/o/tjk+
	jyA6ySKOzfpE1CbBaaELqPgPxwjrGJC6MGQqBqrWq27hpc1+E+oRyXdLoApZyPly
	J3XISQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47evc5qq2c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 05:55:58 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-23824a9bc29so9167835ad.3
        for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 22:55:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750830957; x=1751435757;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=urXTHU4eOYr5vlGF47ojq1bQ+A2luNE9+0Af7fyCoyM=;
        b=INYg6YSWttvrsF4T6K3obcuM04GeB5toh0UCQ7LB32+RGZf8f9BgpoHuEUdGV3KbB6
         CdoiC4A0MGU+K3YRopkOEgv8ytH9m/VdI78/5l7r5vSzuUoatwldMAzHRBMLNyz/vOw3
         varEcPy0qIXeasimqxH5vL0JP0XoCbHdS52Hb9tgG3/KcGnz1CLNBnT6g5b6oOgFxLEF
         K3OK2JEdBPJe6BW1Np3fPTuQFK9MrJmAskd8134mmjG6fAnhd19qgDQEhdnG0cWXN3Gn
         l6eSh9rB54iEcHzACjvz+O/PSmWs7P0Y2uKcuikh8HU6qLgHsEa07mnYH5AXPadcvW+K
         XS1g==
X-Forwarded-Encrypted: i=1; AJvYcCX8Via4q30N/eF6G5j3SB2NoW8P8ywThgjomN9gzNaayng59g4UjBRNrgEQYnoHR75TyecuVTgujOd4rQ4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0NIy874K5iI6eE3OdEky4Y39iYsTcXguaTTOZ5D7a3/h5V3Ds
	A/TrOXN8P+HcydrD1YyTId8FvLAc/9WlmIWqT+2FoXkMLs4nOvWSHy+piKfDoZQ8Z4FU0d+PUoF
	yrp5tnTUTdu9PXNRyW8mc4vEVyh8xzg7fltjbUqS4azbrG+1vMfqtdid3/wU4B+qEJ+4=
X-Gm-Gg: ASbGnctVJSTwv/hY5c5bri/jPxwni0opS51lTRUHlNMP2pElKQxkX03CZDtCtsiQwIT
	4bYpDpIXw0UyUJX0RUgk3TkcdoNZg462qfjYMuK4lXx3Yh6H9j4QEXSQM04p0p6tNaIMoivcqiw
	1LTmnUhhAYt7rQ2I8po1OOC8TbTKG1E822kC1bLxG+hXg/H+2StO9evaQXAFs2uiakg5gdJ0k3S
	48VkH/bhp1sZPTIm1XoIDP23hneA8Y3ToTVu/gcryDcyLK9tUtGowz+YVARH7bNYZdrqvvOYVPZ
	N38Li+bgf/OabcY6Fw2YNGdrer+sACdRE+YhHkaykrK1W6mCdWYIo+GNWAMOrkw=
X-Received: by 2002:a17:902:e802:b0:235:ea29:28e9 with SMTP id d9443c01a7336-23824079460mr38374025ad.38.1750830957488;
        Tue, 24 Jun 2025 22:55:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEtjS5jkmUSESvPLbkb/0K3dNNixBLe3xQT54FHebYS6/RcOU67fQTGoknssxa7pA1gZwWyBw==
X-Received: by 2002:a17:902:e802:b0:235:ea29:28e9 with SMTP id d9443c01a7336-23824079460mr38373755ad.38.1750830957077;
        Tue, 24 Jun 2025 22:55:57 -0700 (PDT)
Received: from [10.151.37.217] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237d860a8d5sm120184275ad.104.2025.06.24.22.55.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Jun 2025 22:55:56 -0700 (PDT)
Message-ID: <3514a3af-ab7d-41e6-9e59-95defe9105b4@oss.qualcomm.com>
Date: Wed, 25 Jun 2025 11:25:51 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: ipq5424: Describe the 4-wire UART SE
Content-Language: en-US
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250624-ipq5424_hsuart-v2-1-6566dabfe4a6@oss.qualcomm.com>
 <bdf7e3e4-f1d1-4f3f-aebe-ded7b8091884@oss.qualcomm.com>
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
In-Reply-To: <bdf7e3e4-f1d1-4f3f-aebe-ded7b8091884@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: -H-fw97niq84OUEhdxFUvhVpo8k5BeA5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDA0MyBTYWx0ZWRfXzintr5KPtvhU
 fcxB9KhRVOJpkyS9zcjXjGH9AjeE8QgtCkZXUKx9TVR1xT4Vo0NfjlM9f3V23yZRrlIOfcE2/Mi
 Jou8Cu/PMsFkfGUa/B5Fia/7f0A2fbN+k75WzS1xh79IH98gfgByhShdI9RB39ZzkB3DMhHDivf
 m2B/zo3AA1wzwpLWtdUcx1QY0CJEOKC4mgUIgy8kT4tyqMpv0goW4dUcEjLTyP6FUtbvP9kKRed
 hBsdFwWNDdtgq2uMYjN4yXNzZo8G2rnG7eP8medptUguKy1BV4iCJ3PDB9nobkwg7MmMI+RVpNM
 YBi8BItgqs8rnL8HyJIpzFfc2vbrprY3aV9TI1Iu4mrW8tiqpqhw9Ea0FYrYXgXrro2I5eYeyer
 o9PAYDl54FbDlIvocicHEOqQ9pM+jCErwzP4mGUA8k86uGPRaEkKnYc8gWluaImEBLfJew17
X-Authority-Analysis: v=2.4 cv=caHSrmDM c=1 sm=1 tr=0 ts=685b8f6f cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=WdiEhHOlSmYA5aSgIJUA:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: -H-fw97niq84OUEhdxFUvhVpo8k5BeA5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_01,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxlogscore=999 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 adultscore=0 mlxscore=0 spamscore=0
 malwarescore=0 phishscore=0 clxscore=1015 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506250043


On 6/24/2025 8:08 PM, Konrad Dybcio wrote:
> On 6/24/25 11:00 AM, Kathiravan Thirumoorthy wrote:
>> QUPv3 in IPQ5424 consists of six Serial Engines (SEs). Describe the
>> first SE, which supports a 4-wire UART configuration suitable for
>> applications such as HS-UART.
>>
>> Note that the required initialization for this SE is not handled by the
>> bootloader. Therefore, add the SE node in the device tree but keep it
>> disabled. Enable it once Linux gains support for configuring the SE,
>> allowing to use in relevant RDPs.
> Do you mean fw loading support?

SE0 is minicore, so we don't need to load the FW. But apart from FW , 
protocol specific configurations to be done in the SE's Image 
Configuration registers, which is taken care in the patch[1]

[1] [PATCH v5 0/5] Add support to load QUP SE firmware from 
<https://lore.kernel.org/linux-arm-msm/20250624095102.1587580-1-viken.dadhaniya@oss.qualcomm.com/T/#m37a6b739c66040cde5b6b0121a03da7ea6715842>

>
>> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
>> ---
>> Changes in v2:
>> - Correct the interrupt number
>> - Link to v1: https://lore.kernel.org/r/20250624-ipq5424_hsuart-v1-1-a4e71d00fc05@oss.qualcomm.com
>> ---
>>   arch/arm64/boot/dts/qcom/ipq5424.dtsi | 9 +++++++++
>>   1 file changed, 9 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/ipq5424.dtsi b/arch/arm64/boot/dts/qcom/ipq5424.dtsi
>> index 66bd2261eb25d79051adddef604c55f5b01e6e8b..2b8499422a8a9a2f63e1af9ae8c189bafe690514 100644
>> --- a/arch/arm64/boot/dts/qcom/ipq5424.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/ipq5424.dtsi
>> @@ -417,6 +417,15 @@ qupv3: geniqup@1ac0000 {
>>   			#address-cells = <2>;
>>   			#size-cells = <2>;
>>   
>> +			uart0: serial@1a80000 {
>> +				compatible = "qcom,geni-uart";
>> +				reg = <0 0x01a80000 0 0x4000>;
>> +				clocks = <&gcc GCC_QUPV3_UART0_CLK>;
>> +				clock-names = "se";
>> +				interrupts = <GIC_SPI 339 IRQ_TYPE_LEVEL_HIGH>;
>> +				status = "disabled";
>> +			};
> I'd normally expect to see a pin configuration here as well,
> especially since you mention the bootloader doesn't configure
> the interface

Ack.

>
> Konrad
