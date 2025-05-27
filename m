Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 315E4257440
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 11:25:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748345120; cv=none; b=BGbTqA4nePgzXCGuP3vxNDJVPVYp9BS87pP1vfPPYKGeOAU375csMXSx6qXf37J0OIM0PH4O4FRd+qyOg+zqjnWS96cKLeerBytfbhB46fowvGp9VXIWLQlO7O1FaZXaCUFvSBmKKK2cN/oR0Du5gVwdFVVZx2LvmTBi/IZJgM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748345120; c=relaxed/simple;
	bh=IjYCkaz0vdLZNHpHQfeQHn8VelyKTW2bL453QEqv/S4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CoTxV3VgWQ1ZzoO1P+pT3GuhkEHiLuyW3REVHu6Kwm1sObz5nCGvybFx/7JG/TX8r3CzfG5bjwpu4M5b/DHQPk7kXPwrr9fgOtQOzPeTokO6p7b8GCqN38JLDd5R0tsWNaGj0Vz/uyYI5LB2gN8TKR1WCj09atNLuCQQvuv/C/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EtKlxpad; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EtKlxpad"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54R9q4fY024094
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 11:25:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+EtwIED2VJ1CyFpdm5+4R02rvjaaRQ1G+TwJkZUU998=; b=EtKlxpadYqWlNZGo
	bVbKqu+LpRGPMJLr9sVh7i1zk+bwgcBtlzXXfkT7fXAyGsX54XX+ZHj1YgQEQ+vu
	SmiZkJrzAnn98IZradGQYtOx4FTzYvezqyrwgkFH8G0RWwjPl6Q3b0h9YmmMn1YT
	5OSWkBbAQk6eMgKFaPzO3FxHXlpGWoKLZR4xn+Hq6ng/bF0jMONZJP7C7YDB0Ils
	12ErRd6R36hYlUZWOhWzVF8YhrsfShqAAfCpWTKcFoKfVaNtu2djsVJsJ1JOdo+h
	1MesTbGzvp1RcIaCwSHZmgof8CE7ZV2QbovBOriNVcQ06H+tdr2ALvNnbovtVuMb
	uUm8uQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u5ejxkx5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 11:25:17 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-48f812db91aso11106731cf.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 04:25:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748345117; x=1748949917;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+EtwIED2VJ1CyFpdm5+4R02rvjaaRQ1G+TwJkZUU998=;
        b=wxMGAsLa/wWkCHM0g/F+xfAsA0j69S4CT42rCtquvJIBeD+icGQ1kJLxfJPhgAdpac
         rFtyhCP2urO8nI45WJG6QTqt94SdM0n5AsQWlGYckjP0eRlAN2IuS5MoPoRHUkbDQXDt
         xn5ZOVjkWNEkpB3mvzU9DxmEQOhUXm9CDbFvDt6Lyb3IWZ1Chi+o245axwdorzlY17rM
         yjGWIOzO0/ZdKGojlgvhMd8IDSezZtY25LD5cltBXvNNGIC0dfFZA/txDsaABJwq+Xlh
         ZpMpqAL4bQmAR9VUsyNvSWUX8V8sSlJowWhavMAjRjhsmv5q1D3a+edPfegWKvu+PpdN
         u3qw==
X-Forwarded-Encrypted: i=1; AJvYcCUrUAf/sfTKGbpIS4/QGf/NHF91lCcA9xA6zgYb1aJzmZRVicewqyZr54fACM4NJ2SwPAd0B4MiHOBrzsQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9sXVCOQ7/gqiuhiRPEhm5uKdY1uyBtPPktZPdKA7dMpG6XJbA
	h1JvC1C5M7xGrCAWqB7NQ0B14Deugi1sOktEZDAgD/swwHKDCl9XEVCQLF6NevSodG7pKFc+txY
	ByrV9GcT4iWCWjIal9t1h/cdQk7DmNWhCN25F02N2ElWdCmW+0nCtee4JVzTZVFFxqPoGeWBAar
	s=
X-Gm-Gg: ASbGncsPOsguIZSr9zhQB8QNp3vsgu7mmBXumZ8m8w1TSl3S4ZrsuhhvkeOMkXGP4qW
	6rfVn3/K7xmEiEPHzXC8Pu202XtUfOicTNWyAQHu70IvO91zolJsgEeq97iT/VpwUY9QQUNiQ72
	uFY0TFDdpxH3rF9qqnYbqSY+9RH+Sp2q4DJX+Y/VgTdE8NtB0Qu5XVNZe1Zq8BiDF1w82vGvDut
	8NnSAwP/RIeIZ/835FXPSHL13vuPJ3n1NrhLh+fzB+cttDMLLs5rz/GTh5Mxq3TGG8ZSaux+cR8
	Zp8Mf0DJtUuDckruE9CZsNulcdJ/ZjrUg3ZKzwpNj/SoKTHeBz0DwCRuE6+F2dO3Dw==
X-Received: by 2002:ac8:7f4c:0:b0:494:b722:141a with SMTP id d75a77b69052e-49f47cf0bd0mr71401431cf.13.1748345116960;
        Tue, 27 May 2025 04:25:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF2ruzyLpYqP3ZgSZCU5zmljRjhSOppccrtHdLEaHwolv/pBEbpZ1ykF4CBKUG18Jhw4r79wA==
X-Received: by 2002:ac8:7f4c:0:b0:494:b722:141a with SMTP id d75a77b69052e-49f47cf0bd0mr71401291cf.13.1748345116568;
        Tue, 27 May 2025 04:25:16 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60461463b01sm3971225a12.27.2025.05.27.04.25.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 May 2025 04:25:16 -0700 (PDT)
Message-ID: <673898ed-bc6b-46cc-bc60-aece7c6bde59@oss.qualcomm.com>
Date: Tue, 27 May 2025 13:25:13 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] arm64: dts: qcom: Add support for X1E80100 Dell
 Latitude 7455
To: Val Packett <val@packett.cool>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250525095341.12462-2-val@packett.cool>
 <20250525095341.12462-4-val@packett.cool>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250525095341.12462-4-val@packett.cool>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=GIgIEvNK c=1 sm=1 tr=0 ts=6835a11e cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=vswN9AVew7ZQbwbRgEAA:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: llIbKCLye6FHzOo8Oo1b3NsDDO-OYQpW
X-Proofpoint-GUID: llIbKCLye6FHzOo8Oo1b3NsDDO-OYQpW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI3MDA5NCBTYWx0ZWRfX4mrkQOwzqLkw
 K7Emj3OlzuOjhxiiN3AgqiJ1zz5w27gN4b4gL56/l+3XC75+DSxYvgKy7vUz5jtu+D2SlaNsJOe
 NE5qldijN2pMy6A+PK0bke9DklrDjn2qUgu3SG1GCJ3c+PXTwn/OKOpPHZ9WjfmW3AeGBsCqpJE
 gXDUtkvl0Qf4HYkf+fPK7QzmVP8EeL5cYdLrXUtxBte97OD7vvXUonxakigV4ZsBBkufMkXey+D
 G7ybbWEcrrcPv7sByyESgb5t2S+3aLESqV6VeyhrdpEM1FNQB7MsedErnmkN83EK3UsZ8NnsfsM
 uennJRzg8zNypeKVdoyNu+Sn3AtVjPyBuml0BcVA6xzkukT8cYDWoIoVHlI//S/1d5zehGCz6Co
 f9K//XPyRDMoOcdJYTIGezigJi7Fm5s47lcSBeTiHyi60/WvXhbul4ewGNWntSXDAmcI71Oj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-27_05,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 adultscore=0 priorityscore=1501 mlxscore=0 phishscore=0 spamscore=0
 suspectscore=0 mlxlogscore=979 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505270094

On 5/25/25 11:53 AM, Val Packett wrote:
> Add a device tree for the Dell Latitude 7455 (X Elite) laptop.
> 
> Working:
> - Wi-Fi (WCN7850 hw2.0)
> - Bluetooth
> - USB Type-C x2 (with DP alt mode)
> - USB Type-A
> - USB Fingerprint reader
> - eDP Display (with brightness)
> - NVMe
> - SDHC (microSD slot)
> - Keyboard
> - Touchpad
> - Touchscreen
> - Battery
> 
> Not included:
> - Audio
> - Camera
> 
> Signed-off-by: Val Packett <val@packett.cool>
> ---

[...]

> +&i2c3 {
> +	clock-frequency = <400000>;
> +
> +	status = "okay";
> +
> +	typec-mux@8 {
> +		compatible = "parade,ps8830";

I'd assume these are ps8833 instead, IIRC there's a pair of ID registers

[...]

> +&sdhc_2 {
> +	cd-gpios = <&tlmm 71 GPIO_ACTIVE_LOW>;
> +	pinctrl-0 = <&sdc2_default &sdc2_card_det_n>;
> +	pinctrl-1 = <&sdc2_sleep &sdc2_card_det_n>;
> +	pinctrl-names = "default", "sleep";
> +	vmmc-supply = <&vreg_l9b_2p9>;
> +	vqmmc-supply = <&vreg_l6b_1p8>;
> +	bus-width = <4>;
> +	no-sdio;
> +	no-mmc;
> +	status = "okay";

A consistent \n before 'status' would be appreciated

Konrad
