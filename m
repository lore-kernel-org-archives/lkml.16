Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB0AB2F32
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 13:28:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745414929; cv=none; b=TgJD45/QB+k++5nxNf2GZzaT3AB/S0g36RDgc79FGuRyAyMCv6bIXOWu/oRvti0y7jvV4i5Jb4hO2fM6ncz2d4/sohvyyVBzULsO2gHO4eVX5QkYenYWqyxNKqyNzVKj44KesuZhca7h5VelNgEkgU5A6gFE/Mfo8h5fA317n7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745414929; c=relaxed/simple;
	bh=U9OtDZeDCzanLJBDLtmfBqU2PmEPFD3p7Lovsa9a7nY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z4L3/5c8Zr2jip7PZk4mfCi8DUF+sXBgxo0twswsLy1Uqjjhs7WD+T+e3vI3UqU6z+tPLyP+9PPT2MxfFrP5rvCRehDwCSUc6VesyHPV1lKWA/n4/9Lv8z1ICWDb32o7h52ToUQQv9YmXzhflG4HF/KwErJf400zfhBDUrRUEuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o8A/Sy+J; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o8A/Sy+J"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53NAYNX1016872
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 13:28:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=PB3zeJwysZUF/ByBSq+dhGKR
	vdPDfw2nxYgcYIOLE7k=; b=o8A/Sy+JMV06jqoMqAEv5+g+6FDVaLsmlIWxloNE
	eyZ/EllNAnyYMZUJHD7/qcGvvCxNbY1ME4C9kk6kfMRheml5qkIeDP3rVubG4PAA
	UziHFc8yy16AMPfamL5IOvke+Fk+GhleIfMLJBVwlcwZHzXdSsfhfoWXPaFy5HEQ
	pyuys0GQ73qgTa1J3xXaPu9/TPENp+Mfpy7RQyZJOYaSj3pqzGmqJzXeGFGuMxHA
	dsyUxzDaHCrDmKuKy5i8O2VeZX/H/BE7JXFfoFEarVwBhw7chpY7vglyw+ByK0OZ
	Jz7r2tgbdUcT7JMPxrJqh/7p8DaKWSpx7E0BjYzm3AdHLA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh028h0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 13:28:45 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c54e9f6e00so150835985a.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 06:28:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745414924; x=1746019724;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PB3zeJwysZUF/ByBSq+dhGKRvdPDfw2nxYgcYIOLE7k=;
        b=qOO3D0vDo67xQyHyEe6Gx5hi/vSNwQD+7KaclzB+YaUDQfoDvWxzWgpJ4jYqSOqdis
         FxZSCbaWndD34Cl8oXZiIZwOpbbpzPJblj5XZjLf6V4PcUnyVo01KN4H28BBABhr+Hnf
         1tWDv4e1MJ4Pkz2M/ISD9frhXeGzsx3ttmUHRovo4GQXq92qSp387iz05Ho3GRJxiobW
         oFYsBG2XARtY9582PURa8g8VCtDIhelCqSQdAwdiTf5u9JbhkiXxLeKdH4cig7FYNoeU
         lXiRoO/qmZ74LMz7O8iKrTXr91/fFzq8WrWz2O46RoPdendFe1qo/AqPBzAO++MUoQEQ
         RmvA==
X-Forwarded-Encrypted: i=1; AJvYcCWltSasYha7arb+jbOzzbAyjDYNI6MTtmvMP/kl8nz2y2/M8m51IrhxDKBUeRxOh+ZwSRJXR41J8p3p+Sk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzfST3bzSfUNn2/93YJQbBOjbBWjdaWllSZKy7guhsdmMBWkvh6
	9pmJLV6ohhILAn9xBhGJlWupeGI3FZmJ2SK0rwGpYY+2Vq5/4XIw4JtHoAWApQBEL1MiNTio+JB
	rLUvAshD4wqE/IsSjCOnpfxAHWZ/FW2xnxaTajP1/3hbBbtvKUIWaYIXfK8wciDI=
X-Gm-Gg: ASbGncvMnEfb8uel/UA8EcQTH2BYEr+6uJd3iYY5BhK2uBdKtzQ4joCzLIDztsQfjSO
	Ip2nHYXuEZEXKJI21VWBopIpo6imU9ChMJ6SRJm6mXMVAfXQ0oZc4OcS4YZR5PDhux3zVR7WL/0
	sdNk23hhJBkpvEwxUlZSwhXh7r752mmo2JR2EBFPBI5SfweGy3TzWnm+X61UQYUd4SwE+5m0oWU
	SdqzFSR/L+lafwQerChH77PZs0ND6+8mwadvDaEYaUIkVo+gocuGU9VAvFTwYbb+dAlTbtiHo6o
	byqmFb2gXGrbIe4zvqTUGkIR0I5+sjqH/WB3eGLU4t6EGRKwxazZ3WIuP7n+cviEkelqbFgGrzU
	=
X-Received: by 2002:a05:620a:424e:b0:7c0:b350:820 with SMTP id af79cd13be357-7c94d80df6bmr443623085a.5.1745414924629;
        Wed, 23 Apr 2025 06:28:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFk636fFRRkvuLyPaBe/JMMbB0DmZRi+A72gsKa2vsyQGLytxQjLxNTJxnnRLMfxvaeNdGcxQ==
X-Received: by 2002:a05:620a:424e:b0:7c0:b350:820 with SMTP id af79cd13be357-7c94d80df6bmr443619285a.5.1745414924226;
        Wed, 23 Apr 2025 06:28:44 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d6e5423a2sm1534611e87.101.2025.04.23.06.28.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 06:28:43 -0700 (PDT)
Date: Wed, 23 Apr 2025 16:28:41 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Akhil P Oommen <quic_akhilpo@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Maya Matuszczyk <maccraft123mc@gmail.com>,
        Anthony Ruhier <aruhier@mailbox.org>,
        Dmitry Baryshkov <lumag@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v5 3/7] drm/msm: a6x: Rework qmp_get() error handling
Message-ID: <skrb5hkl66gt6vr6c42tx2ipfn62uuouztd2g37xlhreeq7nqj@r6ohzexpwmy7>
References: <20250419-gpu-acd-v5-0-8dbab23569e0@quicinc.com>
 <20250419-gpu-acd-v5-3-8dbab23569e0@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250419-gpu-acd-v5-3-8dbab23569e0@quicinc.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDIzMDA5NCBTYWx0ZWRfXx79fb+kGMiLl 9TZGzucqHuk2S6SQ6hchOng5glGtt35qh6+LCKVz+0QJz7/lu26GUOAJ1INUBTNaQrzfA5ANN36 XiFnOTWy7R3PrZbWLUWMNEp/oSPoOi2bct61OfkC2HnQOYRMBwrVR/GNDa2PJsKlD98MLE3xzQW
 KRlwRMER6F/hv6KNvuTfywjahEl4HGmM9ksTJu0KnT/oBB4HZYntd+qQIvi/O2e/HJnK9e775Uv QzggRwihFpEWfaC+o010kfcowPkLLP4uAA5JqUWe+Ra51ug1gVkz8X1IBd6U26EfZK9PvsmmByB gvb4zMRpP8H+R8UynYgnx+650NwSDC/bHH1ZTNoVUjx6qqtdaNh6YkxXM58JJPkeT5tUQnvc2Bd
 tTn3gV7rmvEtClOglxNtabK1F2oCmrf5q8LsfC4jBxD3mTGXhNWUpQXrKo+E++wwq0cpjWSC
X-Proofpoint-GUID: 5TTtjNL6-fbIq4v1RZHNyX-3gI1X5DuA
X-Authority-Analysis: v=2.4 cv=ZuTtK87G c=1 sm=1 tr=0 ts=6808eb0d cx=c_pps a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=b3CbU_ItAAAA:8 a=3mVCJS2yw26y67mb1AsA:9
 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=TjNXssC_j7lpFel5tvFf:22 a=Rv2g8BkzVjQTVhhssdqe:22
X-Proofpoint-ORIG-GUID: 5TTtjNL6-fbIq4v1RZHNyX-3gI1X5DuA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-23_08,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 clxscore=1015
 impostorscore=0 bulkscore=0 mlxscore=0 adultscore=0 lowpriorityscore=0
 mlxlogscore=999 priorityscore=1501 malwarescore=0 suspectscore=0
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504230094

On Sat, Apr 19, 2025 at 08:21:32PM +0530, Akhil P Oommen wrote:
> Fix the following for qmp_get() errors:
> 
> 1. Correctly handle probe defer for A6x GPUs
> 2. Ignore other errors because those are okay when GPU ACD is
> not required. They are checked again during gpu acd probe.
> 
> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Tested-by: Maya Matuszczyk <maccraft123mc@gmail.com>
> Tested-by: Anthony Ruhier <aruhier@mailbox.org>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)

If this a fix for the existing commit, it should come first and have a
proper Fixes: tag. If not, please squash it into the first patch.

> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> index 6bd6d7c67f98b38cb1d23f926b5e6ccbd7f2ec53..48b4ca8894ba38176481b62b7fd1406472369df1 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> @@ -2043,9 +2043,10 @@ int a6xx_gmu_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
>  		goto detach_cxpd;
>  	}
>  
> +	/* Other errors are handled during GPU ACD probe */
>  	gmu->qmp = qmp_get(gmu->dev);
> -	if (IS_ERR(gmu->qmp) && adreno_is_a7xx(adreno_gpu)) {
> -		ret = PTR_ERR(gmu->qmp);
> +	if (PTR_ERR_OR_ZERO(gmu->qmp) == -EPROBE_DEFER) {
> +		ret = -EPROBE_DEFER;
>  		goto detach_gxpd;
>  	}
>  
> 
> -- 
> 2.48.1
> 

-- 
With best wishes
Dmitry
