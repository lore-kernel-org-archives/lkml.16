Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57105291146
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 10:48:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744714082; cv=none; b=J8IOIgFM61fXtJynBb6/pl/zrqPb42FteqzkZCnlCyXHqCJ4CyEOkStGhoBheVErkdMRMlBt6sN1G+ZjsTr9iU0NHNkAqsGMKceRUNhKkaH+0dK9twdc8YjvoiD8Lej9mtgs2U/UstspHy3PtYtiodeMAqxsyL6c3nrFKYgJUlw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744714082; c=relaxed/simple;
	bh=0LEnKeuoJmhEiQP1Qg6HuMLQvWZg8sLSX2wfLEdLIDQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Wf+ESk4YvOg306VjwqjSpgQOCgdEL+3p2C2GWCaNMEtJ9i8JSchiTnm5QgHUlShXf0NFQWI3fchM8zLfUyHoxC34SEgB+oLOlzqZ6ZI58ybhetSMuOnuLx8bdy0FYQ+aq+N9YDacszWb8F3XWqEcFp0x9i2eB3kfAZcs44mf8Y8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KDjMRYMU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KDjMRYMU"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53F8tCK2025071
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 10:48:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NVoKFr3j9LUHGKgglF2+6o+zU2ehLL20G1TS01r2k6I=; b=KDjMRYMUTZoovRaj
	xfoFjwIF7dZwALA+TOG36VZ5Avw8DXUuI3wvljwX1CiMcyDrIeXprNl1q5nBwZqK
	anscSvvyWu3lXFA5C6/PXHWoWGVnx8kIiOSUyFIOVyD04M7OGFjcsExfhEEcIJlH
	4wR82Q4lQxU2/4i0ChoLv0CWzq+Tkk+l/PULt2xAL5YFhesnOKt8piNliFEk7R5i
	1x+ReBchusqY8KMkfos9stzOeFwHzxEcaP0pEdYsGTerLhUkI7wmub0yjrC54n6O
	D1yO9XbkscKkM7Ln7T/04MUA3GAQpgPIumo2TOUHhQGXMedPgG3MEPi/S8CA4fxD
	+9q8iw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yg8wfqx2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 10:48:00 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c5530c2e01so64519385a.0
        for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 03:48:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744714079; x=1745318879;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NVoKFr3j9LUHGKgglF2+6o+zU2ehLL20G1TS01r2k6I=;
        b=U8+IuL/297FW7bH5Ou/Fdms8sAwYb0khn7VkpLh6FNRxNh7bC3do+VCmiHNOoCxxJo
         ZRc7TUY8GjJEPUO0KmORqlHryj646UlV21U3WHznTc6TFaMabKvtoXvdWKiTvvCYxxbV
         AgQhYe/aBvZ5IDZ30nvTz9Kci0ZQrhRXr3AfvYjj5W/s8XT5HJE7HYDQ89nRZ439Xn8i
         xUfvMN/K1ewz/GlAMx9JGGZKfET7en81QtjIXWoK93cs01PrdLm7I+v12k8GVpklUnQb
         DUzGjoRpq3Ib4J/Nt3RKKpRTny3GQJqfLfHrag2wWOi9hkxAH16FrgdD4+GPcV5/F3UB
         omMQ==
X-Forwarded-Encrypted: i=1; AJvYcCX39KwE90eElunbEa8MDQLBNaHDf8E8xb19Q1/Cj8XVZV5uXLijAAnorU2Zan+41fHPGWOyX9gs+mt1DHs=@vger.kernel.org
X-Gm-Message-State: AOJu0YzQkV7H1IY2cu29XHCtWBldX+O56L2GPwbiqn+koTK4tlmS4Qus
	eE4xbc1JCpD5qJkWNydUpkvObhXgskEgKHJikelCfo01MNaXiq52SN9XFF1UYCD+RCpUsQQNUO9
	54gtYVD+INkLna+XDEX13L5Ctecp8OpW34nxY8dZ5THZOw6s8jXSWrChjD7OT+eE=
X-Gm-Gg: ASbGncuc35KyUexvfNPfyDzECjVS4llwxraEj60CMt3KsL7ocRJ3dnA7kATLiJ2sCtu
	7Ta2PwvyMUpxiPR94ljCSO+pfbbqbgcpSif7ReWLGmDPpf2dQVspb8WZ0qmLP2YInieGdqrBNZ0
	B+S2XB42n2oDQp4JuFscPDe9p7dr5IJ4lJOSiZScxnZThJbGM7uEmf213tDRs8nCxcbwaRizqt5
	8a8+bjTk5bMw/WQPgsLQaGGYUZuaf7Z0p0MxyFBEra1T5xkgLXoqlodBBPCIekGJ6Xr7/LO1Aen
	m115i2U4uHbkhzOwVL7WWnvD31sRPthAOOfZbqOn/lBUHjcB1s3rJxgMytefi3moR8k=
X-Received: by 2002:a05:620a:404d:b0:7c5:ba85:c66 with SMTP id af79cd13be357-7c7af0c153fmr806652185a.2.1744714079422;
        Tue, 15 Apr 2025 03:47:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEHuwG4dNdI2BSsFDbn0eb8qAYld3w/d/K+CHo95e+es2kHPxuJzChDv3YYN+jjEmQ1kbQJdg==
X-Received: by 2002:a05:620a:404d:b0:7c5:ba85:c66 with SMTP id af79cd13be357-7c7af0c153fmr806650685a.2.1744714079068;
        Tue, 15 Apr 2025 03:47:59 -0700 (PDT)
Received: from [192.168.65.246] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1cb3ef7sm1060539166b.89.2025.04.15.03.47.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Apr 2025 03:47:58 -0700 (PDT)
Message-ID: <069f3555-2321-4276-b0c6-153ec15064d0@oss.qualcomm.com>
Date: Tue, 15 Apr 2025 12:47:56 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 13/20] arm64: dts: qcom: sm6125: use correct size for VBIF
 regions
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        cros-qcom-dts-watchers@chromium.org,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20250415-drm-msm-dts-fixes-v1-0-90cd91bdd138@oss.qualcomm.com>
 <20250415-drm-msm-dts-fixes-v1-13-90cd91bdd138@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250415-drm-msm-dts-fixes-v1-13-90cd91bdd138@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=E9TNpbdl c=1 sm=1 tr=0 ts=67fe3960 cx=c_pps a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=da4WsfccAxvekxWPt1gA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: O6_5frYzFAFVGI3uWJex7wG_9U9MA0c-
X-Proofpoint-GUID: O6_5frYzFAFVGI3uWJex7wG_9U9MA0c-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-15_05,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 adultscore=0
 mlxscore=0 bulkscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 suspectscore=0 mlxlogscore=645 spamscore=0 priorityscore=1501
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504150076

On 4/15/25 12:26 PM, Dmitry Baryshkov wrote:
> Use allocated region size for VBIF regions as defined by the docs
> (0x3000) instead of just using the last register address.
> 
> Suggested-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Can't 100% confirm, but holds true on sister socs, so:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
