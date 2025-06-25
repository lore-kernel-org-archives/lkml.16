Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98B991C2DB2
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 04:51:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750827067; cv=none; b=lfVBWSgHgXsYQDOqOhYtFD7MuDIhNOlupeVawA1m+GYp/zVKeR2hmdGx2UgETr2Uxo9T0GIGntSQIJ1uJ/dfZhoCmlRPi8oHtUtVurN7dLlttYAg8yqb1YYQWFmjCx8wNN+WQEH2a/uN8HIUUYavFKE+qW0ZqWGnAZIiVnK0QGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750827067; c=relaxed/simple;
	bh=R+mi1MfMmFECvU6BHoLstxhB5ir4ugMn68hS+cemcik=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bkA/Pg3MNa8bgOIGkn2GwZM+H8Dn9TAwYHEHIYl4kWLAzlSmkbbifNc+rb4XEq0JJbYHBbsZkPAtjI9C0caRuX6nnn6v8NHDv3CKAPoIjchZUvtRTHPmjmPSf5IzYGysZeIO7NEH2vN+6TXmmqqh3oCZFFZISQ2s6vnzWZG5B2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NgjRnURX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NgjRnURX"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55P3EtI7015731
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 04:51:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uWANR5imRlXfhmMJ7ls8Eqd60uAyLbrR8SUFg1XYKMg=; b=NgjRnURXrMAhT35O
	+l826HaMXBtyMLPC2egxpyDkwnabJXINeAKp0J4s1TAkGlIbJWAPHuk800KH1JA3
	rBiXfrEFuqlZ0PUMDrjuUIMB5VFvqC36OXZ3AX+sFBKxOPVZ5BXF+da6wV9i08Rw
	H9RyJLxHwuQsfTkKH6j6aFIFsVfGQdMc0AzltxqU6rbynqlvl694GzmAGtM6pMrr
	TsQ59uF5hvQjlnefbLDp9JvjtLlmy5OWCBgUURXdcoSH88Nv1dQNSWjggf6+EJ39
	jPFJrFuiHNSc+fWi15MFvn7QeNjeH4soTG3AB0991Mh6oS70hhfnrkqS7YZzgnOR
	WdcmEw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47evc5qjvg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 04:51:03 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3132c1942a1so8296212a91.2
        for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 21:51:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750827063; x=1751431863;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uWANR5imRlXfhmMJ7ls8Eqd60uAyLbrR8SUFg1XYKMg=;
        b=OI57hpR8u2tiKxPw2/xixBy5Uj+5X6razwk+Pcn+VUC3s7D+Odphxg9ksEmHww8b1b
         gpJDI2uR2dz2jk38IbWrH1jF8U+YrMzn+ZLt71llFt1OsbzmSRfzH8oU1WDDEDD5lQs8
         cdAnhDrtVH+BNsHPKW4/tsBU+0JsCcDiChgstmxfCygML/6x4Px12KfzoIllQU9kkHYi
         NO2YaR31EEQMaqjeT910KAYhOTxUvI+8S09IVKZhavW29bmSmyF1cEl/2Nfm+XyESyen
         HvZ7arMQR5oWP7cbyGolw2724FD/oOwWRYnptMm/4xO69JTVDei/nWRajiN6Raoyynat
         7n5Q==
X-Forwarded-Encrypted: i=1; AJvYcCX820vhF65/6xnfchF9eB/T5c8BiX7imB4OKihwGtvFLik5CM8a0hsPkwKFWfRHa68u0b9MdtZSj6nl4Bw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwMwbk0RQNBJu+jac3w1XtjhLeYvb+7cB6i9H2RKZvfb2QvJBJZ
	UpwDGJyUrKXMclNtM9Djdt4cg4qLShVJLDMOOMXUzNjTrckJS3izKnQ7qH2PLNB2rdlLoXYsWuS
	GF7lSKAVhsDenwVTaRHeUXEIevhnkxZ92BODPMkOKaytzalOUF70NB4dceGfXcHvzl14=
X-Gm-Gg: ASbGncsIuw+fY1+fxVg1EqR/jfspGROH4mJNWE0Ba6pS3F/qfQnuWUMP/aSDCFu5gMp
	rRvqtra2q6MTah8qYRUplNVgbIEGhowgyBNoOAkEFGtyjFngjieH8SqfmO+ZY0BsIrukcBz+WVA
	AtKwa1m6f8C5U1orsMW03hVN22+ZBMdFVQ6tm3TJd7v6KiECV6upkN4PITec4qFmHVqNZkb7muW
	Ehgib5d2UeLPG+0Wt/prFophHdfVKMA4bu2BUIxiL1I6fNq3pFuPfIYFI5YvGZiSHqqWLXtmsYa
	AWMy3cYxEfWOaXpT+3g8VhNecdfFGHy/0Znr0wO7BH6jKwMsFywDzEHn//vXhYU=
X-Received: by 2002:a17:90b:3f10:b0:312:eaea:afa1 with SMTP id 98e67ed59e1d1-315f26b1d47mr2056902a91.29.1750827062807;
        Tue, 24 Jun 2025 21:51:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGnvuHz5aGAcqZ79k6lfdJe3XcpxANsWACfUa5ytAc/H7t4vpU25I7oBD2Z4sh750DNF1tWVA==
X-Received: by 2002:a17:90b:3f10:b0:312:eaea:afa1 with SMTP id 98e67ed59e1d1-315f26b1d47mr2056879a91.29.1750827062384;
        Tue, 24 Jun 2025 21:51:02 -0700 (PDT)
Received: from [10.151.37.217] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237d8396182sm122012895ad.9.2025.06.24.21.50.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Jun 2025 21:51:01 -0700 (PDT)
Message-ID: <7d641576-7ec7-46f2-ad53-e0b8b36351d1@oss.qualcomm.com>
Date: Wed, 25 Jun 2025 10:20:57 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: ipq5424: Add reserved memory for TF-A
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Vignesh Viswanathan <quic_viswanat@quicinc.com>
References: <20250624-atf-reserved-mem-v1-1-43b1940e2853@oss.qualcomm.com>
 <0826de9f-0125-44d9-84cd-1c52ba199a4a@oss.qualcomm.com>
Content-Language: en-US
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
In-Reply-To: <0826de9f-0125-44d9-84cd-1c52ba199a4a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: M00IEm33vq5gj9oIq1R0Dk4F6nVtvszU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDAzNCBTYWx0ZWRfXzoqOKzgWc6UG
 kTPuJbaIOwd3SMBwcdqmxozDAuyFSNl6CMvxZ6eseToWorciXZP9yGwWgthvOfuuvVPovvFCjEv
 IuxKoELsKLMuOAtSzhtbDYSxLBha75dPzKPfNw9evGHxRWdJ4P/IS3lGblDoXCiY9MuLKGCWTCd
 REbyDtrMr1YqaE4bzlr/CuznX7B9DGApHCfgNbOjXAzJ52QqJb2Mty6y2vkn42ZgaUgwfu7PWt+
 2qVL1u7d2+OONgbvuE6UUnmvLgHbc4Rkur4HXkqCm8mF4vaZB3Ne2+CP4TNnxxBG71Zx7fhLvBT
 1I2pb+ASlkT6ZCLiSQLT4bKJ6iC4fHCfIOylXsO+F8rpfLPQUi3IQ7Fi53LlTOnoROijzgT992Z
 rGxNr+XjDVHprBt/P16n1ZUjAtgftXawW+D2cnuGNgX0M848PIuFF8Ytc7g6XjTH5D8k9dHe
X-Authority-Analysis: v=2.4 cv=caHSrmDM c=1 sm=1 tr=0 ts=685b8037 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=sl2Mi_gxeYHe-Mi6R-oA:9 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: M00IEm33vq5gj9oIq1R0Dk4F6nVtvszU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_01,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxlogscore=440 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 adultscore=0 mlxscore=0 spamscore=0
 malwarescore=0 phishscore=0 clxscore=1015 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506250034


On 6/24/2025 6:57 PM, Konrad Dybcio wrote:
> On 6/24/25 12:36 PM, Kathiravan Thirumoorthy wrote:
>> From: Vignesh Viswanathan <quic_viswanat@quicinc.com>
>>
>> IPQ5424 supports both TZ and TF-A as secure software options and various
>> DDR sizes. In most cases, TF-A or TZ is loaded at the same memory
>> location, but in the 256MB DDR configuration TF-A is loaded at a different
>> region.
>>
>> So, add the reserved memory node for TF-A and keep it disabled by default.
>> During bootup, U-Boot will detect which secure software is running and
>> enable or disable the node accordingly.
>>
>> Signed-off-by: Vignesh Viswanathan <quic_viswanat@quicinc.com>
>> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
>> ---
> Can the said u-boot simply dynamically add the reservation then?

Yeah it could have been done in U-Boot itself but it wasn't. 256MB DDR 
configuration solution is already shipped out and the stock U-Boot 
enable this node to avoid the random issues.

>
> Konrad
