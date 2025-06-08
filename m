Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 590F5B66E
	for <linux-kernel@vger.kernel.org>; Sun,  8 Jun 2025 12:36:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749386200; cv=none; b=ackSuBAFtnGnAqD8QxRyA19vFX6OLKWuQ4g2wB1iYdLAZy+8E/S0vW6JDPnpharrw33hHOy3j6rZCIFLgyjB/BqKbZmiydS1k7Jde9GUV2Uz3YDQUKg3hIgvX88+nZQz4WsA7LTBN1bMZaXLkYtTDplTPZpIEDRuHmY9duf81No=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749386200; c=relaxed/simple;
	bh=PvtoYg/7p/ofNVzprVEJyKV5i7bwcopIkaVj7odBCCc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GPm7naPwtoatQnuKeX7RgiZer+73GtISIJPQQ3l0dM03+SNhuBNyKYwpeIh4m6P5rBjFOhZbNsG/nOiu8HZhRdu24gXGrZHVF7fR/7CpAIdFuP13W3mnbG5il01E8nqNyT6CfOS+w1pL8xAv2dzQbB81YfnZF34z9zF7qO1EKbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LKrKqAog; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LKrKqAog"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5588eLhC023589
	for <linux-kernel@vger.kernel.org>; Sun, 8 Jun 2025 12:36:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=QMchh18XIKjcNGbJVAE9z89B
	dh3GHDDXcUD6ZQzWboE=; b=LKrKqAogVcNiO7EgN6/uI0zS7pEAKoU9poKkQBv5
	T/SwvQv+Qq7YxnNO7EHbV807TLGheYoMmmRub+s5LK1AnjSrnryhXWDe4KN9XiyI
	142Xd4GCx1vDg4LD2kNjFwP4CPZ00Ap45wangHi3sNKd4Puf4Wx4vtyLHEIiEtex
	09Q6MWu7Ar1Jl0tbSvDThwz6Muj58CVpY5GvwAbp3Kzxbf1pDq0zqQB7uUBNg1nI
	9Veo1SWP+pjMAYaYOjiBZz02Gk2OEtJNJFKD5y5ZvZu4sQt84b0Vun3yXRikN+YZ
	dmk0VbaEoodwH1YoofP6D9iW+jwyEN9K3P979oUYLF/1Iw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474ccv2rp3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 08 Jun 2025 12:36:38 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c790dc38b4so599706185a.0
        for <linux-kernel@vger.kernel.org>; Sun, 08 Jun 2025 05:36:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749386197; x=1749990997;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QMchh18XIKjcNGbJVAE9z89Bdh3GHDDXcUD6ZQzWboE=;
        b=xJUN1h/M9muwkgBAdUAme6YZIJG49lXzydBpWTWiF8s0kKBVfHKie4eeFtCMizyAbI
         +Es3ihhbWCOSg0+7Qw78+1yCAcxgFhc7wwWWbS4KdtagpUhyHqEHe1Pn7C7Q2Cr+gNK+
         5xEmcEjSfvvwfq+NnGc0WTBpOlWYlYHlutVyfgcZnweDtlh3Zi9CbHwjLge6mNpE/1ci
         6xyi+jw4BDpnOo5fV5YyZsykBBzADz13tzOSaaxeW8hHyt/dzYq4tAL0alQvBB3fxhjX
         oSoLs3wz8K4yjPGbynSZ8m+OHlTNJqVrWjp/1xUUp/bizT3XyTfTPMrvotTfWc7IJd/4
         mM4g==
X-Forwarded-Encrypted: i=1; AJvYcCWEGX1b2J5rNNAf2dAPa11TbLrGbzWD44FhUwoLcfFUvVwGgq8gVoQsW1sac6SZYK9Y0um4mtrBl/0T9G4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9eFxxTXZWorTecVFiX6OTUKrdBNjUzvO5FYZyRoYJ9P00iwKS
	R8pcgLbbXaQ4MpBa6RqZrF4nr0giiZ7Mc70bQqb/Bajh46vf9GRDEOAUENGtTazGwt9BUGyHzAp
	ESRWdd0+5WbR/kVDuxThZnCixs/uFtHfCmPLOgYfGkAKnQKayH7kvIXK8Bmx8dzN45zY=
X-Gm-Gg: ASbGnctk2hUvkz8RJP/Qsh8pNfO371WvH+E2ZfG5aebXnjY/yOHjoK+Jqx4uECme4Vj
	pzkSuAXTqUXBnK2KMcDhXsw6TRIW17+/7eNaBqqFiaqNIrOnHnk6uyc3+bVC+9NVkJiD0osrzZl
	qBQyJg6y8O9qZBhP3UAK3FcWJsufG9hv7Mk9AvDwLAUQxJa9u6L6Sje8SONkz8o0oQ4ksIqn9vb
	nIA0v31cPmxoSiK3mxeYGOkg4O3/yadrdJ339319ron5vEntbXJ1Z6gFOXnhjbYbX/0Rm2Gj6MW
	Xs2CGsDHC1fijuX139az9RK2JbRU5IlE7taA8yj6tcw614xEl1KmKsUgEcu05mBqOyM2F6sDlzA
	=
X-Received: by 2002:a05:620a:444d:b0:7cb:de0d:ba59 with SMTP id af79cd13be357-7d3871fefd6mr708119485a.17.1749386196981;
        Sun, 08 Jun 2025 05:36:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IESMQMBN9peETZizKFaXKMOqHtH3cx/FmiHI69T4+zpC05m9uJy5izUDSrrrC9Zt4LcSZqTaA==
X-Received: by 2002:a05:620a:444d:b0:7cb:de0d:ba59 with SMTP id af79cd13be357-7d3871fefd6mr708110485a.17.1749386195657;
        Sun, 08 Jun 2025 05:36:35 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553676d783csm747883e87.71.2025.06.08.05.36.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Jun 2025 05:36:33 -0700 (PDT)
Date: Sun, 8 Jun 2025 15:36:31 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongbang Shi <shiyongbang@huawei.com>
Cc: xinliang.liu@linaro.org, tiantao6@hisilicon.com,
        maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch,
        kong.kongxinwei@hisilicon.com, liangjian010@huawei.com,
        chenjianmin@huawei.com, lidongming5@huawei.com, libaihan@huawei.com,
        shenjian15@huawei.com, shaojijie@huawei.com,
        jani.nikula@linux.intel.com, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH drm-dp 05/10] drm/hisilicon/hibmc: fix rare monitors
 cannot display problem
Message-ID: <j23q7vjp2s2gfautba7hcbvd5vrrycr5akl3m24eu4nlvy65s7@5uytzwucogxw>
References: <20250530095432.1206966-1-shiyongbang@huawei.com>
 <20250530095432.1206966-6-shiyongbang@huawei.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250530095432.1206966-6-shiyongbang@huawei.com>
X-Proofpoint-ORIG-GUID: B0JoQ8MCfa2ikxSb0H8Aa0EZyHqZKpiN
X-Authority-Analysis: v=2.4 cv=TsLmhCXh c=1 sm=1 tr=0 ts=684583d6 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=i0EeH86SAAAA:8 a=FZSnmcJDv_DbaQ288-oA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: B0JoQ8MCfa2ikxSb0H8Aa0EZyHqZKpiN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA4MDA5OSBTYWx0ZWRfXyzp7znyAnZsT
 jWoJo3XiKLvjc+ilU1ifou8OZek+Xthuaj9RKgeN3DHKBB6p2W9xhOLIhvAV09TW/DHBTElEEmo
 nbDPbYphkFUyaM306llMDRPm4C9w9dM9m5DBSdrtg9Mi13UeMRVbkPP2gR6BB0fflI69NeDvWaY
 rp3DGO+LScoZVTNTfyw3/79QX59xGdBnXY/Q6rG/7WiT1fqvGgRDgtuqjd4jvIHLOTV+1utZCbM
 91VeGpZn7D2M91rmc+8PExo0lNIX2uzP83EQ6PZJArnsq+gWeh3vuCUb8Ax7xuk1jNTV+fpSNjs
 3P5Y1ltMTWT06nC1N1KQ2eqq2zgUti2Z6kolD/rL85aNNIKga6L7M3GPgC0pTPM5cfuUFdnCJBe
 Lood752eVsjpZ4bicS/UIwkOfDZwoDYYW8AqwRQ8Hv5X7C8id+TpVXApFjnQJlFB201wK5uH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-08_01,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 spamscore=0 mlxlogscore=999 impostorscore=0
 priorityscore=1501 bulkscore=0 adultscore=0 clxscore=1015 mlxscore=0
 malwarescore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506080099

On Fri, May 30, 2025 at 05:54:27PM +0800, Yongbang Shi wrote:
> From: Baihan Li <libaihan@huawei.com>
> 
> DP Link training successful at 8.1Gbps with some monitors' max link rate
> are 2.7Gbps. So change the default 8.1Gbps link rate to the rate that reads
> from devices' capabilities.

I've hard time understanding this message.

> 
> Fixes: f9698f802e50 ("drm/hisilicon/hibmc: Restructuring the header dp_reg.h")

No, the tag is incorrect. Mentioned commit is not related.

> Signed-off-by: Baihan Li <libaihan@huawei.com>
> ---
>  drivers/gpu/drm/hisilicon/hibmc/dp/dp_comm.h  |  4 ++-
>  drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c    |  6 +---
>  drivers/gpu/drm/hisilicon/hibmc/dp/dp_link.c  | 33 +++++++++++++------
>  .../gpu/drm/hisilicon/hibmc/dp/dp_serdes.c    | 12 -------
>  4 files changed, 27 insertions(+), 28 deletions(-)
> 
> diff --git a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_serdes.c b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_serdes.c
> index 676059d4c1e6..8191233aa965 100644
> --- a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_serdes.c
> +++ b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_serdes.c
> @@ -57,15 +57,3 @@ int hibmc_dp_serdes_rate_switch(u8 rate, struct hibmc_dp_dev *dp)
>  
>  	return 0;
>  }
> -
> -int hibmc_dp_serdes_init(struct hibmc_dp_dev *dp)
> -{
> -	dp->serdes_base = dp->base + HIBMC_DP_HOST_OFFSET;
> -
> -	writel(FIELD_PREP(HIBMC_DP_PMA_TXDEEMPH, DP_SERDES_VOL0_PRE0),
> -	       dp->serdes_base + HIBMC_DP_PMA_LANE0_OFFSET);
> -	writel(FIELD_PREP(HIBMC_DP_PMA_TXDEEMPH, DP_SERDES_VOL0_PRE0),
> -	       dp->serdes_base + HIBMC_DP_PMA_LANE1_OFFSET);

Where did these two writes go?

> -
> -	return hibmc_dp_serdes_rate_switch(DP_SERDES_BW_8_1, dp);
> -}
> -- 
> 2.33.0
> 

-- 
With best wishes
Dmitry
