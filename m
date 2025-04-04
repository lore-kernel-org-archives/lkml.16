Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E785B19DFB4
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 22:56:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743807408; cv=none; b=nNZaSdP3X4Ec3gZT0PwWYQDsigcPyLvLYNLLuDmNXUEBF7KeJa+zWd9vW1c4cY8mpjfdjtvhJLpYLOAfY244+lsGmIEZ4UK7FTZaGcj1iXSoY6eV3qykOg1srvySi2USJ63pN/3LbvNwOSiuRj+BG9eGZ2pv1H5P08B/Tom2LMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743807408; c=relaxed/simple;
	bh=vPXYIfrG6q9HsAVXkIxNlNbByo7zBEe8iBfEas3+oS8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EA4ezn1DU8ZpaFwFC6f9C2tPWxQ6VHuetnuWbKqntwEo5PNK7bR4y7NzRooBIM9PigdNSbN1lhjpRbMv+x4VKIA2q5G+P+gJ84KDO/0DezN8J0C2vw8ehlXTmFNbWbZgf15P2vXZf67i9z198IR2Hi5J6+UpjZOpw5xssWUovnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MiXb1W5N; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MiXb1W5N"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 534JEppR019910
	for <linux-kernel@vger.kernel.org>; Fri, 4 Apr 2025 22:56:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SZPli3NzDEAv4TZgDVbK7Lj3pli6NOmyPsLXJkWkw+E=; b=MiXb1W5NKrJWZt/Q
	ASg/N7NUVuofhM2lPO46USrEHbmbMSMcz28t+Dy8jVdpxBel9XesrRWxhG4/AuMR
	BturNc5tpeH4W231Tg4lvkWX4Uss6pwglspsscZ9o/vmIMVDDhPWOD9kzHp45mp3
	Cg/gDX+eFWyP4k0afccLX69fGxujEGZ8uxqQSrqcoJVEY2HZ2Fu05mRyMJEftkgv
	VZAvPmnukA+7v5T2XcFWKB4/BevMvJnxSCl7bAv8EfitO0n0f1MH5tRIR83atgOB
	wYZBM5Dj4dGrisJIkpSnG/M9AczluSrGea+2h/rMTsT0Fcv3Ym11sNNNymEX83ht
	GPBQhQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45t2d433c9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 04 Apr 2025 22:56:45 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c5ad42d6bcso61989185a.2
        for <linux-kernel@vger.kernel.org>; Fri, 04 Apr 2025 15:56:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743807404; x=1744412204;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SZPli3NzDEAv4TZgDVbK7Lj3pli6NOmyPsLXJkWkw+E=;
        b=Z32i0gUkOfCeFymAQl2AOQvO+j8k9j64oS7BVWcIOLcm4dqJpUtvrzRA6L53CAQAtA
         5x7nIWGGR8MxiaHut+BD0OevFO64DkMDgoiQL0eobnPqfufj7p9vCLdJwavg3b2iAjB5
         gyJ6GvP61QYjVZxIUcpFUDoWEHw6KA9EhpK0FlQ06+VMDd8p8dctJWP1oxgpqk+O1f8r
         j8kU0mGYA2rHmFugHyYBOEJOV0ypsmYsMRLHWqHmXfs3LRUsEI+ddi4lw7ML8+KqXgKH
         Ze+TLRuKUSfnxQrUVLLBnOydXPdVc0PL73UfG8ft+lDo41PbbZe1uI76GmJ9oAUbc5Jo
         RWcg==
X-Forwarded-Encrypted: i=1; AJvYcCXGm+AHiaA2AWuCyRoRp6XwmEPG5bqgxX4f8dBR/KIOrwsXnN90x49HVevFWnFbQF5fakDjLEk/rOm2vP4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyoOtzkUn/M4bdsxqiL/Kfu0gIU70paG5AGLtX+kZ0Y9jpy93zi
	aFxEnqWCNCH9zZtgcLBnL9RodMWrEgANW//QzNVvQfPtiiZ25NQRw2EreQ3BOZhbQZGqoxkdyBW
	u2Mrr3+S2OoInKwLeg64XOzmR+4OVvZKynFOtmMExHbmJ4kdsESJXY84/ncav43U=
X-Gm-Gg: ASbGncs3oDsx8DuF6TiimvqmlQizyIKVxCLFNACQGOMb+x6yHG1vgHp5UycpeGMrJ/3
	AaIDgUiiL/Hv/wgYCTPn2D9L4tXdlizkELzfmXmKBmHsHOAuMn9c29ZvbyPqpjvrh6+lN1EIB3w
	gg77KXrVvmOTnR+BXGCJbZHI7YlfG+An4gKUYAWa/IUP6anGzR0FoXy2GWc6KKB/8Dkm+KbKant
	+c9Kd4JPBB0vQ0imQgL+cNXYwtwdE0PuDK5AawMCrUbBTt3i7UJhS7AYOgHsNDunJa0H9piFdXQ
	qvD9VStiD3fZgi5PjJ0MPGXagReHlvEkSiVKiBdUZHaOeuH57IMyZX9YNqAcFXt2c98QjQ==
X-Received: by 2002:a05:620a:c46:b0:7c0:b81f:7af9 with SMTP id af79cd13be357-7c774d27d7fmr276112685a.6.1743807404652;
        Fri, 04 Apr 2025 15:56:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEXKXpJs5IzNH67kxafG55W+zbN89YwyrK3gKP53Cv1F64bJTVeha/BdK6RnsTvdMHYnhaAYw==
X-Received: by 2002:a05:620a:c46:b0:7c0:b81f:7af9 with SMTP id af79cd13be357-7c774d27d7fmr276110985a.6.1743807404305;
        Fri, 04 Apr 2025 15:56:44 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f088084e3dsm2885893a12.55.2025.04.04.15.56.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Apr 2025 15:56:43 -0700 (PDT)
Message-ID: <fe00c1b0-01ee-45a7-964a-c0a75e9e8e68@oss.qualcomm.com>
Date: Sat, 5 Apr 2025 00:56:41 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs: firmware: qcom_scm: Fix kernel-doc warning
To: Unnathi Chalicheemala <unnathi.chalicheemala@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        quic_satyap@quicinc.com, kernel@oss.qualcomm.com,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>
References: <20250403-fix_scm_doc_warn-v1-1-9cd36345db77@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250403-fix_scm_doc_warn-v1-1-9cd36345db77@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: gBmVNjSlDtXYolLv6plkOxZfZL7YqH4i
X-Authority-Analysis: v=2.4 cv=HrJ2G1TS c=1 sm=1 tr=0 ts=67f063ad cx=c_pps a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=M7GtDsIe8x9ARHnTdgoA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: gBmVNjSlDtXYolLv6plkOxZfZL7YqH4i
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-04_10,2025-04-03_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 adultscore=0
 bulkscore=0 impostorscore=0 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 spamscore=0 clxscore=1015 mlxscore=0 phishscore=0
 mlxlogscore=968 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504040158

On 4/3/25 10:38 PM, Unnathi Chalicheemala wrote:
> Add description for members of qcom_scm_desc struct to avoid:
> 
> drivers/firmware/qcom/qcom_scm.h:56: warning: Function parameter or struct
> member 'svc' not described in 'qcom_scm_desc'
> 
> drivers/firmware/qcom/qcom_scm.h:56: warning: Function parameter or struct
> member 'cmd' not described in 'qcom_scm_desc'
> 
> drivers/firmware/qcom/qcom_scm.h:56: warning: Function parameter or struct
> member 'owner' not described in 'qcom_scm_desc'
> 
> Signed-off-by: Unnathi Chalicheemala <unnathi.chalicheemala@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
