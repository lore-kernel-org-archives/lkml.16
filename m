Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84429278E5E
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 21:14:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744406057; cv=none; b=RFAP06O1H9uutqnDpfgISCdaFr7lZK6dC9Ssccp4FlGSQjLX7tD+zF1aKdbAANgK/6/yp+D2miFceIZE4nYZroi5g+W3+EExOVnkGs/erkqYC+yOOZDuK2D/NWpr/kHDRZDQo/f1PqnuVxCT5AW/7pRxX3vDH3IOlM2zZctI/20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744406057; c=relaxed/simple;
	bh=xpnH+3qYKCoErXdQ40aIICnufz90Wg10rOTSc3Dp1R8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TZHRIgtgbVPZ6oentU/H7DTZMuOm3o/5pP9Uig0RkQGKxOFfiP4Nz4RS95f0tGV3G6JLHdRv4TnJSbsq9c/yyU9khjE9IyvwaOqsJHVc2pBWuex1wbvhG99cqEypuNPCDBR5gyk+7p/HBB38HgWt4uNsjcRaVDrHWly1MFBSFtI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=k+3yJCIJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="k+3yJCIJ"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53BErCt7014128
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 21:14:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	92JOXCw7GPeB43zeDDjKUc5YArlwlhIU7W0D21HMUYo=; b=k+3yJCIJxlQ5L4az
	10oy2FpvhCQc90Q2zZDq9ka6oNPigQHn8TUI8Gg4gPPZLvxjcC9TL78nCzfJZheN
	VYfRR1n5TnQJ3WbMvgfE2rMbAcuV+10HbyRhrP2WkrGVGxaA36+Ofu2++usb3Fsq
	ywV+gx1//MCqUjciIiqye2cWBq6QIejYocMFpv5LReTJp98k/8y6+qcD8ujSPCSd
	DUo/mYx3gRV9Vz59ZAG8OVTCA6pOn5N1l5mCE6TU1r4oeivBJaZ3SgyFZ3p80XBw
	OaS8C1pSAVXW0EAbaHtcVmdFBvKUAAbfol8YgRL/CsaHVyLpoFW+RKyoqCRfYKY8
	xP24RQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twbekqph-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 21:14:14 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6f0c089909aso41279426d6.2
        for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 14:14:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744406053; x=1745010853;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=92JOXCw7GPeB43zeDDjKUc5YArlwlhIU7W0D21HMUYo=;
        b=vEJH2sGomig+2hsasUzCgylF+hB4AA4/qMgOvcSU1zGlprdTpvTQdZUsygRAVbXXyB
         hagAzJ0S0yK6pBJtvlPgwY2BWL/dvLs9DmpAl/ghH9PcLPvVFRhjtFagXL38F3zOyJPh
         dCNWqO6tIkpFyL01+TvJIuznapiNoWAHjqO03h69ni4Sce19II8fKxD/pyEN+wG5aGei
         E0YLe+jeB9/AWGyEm/YTn5OcE9Rl9zbdbGHvxyDQj9ueaC56ze17kaJdZvRNo4+11oLR
         X4441MVnelQdzqaWsgYmgeRHTL4yO6Vbzk2M4achi+45k+xKq9sabYw3sneX5iW1FgiW
         vGdA==
X-Forwarded-Encrypted: i=1; AJvYcCVU8gRf8+jm2czznqx2fH9Hrx0REy7I9IzBPcfJbZBe3NS80GSy8jIhXIK2pviejtyJE8Ofnca47SFi39U=@vger.kernel.org
X-Gm-Message-State: AOJu0YzA8Q8NvH0W4tcTUex2Kmff/r/cOZwEASbcPZ0D0M4ZCBvJUyOy
	8E6Dyqe7ZZumbcnfYh1z+VaDG6OLGTwg+4ZlzHfO7Uq5Lf5Fsrz+kGPbZtj/6geMT+Cu2GWwUAC
	+YloL9Qlgfz8Fa/J4pwBMv3OnKnZTqb/6hecEX5DH5AcIG9VzKKfwukVfWZSzRVg=
X-Gm-Gg: ASbGncsxsEcGDJz7NIg19DjFG3QQMz/XQ1sdL5Ej24FAATU7blsZQwlSlfkE/gdQOoF
	GNwru3yHZNGEH8tU6WkhuhzVOCIC+Cqw8f6EqvRE0rvZXS/G0xKerZroICTt2MQ6lbOi1/vwP2v
	D+GaVMiIimQepqfA07JUG9Ew7Otj9q02DnPmFqyJSgHPgRqXkvzVx3dyLwSbJ4Da3GxgJHPrbIk
	ILNlZd4jP2wuAH23uYwY6I0WEgDSrzTpZpvolegGBOnwBmWDhcx4J8IqNBcSEVGiDVf8l26bd9p
	V2GKF1il2AlQFXYczRXKXvc/Evhfbj0311ZZngpn2/DVq+XL8PCN0JlHIJf1++U=
X-Received: by 2002:a05:620a:2684:b0:7c5:50ab:ddf7 with SMTP id af79cd13be357-7c7af20babcmr610960685a.52.1744406052998;
        Fri, 11 Apr 2025 14:14:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH9Cts1eb12qp8Qm/XF/8Jlw3D1SD8yryZJ5hAKDoT3xvwdBsPZyvVLM4xIaHOUKgSaKfe89A==
X-Received: by 2002:a05:620a:2684:b0:7c5:50ab:ddf7 with SMTP id af79cd13be357-7c7af20babcmr610957885a.52.1744406052639;
        Fri, 11 Apr 2025 14:14:12 -0700 (PDT)
Received: from eriador.lan (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d3d51138esm510288e87.205.2025.04.11.14.14.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Apr 2025 14:14:10 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: xinliang.liu@linaro.org, tiantao6@hisilicon.com,
        maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        tzimmermann@suse.de, airlied@gmail.com, kong.kongxinwei@hisilicon.com,
        Simona Vetter <simona.vetter@ffwll.ch>,
        Yongbang Shi <shiyongbang@huawei.com>
Cc: liangjian010@huawei.com, chenjianmin@huawei.com, lidongming5@huawei.com,
        libaihan@huawei.com, shenjian15@huawei.com, shaojijie@huawei.com,
        jani.nikula@linux.intel.com, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v9 drm-dp 0/9] Add HPD, getting EDID, colorbar features in DP function
Date: Sat, 12 Apr 2025 00:14:07 +0300
Message-ID: <174437604934.3805099.10574399938467598929.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250331074212.3370287-1-shiyongbang@huawei.com>
References: <20250331074212.3370287-1-shiyongbang@huawei.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 1Ni8roiB8ZP_r-8kHuv_hUFRS0zNhXUw
X-Authority-Analysis: v=2.4 cv=T7OMT+KQ c=1 sm=1 tr=0 ts=67f98626 cx=c_pps a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=4BOo0Jww7fU-brOJr6UA:9 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: 1Ni8roiB8ZP_r-8kHuv_hUFRS0zNhXUw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-11_08,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 mlxlogscore=993 lowpriorityscore=0 adultscore=0 phishscore=0 bulkscore=0
 mlxscore=0 malwarescore=0 suspectscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504110136

On Mon, 31 Mar 2025 15:42:03 +0800, Yongbang Shi wrote:
> To support DP HPD, edid printing, and colorbar display features based on
> the Hisislcon DP devices.
> 

Applied to drm-misc-next, thanks!

[1/9] drm/hisilicon/hibmc: Restructuring the header dp_reg.h
      commit: f9698f802e50fbe696b3ac6f82c0e966574a3edb
[2/9] drm/hisilicon/hibmc: Add dp serdes cfg to adjust serdes rate, voltage and pre-emphasis
      commit: 9e736cd444f49efa2334e405f7a59773ea02155b
[3/9] drm/hisilicon/hibmc: Add dp serdes cfg in dp process
      commit: 5f80fb4d6abd1f7f4007e4bf8dd75a8c71d2f724
[4/9] drm/hisilicon/hibmc: Refactor the member of drm_aux in struct hibmc_dp
      commit: 1e7f35512e77dd7276e91ade4e03807f88b97eb3
[5/9] drm/hisilicon/hibmc: Getting connector info and EDID by using AUX channel
      commit: bd1c935811ae6bd112321c50ed83444eca4facc8
[6/9] drm/hisilicon/hibmc: Add colorbar-cfg feature and its debugfs file
      commit: 2f6182616cfdb154e2ecfe9554bb814b8a6378e9
[7/9] drm/hisilicon/hibmc: Enable this hot plug detect of irq feature
      commit: 3c7623fb5bb6c319531b941b15b7bfc12455d3d3
[8/9] drm/hisilicon/hibmc: Add MSI irq getting and requesting for HPD
      commit: b11bc1ae46587f3563c47078e605184f18e7fa57
[9/9] drm/hisilicon/hibmc: Add vga connector detect functions
      commit: 4c962bc929f1734d209a0862359e25fef8f56fa0

Best regards,
-- 
With best wishes
Dmitry

