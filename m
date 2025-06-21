Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADC661F3B96
	for <linux-kernel@vger.kernel.org>; Sat, 21 Jun 2025 09:43:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750499006; cv=none; b=n0WlmVWXCS5r+jswu+iAWxJTfwGFySH+8wCAtX1etBahqc03dja/QiWkniiflKnuvy3PTRGPGTX6EgxnhuziTqm0IyN5oGVsOi3QJEdJjabhZ4H3OHZpWuQXaaG5WOLCXgIkgTS0kPBe1Pn2mzhtsm9lzUbjbxyBXreLxzk//GE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750499006; c=relaxed/simple;
	bh=Eq6AbI9svxvdRWlHU6/Z17Y/ciqRWcpbrp8/qVkWxUY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hZhy4OnwPmPuui9JDOaKAx/C9GUO1j0Qu/EPGHJjWVHr1Uz6yVWV7als2CsZWS7RNFSVaBW7i4+41lXfmLLVaQ7OdcKPDpOLqo1ddhxKzNNboq8jJFsMnNifIIG6/LbkNeaf2PZZFwQspB1YXTmeHQud9B1uutu4WogmBz/6YSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VtZCrM97; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VtZCrM97"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55L4GB6K005757
	for <linux-kernel@vger.kernel.org>; Sat, 21 Jun 2025 09:43:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TXX/nIm40ydEKyVs3/m/xeCNjeguyIaR8bfex/MG2eI=; b=VtZCrM97WnpWVuV9
	GUoT/kV0zfcfXYFx89VPNApGavL3IXsFCiHN2hUQG/sPjC1nlM1WMXrKNrARyCJI
	12ATt1f17vgzT5sHVIVFrDy7CrTMDYq0fzI0EyVm4X7O/iDrttvAW9Unhst/zewS
	50N1kW7JIYYrvgizDXEUyM1VGSnrU8Hn/Z8d7m8OcNOKfZQYtbP0DDnDQe6vnQkX
	zF7h4OEPCBP9bLvnAkXGpiefOEz/1eO6Pk+v+rEAfqbHvPlC4eX5qwvm2/9WZf1V
	M8yrGEanrNX170NxuYmkJKl/KHhPkP8n2GSdb4CpmiIIUiZdWY7n5hf4UAHVqD0Q
	mDMhDA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47dngk8d8v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 21 Jun 2025 09:43:23 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6fb5f7413beso5947456d6.3
        for <linux-kernel@vger.kernel.org>; Sat, 21 Jun 2025 02:43:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750499002; x=1751103802;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TXX/nIm40ydEKyVs3/m/xeCNjeguyIaR8bfex/MG2eI=;
        b=t0bGrk1ZAbyyn7o1o/G72X8LpefmuMr2N5Cl9g9FX1McxSnHwx1kPMptngHYy5OkvO
         kfqOPQzbMjSbdl4ey++XLkfodwqRGSdQqbT9SGjRwHnbtG7J5QaHJ0oMhcjJ6Rp9MfjY
         bvKnlIVEtew3qz+JI2eJgb8O/+edcUG9THfa91FdNy20KpJqQCJX+M3alhLk5ImZ7H0J
         icHpVAjf9SLe4uRgkJ154QI9VPpsrWCkR9Ki5MnFAgOjmt0hduhwFx1SWX1WFDMLMi/G
         uAFMGvVAnsjW1GS5oo41RHhc2BkH9ZucuDTlaI3xNG6UEqdc3ESmipckz7k1j1OiaMJc
         0DpQ==
X-Forwarded-Encrypted: i=1; AJvYcCVAEWUUWchk1K3kwC4KdeN0cNw7WKavBQZ2+WEmOu9d8nifjTIsq6yGCk/Qw2cbTwVJJvU0m2xFPoO69Hs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxV3vI3gupN0KSfznMWf74xC0dwlKJO3uo0V9DNB/kFxrR1uEdi
	EGquigPIa1WSuU950A2PzIj7u2UslM6Nx0gsmuCKG6kQDF3LxCQG2JuNX0AI+wXLjrueEYj7Trg
	0DhgPijKW0dLI2gwm32z5NUofc00yPc7KGQqPxDFW+atAJfMGXacZ7+h4ls1ouftZP4A=
X-Gm-Gg: ASbGncvWdlfwLiBG3JrDMPCGOZBt++07Ut4tYlANpmphe4PEN7keJ0w+3u3j27AYhda
	eD9vLDe3jVICAQv0bbXUgV4mZD9q93mJfVXdvgnd9a0quIlPGA/1mslXlvto5/KXkkSJkks4a+P
	vKarU1k6VNDxeY/C88fT5U/1Viq+x5rXrkrWT+WBUlxmCSvxUWdEu+KlQMMIIb3EYZW3Ghn0CiS
	qgud9ltfG0VHt1KUu+ordI0PpmOPEX5MhMMIy2Wc2asB2pFXUZGsOn4Djxm4M74jtvDA0XgPR1L
	3TYNDZUgbw35dT/LqAgPG/EF8gO7pQi4ha7aziins2qrAmYUXhEGp4fswLYnAugOU9VwizHDm43
	rJRs=
X-Received: by 2002:a05:622a:1aa0:b0:47a:e6e1:c071 with SMTP id d75a77b69052e-4a77a21e46dmr34837861cf.7.1750499002487;
        Sat, 21 Jun 2025 02:43:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHMs3DMpojvSaLfHoGR2ZZXOth8bQIUjYHkyAWr22xj9mQ0gp5qHJrVSftHuw7FWFnQAMZAww==
X-Received: by 2002:a05:622a:1aa0:b0:47a:e6e1:c071 with SMTP id d75a77b69052e-4a77a21e46dmr34837741cf.7.1750499001983;
        Sat, 21 Jun 2025 02:43:21 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae053e80447sm331198966b.6.2025.06.21.02.43.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 21 Jun 2025 02:43:21 -0700 (PDT)
Message-ID: <c9caef81-deef-4360-9ddb-a317402495c0@oss.qualcomm.com>
Date: Sat, 21 Jun 2025 11:43:19 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/5] thermal: qcom-spmi-temp-alarm: Prepare to support
 additional Temp Alarm subtypes
To: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>, amitk@kernel.org,
        thara.gopinath@gmail.com, rafael@kernel.org, daniel.lezcano@linaro.org
Cc: rui.zhang@intel.com, lukasz.luba@arm.com, david.collins@oss.qualcomm.com,
        stefan.schmidt@linaro.org, quic_tsoni@quicinc.com,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, dmitry.baryshkov@linaro.org,
        dmitry.baryshkov@oss.qualcomm.com
References: <20250620001918.4090853-1-anjelique.melendez@oss.qualcomm.com>
 <20250620001918.4090853-4-anjelique.melendez@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250620001918.4090853-4-anjelique.melendez@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIxMDA1NiBTYWx0ZWRfX7HjMncr/+/ZD
 3e7dAafHFKyplbcCTCUnZSmYKYB7kzZZpp6zw1yDzzZdKoRCAPCkDGkBMBgYpr7PV0gtPvbjVZs
 r3HbVzlOuugLOkvcimD3SlpPtCIhouu2gnLURWE5FqV068qucAxogQuCoJn4lw83VbhQG/ahT4G
 TsDJk0ObRJrGwHSK15VSC2S3QzC7QMev984y8cDlfB7fqQlOaokegdgGCFhafPqTdMYqDFYjJ6B
 uZbLLYSoYpiIfLmk1sorxvOkLeF5iwkVEXQTJnd3djehcg20nUKwHv/BaHP2+h5OE3o0Mc2bT7V
 WCRAwlQD6u/GFoeQNQuTgXSs39LZEdS1CM6we2fRf1DLOmiUVrfKk50vfvoD3zoaDLOfN71yYn2
 riwkbtMWr8q3iWpf74JKf9TktVYVaxyp2qWjOvgCMPEXjfQUVdomw9i23bVe7KObiK44J+wu
X-Proofpoint-ORIG-GUID: upKw8reTyNhh_IC1wkmGte33KtdllTbl
X-Proofpoint-GUID: upKw8reTyNhh_IC1wkmGte33KtdllTbl
X-Authority-Analysis: v=2.4 cv=K+giHzWI c=1 sm=1 tr=0 ts=68567ebb cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=ryWYcZWYGYbgHTkFvRoA:9
 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-21_02,2025-06-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 mlxscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 clxscore=1015 lowpriorityscore=0 bulkscore=0 suspectscore=0 mlxlogscore=999
 adultscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506210056

On 6/20/25 2:19 AM, Anjelique Melendez wrote:
> In preparation to support newer temp alarm subtypes, add the "ops",
> "sync_thresholds" and "configure_trip_temps" references to
> spmi_temp_alarm_data. This will allow for each Temp Alarm subtype to define
> its own thermal_zone_device_ops and properly initialize and configure
> thermal trip temperature.
> 
> Signed-off-by: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
> ---

Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
