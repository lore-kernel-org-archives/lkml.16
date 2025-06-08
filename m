Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49A661E1A3B
	for <linux-kernel@vger.kernel.org>; Sun,  8 Jun 2025 11:43:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749383009; cv=none; b=mWnV8dGume8hVCmfgFIDKx2NicbG9vudfuxiwFPv39vXb8JvPYxWQs0+tHn2vpO3r2t8K8XEMhAEzZURaM+JjzFdsx14Rwar83QrAMputroj81KO4AM1fb9i90CeguuLaB3tDvAlxq7pXqt8a3ZoaE99irl2fDfsRcccfJxemvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749383009; c=relaxed/simple;
	bh=ofAaZMLbgsdQNo3PXeub8GZsREUy2Cd9hYEm5QZd/hI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rgNPPPaqKoUy26o6gmYAF/MBf+XHQ+VLxIB+zvmn3/qhVqVfN2csxJR2aEkVlQpxr7EJKJ5Jkmmk+qYjHjJCHujYdh1I9IBZgHvcMo4+nBwlY+SlsWzkgKCJpzunWc6qPf0Y6IMTsI0roTjf/0XWtmOhHtfJ9IqyKHU8kg6ryxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aDO/6iO+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aDO/6iO+"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5585eG2g019052
	for <linux-kernel@vger.kernel.org>; Sun, 8 Jun 2025 11:43:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=KTYnpnxP2jDpRXwJfnn4X1n+
	ANjLC5E6uu5I3qOiUUA=; b=aDO/6iO+EV0Qu9gsE9AHLjjhV1BHkuPYR5N4vWnO
	7Nt7rnWHQa2v5niBYHf1HWgOvRUxlAnqxx9oXBdxOIdsIcPmx4GAB++AgUDX96Wm
	0hgP5DthfTkYulikj+KQWgl77AHcEhV1JJTpjlT2Gqv15Pjb1j6htpST+44r5SQy
	il+Y0CPp/zvWitCAvgeM7wvdd7T9Iesdg5xJLB7FF3ex55i/Dc0qm6HU27WUtUsD
	548nA2kJuvCHkg3MVRwJe9zXxNj5ZP5J6SSRD7bjBtO5qLbYdyMxaZi3LMk0nifU
	jf5mwZslDcT98azHv2XbZyMkigiPJ231QeqMn8D7cUaEMg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474ekpjgkw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 08 Jun 2025 11:43:27 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c5f876bfe0so661528085a.3
        for <linux-kernel@vger.kernel.org>; Sun, 08 Jun 2025 04:43:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749383006; x=1749987806;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KTYnpnxP2jDpRXwJfnn4X1n+ANjLC5E6uu5I3qOiUUA=;
        b=BhgvFhpjxyS3C4k5ZA92OY++o31sKH1eKBhppVgCgaVCVZ5/qPiKZ+vY4FG6JHyWeZ
         lFhQ4iqDiwEIjD1XrN79KrmfNhgF4BmNnZGNEgeebkC8kfK8VQpS37adFAMjIpdh4wZ8
         Jtcpurf/JT2ex2vCmj2vT1vnFPm4OEL/TaAdehkNsH0qCcd2ipGtU59uAb4l9l13vMk7
         P4Sas4eP8qaR+qNe4/Yx5InjpNoUCUmOPW/7VALhqUjxBEpuHjulEqTihPbVRuATOoiv
         gR814P9jXmQOkvTPff/CNzD/ScD+9tnb1M7Fa/fniXDp4u353Uf673jk+r7frg0MqWza
         QpFQ==
X-Forwarded-Encrypted: i=1; AJvYcCXutBggG744yEP+JiId5HhS24dBq3329q1lFRpIgvv+7yHUSZSX6opn5PTLYoneGfbj1GB+CkPkAWxbf6s=@vger.kernel.org
X-Gm-Message-State: AOJu0YyoepqGxINzN5rZSmcok8pRYRCpqL6PFhfyfA0VokIEJhgbrVmS
	fXSfkyKLtw+3xnW0KolBGRH+nadLu37jChT5UwmI2+7uhgg1eLjfWuM4hxITDNCEYLmppRR4JFP
	bHxHeLDnYW/M5v7KSlsfHxgaWJ8VXGjjkAHiGbvHiJjZj9+H89DWytuTUQv/y9hcmfG0=
X-Gm-Gg: ASbGncu+syTpje+roe4EC+mCbJ3o/KDgsd1do1LX7QZqpKz43lWuhj3MvDnQXF21Db7
	rdsq+QTmCPiSEy2PflIHMgFq4sE9r/jLwiKu2qsNwX8eSF3LE+iQZ3izGcLmIDb2276UWUDsmJm
	9ZCnLm4KN+shlyW82jgvSr4Hr8QnNKB69py57Y/KELuZZUD5Rmp/t8UIIjuwU55q0u6XEYB7blp
	EW82f7NdzQhR7X5yLdMFx2YfKpCtfRoQFUyceYCgwwyNSGHoZ4NmUwwxhCro8zzvs/qBEvoNuaJ
	jZx9+Gmu+aeuRPKJYN6veynDWN0SYBxEDBaPXYsMQSIHSd4auUYWPllkVL2I1olRBhIztA/T+cP
	2J6WjRr9SYA==
X-Received: by 2002:a05:620a:488a:b0:7c7:a5b7:b288 with SMTP id af79cd13be357-7d22986ea6amr1667820485a.19.1749383006061;
        Sun, 08 Jun 2025 04:43:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFx/EpAODosk83tulqFuHuiVq5dUCTu3lISRNpkj+6RBz25vmWkLHW7LWuHxX4phMvcGJfeXw==
X-Received: by 2002:a05:620a:488a:b0:7c7:a5b7:b288 with SMTP id af79cd13be357-7d22986ea6amr1667817885a.19.1749383005732;
        Sun, 08 Jun 2025 04:43:25 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5536772a22csm753989e87.144.2025.06.08.04.43.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Jun 2025 04:43:24 -0700 (PDT)
Date: Sun, 8 Jun 2025 14:43:22 +0300
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
Subject: Re: [PATCH drm-dp 03/10] drm/hisilicon/hibmc: fix irq_request()'s
 irq name variable is local
Message-ID: <oof3yrny3x5vglnjvcsz6brpn2a4l2nkmpepnykojqquytfj56@vz5sk7coojhw>
References: <20250530095432.1206966-1-shiyongbang@huawei.com>
 <20250530095432.1206966-4-shiyongbang@huawei.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250530095432.1206966-4-shiyongbang@huawei.com>
X-Authority-Analysis: v=2.4 cv=JcO8rVKV c=1 sm=1 tr=0 ts=6845775f cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=i0EeH86SAAAA:8 a=OipRdqZyLDe-kEwkaogA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA4MDA5MSBTYWx0ZWRfX2VAsAjjXg+uB
 IV+Zsi5xhoCWSYaam/G/0W+o5161Qq/wu9IiYRoUZhMhPqnpHMAqx3O6T91vfh2Z5UHhhbK09Zp
 zoV1NdeticH1PnUGdnUePgZplqS45yfU8c4DCVIIrwQDasf5nx79iXJMCDLdUEN8o1DwIFCfpSo
 bAxa5jcGXnsmH6f8m+3LJ4bPpOze+H5FTmoQ7qbSxL+ms0ejyQqS5JJbdhGwiBOsIetDsfOz4ew
 JKW0g0ORkC7xqAxL26BPCCuJMeNCR81jxZxf6FBwM2fxq+zp6LKRK33MpFeyNJbT12kOjy10Nfk
 P3QyBWoOjskiMLveuNpECjJXwrt9ofGD53+t961FT42Zou/z72hRIqyNCUT6VawEwL1rOUENBar
 kFmpfpOPgkjGIsgE4K2AqJ7HbQxt7lSMtOYSwaeKy0Khtra6ArFwLnL75FT2d74ZKQx5Bmgz
X-Proofpoint-GUID: KfdEtotFRLlpNu7wwrwaHo6eretxZgdK
X-Proofpoint-ORIG-GUID: KfdEtotFRLlpNu7wwrwaHo6eretxZgdK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-08_01,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 bulkscore=0 spamscore=0 impostorscore=0 phishscore=0
 priorityscore=1501 mlxscore=0 adultscore=0 clxscore=1015 malwarescore=0
 suspectscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506080091

On Fri, May 30, 2025 at 05:54:25PM +0800, Yongbang Shi wrote:
> From: Baihan Li <libaihan@huawei.com>
> 
> The local variable of irq name is passed to devm_request_threaded_irq(),
> which will make request_irq failed. Using the global irq name instead
> of it to fix.

This doesn't explain, why does it fail and which IRQ name is actually
expected.

> 
> Fixes: b11bc1ae4658 ("drm/hisilicon/hibmc: Add MSI irq getting and requesting for HPD")
> Signed-off-by: Baihan Li <libaihan@huawei.com>
> ---
>  drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c | 10 +++-------
>  1 file changed, 3 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
> index 768b97f9e74a..4cdcc34070ee 100644
> --- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
> +++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
> @@ -32,7 +32,7 @@
>  
>  DEFINE_DRM_GEM_FOPS(hibmc_fops);
>  
> -static const char *g_irqs_names_map[HIBMC_MAX_VECTORS] = { "vblank", "hpd" };
> +static const char *g_irqs_names_map[HIBMC_MAX_VECTORS] = { "hibmc-vblank", "hibmc-hpd" };

Please point to the corresponding IRQ names as currently implemented in
the upstream kernel.

>  
>  static irqreturn_t hibmc_interrupt(int irq, void *arg)
>  {

-- 
With best wishes
Dmitry
