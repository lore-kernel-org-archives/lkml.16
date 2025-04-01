Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B83A31E9B00
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 10:28:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743503282; cv=none; b=CVgGQpiiHg1rgeh3adwNrE+x72LetsezsoZzp7QWi08krTvlCq03dJcaKI7XmrCILPNt4XAbQJ7ajhGNnhldjCLHSF4RzyhgM9w5EYMNZszKSG3sOfiJQ4/UV3godGh79kJZ9ZjUldnFwsEh5tfMW749Fm427sduTIHMG0Day/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743503282; c=relaxed/simple;
	bh=4R/BiYnbWkPSLvkwiKClBJYbFIZNVzZXt6CKvmb9d/4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N8i7BkTfl67lNiUPEmhyBQ3nMIMmtyWmC07prVYsNfrvn5Y0URR1g2UxigkhQoMU67Enxpr1Z/AdZ8X/u692YNYC/S31f7562bQVZyeoiE+WWLadFbzHFVQBQQmIK64uUeTlGj70oOnO4H8jpc21xpIgmrAiWtaBpg2nmlxE3ck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hSM66WDw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hSM66WDw"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5316BU6V001275
	for <linux-kernel@vger.kernel.org>; Tue, 1 Apr 2025 10:27:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jxEHoKP7Qog4nRVHYpwQFQjlMZjfvp+dONsU8lR/8EI=; b=hSM66WDws8GMEL4H
	jfIlGWmpIdyauRSuA+1jAwppy1f+tTVSYjfmOgwWiT8waw8TRcyLoGifCuop0Jpn
	jFKFD6L872Iuc5ic4z59IzDQgTNoFjPCbCWW/AnrC9LaA4Rkf9uwWWnBzGuzObmO
	wBN5Yh2IlF2ihngs0nRgwgBX49XrptJfp0H9hOivV/9tg9Gy9s3ccJ92o4TVFu3l
	chz4w2cqwEoQlUzfiBURQmk32TPCzu1Gn6yViY3ExZA2uJqDdY2ESiTbIHhN+XfZ
	DGFVmp2YBd8qBICjlEhFUQiCKfHwkTmVhOPbTFS1DpcqNx28m/QaJSrKFYoAzlRE
	cVt8kg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45p67qfx4g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 01 Apr 2025 10:27:59 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-475127bacd0so10938861cf.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Apr 2025 03:27:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743503279; x=1744108079;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jxEHoKP7Qog4nRVHYpwQFQjlMZjfvp+dONsU8lR/8EI=;
        b=fO8GiXbAm7bwd5dE3USkjj9/ezrlmVvMf08ihcag/VBGFM2Ia4TYyjdZZshxnvyzg1
         zIufJgo1ssIU86OauDOqDIXKKNMEXQoiaFE5VG7kgiBjU9U8TFuKT0xZ+Vvub4vY9oi1
         wB79gjGgjZSQMhlZfUcDKKD1gCY/gJNPIHhw4U89WRCNMlgPS4homA4iRQtE/0h+1h35
         dLUWaLp4WP96gEW/UCaQdjyFCSbKuPepf6760fW8OmLYqm/cipnVcHUlwLDqDSFbvrch
         P9+rJyuEI7yc0uQynChoqIiYTaA8MuUlJ6v8A9hcYNaf7Nvs+OUEJ5m6uUFCbiq2srUM
         2P3g==
X-Forwarded-Encrypted: i=1; AJvYcCU2y7zu9dKSkM8dKViv/MPUM1F3vzSPS7TpBdBN/EBcXcCfpVkJ2c/X61bV6th1FdKuFpMyeNN87j3uyoQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwSE9R1XOVuDztr26Wi/dKu6mU/CzxkW2XJUjQfdWi9EYuGXvIh
	BIYB1K6cQrNiRIQEmrpE36Wu9fV/aldZx16Ch17wQ8CRdgv5hQYtXk1sl/AdMdBSRc40id05e5Z
	MfLfzCg62oz6CFq5ehzN27UjqpyBQwsAngF8sr06NebL75amFukDYzn7UUcB1l5s=
X-Gm-Gg: ASbGncvjJ7+JhXDNDQzTaBXSAPDMDdBtHTWKmH0IwDKx0NzIn7GI8Z0aaZC83vtFyyp
	luSL1tHSl4qU3f35lDUxWTd1XL1VEX4lXnr/sHAxRHGVQUYkYPVDY+0hLXXJN50I4WI/KhXOQpO
	Dps4Xii1AmSvveb5IKzhtviom457m4Uy+TL7sedTNU1HFEaeDofGtEewY9FcuCBXTuV4sV7pQeS
	+TYiHFrlnoPsDxnKSZm12sAVQk7YcmewRdURvqIBRK8mWs/fe0/2sf71+hcxQ5AxEqlYzwk2Lyq
	SsHLXx1I+605ETIkPTY/xDcG113X2stIHBY4vqjmjT99v0OaW/3VHTjihhabUw8IZ293ZA==
X-Received: by 2002:a05:620a:25cf:b0:7c0:af16:b4b3 with SMTP id af79cd13be357-7c75c7e2a94mr80086385a.0.1743503278737;
        Tue, 01 Apr 2025 03:27:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEbObCh827bz+S3gYlFvygDrxctd6pT4KaNj5VJhox5/EhpQ7VTgL29THVglIjEH3NIuFE5MA==
X-Received: by 2002:a05:620a:25cf:b0:7c0:af16:b4b3 with SMTP id af79cd13be357-7c75c7e2a94mr80085585a.0.1743503278379;
        Tue, 01 Apr 2025 03:27:58 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5edc17b22a7sm6835920a12.58.2025.04.01.03.27.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Apr 2025 03:27:57 -0700 (PDT)
Message-ID: <707db3e3-b380-4db4-96e9-50e66b0be595@oss.qualcomm.com>
Date: Tue, 1 Apr 2025 12:27:55 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: x1e80100-hp-x14: drop bogus USB retimer
To: Johan Hovold <johan+linaro@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
        Abel Vesa <abel.vesa@linaro.org>,
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250328084154.16759-1-johan+linaro@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250328084154.16759-1-johan+linaro@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=fMI53Yae c=1 sm=1 tr=0 ts=67ebbfaf cx=c_pps a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=A7_7m4m2AAAA:8 a=gxl3bz0cAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=FP8a28HIUr4YAGyj7KEA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22 a=oJWYJD6IZ1JYamx6R5ZZ:22 a=kiRiLd-pWN9FGgpmzFdl:22
X-Proofpoint-ORIG-GUID: vJMjul0kjz2LnfIEMk38BSR-oMMlvF47
X-Proofpoint-GUID: vJMjul0kjz2LnfIEMk38BSR-oMMlvF47
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-01_04,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxscore=0
 priorityscore=1501 phishscore=0 spamscore=0 impostorscore=0 clxscore=1015
 mlxlogscore=999 bulkscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504010067

On 3/28/25 9:41 AM, Johan Hovold wrote:
> Jens reported that the sanity checks added to the new ps883x USB retimer
> driver breaks USB and display on the HP X14. Turns out the X14 only has
> a retimer on one of the ports, but this initially went unnoticed due to
> the missing sanity check (and error handling) in the retimer driver.
> 
> Drop the non-existing retimer from the devicetree to enable the second
> USB port and the display subsystem.
> 
> Note that this also matches the ACPI tables.
> 
> Fixes: 6f18b8d4142c ("arm64: dts: qcom: x1e80100-hp-x14: dt for HP Omnibook X Laptop 14")
> Cc: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---
> 
> The devicetree went upstream before the retimer driver so the display
> would already be broken in 6.14 and there's no need to backport this
> one (but it should go into 6.15).
> 
> Note that the SBU mux can be added later when/if someone figures out how
> it is connected.

I am shocked, but this product photo [1] (is this the right laptop? there's a
bunch with similar naming) on the HP website suggests that indeed only one port
has a USB-40Gbps marking on it, with the other type-C only being supposed to do
10Gbps

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

[1] https://ssl-product-images.www8-hp.com/digmedialib/prodimg/lowres/c08993265.png

