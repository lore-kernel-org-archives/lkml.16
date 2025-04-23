Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E62A925CC6A
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 09:30:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745400623; cv=none; b=OQ9DRkUGEMKErcgzKZVfYSGkwAJJC1/RGyXiLXfDUob96igUK65KP9Bdk3HBx/zv/hBvGiZFeMNRW8inHihEcGN5o+hagAK952lgkRhYZHFwc+no1vOB25g13lKhLJChUNfh5G6bCsiZIEhEXlqy6AoW+LkRxTchSuTVRrh7CB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745400623; c=relaxed/simple;
	bh=KhFXpabGbKqNKN4jEUG3Gsr5KqeWcLFALNi2Exu7Wds=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=X7qawknhnP/i7YAPsiz9s3Niv1KQS6sQsjXjYFIABotVrv60Fyo7oZu+6VCXymzeirTaqGSXd2/DJcIsZGKviRsf9R9i2NnRQsIbD1nQKFl9yrSZ9q1XXJp7LGxErwUIb2wGLuDDx2uLePXChPkSXQGkglQ8opiOALqcFF68+1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QgnmXYJS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QgnmXYJS"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53N0iBDw014565
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 09:30:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	g2RfEZO7YG6Zogn9SRD/U/qedhxSt7eBAmsr8vFvW5k=; b=QgnmXYJSKwgcFXRp
	LhBCvmJXZ5d7xPDhYd+3oF5I3LJ8aKjEDbeCLieplaaETwY9tftj0IAY8p6fWVEB
	4g8LJNoEHNwhk8/pszTNS2l4TZhPwYzgmgDydUoaCbo5ca6zlgELuJlcGbYlq/ID
	ouR+/py33AXNb/mdGqNPkF6Tyt9NfT2B8Tm+UCpv3lCsVwDXisixz6lCynkgUSwF
	uDBiqVbD7b7ITh8XfETbgYmOO8FtHQnKKhczf1ukBu8YUxAf2Zl7mjH+EftPAZuz
	dZ5+b/ZNHYT12jl/0Go3G75SP+lKOIRGPg1TsgWwyDfq7XGYWq+KrSRhY7hVreWL
	ro8QaA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh0hmju-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 09:30:20 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4766654b0c3so11939821cf.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 02:30:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745400620; x=1746005420;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=g2RfEZO7YG6Zogn9SRD/U/qedhxSt7eBAmsr8vFvW5k=;
        b=GrLe/Odc3qtkin60kVF+gH6mrQthkn/GNsW0qgIzz0oGcg0etHco0FxTREOVDw6NHW
         1cvAWa179qG+0C3tNKsuNVPktjqXYDHuHjpFyDT4bDQdxG26bWd8D0OG4ngSXYIsbgeE
         pKCAVPTghG+AnM5mjEL882JCjqXIjCRiEYbixPFXF6aPLi6WcXzmV/X6Xg0yMBXf5DXx
         P6iazD8CZgn5J2IevKqtr9xOo6rjwkn1+qz3nfggftGjkhIUFA7skSn5igemvkfpXYj3
         x8G5asJwY29UjAJtoWmvlpFOzbfbI8mC0gpIptITzNwICYpmPb4ogRuwE9X5ZjzDAknC
         D/tw==
X-Forwarded-Encrypted: i=1; AJvYcCVcOfZb3/UClcF2cfD5Y+HYaCqGeJQTT1/NSHNpKqsgSQ/w7hItFI96AUcQqXeH+rRQ+UGGiTe7aphQp0s=@vger.kernel.org
X-Gm-Message-State: AOJu0YzfepsheP7CP+zYdxqaZA86VrrOh96RP1OH4CFTYgOjhHXDTx4E
	7Khmqms9O+M5NH8H6HAhn70xHzYZSyGqkRaKtUtnnmdA334MvFmJym1VtQ2Wf3dg68QuSgy2pOK
	Z4B2excHJk8SL0jbxht1fqZB9aZryX+Yj/jHBGWtmGc1pm82dl46e995LBwN/4Ew=
X-Gm-Gg: ASbGncsUelAdnnxY5cUbO9kffJ5uAaraEMgBIMZWiqlJv7RlkuTcnR84m/AnWT24Dpu
	JnhiRqDgax27rN7GhnAhAeBTI9SmRH64ZvwU1dkcJ3ExxM9D3zVy4uOyBwwa3BuZTD+AfgATFez
	qvhXVzGoOFxalqfk9+MDGz6IfE/TxOfuc2odPyFGcOuLVJrYiVl09+5fGUF9SbITT0BwiPLi/7j
	OGfQR39ndVt9pHDs0WF8UQm05CwuZCLvalAT1xzgrftg4oLso9GFdx/r1wflTdlMwsjRcQTmIKO
	5WQjFmIwCyp5UtAzv3JSdDDMQCUWfZbevbIGPv/VlxujdsM98vvh42DG1V2N1KBD3M0=
X-Received: by 2002:a05:622a:8e:b0:476:ad95:c08 with SMTP id d75a77b69052e-47d1be7947cmr13214321cf.5.1745400619905;
        Wed, 23 Apr 2025 02:30:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG5vFPCb0l6vMoBMz9fXqDHwfp0G7G6fbQNsGjj/FVClyK0wqBPS0xHQBBimDr76TPecV1jSQ==
X-Received: by 2002:a05:622a:8e:b0:476:ad95:c08 with SMTP id d75a77b69052e-47d1be7947cmr13214091cf.5.1745400619353;
        Wed, 23 Apr 2025 02:30:19 -0700 (PDT)
Received: from [192.168.65.183] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f62557a151sm7209483a12.32.2025.04.23.02.30.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Apr 2025 02:30:18 -0700 (PDT)
Message-ID: <b8bde418-450a-42ce-8d39-098d5c10e2a4@oss.qualcomm.com>
Date: Wed, 23 Apr 2025 11:30:16 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] arm64: dts: qcom: qcs615: Add IMEM and PIL info
 region
To: Lijuan Gao <quic_lijuang@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: kernel@quicinc.com, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250423-add_qcs615_remoteproc_support-v1-0-a94fe8799f14@quicinc.com>
 <20250423-add_qcs615_remoteproc_support-v1-4-a94fe8799f14@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250423-add_qcs615_remoteproc_support-v1-4-a94fe8799f14@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: WL44XWp4hYQxLZNa2AWbG8LMMRd-X67H
X-Authority-Analysis: v=2.4 cv=ftfcZE4f c=1 sm=1 tr=0 ts=6808b32c cx=c_pps a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=SE4aMjCliAL7rhkqCSYA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: WL44XWp4hYQxLZNa2AWbG8LMMRd-X67H
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDIzMDA2NCBTYWx0ZWRfX2H866+iBYcjZ X4vUZo2yV4ObXrtI0ZaK/PWD23d5KqhkcFh3wScVZ3KiDs6wGUu2/c/eyGJ+LcL0Dmv0KUUz3kx 5cjvVwnn1r6znCwzBPDHpnR+OkFZBgE6frawATVao1dch8ZKCEtN5GEcaPaGf3BQdWKe4YH/WRr
 fBzl8i42iiiavReSgfrIhFFz/sMi34ILknshvE8mUBDJTS2xgyvcaMFKAvH8lABe8FjOq9otM77 d8WfN4KmUsJj0koQs2lvrHidFJ24TrQWmJPk43BVKk7qORvVlILMDWaw6zl12V9hJclf6lEiFhq TF4x4MPO0d8dmzZcbG7jECXAmYhQbiAgPDfMrurAZm4dEvl1Qg2hAZp7w3IkqlqqN1A6jYaNzWF
 Kb7Pi9a2JvXklcLim/rsI8tHLVC6WRxc1mdf6+foDQ8noBM7Lz+0tF510z5emfbqmo3fuiVw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-23_06,2025-04-22_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxscore=0
 suspectscore=0 mlxlogscore=803 lowpriorityscore=0 phishscore=0
 malwarescore=0 impostorscore=0 adultscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504230064

On 4/23/25 11:17 AM, Lijuan Gao wrote:
> Add a simple-mfd representing IMEM on QCS615 and define the PIL
> relocation info region, so that post mortem tools will be able
> to locate the loaded remoteprocs.
> 
> Signed-off-by: Lijuan Gao <quic_lijuang@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/qcs615.dtsi | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs615.dtsi b/arch/arm64/boot/dts/qcom/qcs615.dtsi
> index ab3c6ba5842b..fe9fda6b71c4 100644
> --- a/arch/arm64/boot/dts/qcom/qcs615.dtsi
> +++ b/arch/arm64/boot/dts/qcom/qcs615.dtsi
> @@ -3297,6 +3297,20 @@ sram@c3f0000 {
>  			reg = <0x0 0x0c3f0000 0x0 0x400>;
>  		};
>  
> +		sram@146aa000 {
> +			compatible = "qcom,qcs615-imem", "syscon", "simple-mfd";
> +			reg = <0x0 0x146aa000 0x0 0x1000>;
> +			ranges = <0 0 0x146aa000 0x1000>;

IMEM is a lot bigger than what you describe here

Konrad
