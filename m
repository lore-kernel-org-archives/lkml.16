Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA9C7A59
	for <linux-kernel@vger.kernel.org>; Sun,  8 Jun 2025 12:44:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749386684; cv=none; b=t8H0NfZhu91GX8S82WoA4cWGS3YaJm0n31etABVGt4V6pgmnwo5FwnyM2XJ2HaFDlGmjKq0RWH/zz6qyiPTOSPLB2zsjjK+hS0uLuJcUcQNFUiT8TCIg64LWXnIoSoz5I4+yjetO9N/oGAaCGNJRt30iBGINHpjBUu3ANXeHNvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749386684; c=relaxed/simple;
	bh=dq7K1TQLMgmROf7H+DYw2Tv3fRZugTF44m+hEfh8CzQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LwTFGWwPhAYNAi6apUtAySmWJZHh4piSXgjyeIL81d7wPGIbRezJfeyjXXGE9qMb+HwRboF3DNzmLLzJKd0K9IF4y/XcfBsXl7MkWvlje+163kv8m+yav96xeRz6Lwm3oo0TXWj43z76wLBUtHqtIyweki0oM4wEOp3pO81mHMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XRfq1nR+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XRfq1nR+"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 558A8w4L029342
	for <linux-kernel@vger.kernel.org>; Sun, 8 Jun 2025 12:44:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=iGiYE3kM5YZPUiuD1eTcOXlS
	Uq6N4NpuwGV5LvhG9Xo=; b=XRfq1nR+k9CCJnQAROM9lLWx2fQPr1OH+aarI/Ql
	pyO/pQr3xWeaM1QRXdhKN8Ab58h3BEOwGD+GVOkosDTo96QWLKA3EK5WNSoAjMlV
	yjlQRltWHTjtoP8mm+bxDb95SCLh9KeHZVIIPJtItXvoqk21FTyGjcr7h0P9+zec
	hrDeL5bnilqKEm78D5Jpe/1Hph/icYFCc2SXbCZuBhCn05HhPVK2xAz4Gfvb3OpQ
	SiT/QgB8KvpE57EIDGsblJaXFFSEdCm4crfu95piMmyYDuWyOTL7ZuwlmmKBQv0L
	eGiFk8IZakqkWdF7lv5hGbvFbBl+w7pNvRdZImQhiV+Xfg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474d11twvj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 08 Jun 2025 12:44:41 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c760637fe5so693600685a.0
        for <linux-kernel@vger.kernel.org>; Sun, 08 Jun 2025 05:44:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749386680; x=1749991480;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iGiYE3kM5YZPUiuD1eTcOXlSUq6N4NpuwGV5LvhG9Xo=;
        b=wWdfPeTNMdmZN39GyMa1ZvEve/WPFwJMYKcvuj7XGLSV6kI9xTgPVhMWCc+cuyM+FS
         C32zsVr0z8yNtux6Mu7lVlcnISbVyI0EHvx8FwqLorMwTDr/Ghkl/aqig86E+w/elpja
         k/yp3jw25Y4Z0cT3pfCHW78ZiYwwA5G2HVkmUWcKNe0SiqLiZv026kWkLhllWSXpgNbm
         ETB7P72JXZ8aVReD2xSJz5HSyd1dnx/W1JsPR90jOQzzyNZwXB8sSDXq6AXFNgo/9Mmf
         VG5mGKoSs+AuFusaB1phcRMHLChOR/oOxOujC1nK62B5qsLMuhDVxA900wwDwjWFoqdS
         Nsvg==
X-Forwarded-Encrypted: i=1; AJvYcCV7YQY6AWsM1hnH8da1grlfZMJA5PI0PK4R/c+m1wijZkObn4afQZi2fag0dJJOlV8yvsS1d8L7kVSoV2o=@vger.kernel.org
X-Gm-Message-State: AOJu0YzintJ3I+FnhjVGbVfybDZPmKrhF9mzglvhAnts7IyQxjahhR/j
	/E12cJftPsrn7V4crLfd2w8ZFkgjq1ElxpWxPgePZuec7IMszwxdiRF/fg00kLvoOR94FH3U3ol
	18cQtMb9oD23vpVjiMD/P47Z/yxVgq+Y08JzG8TUt1OOJoJwSJcR4yc6VdVjQom7u5ho=
X-Gm-Gg: ASbGncteg8+uRNuUeT0t84ERqaEpnNo0VTuz1D1ltjsmrqQWutbumfUfr0C/giJNnL2
	ED+x5ky55de55/vzfyVA7dgmOyrxWIai1FHPhuU6Z1EqJ8vT1jKuOg2CkjPcot8eQllISz4/2or
	I3EBzO7f8jaFtCHl1CtIVN8TKnPScNfmnkE9k+nS8mYo9RUnFqp5rD6uHVN+zL0UWQmSaPetebI
	CzAngzyenyRWAkSoGtJqRAK5b5/CUv0clzXmzVdiiUJZPywAKOI3r5822OMURtczhSx0rKQpwFs
	SJ4lefu3xtaOMPZEpaxqmbuoaOx7lJT3iWDLnMuITCWSViSzTYEegD9EwNI0Ca4VoYHNxiY6E5o
	=
X-Received: by 2002:a05:620a:60f2:b0:7d3:8ef8:186e with SMTP id af79cd13be357-7d38ef81ademr341903185a.14.1749386680680;
        Sun, 08 Jun 2025 05:44:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFQiEsdoeH+8RHm0slrLj8I9TSy7hvtZgmHk+h/uIyDaO7CapPiLSz8XD0SZvSal5zQRcDs5Q==
X-Received: by 2002:a05:620a:60f2:b0:7d3:8ef8:186e with SMTP id af79cd13be357-7d38ef81ademr341900585a.14.1749386680355;
        Sun, 08 Jun 2025 05:44:40 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32ae1b0cf7fsm7200681fa.12.2025.06.08.05.44.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Jun 2025 05:44:39 -0700 (PDT)
Date: Sun, 8 Jun 2025 15:44:37 +0300
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
Subject: Re: [PATCH drm-dp 08/10] drm/hisilicon/hibmc: fix DP no showing
 after HPD with VGA connected
Message-ID: <qv3frn7zaqzxatag5y7g3p6u5ulywife5aqovhjppjokglptwg@vl4ponlnbbtv>
References: <20250530095432.1206966-1-shiyongbang@huawei.com>
 <20250530095432.1206966-9-shiyongbang@huawei.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250530095432.1206966-9-shiyongbang@huawei.com>
X-Proofpoint-GUID: K3EZ6PDhnvFXunuKOi2GyIoeaxXyRuBe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA4MDEwMCBTYWx0ZWRfX/AvHo2I0OPc1
 2vNC9OO/6KwXADHSJ45BIwNiMxaJW/pKBpjmAQtgl/sqsfezzB43ugh6U0qH8/ewxxO9guT0S4H
 qprt0b8mFszqcl9O0+fd7hyCsMIFlAvO1VclpiFnyJGF4H5foW+N/SVAOE0TLusFmYR1+yr+Dq5
 qNcffy2lNkTOpbtAGiK+Ubw+ev9WyYGPHW1BZn1cQpXh6fCwQbuYCNxgq32YPHw59ntHikFOV6d
 O++wTX/UsCNvQ08V+ynSePFNc26lX5Lh+xX0/m2goq2xJq/jXNMeZ3al6GO6oquCLaxobGhDi1w
 BuMBmDP74p1Bh0xQEMLLxifv+rZitbVaoGJEhlQoJcgYyVWlgEaoVLaxdg78egfxi74QE/YmydR
 kBLCwBCUYYuO0QSXKtHAnbrweiiDaV4ZQVLCTLrDQI5aIK27GGmZ+9L2sCkSfrDoyomBg58Y
X-Authority-Analysis: v=2.4 cv=GYkXnRXL c=1 sm=1 tr=0 ts=684585b9 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=i0EeH86SAAAA:8 a=qIQg4bjnobHRwzQDxS0A:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: K3EZ6PDhnvFXunuKOi2GyIoeaxXyRuBe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-08_01,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 spamscore=0 mlxlogscore=578 bulkscore=0
 impostorscore=0 clxscore=1015 malwarescore=0 priorityscore=1501 mlxscore=0
 adultscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506080100

On Fri, May 30, 2025 at 05:54:30PM +0800, Yongbang Shi wrote:
> From: Baihan Li <libaihan@huawei.com>
> 
> If the system started with VGA connected, the desktop like GDM cannot get
> DP's CRTC when DP device is plugged in, because there is only one crtc
> sharing use of VGA and DP. So change VGA to disconnected when DP is
> connected.

NAK. I think we discussed this when the previous patch was submitted.

VGA and DP are independent. It should be user's choice whether to use
VGA or DP if both are connected.

> 
> Fixes: 4c962bc929f1 ("drm/hisilicon/hibmc: Add vga connector detect functions")
> Signed-off-by: Baihan Li <libaihan@huawei.com>
> ---
>  drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c | 14 +++++++++++++-
>  1 file changed, 13 insertions(+), 1 deletion(-)

-- 
With best wishes
Dmitry
