Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B39A1AA1C4
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 18:50:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745607027; cv=none; b=a1owtSxrdD7CEg43R/aTr98F7ch1iq6j+QlUhvJ85IDYTzx3c890JjQM+930AnBrqSjCy6fQF2y/67L0MS1gIhtwBZLjAR6+iRFhRvTrPboKUqLvREETRnXXy9uIF22gqctYMkBsg0b83ZJNepFacgsCkugnDib3Q7N3BGnVemU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745607027; c=relaxed/simple;
	bh=3OkEVS8dQnFFnUr+eA5TheSMiK17eLIXgacYWk/jb5g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cX/w782zTZ/jBm4gvomaOD3fy9R82U5T+fGU/vZyeVh5aVloXkhjnN+dr7rj6J9HE0hcWFhC7W3phZ4pla3K2Nj9JpRC6uz+D6zaQfytUT3AJcYS9lfIgspwTgFC0B5ZS8G0YmdK0RSfT9xkCES/HUn9qTBefwV6c2a0unYBOt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Uq9WDn60; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Uq9WDn60"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53PGJuWZ001337
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 18:50:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=OVs8UbElJTYQ1nFLiPUapXZz
	eHRhnrnlXO1oTNnLdFQ=; b=Uq9WDn60D8vC2re+Jz3OWodm5VpCrxaAoqsjmniP
	QmDfk4L5PXItrf+1Kw88H0R7CzrVrrd+Ou7W0HNmvLs8+867R4YRg0q59o6n2md3
	pmGBMMW/SMNtGmzOUBZwcgSCmPzVBByTJLssyCSVSZVu+gY8qg26PeO0fz/wLx4D
	5oWsDPm5L+VO86//bsnxuJnT4hSjRViL9cjKxjlDLc5Do4kRBbjgBuRpZaB58cpf
	F/kF5qDtw0L2/RTDdOHMaJyS/stkMoLP90iPDlP/sLBQpJOFkYEunZQWMm4Su0OL
	YuU8uBAt/0d9dafb0ZuXtXKcQfS2tVqmrY+ivtJZJt/oQA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh3j1tr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 18:50:24 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c544d2c34fso371659585a.1
        for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 11:50:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745607023; x=1746211823;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OVs8UbElJTYQ1nFLiPUapXZzeHRhnrnlXO1oTNnLdFQ=;
        b=Q4YYEIZdp4TtDrjCcslajXQ24XdzTQRjLH0rXC+o7mQNmxnOkaBSZ3ONexx++ukAY3
         iAz7M5LvbGO9nkLyTHVjHNE84I/SIVSuvm/mICH2CDbEqbgZzAmHE1A3+KPHdrJ7kXNP
         cqGPGeoO0BrbkXpvIT9hh4pJsfd9tC8F0DOQaQGi70EXf/S6+id8FP9otllcVVwbcmlM
         p990OQe86Y3zVslGPQlC0y5YZTxPNEdgOGXVwZ9in9SrO7Td2tKxDP6GjSwajHVczq2m
         Tp1YlZsnmdKH4WH/g9qT+Qb0R5L97Bpbwle9w4ZtaJV1WKUn2iFiDAyKFBg4/KRrBnfK
         wtLw==
X-Forwarded-Encrypted: i=1; AJvYcCUNOBBjwlORxfpSQO2Unnu+p3V/olC4EA5mIIT2tgvHk8Sq3M31jKfVdcB59hjvY3NSozWCuiy8LbT0Er4=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywz1KF3/N5E/55RfaaMr6BgebtjMlliwRXgSrA0+zwx73zy63R4
	HGr2D1H39mZQf0SG2vhGnVyGl/iCX83UG51dvNUo3I+4u420UFUbfOXbySWVUay4pHl63c7DUGs
	JTddQaVOmq8WJ7yTssoh3b4dcGiQNmOEhqszPtCYh/AhgdfDKfcjk1sZnYUj922g=
X-Gm-Gg: ASbGncuVvYUTcRUGAq680lYXoSHF50VqRPQhZXLxmZunzaWiiV8/xmzN8by1FuM3IUk
	vfWgT5YeAGYqV9xYAr8j81OEXWo/vbOq7KOUzfF78hxoGyiy6aubu0cmKdSnRnw6EtppTSk+bHK
	qJ76ZmozFw6egUNDrbbT9jElI6FJ4tN/qkSqs5cQqbELAgV02EMZdaqMOM4uHlKLhcUEGE4Dqzu
	pEh5qlvhheR1w+HVY4YHM91ghfd6HjAXFMFoH7nRDt0Q0yKBXo5LzynbreyixUOMatR4+WDBTqQ
	tt+6VC8LGn3RtHPWXcw3CFPkMmslazQMOCjaBpc33I/sPEicuCucyUVUtkEMuHVnUE89Ca/MR3w
	=
X-Received: by 2002:a05:620a:3907:b0:7c9:256d:f6b6 with SMTP id af79cd13be357-7c966863a9emr93990485a.2.1745607023585;
        Fri, 25 Apr 2025 11:50:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHT03n8z7SHkwDaulevemaec2yJrdYdctRXzxhbdw9an2R0OP0F6xKCFqghpdGVE/met9dTSA==
X-Received: by 2002:a05:620a:3907:b0:7c9:256d:f6b6 with SMTP id af79cd13be357-7c966863a9emr93987585a.2.1745607023267;
        Fri, 25 Apr 2025 11:50:23 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54e7cca842esm688372e87.164.2025.04.25.11.50.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 11:50:22 -0700 (PDT)
Date: Fri, 25 Apr 2025 21:50:20 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 09/11] arm64: dts: qcom: sdm850*: Use q6asm defines for
 reg
Message-ID: <yyeijwvwva7hwehpcyvy7empyfxmzfqei7i27eow2rx73mh5n7@kzwkymdlou6p>
References: <20250425-q6asmdai-defines-v1-0-28308e2ce7d4@fairphone.com>
 <20250425-q6asmdai-defines-v1-9-28308e2ce7d4@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250425-q6asmdai-defines-v1-9-28308e2ce7d4@fairphone.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDEzMyBTYWx0ZWRfXzyrc6BcXmPxf MNBzWPYHAs8o65fVe2vcPfisRDVk2URe3RqvuyCZXIcml6YvWGWKlGMXPCjWgHvZ8GLbUSLpqz5 tRa/7wZP+cGX5UKpjOp1kzFUcdWJMOtgoeM92UpC3p/bXovCdYqohRqAeccQjLAIbHnN9u+rgmW
 zzkLvLJtqR7XirixUz2K6ctixN7mMw0UGD2SJx8whq/zoiNbjtUcFIzwVnS1D9sDHlFvC4gga4o PidksRn+LDJVHJXNXJFDAfLghl9kfPGxaRuXNo9MrbZcnFI2OSCzCLSrS9W+Iqq89xPpcWNmpPf 7pNfONVikFJbY+Jzoukcc8Tn6fSTK5CGk//CyfrLrpcD740PaRoH+ig9cy7u41N2bD6zganIsxD
 Jka+m05hAb56xhWUwoVJM/oQJHTngmmUfA/6QPxdtrij5A6HWFk8mxvoQQlZgxGJ1v6mMQ1A
X-Authority-Analysis: v=2.4 cv=bs1MBFai c=1 sm=1 tr=0 ts=680bd970 cx=c_pps a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=0uHdMyS-I8ESt-gxu3MA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-ORIG-GUID: TkBSTaekRkR4BYfAUPSjBN4B4HClbxvU
X-Proofpoint-GUID: TkBSTaekRkR4BYfAUPSjBN4B4HClbxvU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_05,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 priorityscore=1501 suspectscore=0 mlxlogscore=528 mlxscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 impostorscore=0 malwarescore=0
 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250133

On Fri, Apr 25, 2025 at 01:53:48PM +0200, Luca Weiss wrote:
> Use the MSM_FRONTEND_DAI_MULTIMEDIA* defines to make the code more
> readable. No functional change intended.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts | 6 +++---
>  arch/arm64/boot/dts/qcom/sdm850-samsung-w737.dts     | 6 +++---
>  2 files changed, 6 insertions(+), 6 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
