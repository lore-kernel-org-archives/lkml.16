Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F44515B135
	for <linux-kernel@vger.kernel.org>; Sun, 18 May 2025 09:24:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747560297; cv=none; b=YhCEcvW45N+QNNF1tIahs059xnAwjSia7C0+bQuN237IZMOBm3M9LqjnZRyQ4NLmR/a7lmQjiS0QzsSECw1j5RxgrhRoSXnCheyk9GfzBTmdoMknn/ROo3hTjzwhpUnRJXHVTaeKFNCd9iW8+dapx23PpcSDd+txQwgWF33cthM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747560297; c=relaxed/simple;
	bh=uXh0YNHgLrXZa9T6To7mbdQeu6U5Grn3n5SG7bUQwNk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aLlVDXF5M6hs681fXYCanwB2h259lcETyLTW69J7DlFnQNnjEDLWXS/c2zTTmH5Xzdrpx+5j4/li29ysynsY+Ds9E4LHeVXauWeCttOP9YNK7n86dMaB25Yyn2pCXbTH+41vvh3TJqCQqJlJ4KLfi6I/4cJIE1sDL1KyTUtwYZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aWys5Eu5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aWys5Eu5"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54I8mmg8028089
	for <linux-kernel@vger.kernel.org>; Sun, 18 May 2025 09:24:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=hNr/pl/r9ZOYN8rShfMawc0k
	SnbkC2SMTXuLQZV6004=; b=aWys5Eu5LT+nYM7eRo+y2omkFE0d3tlWSCZ29Qbm
	Nijh+w7OKH158G7LqzSkKiOYszi1vj9q2L2sWnqwbtvSrOYW/tgxesky4aYSSSOj
	PxV4tjtWY+HXZhXq9CmnTAdPfbLd28henkQoeAV9O2Q8bxmuezID0n6ZKzy9orMs
	cQ5TIIitDYHB/qMjpD06fdKMis69NbPShjjMbELInU5NfRXO46B0Y6FHclU8ynGl
	iY9AZJ/bG4F+kYSvZ3UqZZb6Gas1/iZ3GxEux/GA9p1b8VnsGLyhrQzZSU2uv6gz
	W00AltwOwD+VI9snqFRk1DTqGybC6tY3d6+sTs/LOPuucQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pjjsss8e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 18 May 2025 09:24:54 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6f8d3f48f35so4116116d6.0
        for <linux-kernel@vger.kernel.org>; Sun, 18 May 2025 02:24:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747560294; x=1748165094;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hNr/pl/r9ZOYN8rShfMawc0kSnbkC2SMTXuLQZV6004=;
        b=u9+ZrN72vw0TDwvj8jp5ztk5vb+IK4zY7GUElO9jk03o0M7mtQpcWOnt+nlIXzZxtO
         UrxWz0mpnHrTb0r3lsjeHwqDvs5HC3f+GAKLAXp3L36j+4XKxeN5pQKVbmUHhbwkaL5s
         mFnUqkqqxtk17SFh6Et/EDIjOtzy1dcC1XM3kzxhYTAMUkJCa2lFpZntnoE6auV8vu5g
         RbRdMAquQ3CK0O8SDqeuA199MPG7pdn2ltbJRjuNi0HPJMGzsLMJObYpOx5OoIeOKuIH
         D44LR2g3LVex90+rMSfFhHjBaIXU5VNVr7VVUvJilz9INoQc7Sw/jfE3XXmnLs3ZybWr
         IhIw==
X-Forwarded-Encrypted: i=1; AJvYcCWvtOwDahIYxerLRZ6oOZw1lpoYzRLsaiu9C9AuPCiw7v3NGUClDsxgddkPFN9Dyy4B/kCJjAI98z9c8Cw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6uXvhl6aB2sQ0t+CV1dpt3prPmU7mJiR9O28I3nz/H3RXaBrO
	3opFTo6bFvhZZsLLJn153DKw4JTIcPc8UftFdBW6+buqvtuBdBdEM/aOtnVhRjt/4BRe4Jd2mEY
	wJrGuEn1e2xytk21zlUSugk53ExtNhpQkOZ2yxwClD+WSO5Bko3WYcGXGocgDQXqG1+Q=
X-Gm-Gg: ASbGnctiNpsQMIo6loJyNQJrCgNiNQdRmvUFNmUx4oG/aEe46KVD3u5RYexVLqEN/U5
	s+WZTXMZwQGgPagLfyKh6M5ZjLDpw2ML0q76tnwE7SaxcIcDZPmFfMPwXivPekGmcr1a2H71bZd
	jI7LcPs/XnEsVG6XAPC+3gTpyx/I5YZk9eXneTFxx0nAiyppwsadikzwE35BY3faPG7xt3ylVnD
	Mo8CNy1O1cUxaoRZCca7eVna/T+4rZwwntu4tEkRmNo0yiyhuwLb1ZeUmYJs/65OtbQof7/LPQX
	rmd+inxi5dYizeIRmqg7jieOcH3+aRz25mO9Vn8Gvaikr9eFKqOWikXchB1BSWsFu1+FirGuw9o
	=
X-Received: by 2002:ad4:5cca:0:b0:6eb:28e4:8518 with SMTP id 6a1803df08f44-6f8b08fcfc3mr175740196d6.34.1747560294201;
        Sun, 18 May 2025 02:24:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGBE8AEDRXC7fGaZuy3S3AMRf4t761oNWgvl9lJpRdtkIjuyHJ4BLR1QQmRYmnMD9O4Vus+kw==
X-Received: by 2002:ad4:5cca:0:b0:6eb:28e4:8518 with SMTP id 6a1803df08f44-6f8b08fcfc3mr175740056d6.34.1747560293854;
        Sun, 18 May 2025 02:24:53 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-328085f097bsm13953151fa.110.2025.05.18.02.24.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 May 2025 02:24:53 -0700 (PDT)
Date: Sun, 18 May 2025 12:24:51 +0300
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
Subject: Re: [PATCH RFT v3 06/14] drm/msm/a6xx: Simplify uavflagprd_inv
 detection
Message-ID: <gtmbpj26nsidusqg23a6zghahotwws47ghsq2vneikpvd4b2qh@uihmkxl7nfkg>
References: <20250517-topic-ubwc_central-v3-0-3c8465565f86@oss.qualcomm.com>
 <20250517-topic-ubwc_central-v3-6-3c8465565f86@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250517-topic-ubwc_central-v3-6-3c8465565f86@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: hWz4VMcWDgFaFCUM05fO3z618WSyW-my
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE4MDA4OCBTYWx0ZWRfX+rr9nh22sJK8
 /WruIxCYm9vYqBlhBIyPtbLizNMoeXIYE3QXZInd8H5/SQrt2jsLqt+4cIZHI2UjJfAJiS+SSVv
 xcKMkXC0EQrVfT2pj8z+OuSmoEPjb0FHE8fJWOy26lCrCyhWb+YG4Jo84gnaGzPZZSlgGKveMZI
 P67Gxl+ib2+7Z3wuQ57+iDIcJQ9362pJTCEwtgT9/0ybdJQvc1jtp1oNKRXWuv1AFgs6bD7bHkn
 Ryn8UpisaKuoIvqfP2NY1AYhBMhGdl212qJDnF+X18fr8WQ+0NDFHWlyVgcl89HT0vw+AOAyn8x
 OcXY3r+SwXh/YyvAkxg+TbMVYffQukdcCjLNj2nvVNeJmkO4m7l2xAUsn9O/5Z7vNn4FuTx2dIl
 UH1S/qXa7dXH6ZC0GDF6NPG6bA2mWZgZAAYbEqB2FWuZy77x6JVL3BqwDOcMlpreCjvXrOZg
X-Authority-Analysis: v=2.4 cv=K4giHzWI c=1 sm=1 tr=0 ts=6829a767 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=nx35QXo8bFDwqsARtNcA:9 a=CjuIK1q_8ugA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: hWz4VMcWDgFaFCUM05fO3z618WSyW-my
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-18_05,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 mlxlogscore=863 suspectscore=0 phishscore=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 mlxscore=0 adultscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505180088

On Sat, May 17, 2025 at 07:32:40PM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Instead of setting it on a gpu-per-gpu basis, converge it to the
> intended "is A650 family or A7xx".
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 15 ++++++---------
>  1 file changed, 6 insertions(+), 9 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
