Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5DD721CC7C
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 18:54:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749495286; cv=none; b=lQbFS+kQ1dgPxjR5PB30tF1aj1QCYsd40Jn8gNKolPRapTdO4JdM07oIkA+wWxrDzuucuXrvELEZRlxwvsKxDnpxDSSU91aCzrxLY6cGwrj6LFZ81ENlBh8e+7mN0e5O2igHII6YyzaSVGJ8ZMzWhTK+m5NLrNmnfVbrzp3Vt+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749495286; c=relaxed/simple;
	bh=d/HuagAjGWuT+D+xMNfACpVB6mq/KbmKFKK3BRgoASE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kiwCiigR88UFgZOnuUyNvcM+HTKVXASV0CRCqOUEPtb9Ls7cTk8VJBsQwevQm+oNvgrtT1Yfx9cdt4gcQlmgoQvNe0AKHhNM1NOpPTHYXLG0mx0GJmTE2xHZT2INlKQ1sIiXgcfZYVayQsQ9OhCnAFp6YuW/rqqs2LA1h9B4HCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BeQjhE0b; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BeQjhE0b"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 559GTBWA002463
	for <linux-kernel@vger.kernel.org>; Mon, 9 Jun 2025 18:54:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=0Q7j6JWLfPAIL0zTecYfobk0
	dPt4Avr6FVotIxI6daM=; b=BeQjhE0bIDAzAZ9450ceDp5t5AFtsbnnpPL7K7lD
	lY7CXnC9+u/2cJLe2hAP05S9UhNYODDnkThUmBkNaoIZ3sBlwRVQi38IRBp2NUkE
	O+7hmUk5zqhQKIse4m9cOW3SBO7NBC5UjKavLOVSPgWR7gAn+j5r8vPwPO++mE52
	qYCHiJhLo0XwKfxag3OJoBbvqSKDu+6VPk7fhpAAKZJPGlFcSMidTsCuVEl5m3J0
	0I5E413QGPINSfDzmJS2Ul2N6NKVimM+to4dwxiA9GxtZ4qhg1sidqquRit7eOW9
	94CIR7AyRK1ng/FgbdeaFZbI/d8GwueuUxKIMOYAALhr/A==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 475v2y1qwc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 09 Jun 2025 18:54:44 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7d21fc72219so321681685a.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Jun 2025 11:54:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749495283; x=1750100083;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0Q7j6JWLfPAIL0zTecYfobk0dPt4Avr6FVotIxI6daM=;
        b=LPSeNeWql+SfytEpUhxqOXqTMHI/vcYqqrNERGHi+GRGZUju0QwqTIGoPvRiriFKuT
         yiykoxHQktrkeXsBONm3WAUGYIEMthZHZzFPDCR4iBJOr8kh7bECrF8LKcmec2rqC/VE
         feu46rPYNuJ6c/a0kDI6OpJVXE/Lx4ESYL/bl330FSljDekX1tdNo0TY2zfYCiHTtSFf
         sflPsIjjTgkiuDUwisnzItNs5lFcWHaBH2J7DV+RMk+IiXbALteeYcZefKwN/5LLG1qP
         wfbRjPfJ49SOjPDqRDO13angJUBZBuNl4kg+8wawlzGnvguxeIV3dJpI6cuijFqJOt11
         ZVPg==
X-Forwarded-Encrypted: i=1; AJvYcCVWdMmhxAP/s8Cw+g1D0MA1INR2no/Qv2M4HNM5BaRePBriqUvYF8be+j7sSe/zx8i5aFe2YUdaD0cy0gs=@vger.kernel.org
X-Gm-Message-State: AOJu0YzyNN6b1SmM8cBAF8tPtwYpNnjZbWD0XI1JaHr+VdKj+ncWy5Ng
	j6FwNp62NvLUxNoJi4HVMJscZRURr8kg9WPudg4YhokqX9sEqZSEtYIuhv41ZeDiD9D2syljy0X
	9OAoNMNM6Vq+Fx2q8QQhfdz7NHOmkcKOGuyjDRh245hstcl1XS90lEr8zX1+30f65pek=
X-Gm-Gg: ASbGnctqhUV09FBXuwpuKmNCoMfwMhSnwEyOojOOjfSAdCqAHnZH95ZXLkKHW3wGdyS
	ZxHY5daOouVtEm0GXjKgmZnW8WE6sw/jmwzcXGt81iug9COClxIInBEu4ZoFzjHe5rpZ9xB7pUQ
	kugYbI7TltOCpIGi25xJ790GrU9TZf8HkUAkjCQSMYC9/uqdF5ukZeMbTQPbKX/KJ7m3DttzfWu
	WOUjDlbroaVKg6xIxKylfDsrLq3luSdlvI8ke8gT5IrwSuXT6oForIJyOYSOPP+K1iJfjCxAr6D
	woY0pkIqL2rguj2B8rES7+7M63Jnan7D/dR+YWyAJmosJopUU/hkvyYhXCU/G1TKdYHMn7K7q7D
	klmtRgpXtjA==
X-Received: by 2002:a05:620a:2a10:b0:7d0:a0af:1ec0 with SMTP id af79cd13be357-7d22995c589mr1782744985a.14.1749495282651;
        Mon, 09 Jun 2025 11:54:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEyj0Zi9Wm7AlJmus5lOeyDznWCCczyVFTC/lx3IzF8V10z6/pDpyYpLgHsXKeVB0xoCMPtOw==
X-Received: by 2002:a05:620a:2a10:b0:7d0:a0af:1ec0 with SMTP id af79cd13be357-7d22995c589mr1782742085a.14.1749495282327;
        Mon, 09 Jun 2025 11:54:42 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5536772ab63sm1293535e87.178.2025.06.09.11.54.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 11:54:41 -0700 (PDT)
Date: Mon, 9 Jun 2025 21:54:40 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>,
        Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 2/3] drm/msm/adreno: Pass device_node to find_chipid()
Message-ID: <hv5zpb66oynxm4ge5ugvtgfqkwukxjazcsutn6phi4ll4lpuvu@r3t4dti5pfri>
References: <20250609182439.28432-1-robin.clark@oss.qualcomm.com>
 <20250609182439.28432-3-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250609182439.28432-3-robin.clark@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA5MDE0NCBTYWx0ZWRfX90GVOUlvm8fP
 VfsRWTCgP80SbfgwcIsD2QiaSWC58VUGl9FvArwp4bBCBJfTkg7Bq1BZbHyzHeuVSdxJCpVT0U6
 10eZf1FEB6euX20G6plKUYjoDgLIT1ygQDBfeYHDioZ+E+C12fRWRf1JkwsaVHHKaYJxr3fg8Y1
 f/mkZECNwyekX1DRMGFWsyWxYLeXjdSY+z3HpN7mhfl7qcMfxS8JWhYaM9yVJA262LaV44Wi0Y5
 0dphpkGV6f6TSFDY96UNCg7q2WnFleZ4QTJO7Qwfodq6rDzI2T9HnCOD+jKQ5Dmj0RX2XNuhaHO
 T0OQru9vXh3D0TM/eVEI5xJSujBRXS1T46ut0x4/e6/AZzKgR8XXBlkSP7Kfp2o/0uNnlqfWBh3
 w5MBtU+an5mTSYztWS8kbgyJ/cV2KvKH7HpihKXSs/VVRH5CXsxWXz5rqYperp+uwYImFqfI
X-Proofpoint-GUID: FZFZB71TlyiRbF0VoShPwXg3W9OJyr0b
X-Proofpoint-ORIG-GUID: FZFZB71TlyiRbF0VoShPwXg3W9OJyr0b
X-Authority-Analysis: v=2.4 cv=f+BIBPyM c=1 sm=1 tr=0 ts=68472df4 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=-2mmMjQWwNZ6YRhNbUMA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-09_07,2025-06-09_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 mlxlogscore=743 bulkscore=0 impostorscore=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 phishscore=0 mlxscore=0
 malwarescore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506090144

On Mon, Jun 09, 2025 at 11:24:36AM -0700, Rob Clark wrote:
> We are going to want to re-use this before the component is bound, when
> we don't yet have the device pointer (but we do have the of node).
> 
> v2: use %pOF
> 
> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/adreno_device.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
