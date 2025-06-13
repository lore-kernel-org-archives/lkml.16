Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A61D221297
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 19:35:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749843326; cv=none; b=NnASOWHRE1gYQel10mL0A1TEWSA3G1z/4bJJxjWGh0Lggh7zQKIx6c6E9nWAt9A1jvFoAiWdUgc7uwdhpiLmV5ezPLf++THrqusHdqgyCDA45GPA7QSouerFsMZYsdVrJCpipGDaDuGf1EoQ2iKUgdrl0zEwMtd5ON6CXCRrPPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749843326; c=relaxed/simple;
	bh=CxVcCuNKA9XI5R3ASHx9CRmZxlLWdMHDULPSfVRTboI=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=SGZEZlmLmbHW4rYzpPNS9hBX0ShfTzmnjc5ruOiEY0Fq1dVqACr+W9v5AT+Tw5YhZwocVd6mHtSpVvQdD6wbesqtwxtYUD8bRetJ5nOF+ra0HsgMKQTIKK8H7L9pX7xQH32mR/SB6XowjQ3oBNXVvJHM9cjwsH423nLC3AGEXxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UgjwVlGq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UgjwVlGq"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55DEF28T031502
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 19:35:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9sJ9x5HtZOfvSPdgXzzpXNU9n5skLvyOXtJDjWiUkks=; b=UgjwVlGqio9OA9gr
	LUSld1gsJ0VUXSnP7HMrWlvIE7mGDIyaL8djBy1/su/ioLwYrghWKHYlKu2COukL
	O/mFaciNY0UjNTqADQEPxFbNMXIRwTerML5OrDRHW6Ld+zmqhLkbnh/DMJFH+iKX
	0LvB9rb3bSuZGBgOJS7+MXjPTX+ZJw5+c8qX0iJ/vvrQvBi8YQmMxxDXhjoR9mVh
	ZnU12o4mSOF3Bv2HAlsj7KLq2/CwTMGYNMT2AhK6L3RODuIOSNuvkzqvnj4bAyNU
	8Qx6cJTgcpdmRQkEEwgv8eABAUPl8oK1IjPK4WMdSoceI/yQQThOSIcNdNjI67rA
	qrTsYg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474eqcvcub-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 19:35:24 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6facbe71504so6407696d6.2
        for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 12:35:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749843322; x=1750448122;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9sJ9x5HtZOfvSPdgXzzpXNU9n5skLvyOXtJDjWiUkks=;
        b=iu6a4ff1LSRTAvJQKJ1JHBZ4ra9r956EeehUCOg0XxTYwR30tJB5K2VWKSAf5uughN
         LsWiwqTqZXDxYllOmV0Zmyy3HH1Z0RFHxp9JsrmIkSEmmNd5F1PY+nFVoR43SilwGfsu
         0fg0t8uj9qVb92Pbin1UDvFT1ExnML+rSOC8drR6mSkKZUFgHH/NZVGrZ8GFNCZvpkrv
         MlN+W4LKZqdk6udFnPT6NLMu5//x2lzsh5cxIFiFo6hG0bkbBjy8T/wFL7oYbcVZsJSs
         FGtcgwmI33fd27XVT9fWlEfbsLJaLMfFaZ3RtH82OJZM9YojXuybAi1r8oVR/EFYpsQw
         GlGA==
X-Forwarded-Encrypted: i=1; AJvYcCUh1Bf1cpVBTZZBfmJK/wJqggOv9xcBGoayEaKl2iwTcaDrneUmhWduHqag0yGGbZamF3k2iuK1oOHb/hk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzdVYYnlFfrGh9NuCnzWVyUblpXb5hkNuNXJlCO3WgPI4Cb5i7M
	h62JrRgiO/biE3aK885T94MNN2yez+AFp2SGDczC7y/njpI2+2RFR+xouoBpri7BXkhMwpDv7W1
	A5gfOYnbytdaVQvttxOLIa5hYbGGXetQG4+OE/V/3oO3F6lUIQGL9O2TsbYKwfh+nKsc=
X-Gm-Gg: ASbGnctdTxWAfJC9OOm+7gWz7C6/wXfj2Wy0x9VPJX0XW5JjH/rb9OKC/oVO6Wc8v2D
	dd2kJAKbeDJ8ry+meDiWVm024Zg4XZlsYXkpRRm1uvWZfU2dVBAMUiYKcU5YFReu4CUJpErePtd
	H9mwVcRm629G05gyschefOBtCRqopAG7pRyPx0OPHWeuYAOzw7ji+gaqP0Mf9EjgwmnBeWhNHBb
	lP3yVdNZKlwfwNnPsink74mNtfHUOkyQg6E9FQ+DOWN+zuhlWBTeGpKDy7+KLV0joleXUID4PMj
	+p4wI30930PMpFTiIuEp33gvS4r6ktRXIi6RAMy1kKJjWJquMuQ73MIrxFzcUjAeTnq681p2m/0
	9Yu4=
X-Received: by 2002:a05:6214:3986:b0:6f2:c10b:db11 with SMTP id 6a1803df08f44-6fb47793f60mr2998786d6.6.1749843322493;
        Fri, 13 Jun 2025 12:35:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEp+7e8UZQ86JloHzUxMiaR0mM1Dp9awUto6a7J9KV3sbTs0TzjrH3O/HbjpeZUBgtEA5FfSw==
X-Received: by 2002:a05:6214:3986:b0:6f2:c10b:db11 with SMTP id 6a1803df08f44-6fb47793f60mr2998516d6.6.1749843322057;
        Fri, 13 Jun 2025 12:35:22 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-adec897ac25sm174065766b.157.2025.06.13.12.35.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Jun 2025 12:35:21 -0700 (PDT)
Message-ID: <91dde259-d8ac-4585-8c22-d3d772c2c340@oss.qualcomm.com>
Date: Fri, 13 Jun 2025 21:35:20 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ARM: dts: qcom: pm8921: add vibrator device node
To: Shinjo Park <peremen@gmail.com>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        "open list:ARM/QUALCOMM MAILING LIST" <linux-arm-msm@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
References: <20250613193244.17550-1-peremen@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250613193244.17550-1-peremen@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEzMDEzNSBTYWx0ZWRfX1JixtVR1j6td
 1i+XOXC3k55Y3bgicqQFo5Sl2iqsJ6Amxc6M8m1bZBuIvGo/Agak7oUTKRbv6mkoVbw7gLjEISf
 UsES/9238w9LSRy9X97FOdmMozBL0OpDcNyMZcjNnkpVNcCpYzIBre/IjlTmPluUftK+ypGyPsL
 0MTmjW7rCeXe3Jdq9wNsqJYgcRc0hA7YLGXIVKsO4/tUJIAQ0MQhL9fVPFYrOPUInvAJ60sTTrb
 OL3RSAO3le+n9mNB6IMpyQ6knWQi3zOLVcFtEuFO5dihaNRpEpsYLdbwtamsDsyCw5V1aovCYk4
 kH0m9ZDTzWMWq8HNS/ZIQr5/T5GaXr9UAWcC2jB+hAGHXpF4Q6xRon0p8D7tI+AQ89uWKZxQtJ9
 ALa7HujZ1JNBdmAfJBpsjAM36UyWVSM5x456YnxCw28N7Sm4ZWEMVh7uTcVRyyKhj1JgB/5I
X-Authority-Analysis: v=2.4 cv=Q7TS452a c=1 sm=1 tr=0 ts=684c7d7c cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=EI79PUSdYkFRhqYvSFsA:9 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: Q-326sLhr0Hdn6jAch1T6TjWDQFEPEud
X-Proofpoint-ORIG-GUID: Q-326sLhr0Hdn6jAch1T6TjWDQFEPEud
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-13_02,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 mlxscore=0 spamscore=0 mlxlogscore=846
 bulkscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506130135

On 6/13/25 9:32 PM, Shinjo Park wrote:
> Use the same definition as pm8058.dtsi. Since vibrator is used only by
> some devices, disable it by default and let it be enabled explicitly.
> 
> Signed-off-by: Shinjo Park <peremen@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
