Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 276A82973B4
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 10:47:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744714033; cv=none; b=jJXE796n7eEg9SsB6f+tP7phCAZwC+j56EycGqi9VxLYqQpG/EmIqDFrXjEBI7GMDCYMTS9XKvpR5DgIvWzNsZkUnkiYLOQdrRRYkYcbyMvZR+3nmSWaNB1d/v7p6ujlfHNv9+e96PkU/W090p6xqrYay3wseZ7V6cww/X84Lm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744714033; c=relaxed/simple;
	bh=PqtFIuf2PaqgdiInwLbpBw6+hS8F+gVD8HwKtn8pZqA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hXJ8yLxE2gQlWuS+N4lo52t64jam7SjYe9h1AML675BxnjJFz+vhRueNudJnshdqPjNuRCXK8NrFv+lZEoyLipvXILwh+F7KcLI70S/4YrlQC8FwVMUzWBXHoubBF37xMWpnlff7koXNJWcMfxbgPqVnBtA2xpoTQpXPJEdET4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pgy7wjpD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pgy7wjpD"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53F8tIBi025007
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 10:47:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	i+0K8i6mH8nJR7NC8EwJps6/hl4dOeR4gugtJgCdwYo=; b=pgy7wjpD+j7ZcTHN
	8APAM5p793Q+6LAs5bBg66H26ynbIZkEFKrHzApOOfBwcwzBG0Tyl19Xp1AzgZZJ
	JdSR/WnVXIXf2oxeeO2/Ne4+8fWvRRL6IKLAK1akpWr4gR3JcuT5Jt2WOUK8oI5L
	zPSSOngoSlJ3R9c0kMn+pzYTfQ7tUSAO1ulToAuFL5SywChM78+nzPKacspGrWSC
	g/VLzG2liy0HnWma3bAFwwYwWUR+JWyMHo7l90JwqM6UgEWZjQ7xptsTfsbKAvvc
	P0duLOSd6HGwpVQPJc/nJi6F5aaLjVjMO8xcbWdeI3EQ+NtMGdiyOtSg0gzSH2Qp
	j/oe2Q==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yf69qs5n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 10:47:10 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c54734292aso149200685a.2
        for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 03:47:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744714030; x=1745318830;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=i+0K8i6mH8nJR7NC8EwJps6/hl4dOeR4gugtJgCdwYo=;
        b=PD51QluYeAmlnb4vnWMIYg2ptFWBEeeMPFMo6j+wEdFWBRqqU5ZD0o4+LtCnm/bgXD
         OG/77TZNKycMg2lHI+lEOYSi2q8xow4E2MDiHpyEMTKidPjcP6BG0FMVCYguxnNuhDXa
         pnVSIfF6cmV0BUG2MfyF93+3eSBMq4vR1SKk0pJ4Pmz2/pKfYIiUE1Ox4bQb3mvOPoC3
         nKv8murbSj0SPAsbwvPhOb1orx7e0s58geZHAIJO79A7nYymFZdlasaRm5AYA1N1GWjN
         fPYAhS8tSJwArGpEVgHTJo1InsApL69bP3YLMM/Sl9VfVhSKSO0EebcVa+wxD5KijcyB
         1fBA==
X-Forwarded-Encrypted: i=1; AJvYcCU8msAEGPm3SCsKTuCJKhJXe4iSowMtob9COVLIhs0mEK+bOqVOHvHcerZuUl1KdmxY6J8LbRxdAB0ZF+k=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2bGY1ah5vJGEu/hB7bk4zl0XRviyo80bBtOiVvRNJkgI5pzW0
	wYsPbFnA3UrYEw8MefkKt6OgXWntj5xeDPB5UadJSF8NI+F3E3xzSqgwYbYctTq/SMD/OsDzCNE
	E/uYWtc3WlOEHm8V+VhS/N7/VetE9kTzMxA7MhGO9I1f8e0fSrTmPty51W0FhPxE=
X-Gm-Gg: ASbGncuS7u2KSVWLXFE0w3+WzllKN2uYjADgmgZkDjnp/EgheJO3djl7KzJnMux1JPb
	SxBZYoNB5jU7LKWrzPJOOatQN3oRCRzl6tel7wfLVtmun0lQYBm9530Y+CqIjW3P3z7zrhh+hOg
	tPLwEe8/O6Ve8f1gtL+zPeeAZnFfK8TMtSl8kwevjxj/selmfeNhS/E7SCUoy5fdpUHoK6XAYE6
	F7rps4pv/nwCKCqjIyZ/jewlwadANTPKg3e0d7MxTu2R9k0xFqCzdUkV00E9BGfVWw/YazkdsmR
	z8tr+3MsuBZbKL21d4zFLRPFjnXwo1I6CL4Qj3m/61H3Dx5sOevDnpZ0xFzps9/0Z0g=
X-Received: by 2002:a05:6214:1ccc:b0:6e8:f88f:b96a with SMTP id 6a1803df08f44-6f230cb3911mr91910646d6.1.1744714030250;
        Tue, 15 Apr 2025 03:47:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGNYL4z0DB/Khp1jZUpEcH1GVQrkbUtyiS1sATDlqHZ4vEHbFck5KX0mNwlVzq/0T15uZOquw==
X-Received: by 2002:a05:6214:1ccc:b0:6e8:f88f:b96a with SMTP id 6a1803df08f44-6f230cb3911mr91910556d6.1.1744714029923;
        Tue, 15 Apr 2025 03:47:09 -0700 (PDT)
Received: from [192.168.65.246] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1cb43b6sm1084361166b.93.2025.04.15.03.47.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Apr 2025 03:47:09 -0700 (PDT)
Message-ID: <1f332cbc-9a1a-4a56-b929-cc008e17e25f@oss.qualcomm.com>
Date: Tue, 15 Apr 2025 12:47:07 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 19/20] arm64: dts: qcom: sm8550: use correct size for VBIF
 regions
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        cros-qcom-dts-watchers@chromium.org,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20250415-drm-msm-dts-fixes-v1-0-90cd91bdd138@oss.qualcomm.com>
 <20250415-drm-msm-dts-fixes-v1-19-90cd91bdd138@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250415-drm-msm-dts-fixes-v1-19-90cd91bdd138@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Qt0IH7HCuqDm8Nk4lEPMPuJkT2W4suTc
X-Authority-Analysis: v=2.4 cv=JNc7s9Kb c=1 sm=1 tr=0 ts=67fe392f cx=c_pps a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=da4WsfccAxvekxWPt1gA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: Qt0IH7HCuqDm8Nk4lEPMPuJkT2W4suTc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-15_05,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 malwarescore=0
 suspectscore=0 mlxlogscore=633 lowpriorityscore=0 bulkscore=0
 impostorscore=0 clxscore=1015 phishscore=0 adultscore=0 priorityscore=1501
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504150075

On 4/15/25 12:26 PM, Dmitry Baryshkov wrote:
> Use allocated region size for VBIF regions as defined by the docs
> (0x3000) instead of just using the last register address.
> 
> Suggested-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
