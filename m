Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6982C2868A4
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 19:05:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747249536; cv=none; b=WQ3v4Dj/xWZCx899kQyWpoF+UshIXznMhTOpMl7fiM/xCjniAHYvNUfZQMFPdN39+quW8LN9UjRVBL3f34IivkcCe9JymPWvzZV/ycZqpcPpu2jh+DPtHBhCA8rwpQ7XA9ZpOn0p6O6Z1YPNdzr8H9l/Fe9zOHf5TUvxClhH1LQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747249536; c=relaxed/simple;
	bh=yUdYH9OrXaddZ8qfFOzEvGbXdetQrQZedioCTo4Z/Xg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ejTL3ASeGBd8pVuIdvXavBZyrBO/xLHWlNK5wU/JNgxEXvC6U8FpHd8IiD9/2gA5pPoeauw5eMOa0hNIVTogU6+I8wAU0o/2NhpIRsA9E3ikJhtK3xi/M8i2/8+dqbStBDRkAKidfhaZ3JRlZV6xbnWGnFas/Hnvi5Hlk7d0++4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E464yPX2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E464yPX2"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54EAuuLm030331
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 19:05:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ywYtj0jJCUfwAnlUn+KfhCG1
	HPC+N0krcot5RSineC4=; b=E464yPX28jlgQe3n5SUSqJIb7FKLpRL3y3uvX299
	3aORlz1ybgZA3Up+TgQFUwiWZgEL+f4z/eurMb6+4iSN9WWtaUdiOvHeJOb9GcUZ
	T9hqBhHJ6SPe4OA457ZuEagma2U/HtpKpVuonLR86vH7EeixbF/0dnjiozkWLNEC
	sHy3LSjNnI0YfE1TuN5rbPWZ3DJLH3FKOFfB6gx44A/9SbD8Sstjf0IBadgAWU6e
	bbR+4RIhIYKZUgDO0LwarnTe8bN8beyymbSxYBtqxPXH5kdhZwkxsRfamEcpxjMt
	t9RKqnS1OVFszZUYO4N0FuiYT1Sn79SuaUHp1MH+odHrhA==
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com [209.85.166.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcnut93-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 19:05:33 +0000 (GMT)
Received: by mail-il1-f200.google.com with SMTP id e9e14a558f8ab-3da7584d395so2225345ab.3
        for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 12:05:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747249533; x=1747854333;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ywYtj0jJCUfwAnlUn+KfhCG1HPC+N0krcot5RSineC4=;
        b=CqF3wbuJnXfQi5R4S6bZRclm8NQC+QJXsyMjfFAOqHyUlcNO+yBe6fxIhVg3jpx8vz
         HQJ1Z0FLKryGoCiXlh5Jnln0yMUbWkIdxwRTxFQtTHHRof9O+5TGU9JOpqyAUlT8dt5M
         Dw1r4W8fIvW6Dis3gXEZBB6VIOTR4+1NdUcYTS3jhNYaYJqfL9HIlbKWlfr/lXzHN28j
         NJ+Wk0dIqw+Y8q/lOyDBqmIYkfGsbbN/Qf8nU0vu+nDF6iGXL0nyDuTs+0LsNH8eTCQm
         uO9aAWnaLcx8KDrgDTNxv7BooyuZvcn6a+QqHnI5dEG9XjrMD2gCw9c5sintKlBL2SqQ
         8JyA==
X-Forwarded-Encrypted: i=1; AJvYcCXtmiTJ4Tui70rXxL5JjEwKrLWAFUHqZIznPqYCvYVQ1AdtLGanMTP2Ps/kR1gk1VEmvEx7i5htkluymUI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyjU7Wq4sEHtvh1ubY61YZ3O6CH/Zt8ANBCFsnNIIKucAnPByV6
	m7/D3zZ26yul8VINXEN4Rsp09qOVCDNHCwX/gatjq3fa8i1/l7pRGrGFY8L4+ibhs3W4R897CLc
	lLxlZNgneVU/vjJ7QZ43k8ynITum5sMDeUuNizFAUVhKHJHXC0jfB9jaB9ejMlak=
X-Gm-Gg: ASbGncuscpgzhTJd0NQHrpVtDB5BRlAXrAmlC27eSvhxcbqQuBguJArrNy1mTR45u7r
	60ke6eVFmBzsSnX7f85w5XvXyoMo7uK1bpUO9P/iReKEaDzrsX9paSZZMTGA8PY+qqMg67k7oqb
	Ut52PJJZB+L+p8iIUKC85ST0i/qBLLUEsk7EPy4bBg0iMT3E7hcOkgYfjQrnkfMYm2U2FSmqNun
	r47bkMfLoETZp2jDZK92GeqzChP65H1RSbbJ4pRqydF4rsmoCOYp5sUqe6vzhAwTNM7/1UfOHe3
	5yTKsPXKk6bEgc3/IvDe4V+oM7QcpjPeVJA39gWmgMABfG22sP2bcjrxP+MrCSCb8oHkqjfK0nQ
	=
X-Received: by 2002:a92:cda4:0:b0:3d9:6485:39f0 with SMTP id e9e14a558f8ab-3db6f7a5a65mr52467175ab.9.1747249532531;
        Wed, 14 May 2025 12:05:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHgYTQv4QXSnMN9YVJaEI3JUAXQjoi8ESN5pboKgw0mTBEWnrDUyYQEekWZqNeBYQdzQK0Khw==
X-Received: by 2002:a92:cda4:0:b0:3d9:6485:39f0 with SMTP id e9e14a558f8ab-3db6f7a5a65mr52466645ab.9.1747249532072;
        Wed, 14 May 2025 12:05:32 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54fc64b6bbesm2340443e87.154.2025.05.14.12.05.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 12:05:31 -0700 (PDT)
Date: Wed, 14 May 2025 22:05:29 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Akhil P Oommen <quic_akhilpo@quicinc.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH RFT v2 03/15] drm/msm: Use the central UBWC config
 database
Message-ID: <g654eiekiyqfjt65dtueowx4tqdg2tqs2xoik7xoun7dzz634f@ikftorfburay>
References: <20250514-topic-ubwc_central-v2-0-09ecbc0a05ce@oss.qualcomm.com>
 <20250514-topic-ubwc_central-v2-3-09ecbc0a05ce@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250514-topic-ubwc_central-v2-3-09ecbc0a05ce@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: RATs_daFS4H7DaYetsYlAEvkS0qnwYB_
X-Authority-Analysis: v=2.4 cv=D8dHKuRj c=1 sm=1 tr=0 ts=6824e97d cx=c_pps
 a=i7ujPs/ZFudY1OxzqguLDw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=2JnZN4u0TTcLH5SyeT4A:9 a=CjuIK1q_8ugA:10
 a=Ti5FldxQo0BAkOmdeC3H:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE0MDE3MyBTYWx0ZWRfX9ZDjKZNjrma/
 uf4QrYh46Ns1c02vXuWzIsWNs58vR+XyYydMhokmA4sjCTc7gSv2gM6F0HpXMr+RbFQpWGWoN3O
 p0YZeG0Nwo2Xwo9ODq/JyvfzmXOgZo7AImL1ognm1RBFjtUwm71z8CPXfU7SEO8q9hgfAQJ4Qxh
 2l6EWfqOHuD/9pC4ynlnrW3bjPltDlvp2fQx43Ns09qLwglxdQX1uX+OHJkricy66yH7VXFq6CP
 J8nE3TNfYB/0x3hf54vTiy3MuHaPdQSYLwKdpCNep6TfSA4rZZ+9ed4z7u5PIO34IQsolP+T2Di
 TMNfHapoN6WACa6lFKJ2iV+FgecYZV+TmSOMo1i0yKzX+gJNuYVIrmGXY0HGId3UZcBCNGkAR+m
 sQ5v33dPs4U3RWpBbhuaxuPD8YNrlJJVWe2N+90JXEZQ1TfZZ7JYe1U28fpQ8gvWIO3VjSFs
X-Proofpoint-GUID: RATs_daFS4H7DaYetsYlAEvkS0qnwYB_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-14_04,2025-05-14_03,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 spamscore=0 impostorscore=0 bulkscore=0 priorityscore=1501
 suspectscore=0 malwarescore=0 mlxscore=0 adultscore=0 phishscore=0
 clxscore=1015 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505140173

On Wed, May 14, 2025 at 05:10:23PM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> As discussed a lot in the past, the UBWC config must be coherent across
> a number of IP blocks (currently display and GPU, but it also may/will
> concern camera/video as the drivers evolve).
> 
> So far, we've been trying to keep the values reasonable in each of the
> two drivers separately, but it really make sense to do so centrally,
> especially given certain fields (e.g. HBB) may need to be gathered
> dynamically.
> 
> To reduce room for error, move to fetching the config from a central
> source, so that the data programmed into the hardware is consistent
> across all multimedia blocks that request it.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/Kconfig                 |   1 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c |   6 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h |   4 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c     |   7 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h     |   2 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c   |   3 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c      |   2 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h      |   2 +-
>  drivers/gpu/drm/msm/msm_mdss.c              | 327 +++++-----------------------
>  drivers/gpu/drm/msm/msm_mdss.h              |  28 ---
>  10 files changed, 73 insertions(+), 309 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
