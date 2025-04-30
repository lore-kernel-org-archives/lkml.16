Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 287B62B9A9
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 11:11:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746011485; cv=none; b=cj225YrgedRMT4zK8s2DNVvtAzni5x6FEembifnXlam53ltRhoJSz7Qmh1rGdtxEqkeev/LUamNywt/LnitukZwlpY4MIsO+OZrssUFXJUL+oh1+vF5NAol/LQ1lLtrU6EBYTdPQqqRwUF0bsDAgmdeC+ZRX4AT1ey92to+b0yo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746011485; c=relaxed/simple;
	bh=Co3wQ6N1OGEyYO7cg7Pdin1FexCjKbqo0xDkE/Hr9XY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gqLhreI2noSFKDuJ6owI/Ic6+btO8+GULTIuK8VtuD5/L9ZAzP6Gi2wd0qv9dhNGBBAtnIwWVlUTyk5zWU/SUMrHYKEv5YQOboB/ZqB6zKXgMxRI1ClADLEwCXJahIRT5dNd0AHFu+8fD6QoEp0XvUP8RmVMGE488Cjw1n5ezyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FUkr3fEw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FUkr3fEw"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53U9p2Vw011715
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 11:11:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/7tDspfKtEjUZpJrHIm5EpiK1dQnHwyPWBBeLxDqhOg=; b=FUkr3fEwMKPSFRVA
	1v0RWzSmGD3epbk5Qs0nkmg66jbXeIXVOT9i4jOz6dUfi1Lx5SjYzrOubdU60sFA
	NQ5lAbUih8uyH/hzBBPOuGsF5QKOe4xPtv7Rpj1hcKtZt8lzcBANSJzFOMZUG3pJ
	z10OPaOFxjgLCICeCksyMfD860BQ0lbkO+VkmixeWm46UgdkwF8CD0VlYcNhtAuE
	NkyVzb6z189YEEZpzI/RoPFp5i6pvnhApP5vKZHRJe4ZVxr5voTVNS00LqWq6RWa
	u/ktzaR+KCfl5PO1oPxpv8fz259bHilqkKTE6uozC7i9YXTFk/7u4D23u+lMqysm
	gP+kSA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46b6ua9vdv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 11:11:23 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6eeeaf707b0so11169466d6.0
        for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 04:11:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746011482; x=1746616282;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/7tDspfKtEjUZpJrHIm5EpiK1dQnHwyPWBBeLxDqhOg=;
        b=Y4xfvwQnoATzUHbQFqOvrA8z8HPxwpZeoOn/XGeA9ixHm5/JayIpUPbgBogHbHI1KL
         rwkhaAdIeWKAVttJg6aD5dcVenfvQxrMRnqhsyOQQqGONpSMFzeWgjukzWyhzOtmX/1v
         rep390sL54qR6YjB5PJ66sb/erUzuF1Rkj/eMzvWpE2G86Eg/RAYIY/cj7KZD3PyKqAW
         BsrqGgRhV+Kcjm0sbhnrglHdX4pq/VVYV170kUbkzSM5vZTWa6SiVCLwYbxK1zfrAljJ
         7rywmIBcFjFdY3zJeu7IMbF78CCczux+IA2+Okk9cXNEdf88svaU6xWgwHVD5UfVGpLZ
         G5PA==
X-Forwarded-Encrypted: i=1; AJvYcCVmrqJLM+MWVRKE6BJl1+cJw50gXtvyLdB0zTNa9ZnA+DA7pbqcUFrpSM9j9PVIwX+eTQIENWvBPWoQHrI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzMIAGosUBX4y7+ofvpIuL9DmXvB3AeLWKKUe4i/Px6NpxKBYUO
	jvllWlaFKKhr/nGgE8QrgF1On9DcWNpkt6cfG7X+JXGTWLAiMDlRRARQXj7mC2hPXjJsELInVNb
	djhC7aFC4CMeC44ISK5B1EBKvMBnM0CUN6sdeNxoxBp2n9u4L/oH/JJkV7EPF6SA=
X-Gm-Gg: ASbGncv+FNWLqAN42ofpSThxdUkr5S7sKKjHYim5vANdbPVnXGPOqTb7FyC3muo4tey
	/nubVyR6PuA8XA4W6zR7hLuylv4iTF5WYPthyP9Z3qx+771YRSzcGIg/ZIjMukksFFGr6SeJo1J
	cOwy6Bq/+5HEboQScJ8b1sllIIbEZ6r8fk4pIZY/tGV8ikAOkos+0hJ+RzThKi8YG0hVIU3X60E
	Pbzq8M9j9MwU2JFwdReML+bLFTLNl7Zfh62SKoOC8sv7UUFdiX7V9HKzg+Mf7o9qsiL+izopAg6
	SdSIE6s/FlQlX2wrW+h+3IURGqZ45V5kSnviwc+qxuPB9tH6AT8HocEDc4TdvXx1f7A=
X-Received: by 2002:ad4:5f0e:0:b0:6d8:a091:4f52 with SMTP id 6a1803df08f44-6f4ff5f2443mr9116346d6.7.1746011481991;
        Wed, 30 Apr 2025 04:11:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFi1yeyX85KSZunTB8r5b0uUMfRxR7ky+CnBeOgP2y9Bt9IyJgsKRKk7JfZgLjRwgz3LDHZsw==
X-Received: by 2002:ad4:5f0e:0:b0:6d8:a091:4f52 with SMTP id 6a1803df08f44-6f4ff5f2443mr9116216d6.7.1746011481601;
        Wed, 30 Apr 2025 04:11:21 -0700 (PDT)
Received: from [192.168.65.132] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6e41c40bsm912620266b.20.2025.04.30.04.11.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Apr 2025 04:11:20 -0700 (PDT)
Message-ID: <1ee8587b-2bf6-418a-9834-8f8cbf1e94d8@oss.qualcomm.com>
Date: Wed, 30 Apr 2025 13:11:18 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sm8550: Add support for camss
To: Wenmeng Liu <quic_wenmliu@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Depeng Shao <quic_depengs@quicinc.com>
References: <20250415-sm8550_camss-v1-1-d4b7daa168ac@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250415-sm8550_camss-v1-1-d4b7daa168ac@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=BNizrEQG c=1 sm=1 tr=0 ts=6812055b cx=c_pps a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=BQawBwbjN2gzKBjTXzwA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDMwMDA3OSBTYWx0ZWRfX+UwpZPA+dahs UsMr9/csZB1qxR4+Wj0dTTA621q6Hm+a8WgtBz8IvN/yZIt8JP/vuYsDrhgkvd3GaQXGWEBGo0E 8gxsXC0D4m4IMVmOT751HkEHCTjY+bMTB4FmCSjL167PqQDi/9Pde8p3z1y8wMYBuxO4P4MUWif
 oTvwrulslqWxvXVqgfs3Dw13ZN3lDUPW9htIWOa+K96ULomSKLSXlxDN1SkpTtsAdAcIvzE4wYt YUEdIFDaBDkZooXn0ymMJTTuBD4ntJjfzAQXddYiGqB5BSZ3qodBUtKYV2vGSd/1G/awdt5gC8/ +Z04gtnorEYwU7kNbKtgcwGWdX9qg//Xi2NOZQRQsuqCtkkPHbovDRHLD3fVlxxPZBkRdqS7wnL
 HBiq6sc0jjxeyrz3ajwzxvJ0IGFQSFUlVVFbDe+hirc3GQBhTpMYBXbwLJIdkjvsPi1+J0Fb
X-Proofpoint-GUID: omFvyzmSHRJS2KN58Bc9vWEHyQ-PftGy
X-Proofpoint-ORIG-GUID: omFvyzmSHRJS2KN58Bc9vWEHyQ-PftGy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-30_03,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 bulkscore=0 clxscore=1015 spamscore=0 adultscore=0
 phishscore=0 mlxscore=0 suspectscore=0 lowpriorityscore=0 malwarescore=0
 mlxlogscore=840 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504300079

On 4/15/25 9:38 AM, Wenmeng Liu wrote:
> Add support for the camera subsystem on the SM8550 Qualcomm SoC. This
> includes bringing up the CSIPHY, CSID, VFE/RDI interfaces.
> 
> SM8550 provides
> - 3 x VFE, 3 RDI per VFE
> - 2 x VFE Lite, 4 RDI per VFE
> - 3 x CSID
> - 2 x CSID Lite
> - 8 x CSI PHY
> 
> Co-developed-by: Depeng Shao <quic_depengs@quicinc.com>
> Signed-off-by: Depeng Shao <quic_depengs@quicinc.com>
> Signed-off-by: Wenmeng Liu <quic_wenmliu@quicinc.com>
> ---

[...]

> +				     <GIC_SPI 604 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 688 IRQ_TYPE_EDGE_RISING>,

It *may* be 689 instead but I'm not 100% sure

Otherwise the numbers look good

Bryan, Vlad, please also take a look

Konrad
