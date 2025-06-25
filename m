Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 021701CAA9C
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 14:49:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750862986; cv=none; b=W/tGgxSrSJYpubntfJtehib8EAExZ3Z3d7RaMhsuih5c+JQ7ZMs4dDHDLZDJ2vv1iEQDAeygzX5i82MrRB0xAi1hn3chmaMkuT3oT57MjOlQV2rLo28eN07i1RqWHz5cxHd2DsIlqX6tHerue6cCRXjtnK/c4bb3a/xnkunvwHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750862986; c=relaxed/simple;
	bh=SydFmCluotLIw9NnYRQSRlGNVDDpbWd7dRM0t5Z6aZU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=erTUqnIZjQqGLjKNFGZfeXCw4B0xJLQA3n3xSjqV0cIdwDmpodDtoqfY89IpBBo/h5+fG/TCNOOV6fa6rsyDSAXsRgTCQsNdQYcRhLGCCleCx8mfWuWi2h9NoVpp8x/e3S/iN+Vls/J232nv4pF1dfhnaAyWBJLN9VmtLht6dOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MWLILeE5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MWLILeE5"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55PC54EQ022214
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 14:49:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YtHGBFPnQcSTIMsJlbLHXvrcAPPKBzWjxwiK+zy8ZHs=; b=MWLILeE522ka2lmA
	VXfypJIT/XH7Ih6GykL5cILU8aGIwSPCBg99rLBhq17sBCneBgnZ0A6Kbnu4Nr/i
	5ebCPr/aHnkYWNYE/ALc/TKf30oiw7VjteQFbPKT8nSM+nqDUCv6lGpEXMTT0zlh
	XFCDMaHCnjOyRx3yL0Jq8muYN2KrDA6uiRvJMf8nq1S2otSyaktVaoUtCXnUhKaE
	E4WHErUWwSiHvzcf89DqTAUTTM1tnuBKTQJ2qweJC0D1BphBubCQj2h2tDeVL1h2
	9fx1rkypiMdZVPMBJNDXXcsVynmo36cy5+udi5hfXHlW2WzztFiISP6so1RvQ2gx
	TMBliw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47fdfwxjb7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 14:49:42 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7d097083cc3so185366085a.3
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 07:49:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750862981; x=1751467781;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YtHGBFPnQcSTIMsJlbLHXvrcAPPKBzWjxwiK+zy8ZHs=;
        b=KtfRqN0VbeU+0ut5RV90lUJTXLna8fIa+T88di7DXt5em8XiuYIBwR7DaNL2Oy3Qf2
         V5bsJacOS88LiUKEIYZw+FGBVNzpklXs6fYjJfyXIVJ3t/yrx/622Gwoi9Myo+a5oW6J
         IUp6o9wVXZa9+2sO4FtVoX7zs1H6+69TA3OhStXtQG/a1wsbAeAws6UsFfTpZ7TDaHxh
         zhgEjvNyAI7nb7cOQcCXPDErMe/XfwdU87Usjk4azC4R7LW14Vj2fsccEjf5h4Q/G1DO
         gZDyPECH6f2s26LiXLSEAhzWOoCkIJLY2yhslOrOHNmZnYXL3Ag0mc8Y1cEluBKG+Es3
         E4bA==
X-Forwarded-Encrypted: i=1; AJvYcCWRx0mdrSUaJuuRcmUSe8zu0HULMlLGRiNu1H3GijlCFnQVx4IyRRS6xJWiKuR1r1gERScJsbv2V1qswSM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxc3ctMHzMHO3NHM7Bzix8ksFovTKXVNKN5F6CL+rTB3OM3JqaE
	jbpQKc3KlBWUeZARhuKfxtpt8VgxlJLH2f980sPOL/v/cf/Myw/1UeSSrDBos/LIRwYhk21Po6a
	cLmWNwPcjU95KxxxbSv8cTCnR+64XldLc8ummb7vktM2bovpG0OMR3w0gRfxqwx3XYChs2R+rNZ
	o=
X-Gm-Gg: ASbGncvLvg9NrGgIcdo9cYmOBegQ63dWT8ogV6f8fSOwOG+GcybV1w29m4LvUaMbnUh
	01xVEBASS+pLBpe9c2perDWzr/5Bk2xEzB7Cvo7V47xQEdP+FQCsKLEwJKKbuIeeFCQMKcNLZF0
	D24mNmltqXMsm+1U2nYtXYXPQDINbYEEVpcTKklIvulvPgwzpO1wGmHjrf7xO/Zz8hc+mXDa0/K
	cBFT3wc74Hn+RbMucv32nZJlUeNA1GPQDQazXoHH/0YVKLlFQYDN1ngJoZkC0/cBthJFa1JKI18
	MHhSWMJ4TgBiZST7QaCqNQ95xtlAQGyOUwGJOW5EUM8wt0n6ThSHKuF042AlseEEHZKv8tLqlfT
	dMxE=
X-Received: by 2002:a05:620a:170d:b0:7c0:b018:5941 with SMTP id af79cd13be357-7d4296da2eamr157237285a.7.1750862981274;
        Wed, 25 Jun 2025 07:49:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHCfs7blbnaI2Zj/4L6R7J4yAYp7djTR661EQDmxDWY8nDkTHOsowmqinswXsBFWVpq+u2QgA==
X-Received: by 2002:a05:620a:170d:b0:7c0:b018:5941 with SMTP id af79cd13be357-7d4296da2eamr157235585a.7.1750862980908;
        Wed, 25 Jun 2025 07:49:40 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60c403a4a2bsm1824376a12.32.2025.06.25.07.49.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Jun 2025 07:49:40 -0700 (PDT)
Message-ID: <c189e03f-a3a7-422e-a156-ecfae92a7443@oss.qualcomm.com>
Date: Wed, 25 Jun 2025 16:49:38 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] firmware: qcom: scm: request the waitqueue irq
 *after* initializing SCM
To: Bartosz Golaszewski <brgl@bgdev.pl>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20250625-qcom-scm-race-v1-0-45601e1f248b@linaro.org>
 <20250625-qcom-scm-race-v1-4-45601e1f248b@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250625-qcom-scm-race-v1-4-45601e1f248b@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: PiNIF2RUZAeYuokba-fLx-d2qjVX2bF7
X-Proofpoint-ORIG-GUID: PiNIF2RUZAeYuokba-fLx-d2qjVX2bF7
X-Authority-Analysis: v=2.4 cv=MtZS63ae c=1 sm=1 tr=0 ts=685c0c86 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=U-aTzihQr3N9RfWzTXsA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDEwNyBTYWx0ZWRfXxoBYQlaO1/p2
 9ARR1zd+hq0gZspviIrmVeo4M9fxuEUPNfOKu6AOn01HTU0+nG/7/2J7wWDXDj+gMkTz387Ncpy
 NbiB8nQiR80Zh3+F+FkXxqUk1VQ7RvCIbq3cnLYdZOY/R2WkhIoD2r25EP9AajqoodN4LTg8yDX
 2YNpFHA6j0/zz5rrh4MYOi12xaQ7bhAKeEVA2APAiETbp2ap0WMXxd5aSPWQYDE7K4TEQ2brpTC
 UfN4APueBElEItFlzSvBCd2HiNc9xgBrEdaIgeezy3seuxolis8fkS//96XvNgymDkcAzWUW87G
 JheV0G82qDjvby4RuQ36samvznvNH875B/cgWUcGn5vPSZaD0uBtd37qC3K0Vq14XDT0vrcRGpv
 LR7D9jFB7+6H/IiqrgVDYv1tsLWehafBuqkUQrS8NX0pEIeIdrWPTIpDHv1U1CJm0OnrnObF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_04,2025-06-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 suspectscore=0 adultscore=0 phishscore=0
 mlxlogscore=675 spamscore=0 malwarescore=0 priorityscore=1501
 lowpriorityscore=0 clxscore=1015 mlxscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506250107

On 6/25/25 10:14 AM, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> There's a subtle race in the SCM driver: we assign the __scm pointer
> before requesting the waitqueue interrupt. Assigning __scm marks the SCM
> API as ready to accept calls. It's possible that a user makes a call
> right after we set __scm and the firmware raises an interrupt before the
> driver's ready to service it. Move the __scm assignment after we request
> the interrupt.
> 
> This has the added benefit of allowing us to drop the goto label.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---

I don't think there's a suitable reference for a Fixes there,
so let's skip it

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
