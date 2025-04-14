Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEE2028E5F1
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 13:48:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744638537; cv=none; b=gFGIlMb20EgQux2rutkwlEv7dLqiPPQFQ54ohLFyF06kQi2y4MWBeVnAcpeY7HRGf6UsE/YiEyLgWFkK5b8H3en7Q8ncDLevzicxUyx8AEFqEt+1PqYiq+r3sqxOAF5PcyHu2mT4JRuj1eKQmT3POMl5zVFn9gNnPgH0hHy/LLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744638537; c=relaxed/simple;
	bh=np9hmuuv/xFfm2pC735FXo2uI8JBzBXFBa4WLOBK+kk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jDORR0iu7vvF+Jotigzmrf+BBnT78zEu+TpvFfVFhnBcP0kFuyvsi+ElJJqgygisiH9byGY52TkpV0I4WWwLXw467BoPV4i8fC2OjR2XuxHh5AHRLA33ufU56wNghzr7q2LLeH+ZjIihxpnhqkSZU7RYkyCt9jBC59Eu7RvCG3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cUZxv8Ki; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cUZxv8Ki"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53E99mMk012976
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 13:48:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9KEpYH2fL1hZL343CQIkegiAhh7VDBORXCRTiifeB24=; b=cUZxv8KiEnifrGyg
	NPkbNKmnHQrRHd/LGWOuhOoRpWONaljJkArdhzfyUj2kGWz6bIni3rJTE3ov6OXU
	AqFu2ouknX4VOljQHsMZGnwPhkDskIzY7nssZhRwaAdLnokCgcF7Ccp9THO1sE/D
	dmtD5iyiD0rTAUdbjIKxDUbENI2SAjwkniQ1bYChm/oi7FYC4O35+4xL4Oulp5sB
	K9JrHUpHwh0zpmnuxgthNYhywKyJ3z+LctE4vPcGJ2xfZRktgPPqLLpCazkoyMul
	ZYuXQ4wfbHpfROADIIfb1O1jU1YiZ8Em5VhLhK2F6Vfw5pd0VP4B12iWchtclZcv
	w+KCgg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ygj94q7f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 13:48:54 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c5ad42d6bcso91425885a.2
        for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 06:48:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744638534; x=1745243334;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9KEpYH2fL1hZL343CQIkegiAhh7VDBORXCRTiifeB24=;
        b=WaZlwQc1Osuiwst0toA+FWNS0HoRepsZ/h75egPkoQOD5F2IQZrgjhzD1mdqk2IzW8
         ju4wzurZ8jqazm9RBHWQi2tMCfsSH5L5w0jxqrE7h6obkPdR1uXm8JH2Isgjj0JZ3Ip5
         FlTEGGQtKF0PTd+ngQGcrVNh75hgr2qSi55g+QI0VKdD3Jpx7i7UZRSMGby1HB0X8Oev
         Is1NfPb7iggUQkgqfOuFgysvjEV4W0hmtwVv+e2DaIDUi0qki80OlV2uCk9ukEUpEmjr
         dAc3AR5muTol/O78RmGqmUq4/ZMS3Y8QMxwil5sSjP4uXdOV0thDSO040cbL0/fXzjnN
         rXig==
X-Forwarded-Encrypted: i=1; AJvYcCU1d4RjWWbsr0ri+ju29GLvHjb3VOnsxGkNHfs0QSmWgjxVDhsQUUoxJimwhQLVvXhGQWsPHYG/L0GyBhQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxe5Hjk9AaWVZB26CrkBDlhu3qoalx68QV6wU8yK4ggr6TgKsxI
	rlL5tsyn0b7pe1WkXLSpiFv2WZWW1QgzYI4HlBBGlu8WzVq8OoYHsy5BhKFPzNC1lQsrUMxTnv2
	Zl1jGJ4QiADdIXGnBgtil+jmgtJSFAAF63Q4n8nHRVUrgBXB/NUzXma4mE8s9tv8=
X-Gm-Gg: ASbGnctJRUuZ4+OllB3TUWOARsyIH4IibG9rbS4FH/Pgq/QtFyNQLQlpOzZ8Fue0dCk
	yQim2J5Td/UfpIqPkLP6aKCTaO3S0ojunoHppfpoPKqE3X2Fhpb1tH69zhW7qts/MuCw0E4kLOp
	3GDtwRzHDcrI0q+g5nc0Rh9wtO5KZu3Jw7nzQKfajGV8lJ2g7T1/NgvYr5VsBGwUmOhiKTkCk8f
	rpVVKCGL5eQ5BFw/wCezpwZcwlc0JXdLhcsXEJBdvzkER1QxsjFugVRV/YxiuLBhljnalBfepJ0
	Osx3tL3KVUoL1K2lJiu+63bH69fFdDC7Q+xCdj96UYFGYPQaTPE2ATy+zsJPdGJJVQ==
X-Received: by 2002:a05:620a:2991:b0:7c3:bcb2:f450 with SMTP id af79cd13be357-7c7b1af90a8mr547104385a.15.1744638533666;
        Mon, 14 Apr 2025 06:48:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEX4O+qSr5lYuI0xXci8UwClLylPYXi2as5JPMMjmn1VLvTa5A/AYniUqnKC46HZ2UH6QSe5w==
X-Received: by 2002:a05:620a:2991:b0:7c3:bcb2:f450 with SMTP id af79cd13be357-7c7b1af90a8mr547100885a.15.1744638532970;
        Mon, 14 Apr 2025 06:48:52 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1c02227sm905491966b.81.2025.04.14.06.48.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Apr 2025 06:48:52 -0700 (PDT)
Message-ID: <65663927-cc11-4810-8714-7600786f299b@oss.qualcomm.com>
Date: Mon, 14 Apr 2025 15:48:49 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/2] arm64: dts: qcom: sa8775p: Add support for camss
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
References: <20250210155605.575367-1-quic_vikramsa@quicinc.com>
 <20250210155605.575367-3-quic_vikramsa@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250210155605.575367-3-quic_vikramsa@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: S2K3x6uQ6qlCf98QAqkl_U9VSGmtOI0o
X-Authority-Analysis: v=2.4 cv=PruTbxM3 c=1 sm=1 tr=0 ts=67fd1246 cx=c_pps a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=iMC0Jze56uYpCOfz6HIA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: S2K3x6uQ6qlCf98QAqkl_U9VSGmtOI0o
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-14_04,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 bulkscore=0
 priorityscore=1501 malwarescore=0 adultscore=0 lowpriorityscore=0
 impostorscore=0 clxscore=1015 spamscore=0 mlxscore=0 mlxlogscore=776
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504140100

On 2/10/25 4:56 PM, Vikram Sharma wrote:
> Add changes to support the camera subsystem on the SA8775P.
> 
> Co-developed-by: Suresh Vankadara <quic_svankada@quicinc.com>
> Signed-off-by: Suresh Vankadara <quic_svankada@quicinc.com>
> Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
> ---

[...]

> +			interrupts = <GIC_SPI 565 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 564 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 468 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 359 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 759 IRQ_TYPE_EDGE_RISING>,

760> +				     <GIC_SPI 758 IRQ_TYPE_EDGE_RISING>,

759

> +				     <GIC_SPI 604 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 477 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 478 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 479 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 448 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 545 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 546 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 547 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 465 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 467 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 469 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 360 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 761 IRQ_TYPE_EDGE_RISING>,

762

> +				     <GIC_SPI 760 IRQ_TYPE_EDGE_RISING>,

761

Konrad
