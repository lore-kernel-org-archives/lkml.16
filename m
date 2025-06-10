Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2C1020C463
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 14:39:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749566353; cv=none; b=KqFOuzg3vYf60BNESaAMQ+8qA71Pg33mZoSkCI5IY5dYhzZlSCZXs3CAjbuygEbdctNxcfGGpOMkOALvgRL+v4HCqy1waBtCVioD+01lC6keqSu4zgx1AsfHS13b7cGWck/QvFdq1GnymRVfslDv19zPf0mHkTCkeoHrrPeuocg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749566353; c=relaxed/simple;
	bh=JEhdZtu3qJRdspujX7loWXgzQgwNvA/+M6KwCyzZOt8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Af4+IadaUjmk/JbUxKFXTJt8QWDqPcZOdJ+lJPyIhmpjdBg4K2SpcTkdlNi3/Z4vW68fP3DAZ+fShfEstgMjlBWTnVuWmgoU2HrX62BHTcmQ5q48+92hFO1JJj5aVBEqOH8hmvvg1vX6p1oAIG3k6JBlWUSFkG4lJ6v7txyGtb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Tvc5Ue1N; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Tvc5Ue1N"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55A8AXIZ017801
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 14:39:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4pw5nq7+Bj/Ac4lWh78WSk34rnPTAijZmCV+DGEjR6Q=; b=Tvc5Ue1NTVvtqo8o
	yOpjgjwsKLep1BvG8wafzxNyght58u8GSohG6CRMXmhuL6zYsGegs7ft2BRQLHBU
	UAzcFNwkHxgCJGGe+KthukAfiuV8P15a/s1QHRKMirw0DtBGx6AJHONUhAcr2Fze
	awtmYShBqwXz8Ekn+iMnF0qhg7q3kP89FywP1GiBClsMTNm5Htw1aOQCnyFDh/oW
	Jzg/LIGAB49aCDdo4TcpT2dTJ2TPMufCIIxtWsyVGBScKTJmrhqHsW92e9/K0c79
	djQdNBuSJBtTjwQH7mbPSftwrWqO7mn4BsVMrgVSLlc9+7Gb91jI9kcR5V9XnDoN
	WlBQTg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4766mcjh7u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 14:39:10 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4a6f59d5ac6so8511941cf.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 07:39:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749566350; x=1750171150;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4pw5nq7+Bj/Ac4lWh78WSk34rnPTAijZmCV+DGEjR6Q=;
        b=NVk3lz14BBhUmflhQVyRXROFNxwkkQz9K0+1vfK3QcPqfCH/hVJftbj/E4nD53/nOV
         316zj7eVdUa6Ivd0jnq5ZXorI4wpwdv8K+Of0U/g/KRfDZp/jctrDLTUBzMzeS/VUwTe
         PEnmjYg+u9AK8skFfC7WQ+2FDrLCeiVvngKjN9/5BZnf8p8zcGSPL3+chq1dZM/tC7AC
         LvTGc8OL87Ah1RiGon9POmMjyqls/i601YL6mn7/mt2LO0MYJXcRr8V/DLsj9aVM3Tmj
         2DBKTz2jo3B2hiQXS1aWSeCLLzZHcuOMb7QiVY7bTUM1lWHRUdRik9ClbU37EvNPaCVZ
         Trug==
X-Forwarded-Encrypted: i=1; AJvYcCWLVaST6VV7VpmzNTwZCtFkccQSCQP8Dx5O5KEavl/Wjw6NdbKxEg0ko8UAW0S1Urj5XHlrNvtc4w26eYU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxf+XFrqoqXBiA2We+PrW6L1QW+pWaSLliD3kpM+boYAerhQWjj
	ZamyY3OIXR0QzHqljUUMO7qjfz5fZ4vXoS42phpIxqQRpwS8vPWeoAmNAVU2kDFHFh5pD94RYNK
	9P4sDMByCwiU/CQGn5/tWC6AQbeX6yZjnKH0FENXhy1tiNO/ux/DZ6XczpTOAjm7A9qc=
X-Gm-Gg: ASbGncscyW7N6Xt4Bf2egKFEv2XJAQK3/YP3qCIytfmpbjPVjjOpp2b2VFWUpThBA9E
	olvo6CuhqcLljvinNFbL6239ec3QOrDSN+lOofiUE+zoa4pPDy7UTpf0HYcHs03CzQkjXY5ZBcX
	Npmsg29dPAdG+nNUm412r3JA2Y2c0ce5oVeBIrjnaX59DZkFvRy2sdOK7z9367VLDlN1dXJq8Is
	v5SLFWup2IJ4+2T+tbcp2HwJMXG1Q3euBlvKiBv5lqMJe9GXRDSdM7bhujqQNv3/rXiJosjrZw7
	PUNX79fFQc6fVUZ8IhoTsFx9SUas851aSSjr/C2AVFKHIuaUbQSQdLYjqKVPEtUPJYmo9EES7b8
	g
X-Received: by 2002:ac8:5a0d:0:b0:494:5984:1022 with SMTP id d75a77b69052e-4a6690a28dfmr95786511cf.11.1749566349763;
        Tue, 10 Jun 2025 07:39:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGouqX7qoKwblwHdCsP8sXYcazh4DdthTicdnTn7xgesyInCIp3oCS88Mi1046CwU/GY9svig==
X-Received: by 2002:ac8:5a0d:0:b0:494:5984:1022 with SMTP id d75a77b69052e-4a6690a28dfmr95786261cf.11.1749566349310;
        Tue, 10 Jun 2025 07:39:09 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ade1db55b68sm738346266b.59.2025.06.10.07.39.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Jun 2025 07:39:08 -0700 (PDT)
Message-ID: <1b26fd75-f316-4cbd-b60b-6b3496551314@oss.qualcomm.com>
Date: Tue, 10 Jun 2025 16:39:06 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: Add GPU support to X1P42100 SoC
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
References: <20250607-x1p-adreno-v1-0-a8ea80f3b18b@oss.qualcomm.com>
 <20250607-x1p-adreno-v1-3-a8ea80f3b18b@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250607-x1p-adreno-v1-3-a8ea80f3b18b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=T8KMT+KQ c=1 sm=1 tr=0 ts=6848438e cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=nNJ8jBrhinZ9UXkNAM4A:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: FIzGHXPqgNbH5eaisT9YwGgJhTugAU1F
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEwMDExNiBTYWx0ZWRfX5Ce9BDReEmCk
 TgcQnTO2kVV4FV7acwZr8i4jrKvbseGJw4hdukOdNB00ExjLclWSQ9Bgj3Y3wStmKYIYa1QPwYu
 AHYp22bxQzk+aMNfJYoPF58JRZpzk4UroJtFbUrdmLoBeE3JdbeZx5UT/XRnyLghoQD7zR+HRDz
 5z5PW3MUJBuM7XmQVg6Y7zN/18vj8N8TLWycBGizIq+TLYHQAx94Ti4tRsZG6RVQTe7tCrSlmWX
 dWeUPO22HHdS4RDckdYuM9gkDE2AHyj5BIbWXcidYPnULZQ2CuSvzU+ynkqxxNi8xXHAaRXhIm+
 v9VDxdS+NLzRVbo0LW6z0NyQCZv+mZUTTZv30q+L5bj0BXDRtikdtf/ihfA8GEJfCCpYtzPzB5K
 xHT71gkdcCFqlYtgKBttlR4gf2ue9khR2bFMZLGGp8XP+ICA+MD4DOR1W9Idc06LabvVj8oD
X-Proofpoint-GUID: FIzGHXPqgNbH5eaisT9YwGgJhTugAU1F
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-10_05,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 mlxscore=0 phishscore=0
 mlxlogscore=833 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506100116

On 6/7/25 4:15 PM, Akhil P Oommen wrote:
> X1P42100 SoC has a new GPU called Adreno X1-45 which is a smaller
> version of Adreno X1-85 GPU. Describe this new GPU and also add
> the secure gpu firmware path that should used for X1P42100 CRD.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---

[...]

> -/* The GPU is physically different and will be brought up later */
> +&gmu {
> +	/delete-property/ compatible;
> +	compatible = "qcom,adreno-gmu-x145.0", "qcom,adreno-gmu";
> +};
> +
> +&qfprom {
> +	gpu_speed_bin: gpu_speed_bin@119 {
> +		reg = <0x119 0x2>;
> +		bits = <7 9>;
> +	};
> +};

Please sort the label references alpabetically

> +
>  &gpu {

Konrad
