Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F22C2D23AD
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 14:38:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750775911; cv=none; b=CO9YsjFM3M0J4Y/AtkwKF/miWxl1HCqQCCaZ+FmDsDWRYxwdmNyfCj6wiAlqe4ytfntH03E7ME1Y54nXi01Ii0bxGWh5UJd3VCMV298rsjkr/IZkePisPbdUqTWcgGdxOv26PIxVd8zlrIY5V3bwdIdbcbej8Oa7FDAnrkCuMcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750775911; c=relaxed/simple;
	bh=jqMDmMENWLRbCBOnq0ZVNeFnU2Eo6RNLnlJ3ig3iJEc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=p2lsoTNj1Hvk9psD+rIzsNkV0TpJqqCeQAviGka0JjWL/7w+cM+LGPPgkNyaRezvg6x4PNgS2H3eHvwEF8qzIDYCqnxJvKGmK2LcHKZExhLL1lga/+Q08yckI42SYiP7mljt66OAzaz9DAB1tWRRu6mHKNhQDbkEP65qmmpjtaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OTHBkXZJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OTHBkXZJ"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55OB4cgu007104
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 14:38:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	46eqylrIoJ6C03WJIbQg3Uxk+6crYEmZoHpQ1nqIRD8=; b=OTHBkXZJ+Zsoy5dU
	w6HIIZexKvV8k20JtNrqdeLFP0//ANTEWY38Op083p785fra1GUekhhhgJzJyumd
	7Wy10ENjG2AgZNgnmTXvH3EkENUvZIcAzj5IBEceBjU+1tYViRhmKRJQlX6nFv/g
	7UiXHtcOXtq8iYZQujJfmCC9ew0QByPUAz7puVsDjdxiekcZ7aixDNtgXUaEINyi
	tmicmuKnjSFog+OkpQi4L2lyv+TlFzc9FfIaJy7XESoLFOCxTf8ZfUDzy5GuEBcV
	JN+XOWU1ZqGgRpRIRQ0Bkx8A6Ip10+h9JmjmOno4kvmxg3wXs7ailjJn7tbzdpP7
	qI1soA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47fdfwtp30-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 14:38:28 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7d09b74dc4bso141238285a.2
        for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 07:38:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750775908; x=1751380708;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=46eqylrIoJ6C03WJIbQg3Uxk+6crYEmZoHpQ1nqIRD8=;
        b=TUJDs+EqTvMbbLbc3CZvzBsbivEdsc23BdSnL4F60OWwU0Xt7zgsJuTG0FBFovF/kn
         IRQS1lmmfm6atEJl18pkuBD7jtf0RI4X1a/RKnSMCS0aC+YHuLEi60vF9OYloxuPRMpD
         DIA4SuUNHeTi1hoBV5elM+St+yre405wqXv+VoOu6BQnmjhjTOoEIBRM/icx39fvsXfZ
         PaxETYo3kMnEWPC5j+Nro0ycG02LqEge1PdpkDHmCH2EY6usSv6Q6JKElwPyPZuSP2yV
         DqgXg0rjep15bepQwLxVgojf/MsP0NL8mFSikq4CgCsNnhT1+rPDgTkbtIXiyCnVyqtM
         nD/A==
X-Forwarded-Encrypted: i=1; AJvYcCVxLGv4MtTu+9r1wjc32/+Uyf2mkovHeIcVCkbIjuZZ+v/9cAkVVe+IsmIuHZJsgLiRCTWAo9xGWgb2JDk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1N5FCTJ+uJIIHV9oCQKWFnufA71xhKjneXlmtyq+RbfHlj4bI
	8axa7qQeBJ2l6RpBZPFkRw6PiAOqi70Tod+EwTEwZVy2kpj08eknbcfIXDkfBfLbf09bE5+z6Dx
	UUzPSWsngbAi8fAb/1ARW7L3vojfdfSebPAWuhQKTPcYYysUnZT+IJAD44WA66FdWASo=
X-Gm-Gg: ASbGnctpn9mNMDdTxYtr8bdo+lriNQ8r78TmCuczcvgK5finO1ozEr8VwoEJVdjCaqE
	pWoDskeZCdHvqp2EIWOaeOd2FKSZr0reoJVWyEtLUIu2/8RAoi4vA82KnMI8kQtv2LX/SEF4MH5
	2m3IkXU8b4BRNoLQHxOYOiMTNI9Ka1kilZg2Tv9qW4anO1pJB5azyBgQ27oHvLoIGO0424vTHIF
	v0txMqrwXjvNIHUfRwLWMun3T2zAD2xT2N70SyBDTby0OSBlBjCUtjumY4jYjfbl8yFhWWs3x2n
	fsTNjiS7zewDqJjq6PdA8tmvTmKHlagA8wAXviwVH1AuMlZ1wJ2iRDQRP1nJxUvxwwQ+UoZ8f/u
	IdRw=
X-Received: by 2002:a05:620a:2b84:b0:7c3:c814:591d with SMTP id af79cd13be357-7d3f98b4fc9mr932117785a.1.1750775907591;
        Tue, 24 Jun 2025 07:38:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGRqvGsol/GE2aqt4yUEI9G6WdeEe6JbvbFKo6KtdQLEdH2V4CXkBo/5R5g0TJ8S64kcKTjBQ==
X-Received: by 2002:a05:620a:2b84:b0:7c3:c814:591d with SMTP id af79cd13be357-7d3f98b4fc9mr932114785a.1.1750775906918;
        Tue, 24 Jun 2025 07:38:26 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae0ba7a3fcasm15026566b.117.2025.06.24.07.38.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Jun 2025 07:38:26 -0700 (PDT)
Message-ID: <bdf7e3e4-f1d1-4f3f-aebe-ded7b8091884@oss.qualcomm.com>
Date: Tue, 24 Jun 2025 16:38:24 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: ipq5424: Describe the 4-wire UART SE
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250624-ipq5424_hsuart-v2-1-6566dabfe4a6@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250624-ipq5424_hsuart-v2-1-6566dabfe4a6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: -ME2ZCm0VJeDe21A0kKiDIOK45GQblXN
X-Proofpoint-ORIG-GUID: -ME2ZCm0VJeDe21A0kKiDIOK45GQblXN
X-Authority-Analysis: v=2.4 cv=MtZS63ae c=1 sm=1 tr=0 ts=685ab864 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=9lBeFAbR0IUyOWdzi5MA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI0MDEyMiBTYWx0ZWRfX7DrUd0d41f1f
 rHq96LKmx7kph6bfR9cm4C5sR+D5o725i7tO1yaX8noza9EIzMXfH4lWlmWmCk+1pt7yKCO4A7g
 7KCcZ6VPIpH/UCdL8GYhxMxddxQJk9JRw8zOUYt0uInvRKI/rwoKEw60bJ2S7KSwiGAdhvodtGd
 DmHh5mQA9iop6DJNRDbR0t/E1p2lyCIhlM6S1gOSmGSNUBvldgQkRdRKRW/LSc/XHAJjaPI8sH4
 qew2fEyI9m0ehsNkjcgA0HSTrTebHxo3pIqURpysN9GPWWbWstppnbKcJ1n4yNWucE1Qok6KIxo
 BDylQZ3hnU10hfFZ70ov1ulPL4Mvh6caEOkx3Z0JwO+MPARtRjFnQC7XlcZJblLxoQVCbMHzPol
 9h50KFQB8ckEXEgXpUhr3jUUxICU0wyxEOolrLJTgf/YwMOKzBFIXxofd2/ooPnsca4XdPr9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-24_06,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 suspectscore=0 adultscore=0 phishscore=0
 mlxlogscore=999 spamscore=0 malwarescore=0 priorityscore=1501
 lowpriorityscore=0 clxscore=1015 mlxscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506240122

On 6/24/25 11:00 AM, Kathiravan Thirumoorthy wrote:
> QUPv3 in IPQ5424 consists of six Serial Engines (SEs). Describe the
> first SE, which supports a 4-wire UART configuration suitable for
> applications such as HS-UART.
> 
> Note that the required initialization for this SE is not handled by the
> bootloader. Therefore, add the SE node in the device tree but keep it
> disabled. Enable it once Linux gains support for configuring the SE,
> allowing to use in relevant RDPs.

Do you mean fw loading support?

> 
> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
> ---
> Changes in v2:
> - Correct the interrupt number
> - Link to v1: https://lore.kernel.org/r/20250624-ipq5424_hsuart-v1-1-a4e71d00fc05@oss.qualcomm.com
> ---
>  arch/arm64/boot/dts/qcom/ipq5424.dtsi | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/ipq5424.dtsi b/arch/arm64/boot/dts/qcom/ipq5424.dtsi
> index 66bd2261eb25d79051adddef604c55f5b01e6e8b..2b8499422a8a9a2f63e1af9ae8c189bafe690514 100644
> --- a/arch/arm64/boot/dts/qcom/ipq5424.dtsi
> +++ b/arch/arm64/boot/dts/qcom/ipq5424.dtsi
> @@ -417,6 +417,15 @@ qupv3: geniqup@1ac0000 {
>  			#address-cells = <2>;
>  			#size-cells = <2>;
>  
> +			uart0: serial@1a80000 {
> +				compatible = "qcom,geni-uart";
> +				reg = <0 0x01a80000 0 0x4000>;
> +				clocks = <&gcc GCC_QUPV3_UART0_CLK>;
> +				clock-names = "se";
> +				interrupts = <GIC_SPI 339 IRQ_TYPE_LEVEL_HIGH>;
> +				status = "disabled";
> +			};

I'd normally expect to see a pin configuration here as well,
especially since you mention the bootloader doesn't configure
the interface

Konrad
