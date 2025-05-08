Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0B4D14D2A0
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 13:17:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746710272; cv=none; b=AnlRFLJXcb8c+tDNE/fPkdUeW5tDaJvmjMF9YCrBjzuQ6dEYd51+2i00iSJhxOHDigCfHGWrp4n12GwyHskRbe/FozvCaqNzRWt43YvJZS3q/292zu9pZZVsFMssHKVpPU+l+7vR6ztpJ32NeC2Y1gHZ7QrnAni813NVpoY8HXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746710272; c=relaxed/simple;
	bh=ErPsB1GftNLSdtVkXNDPWtrGLm5oNECiIAZDxBNlw34=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EemjQez9oVV5LQZ5/uQNcFidtNaypm5QRt6Gb+cx4n9nR9bxwkkiOj62ZQyCp0kc3nCmHL6boNCz+ktoAJvMd8e6dX9QSNLzmh7qyA+bMJs0Au9r+CAflkJH6T4vFYnv1H8StXikK26BDB49hV4jCoRNu+DN5ujyyZt5j5Q1txs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jCn+6HTV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jCn+6HTV"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 548D15qQ010664
	for <linux-kernel@vger.kernel.org>; Thu, 8 May 2025 13:17:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=l7e3Qtmja3PTSHxPd5n9Skwg
	dogb1RFbMZ2gqpLdjXY=; b=jCn+6HTV0hnjPFR7xzK7RCVIAoUHdVfT2zkoAJwv
	HsNgzpO2kOenPCLw9icECi0EQ8Qbgde+ZMwZdqfTDjAPvE+vdSPC6OGQsBR5/wnz
	3g43tTnyPLsPN7tRms4BbJiSNOSRqa+F9OQZzm4/qRZ3B6uajAnkBD3qX3zr4YoJ
	2ZyS/INY6JNrF55/gvkMYIpTURA4x6M06dfZiacgWq9zzQN/PLSCnu9N1awFxZzA
	u5Rfhm9Mpr8kGfMv8R94X9pvkEYSnW2Q5quk5jm6hV9mWENTBGJkP2TIBCsDcG2L
	hMq+VKptK6FKVRKa0kp/cPJlmzWBCnZ9DarLfPg7QInyNg==
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com [209.85.128.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46gnpmhd8k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 08 May 2025 13:17:49 +0000 (GMT)
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-708b6b57e67so13940077b3.0
        for <linux-kernel@vger.kernel.org>; Thu, 08 May 2025 06:17:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746710267; x=1747315067;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l7e3Qtmja3PTSHxPd5n9Skwgdogb1RFbMZ2gqpLdjXY=;
        b=JP2Y0eWLSbTG4a61FGptkHZbe/Ih11fr4sYMWdl7BSeBGPr3Kkt/ftrN+44usPv21x
         uWc5B+uPh2/ssa/qhtlw0pw9Ph+q3JswlUblyRwqhq57SkMA4ajPB+5p8JocvRGztcs8
         rwH+jzmHokvIhoGirHCNq0X7MNyyJXf7Ee9Nqgc5JviQBc4yv/3jDPLX4gttoKbDEBKG
         SsFmBEuSFxlrlyb7eySCJOmoxOUbh6YCoymufpKO181v+uWL5srCupxcLhh60Oa9BFfS
         4ysfjVAs/i5LefypKNrMqblsa24ycl337/pkmPlFFlJafEW+3rjK3utG5IuupqIYOPfy
         cubw==
X-Forwarded-Encrypted: i=1; AJvYcCX8Hm68TOUZBo6OzgzHsyJImvNEc+2UD68NbRE2Tq3CGSC9Dw9+BiXE962qhgFS9l+4wXuZFrKW1Gj+hbs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxBB4XUt1E2q3lZwWpdQ8A+dP8ygLYN47ITQffazEcNusS2LPzt
	faE5woR8DeNe9yL6xg0asDi2EJYSOnLZXHX8zsT3jUY7IUbyZyji02XoYTHIV826nI9OZ35f9d1
	HjYSEPbUWcjZeAFydvC7JbV1tH0iIKGS0O71DFwXbJ6GKmf1vRE5gvw51SdluCVMmMJSQHPzuHA
	==
X-Gm-Gg: ASbGnctt2Hbbjli4B+8zH7kDzsbyBAgQCeGjLmFVRrPalxmEY4i/UC2JvBQXA/9cx+D
	i63S8NMYfROjVRzhfwaf4UOiYNvzzSoXz5xtpAWkeltFdJhTXwZ5mcGxHY+5YhSgUjLVs/E7Fp4
	BYZWMjUcK5dpKviG2WJ8Gavb/hK6916sI25F1EqjnrR+TT6nIN2iPnCqVtNuHceyAK1GRWcUcrX
	VXjKc+5Eb5N15ZnLDT7Jz+dvJiMM26z4w7GE0Bzzw/xWS5rbFWhmT5pnSpLPBMqrzX2tBq3xvVv
	J3PRHh+/TheBtiT1OWdaoLbuR/i7dJod/IpFb/PnKl5A+cIgQ5OKm5SKEJS+skruyTZ4s6tto/4
	=
X-Received: by 2002:a05:690c:6a0b:b0:6fd:474a:60a8 with SMTP id 00721157ae682-70a1d9f78e5mr107500817b3.11.1746710267533;
        Thu, 08 May 2025 06:17:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEH8xNL29tdew9hezclB47ncc6Ol3hKGwmQCYokRS50sHKFSsRnYKdUZ1yyl4p8l0FkVpf3yA==
X-Received: by 2002:a05:6e02:338f:b0:3d0:47cf:869c with SMTP id e9e14a558f8ab-3da73933d66mr89992905ab.19.1746710256287;
        Thu, 08 May 2025 06:17:36 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-320290183d5sm25207421fa.45.2025.05.08.06.17.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 06:17:35 -0700 (PDT)
Date: Thu, 8 May 2025 16:17:28 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/3] soc: qcom: socinfo: Add support for new fields in
 revision 21
Message-ID: <q6qtzibi6sk3ofu56brg4dxjs7zmeuo2u2xccvhsgs7r7fjnev@o6tje3mipv7m>
References: <20250508131258.1605086-1-mukesh.ojha@oss.qualcomm.com>
 <20250508131258.1605086-2-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250508131258.1605086-2-mukesh.ojha@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=TpjmhCXh c=1 sm=1 tr=0 ts=681caefd cx=c_pps
 a=NMvoxGxYzVyQPkMeJjVPKg==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=onFjxjlXxLmf5A9ibekA:9
 a=CjuIK1q_8ugA:10 a=kLokIza1BN8a-hAJ3hfR:22
X-Proofpoint-ORIG-GUID: eMOCFwrcr5WuAScgHqTe0ENLvZfZZwcC
X-Proofpoint-GUID: eMOCFwrcr5WuAScgHqTe0ENLvZfZZwcC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA4MDExMSBTYWx0ZWRfX02eIat9lteCe
 Ff/+rIhu3hkSGkWtetVq8LpDHut3mHSYO6622eUGONHy1CMih2TLFSSuRcnTyBZLDa5KU57RT5W
 q5ZCTfbwMVK3lzzorwEwPg/EFiWOhN2SRmAbgiv9jYKwTv3cddoDyJqcSfUjXm28W4zUa8m9bF6
 hZn9NfI7QdyoyvVAlGOlPi3hp+3gYzvWds+0ETfUbR2S1BHAgqmAHLF89OgttgLKXWzx2kfmHuz
 o9ZfS4zS3D7+86OS9AiK+TR9p32ucHmw6iwUZlfqx/iN0Jxcfj2jqrYqPG6TisxKOGVzAUBD+CY
 2oRaEhDLqD8FqImoZBTp7oMSIwWYzJU10AeokuoLz5t5K3RAvj9SYptM2d3XzTkebBJwWLdz8iQ
 HprTR6TvF3TZEcbYVMt2E1Ux+31xZLL4TdHDJONorYXoZZ8ZaU3xsQs7HOrp4O1GcVgXUkFA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-08_04,2025-05-07_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 suspectscore=0
 clxscore=1015 adultscore=0 malwarescore=0 mlxlogscore=999 spamscore=0
 impostorscore=0 mlxscore=0 phishscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505080111

On Thu, May 08, 2025 at 06:42:57PM +0530, Mukesh Ojha wrote:
> Add the subpartfeature offset field to the socinfo structure
> which came for version 21 of socinfo structure.
> 
> Subpart_feat_offset is subpart like camera, display, etc.,
> and its internal feature available on a bin.
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---
> Changes in v3:
>  - Removed debugfs entry as per comment from [Dmitry B].

No, the comment was to provide useful data. You didn't explain, what
kind of offset this is. So, I'm sorry, NAK.

> 
> Changes in v2: https://lore.kernel.org/lkml/20250425135946.1087065-2-mukesh.ojha@oss.qualcomm.com/
>  - Added debugfs entry and described more about the field in commit.
> 
>  drivers/soc/qcom/socinfo.c       | 1 +
>  include/linux/soc/qcom/socinfo.h | 2 ++
>  2 files changed, 3 insertions(+)
> 
> diff --git a/drivers/soc/qcom/socinfo.c b/drivers/soc/qcom/socinfo.c
> index 9a92c9c5713e..55acae79ec3a 100644
> --- a/drivers/soc/qcom/socinfo.c
> +++ b/drivers/soc/qcom/socinfo.c
> @@ -608,6 +608,7 @@ static void socinfo_debugfs_init(struct qcom_socinfo *qcom_socinfo,
>  			   &qcom_socinfo->info.fmt);
>  
>  	switch (qcom_socinfo->info.fmt) {
> +	case SOCINFO_VERSION(0, 21):
>  	case SOCINFO_VERSION(0, 20):
>  		qcom_socinfo->info.raw_package_type = __le32_to_cpu(info->raw_package_type);
>  		debugfs_create_u32("raw_package_type", 0444, qcom_socinfo->dbg_root,
> diff --git a/include/linux/soc/qcom/socinfo.h b/include/linux/soc/qcom/socinfo.h
> index c4dae173cc30..3666870b7988 100644
> --- a/include/linux/soc/qcom/socinfo.h
> +++ b/include/linux/soc/qcom/socinfo.h
> @@ -84,6 +84,8 @@ struct socinfo {
>  	__le32 boot_core;
>  	/* Version 20 */
>  	__le32 raw_package_type;
> +	/* Version 21 */
> +	__le32 nsubpart_feat_array_offset;
>  };
>  
>  /* Internal feature codes */
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
