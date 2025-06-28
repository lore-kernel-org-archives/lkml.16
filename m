Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D15419E82A
	for <linux-kernel@vger.kernel.org>; Sat, 28 Jun 2025 17:06:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751130377; cv=none; b=LdgEJEwupZbH8Ac78ZAWglP4smM1dEsMQMT+uDarwt94VGBhwj1SqABYKb/6Z6+2wdHkUgW+cRE/yU3kx3FTZqim/OLeFsFDmsLaWVTpAxZLaRL7uaI8/RJ8Cy2Vg7OijCISgQusmstxl/0BBL/YvuEgeV0YerrJUa83qKby8Tg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751130377; c=relaxed/simple;
	bh=Lb2qPDYVT8aHwoqcUmEBOYVdgb6bl4lJ9zQmbsokYO4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dBIZbAw5ea67296Sve6qVExzsQJzYSHBpL+gcdgyiJtvr2LCvgalU3NjVE219TFVQ3AsqKpZOVMWg6sYfjhkuHaMsHqb3SJiIcdMBXkEYVclAqgI5ecO027MoiwFc4kIs9XVtQcbHGG2KFVY7t4HaUVZUW6hhoMOvFuyCsOjWBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JospkXMp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JospkXMp"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55SBUg6M015565
	for <linux-kernel@vger.kernel.org>; Sat, 28 Jun 2025 17:06:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=P/7DJz4qD1Ux/n9rrB+wA0uP
	GBpbdiTVQsKaqfj2rGc=; b=JospkXMpyIlPFwWh11b2rCrbiWJgCA9AoqwlmqS6
	VIWd8Ooe5RuovkHuHuInLkwdyx3ARLi7eI+a6qCWMzOf4bvJI71CfOQit2RISwn4
	GAoLrGRmic3FC6j3rtXsCycNmJ0goUwuRzpUqDhPc/3W0QIXGI0MqRVskfJwe+vL
	c2taf0lT85hnsqK7ItQFE05xsRyrcdWH45X3aHXK+olnJNUkdFqbLXRD71bZm6oF
	Oa83ZcoPpwzUaBdHg/6ROfHvZJIspPhHYg4FSuTCMyLjvptmow/2FZkl+5qqTylV
	fF7DL4IDCu9KZQQj+9PwyFJQ9RURnKTzOHbweUFgjL+bTA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j7d9s0b5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 28 Jun 2025 17:06:14 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c760637fe5so518529285a.0
        for <linux-kernel@vger.kernel.org>; Sat, 28 Jun 2025 10:06:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751130374; x=1751735174;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P/7DJz4qD1Ux/n9rrB+wA0uPGBpbdiTVQsKaqfj2rGc=;
        b=JM7c+h6oD4p1kWLj7ctZ2qMopG1gPZjosh8Lk3TF/KvNNFiz84njGxHfKk6+zExGwP
         tkABX6cnkypAj5gUBrE0FqTOJZGaJBJOi7G5QbKVD4m4PI5xK1dotl5CFK8JV+N+VJvn
         DKk7r5M8JPncfBD6stWTR9J1oTelagHw2v4DWgUARe0QdmRow74IjxSlH0mqunY6Tcyz
         b2xroLwe8kHZwPWREimjpfDp/fb01sgbFGqKpM43MgPYtplo9lCfoh+QB+7dLJKmIIQc
         erD7Je6dC8jABtJk03HRSvHTLYq+tR3fPJ05+64jgW520YpPBh9319++OvHciAbNLRMg
         cEZg==
X-Forwarded-Encrypted: i=1; AJvYcCWuk85n79Nz7u4klA1b94m8VqwotrPZT4NRarjlZAroyRHymIKAa49SAX+8tKII163ELLpmJ7oANk9t6FI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzN45d19RLIfF05kUHbrhf6Sf5ZHDStvIzttD7p/uSG64zd/xXn
	Wr98w8MbeYCgl/I5tLGh1CejnkiyLea/JERpZA3IIK2lxC6T7GGIBNd4I7AJM8o7URl5T3nGd1+
	JPhSRrYJlG2bl8PEnTG513MTA2DeBnugqJh92hh7z+ToBMtTU5/HGKHZBcbqEgnbegLU=
X-Gm-Gg: ASbGncvNz0o1pMl2kupWNGUHNBBgXvLG+8xxQ3YzEVVQUi3/UK1QYoxyPB+DxHaVWNf
	YVqcUiLvp+25zz8HUwuYyBpkmadiDYFl3GlwvxRO3dbG3nLjsyxJIgJ6gLTKf8hgJyKfTW4oe71
	vnlIM0UGb9lwQeve39ai7xEtcAhpZh8eSBQwI1rHHCJ6YwD8BwXvd0rY07kY8NNmXj2juhrf3OF
	q4dzxmzpVyJjWNkM06VTNqtnphEut6JLAukJ8aaDf5EKLOvRdUzxygKfT/yo4LmmKLZMYdAD9VB
	OyxiqhSItfsweOtAhIjaennq4hJPPmG5BehuwiMYaMuBn1X3A8fs5rBryrGhgfhrPJ3M375JVhc
	DJqUNIKNDQWcj/Fb4bC50Qj8+KkijxUBnTHM=
X-Received: by 2002:a05:620a:2a02:b0:7d0:9847:ff06 with SMTP id af79cd13be357-7d4439a4f72mr926782385a.57.1751130373990;
        Sat, 28 Jun 2025 10:06:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGyWnKOkc8ihmFUbXaoFULP01ull831r7hPeYyszUBXGvTvhS6NFoZSzzvvawSodHDNRCfOrA==
X-Received: by 2002:a05:620a:2a02:b0:7d0:9847:ff06 with SMTP id af79cd13be357-7d4439a4f72mr926779185a.57.1751130373556;
        Sat, 28 Jun 2025 10:06:13 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5550b2d9cc1sm860337e87.213.2025.06.28.10.06.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Jun 2025 10:06:12 -0700 (PDT)
Date: Sat, 28 Jun 2025 20:06:11 +0300
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
Subject: Re: [PATCH v2 drm-dp 07/10] drm/hisilicon/hibmc: fix dp and vga
 cannot show together
Message-ID: <7mgk3hueodkzodedjxpkzpf2b4x2n3fdqi42lmtsgozlaxv2tc@4cx7nb5pg7tb>
References: <20250620093104.2016196-1-shiyongbang@huawei.com>
 <20250620093104.2016196-8-shiyongbang@huawei.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250620093104.2016196-8-shiyongbang@huawei.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI4MDE0MyBTYWx0ZWRfXygVocnIFAblN
 1vOWaQV133Azt9241Lb6JPnhadq7iCLRMbdzxW8ajMV84JgCI+eO5aW/EN8jJ+W9+6IdO+p8vgQ
 EU8Xb2l/M/EWJfcjh896XS9vOsjx54odC3jNkeRsjmOGiynF5FNgQCKVoFog2h70xDI3cXe1Aik
 8bWTwr4Mg1TWQCdzrcou2c0IBU+NMKfnINW4bwUJKQz3MJvvJSf2aIDwZ3L724EmG6V8E7abbMb
 TUq8T+eKruW3KpR9fzTUGGUm6PWZdETAU9UnqM5fpO61mW91LLwtRtXYSxII/ptVw6XGrvw164m
 8C6nZIFyt+4h0Zbrn9S5mXgq+Ndyuz5hfkdO0SR/1N2F5DteDGLAdnlUjewiwphGXUCiG1k9HWb
 P0XEQyPnaB5dli9IgyiCrxnwZt3DEDtcp1fs3q4e8R9hCJ1mnDy96TCAmZzyTrxTBp8alzWV
X-Proofpoint-GUID: bK-cT8EYt3VU4i2D5tUVA0hsLmbKQU7C
X-Authority-Analysis: v=2.4 cv=RrbFLDmK c=1 sm=1 tr=0 ts=68602106 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=i0EeH86SAAAA:8 a=1_qZpLKbntRvsT6nxJwA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: bK-cT8EYt3VU4i2D5tUVA0hsLmbKQU7C
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxlogscore=703 adultscore=0 clxscore=1015 suspectscore=0
 phishscore=0 bulkscore=0 malwarescore=0 spamscore=0 mlxscore=0
 priorityscore=1501 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506280143

On Fri, Jun 20, 2025 at 05:31:01PM +0800, Yongbang Shi wrote:
> From: Baihan Li <libaihan@huawei.com>
> 
> If VGA and DP connected together, there will be only one can get crtc.
> Add encoder possible_clones to support two connectors enable.
> 
> Fixes: 0ab6ea261c1f ("drm/hisilicon/hibmc: add dp module in hibmc")
> Fixes: 3c7623fb5bb6 ("drm/hisilicon/hibmc: Enable this hot plug detect of irq feature")
> Signed-off-by: Baihan Li <libaihan@huawei.com>
> Signed-off-by: Yongbang Shi <shiyongbang@huawei.com>
> ---
> ChangeLog:
> v1 -> v2:
>   - don't tie VGA and DP status, suggested by Dmitry Baryshkov.
>   - use crtc clone to let 2 connectors can display simultaneous

How does this help? I had an impression that your hw can actually
display only either to DP or to VGA. Can it send the same (aka cloned)
video stream to both connectors at the same time?

> ---
>  drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 

-- 
With best wishes
Dmitry
