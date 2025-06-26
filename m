Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B34212DDA1
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 23:35:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750980902; cv=none; b=psgXahEyuVKFXJ6LSpHu+aWimmrv11NPR2+bOQYUZrdlgYk4z4UmqxpgCPrWV3cf/mXLLw3CE/69q1H/hnrkfalPSQlL51heCuPZDJywp9t0NqjAFbTw+lpZVAzlpMQuwWEossKGN0ZN1bGlbL7FlooMp8Lac2/Em9RTb49E1GE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750980902; c=relaxed/simple;
	bh=9qan4SOQiAV+IvZmYG3SDHvA0EovSnRG2C70bJxoLFk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=I1exXOjJpnhf0gkDXjeAry3u0Z/b5XPoYb2sWpJ1kh5b45Vb08slgbgxT8UwElMZeu5ddjJNEFSmNiboPNPrIemfOCBDcGhDGPEfxfFJPdqaNie2zgo1nonZQycpFHVJv1z5+Dw4qm83rgNq7pYzKhSVkunKzswt1m6Ppu/NY3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ns6C5b8C; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ns6C5b8C"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55QKHSRa013542
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 23:35:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hAd7DVeEwKm1wjaALp+4bwWbD2AnwwiOE18te0+qjjs=; b=ns6C5b8C5cHhNyBM
	qN8s9Gao8T8QD5IecsR9XxRVP0o8FaiePsCFa8rKbb4USlm8eEjJOdwfku2xR0ms
	pRV/xgB6VPxVMHdPWIRxLrQuOXfmyB9wvmH4imFJUNA2w5LRB5zwB8wlXf9S1Oed
	Q7/Ca1D/jNBC/GzL91hjeQ0l+cg03S8YuH2FoCb4eVetCUZ6Z1sodR4En8TgUpFr
	NVSOIjCf50nA3C5c333LwVDbr2UfUZrr6Wa4iNS3YZ30Gp0/YnL5wXl/FXR6KU/Z
	6uG/DCV3/Y/HiVdh66bJezJ0MdOuu8xHg81PrSj+vyfBI0rpqVCxzgpxDhNlnugO
	DJqwYA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47f3bgmu4u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 23:34:59 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7d21080c26fso25792685a.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 16:34:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750980899; x=1751585699;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hAd7DVeEwKm1wjaALp+4bwWbD2AnwwiOE18te0+qjjs=;
        b=I6+NbhhfMTMB0RfstXpn6xCEpaUUtY6WD0jITsPZCPs5B+j1G7qMFMLHr0cvZ+0lQ9
         6TtBBbqRxVTsHV92RiZoxfbHY3DaFEKVGG0yD+6YExbjBIMdeIoCT0UyZ7zvBzdfcoGj
         ZNeQi/Wsbf3zOdOWT4wdC4WT1AStT7+/BUsISqQbta/k7NY7Z022mHcUzFciMBEiP8zY
         9fthsuTMtwuxZyazcWPGmSsOp6/jGbpZADXBxW9uMmgXjBWTL8/k+Fx9mhWkWCkeAxe/
         z6kV2Hwuq2YN4eKyqI+BpVhqwwZXaJzCE80TgieqX+u5fVmQfKWIuWkJZ8AEHqnwhd95
         psTw==
X-Forwarded-Encrypted: i=1; AJvYcCWBTQSbZMqaZ6AZGI/TP2PFNacrNzWwpAPtkKd73F+WkBv+ufJTR5eG0LCzXw7LA5esjgJ3MeX6uIclLz8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwEaeqePbdmUjUNHYstAXMgM6uU2qY/rQ9ik9+x3qn1e4GtoWhj
	eRVppPfdkRYomweAfRNpGjveAIpn7ypPpMfhugma9uhFf0Rb1PIRPtmSvIzUGndBp21VV12yClM
	gA+72hZj6+OMLKhNtjZOiunFvefcFbfGiPD+QUAWDADopWEwjIpeY0wTQx5fzlxp7FEo=
X-Gm-Gg: ASbGncsvhSrWElQ2w3Fns906LokMS0FJWQXO3Y7mWQtYwzYeXYZ7A7f0J2dnzmhhiiu
	PIrBfC6NJJJMv91noSnGRwDUuu2n3DqhA5WoAaLNwQOx5wQw4WTvHlJ+wbAfz0/AJwjT3nrejdG
	0FhBpIAWIovz1qZEdCQm8q4yhqrOdmQnGz9OFyPd1n3wyvZyXUmLS9r0g2yP58lwbYNy4pBghWl
	S/RPDPh01qYxkFWuPIbCONSO8lk9Z1SkGQKpbzF4LDR2/AF0lx3J1jnMSaV2yA5aNuKu7NpGUGp
	i5xQnB9sad5x2dBCXJnLNAmRXidM5hpU8sAbg0Q49IEm4t19ADUPpfA15163Vvld623fmBPe0Wv
	eB7c=
X-Received: by 2002:a05:620a:172c:b0:7c5:8ece:8b56 with SMTP id af79cd13be357-7d4439630ffmr61358585a.4.1750980899095;
        Thu, 26 Jun 2025 16:34:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG2PRBC7jtFvKC0qYTyxR07iUAWipF4qkqzOBUkWOdASYf2yymdYdIveUVPc/yVZg1FF4AV4g==
X-Received: by 2002:a05:620a:172c:b0:7c5:8ece:8b56 with SMTP id af79cd13be357-7d4439630ffmr61357585a.4.1750980898667;
        Thu, 26 Jun 2025 16:34:58 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae35363a9a8sm15771766b.33.2025.06.26.16.34.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Jun 2025 16:34:58 -0700 (PDT)
Message-ID: <e5e3e8f1-4328-4929-825a-3d8e836cf072@oss.qualcomm.com>
Date: Fri, 27 Jun 2025 01:34:56 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/8] firmware; qcom: scm: enable QSEECOM on SC8280XP
 CRD
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Ard Biesheuvel <ardb@kernel.org>
Cc: Johan Hovold <johan@kernel.org>, Steev Klimaszewski <steev@kali.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-efi@vger.kernel.org
References: <20250625-more-qseecom-v4-0-aacca9306cee@oss.qualcomm.com>
 <20250625-more-qseecom-v4-5-aacca9306cee@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250625-more-qseecom-v4-5-aacca9306cee@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: JBhkZekgPVKS75mr_pgIlUL22IegluEl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI2MDIwMiBTYWx0ZWRfX/IUN9oEpYKlo
 TBuFYJOD630XlSJqRGm9mpav3BvXmh01EwS/C6dOmy0XCmd7Vqeb+RsRTlIiz1pa5fc0+R5aY/4
 oWEHHPGTpJlikeYVMeDogYyMK9AShSL4sVGk0+C4hHcEujg4dniEALOc2+Vj9tdR+pr7G9SMsLB
 c3GgIyshoX/P4j7FIpvyQ4Kx4jpmtpeYIGH4WYso3XWfU9JDA2JEdL7XoBcstMtdgCnPdfEYJTv
 aSiI260k/D9HEjfiA3lQE7ZWEa7GrHIq5/LXHcXxvDPY1mXe6T7+4ud7dwMgIOmBiGL7Kjot/ld
 ZuFb+YcjURQmqyh2PipO13qIanh1Qwxf0vj/VaPEgOruU32FwqBOr6/GReXLldiTTJX4+vGPOSR
 owx6IscVqLNTnWt5PCUwolP4WL2Vi9ljgF3OH4FDabxN7IZSl44EI83XY/z5O4ISmtIYX2ps
X-Authority-Analysis: v=2.4 cv=L4kdQ/T8 c=1 sm=1 tr=0 ts=685dd923 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=UcOP7Zb98ZuMvhyqNpcA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: JBhkZekgPVKS75mr_pgIlUL22IegluEl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-26_07,2025-06-26_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0 bulkscore=0 clxscore=1015 suspectscore=0
 adultscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 spamscore=0 phishscore=0 mlxlogscore=999 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506260202

On 6/25/25 12:53 AM, Dmitry Baryshkov wrote:
> As reported by Johan, this platform also doesn't currently support
> updating of the UEFI variables. In preparation to reworking match list
> for QSEECOM mark this platform as supporting QSEECOM with R/O UEFI
> variables.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  drivers/firmware/qcom/qcom_scm.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
> index dbb77c3f69ddaa931e7faa73911207a83634bda1..27ef2497089e11b5a902d949de2e16b7443a2ca4 100644
> --- a/drivers/firmware/qcom/qcom_scm.c
> +++ b/drivers/firmware/qcom/qcom_scm.c
> @@ -2005,6 +2005,7 @@ static const struct of_device_id qcom_scm_qseecom_allowlist[] __maybe_unused = {
>  	{ .compatible = "microsoft,romulus13", },
>  	{ .compatible = "microsoft,romulus15", },
>  	{ .compatible = "qcom,sc8180x-primus" },
> +	{ .compatible = "qcom,sc8280xp-crd", .data = &qcom_qseecom_ro_uefi, },

R/W works for me (tm).. the META version may be (inconclusive) 2605

Konrad
