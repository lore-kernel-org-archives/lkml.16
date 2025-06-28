Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 002A7246BDE
	for <linux-kernel@vger.kernel.org>; Sat, 28 Jun 2025 16:04:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751126700; cv=none; b=Oeth1zZ2uADNocCKoytZuE4d9TYUWN0V9d1r/MYN9Kspj2FDDpqAFTAatCKRaEy7QQdXPRygWAFQ3fAAI4rHFNQMln8855XoMcwwyH7IC3Qfwb0bTAUP9LuxTNjeLdEYCY4L+XqgGbEdEx53K3qusqFtenDWexYwPyKwXmlHjN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751126700; c=relaxed/simple;
	bh=u7gCwzGQ741r58ObZEt7sup/A3nBQateSUyL4CqCQTw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K2HTPpF6Ow6+raNn4JaBNwQ66Da0LKerL5xg3WcpJg0FQGmw9mxqd+CDsc60A75gxwR7v4KOpSTBVAwpJhg0CQFHiJz5HEHurJEWElWO3dgp+iXfBNH78yLBVK5tK3Lt95Ozla+hsP64+iMkse+ioUIz8I1iAOla57/LC2nuwTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pbDRBP9n; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pbDRBP9n"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55SEk8jM025913
	for <linux-kernel@vger.kernel.org>; Sat, 28 Jun 2025 16:04:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=NnXmT3rCn3NQoShP3VJ7gQzJ
	GqTXfkSk/YRgg6sZxos=; b=pbDRBP9nK/k4frMHEhMKLbk2cLGKcKiXQDh9meXQ
	V54Y+VOO3B122qwJrbc5Sd/IDar6ujM6vGHYYRb+v3Ucj9uJqSmWT+rfXG7rKA/p
	l7ZD5FQc5SMGllxeikTMUOsrXy7j7+w9VoQFZUZassbWjrzZUr1VNLD/pfBAPBSE
	o7bjhcpvmPt2MlGAZdEEbSRdfJhtoj0QmAtA2u9oswzYuEkrOsJ4E/jPcMzW/9OJ
	W586W0U1VKwtbxMdFi/zsbLrlODk5UHKc5s4H0GcumPRqKg7maoeXmhIHJqTSwDw
	S1xaGsYdULCmJItnqd/gD9YUU4wQub06xIUM0piNrBT+aA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j7qm0w71-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 28 Jun 2025 16:04:56 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7d413a10b4cso525881285a.1
        for <linux-kernel@vger.kernel.org>; Sat, 28 Jun 2025 09:04:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751126696; x=1751731496;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NnXmT3rCn3NQoShP3VJ7gQzJGqTXfkSk/YRgg6sZxos=;
        b=EZMaKpD+VEcGWNSJW+khp++KCqN2p670B4Vdc2t7LiDeTb1LNsxMjEnsnSjyPA7yqB
         meMMapoCCaIoGA+OUXcT/2Yh1gbgjIPhdhOw6w/udeCvwGSY/R6siEmUGZfHW33ZLwYX
         XWcyIExDkbCWhQiOsE/V8hpkbSI50o49VNxMiuy9qS2h4C4jdQ4Ahbyt5WvmNQJWnPx2
         yq4AQpwQG6wDSDcxcg0U/Bv/9bhr0jM/e2zVSJEd7ZhJKW2xoPHwB0PNUcW/RYWjG1zV
         HypEo8pg2V7lZlYJleaMvwn/mV2ulxVJbZrJF5Tk/XcePOVEi22MCpT6YhPKxYC3+WZ6
         b2vA==
X-Forwarded-Encrypted: i=1; AJvYcCWzHebQNVHAqv//4Kd+S4JbJbaAfymU9fAQG74vwhD8SDVDyy3ky35aorYz2fc3tjD6/nWgpBfq01rwPC8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxVYXDbuyu60XWyWVtqNJ82Xq65XYDmbc1/KZKXdXsVQVSl62AA
	mh5iLuDhmsQL+HjA/WpXbt+R1/xoz5kt0rPkqY7UhEwxP4XqPxJdrip4W0Wlrd/xRTAxzvzbhnK
	VMkmqaLD3NoaRh09/ZMdrA3HPEOqKfgtuxDTdE/YK8R1rGkvTO8zBeA6GRy6S8I65lHM=
X-Gm-Gg: ASbGnculoT6Z61PXohmakTt64pw/uCuEOCz/eM2XyWPuTOSkffOhTVa5eK+7qGNVl/1
	buCi1s1wnwC7BNa9c4q618IZTDoCZl77K2bBzy49S3JsacRYh23w1KlsjE5GD8Np04SsxQQJms/
	inImZtB9kFf5h4ncWJY2E2+DwoWHDs9E/GMABFa2qxxbyloa36K1HEFSTiAKF9FPERWsuFVOLF5
	+QnA0p5yrvyt/gQcwdC7DENh4z1GUpZk551akgFW2HBveL8GepV0wWEeZEMcfCYsNY6NzYmxIF1
	A4lmTaBzr8oOEXjNIgnhwnii72zUqh4TZH+QI1V441ec05BBUHn2bFEXp3DAHYV6cRiFZZxJhJx
	nz7cwxzu2VtbgP3xZnpVYw6BY6vxS8Cn33ps=
X-Received: by 2002:a05:620a:2914:b0:7cd:c6:40f3 with SMTP id af79cd13be357-7d443909e1amr1137977785a.2.1751126695393;
        Sat, 28 Jun 2025 09:04:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEdy5a8Tx55RpJAmUoOZR/MGx1abvyJWEF+Vq3GqXodCU/7kVhIYdrw0XbzlUheJXLUWembfw==
X-Received: by 2002:a05:620a:2914:b0:7cd:c6:40f3 with SMTP id af79cd13be357-7d443909e1amr1137973185a.2.1751126694934;
        Sat, 28 Jun 2025 09:04:54 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5550b2ef3b5sm844853e87.244.2025.06.28.09.04.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Jun 2025 09:04:53 -0700 (PDT)
Date: Sat, 28 Jun 2025 19:04:52 +0300
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
Subject: Re: [PATCH v2 drm-dp 01/10] drm/hisilicon/hibmc: fix the i2c device
 resource leak when vdac init failed
Message-ID: <pkii4jibdva2ytkcancxun7jlqzc3qmcqrcp75mx5jotwodqsn@vwbst53fzb6b>
References: <20250620093104.2016196-1-shiyongbang@huawei.com>
 <20250620093104.2016196-2-shiyongbang@huawei.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250620093104.2016196-2-shiyongbang@huawei.com>
X-Authority-Analysis: v=2.4 cv=C4TpyRP+ c=1 sm=1 tr=0 ts=686012a8 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=i0EeH86SAAAA:8 a=EUspDBNiAAAA:8 a=V-znLEYDe-3e5yjPEeAA:9
 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: aU_D8qOrNAQ5GBoSMx40hlh86FJs4b_Y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI4MDEzMyBTYWx0ZWRfX5gOfbCP5OfFW
 +9eExU2LnaeyFEkOcyTOqoaEGvEf/jdz64MM+tmD4xyStQNZUl++jPrKZtiUb3LtPenpKAmpY79
 OWbhivhMKCJRZSQESVgT6wUGTYNABeTLAlHLrclx3O6kZlNL8COP1q45qxm807zfsnotOeZVdyc
 YtwwC64gNSuBEEDySPkdXlWLcNsc7y17ggjzNnXiB7ox/1dtQJn8Mn7ubYI1psSOYsZlGeWHMj0
 ua1ugZX29LCqDX5PNpkChvqbYNvyKlEnCUws++P+CQb01vbwqXvSfBLEK/ky4qf3cr5VjbaBO4p
 8rXNFcZv0XL9ne7aUq0eKY4ZUpjldHvnZT8N/6PDbXBOFAeu2dzzxxrscwYHDJjxg5OGmwzyWMH
 YCgIMMjueqtNq1s633uUF7rOMmildr0qXE2V83ewcOG4mcpJQoQ+l1SIVuxomufyw17pAgFn
X-Proofpoint-GUID: aU_D8qOrNAQ5GBoSMx40hlh86FJs4b_Y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506280133

On Fri, Jun 20, 2025 at 05:30:55PM +0800, Yongbang Shi wrote:
> From: Baihan Li <libaihan@huawei.com>
> 
> Currently the driver missed to clean the i2c adapter when vdac init failed.
> It may cause resource leak.
> 
> Fixes: a0d078d06e516 ("drm/hisilicon: Features to support reading resolutions from EDID")
> Signed-off-by: Baihan Li <libaihan@huawei.com>
> Signed-off-by: Yongbang Shi <shiyongbang@huawei.com>
> ---
> ChangeLog:
> v1 -> v2:
>   - use the hibmc_ddc_del() in hibmc_connector_destroy(), suggested by Dmitry Baryshkov.
>   - fix the tag, suggested by Dmitry Baryshkov.
> ---
>  drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h  |  1 +
>  drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_i2c.c  |  5 +++++
>  drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c | 11 ++++++++---
>  3 files changed, 14 insertions(+), 3 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
