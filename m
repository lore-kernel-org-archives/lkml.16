Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E41EC2DFA25
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 09:44:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744710269; cv=none; b=B/S0IrcrB3PUhNndNiuL0r1PF7Oel5fR45R3Mh5IRlo8cIdGJU0STwFQVYvLaPQaNHlg8zfkPDvSG4ZzYY3rwnCL/RjGg2lauqJ8VkMvdTlnNHjtHLc4PrOuSuhMAhI68ei41hpVqnNQ5TCpWKPKwbYbtHqYFBD7i/G9wFE9lzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744710269; c=relaxed/simple;
	bh=Uprxl+1GFiY2y+Cgn8JymqTKxPDvtaIfmc8l1d4uhI8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XWexI7gBfyHHuUihCSXssfoXbF+eOtEkP9InFvcQZ6HfVv7wl4VhAN2P1sRygh++Ka8sLv+H94FMiE1JtfKm+0fYmeDkmxCCIRqWwXwpNdFjmQPS3aKKffRh0XcwxMZIeT6vsvAb/miXvnZOcRlUh6+XHO062RCi3GAADJG9jjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OMlBxtQq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OMlBxtQq"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53F8u9nq025916
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 09:44:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rW9FWPSdQt2D+614W81JrfXlNn32mGwhXPgp/tUuSmk=; b=OMlBxtQqJGmWEZFV
	EBm4SupL8+T0JUt9IMgpIMdoOcxKuu4vkazTH74g/ms5JkQFxD6BGlgW/GiNrktZ
	8pdiBvJ09qTbFOGWs3llxl+r9dIstAw4eqWC/kHp5Y1WpS6awHLao4zz/wDnehl8
	mg8OSuY3VOTHHHpLSkylrJ3GlYr9xm3gxzO0vPRZhJrGQHm3HpHA4enuKJ8+T2lU
	bmU0SmpBA9sma7PTDW8+pjUDf+JQlw2JCX/ZCDXQKhJFpxjlmh/YYEvNKzcMTyok
	U2Te52FfUql3eX3kJTjdQUs1j7T8POnCNoMwBHUNu6NUVSJj6CzfWGdEBpGiMnfe
	np79ng==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yf69qk9s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 09:44:26 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6e8f3c21043so10618996d6.1
        for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 02:44:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744710266; x=1745315066;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rW9FWPSdQt2D+614W81JrfXlNn32mGwhXPgp/tUuSmk=;
        b=NAmLulX24t6Sr4bXEqufvPv0gPaj79Ii/e8wTmcCiHQ+BWlQk5afqAbmCGQLNy9qJG
         uCedl5110SG5XOJoBA6RkSpMrCSRK4Ra6lxqosTj0dwtbm+vIy7Mrwrt9cFY564b+OB4
         8rAkv9EeJMjNoyxX778tzQLqwiwBE257vrPfIgIYNL49F3zjtirXrZnd4AJAgT2v0W0b
         qC+yLpekqVhHSCCGVP+TmbGSysjLNPFWT7SOeVslfpR7xYHhxrWPtAWMcnB/5ysujaOH
         jpMPeEf+GvqXKao87xMO+lx/gg/UPLF1ckdEcZv7gbJAVM0XLlFVojLVbBQelFlJ/x9H
         K4pg==
X-Forwarded-Encrypted: i=1; AJvYcCXW1xVTz27808mx0eHtcwRs+wb+34NsJOd/j+/jyvfQOBHvIfDo8/GAiWZxRBT9yqORwXqChFKe4jOQLyc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1uCtp3kHvxvc9mJxmyLjwcZyGZS6RmOlAtph5u3xPO4T//bi8
	1Ir0l3eB15UNK7Cb5t+axnglRcwTYGepTxq7CPBAeHqaBcmKYefOJndxSZhTMof753rfaXegSPO
	6aC2pNlFGpW2E7Y3Sp2b4wJ/XZOnROv7WHWbv7h/DRddg4fvR5FVrxr/STVyf8ug=
X-Gm-Gg: ASbGncvGtA6+BiI6uNsQ8+QU27m9ZUpTUSVc7bsW0YwFseGzioZMwsmfm9qTJ7PXz+m
	loBQHYsIB7q2frXMIJ0Wb4LXi5T4plz/jRYwbQDu6trF7tykVQ/iAyJWWyJhpBZ8Ex4Ldua5QzY
	3E0KgflQLS22e/j97WVxU7k9DTPQRazuGo/mCA0LlA2PP6YSuSMZQgg8NDjLfgJ2L3Uddlb6VUr
	Kp+dVbl0rgbcQKDdQsS6RtfeWpX/v7jtu1mJl8KvDzhqdsyE/rTx2Lg8NJGCwI4ukDE9eq+Ud5s
	bk9RP88CVTLkP7zHkVcq/KkeIkUlGgjQmjD1VV4HqBNU7D54YV1VZjNSQoYrOs2CLlw=
X-Received: by 2002:ac8:7e96:0:b0:472:6bd:f620 with SMTP id d75a77b69052e-4797753cf0bmr78171431cf.5.1744710265931;
        Tue, 15 Apr 2025 02:44:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEJjjs62RJ3mQbU5ZqHBwBsMfWuvAGXOnlnbzwKsb07Asi8nZzrMPgemoIu+Bz/6N9J+heGTQ==
X-Received: by 2002:ac8:7e96:0:b0:472:6bd:f620 with SMTP id d75a77b69052e-4797753cf0bmr78171241cf.5.1744710265610;
        Tue, 15 Apr 2025 02:44:25 -0700 (PDT)
Received: from [192.168.65.246] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f36f06c5desm6431552a12.48.2025.04.15.02.44.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Apr 2025 02:44:24 -0700 (PDT)
Message-ID: <96e38ebb-5847-485a-8bf6-50e7b10ce572@oss.qualcomm.com>
Date: Tue, 15 Apr 2025 11:44:19 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 10/10] arm64: dts: qcom: sar2130p: add display nodes
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
 <20250415-sar2130p-display-v3-10-62314b1c9023@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250415-sar2130p-display-v3-10-62314b1c9023@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: hODWsAm1JdcT3JNeFxp_A40OCfmaynmP
X-Authority-Analysis: v=2.4 cv=JNc7s9Kb c=1 sm=1 tr=0 ts=67fe2a7a cx=c_pps a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=RooFfVGkvEW2JHd4kGkA:9
 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: hODWsAm1JdcT3JNeFxp_A40OCfmaynmP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-15_04,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 malwarescore=0
 suspectscore=0 mlxlogscore=957 lowpriorityscore=0 bulkscore=0
 impostorscore=0 clxscore=1015 phishscore=0 adultscore=0 priorityscore=1501
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504150067

On 4/15/25 11:39 AM, Dmitry Baryshkov wrote:
> From: Dmitry Baryshkov <lumag@kernel.org>
> 
> Add display controller, two DSI hosts, two DSI PHYs and a single DP
> controller. Link DP to the QMP Combo PHY.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

[...]

> +			interconnects = <&mmss_noc MASTER_MDP QCOM_ICC_TAG_ACTIVE_ONLY
> +					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ACTIVE_ONLY>,
> +					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
> +					 &config_noc SLAVE_DISPLAY_CFG QCOM_ICC_TAG_ACTIVE_ONLY>;
> +			interconnect-names = "mdp0-mem", "cpu-cfg";

The first path should be always on, so that if CPUSS collapses,
the display may stay on

other than that

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
