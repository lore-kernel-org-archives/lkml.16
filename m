Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2A5E28A415
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 16:14:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748448868; cv=none; b=mrB+vnRZr8inUyZjQuRjPA31z4psbAZzedxQO1025eaKX6h3j6vC0NKIEN+TZ9ryY+nBymUCCF1AiI6jG6kiHq1ZdXHAzZZQGwZQclkp4JOKoI2LAhgV43jBT3WFr8lV5S2BEktYplXTOzRMOP9Ls9rQEruoIzSFX81++uYAjv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748448868; c=relaxed/simple;
	bh=QJdyxYVj5zDlcJECQEtZD08vxWZcLAjaOvhtB+EnjXY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HhaHw83adSZ9F/mOp8/Yp58fh7espg2PrAmkrdVHQMjKpS1hqoSYVQlLQJD9lltsY+9yGOa5eRam9Obm59B6QSB6XBjMsABEmw+daov7dM0DopWVd6LL3w9lo2CEuBeMjr38FyIOdhsqUTLYpN0+lhg9n1Cx7cSsWT7oDhdtK3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TmCwf+/Y; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TmCwf+/Y"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54S8w9QE027572
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 16:14:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=LB6CBliD4k5uqB9EniBQVYzk
	+cEcLB4aVJE1tbd9jHk=; b=TmCwf+/Y8y/kX9iYSyiIi2OD2S9H3JG4G47xZjuH
	ERb/bUjy5JF2WBz6EctGhG8VUpcCBpPFcbSCOvtDeLEFlm90TrdeJbpE0UNnRtBP
	3GmBIZsgU0/KnELrcWWWR1yU3Y8GqOnrvBAiNe76iohXDKVKhoWGgt4arjKEMQFD
	nWLc1xWOOe7ZlBCcVoKXRvOVg3cKV9RfUQPZpO2sb76eA9AQXGpJjgpA1rebdpZW
	z7NiidGLcnd/9zeKsUYg8KqJD1PI7QoZQauFY02doAbepxSbOhwumau+dCvBJmeA
	I7G1RR8lAqJLb1ACsZ2NW3YsKw2x2obsy+kW92xJA9eMXw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u6g92tnp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 16:14:25 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c7c30d8986so1416369785a.2
        for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 09:14:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748448864; x=1749053664;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LB6CBliD4k5uqB9EniBQVYzk+cEcLB4aVJE1tbd9jHk=;
        b=uxGS5JER6biU4lqG2XHq/GF3RUtAY0vYDCkvLDFKUnmc96ISQ3BFHABjEitJqmW+qW
         wHgMZYPR1Zat8O8y02cNesCGEDQm3QrSxg+vu1M/D31vm/oKSkUoSZ3/vwoZZBT18aKg
         ZplX73wazRL0x7EI4F+doAJBLh3CXoc2M2pr0LLDMOuurYuQWoDkWeaNUDKcaz2OKT8e
         i3j83OXS+6bN0cZHBP9bQBSjuNCZ8n6jGiQLoaDoW7wLhZvSstf0uczcVbnfBwGdZWy7
         kFCgRFNN/MoW/EDvH5LIFEESSJUJ0gy7Xoh5Xq4qXzJJs74JlgUrU3nFtUsU+QGm/VYS
         bxiw==
X-Forwarded-Encrypted: i=1; AJvYcCVW6YLNho1LVNk1jF6GoqW2Xltb6pk1lCIYHfrNdLRJKpZ6IMzg+rE8FdML6ed9nlZhANY3XvKjbAH7bYU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwBta5NNUWE0tuLPkwREO7/vHHrQHgCZJXVqeTFap+uHvV9qHVe
	vOEXrZG/tVdGrPOtEJ4l0RkHFUniJuidy8PtLYFI1Wtrg+QvITGiNZXZx1q7P/YcblCpowwFLN8
	CZIKS8uwHPMo7T9BE/AhpthFtuSAZfMvZ1PIfNgNAFWG88Q4aNNk8d3NjOSxpSg8/xtdG82oezL
	U=
X-Gm-Gg: ASbGnctugSnk5FyeksCI3HQTnsj7EbJAtVYdu+solRs4CZ69ZkIXGeikVBjASlR8fln
	F0jdWv0z/42ZK8HkONF65MWnHx9AMUte9gpd2BNc1NJpQudXf02Bp/KmOh4sFRQ5SMTJ51Z6ZjD
	72pmfwxxYqAf6eo/dMsQ0mvjIRNtwGuNHTz6RlXJECT5p31fYLn2If3fYyKZkwCBXEqURV/uFYQ
	Pv+3tmXXhsVOSMVoMN6KdURDEBJHJUbkcvGgFCwGY013rEG+maRmxap3YBg/m3hJd/+3BIjU0hH
	fhka1wgRefGgoQkI7ysO1dy2LXvdJ3TK4btWP7GqOwP7RZDRxZAHalC8FoimTrYfpC07UKfSHGQ
	=
X-Received: by 2002:a05:620a:27ca:b0:7cd:27f9:6ebc with SMTP id af79cd13be357-7ceecbacffemr2728803785a.9.1748448864252;
        Wed, 28 May 2025 09:14:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGdCyIX+70l5Hzm07IkuljfZ0EHSRrY4+nEO5CwtACrM9CunKN6HGzblCxhM/txRHf4Vv+kpQ==
X-Received: by 2002:a05:620a:27ca:b0:7cd:27f9:6ebc with SMTP id af79cd13be357-7ceecbacffemr2728800985a.9.1748448863915;
        Wed, 28 May 2025 09:14:23 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5532f6a89b8sm339772e87.210.2025.05.28.09.14.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 09:14:23 -0700 (PDT)
Date: Wed, 28 May 2025 19:14:21 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@oss.qualcomm.com
Subject: Re: [PATCH v1 1/1] ASoC: qcom: sc8280xp: Assign backend ops for
 multi codec dai links
Message-ID: <5yfyabb7h2xode53xdqowuwfzuml4ytjjzi6tlvzj7htconwtf@456qh5trwijk>
References: <20250528150716.2011707-1-mohammad.rafi.shaik@oss.qualcomm.com>
 <20250528150716.2011707-2-mohammad.rafi.shaik@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250528150716.2011707-2-mohammad.rafi.shaik@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=d4b1yQjE c=1 sm=1 tr=0 ts=68373661 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=MkCF4ZN9ME8HeUR9PkwA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: GPT7a3-CWDgXL0yNQemoTdqOv784lBmu
X-Proofpoint-GUID: GPT7a3-CWDgXL0yNQemoTdqOv784lBmu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI4MDE0MSBTYWx0ZWRfX7nMV09FPt5Pw
 TP2n7BarbMKtKqNitB4N+t7n42VqeXBfRFttmxnoK7q3Qie4ql5N8kW8HQXA41+uG7oYX239IRF
 +pJnyMufpocgMdJKBO/aQhc4qXQwdM8uMWH/1Bw8eUNisUKMHPXNC7NyVF6BTfUU6SPGZpXSvrM
 hvNetqkAoarKOyMmnJiNH7tnuqLQ6QrD34ekevWEk/ZB8+jmytCmrNMOa+zRt//xfmv51e3jcFe
 kmHaR+pBOPLKNXDiigJTDOgwmSKaYb+ZXAmEaWBgSTJHPHcqlL8NdRYJItCOzzzbxz58CpB8LIo
 3OLAnSQI88ge5CZoA/n6AKmnPFLg/8vizP/ZVhi/pE36xJDgGgVB70Yv+4IzIE0IVFbEHEH6nbw
 kJKfgkvTyqiwNKyJ1gji99zWAv5UEpqpFVK3rYAKGPEFaFB3SEwxiibeUUsQtTIBT7kIDVNf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-28_08,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 malwarescore=0 phishscore=0 mlxlogscore=680
 lowpriorityscore=0 priorityscore=1501 bulkscore=0 spamscore=0 clxscore=1015
 impostorscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505280141

On Wed, May 28, 2025 at 08:37:16PM +0530, Mohammad Rafi Shaik wrote:
> In the existing implementation, the link->ops assignment is
> conditioned on link->no_pcm being set, which generally happens
> when a platform entry is present. However, in scenarios where
> there is no platform but multiple codecs in the DAI link,
> backend operations (link->ops) must still be assigned to ensure
> correct codec settings.

Could you please provide an example of such scenarios?

> 
> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> ---
>  sound/soc/qcom/sc8280xp.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

-- 
With best wishes
Dmitry
