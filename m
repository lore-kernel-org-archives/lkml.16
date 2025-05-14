Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A03C218D620
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 20:32:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747254765; cv=none; b=JRjbzBHzj6tZmlC5j46VpTztxUOQ4Pre7fw6F32yKWfx3mWMxhZ5q/Q/qqA05iqRz3lFMNX07LE4egdNQ3KWaiG6QzZ2Q0Z4ueCnEv2EDYbdIUGeTD1yWB8Pb132DSWHwVOFTRqMkrJT1bEr2n2BA36pXnlUMDqhcCsupQXUcUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747254765; c=relaxed/simple;
	bh=2gLhUAtMT/ZpjU1KExKBn96wiivLxjIdVrFdvA6qpyQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IFYDvAKYc0KKfO31jgETPajw1H+/d+vrwdMWjKhySIn2yLhQ4CyKHZcnBsCBLqFMepTv+0de9eu1y6oW6jeaq98ZS5QyoqE3RuHEfRlW3b+EEnxkm1I5PI8OJJimktu4aIIlItK2ZikPctFfMseBdWxrdmVZdbodERYaxq6nWl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Mltkatwe; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Mltkatwe"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54EJ3GXn030343
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 20:32:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=XxPdt9cqTUOBy/MQknWD34Qy
	9JQbrEE6AdpEjUZi4wY=; b=MltkatweJY4EspyZRwcEgq0QjsOCbL+hMj2X8lvL
	MC5913jkkE0xXE3F8a275nrpNqkgzGtEpJdaq6Jt8MORVO4Zu4SWCdiD+UDc17BS
	XQ1ZtgArq6YvvXWGq8eGhoAMIJLOUmeNvpB7LTmox9ImonGcb0iFBmr2PlNv4XJq
	GLEKwyYCJ/boTRjvcfHof9eP5DPN+Dwnxmd+BvX9YyyDUkJS9dO7PsEfvy0klB3Q
	z13BN8ZqM70TguWGi8JUDddvPtP9vDgORCiLNiHCir9MMaZao2VoCWlHUe29GqTJ
	8lgTQ7zAQhJYNcvcXtAifjbP3xt8sm4oJS+L93Rs0N4/4g==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcnv0ed-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 20:32:42 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-478f78ff9beso5542271cf.1
        for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 13:32:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747254758; x=1747859558;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XxPdt9cqTUOBy/MQknWD34Qy9JQbrEE6AdpEjUZi4wY=;
        b=RW/ws1x1A3fdKAjOaIAFgk9giWauoCHJGXp4mH4Cxx68k9V6YrIK4/Mb56fKpez0ZV
         n7V+pBvi3r5o4aSg4c0+Uc00OIlXtvf3pQQbCfI+S++TJa6/L1Yc0uQZ7Zt6uG9UUuKQ
         neKSyeLhwrl46XQq6iBPPJr3fCngcpSxQSFtBXsNfJoVR9QzWR/x2z0kcixsxGPVLrTA
         iNYYMmWFNYbpz01dhQA4ymU363MPt/WZlzlUphb3ZH5A/nKbqswNOBVkg6aBy+RF2/BZ
         yLJVsKuuUXYH1miTK/cz7LMKkgmfZUtw5vEE54BRNLtLZXJ4Vj2yDKab2loCPyz7ZLsV
         Gm/g==
X-Forwarded-Encrypted: i=1; AJvYcCWtvX6WoCIBzAL9uWqc4W7M67ocElJlHBo2UjnkccT9uznJ6iL0dTvq7kev3BPFL5tICkxOepcGDaj0q6k=@vger.kernel.org
X-Gm-Message-State: AOJu0YzeVyzUp3NZWKs93/w5IFbDT0Ggc/6ql+eccYBEC8WxasxL72Dm
	IjYX5VGvLSL8uzyO0gtFVLeKzteeXMgKt3JRVXhDj4pqkoPDU9x6s+OK6d9Z6rTxbHaswF/WAPC
	r5MherohQNwT/0gVPYWbvm2uu2EWruOfb9subS62X41sgTdLS1nFixLyNdl57FqH0sTV88qc=
X-Gm-Gg: ASbGncuK+deypiWWzfVDegz5aBi9MmrE/M2XyL1i9hVbuz2JIqtR7rbkZAKqttDRLfP
	d6MX9Gw+ajRZ4mE6pz4z7HnCQ3NcmA1SE+dEOq58/kcfCkUJxgxkJXTir3833q1TifWzq4TgYcW
	WT16ECdz+N3V7X1mpK+l2r3c3Vbrftj6lURdik/dVY6itUMXijp1B//gAG9jytg06liP7IY8c3S
	FxbDZ4mZY7DqyvqCCLCndcUsjQMBcAvdU0yysKCBPOZfssjrHOJGPy3xYbCBIN5imPznTFIZ45q
	XkyDHXjdAkHKmbslwycC3uyOknqdQP7kXIJpGLBHeDXTvx5ygJtmB/f7kM0SQHmWhxa5rFUWddw
	=
X-Received: by 2002:a05:622a:4a17:b0:48c:4c6c:bd8d with SMTP id d75a77b69052e-494a32ba9ecmr1135331cf.2.1747254758467;
        Wed, 14 May 2025 13:32:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEFjaViNcmlJtAKHvgfVZ3CjaBKnxNHVGmEtfw379yfKxDhn5w+VxEmOu10Ygw0Vu93zhM+Xg==
X-Received: by 2002:a05:622a:a0e:b0:494:78db:1e55 with SMTP id d75a77b69052e-494a32bade9mr1639071cf.11.1747254746920;
        Wed, 14 May 2025 13:32:26 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-326c358ae30sm20781661fa.94.2025.05.14.13.32.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 13:32:26 -0700 (PDT)
Date: Wed, 14 May 2025 23:32:24 +0300
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
Subject: Re: [PATCH RFT v2 12/15] drm/msm/a6xx: Drop cfg->ubwc_swizzle
 override
Message-ID: <3uflij5hthurgt67rdnfhqtcoconybsnykirrwnk7idtz6672n@26qdq2e2ehtz>
References: <20250514-topic-ubwc_central-v2-0-09ecbc0a05ce@oss.qualcomm.com>
 <20250514-topic-ubwc_central-v2-12-09ecbc0a05ce@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250514-topic-ubwc_central-v2-12-09ecbc0a05ce@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: r8TjdtDomCx-kcvRA9mLwUIX6g37fTwO
X-Authority-Analysis: v=2.4 cv=D8dHKuRj c=1 sm=1 tr=0 ts=6824fdea cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=YFUBf4FbcCgwuu9kWHgA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE0MDE4OSBTYWx0ZWRfX5x2GSpnQofcP
 uRRIamef4xlYQIje8NY6W7sPWwjLjXb6S6HCiiGm5HKdsSdOQ6KpWj1YKfeb2bXZ5OeJ5EtNA9b
 VXuqgGpmlBeZWn7IzMmiD64Hofat1t+6IMbGAaBwH1r2uGlGtzTPMroPa2Uw4q8MCxYw70DyGuF
 3Kh8cNMZUQhAbJBA8BTvAzNSRytWGcebpp0om4RPdtgLC1l7BaE0ae5JpDFokWTu3CqDL+SHOyi
 Kz7Motgb7Ku+UNZkQB9X+oHoaxKG/QKjCRt+iXI6wW/yHC1c0B08tRKZRYOI0hbCLIx1XeAjuPy
 KqunACpe9vI5daP8NT7IR8L70aFuXre4pQZXgQxe2AdHS/eO0fxzMg/ZSXo69uFv3SZlZTCFiue
 svA/GfTszZtskYy3q+MOovpe+fIZ/13o4CwiHj+SG2SWSyEqbeD8ZD6GJMWfdV7v0s6r4Dsq
X-Proofpoint-GUID: r8TjdtDomCx-kcvRA9mLwUIX6g37fTwO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-14_04,2025-05-14_03,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=852 spamscore=0 impostorscore=0 bulkscore=0 priorityscore=1501
 suspectscore=0 malwarescore=0 mlxscore=0 adultscore=0 phishscore=0
 clxscore=1015 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505140189

On Wed, May 14, 2025 at 05:10:32PM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> On A663 (SA8775P) the value matches exactly.
> 
> On A610, the value matches on SM6115, but is different on SM6125. That
> turns out not to be a problem, as the bits that differ aren't even
> interpreted.

We also don't set swizzle for a lot of UBWC 1.0 targets (as MDSS wasn't
programming those). Should we fix all of them to use 6 by default? Or 7?

> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 9 ++-------
>  1 file changed, 2 insertions(+), 7 deletions(-)
> 

-- 
With best wishes
Dmitry
