Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 889141EDA33
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 16:46:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744303612; cv=none; b=eOrHPONPak+x3fo5IK8ktllb2lLo1CjnZDbIwXCURtum5BYB0Oh21K/NQMgQXbefF23x+YpfZYb5tMdhQ1kZrRsnmXpCq3+rzhveyetWjZce1ToS1oZxK+JjKPngiRMUlP37rIFZcqVNu8ZxKoc2K7V5sZNsJnhG0eUpJNasHxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744303612; c=relaxed/simple;
	bh=1whnK0RXtBM6KIeYTYhDlzK1c2tKEOmoGtHWTxbpFlM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nFYXDPU4eunpGtx8HXXvNXhnJj57ZZxpFza69AvA74TTcDftnedI6Z0wcTkvp3jpJxk2TEsxdKeWUXslbVj7TsiquxqOdOB7cKEYTHutm5RuKjdmfNi875ZGwOCXa8+fLO9J18ZOSFJaq7AlPvN1bXuklSAV1iS37zDNwn9yx3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YLPAzysG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YLPAzysG"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53AFi905018361
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 16:46:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2ub73rb0tKiYXEVF1fn4pLwpVeT2/UDPkxbNPlc0xM8=; b=YLPAzysGRL/LzQcd
	/EK/ctqCkds/E5/cKvd2gcBGpZqyBgLX8oMsbSoDJGHIw54fQwY43462MO+khCN0
	V5f94htgJ3AtTpn+0yfaFWSZZ9ILyOXc4lJDZKikNYyDYNlJkxGnKciXUUcJXBtk
	R7V0JybexaufUtTuY7n8WQRRUull5/xQY+LoKiBXVHBQxUrXvmAD+WlhKTTt9SE/
	nj0szlNFy/CLWY8D+nUUgJ9EOTU7iBD90IFoU4ax5qpp5LgHejf+NwGqtnzlGkzU
	864BQryCqP5FjLpU5jjKR0o2KJfbk+7MprunrVPGYExVMgUiG//zfJzyPbWwewNX
	VXJmkA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twtb7qda-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 16:46:50 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c547ab8273so12100985a.3
        for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 09:46:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744303609; x=1744908409;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2ub73rb0tKiYXEVF1fn4pLwpVeT2/UDPkxbNPlc0xM8=;
        b=LLSALkSAAnjClWYkKWqraTP3MVNodJh8S2IjzYrRKnuRp5djZym6Apif3l4j1lhEt7
         v3esizuROSkllzLfqxTMv14xjMTRj9XSjCSCR7hc6oD9Ryrt/yP8F8HlfG8V3O5nv/uZ
         0WmDTvwtIaDisWBLzjWd3Cyz4lP3JI3Ndt9m22IbwcD7HxW/ROesKMogTHs7U39Pzspi
         5fr9TMZyqn9hPHPZ6hXaDfgNiR+1aaaBCDOWuOVv4/rTnOVUlLGxGAPEpwaZvAFA3c3K
         siKowuG7nejoOCNd/PCTXZOE2AP7XK5xnGTXfdGhS5lRX2CWg9gyKG9eTAVh7CGVvBkP
         OS+A==
X-Forwarded-Encrypted: i=1; AJvYcCUf6q0jHAM1OBJt2jeFJzdjwRanrOpghDz6cBuWgCRmWECiP5fzqMPXgOal4bYSjK5eFTwzHBk1fnLzkkw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyP2Mc1JHdXZlv6HUYUFp3+6NFh73D6/kjiipfNCkmZIpJKyj22
	ive6U+AA1I91jBVZepkPwnKc7TazmoRexMSehkRySKjX0MrW2qlIOMNVtr3OnRsUWD4HIQnLybM
	NlllTUPw5H7etbrC6zr3Fmr53a/HPDDRbCqmKEl7kS6xpmaNTG2y/bi1iHiNYkH4=
X-Gm-Gg: ASbGncufiq5r2rKHkfEeAMAIjOqQuAsOqN1YKwGRUoqdfHlMd7tdmsgZWlSyndo9Azj
	rrWD1TblK2cCFxKkRIEcN+U+K1t8mzrxWUieKnJDm6JaPfuNfdWtkmt+OUCBkWO8ZfIkhV9jPDt
	w/ljrlQ3iY0zIzBzJ292QNh/0ISpagB4gokcauSIsthQAL4qWdBYpi7Vr2HflSUb7Btdh9r3WVV
	ysMKdQmSR+iYqAmuAGzN8cIDNluY6LKMDgrm1MrclVIBN07zhmpFe3TaQcZwM4cMhxzT5kI0kkd
	Gy4QNKv2nYAPpB9H4fwFJpw9+qEAFnG6UEtfxCldwV5/ai+m2Kts5izUHPBk+nKiiQ==
X-Received: by 2002:a05:620a:2616:b0:7c0:add8:1736 with SMTP id af79cd13be357-7c79cc4b3f1mr410540385a.13.1744303608866;
        Thu, 10 Apr 2025 09:46:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGhx7fvmIGsvkt134akNFU4Xdrd+H0ye2/xPZRY13mPU28B2vH5WU3f5AyiCCptCcnWgqRroQ==
X-Received: by 2002:a05:620a:2616:b0:7c0:add8:1736 with SMTP id af79cd13be357-7c79cc4b3f1mr410538785a.13.1744303608532;
        Thu, 10 Apr 2025 09:46:48 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1bb3002sm301930266b.7.2025.04.10.09.46.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Apr 2025 09:46:47 -0700 (PDT)
Message-ID: <8683db7a-31d9-4aa4-abb4-6aceb17a82eb@oss.qualcomm.com>
Date: Thu, 10 Apr 2025 18:46:44 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] arm64: dts: qcom: Update IPQ5424 xo_board to use
 fixed factor clock
To: Luo Jie <quic_luoj@quicinc.com>, Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        quic_kkumarcs@quicinc.com, quic_suruchia@quicinc.com,
        quic_pavir@quicinc.com, quic_linchen@quicinc.com,
        quic_leiwei@quicinc.com
References: <20250321-qcom_ipq5424_cmnpll-v1-0-3ea8e5262da4@quicinc.com>
 <20250321-qcom_ipq5424_cmnpll-v1-4-3ea8e5262da4@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250321-qcom_ipq5424_cmnpll-v1-4-3ea8e5262da4@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: RdRLthRMxhOkdVeKfekgFH98WvYrxMRU
X-Authority-Analysis: v=2.4 cv=LLlmQIW9 c=1 sm=1 tr=0 ts=67f7f5fa cx=c_pps a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=GWuxTXlZ3gkwJQPeiGwA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: RdRLthRMxhOkdVeKfekgFH98WvYrxMRU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-10_04,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 bulkscore=0
 clxscore=1015 mlxlogscore=934 malwarescore=0 phishscore=0
 lowpriorityscore=0 priorityscore=1501 mlxscore=0 spamscore=0 adultscore=0
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504100122

On 3/21/25 1:49 PM, Luo Jie wrote:
> xo_board is fixed to 24 MHZ, which is routed from WiFi output clock
> 48 MHZ (also being the reference clock of CMN PLL) divided 2 by
> analog block routing channel.
> 
> Signed-off-by: Luo Jie <quic_luoj@quicinc.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
