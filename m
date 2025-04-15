Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFC60297A74
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 10:47:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744714068; cv=none; b=jk6TL+tjDvlTwqqLRn/BoP8Y8uZSUZ2OxGMXiIQhY+gTfyROy8F2O5N7rpC3LjcTW7aCXlK15L0NT2AnM6TJnrzVJUK3MoVwl6D5aZz6rlf3fKDjcSjBlxqkjXOsLtUtcjK9OZ9d+momZmZrWutBlXoFtYioaRhwnft8iBnLLlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744714068; c=relaxed/simple;
	bh=0LEnKeuoJmhEiQP1Qg6HuMLQvWZg8sLSX2wfLEdLIDQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sznyI+5McIJd3ZGfqU5qzmZu8Jsr45M7FOohqnjYfHPbydBli94tcE4IlVLIaCPid77Wd7uiHjh0hXaJ9T2C8caF+ts2xnmmI3qoTRUvkWquuifwLgSzXDy+guS/meVr3bpEIivlLPDHKlSV72gZGjKLSdshyEwcEesS+CJ0ynI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VhRSWLqW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VhRSWLqW"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53F8tGF8023094
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 10:47:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NVoKFr3j9LUHGKgglF2+6o+zU2ehLL20G1TS01r2k6I=; b=VhRSWLqWLI4+8j+p
	RbBCYYUFZVzezFDhaDWIZ0E9x2P2eImR83kbIB74OKzT4vq66SNj+EGb8lvPaYhC
	wYaOHqJ7k5GF+AUAxVZhs7HLBvEPvawOHJfPlFHRPDSek/VfeMYNeREfOeAoUyLH
	O0UxyYxZ8J+9qY3uREfbwrJDnNF+Gi1fQxynDTFJsLfiIOFRI7hBN+bYUqdez8gG
	n4krgZfULGshF01FjYhfvWg+aAIRFh2FRTfztN2fX6djaSFKlxNDCXbEwnknjtg9
	wieBlaTm1VQsYr8l3AIE3x5jw4g3m/46E9/dvS9btQy0RTuHuFW/7EbFbgYF8u5D
	rgADVw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ygj97qg7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 10:47:45 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6ece59c3108so11946706d6.2
        for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 03:47:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744714065; x=1745318865;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NVoKFr3j9LUHGKgglF2+6o+zU2ehLL20G1TS01r2k6I=;
        b=b1AgiAr3PHvePU8WTpGFDwYQFFx+p8Xl2BSOcs7jOVdsOfLW0ql6OgaR4O2k74KUTn
         Wo/fXRyXykdhRbpa7JTzap3FUbRTyspD6VkCHDdLwRMKsUIf709p3Q/fOhglXBZT9Oke
         uvKwC51T/CPRU/+vhVMQ0Ce+pIkMwLkjzqOdBemIK1OJnODm65ufXCgYsLmNrxO8IC2u
         acZ1ILqgkthYgLJttirATs3LUoFYZGUXcSlcJ3o9H9VOvJKBJmDz5b0Gmh6tv/Z5QN2o
         +a1pbthMI5Lf6cnnPRWH5c4TCC9ZSIz+vf2ObuGp6aRpC1PRyp+OD3TihuwA++QSvgua
         rRfA==
X-Forwarded-Encrypted: i=1; AJvYcCXl84hTjtMFSYt3Je/0VEGX+zyr8f1hZsJcm4f6j8ShhtGYpTlMnYmtPoNE6qrBmtnTUsC1YKF99lX8nQE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzMnO5SwKCOFDF1UG8J8wjuFmHVSVSY3mB3xCX+nW4JZ46RQrb8
	H/0y41+kwLJKTxdDCqXfgybyto1+L9DDK09f7Wuoj7LWznCk1SdtiGFtu30yNPS1t/e5GmqXJNC
	7IfuNYgGkPSCu1o8pNjKvcNnlN9O8Bhs1wwDeKc/Un0kE8dOtAj+IWKEKpeaE+X4=
X-Gm-Gg: ASbGncuL2ig2uAyIe9USXfWgrySsPoLP4kxmuq4h3p1AQfwym3dgMfbE0qvlRzMbDE6
	iQYScdRjP7LWa4XaoniCaY9JZHlkBrNWEVc6IJOikaycCBS+7oiMnNc2Nwx5hJBMReo+v8BxC5w
	tLu1WKM/938PxZKOH4WTD0tMFx4Ca/vTQ0eaIKn8WfgumCbWNrKpb/7linRuFDYt5vA0Vgqvcbq
	M46qZigb3+I+u2M76teYeQK9lgREMDfD3IdIxMJai/lsprK/KB97C3Vye1RVL+OSRDRM2FnWKpZ
	pMWDYQiQTKstjFjDNNP7Gh8PpbM+/ib1fwyyX+ry3YNp8fyGSa/t+8mlkC045f30MlQ=
X-Received: by 2002:a05:620a:2806:b0:7c0:c42a:707d with SMTP id af79cd13be357-7c7af1d0604mr773125885a.15.1744714064918;
        Tue, 15 Apr 2025 03:47:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE4DxmKbyWtWQ/c0e5VpEfiZYpBlXbrFf7bGjvy3DgpKlGDGxJJDkKDIv2ua9Cf+gkOsSSNfg==
X-Received: by 2002:a05:620a:2806:b0:7c0:c42a:707d with SMTP id af79cd13be357-7c7af1d0604mr773124985a.15.1744714064590;
        Tue, 15 Apr 2025 03:47:44 -0700 (PDT)
Received: from [192.168.65.246] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1ccc001sm1058955266b.126.2025.04.15.03.47.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Apr 2025 03:47:44 -0700 (PDT)
Message-ID: <931366c2-ad47-4552-a4c9-cbe35011817c@oss.qualcomm.com>
Date: Tue, 15 Apr 2025 12:47:42 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/20] arm64: dts: qcom: sdm670: use correct size for VBIF
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
 <20250415-drm-msm-dts-fixes-v1-10-90cd91bdd138@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250415-drm-msm-dts-fixes-v1-10-90cd91bdd138@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: nQ3IGyy0cYm6J5N-_qHswDN98p0kPQ9k
X-Authority-Analysis: v=2.4 cv=PruTbxM3 c=1 sm=1 tr=0 ts=67fe3951 cx=c_pps a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=da4WsfccAxvekxWPt1gA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: nQ3IGyy0cYm6J5N-_qHswDN98p0kPQ9k
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-15_05,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 bulkscore=0
 priorityscore=1501 malwarescore=0 adultscore=0 lowpriorityscore=0
 impostorscore=0 clxscore=1015 spamscore=0 mlxscore=0 mlxlogscore=645
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
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
