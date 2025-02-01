Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A636F1C5D61
	for <linux-kernel@vger.kernel.org>; Sat,  1 Feb 2025 16:27:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738427224; cv=none; b=UHltHg8ivnXWgLsfpb3mD2eYUROgOmANnIxoFEwC5f0Jr0CNIpmyZBjDC0KOi8yshEwHlUgjZgAXYJu9iyhbRzGQ3A1Qn31ine8teomZlTMzvAMY7HF9mrTBazyzGb7YUzKPgV707wV/iwZ0fjRCrzxhKaQsTFEaLqSk65GuSqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738427224; c=relaxed/simple;
	bh=Yxhl8LZFj20FOUDFn3DFSQ8NRNktMewV2d+gewSUVqw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OBm+Xaj6qO7Xb4e4ZW3b4Q0pHvMp4vPbvl+rtBUPy2nk6OfnslUf2WswInZ3PpVrCCv6GIhbx7I8Y4/X/PZnuadDxK1ZQSjkiM7m7XzkiUD1iiyrcNgwmB6uzS+r4WVJVA0QT75ypimNKha12CyVJ2/nkzRzJZQIRcg+lLe8sXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VhQ1AMM4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VhQ1AMM4"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5116Cfwt024138
	for <linux-kernel@vger.kernel.org>; Sat, 1 Feb 2025 16:27:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EKll0OTr+FAupnplWAio3axMf3LjnLIqeSqJawk3ocA=; b=VhQ1AMM467Pl8oY5
	p3ZdQQMO7ryoJNf9YdmC+UGRXztIfWG93qejsXbeyw3Lt4ceUfE+KTVwgD/HG0HM
	8ZReaItoewDJtWMWUNtqjtJyZ+Tv09cbiY8f2N8KTTtuoLj2j1DpQG1aRNbi0JVe
	bOjHMk7uGp4wIGHEaXweZklqbNhULpMNPhTzgxj+FIdvnIT7C7axtvoptPUJpxBX
	sRALm57UoGkoD/qgbauZuce10ofcC+ZpTJeE38J8AiuGmvqmRGMDrsbGGgtCLeJH
	fBF3z4H0Iq6tm07wgMxOnp6OnznW1Ss14HJ/whocFpPxMT5iaxGYuB0iH1uUAngr
	fFhWDg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44hd6a94br-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 01 Feb 2025 16:27:01 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6e249d117b7so4739056d6.2
        for <linux-kernel@vger.kernel.org>; Sat, 01 Feb 2025 08:27:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738427221; x=1739032021;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EKll0OTr+FAupnplWAio3axMf3LjnLIqeSqJawk3ocA=;
        b=ffyTYbLMtpkXI7O55lLtysuegD6NV2jodcw2OxYkSIvZQMdh/F23SKjNNJWczEMXkZ
         QTVTgopAbTzq+//2XcP7GbkUL9ks/rpikY6eN999jrp85ugYJkfCdjh5djUzgJQ8PEc2
         EpreW8L2p6q8HRuusLbzgqfpT5NSmySGJYk4/aUQMzqZw+pf6htW5rLE4qHIGr3ajHSE
         C24JIz+pvRC/GV7qTR7X4jmSfNn2e672758sIg1qqnExOi3miFuV3UUD1W13JYSVMZVZ
         HaiXDnT4LwigtII56yZ5jDX0O7B/vL6sQObR+BnGtGrlbgKgl/VN8Pik++S+lhzRfEY0
         ai9w==
X-Forwarded-Encrypted: i=1; AJvYcCV39dJmWnSQ+itpDm7UP3h4614QSKuVTlnky/Hpvi5GfeNfYXcevdiVFRkUGYZNpK0Cu+/c4xtJfJHNZ+k=@vger.kernel.org
X-Gm-Message-State: AOJu0YzVhnrlp3/ZSzbbKViCa9Dbw5++fkblllYHyMsZx3NSbpJxcdL+
	ziXgObjysP+Av7SRUfwRX601D5/uJ8GJzle6YEP1LKVQR+2qQccqychfZxywmJLYAEkqxtsF2nz
	/QAiWEQWqE72XG9Dw5s8zJRPAAWdbI5EU7HVB0PL0+Fr0c72AyLEy3zGb4WKGtBk=
X-Gm-Gg: ASbGnctU1DVUL3+2/SG8xSqN94SVCSjSHyj4VP0eNtIzDgSCWGFzzdMRd/tZNoQQ/ip
	fg5A6KT55rEJmqYmghz9ak8XWrrzxoOx8M9+eFagpWZVaD5CpkaG5Dzw2jFLliEVWxlMdf/bwAw
	591dWdknqTLSF299MkLiDivrJRh9Aio2EVbxvqcCchf/kQUwvofA99FD57bLoJFZwu6mJSMwf9v
	ixbYFVRruML9JGQuWWmzYr3lpMsKERQqGfBCSMdTv3wK18SJVko7X3cvY977X3T/Z47gQa90qkl
	SVNrVIvMhgy6IQpde0TTEeeIQCV/HLZn0CUL8/+1jIXDl95fwUiLjgn4tNU=
X-Received: by 2002:a05:620a:29d2:b0:7b8:5629:5d58 with SMTP id af79cd13be357-7bffcce5683mr798967085a.4.1738427220721;
        Sat, 01 Feb 2025 08:27:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGW5dCt57KxB3QTUkH/DtBPukVEDHPBWvCI3vtS5HPPpewERxqmhT5SNUKe1IVKv5OIuqLK2g==
X-Received: by 2002:a05:620a:29d2:b0:7b8:5629:5d58 with SMTP id af79cd13be357-7bffcce5683mr798963885a.4.1738427220201;
        Sat, 01 Feb 2025 08:27:00 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dc7240487csm4570605a12.34.2025.02.01.08.26.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 01 Feb 2025 08:26:59 -0800 (PST)
Message-ID: <80ca597a-3d85-40d0-a04d-4bb8ca91b687@oss.qualcomm.com>
Date: Sat, 1 Feb 2025 17:26:56 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 2/2] arm64: dts: qcom:
 qcs6490-rb3gen2-vision-mezzanine: Add vision mezzanine
To: Vikram Sharma <quic_vikramsa@quicinc.com>, rfoss@kernel.org,
        todor.too@gmail.com, bryan.odonoghue@linaro.org, mchehab@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        akapatra@quicinc.com, hariramp@quicinc.com, andersson@kernel.org,
        konradybcio@kernel.org, hverkuil-cisco@xs4all.nl,
        cros-qcom-dts-watchers@chromium.org, catalin.marinas@arm.com,
        will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@quicinc.com
References: <20250121125010.1853269-1-quic_vikramsa@quicinc.com>
 <20250121125010.1853269-3-quic_vikramsa@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250121125010.1853269-3-quic_vikramsa@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: uXSNW3xH4IGYFj3C_NTysUGYMxz2F0xC
X-Proofpoint-GUID: uXSNW3xH4IGYFj3C_NTysUGYMxz2F0xC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-01_07,2025-01-31_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 clxscore=1015 phishscore=0 bulkscore=0
 mlxlogscore=770 adultscore=0 lowpriorityscore=0 mlxscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2501170000
 definitions=main-2502010142

On 21.01.2025 1:50 PM, Vikram Sharma wrote:
> The Vision Mezzanine for the RB3 ships with an imx577 camera sensor.
> Enable the IMX577 on the vision mezzanine.
> 
> An example media-ctl pipeline for the imx577 is:
> 
> media-ctl --reset
> media-ctl -v -V '"imx577 '17-001a'":0[fmt:SRGGB10/4056x3040 field:none]'
> media-ctl -V '"msm_csiphy3":0[fmt:SRGGB10/4056x3040]'
> media-ctl -V '"msm_csid0":0[fmt:SRGGB10/4056x3040]'
> media-ctl -V '"msm_vfe0_rdi0":0[fmt:SRGGB10/4056x3040]'
> media-ctl -l '"msm_csiphy3":1->"msm_csid0":0[1]'
> media-ctl -l '"msm_csid0":1->"msm_vfe0_rdi0":0[1]'
> 
> yavta -B capture-mplane -c -I -n 5 -f SRGGB10P -s 4056x3040 -F /dev/video0
> 
> Signed-off-by: Hariram Purushothaman <quic_hariramp@quicinc.com>
> Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
> Signed-off-by: Trishansh Bhardwaj <quic_tbhardwa@quicinc.com>
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---


> +&tlmm {
> +	cam2_default: cam2-default-state {
> +		mclk-pins {
> +			pins = "gpio67";
> +			function = "cam_mclk";
> +			drive-strength = <2>;
> +			bias-disable;
> +		};

If you don't plan on adding more pins there, drop mclk-pins{} and put the
properties directly under the cam2-default-state node, similarly below

with that


Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
> +	};
> +
> +	cam2_suspend: cam2-suspend-state {
> +		mclk-pins {
> +			pins = "gpio67";
> +			function = "cam_mclk";
> +			drive-strength = <2>;
> +			bias-pull-down;
> +		};
> +	};
> +};
