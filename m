Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD0F5204F92
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 16:05:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743523519; cv=none; b=uQwq86W9xcfv3/heFN+wnRMohQcvXtNr9ru+RVP64wpu2y3DucFgRJtKfwsorrLvHy44pkJac1pkIlXeXvzRYs/TQbUfAVLRKW1vDXWK1IpFQlnDpYWVgxQx0x0zcxMIexctMSE3SJNXaLdVuw71oHw7S98xn5gufn83Mh3BN9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743523519; c=relaxed/simple;
	bh=FjnK+VEJGfvJo2g6Farn5qlcut5gatkOJIBcUkNGPt8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qQhcq/gedF2nBXvgjn4pHFV4zo8CrbThCp83rHTKkZImkcuiui0O/sAVX4EVzzauIcQ0fV4eUxQf/XjnxNF8ivpG64xaH70fRCfQ4iI16HjaDxOMnNMLl4loiWnSa2O4gDyldbbaNU003lmUIDSOgmQaGr8XjQTH4qSmwoASLYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BuYESY4U; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BuYESY4U"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 531BtT0p025093
	for <linux-kernel@vger.kernel.org>; Tue, 1 Apr 2025 16:05:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IA7B/oT79HtilXDgO/qFvO0UXqMPEVdc96N5gfIs+dU=; b=BuYESY4UeUswyQ9l
	yzKGjTCNJNUJtf2adScTPKZkkPChjemJKc+J02JpFkaQ3IEZ4fYX7Z/kTercoNfC
	B5wzIsfwpmf24rY/32JbZmZ/dx4LH3KaqQY1ELnoPD9Qr/5I0YUWLbNTCx8DYGSG
	j5KmYsC2VXeVxMMQ49pNf92vW3ljOL9T/BAwADo2A2Wqt0Q1g5gPT0KzkV9VVFvd
	M0oiOmjTFQ7DdrSKy/2VxL73ShWip+vcwDoMM+YmS/ozgIwsPZKyaxoGm75m5V/2
	AVOFXxzm/hEsQWfk43pXGF4PKDRgJSWFTgyYrbmpjcUX8IWP+vCiY0Um79BGrgQB
	etnKgQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45p86krndc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 01 Apr 2025 16:05:16 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c5560e0893so18259085a.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Apr 2025 09:05:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743523515; x=1744128315;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IA7B/oT79HtilXDgO/qFvO0UXqMPEVdc96N5gfIs+dU=;
        b=MiSBaWteNvYiNYuFKdY4To52nzECL3pkGEi0rpU5TezDSymT+v8H/WfyO5ViexvsIG
         36gC9NnOOeaFbasXeGW7KBteGkiXbl/hELgMjBAXcOrrPmbpEAm6Hjxzq6HS1dmRKDIU
         c/5p4mViy5stxB/8cvyhTzJhZ7hY20uvebIzvusdHWF4TaVITvZfYkIrnQ9LYuNKF4UX
         TmEA3TJKBakYb2EJ9maAkKSvx2YoFbOLruHQe+T4cyaKix9h0mP+OAwO2L2BggEA/ZpR
         kkAIPWgDvYJhByOaKTqkIIC5JCd9C2YcVP0ZFXVWGWUJeMMT+BVg7bUSHalAbdwJ+4JS
         eOWw==
X-Forwarded-Encrypted: i=1; AJvYcCVfEq8NHxzCi2hM0dUN6oJ5A+He/Z6dXELlwGYhenitWc1X/J1OqRuTIFMYGcMIRGqDcS894LtHVKMJ7Ls=@vger.kernel.org
X-Gm-Message-State: AOJu0YyqJZJGr0APhrKIFBumjQ5JScG9F/VI0bytVBfIvM0/rZh9cKg/
	d6qTMTABsH0qTEhxmbqhtxRt2MaWB501rLyg5TMkouGzhoZaWaq/vpzsmq7iMQ9QGN+aRBbq01J
	n8it6BpROaQsnBsPwOZiHxPT9mN0py8IiDGxvolVjfAiSdb4XoASLMvqgTuPGoIQ=
X-Gm-Gg: ASbGnctwzsC/q6+YbaHzpGVRmAzECj2agxy1A/aMhEsAs6sQKEvVWeu7vOyYcmpGcB4
	9u5lclZEwmAuXMp4MKGAGIOJ6+1CtjSF/p8WRk1pbtuJJ0nvwND2Dal8IK0F5NxvDcy7JSTuOQm
	UmA9kW7CdT+roxZm3m5e7iKc1NtlSx6VdTMMD6XVJwo8OxQ6cGf9U3qgX1vVBDx6WiM185MVOFv
	Co/mJhV95Fxt4tCHa+MDx4Id05MQDUcxkk96siTcfljdZR1LFkYOtE+cgU9YB5/wRUjWO0Q8gYx
	X1I6YnkUkrVuqC4/h+wUydoIjjigB8tyF/BkU4RleTvaIs1QfBewplzHzAqjX8da1ETC4Q==
X-Received: by 2002:a05:620a:bcb:b0:7c5:687f:d79d with SMTP id af79cd13be357-7c75cb073f4mr153744585a.8.1743523515586;
        Tue, 01 Apr 2025 09:05:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEscuFyFWFsirTv68brZWR1bZi8v2Jm9WWhZ+Cb63yKIJveWTii0me3gZoTfLF/2PEkywgG9A==
X-Received: by 2002:a05:620a:bcb:b0:7c5:687f:d79d with SMTP id af79cd13be357-7c75cb073f4mr153742285a.8.1743523515228;
        Tue, 01 Apr 2025 09:05:15 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac7196f55f9sm789484066b.177.2025.04.01.09.05.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Apr 2025 09:05:14 -0700 (PDT)
Message-ID: <4c27d6b9-781b-4106-8165-97c9750cf99f@oss.qualcomm.com>
Date: Tue, 1 Apr 2025 18:05:12 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/8] arm64: dts: qcom: qcs6490-rb3gen2: Modify WSA and
 VA macro clock nodes for audioreach solution
To: Prasad Kumpatla <quic_pkumpatl@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@oss.qualcomm.com, Mohammad Rafi Shaik <quic_mohs@quicinc.com>
References: <20250317054151.6095-1-quic_pkumpatl@quicinc.com>
 <20250317054151.6095-4-quic_pkumpatl@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250317054151.6095-4-quic_pkumpatl@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=W8g4VQWk c=1 sm=1 tr=0 ts=67ec0ebc cx=c_pps a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=jFJkBKkQciev3rdfaj8A:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: Jnj1MTH4CmWNLzsr2uQDYQEKVMtpTonJ
X-Proofpoint-ORIG-GUID: Jnj1MTH4CmWNLzsr2uQDYQEKVMtpTonJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-01_06,2025-04-01_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 suspectscore=0
 mlxlogscore=870 mlxscore=0 clxscore=1015 malwarescore=0 adultscore=0
 phishscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2504010099

On 3/17/25 6:41 AM, Prasad Kumpatla wrote:
> From: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
> 
> Modify and enable WSA, VA and lpass_tlmm clock properties.
> For audioreach solution mclk, npl and fsgen clocks
> are enabled through the q6prm clock driver.
> 
> Signed-off-by: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
> Co-developed-by: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
> Signed-off-by: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
> ---

Instead, put the inverse changes in sc7280-chrome-common.dtsi please

Konrad
