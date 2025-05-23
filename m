Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C89A92980B0
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 17:37:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748021850; cv=none; b=pU0wrSj7Qq/tHmyQuet0fIGv71fEsWwF9rEMv413ES8ZqrfMdCS4fqEwcji+AykplJEkK+B8It93CdBzaRJeQOJVAedDH1hhIzEVwztnY13/JzE9P3Jh0BzKako/VknwfqNMoEiAIGAuF+2Es804Gb0S4lUeNIYdYYGchIzM5Uk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748021850; c=relaxed/simple;
	bh=03pShiNbAL8hdUAr6tcV+vAvJofXK7gi2r1TWKg8Nwc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ezptaW6jxQhnFBL9LnRjkWwWWp/Eaxw2U3OJaaMhVHtFwVrNytXYDlMmhLkqwzTD7m6Mzhh9Kfqvs4reKxiXejQXrOevkyHosBtOhDpXw3ZY++kgV7sBresxEMaaodmNeKKRz+0Nzslgz2dGFEQ1Xmfe4GX+LOABmGYfgtsH1ek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MbRw3+qH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MbRw3+qH"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54NBvHnx029654
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 17:37:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=lJD2lVdig7BMAjKoIkIMyquN
	SchIwDTfIsQ6MPP8qcw=; b=MbRw3+qHJpJyHuLlezwbfpLjFQCKtkV3Sx6fdaVs
	X1hl+kNMeNE+H/v/ur9yOMwwLPI829F5MjfGhSVAlGLaQs/CWj/+fL2VtePJuI4c
	4aNwj+dOoatPGYJjtgpQ2pEeJHT+3DLh9inHxX7MU3wQL1EHhyMRaVESzm8KXw1a
	FrKSEcJiIGSNNE9cMsmM7cZVm9e7tRvMrZOAkBZeRNl+bcBH6vH/YQ3kRFjVRJN2
	1RhI49X1EfcSKFmyVwizM9ltyn2pkDyqTgkF5xvYDvuQfB/sdRF17SOFNZJ3mLg4
	2r5hELZc/x7GUM8rbDgHwOIrHfYt5MAlpU37iHmQzTNtNg==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf4avam-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 17:37:27 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-4e1485c9febso67943137.3
        for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 10:37:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748021845; x=1748626645;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lJD2lVdig7BMAjKoIkIMyquNSchIwDTfIsQ6MPP8qcw=;
        b=S4X9/3+9GZ2QIkj7TdHMxp8n7mn8j8DregvzHLhyytLSqJ+yYfreNVkC5JjLvbj8WD
         vYwJ7WlE06ckly+Uq+DDUO6HwBxuH9SIgxPWjsiZlrvPB+v9Vmi3NwsQaFCZUHpRFgbR
         p+jMulWEOt/V314Gn9U6S+HvvB5ScGFrjJfshk5daCYhnEI5f36IvtlVgWvKE63RffBF
         tjUlaeXYHvgj57+HQIoBFytOXkcyEqwtzkqRCL6BQq9QKKn7JVqvyj3PsKkYwGKhQmac
         p6WyObKHoCQ/RGfJH6Hm6CHoc2plQwEdzXZ9oiK6dsMdRhst+gUXdC+W0hWxavHWmG5l
         OZ1g==
X-Forwarded-Encrypted: i=1; AJvYcCWcxh9oIhU09GDvUOv6/qqqR1+ibfy+sTzsAGZCVpCMpP/BpQu28aI0lV54b0FcAB1bGr2URnr/Tv95188=@vger.kernel.org
X-Gm-Message-State: AOJu0YzDg5zIJCnBOw/urv3hOCRjT/VoiQ8n7HqNn4b7td7h6aHVFB73
	EzRhbOkf1XPGP+6lNKhSgeoIP9IWi0lrFcX5ZOeE9x2AgIYnu+Hl7b0QRtaZcC4YOwrWE/iXP38
	NKQEKwqJsw/wfrC7LRHtAZxLf3Ro1rbr1UeQzGHJ78G/7mXRcA576hfKxByE2UBZY2W2UkMpyab
	cayQ==
X-Gm-Gg: ASbGncsfZkAzuIdW+QRYuCdD+jfrwHXOdBujnAHfvAijVhHBPQO+F5I0RlmfSfA1rpB
	ZuxhmTYsUuEbym8z+yDLPGn7dGJWc/WgU/d/SOjbdeV/AGOcCqI0TCLUx0vt1yWp1kZQqaxQE2g
	nsIyTd1WQi7yjhsouHrIPPEt9vmD1fYCX2pHxp02WpiRUUfFLrinZEQ3dPFhVsoR1hazOOcjPYp
	WD/3FfO0OOPXt2TT0NnfhoP2ICHNqErb9pRIOYRIo8SC++5O8CYs7jc4bApUlYOhrws7BgJn1Dk
	jnY54mXJh5zFaR+VPVJgOb1DYZQimnDX0lSQ4dkYogrq85AwyIO8LjjM8HoE4Qdb8jvjR2FaTiA
	=
X-Received: by 2002:a05:6102:8096:b0:4c1:9780:383e with SMTP id ada2fe7eead31-4e42406acdamr470271137.4.1748021844867;
        Fri, 23 May 2025 10:37:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE0EZu9lcZb+hOBPFTudkTJe6zE3Wo94qB00vk325UKK2EgDJLgfCJK+Y5h1ka3Bq7Givcqcg==
X-Received: by 2002:a05:6214:5c4:b0:6fa:9d5a:ae6e with SMTP id 6a1803df08f44-6fa9d5ab650mr1637906d6.6.1748021833528;
        Fri, 23 May 2025 10:37:13 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-328085b908dsm38143901fa.72.2025.05.23.10.37.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 10:37:12 -0700 (PDT)
Date: Fri, 23 May 2025 20:37:11 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org,
        Sai Prakash Ranjan <quic_saipraka@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 10/10] arm64: dts: qcom: sm8650: Explicitly describe the
 IPA IMEM slice
Message-ID: <uj3w2kqaq6dri2nvl5be57hwe4sazlx4fhqrh7mcark4lltbqm@roalb3dmxg6q>
References: <20250523-topic-ipa_mem_dts-v1-0-f7aa94fac1ab@oss.qualcomm.com>
 <20250523-topic-ipa_mem_dts-v1-10-f7aa94fac1ab@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250523-topic-ipa_mem_dts-v1-10-f7aa94fac1ab@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIzMDE2MSBTYWx0ZWRfXynFmW7w8nW23
 fcsaMNJB5IQLK+6MN+kzBVsRZCbkpoqfMXaqclaD/ZIKJek9HzYloxAfz2ciKhYMB2lPN0Ppjon
 4AjpFSrOnAp80jzz1txClDXfQCB/x41C5LO974E9Ycc/YyJtnqVmieiBFaoPS++i/+OoR3rId1L
 moNAyjmvj+ndszB/bfjK56HV7j2wHG9HcW3F3FrFzykrLXTDjDz5IPGtI/dY0afGRyj4HKkEWag
 Byup3mml0hdu5DV5F75IQ6t1B1vN0VmNF66Xdxqed2fEc4VeSouNmQMNF6WHw+hEksgDMe6VbfV
 94cK0trLOJfQq3Wn5jPUbTwJShC5oFsOmus/Oj3AUH/G4dfX5V4NC9kpjXcg7tBZuSFE1xYAMYE
 xG2gefLFl12oxPD/Qs7NEPD06CJSaV3y8x5KV7/ZgDpOR59Opnt8z+z75qNBRmk2aiIDp/kH
X-Proofpoint-GUID: o_9MHxz55dv0I9czhsP6Jx_RSLC0giXN
X-Authority-Analysis: v=2.4 cv=Ws8rMcfv c=1 sm=1 tr=0 ts=6830b257 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=CQVN2WYv2dQaG0RyAuwA:9 a=CjuIK1q_8ugA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-ORIG-GUID: o_9MHxz55dv0I9czhsP6Jx_RSLC0giXN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-23_06,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 clxscore=1015 suspectscore=0 mlxscore=0
 bulkscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 mlxlogscore=703 adultscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505230161

On Fri, May 23, 2025 at 01:18:25AM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> As part of stepping away from crazy hardcoding in the driver, move
> define the slice explicitly and pass it to the IPA node.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/sm8650.dtsi | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
