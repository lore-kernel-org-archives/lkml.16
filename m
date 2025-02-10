Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D3172586E4
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 16:46:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739205997; cv=none; b=sMXhAXXqwXHQTYDFLi+bG0m7ahDE5AnSn+WcWChke+pRGaZy6orwADQbK4W5K4imnuvFWDkhbWU2oXfzD5UxCzZtFMd7kuaSZfyoYUf4UWzApL134KXq/n/x2iQ9AE3nFuAltnz1/xsBhSItcVx1jsmdrJvD0cA+nZrec3nASlA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739205997; c=relaxed/simple;
	bh=rKZw9/AKjfdQiq23x4NLYpX5kYPR93R2a5K51O1yLjg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BwINPnrftCIwbxr271EzDQtRLR0HsVN93XO1Jwdu6jcC+J6k1DKquqqXyP0/kGDTb/MUqerEn2mPnLKBPTa/PH5uexj3rUJ9XvctWsHCJ4EsppIxvx6oxCXvD03ujsTfIInSj/5fP0V5PUgBDyQ0uNVysfyYCBzgnj1w2NCHM6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JWbBk9pb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JWbBk9pb"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51A9tUcI032632
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 16:46:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Y02jPbtLlP48pca9Ds9PgtZCslYqg667QI/2JrWgP0M=; b=JWbBk9pbvszFDg0U
	UJ82sgOtdmTdFLPJpoAyCry5hPN3ORtxq0IagFpOuZCxPiwKKrN/9IopwiZGPQ48
	oxY85SmdYEbtlNq1ajb7ZoGq1Z9kRq2RYghxPXny/dyGITibFm3tyPsk4uGG5vbA
	yzLP540xJCB4vXBvrzM2t6BktakjG+Reo6dhOufBDvTr4ZCpFVvh54Z7Qj6rKDR4
	ymdNMxnc5523e+uLQio8ssmAizTJzBPbUFTYK/0SEPtkVaSErURwym9IfbcOmIRW
	vKHf8mYDwrUgjEDCKy33HMFsn/WmA1x9oanKXSUlJoe1qdKMgz9D110owJ20Uo6X
	Hua5oA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44p0dxn0gk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 16:46:34 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-47195dd8af0so2382431cf.1
        for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 08:46:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739205993; x=1739810793;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Y02jPbtLlP48pca9Ds9PgtZCslYqg667QI/2JrWgP0M=;
        b=PkWihhCVWaukvWQc1oKtIRmYyc3xcW8xtAQsNgN1RuI3EFw7W7O8SZr5xXNn/qiolQ
         xldRfTk740AKyMxtKwRdIu5aQ4NYW6Jal+a713KWYASN9PyshyfDpaCuMmv5e5W61bYN
         vp9Kb8PrvO49h8CJy/rVBOQCtzEPRad2N+UoN+bmWNskRJJSBuim1IkYiqcpNGfsB2Ni
         RsKO0QnY0BPPXkuDWGX+tEWBPGcfiTLjgpbsF6bJWhFr27aZhzpc17IlXCR6YDpnxFGh
         +W3J/uLDlntjJnPmfYT+S+7vwt74xYQW2xMLmQr2ikrgTq/vJEhhsIIxKih3Y3ywN29Q
         pRng==
X-Forwarded-Encrypted: i=1; AJvYcCUyhgdtrLZVWfTaDvhupTeDZzIkXL+lpn+FhPatEhn8ZTg/TWlqeG+FCPaXZJLMStV2q9AZEp/j4ovf9QE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzqVOtIbLaq67anzXmMBHNO3QzWJ2pOEpllEKSH6jBHdzJBS1vz
	nfQdBrvDZRn5CHhoH+kaX7lcqzNTE3SZp8/OPPOygJe9PY3cg1hcx/uad9Gy/7AyUyN4NjpJrD6
	VnuNqE91iUrc+VtjzPcm8R6FoJo84ujl0GNSAAf+kDHec6kCw6EiO/+/oA3/q93A=
X-Gm-Gg: ASbGnctl/TxaMRZKYclcqGQOkC4lI2oI+QMt8rc7qYsui39qpW+Lx4vfZtKAlr4rioT
	eEJS0/4jJneYYVxLRoNcStEpYGcBRUTWbEhUliaR3+uIpwDxZ2UfzJnXh4kN4wIVuD3dVEgmcyA
	vwQNGvI83haesbvkvyrtp/2GuijTAUT1BgLr3Psfpzwe4yh+jB9D9GbNAbvXt0qyTeQBpaisXsx
	tN1qcdisgLBi603FM+hXVoPX5dgKV8crF9Q9+Nj6AZruut//H8iJB0jTrl8oincH4lmK5q+UNTz
	/iWIyShsOyRE96XiDRFRHW5jPhB2q949itXg3KOCBnVeUcz1nxeCtjF6aWg=
X-Received: by 2002:a05:622a:60d:b0:471:98d7:6f47 with SMTP id d75a77b69052e-47198d77128mr15699851cf.13.1739205993249;
        Mon, 10 Feb 2025 08:46:33 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGQv3ndFWNiqtnFsxi5Czn9IPWmkOJNsq8JxW9IbnF/jsyhP6VDiNCnxRnuxRJAlSvYtv5woQ==
X-Received: by 2002:a05:622a:60d:b0:471:98d7:6f47 with SMTP id d75a77b69052e-47198d77128mr15699571cf.13.1739205992922;
        Mon, 10 Feb 2025 08:46:32 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab7809a2ec4sm829406966b.116.2025.02.10.08.46.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Feb 2025 08:46:32 -0800 (PST)
Message-ID: <45a83048-24cd-4895-93b7-7f8b22841ccc@oss.qualcomm.com>
Date: Mon, 10 Feb 2025 17:46:29 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/4] arm64: dts: qcom: x1e80100: Add PCIe lane
 equalization preset properties
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>, Jingoo Han <jingoohan1@gmail.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        quic_mrana@quicinc.com, quic_vbadigan@quicinc.com
References: <20250210-preset_v6-v6-0-cbd837d0028d@oss.qualcomm.com>
 <20250210-preset_v6-v6-1-cbd837d0028d@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250210-preset_v6-v6-1-cbd837d0028d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: negSfrIsA50zEsGR013nohrT6Hexy58c
X-Proofpoint-ORIG-GUID: negSfrIsA50zEsGR013nohrT6Hexy58c
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-10_09,2025-02-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 mlxscore=0 phishscore=0
 suspectscore=0 mlxlogscore=745 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2501170000 definitions=main-2502100138

On 10.02.2025 8:30 AM, Krishna Chaitanya Chundru wrote:
> Add PCIe lane equalization preset properties for 8 GT/s and 16 GT/s data
> rates used in lane equalization procedure.
> 
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> ---
> This patch depends on the this dt binding pull request which got recently
> merged: https://github.com/devicetree-org/dt-schema/pull/146
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
