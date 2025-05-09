Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8097528D8FD
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 09:48:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746784141; cv=none; b=mPM082FyCxrJjeAjJFal7uNVxcFWZE4rk46GEkqr4cv+yG0W1Ygko0VrEdgGIO9OOtW6gxlMSdUjY/lmlJblZC85IgJOo5ujnR9T/WL9TNx2Rtu6qkS9prw4+rpMHVlFGUC1zFvM9FAnH4Ygj1SWhU+j4x06lKRFVgr8BjdvxvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746784141; c=relaxed/simple;
	bh=jMWjHD1rTFP9aLEdaVnBGZKpupXl27qmoo3tPrPAil0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ciRBO6VcCnDn6Wy0/83h+YgQZdh0xaU7S3ohnjWf5DsjjinWAabGOnXwO7diINUnqenDSXwdTcvyOvvnLN54mGkNrJ54VQIGZuu7+PImB3S2dLSRXs8739qx6lG6YSjP+sH3Ag4W35diNqZnFuPoI9eu7I7AU44YGjQYSvAzHQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VaNxtUL1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VaNxtUL1"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5491VFJq014411
	for <linux-kernel@vger.kernel.org>; Fri, 9 May 2025 09:48:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=5TZMgewoxR5IAJtnCtwQR+2k
	wH5UKsrPDtd/6+1VrS0=; b=VaNxtUL1oVsr1dhcXJ2it5zo0ih7756dwy5nCFJO
	iCeFWm22nhDmGndU8XM7nGAwb4X0RZxxlMA32BujW6AXWQkbqKlyu9xqAlGP0XRU
	jjWF7+jY3XYvTVLP4FhQMWWapRHprrxzB9GqPO2ieM8kYLeZl6uI6vlG1OPy4lb5
	oQt4y2m3yB+64ItM2hJubRcusZuwUJV7l0ak4Okdg1FVem+8hjZvPjvXa3UMKlFS
	yyEfJlCSk+/UV+wdcJvOOjXtcDmy8y6KjbzwJfNJlQoqkkf/GkV7t2nte15mYhpE
	RBBAVTkZPJImHp4wbZTwYjJCGeYBuHIVmxpkHSclSHWGlw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46gnp4m734-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 09 May 2025 09:48:57 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b00e4358a34so1276612a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 09 May 2025 02:48:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746784137; x=1747388937;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5TZMgewoxR5IAJtnCtwQR+2kwH5UKsrPDtd/6+1VrS0=;
        b=vJvTJVHn24Wpr7g1N/qhssExAklU5/XV9SOX6GUwAzDEVbaB2bfcBBE2iK3BB/nOBU
         BHxvhTyHqf3Vin8sOlKpZlzUdkRluBwm37yNBk3CGJeywt8PWzQ9+JdP7lmzEh06qX6Y
         sO/l7NseUbz287vrVKfpPi2ln4mP0y8uNhojycTQ6Z/9Uvc5s33nwuTWuovSSpAGaMLD
         ntyjcYCyd+8UyiKKyelRQD/IkFeEIjG8/AphKOirSmfXP8FkUohK8jTtFd1cOMX+MBGP
         DxcN4m7rbAbTzRkaGfU3HMkYmWmbpgP1LH5xc5T7CmYTMxmY5cTOqF0uMbQeIACFtHW3
         8uYQ==
X-Forwarded-Encrypted: i=1; AJvYcCXUxe0j33tDX69cyu+0Smara09XWB1WqB+GNTOBDNr2HuRuBVkl1es+uEPPoxIVCUkoEPWr/UcG9cCXqVA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzXZUZLhU+9K7QfvHIFUvaAu6d4XzIsbqop49NPnllHnrAeQBKf
	gG1Sa43yPObiAkrtHh7WHfKGXEHILM7JsA6qHEUYtBWm1UZVPDFWLxT2BRRZi9vIU8lhL8KrM1S
	l9iNEPD3vSfXfe7zBWWHvr3IXwdGCCiKiGBh1HBGSTymnkRegAp2zvAyBU7eI9AU=
X-Gm-Gg: ASbGnctd8a5IzcGbq+CmY4SY65aOyed6yZTjd/doloGwOni/YF1fahq7ICD4e8iymc2
	q9rh1abZ9wnxDw4n56gjgr7L6KnT/BfzEu7Ictrix1Vc5OrtyzPJ2UyoZFlCSd0oqA82oIhuDrG
	fPElFDdifSaSJYoOVlkd8oaV+pvfejGAGgmB0gmlaXE6Cv9OmLvCXtznfb5RYjXF34Bvq+l7SmD
	ZMVSSzIpgvjC4/rlqom78cU7AAlVPHvgaSfQ7a8cmP1/YTS/ruIEY0jOyRLPDaoGZk8/ssBNHgK
	mosB3J0uq+ElXMHBqpc9mR7v8VgT
X-Received: by 2002:a17:90b:4c81:b0:2ee:ab29:1a63 with SMTP id 98e67ed59e1d1-30c3cb19ac0mr4286938a91.3.1746784136707;
        Fri, 09 May 2025 02:48:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFQi8+RQd67W36NgGcktMBBwIUKFCg/Vc4iwo6NQv7JDqt7T8xUwe8qLgeEJmPVVbmD8JtrUA==
X-Received: by 2002:a17:90b:4c81:b0:2ee:ab29:1a63 with SMTP id 98e67ed59e1d1-30c3cb19ac0mr4286910a91.3.1746784136320;
        Fri, 09 May 2025 02:48:56 -0700 (PDT)
Received: from hu-pkondeti-hyd ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30ad4fe239csm3624195a91.32.2025.05.09.02.48.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 02:48:55 -0700 (PDT)
Date: Fri, 9 May 2025 15:18:51 +0530
From: Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>
To: Unnathi Chalicheemala <unnathi.chalicheemala@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@oss.qualcomm.com,
        Prasad Sodagudi <prasad.sodagudi@oss.qualcomm.com>,
        Satya Durga Srinivasu Prabhala <quic_satyap@quicinc.com>,
        Trilok Soni <quic_tsoni@quicinc.com>
Subject: Re: [PATCH v6 2/3] firmware: qcom_scm: Support multiple waitq
 contexts
Message-ID: <a1aefddb-6914-42b8-9ba9-8eb27a0ce2f4@quicinc.com>
References: <20250425-multi_waitq_scm-v6-0-cba8ca5a6d03@oss.qualcomm.com>
 <20250425-multi_waitq_scm-v6-2-cba8ca5a6d03@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250425-multi_waitq_scm-v6-2-cba8ca5a6d03@oss.qualcomm.com>
X-Proofpoint-GUID: nY8xgNzeqWFeT6n_7D18xaxDNVLF2T9y
X-Authority-Analysis: v=2.4 cv=E5XNpbdl c=1 sm=1 tr=0 ts=681dcf8a cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=dt9VzEwgFbYA:10 a=u9c1M-ofyWthsBcQn4sA:9
 a=CjuIK1q_8ugA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA5MDA5NCBTYWx0ZWRfX/5+IKARSWtrd
 yYyda15f0grMn52bbT5oorPfWiKZ+mBbACMAapH651y+aZNpjwpsNbN8rczNVd+Jq1ljK44bnzM
 cBt323HtbeqnpEu+PdWJbnO7EE+dMChYSsnnti/huOOaLoK4BldF+QMfI0bZX8+vCLYV51YYOVN
 4pczyVU0bvqNWesOCSnyvZg7I3czmTfpK4073nVy2TYLW9VNFuQOvT4cQelmpZQnQFJwDnBGFEj
 Alj3PbHVWh7KW5GNtjLjM6aPCnevh7u1vCGTaUPStWEb5fdLVdm/Ynfp1NiRwAdDfC9We+iE8UK
 mwo+et72EuSWpM6WEMvfutOkD5yCA7JZKil2IgMmZFDVBCzzvQk61vGABqWBRFORVef2QT+EGGe
 CFxP2aWlKzQqTjdrvvDIHkNvSlCw+wkhb6hPKUW5hoXfI+luDGoAeOsZic98KmHeCO9Y/dPC
X-Proofpoint-ORIG-GUID: nY8xgNzeqWFeT6n_7D18xaxDNVLF2T9y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-09_03,2025-05-08_04,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 suspectscore=0 adultscore=0 mlxscore=0 malwarescore=0
 bulkscore=0 phishscore=0 spamscore=0 priorityscore=1501 mlxlogscore=999
 lowpriorityscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505090094

On Fri, Apr 25, 2025 at 04:48:02PM -0700, Unnathi Chalicheemala wrote:
>  
> +static int qcom_scm_query_waitq_count(struct qcom_scm *scm)
> +{
> +	int ret;
> +	struct qcom_scm_desc desc = {
> +		.svc = QCOM_SCM_SVC_WAITQ,
> +		.cmd = QCOM_SCM_WAITQ_GET_INFO,
> +		.owner = ARM_SMCCC_OWNER_SIP
> +	};
> +	struct qcom_scm_res res;
> +
> +	if (!__qcom_scm_is_call_available(scm->dev, QCOM_SCM_SVC_WAITQ, QCOM_SCM_WAITQ_GET_INFO)) {
> +		dev_info(scm->dev, "Multi-waitqueue support unavailable\n");
> +		return 1;
> +	}

I am testing this patch on SM8750 and found that we are returning from
here, do you know why it is happening? The first patch in this series
does not check if scm call is available or not and I see scm returns the
hwirq properly. I have commented out this block and able to see waitq
count as 2, which is inline with what would be overlayed in the device
tree.

> +
> +	ret = qcom_scm_call_atomic(scm->dev, &desc, &res);
> +	if (ret)
> +		return ret;
> +
> +	return res.result[0] & GENMASK(7, 0);
> +}
> +

Thanks,
Pavan
