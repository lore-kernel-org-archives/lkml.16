Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00DFE28B4E8
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 09:44:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744710287; cv=none; b=tblPCI61UdXnn/+/tUl8i3ofo4uuEnldGEVcUqtcH6KvflOKLkwOUt2AX7kIhHU5LQ7gM8y1p6ZUoaK/p8srY4mjt5R3zSQ6S8o8XtXGEu2CItUFaICVQsXUJR0hjfqV5lv/h3LbmGuD0oCT2GHQjwWe+CQyjV1mh6TbspdshuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744710287; c=relaxed/simple;
	bh=dr0JVWeIpsaW8IvE8sb0AnG3QXbfVbpgSshfluU7QpA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iNLttdFDWOpxbqBdeswrHeEYW+orapF0TzW7QxXMBoSCFZu88tbG17vtB6VnS/bhqoZaMQQqgTTM0Fm55cWjljqFVFMJVgXptmcPKYTn5WUpyWvJickcBArW0r0LsfkKN01+OWUPche3duPYTyFJqtTYQBgyxFf76qixrwJaDzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V2dK16yQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="V2dK16yQ"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53F8tSV4005502
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 09:44:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dh7xlUxtOWfIN7SBnmAvxpsTUhx8yFt35Gg5z7br5FU=; b=V2dK16yQl6pylqWS
	R1E95Tw4nkew+6moyHTARiLlnzpU7er5QnXJOU6ovmVvOv7CvgFE+WH6F3WS/uWH
	2037Xy7QYlyzwmIzWlRgwVJcYpGY2vKoGDzFnX/B6t3f/dekJxM3g1v0Ue8tvzdI
	4K/8BvTKNaPDcQit495aEP72xKPw0DGcQFntRIgUrXwTaOve0qWcJupVBbl+e2V3
	wjkvTYEiU8UELOL/r7isTbpTdiFRkxhqYQmwyzGgOzd0NIf7KLgmuIwZo9L/Xhdw
	TQ5MQ25y14hj0RqNACX/BCiGgErdDIPNv7/02OUrxS3t4YT8kK4g3GK9hCiJhhEs
	g5FIQQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yhbpqbs3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 09:44:45 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-476718f9369so12113451cf.3
        for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 02:44:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744710284; x=1745315084;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dh7xlUxtOWfIN7SBnmAvxpsTUhx8yFt35Gg5z7br5FU=;
        b=TAfwQZqVMkN9iDksnSAvCZ1lzxT5iGYzW6hVCAhBhrX3SMTffXbT2YdaVMCeWYFBDt
         7jnL1ig7o10fCf4wAV10C0Z1JxLyXRxd2NSFDvieELE3BYQ6DNqdMXzv+Dg5eKZGydP8
         SXMy+u32LFRuelnxyR4IPoBnladgBLlf3aG4Pcye4joYdjoFI6T3kft8HKLxZJE+QbFu
         9WGMhHElTeJrkE1mkcUhTTUS+NF/2cnCvb8h8jkXTTTdayhUwWfCs0z+q4eNbxr36pKU
         BgAY8efTjCE83s5Wwrty/zYsve0WMrna6YYKtxK43TLeJ9E4ZYAIWnyNjrrhlG21WCwb
         Xjew==
X-Forwarded-Encrypted: i=1; AJvYcCVuIv3IRV9FgfSKVZyy8ISP4Bo5olloUR5zfZIOTVO/ugm3BH2Og9JgUFfo5XSq8iDstTqWuInGUR5rWg4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwilPgQtDZSSlM+O/GxYSXF7h1HR5znf0M5/P/qbSb2xy3oG5M0
	OYr/XA7y76HfLwYCx04X8uRqo7Ntp4uSMuu85QQCcO5K2ZVZujzgz+uRwEpiDRB8hcN1XX72GLd
	XJi4HC8OZJaxaPm2kIjqNhR2ElzcSVK2t5AGO1+/rbKY2JTNauVXRlCgXpwS6f7Y=
X-Gm-Gg: ASbGncuuNxP2WRSTNfAv3xSCrJoB2idauzDSzIFhXhp4eqS1QjUU92/WkZHvwZ5lka8
	ppKFXnBBwQsweKGVExerbmfsbVyuCQyuxOac/Sk2Bcu2kDIwE467+YnyQV7N6aN36D0/63keoK6
	qEIc0EPqDd/KJwQL4e6ICNyyS6ZPeZHqkMeAOh3o7oQOGSEv31QJhSlOfBsfSPdmeJYXkMRYvuR
	EFkpMuAyHoFHB9/DclDRBo2yB4fQnAipYh8Z9I8u6WJHhg7dPloNwVhwRKIWCSYzKRGRWvt2P6D
	ZJBc+vX50lJUb8FQgRtqlH/2d6qHMK2sC4efCjGKHtj0xg/ElaV5kQQ7Eh9Cj43IrM4=
X-Received: by 2002:a05:622a:190b:b0:476:66fb:4df4 with SMTP id d75a77b69052e-479773fae77mr86594371cf.0.1744710283885;
        Tue, 15 Apr 2025 02:44:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEtDVLNzgvpQI0Lhz9q3H+Gl7nwNw80XyxluXGruUxEXUTIGiDUoi+aDVsGLS4X9fWsR8kNoQ==
X-Received: by 2002:a05:622a:190b:b0:476:66fb:4df4 with SMTP id d75a77b69052e-479773fae77mr86594041cf.0.1744710283561;
        Tue, 15 Apr 2025 02:44:43 -0700 (PDT)
Received: from [192.168.65.246] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f36ef61911sm6334674a12.32.2025.04.15.02.44.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Apr 2025 02:44:43 -0700 (PDT)
Message-ID: <aa67f077-98dd-4561-b431-9db276ea29ba@oss.qualcomm.com>
Date: Tue, 15 Apr 2025 11:44:39 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 09/10] iommu/arm-smmu-qcom: Add SAR2130P MDSS
 compatible
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Jonathan Marek <jonathan@marek.ca>,
        Bjorn Andersson <andersson@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org
References: <20250415-sar2130p-display-v3-0-62314b1c9023@oss.qualcomm.com>
 <20250415-sar2130p-display-v3-9-62314b1c9023@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250415-sar2130p-display-v3-9-62314b1c9023@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: sVsL9Bs_xO-0nBWoZFjk9bhwk-HFR8mi
X-Proofpoint-GUID: sVsL9Bs_xO-0nBWoZFjk9bhwk-HFR8mi
X-Authority-Analysis: v=2.4 cv=I+plRMgg c=1 sm=1 tr=0 ts=67fe2a8d cx=c_pps a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=TMI2DeuJ6cRHfy_QMqYA:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-15_04,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 spamscore=0
 phishscore=0 adultscore=0 priorityscore=1501 mlxscore=0 lowpriorityscore=0
 bulkscore=0 mlxlogscore=628 clxscore=1015 impostorscore=0 malwarescore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504150067

On 4/15/25 11:39 AM, Dmitry Baryshkov wrote:
> From: Dmitry Baryshkov <lumag@kernel.org>
> 
> Add the SAR2130P compatible to clients compatible list, the device
> require identity domain.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
