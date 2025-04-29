Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C7691C4609
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 10:49:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745923743; cv=none; b=YlkTU0o9j0DFAZaVQWIO4E6MbogtAg3G2CE/hanmedjjlqceQDd2Du6PFcl5eWNBTFB7eKlkb/uCnCfwYHQdvkhqjSC3Tndu/ngD22//DsgTa5tF+qbfV69bCIswBRsuAZV8Cb6NU23FzWKJuKMDnSxrCoEgdxCI7I55JLk2OY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745923743; c=relaxed/simple;
	bh=h5yZe9ek0bTkblVkQ7baZzJhtoZvqFqwzWnMpSFK+2Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=G3d1GgciDBij6DvF1/fV3zrlgcdzwps71H9OnXkF3Zw/fM1DTFd9JhtT/8+fQXmC2mfU3lA5gZqbNwx45tnseL/3IyNRTuRLbni0zfvGKf/nqkHZGq/jd6ev5LDDNjTgmoAQHYru57reoRgG21n8oGUMn76IZ9NYsmBZ4WcQG4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=h6FXueAx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="h6FXueAx"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53TABW8H015412
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 10:49:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pBvpr7r5O1gBvBiULTbtUNMDGW2y6sgXuugVNVBKfi0=; b=h6FXueAxWi5gvkik
	7/54US2GkdmrzI9PeQ72q5+R8w5dGFRXbHSuk1mO5k+MNnFiag4iZJ1YYzCZY99i
	PSrUl9FhC16qzI3/PZF3NaA2Q/KKX1870thX6xk8Es6fEcnhNVHx4fMeBVgAYuzx
	8f4qbpO9HTv9KPfCIBCxcrZGX6V8H9weQsq7jmz7lFf6Z1wnYFaNhsTNvDfORg4v
	z+sp00eL6Q0/tSkXEktBqY9WuIc08FdvYqQgYVH+MLXTVS18bWKBHtSM8KinG1IW
	L9/JcACeqGosYFGxEcTt9F4nHz5HTH1vZe1Ryo+CPunIAYTOnY7Tli+G49/60XOw
	8zaFvg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468qjwv704-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 10:49:01 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6e8ff8c9dcfso16154176d6.3
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 03:49:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745923740; x=1746528540;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pBvpr7r5O1gBvBiULTbtUNMDGW2y6sgXuugVNVBKfi0=;
        b=PYpR9HAanOyEQNJE3Ca9ZedcJa7NTG42i4G1h8tN0e3Z3Us2/MNH/353/vLTvKEzD+
         FZCs2XAlRowWsr5fBphfUrylc+ZszvY9B51O7FDTk1gFsvs0bU/FCdJ2XJ5nGWL/POX/
         GHfxwgjjVE+SHxVZT4+heDC4jgf0VUJti3sE3Tn4elk1nMXWl4bl9IzTYqYIM3UMj0Q0
         fQ4QjIuqFWNkZdjKKd9HeXe/Pj3ml/xhV/gkK1yn/S4tzuPWjTylhYntFhBQFH4J8Zt4
         xEoMxLqOWdIPRKknJ25cvyu13TTuTwE6HpcC/GwZa9ECqCB8u4WDczVbVin63S4gpXrR
         P88g==
X-Forwarded-Encrypted: i=1; AJvYcCV+9oUJXB5vjEpEKRCkO0v/GGOcej7xLZMBaRT4QwrqmN8JJDl/GrynhMZ/RE24UmljOZfK2cUiTfsXQn8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwnxdBmE3ZWe7bk43H+ilqhRvSZ1utrggMBd3O1l5voYg/M2uI5
	s9AGjoDvMoS2GtOemnz0NkEUjXoZ78BBS7LsGZiAfiEPyMLB1ztvz/i3cRHBlILxS/4t6+tkMv3
	G9AKTSzsCpKDmPubo6SVPvxiV/pLGx9zA8AIrpB+GGHFhszHfYs0aqLga8VGYejQ=
X-Gm-Gg: ASbGncvwyjrVaVSOmzygoGku4i2XC1iWl7srdu7blJTUn7Q200FhsNr/VZ24x/nHKct
	p3wV5mz/1X/1qKMeGNpO6C6I/yfL2jEe+UttG2+doWj/GQ8w2KKBMp6dpZeevMXkZMHbOurylnv
	nNAG+pIOvyirVfocs1vn9JlTmLCr2GdVmBLTCxmcmzuefkfcDjUU/x++CKH4chQaJpN0Cw+L0xz
	v1OzRLBnsq7FYZ/QD06nvzNusSKutkTR0bml3Qa1rICQnytlioRl5HKyxXdVaUVTJk42ydn3ElS
	iv94VdeBWIoTD9AO7UQjB/B3ctXot2rtIKxLX3OlOnu0u0+xr2f4bQR5dRmPthBTnA==
X-Received: by 2002:ad4:5943:0:b0:6e8:f4f9:40e1 with SMTP id 6a1803df08f44-6f4f1ab0d4fmr15842406d6.0.1745923740233;
        Tue, 29 Apr 2025 03:49:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IELFfrw4BLWnm8qQ43tdPLNTqSNsmPlRGAJf590ok3QkJlSZByXE/OZIdliFR/98sZgfwkbJQ==
X-Received: by 2002:ad4:5943:0:b0:6e8:f4f9:40e1 with SMTP id 6a1803df08f44-6f4f1ab0d4fmr15842286d6.0.1745923739964;
        Tue, 29 Apr 2025 03:48:59 -0700 (PDT)
Received: from [192.168.65.43] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f7013ff812sm7596718a12.25.2025.04.29.03.48.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Apr 2025 03:48:59 -0700 (PDT)
Message-ID: <758047f5-e31a-4933-8560-56d988492d95@oss.qualcomm.com>
Date: Tue, 29 Apr 2025 12:48:57 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/7] arm64: dts: qcom: qcs6490-audioreach: Add gpr node
To: Prasad Kumpatla <quic_pkumpatl@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@oss.qualcomm.com, Mohammad Rafi Shaik <quic_mohs@quicinc.com>
References: <20250429092430.21477-1-quic_pkumpatl@quicinc.com>
 <20250429092430.21477-2-quic_pkumpatl@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250429092430.21477-2-quic_pkumpatl@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: E47zlM6xAVAoZO0C6CtmYFmBwxsdwuoM
X-Proofpoint-GUID: E47zlM6xAVAoZO0C6CtmYFmBwxsdwuoM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI5MDA4MCBTYWx0ZWRfX8AojtNj+r5SN 5X1BPqbH8514Ohe42cxkpnV+apaPpHd4AHqZ9UAnWybSBp2BsC4ZHtxqijotBVgwNExhpWHe2pU rnji3hf/B30Ed5JChDoPlrqQLO7VYO73sweEQF+nYUhWeTVTTp27F+vHzcbcHwWuEcibTeqwxB5
 TxmCg1wPzTgRYwUC3o7OLuOWcFfy3xabw0C6B/NMKkK9ka4XRROBPNsPzei/sPL52/Y6ptTN+WE WnUNz6055O6v0p8Qj+QVRpadYfPqSEm66K/JYnAhFuD3Dsv2a/q3/KTG/hnUf8HHhy3i7Y8bT6d 3Qny7XdgA1DG4gc6Vnp+TAe7yBrUiofWCmJXEStO4Yj0j8lgqtlHaDyY36BgpwxK6xiIC+wa5CP
 aEvXTGU9KmLU5qHXOdqMXEyGyoeM4gotwN/3FmMaKLoJ9B9xRVh2SGiZ8MfuTgvhzge2MIPl
X-Authority-Analysis: v=2.4 cv=c/urQQ9l c=1 sm=1 tr=0 ts=6810ae9d cx=c_pps a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=0757IJQN7x3-QKvqGJMA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-29_04,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxlogscore=779
 phishscore=0 lowpriorityscore=0 impostorscore=0 mlxscore=0 malwarescore=0
 clxscore=1015 spamscore=0 adultscore=0 priorityscore=1501 suspectscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504290080

On 4/29/25 11:24 AM, Prasad Kumpatla wrote:
> From: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
> 
> Add GPR(Generic Pack router) node along with
> APM(Audio Process Manager) and PRM(Proxy resource
> Manager) audio services.
> 
> Signed-off-by: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
> Co-developed-by: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
> Signed-off-by: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
> ---

[...]

> +&remoteproc_adsp_glink {
> +	/delete-node/ apr;
> +
> +	gpr {
> +		compatible = "qcom,gpr";
> +		qcom,glink-channels = "adsp_apps";
> +		qcom,domain = <GPR_DOMAIN_ID_ADSP>;
> +		qcom,intents = <512 20>;
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		q6apm: service@1 {
> +			compatible = "qcom,q6apm";
> +			reg = <GPR_APM_MODULE_IID>;
> +			#sound-dai-cells = <0>;

No `qcom,protection-domain` under either of the services?

Konrad
