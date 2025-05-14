Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42EC728D82E
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 19:25:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747250726; cv=none; b=WJ5eXYJ0YEWaeuPFlrSMtNAjdAITRSpBKYiKX47VfPqOn1E4pdineaM1s4FEvn8gVpXtBmBK+EhW7KET7nPeB1sO3aqJi/rGI+wZfwHnVsAuETodMuevp/ilzsYRQAtDJ3dxSxRdJMahU/T6VC1JXpVt9Udii4PwbKlL+27Zky8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747250726; c=relaxed/simple;
	bh=a6pXWAw3qSn8K0MGI01Y9Wef/OeVTiOkuPEXmvMQ45A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VKaVFQqxa2xr4Z0lwb8Iy2snpRfLJwOKf6CUnDzcfNUnRF0myH29ll8ruUt5oqCgLTj5k0v0plhuHG29tiFaVdCu7E/WhEWBl2Q8MBstukT/CXB+swST0gOKm/HmYfFc50MvupZcBq5Hdl2EK3n54j4F7Teu/302D2mPOMdTbfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BCUubKSw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BCUubKSw"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54EIrZLA012795
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 19:25:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=guHnDjTo7eaE/yughOao688D
	Svp7ZoZj4rGyk6Vz4vg=; b=BCUubKSwIOu6HQnrADk5Mgq6zf5I997Ecg93/dmd
	xd1QBGAMiLWOXQ1bqg/HCb24sbvcH+e9XL7EU38I7WpU4Nir5OBKVfE4pOi3fY6d
	du7y5imUF/1Q/Q25GZt3Qr4hWnb9idQAu+vUT51+yoryQ8QAPxd8p4qX6iLnLNnI
	BbVc9HIiTqReQ/R0PfLN+0D8f8VSdfG579608VqC9EWvsUMFfQ2Qp/muTlahieWg
	nAoIbPnEGB5puSTqSF9xeiVrBQbuPUGVNUJ+nvyNBvhkpgKAlAfRtYub1ZS2T5Bi
	dGlKA20ShaX/St5TEZyci0yr4FyBD5YWDGITJdQA44ACdQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcmkvq7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 19:25:24 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c793d573b2so16298385a.1
        for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 12:25:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747250722; x=1747855522;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=guHnDjTo7eaE/yughOao688DSvp7ZoZj4rGyk6Vz4vg=;
        b=O9uTkT3fVnNBoxYB+dci7bEDE7aUsY3prn446PqI4KCVztvO623dE93OUkHf3ZwYqS
         EIF1joSej+Drw8CiCd+QiL72+rY+yMzUG7/gGhRkbwX3s4RbVI+1eXdYklYwvtHlSxjX
         nMyObYOUhu1FFIYSNJykZqOmfWz3iv8M0GLkYO78aK8GTtlJWEVp3phRrmnymn2swZnZ
         ifmLvBGsi3scfHIJ5YbwkioBGOjpbLmZ9XUXA5Mlk/u3gFp0VywNP6aq3mnvXjr3F1tq
         qUgCnNsRD3U3jaCcZnw+ofRkNy/8fmaL8cfCkjsUin3rWG78CLqPWQDeRX4le9FQAbao
         X+wQ==
X-Forwarded-Encrypted: i=1; AJvYcCVu1+MSJoZDLexRGf+/pU2gQai1+boE8cQ9L0dPnpjiQc45z/P5+xy3BREvtF1mD0yzZquLXB6kZAgJpVk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxRWY0eS3dr8/DD8l3XuJ5Qvu/HB6+tTpfOn4BnvySNDjwLu8NL
	N9V/7j6otCp9c4jGh00VPAiKRJHEeoJYjw4svBv6vduACZnxmmA5vIhZzIECgkkeNyCbMhR1/zs
	UOeQBF1Kj090+Db1aBGGzdu7osd4+3DwKntV0OhO+G+0MuZmrEOyKlm4mmd9VLHHY3Yb6unQ=
X-Gm-Gg: ASbGncuAHDDHdkkvnFvCVMQLWzIzGqfYm1NXfkjHg4NEilcLguvKLil+JA6c4z0AuCN
	1AgidGhGJFk6nxSk0oK+vUy1OVI/ltgzKItMVePeYpsOfzW5KWgxHRmo4wm+VX3cKSyefmj6bWi
	X7Ykc9q4dPbtsKYXZvdLzz7yWtCuYKtHuJ5Y4qgSoTg+waRdUi44lo+xIeGdcDMsrL8SCOYl63s
	6U+icqEGug4ir514tUmHEb4fDVzN7Y0rQ8vjnk0IyG13w+2JVWiv3csREVSvZojgGAOL20sOnbF
	3/CbyOstVirzdT2sdSoQZ0RbUFpny2aD7WGUK/f0Tdn/p7PKj4/X3Bihvrz2mZYiqtOOYq5bjig
	=
X-Received: by 2002:a05:620a:1a8f:b0:7c5:a25a:f0f3 with SMTP id af79cd13be357-7cd287defa6mr638170885a.8.1747250722282;
        Wed, 14 May 2025 12:25:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGqYspBX7D3lylLVnQVlBe+b6tLYtEGKb07awj3O663BvMry8yeZxkF53c9zpzvl/w4Clu/Ag==
X-Received: by 2002:a05:620a:1a8f:b0:7c5:a25a:f0f3 with SMTP id af79cd13be357-7cd287defa6mr638167385a.8.1747250721720;
        Wed, 14 May 2025 12:25:21 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54fc64cbf3fsm2333073e87.211.2025.05.14.12.25.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 12:25:19 -0700 (PDT)
Date: Wed, 14 May 2025 22:25:18 +0300
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
Subject: Re: [PATCH RFC RFT v2 15/15] drm/msm/a6xx: Warn if the
 highest_bank_bit value is overwritten
Message-ID: <wb46vfuegw2d4mj6pqx6o5my7ii4fhkrzrgte4hvey5ywiszpt@oe3qsptmanuu>
References: <20250514-topic-ubwc_central-v2-0-09ecbc0a05ce@oss.qualcomm.com>
 <20250514-topic-ubwc_central-v2-15-09ecbc0a05ce@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250514-topic-ubwc_central-v2-15-09ecbc0a05ce@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE0MDE3NyBTYWx0ZWRfXzn4TT2EvwMiK
 ZcQtVWETjbTc0AdJFv3NMojCn3cEKQdl7tN7DS81gur3wlrIq6u+j3jNfclTTvEvYa+0MuaxbDG
 qvdrb+39CmDk793I8APeYaASF6I4U7th8ZIvKDHh/8rjSmdSDNBlppMcwv9S/kaRUQdUzHfzr+N
 tbgdun1qlrz3/d6dRScmKSnHrpjxAUT5RFHOjBOkPziwI+FH72Wurj2Oj9CvjTRCTmuRuIP+OsU
 FvZSs35xM9BHkUyMrI2cRLCR2MhK0lM68ojwigB9l/lzrD8VlTp/aUdZhk2YuRc1UfVGjnvxggB
 O6D2tqjt9q3s0wEIgonCnFd4h5Sa7f0X4QCr/2BLrzSryxYpE/ZS1LMwZahdqCrJH19NHtSi94e
 3SL9kkeyj1Q3q8wXwgn1ncueD8EGBF5j9dC+SegLrX0Bva4DELXu9E9pZgvqe4Mh4O0CGLaE
X-Authority-Analysis: v=2.4 cv=G5scE8k5 c=1 sm=1 tr=0 ts=6824ee24 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=hUL5GJU7K_37AAI6negA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: pKTEvrniwGAffpd7FjFo_PE0c0Kriy_K
X-Proofpoint-ORIG-GUID: pKTEvrniwGAffpd7FjFo_PE0c0Kriy_K
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-14_04,2025-05-14_03,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 mlxlogscore=963 clxscore=1015 phishscore=0 bulkscore=0
 suspectscore=0 spamscore=0 impostorscore=0 lowpriorityscore=0 mlxscore=0
 malwarescore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505140177

On Wed, May 14, 2025 at 05:10:35PM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> In preparation to resolve the issue of hardcoding HBB, throw a warning
> if the value is being overwritten in the GPU driver.
> 
> The HBB value is directly correlated with the memory configuration.
> On platforms where more than one is supported, the value must differ
> for proper functioning of the hardware, but it also must be consistent
> across all UBWC producers/consumers.
> 
> On platforms supporting only a single DRAM setup, the value may still
> be wrong, or at least inconsistent.
> 
> Print a warning to help catch such cases, until we declare full trust
> to the central database.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> index eaf468b67f97ff153e92a73a45581228fcf75e46..ab812338739568d5908ca439e5c53e230a02de5d 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -637,6 +637,10 @@ static int a6xx_calc_ubwc_config(struct adreno_gpu *gpu)
>  	if (adreno_is_a702(gpu))
>  		cfg->highest_bank_bit = 14;
>  
> +	if (cfg->highest_bank_bit != common_cfg->highest_bank_bit)
> +		DRM_WARN_ONCE("Inconclusive highest_bank_bit value: %u (GPU) vs %u (UBWC_CFG)\n",
> +			      cfg->highest_bank_bit, common_cfg->highest_bank_bit);
> +

This really should come in an earlier patch...

>  	gpu->ubwc_config = &gpu->_ubwc_config;
>  
>  	return 0;
> 
> -- 
> 2.49.0
> 

-- 
With best wishes
Dmitry
