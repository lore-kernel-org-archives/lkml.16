Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A62C27A450
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 19:04:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747249455; cv=none; b=eMyVkICCQCujxevTuBbxmeCgIJLyz5sZzP3d5C21fW5J/76I0x00bsQlXAwXpDGDMRBciwBkDofALVgG2aWzC6H58lVN5Hbi7rJmHX57/SJoPvkYvTFipmACyBpV7EyHcespcZOVi8b4DWl3s7TZ5npbPoygDPYswngOAq+XuV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747249455; c=relaxed/simple;
	bh=/hjJULGfB8jWupCFIe/kgBDvtCioZqPCA2YOTh2E6X4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N93rfdi4462TtRo5184XrK2vCzSSDNgnR4SjIEl0HS/H0cOSrPSvJIYmm17eC9p4eZW0f3CiVMtQvMssQVB4+0BmP5jK2Wvax8eauBwCDtHBaOiUQCapFPVo7TWQXJILSwYSSrkdBPPeHN3DsnUEvt607RDuQ0iY0XlXDpKSN7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GNdq2vHP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GNdq2vHP"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54EAunOh013030
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 19:04:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=aPZSuuY1W/lCvYUJRt7cqKLa
	wbwX8uiQ1760f2RdC0w=; b=GNdq2vHPVhfWAK6PbeUHRHsKrtZBokiSj1Nab4rk
	5Ozx0/lcH9cJtLSQ1MdsbKEQMwLdK4bECGNjR1LPwlmPWUZTvAav+UGyJrv5yXeF
	M9XWiaG11phSC6ApxL0u6sS5JcfFsh78mtjDUGGhDIRcIy9hA3BJIYqzTeyLTwMi
	BF9Aoo8Xr31a9ZsnvT+jZrOcqeovKOKv1LDK7KkUCCbcoRZpHIgdLdU64zuZCpHh
	UZPp0nqaTy+VumjBxJE7W6jE1j4g5f173hjVJ+R3rCXIzhhGI18iOjCQQZI1N2uF
	gyrXXTBcvjLdL2qFClDTARQXmbNMWZykHg82Gsua1hCqRA==
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com [209.85.166.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcmktht-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 19:04:13 +0000 (GMT)
Received: by mail-il1-f199.google.com with SMTP id e9e14a558f8ab-3da82fd3df6so2280875ab.3
        for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 12:04:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747249452; x=1747854252;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aPZSuuY1W/lCvYUJRt7cqKLawbwX8uiQ1760f2RdC0w=;
        b=AGILVImH6NrgmtPWdPzRWuzc+F9j8QISeJc7JZPsjnpShvGMk5rILkqoxku0KnxCU3
         rTthrfGXlyxKoOSgWzxZqpI5IHLWmIR9xjuqmhZ8G/T1yJb3gdajMSoyClOyHa2RF+SA
         j48xApk90BgkBvwx07dv3QBqNL4msXFanPltphERjzMFQtsuLdPW8IA0uRgC1hpss3BH
         6uaI8CQTr57APNyRpcoE4clP8uh/XUmni8EEO9bZD8Ms9ZmbCZGzfDMHz2W2QKEiD/WD
         SitHtN+X16cP6j+aZsYroK8ea+0w8fKsp4WfHcUU0EtvyDBvDb4jCO0AJ+CqBFTFbKFR
         c+VQ==
X-Forwarded-Encrypted: i=1; AJvYcCWx0e08hqAWhmzktMFzQbMoFmNd26IfMTckJjMHwYp/6IIOdGcBUqsEHhAJSvh2hghOqBrrR+p1EZ1lfnk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzksCHVDDS1w/2anDPrAyQZ2zbfXo9dgQpPcOoew/jzF1xdz/xK
	kMG4PENrb9B33jH9invEA1V+j3J/c/jxjUj5Z3lBpDea0YnjYlPD/6glB724VtLdndt9fPAgMgc
	wE4yk0jnlhAd4SAxsjuKah88UhpPranA5/k5eIgdZZifS9wM9NkGgjPNvfOSS72E=
X-Gm-Gg: ASbGncsGCNsNToWZz8IlgtH+IJmfmS8DQScqTyXBMxylR/izQlahe2rKraFfcqhGK4L
	EvB3O/HAEnKcCEKCD319eYKQp6nN0+BWHduvsx2nUxuwv0F5CHhlDkriU3+xBFHq6BmVylUl613
	o8FPEmHDA3P2lQfmBa32/qOxBcull02G/bbkyrBaQGbAVskd5Acv3EfDecbQRzr47R/Jy6FNfXG
	38bajgJbV9EfVP3FIAp2H+NXKTAEogCdaJGC6DH7WqFjoeOGHavqRzIurnlikCzRW7kcI6IJzpT
	m2Y0QNLjhsKak5UzvRPAvCdXK459oJV5DiYXRXerL3yI3ApZlgVPTF8zGIBE4fKwOcHLHabsawY
	=
X-Received: by 2002:a92:ca09:0:b0:3d9:3a09:415e with SMTP id e9e14a558f8ab-3db6f7f8816mr51919445ab.19.1747249452362;
        Wed, 14 May 2025 12:04:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH1XZOwFPXRq4qN4nQf+1LdGLzvGFgQT2vfouD5tcjh/PXEkQ7Sf0nUxsz+NzWLL1xiMHL/tQ==
X-Received: by 2002:a92:ca09:0:b0:3d9:3a09:415e with SMTP id e9e14a558f8ab-3db6f7f8816mr51919015ab.19.1747249451992;
        Wed, 14 May 2025 12:04:11 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54fc64d07d8sm2362836e87.257.2025.05.14.12.04.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 12:04:11 -0700 (PDT)
Date: Wed, 14 May 2025 22:04:09 +0300
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
Subject: Re: [PATCH RFT v2 02/15] drm/msm: Offset MDSS HBB value by 13
Message-ID: <zrz32vlzyozool76prwmwtz3us27dubfscpdtxjoydr7jps7tq@awla4zpep7kk>
References: <20250514-topic-ubwc_central-v2-0-09ecbc0a05ce@oss.qualcomm.com>
 <20250514-topic-ubwc_central-v2-2-09ecbc0a05ce@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250514-topic-ubwc_central-v2-2-09ecbc0a05ce@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE0MDE3MyBTYWx0ZWRfX/r0Kmk2V04EL
 XMjmZybfqdiyO05zv98Bveh39LNbjvZxFFsklXeVIfrCOF/g8Z8Uh5O/j7HAbz64bW8Uvjk7SLf
 mBOTvhAPQ+Iuyz/YU4GcKG/8flabkUrMFpZoV5kh1T/7OeymcP9kQ8+jOhEY+Jjj+bzEgGv3g1o
 ffk91xH7HGfHvEnBIPx/PysWomvWnvOrqKtQHIUWKafHdMTHdpchtX3TI5s3pURfV/MNipdpNQS
 PoJzLPy8MFrsG8lQe7dEV7x+ITozIOTU0itmLoh6dJkm0F2DHLYuQboG3yslW1nc0k98UH+3BMe
 V6XQnIZDejWpnXqmqXgisCUuRuG6OoplFxF0sc3I7wJO74ZBWADS9wXOVBFQ/YofEK8fVlSqKJD
 r6ePtZssHRS4+xS4SkPabkWbv5juFHAcRHjbl5vC8uEWjrt/MP7jYQn+T2ctK4r4vwOSZazZ
X-Authority-Analysis: v=2.4 cv=G5scE8k5 c=1 sm=1 tr=0 ts=6824e92d cx=c_pps
 a=vy3nvQW9C2dqy/lMnN3IYg==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=JTEDtJd_13X3dLxXeFUA:9 a=CjuIK1q_8ugA:10
 a=mHQ74H5e8mo-RpSg_uaF:22
X-Proofpoint-GUID: 0bJyBIhYIuSvWXICWf4NY1YjK5S2BApw
X-Proofpoint-ORIG-GUID: 0bJyBIhYIuSvWXICWf4NY1YjK5S2BApw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-14_04,2025-05-14_03,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 mlxlogscore=754 clxscore=1015 phishscore=0 bulkscore=0
 suspectscore=0 spamscore=0 impostorscore=0 lowpriorityscore=0 mlxscore=0
 malwarescore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505140173

On Wed, May 14, 2025 at 05:10:22PM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> The Adreno part of the driver exposes this value to userspace, and the
> SMEM data source also presents a x+13 value. Keep things coherent and
> make the value uniform across them.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/msm_mdss.c | 50 +++++++++++++++++++++---------------------
>  1 file changed, 25 insertions(+), 25 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
