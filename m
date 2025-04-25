Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F35E1A23B7
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 17:28:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745602137; cv=none; b=XSQB4GyCPbmDS2bzw4VQ1Z5M1o8yweOfOdUztwvbTi2YP+RxAX8tzvndx0XQTI85DpxLUKqFHRQ/FiyFjCpcggvpP+DI8xgb3NS8HnBLtVUQtKq9gmsO1Bu2AQmOVjmAt7FGDzzI4XpZGE3u2diaylwe7OoqAjAhGB7ISs82k7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745602137; c=relaxed/simple;
	bh=/i5UgcWLuEDxKiGtIu70t1Dk5KoukoStZknodJvuICY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DX4HmIjHwibA9I3JV5qKOnisM7rU0E7K0Hb4fzyPmrrm1H92M8/AU3OfwAiqNUHNZ/rAsBEOg5lT3zyhoaOz9tx3kMTU0+qIZkW9itQvcAjImCwjw1LbkbZiZS5DD0F0aj0Leuq8I7B8W405VY9WaQVVJRnDSNa2Af22/KjQuco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ahs2hfek; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ahs2hfek"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53PGK1hm021802
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 17:28:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=wNWdbXwXrbDtrSyadfPM0NWB
	yZ/EPH1YzaI+3UejfXc=; b=ahs2hfekOdy1yU2lbV4V6CCJvQnikpM04vQAUvxg
	QzTJRJ1VBOyAarDBIJmCrm9VjlycRMRrVgeG2EDflH8reTYTtj+wVtRuPXarjOiL
	iVGoycP/EM9H4skx/5VB8JgsvzzG4GnmvOE4JPW3j30EQoMtCwnRx3hxZGpciU9N
	FaoqwwKwVFeihNC+7SFdgfUBz6hGYxu12+HdHKCpFTN/Ml1Ce3M/aijaJaBye3Dx
	i/V9cBbJezId0AFujLYuIGM6kqF8UaXJZlY22GvAskbIdVzToHIdNjfseqIrGIlE
	4Nz2DK+RoFfmjN7a/ejhNmOP+2ubz0R9ufwJhDAbcGGjlA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh5hvvm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 17:28:54 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6e8f9057432so50682366d6.1
        for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 10:28:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745602134; x=1746206934;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wNWdbXwXrbDtrSyadfPM0NWByZ/EPH1YzaI+3UejfXc=;
        b=DSDgglS102J+54BZsX6bm+KhSYd8dwzHcALMLA4E62hjrMgF6ajlRdVjth/l9GySBj
         LxBy10MEllFTZyPGCQ6Jd5/OZlzhXemSBd0ATK/MVuqsLi2nbUyFVCmYeiMmmXHlEy3/
         3diXXPhw2mmxKIprx2xYysNObWULbtYyfE4woDR9/wNFqTbvUIRlJDXM8Qi5BlbBqFnP
         fxPvjZpDIziUPtB7+xANkyfPN+EkwjR8Q7F8eBrJFSA65gF82ePg2qQ5ACXk0wQYfUNs
         dinSuAEJqSfBxxfsUSwDJZRJktoIHiZrLPaTa3r0QjUeYy3xWm2QkAY4kvknAKm2mLj8
         2hhQ==
X-Forwarded-Encrypted: i=1; AJvYcCWhpyPJZu21d4pk3mbtCD4IoPFBQZRzUvsegpCCpc7SifQ+3KIxCYJUfB99ggdWJgU6qlFVFc3rAgLqkxY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxw+3MZPy4FqGFhf3SUg/BFzfgHPUgo7l7l6sOdrmn+2ZYqhGDA
	lB4MVf4t3OCmwIuWslclCsBuy2jhPzrj1lxj0ZmtQZSraeZ0Be4XjJkT5Oi54ifN5gZTDDcn5cC
	6mWEryVyW3zBZfd9XSue7Oz6ReZjPAJ6YiIoQVIjzp5r9eRQu5hiUOpVr78d0A6g=
X-Gm-Gg: ASbGncu+NibJZL2Sn+F2F9zLBvt9xakeaOevbfVjhKOY09dxzUiqQ0ccbx7kJcrSc7h
	cNuL+jBGYJ9Zx0W7uz1gVTfm9w/TWFZBrjtCBMkY3RqX9LKZFzZCYXlCSKRWrq4d+69EW0bbQZi
	rZ7IiP4wBarCJ1DZEoYHLzsAWyrfObcwaPWjbkVNPRiBwO1K18EhGYRuh/WqJUuqmN0qZn4tAL4
	AOL6Kj+N3l5BSk0Vo3hjXqswo2OSoAFKGmm28dH8BGVeRTjSv8biFSs7Ovgv992+oDwUa6WF5hd
	zmCVO6/cyO+su4y1/Rsamf6WnyRNZfYIs+ECsCs7/6b2DAQ+C+JizOpVUeIOLsS1vJtTUXLS4yE
	=
X-Received: by 2002:ad4:4eaa:0:b0:6e8:f770:5045 with SMTP id 6a1803df08f44-6f4d1f9106cmr3989356d6.28.1745602134130;
        Fri, 25 Apr 2025 10:28:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEmS2ePYsS3k2muQIMSmFlLDqEKwljZc8U6Lp1km5vwYp5+1jw+OeLFxm9hhYBuztNaj7Ji3w==
X-Received: by 2002:ad4:4eaa:0:b0:6e8:f770:5045 with SMTP id 6a1803df08f44-6f4d1f9106cmr3988706d6.28.1745602133574;
        Fri, 25 Apr 2025 10:28:53 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-317cfb48245sm8148011fa.37.2025.04.25.10.28.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 10:28:52 -0700 (PDT)
Date: Fri, 25 Apr 2025 20:28:51 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] soc: qcom: socinfo: Add support for new fields in
 revision 21
Message-ID: <mc6n7fbhjhe6cxyoqkxs23kjs7gsa5cihy6qwrcrnz4g3kwjms@vh3vfqzfprw2>
References: <20250425135946.1087065-1-mukesh.ojha@oss.qualcomm.com>
 <20250425135946.1087065-2-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250425135946.1087065-2-mukesh.ojha@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDEyMyBTYWx0ZWRfX0ecDSpnMx+FJ 6LNwAM7HlJIn5hb+9LycToT2PMLujEhSZ6Ua4xUYKE8ddo3aqbkkRdXRdJpdkR+dBMm2HlFQXEV 5G2Po55gz2cJMbMe1Ji9YGHNw0fxDP0S51h6dGu4D0+vbbpAS20eibOl02xjcm2GhY0abfm/b5r
 aKMs+v7iIEhsIWOMtXH+fS4KIB2q+vX8/MPdMvL0PnANqI2+16JQ3sfzFonkK2As4jrhW9IhPoj 2keSRFq2HFPLe/kD7yceAS155FuoPpe5H+Y5GiRfhZ7aZzi5aXlLnjQT4//wkUuyHLxLV1UX47e M3Kd+tmlD939FiLZ7UIjQDQ6VcpXlUeeQQjdWspVyT/3pd/G9NPGFhon1ienjn89eKhCZTuFNWq
 0ViiCNGUeA06EbBszJg0Z0uLJ6lMmQHVKeSn9c158P1aHXojC5KWYVWJ9X/OeqnRGkZT/S5B
X-Proofpoint-GUID: 11S4XVQlcNWi7kSccR7ZEj4In_CJwLX2
X-Authority-Analysis: v=2.4 cv=B/S50PtM c=1 sm=1 tr=0 ts=680bc656 cx=c_pps a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=GtH8KZfWUhV3EOIkiiEA:9 a=CjuIK1q_8ugA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: 11S4XVQlcNWi7kSccR7ZEj4In_CJwLX2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_05,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=999
 lowpriorityscore=0 bulkscore=0 impostorscore=0 suspectscore=0 mlxscore=0
 priorityscore=1501 phishscore=0 malwarescore=0 spamscore=0 clxscore=1015
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250123

On Fri, Apr 25, 2025 at 07:29:45PM +0530, Mukesh Ojha wrote:
> Add the subpartfeature offset field to the socinfo structure
> which came for version 21 of socinfo structure.
> 
> Subpart_feat_offset is subpart like camera, display, etc.,
> and its internal feature available on a bin.
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---
> Changes in v2:
>  - Added debugfs entry and described more about the field in commit.
> 
>  drivers/soc/qcom/socinfo.c       | 6 ++++++
>  include/linux/soc/qcom/socinfo.h | 2 ++
>  2 files changed, 8 insertions(+)
> 
> diff --git a/drivers/soc/qcom/socinfo.c b/drivers/soc/qcom/socinfo.c
> index 5800ebf9ceea..bac1485f1b27 100644
> --- a/drivers/soc/qcom/socinfo.c
> +++ b/drivers/soc/qcom/socinfo.c
> @@ -154,6 +154,7 @@ struct socinfo_params {
>  	u32 boot_cluster;
>  	u32 boot_core;
>  	u32 raw_package_type;
> +	u32 nsubpart_feat_array_offset;
>  };
>  
>  struct smem_image_version {
> @@ -608,6 +609,11 @@ static void socinfo_debugfs_init(struct qcom_socinfo *qcom_socinfo,
>  			   &qcom_socinfo->info.fmt);
>  
>  	switch (qcom_socinfo->info.fmt) {
> +	case SOCINFO_VERSION(0, 21):
> +		qcom_socinfo->info.nsubpart_feat_array_offset =
> +				   __le32_to_cpu(info->nsubpart_feat_array_offset);
> +		debugfs_create_u32("nsubpart_feat_array_offset", 0444, qcom_socinfo->dbg_root,
> +				   &qcom_socinfo->info.nsubpart_feat_array_offset);

An offset into what? If this provides additional data, then the data
should be visible in the debugfs. Not sure, what's the point in dumping
the offset here.

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
