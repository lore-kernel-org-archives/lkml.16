Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E63641E8356
	for <linux-kernel@vger.kernel.org>; Sat, 21 Jun 2025 10:17:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750501025; cv=none; b=PVqGX/dgIWXk3BcbIO3VAAsyahwEmI3LTUY6yO8nQUkjuxnCPzzMDa7ZAQsivTo8OXN+wn2UsZ0RphPJOP/fn+XP9FZCzlB7WR9989MlrPpo0IbM7wM97eM1vSv8GJolbS2wDU6B5ON82eQTzf3Y72FXzmEOgLloWHBmQn2T9C4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750501025; c=relaxed/simple;
	bh=vPnLzFJwFahHeUricYEurdfVj2ke+giIWHeToRhHl8w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YURrGTlObuRvwP25J0R96JrEzsZYtlgL3eOjFfJyj2s5AcPI07m2JXEznfaU3LMz6F2BFwVAFyp+79YNiF5j1v1pt2AXtMlddqHv4TW+0ZMrVGnQb+l1b4mj3BI+Nz1sh/nN1Du0ac0kdtM5uVOo/X4b8XiGn+B4AIN6v07AX0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S1XOAxxl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="S1XOAxxl"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55L7p417023324
	for <linux-kernel@vger.kernel.org>; Sat, 21 Jun 2025 10:17:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mFCLLwicRIT/ld44aT8z3FJPYEU6pXL2JMcxeaCeN90=; b=S1XOAxxlrWQmLOBg
	W2q+JtbyfgaShZZzyxuoiy0TirvqNYUrMCSOTmTFq9Fd6+pghIYwyh641rzedcV4
	3J2J3JvEXiaNBORk0x5KhSFxPt0SK+0vHFf4/Nkk/5er1teynZTiyIPfegPLU9e4
	Ks2QuSRZpuKLoDjKO6mQ5O3zRo+CvIjByiInsh3aeJ1576qGzc0z+Gu34rSTuhao
	fjsOyb37udhbvmVEEt3YA9L9GWV95FmChH4wA6XWZcgTPz7ipI5Ni992g1afeebv
	L/ZxI2bxM9Kdc+4ZI9rNWwOparLexDLFM45AFTM43wCC/AQkeyiEw1RXc1a/kVAJ
	YKEoog==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47drq8g5f6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 21 Jun 2025 10:17:02 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6f539358795so3276006d6.3
        for <linux-kernel@vger.kernel.org>; Sat, 21 Jun 2025 03:17:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750501022; x=1751105822;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mFCLLwicRIT/ld44aT8z3FJPYEU6pXL2JMcxeaCeN90=;
        b=BECzw97VtdrceW9UebZBPxmZ6YgOjQttOeskK/oCFSpA2FbxFSI0qvEBctHK1AweFm
         Equu5mLZ21fYZ5UHd68lXvOduC4nvsVc2pM4yv43SNEgCnzWXnunZayD/qRwtGf49WzT
         /aXv6qbeQakpHhdV7y7B6B0GKh2mFeON0WNZe/VZWSp9YJY5V5EofIeOPTbAALKcyT3T
         K+6FsBcEeBHoNwlheqLBSvwyuhQhi3iY57SJrglcto9sAyVlwCxOQvd8YIC21hp5yzBv
         cnN4frRsl5kPXCAlq/ztUK5Dx2bgx82zkmDVEeuJDcYN/B5pkxIJ6H0j3JwZJ9WuNy2Y
         tgQQ==
X-Forwarded-Encrypted: i=1; AJvYcCVaJPMedWIrJ1FFFZYQ69Z/vEUp7bHH7dpJci8FAyhbzstHAzaKotjCI0uucMYVKOA2oTDpPe2T9vVz0UE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwCSY8zJv51Y5GgRqvwGQ3ZTULRuO/PpEmmvfBlm24C5/SBEXk7
	vhICqwnn5u1xwuw6s9w6m0qvUFQaTOwPdZbkzzOniPMgOhhKKUoMMBaTteEJK6RMmHsJs5ONVPx
	mB7ae9qUPXrjWr/tJXkSi8P5GoCCud1o3N9hPThYxTAZdVMufyQDeP8YvXPypwDypauw=
X-Gm-Gg: ASbGncsPnUTiLEapJ/bnxmNcd6ZaKVJLpKTvjf+vZTGsT14VpgCAyUtuJq+93qZjRFf
	NShNrzM6ySaQa14uxrgFLRWJTUbp5a/ogZuAoFe8lS5vcVFvMPLKqey4BiP3crGf/aIpX88lddL
	cStoVePnPcjv98uUUfsg7Rns1wFVejDR7J2ixkmOgqb6RSbn74eclDavtR97ADbGrfVZzl2sHaV
	hh+V8/t+ueeiOBhU4QoPh1VHVPQbKa26u6h2QNNbiL1h/kpuvGUTIGJQqyh1ja63mbUEWldImG0
	cROIXFQ3nHBuuklLQhwCNo/I6j+EZd6EjMngzI3LtkS+6Pmf8DOTVXdI+WhWjh7oaHVQxbr4oIL
	OOFA=
X-Received: by 2002:a05:6214:2345:b0:6fa:c46c:6fa9 with SMTP id 6a1803df08f44-6fd0a47e0f3mr36467846d6.4.1750501021966;
        Sat, 21 Jun 2025 03:17:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGeGPqQjG6xCSUjFvNLWJwXCnIR+1W/DIRu1mmTytQ+klkZrMyqX8o5SSfXwinRdq+7CTGxPg==
X-Received: by 2002:a05:6214:2345:b0:6fa:c46c:6fa9 with SMTP id 6a1803df08f44-6fd0a47e0f3mr36467716d6.4.1750501021575;
        Sat, 21 Jun 2025 03:17:01 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae053e8082fsm337209266b.8.2025.06.21.03.16.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 21 Jun 2025 03:17:01 -0700 (PDT)
Message-ID: <557166bd-cbe2-4a7b-bd6c-8daec1cecc3d@oss.qualcomm.com>
Date: Sat, 21 Jun 2025 12:16:58 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: msm8953: Add device tree for
 Billion Capture+
To: cristian_ci@protonmail.com, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org
References: <20250620-rimob-initial-devicetree-v1-0-8e667ea21f82@protonmail.com>
 <20250620-rimob-initial-devicetree-v1-3-8e667ea21f82@protonmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250620-rimob-initial-devicetree-v1-3-8e667ea21f82@protonmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: IyleKs74ZD1ChO5ZUNht4NCV8k2vAde_
X-Proofpoint-GUID: IyleKs74ZD1ChO5ZUNht4NCV8k2vAde_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIxMDA2MCBTYWx0ZWRfX83enPAV3IKXP
 hZvI1Kvq8AjfryQgc3QifCbXSBPa7V6Wt3UQqoDMcktvV2YVt5oXGR/Hkcc6hImLR33+9PuqQjd
 y4fG0Zn5V7WNQ8hepjec0SybMbwzBEBlXA7tZOvfWgPT6IU4KxAXyNG6H2b06cjxRk9BfLyAh+y
 vb8HTtfD52WpegyYo+dDUwfpknidtLjjTFE/cuicMkBkmvJg7G5vt/YI4JZ5HbsmXyNzwHcvknP
 0FUhhJc4qNx1ooOe4XxixVB2paG+FcPnDMnZZlxTTw4IjcQbJIvpSVfMLIiBDkBpcepwTN6zWX6
 JxtAxYyek4JpNiCMTgI8Q/MKQP1YsDy2V25+1V0fk12C1TyY4PaKe9hgLGArLMC4qP4nXkgW+O5
 IrSo+BJI8iaG2nhYZOAQUienw5ozYBKhtWU6Wdn1qwyh4jvvIgKRQKiSv6gwwYEZWTEVLBZX
X-Authority-Analysis: v=2.4 cv=Kr5N2XWN c=1 sm=1 tr=0 ts=6856869e cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=sfOm8-O8AAAA:8 a=oi8dwGYPpvFf8akzgh4A:9
 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22 a=TvTJqdcANYtsRzA46cdi:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-21_02,2025-06-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 mlxlogscore=629 clxscore=1015 malwarescore=0
 impostorscore=0 lowpriorityscore=0 mlxscore=0 priorityscore=1501 adultscore=0
 spamscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506210060

On 6/20/25 11:51 PM, Cristian Cozzolino via B4 Relay wrote:
> From: Cristian Cozzolino <cristian_ci@protonmail.com>
> 
> Billion Capture+ (flipkart,rimob) is a smartphone released in 2017, based
> on Snapdragon 625 (MSM8953) SoC.
> 
> Add a device tree with initial support for:
> 
> - GPIO keys
> - SDHCI (internal and external storage)
> - USB Device Mode
> - Regulators
> - Simple framebuffer
> 
> Signed-off-by: Cristian Cozzolino <cristian_ci@protonmail.com>
> ---

[...]

> +
> +	gpio-keys {
> +		compatible = "gpio-keys";
> +
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&gpio_key_default>;

property-n
property-names

please

[...]

> +	reserved-memory {
> +		qseecom@0 {
> +			reg = <0x00 0x84a00000 0x00 0x1900000>;

'0x0'

[...]

> +
> +&sdhc_1 {
> +	vmmc-supply = <&pm8953_l8>;
> +	vqmmc-supply = <&pm8953_l5>;

you should add regulator-allow-set-load to these vregs

[...]

> +&tlmm {
> +	gpio-reserved-ranges = <0 4>,

These GPIOs correspond to I2C/SPI_1

<135 4>;

And these correspond to I2C/SPI_7

Without much more knowledge, I would guesstimate one of them is
for a fingerprint reader and the other for NFC eSE

Konrad
