Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 205D724502E
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 12:39:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750682382; cv=none; b=a/rOo8cM97acwlBH89nvE02n/CDFPJsH97SgOnq0KQXXuNT1j6Qav86T5UPfx9U2JQRXeLW5FTMybaRtpSxB4JFFDb5iVte0XsvOaDvyaB01orwGyZ71MK9eRtJcGwISsJoGr3AFQWwV+KYDfJejE0P8c+uNFlxSxAUpPRXing4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750682382; c=relaxed/simple;
	bh=Cu9jHf/ikY8NTIpPtIILN+lROMbPCSrdR9Xd8v8FLdE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Txlh0tVL5JA8RkqcO/1+S3Q/6uBGSsyGlWbwegxUSJlzqizb66o3ap7xHZiKbSXQm2WIhyS9ws4UjbF2e9I4jNQj+3jNugp2iPxTyWwm/pA1+5dTecndxun7POxC4PPgTu4zYc7slC6lPjDKuXgdrFZnmol+j3CPJL9gYyF+AgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Z+t0h0WD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Z+t0h0WD"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55N8LcL7005794
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 12:39:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jogcupaRNgtSLcD/zdh/2effoHJ0lzN8HVzNy0f+7KU=; b=Z+t0h0WDpKpKqXL2
	g6+2p6EFptin2q3B64PTIZ6rJtpCa3WxnmKiHk7ouLlSBmEtzWaUjENYfE4owF8/
	DpqPmPjQiv+Epmo9CWNOkjAcZaAB6o7nZBOVvPA/ehLlmB7fxrjLSYN0DC79BBIg
	FJzfP/Mpx9zLFnbZ9NHli7X7DtM+s5NYZzyuE9qBqB+3oe65orBBVN35gKyaXAeT
	sFLD7tq3kyLMLNX1LTZDGt3K/UgCl2Rh0nzHGGCMTL76LQgRp/f7Y76Efs3cw3yb
	y/4KLgnHkVqiOPJz4jRU2TnABVP2UPahkzPisO8ZzNePgOUzKX9H5Nljt50vcjLp
	mXr0CA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47f3bg8psk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 12:39:39 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7d0976a24ceso151898785a.2
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 05:39:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750682379; x=1751287179;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jogcupaRNgtSLcD/zdh/2effoHJ0lzN8HVzNy0f+7KU=;
        b=N1ISttkf9do4Voy8pYMZjoMMQXyjpuveBvRfFaJLWUn8+T1Hf4es0IDKGfC6a4E3eP
         S9/5xcNdspHZN8T/w3YMZXPMttnyqADneWGs9JpcEwuU9bnu3EJ8Ysz1ch4sceAkr0hJ
         FgDmr1W5b90125rk2G0e9aT3Nyq85AM8AwFB1u0o8HhTTL3dOQoMei/MOfkvd0IlxNG2
         +hEOsHFRAYs2kmfCC2nIEsXffNHxhWqxDLe0HGbdVgyyIkoAOeMA7AiVonRNUFZHeGQP
         ESnA+DRVp+WSjFD/hnAfxkYvYXGA9qXG2J0K1rLd1EVfGZC/7K6VOa4+tndYf7LnKkR+
         03/w==
X-Forwarded-Encrypted: i=1; AJvYcCVps9qTL1S9W805+gkbu+nPIf/RvVOU03zmr1ztfiCUvfRlgblTBLTiTRC8StW8Pynp8n1jP2peic/tECM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwTKcszl4zxp0ZMV8FD/Iy0DvFCdNCogx4zuR5vD5AVWqRycG+v
	Gl9ddubi71qPfhEIDVVz6BSLH+albI0go7l0kR6oo+hcP+yeacV+rpwga1HUKFFqp4shJspPqIX
	56I634XEv3RExsWgLKYhYU7SHj+eUnKC6afQ499a6YCrsfbTsMC0KwUZAvhWHYxCbIXk=
X-Gm-Gg: ASbGncsa68HcBnqvglWoMtRJWd0x2Cen0u8/ZXCpI9Nfu1Bs56H4x4KZKuiHVYjm8eE
	60l/K2x6+6VXAC+lEE5w5OX+YCS+v+sXPTeLtV5e5tyq8ulvMaQPdp+CgFM38R+ZiS82f0/IWrt
	fxEL+8CxzPACkuxJavHwBrIVbAadYaYh9z/qi+6LfIgl7qGbm152Rpi2sH2KkUktiY3CPhsbyLM
	509xLt6A24/uvnpqJW3sXqOUWYsWN6rm1A0zYkue723mGBIjar7oD2D8NWeZ4c3lNGBHuyORxI9
	ZGjVLq2rLfJNyQi395CWWSxFszoOgkb8Xssghcs5FWOqA59XBCqUMhvQF16psbH/KUrnnn0VE2h
	D1RA=
X-Received: by 2002:a05:622a:253:b0:47a:ecc3:296c with SMTP id d75a77b69052e-4a77a0b9c3emr72710021cf.0.1750682379038;
        Mon, 23 Jun 2025 05:39:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEEzLE5XIZwxXABQIRsBupydSEdmMwxw+uZsKhm0u2LXtGuTXdMotWQUEt+fgx8u5hMzuy3tA==
X-Received: by 2002:a05:622a:253:b0:47a:ecc3:296c with SMTP id d75a77b69052e-4a77a0b9c3emr72709901cf.0.1750682378617;
        Mon, 23 Jun 2025 05:39:38 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60a18cba668sm5900336a12.58.2025.06.23.05.39.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jun 2025 05:39:38 -0700 (PDT)
Message-ID: <50b0aa77-4ec5-412f-9ce5-6ec613dd0afb@oss.qualcomm.com>
Date: Mon, 23 Jun 2025 14:39:34 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] ARM: dts: qcom: msm8974: Start using rpmpd for power
 domains
To: Luca Weiss <luca@lucaweiss.eu>, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250621-msm8974-rpmpd-switch-v1-0-0a2cb303c446@lucaweiss.eu>
 <20250621-msm8974-rpmpd-switch-v1-4-0a2cb303c446@lucaweiss.eu>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250621-msm8974-rpmpd-switch-v1-4-0a2cb303c446@lucaweiss.eu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 5EuX_A50HjyHrnjWNSgFIc2izsA2axQs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIzMDA3NiBTYWx0ZWRfX/hRPojQPIQvk
 MvyvO2CeB9fzhx2o7AA/A73m+7CMdbFxsTzrPScWH1Eu9SRoa/BHPoM1iYNXDmCS/6EHGPeT3hs
 06Lq+eVZPJ/1cGE7etIcz0m+7s76enhgHFUTQpkCIyB1QUjQXFnHlKgULQj0XFEVqhzz0/ejAhy
 zL8Wk7S5eGoH5DXw2c3mB8d2X2/4q+0vfO92OuUA2JOKUL6PiOXYMUeg/EgV1sCTAjpJpFkPd4K
 CHnP//et20Xjfv5zcfZo2imsRnY0Zntu13GOJ2vul/ASSR/67LmefIgja1aHtjfi6IER17cCmX8
 TflhdT9WuDtpirXCC8373efx7kegJPrrMdOJHoeTx1OdSZLN9U8CnKWc4VgZlsrZ6zDb2FoSadB
 70i555TnjFeeihpYnbIBb/1Srfz3CBwmSl+sDF3IrVvI4Nu0Am+EU4TdaSGY0W0QxdJ/TpIM
X-Authority-Analysis: v=2.4 cv=L4kdQ/T8 c=1 sm=1 tr=0 ts=68594b0c cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=dlmhaOwlAAAA:8 a=EUspDBNiAAAA:8
 a=obA5ZJVW5cAYRlcEQtoA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=y4cfut4LVr_MrANMpYTh:22
X-Proofpoint-GUID: 5EuX_A50HjyHrnjWNSgFIc2izsA2axQs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-23_03,2025-06-23_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0 bulkscore=0 clxscore=1015 suspectscore=0
 adultscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 spamscore=0 phishscore=0 mlxlogscore=945 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506230076

On 6/21/25 3:19 PM, Luca Weiss wrote:
> Due to historical reasons all msm8974 boards have used the CX power rail
> as regulator instead of going through the power domain framework.
> 
> Since rpmpd has gained msm8974 support quite a bit ago, let's start
> using it and replace all usages of pm8841_s2 (CX), pm8841_s4 (GFX) and
> for the boards using pma8084 pma8084_s2 (CX), pma8084_s7 (GFX).
> 
> For reference, downstream is using GFX power rail as parent-supply for
> mmcc's OXILI_GDSC GDSC which then is used for GPU, but nothing there is
> modelled upstream.

if you use an opp table with described rpmpd levels and bind the GFX
domain to gpucc, it should propagate - check it out

> 
> Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
