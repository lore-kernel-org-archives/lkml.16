Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DE2B25A621
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 10:30:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746009015; cv=none; b=tzgKkKu8aSiHdTmbPbpQWjsu88YXR5yuEpMxDadxbcT8jZgLt5waYrvsPv6SEw0hEv4fXTDYx+9Uir5KYN404LHRI+VhLXeCE/zGf3Nra7ZNTuR7mlpbGZ5M/UU42ys7iDjLUMvOU4zkKC6ZlgTsyDfnXgopghnMAuwfFJ2+MMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746009015; c=relaxed/simple;
	bh=1Q2QXKXdAqsuyBrrruUAb/meNWYdaQZckDHeqG5YaDU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DPZn8Em2k9RUUDd5rCrbY3Kp9Q/4TRduelm70SaGNUgzHvMx5PauVhFnL1MULAqrtkNyES6izQOFLwCMOhOXeXdTK8LCTmviKtyA/qItRQPOZarHXMUgJFhf2h+//ZWPKky5e0RO04M9FM58ySQIpzEGndrffYRFXz59XLZraKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iM4E/UQS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iM4E/UQS"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53U9JxQ7017448
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 10:30:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4dMEDitlwliRXG+C7lDQReeUjMvhJGh+ywOSS2cE1yI=; b=iM4E/UQS/KtzSS/x
	SNEBJUQZCYLdSbL+r6w4OmeuO/tsWg85XMKWTJ1Cu9C7v9mMRp2Llw+UpfEtgI1M
	laid5A33cbbFEmqupnRbfVAywzml/Xichfm18kL6J7E5brVhvZtS5/G6G6QsAChG
	Ki7Lnxm4d7CDIXGGc8Fp5SCOCHFThyzJtFpCU7BP9m752hN7ayMB5lXZZtbGRe2K
	CMu2azS1sj9o2y2/9uPI21IxsZeXqZ6vaFVw7ExrtY1W9sbLsh05uYXxlCfI/X+V
	Sk0/C2cysih+EkpqlHpeGmbwYPlVM7+daW120GqDqm6rlfcqCsmIlhOqSe7S3h3Y
	h7kfpg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46b6ua9r4k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 10:30:12 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-476783cbdb8so15388481cf.1
        for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 03:30:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746009011; x=1746613811;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4dMEDitlwliRXG+C7lDQReeUjMvhJGh+ywOSS2cE1yI=;
        b=wej1h4mos6+PEhqJ6+sWdAPZjkbninSM+X9CcggC92HXAx+/XV8ENED+6J7mpQDu+c
         t8Q++CJnx53HtbuGQuE+L7EtlbpKO6gwoJqva3RHPffI665cPyQEJjVHXHXv8WDvBct5
         svAbleSqucqAiKRBXSKK0IAArftTXlMMWjCnB73exWICIF4nfhwJhI59OrCLS5SPYsR+
         SbaGR54OaAFWMc5zWuU/HwBsocxEWWUKj56XHvM1B5hmMqmMEhZdnT/cU670gsaMs4Rk
         dBkwg2Kcnf9UpEIycPyGlXVTP9DOeYvZLUxK3aKL4Dvw45yTTbFbCUDxr/YlVZZM2zzy
         kXzg==
X-Forwarded-Encrypted: i=1; AJvYcCWYMCkXQ3JWinonLqrXn4OAPi2ZhJQQPNnwTHvtR0a2roaI2RVY9nFT+ZTXl4omPzjjAthk4m3whRSUPtU=@vger.kernel.org
X-Gm-Message-State: AOJu0YypPtHM/DzbfbRnXJKBDba0Cz24Vf9h8tLT2HWd5AyH0p29LSem
	JHfPJ+PCWWwYV7Sdei/SV+S13x3SzeGb8jrbnLnMDQQGVhGc4u4yJERxuBuYKJnH0qr2vl2T78i
	AKyNoI/Dc1lCM2P/ec9srYyNQxM8+KVCSX6o5HnCgOFXCHW6ZAd+XSiF2+DOFAKc=
X-Gm-Gg: ASbGncsrF7VxC/7wBKo8WhnCvX8P/cMYzDAiwAzIBOehFDO3jfllxBQgFmO8bk0sxCZ
	oFPA+UyD6ZGkjw1alTaRBLfxSFib0riKOOgL0JTwPs8uWkg9ABvMIr9viGVqRk8DgE9Cc8/H4ZQ
	dEXU0nACL9Jy3z91n6R+nf5Go4is8SqL+f5La0kbEIEPN3QhN68WzKFVBBiZF2O0Rw1ouWwOI41
	H1Ew2xFpLlwZV5lVM2DnVvOrsmOEjoIgYZFF60aHdVfSkFsHVkxBHZFM2MvQwq9TXGUozkjNFsm
	lH4gBcu7UJt6i3LDwxMGC7sfMKPhu/H4pCaWiNflLVJTzlc5RxDutdNkXo84Cmg0hh0=
X-Received: by 2002:ac8:7f8f:0:b0:472:165e:91db with SMTP id d75a77b69052e-489e498d781mr11827761cf.4.1746009011532;
        Wed, 30 Apr 2025 03:30:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE7lXha6b1LXm4abb6t1fB1qndIV4/7aB6CwAhaxwGXUOPktd72Ez4ObW6QEnJdW84G7irwCg==
X-Received: by 2002:ac8:7f8f:0:b0:472:165e:91db with SMTP id d75a77b69052e-489e498d781mr11827621cf.4.1746009011151;
        Wed, 30 Apr 2025 03:30:11 -0700 (PDT)
Received: from [192.168.65.132] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acecf27a79esm205373466b.24.2025.04.30.03.30.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Apr 2025 03:30:10 -0700 (PDT)
Message-ID: <8ec19cb6-bf74-452a-8a82-285b2acd90ed@oss.qualcomm.com>
Date: Wed, 30 Apr 2025 12:30:08 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC/WIP v2 4/9] arm64: dts: qcom: sa8775p: Add support for
 camss
To: Vikram Sharma <quic_vikramsa@quicinc.com>, rfoss@kernel.org,
        todor.too@gmail.com, bryan.odonoghue@linaro.org, mchehab@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org, hverkuil-cisco@xs4all.nl,
        cros-qcom-dts-watchers@chromium.org, catalin.marinas@arm.com,
        will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Suresh Vankadara <quic_svankada@quicinc.com>
References: <20250427070135.884623-1-quic_vikramsa@quicinc.com>
 <20250427070135.884623-5-quic_vikramsa@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250427070135.884623-5-quic_vikramsa@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=BNizrEQG c=1 sm=1 tr=0 ts=6811fbb4 cx=c_pps a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=J3B29TH01z4cvqQAex8A:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDMwMDA3MyBTYWx0ZWRfXxbdVMOb4eEQs qL0pVefy2ii9o/p8gdc0VwI9VL51/xXl0445bh+jPh0wQ6diC+iYuvG83JZE6WXfum3EwqQ2vvy tMub40tnbx1okDpjMv0Pcs7a4Y4cEhJYq7Zeo54ihZriRd6MzG0lgFnQctzrAWKNWyDecNYEtET
 bUUw+0wjyXn6s/iRDtL5QGG3WB96M2nebtLsHRYSxX3XWgmGZkHdAspho60VYs7iQk+w1FdVEnr haTZuXsKGQAm5eXEtbCoNoq48r/oGnqNirfIbsVq09DMqkOhBWi9yoxctWInxYl4joQ6WFWnqmO hsqtEJFYGrprBUw6P3LjBjaXYkaevLEgG0Pce/m0e0uOVRsOjWivoWJIg1rRq7/l1Y/uQX5e2p3
 KeIuyPfSIVqRbuLJSM757VTqcXCJyLj8QnnUZ/9lS9vndWu7CEw65P9GFpuCD8z5BDGwU+/r
X-Proofpoint-GUID: OyMvVSg04XiKwgeK9QGkRFys2hv36TT8
X-Proofpoint-ORIG-GUID: OyMvVSg04XiKwgeK9QGkRFys2hv36TT8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-30_03,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 bulkscore=0 clxscore=1015 spamscore=0 adultscore=0
 phishscore=0 mlxscore=0 suspectscore=0 lowpriorityscore=0 malwarescore=0
 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504300073

On 4/27/25 9:01 AM, Vikram Sharma wrote:
> Add changes to support the camera subsystem on the SA8775P.
> 
> Co-developed-by: Suresh Vankadara <quic_svankada@quicinc.com>
> Signed-off-by: Suresh Vankadara <quic_svankada@quicinc.com>
> Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
> ---

[...]

> +			ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +				port@0 {

a newline between properties and subnodes would be good to have

otherwise, modulo the ongoing discussions that the folks closer to
camss are having in parallel:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
