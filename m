Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00AC71A288
	for <linux-kernel@vger.kernel.org>; Sat, 31 May 2025 19:26:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748719597; cv=none; b=kJc78dgBSie4NR5bGdRF/bIdZnm9ghSx0+COktak5g057k6Kv2kZijOVSnZm5R3XahKqRrDZABDhTp/cN21Dagh+xX6xCMvJlAzq+BJL0HsBmU2HQz36jbH4gut9QM8K1z6xK4fpCJGcLzKfyVi7zabcUYOVvr+aXlHBFYwgv4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748719597; c=relaxed/simple;
	bh=C6PuGWGN9MJXkw2ORL2a11VSngX8qZR5eK+WKh08IqA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iYTyuTi0ftW3ilLDbgNGwX7Kb58bRzZABKCX7oPxRu1hGnKS0bJ9HydFvx4916vhLRdeIpC8CtWiMKgkGasWZiKs3wDgEbSoBixD45iKCvxiLCTKk0vqshEVmVySZK8ev6y1WPIjZR1GM5Y4suxr5gHAncpj9CpZyrW/OMVxMPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KkEgYvgS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KkEgYvgS"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54VIjuZ3027061
	for <linux-kernel@vger.kernel.org>; Sat, 31 May 2025 19:26:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CrU6uwD3Ib8Ilhn29fx2EmcIB6JSJ2gX+zA3T2fzlk4=; b=KkEgYvgSW1tfljJG
	OgLzcdEiLuGCiMiRdn5Hy5LiNRJpBwT4QYXmH8roanWxxcWpV2k391goKEDBn5zC
	AVHl2yAWt6ka1py0J3gDwBbBu5vz3rBtnml/YCigCxpV69EObug2Xn3WY11AdgBP
	B3Vq8iNJc0v+K6id1TU8t2sk2y5iY7yB4c6FmdueNn/F9Y/APY/EI59DhC0faVvc
	GHqGkH3l2CJ8gQaMFK6vcu/0xYgp72WnLaTxbmiVSP8pQZrMpukHOIlYRcbjapF0
	2mN/yJYCSswuzuKKa5v6Uj95Wfg5aEgC0yE/5XG2YWCVnGkX5zk7vLmdzzbs36de
	grrIow==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46ytp5s810-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 31 May 2025 19:26:34 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7d0976a24ceso74348385a.2
        for <linux-kernel@vger.kernel.org>; Sat, 31 May 2025 12:26:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748719594; x=1749324394;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CrU6uwD3Ib8Ilhn29fx2EmcIB6JSJ2gX+zA3T2fzlk4=;
        b=k977GSXuHeS2Md1jvIL4MA0UERWBiJgJOdobS2ZZkGl1cpjDzyhLIIONCh/1nfTkon
         vYv9K/j/m2Ahn1eoTuiIyRPKdzHUj5TtjnBYn6hY7xFseHPpUe/LciU3448B45nv08ey
         pS8Rp1Ax/RMQJYq6Vce/z8SVDRFJLDqDnuKg56F8lcBYkVuQKlVJ8qo5ssImG3pVxzJ5
         qloyU9bgr2LSb+R5VtI3jjEjM7SGFmzrwzBJ1nDfWdn441uObOB+mAp/1PVcZiMaXN/p
         W2x2oSvpNInb/lipzASREF10dCRsh/c1j4PvjGH9ddHPMXzbMKxNmC8j6yYD606wj2D9
         dgSw==
X-Forwarded-Encrypted: i=1; AJvYcCVkzkAuVpju1ta6fFYbA7aQC/lk+Jj6NzIzd0xH5GYqpY2xsgO4/8deUogd6UW0McWIvOZ5uQbS7wVsc/s=@vger.kernel.org
X-Gm-Message-State: AOJu0YzJzSHoGQZ2WhZ8aFduXpEu7fOg2/hoYtVObTUE9duz5/c+YF+u
	F9yNM5bvtqJW+3DFNa8mslSujnVhTEoi71bKhF25BIpgUV16tYvSp5wNCum82Ya+beg2+gqDCum
	z96o2boEQvF6b1kpipti5qy5q4cREXYxXR1DSFLV0GOBuqvTfo1LkoqoMT2OECapjNwk=
X-Gm-Gg: ASbGnctJEQW8HgN88kazLn0DInvzXHz6daeyVhyVrDAgXxx1Jq1scGoCCvGDnbZd9XO
	KD87ealnmhCAhCwRjaxICd6HQItB2rVV2HD350A+HOtTGHmxKpxxUqnBz+Pzfp7pTilUgTr9bRo
	qQCaRdQ2m9C037LbN9h2hQ81CrE+laVkGk9lM0RHAvLlGvGMVYlOO6kZZePwgkgAI/fftNiGwtC
	yxCnwjWtxuy40rgJpbl4rkICwnYWLcbeVEQTq3Q2IahhE2XtiRY9W7mbrZZwB6sHRHeze0eEHGu
	TIr1gEM6equBMmMswlKHUGOb+xlPDPT5OPHgLycDHmJuYt24bt8ys7y2BllvFPqRRg==
X-Received: by 2002:a05:620a:394c:b0:7cd:14b:554b with SMTP id af79cd13be357-7d0a3df914bmr403842485a.10.1748719593869;
        Sat, 31 May 2025 12:26:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGgWeFsZuQVBnuevfLlI3W+HHd3FvIh2wDCmEbb3BOsXmzJcbTj7lwjNVLtEsvsVJTLk0yQ6Q==
X-Received: by 2002:a05:620a:394c:b0:7cd:14b:554b with SMTP id af79cd13be357-7d0a3df914bmr403840785a.10.1748719593528;
        Sat, 31 May 2025 12:26:33 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6058563eebbsm2805063a12.67.2025.05.31.12.26.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 31 May 2025 12:26:32 -0700 (PDT)
Message-ID: <03d76a6a-f027-4529-a917-2c5f92530de6@oss.qualcomm.com>
Date: Sat, 31 May 2025 21:26:30 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/5] arm64: dts: qcom: x1e80100: add bus topology for
 PCIe domain 3
To: Wenbin Yao <quic_wenbyao@quicinc.com>, catalin.marinas@arm.com,
        will@kernel.org, linux-arm-kernel@lists.infradead.org,
        andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        vkoul@kernel.org, kishon@kernel.org, sfr@canb.auug.org.au,
        linux-phy@lists.infradead.org
Cc: krishna.chundru@oss.qualcomm.com, quic_vbadigan@quicinc.com,
        quic_mrana@quicinc.com, quic_cang@quicinc.com, quic_qianyu@quicinc.com
References: <20250508081514.3227956-1-quic_wenbyao@quicinc.com>
 <20250508081514.3227956-3-quic_wenbyao@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250508081514.3227956-3-quic_wenbyao@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Vf5b5OI6g1Ocq-vaeM3cjIqZV70GGj0e
X-Authority-Analysis: v=2.4 cv=FPwbx/os c=1 sm=1 tr=0 ts=683b57ea cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=ICgkrN6sfqZrQ0pjF_MA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: Vf5b5OI6g1Ocq-vaeM3cjIqZV70GGj0e
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTMxMDE3OCBTYWx0ZWRfXwokkFxRJ82fL
 sZ+rDt+14OkPsOwf4G10tyD+NJuoTj70Aou2oEwNB6FGs7UM81wepOEd2GGVFrP8j4WrzgObXy7
 c0oe9LVpqk/hCXr1uz8n1//emgK2dawi53kK3fB+ETgJnzkIIPXFnrOspR9zuJ65soAI0HVYgF3
 VUbm3Sl8Bnbloa5MkCSnnm9qgB20gfvmNQK8vdOzo6ByUa/hYYdkzYuzuQp/3AOc5Wmz7zz9SLQ
 m/nKJ/KtgTb57BDzvyLMevXeMNR05f/TiSQhTkE6Q7xaUTU27PhxUV136U/0meMjhs1g1Ra1YI2
 +lQqmxD4EwypVleIF0Q0nFRhhB7hFKUt4rLNKbMY/n9U6/od8cwTuhM2qoQL0ht0gpnsAXd/G9J
 G1f8SQdyc5IE/SKx8PlEARJlTDaBiDIWrrc8rXSXGLCVQxooxN3ZKiSszNk/DZucJS7o/aQ7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-31_09,2025-05-30_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0
 mlxlogscore=999 impostorscore=0 suspectscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505310178

On 5/8/25 10:15 AM, Wenbin Yao wrote:
> From: Qiang Yu <quic_qianyu@quicinc.com>
> 
> Add pcie3port node to represent the PCIe bridge of PCIe3 so that PCI slot
> voltage rails can be described under this node in the board's dts.
> 
> Signed-off-by: Qiang Yu <quic_qianyu@quicinc.com>
> Signed-off-by: Wenbin Yao <quic_wenbyao@quicinc.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/x1e80100.dtsi | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> index 46b79fce9..430f9d567 100644
> --- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> +++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> @@ -3287,6 +3287,17 @@ opp-128000000 {
>  					opp-peak-kBps = <15753000 1>;
>  				};
>  			};
> +
> +			pcie3port: pcie@0 {
> +				device_type = "pci";
> +				compatible = "pciclass,0604";
> +				reg = <0x0 0x0 0x0 0x0 0x0>;
> +				bus-range = <0x01 0xff>;
> +
> +				#address-cells = <3>;
> +				#size-cells = <2>;
> +				ranges;

If you end up setting a v(n+1), please rename the label to 'pcie3_port'

Konrad
