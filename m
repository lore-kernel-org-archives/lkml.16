Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E33BE26D4DD
	for <linux-kernel@vger.kernel.org>; Sat,  5 Jul 2025 13:23:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751721830; cv=none; b=IpVHMhJH+MELPFhSBuYr+34jBRxEk6gFpRDdE2r9HGVuGh5BB/JeNq5o6iIAreAeLkA3b9TJx4C0hIBJoszwJKxq+3BEDqff3Em3jU/0TjtiiCqVajS9X2fz8oRclckBc+AEGh0R4mVY40uAjw9aOp9z8uN2NsEAhqMCEfHV6lQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751721830; c=relaxed/simple;
	bh=iDzwAWsc7GOuEf8QswfhTX+veGa1MM0tgeVUQYwbqcE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WR87g/+OJmLf6F43wTZPb3SRejeaF+HuSri62UDNzW7vs6fLEsCYCC9YQWEN8xuvbWKDQj0ESWIsPdOyu5AfYMbaJdoiXKi5e/GY6PrW5nGwru2abLfHZwUCThS/xpXx8wiK3A25Kkxea7KeIVJz068FMIf3ZIMN4m09VxIUXKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jGwZBNsY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jGwZBNsY"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 565BQx9v030441
	for <linux-kernel@vger.kernel.org>; Sat, 5 Jul 2025 13:23:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=6gQMTAhe570YE3iP8EB5vKYr
	zv7CsKlrKa8/6xKU6bc=; b=jGwZBNsY7lfBhGGTTJVDaY9eFTydbEkTCwD1Hlhm
	Ix1Gky9BvXFb5OosVwbFQ4uv3nGR9tGfs00cxghq+hDrGLmjMwLuMedkqKKfOdB9
	KYXD6UHMkfHeooPO8AhFsMp4r7VmU/A4UoVYVwy74oJrhv7l0EN57Ky34lftYnnH
	7Xcgqk7KYNSKEpab6ZdZoOJhHHHGnATSoXUOlq4Ut1P+62k8xOfNVuhI96rmSE6W
	qynR5cXcs/jHqRQd4yWqoXy36nyn5f/k6uF58LGvaG4rRT7AdEUUBgqi+jI825QI
	5cki/napIsViskMvYegppWip/CsErU45B8CUvxVFOKuZUQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pw7q0y5f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 05 Jul 2025 13:23:47 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7d40f335529so430885985a.0
        for <linux-kernel@vger.kernel.org>; Sat, 05 Jul 2025 06:23:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751721826; x=1752326626;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6gQMTAhe570YE3iP8EB5vKYrzv7CsKlrKa8/6xKU6bc=;
        b=gEw+H4nEmSFIRRGjWUp6Th4bXiEIYk+KJ8ovQFnFdeMiYBoX9WMulqv4um+MeErhfN
         it2pzdKyo32cc7A4P0xwUWm41GXue5bLqpJpHP6ohY0KD01qrpde4bJSq3lOTNV4Nq1U
         8lPMWVvw2f/893ml5P0c7Qhm7cLWrdkKu0ZCcwn6Zv6QYE1k07LtT1zA1Kgoi7TEeRN4
         VgbO7LrNx+qzoOyTiY7LIndY4cqf9Ena2Q35QvzzpHdiwEeQuWAr2zRlbDBNRfIw+WdC
         NUzTix9CMe6ivhxjY1n8hJ4j9fwKDA9+oJEojHjM/wIRHToLxkhiVjUNQ5IBOgeNV8U0
         JoFg==
X-Forwarded-Encrypted: i=1; AJvYcCXkTuOVoNna4yo/cVUjN4u+ww3h1OPFoDplmOYcNNtBrFN5OAHAEcaOcB5k0n8HpKkhDAGUoVZk52ckbrs=@vger.kernel.org
X-Gm-Message-State: AOJu0YyUmG2bz2P+W2Sgl69Bf3AeRWtbjpDf5n++8jb1Di1PmpLDvUWz
	AxBR0SZbg/VgiypHxXYdHhOFxyOGuZsFGjivPBVXAqpsQyurXDnlWDuEh2k3/B1yunNoS0E4Ibv
	3IzIokHhL/G8rPwK1d6uA0L4/V3MD8/cOR/eXCCSOSNcUYMMAKqRotXmWI7I02c3wCOg=
X-Gm-Gg: ASbGncsMQoUGJ58WYWXDWMJj1TF/Li0gekfRfbBMffcBLZQ7IeOqTCfw1tTp13NXfnw
	DWFLwto9t2JA2arhBRW27Kdy/AwPeRB3z2k2ELTkPDJo6oiw9biOpJR1v52841D+3/w6jZM6zOh
	gRbk9QpvGcwjwGLFjyZKvxnxjXi6XUWv9asJvLp0a3vV+aQfUxYiCSnPJIYwahbuuocvqTTZCro
	HuUWP7dVJKMAhiqjcF8C9F/leAcdmy+XJBkN8zLFiNki7iWQDcqjIPkJugzzVFpjAm6Iu/L+QtY
	C2DfX5KG+LhuZaikjj9nrL0HDHFeOVFgPmWM6cbfbC9mtzSOvnvHl+tyyz7LAaREyfscnPvIR/G
	QAArZYMUnG9NbcO3A379TRIWzGt1DuH/Qsa8=
X-Received: by 2002:a05:620a:1727:b0:7c7:c1f8:34eb with SMTP id af79cd13be357-7d5dc6d1daamr909522885a.23.1751721826511;
        Sat, 05 Jul 2025 06:23:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHanLfpu80wvQenehta9woxKfrNX6xaaUmW++9VxpAOncuk4XTvJSIeGS9ggcbqk0Z1zosQRw==
X-Received: by 2002:a05:620a:1727:b0:7c7:c1f8:34eb with SMTP id af79cd13be357-7d5dc6d1daamr909517685a.23.1751721826031;
        Sat, 05 Jul 2025 06:23:46 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-556384ce344sm585559e87.244.2025.07.05.06.23.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Jul 2025 06:23:45 -0700 (PDT)
Date: Sat, 5 Jul 2025 16:23:43 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Sandy Huang <hjc@rock-chips.com>,
        Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>,
        Andy Yan <andy.yan@rock-chips.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, kernel@collabora.com,
        dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
        Algea Cao <algea.cao@rock-chips.com>,
        Derek Foreman <derek.foreman@collabora.com>
Subject: Re: [PATCH 2/5] drm/bridge: dw-hdmi-qp: Add CEC support
Message-ID: <ahnm4oor4qiac55zyggwe3ndxn346cx2bpzghb5j5wwmfjmdyx@gt6e5fjyq3rs>
References: <20250704-rk3588-hdmi-cec-v1-0-2bd8de8700cd@collabora.com>
 <20250704-rk3588-hdmi-cec-v1-2-2bd8de8700cd@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250704-rk3588-hdmi-cec-v1-2-2bd8de8700cd@collabora.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA1MDA4NyBTYWx0ZWRfX8xPcs8R8oNzI
 nGQEZVPQQomXevkMJ23d7qazqgklcbR30k7EOe5cpRgbhJjM6v4IHlFXzEG5Zxy9XNCXPWMBJI+
 HKsjVecy4f5ryrQSN6BUsMX2Xyj9BlcocvWNVi2BNbThLC6oNA/R4nGoFAorcYj/p58BeIteqhZ
 gIjq/QenrzRweX0RjwyjBIVZqakdIZDQHHhhpDvDFfT/0rFFtLMLpHM6lF1izVvAAJsWoJVdDre
 zLrWfag2TZ42Fqnk80O114m0L8+G4twH0FDgrEh64QnKzkkV6GNjBnB+edOut2UN9l9yjZMCHnB
 V2KyI4g1w8zr3rX2xENKw/6cTosy3108jlD9HJf3U85sac/KaG2+0lSPMdyx1axTdDf49CiD9fU
 Ph//SLNbMhmU/CVzGF6x3elsZX83Yc/8jPk/ATRrbdNRRaxzGRf7V4PqVyBDaRE8erp1g1lJ
X-Proofpoint-GUID: 16rbXfL6w-wm77aGCDzuKyV98NPA9Tix
X-Proofpoint-ORIG-GUID: 16rbXfL6w-wm77aGCDzuKyV98NPA9Tix
X-Authority-Analysis: v=2.4 cv=SOBCVPvH c=1 sm=1 tr=0 ts=68692763 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=s8YR1HE3AAAA:8 a=QX4gbG5DAAAA:8 a=EUspDBNiAAAA:8
 a=V37JziMzuUeit7xzw6UA:9 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=jGH_LyMDp9YhSvY-UuyI:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_07,2025-07-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 impostorscore=0 mlxlogscore=999 mlxscore=0 phishscore=0 malwarescore=0
 adultscore=0 suspectscore=0 spamscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507050087

On Fri, Jul 04, 2025 at 05:23:23PM +0300, Cristian Ciocaltea wrote:
> Add support for the CEC interface of the Synopsys DesignWare HDMI QP TX
> controller.
> 
> This is based on the downstream implementation, but rewritten on top of
> the CEC helpers added recently to the DRM HDMI connector framework.
> 
> Co-developed-by: Algea Cao <algea.cao@rock-chips.com>
> Signed-off-by: Algea Cao <algea.cao@rock-chips.com>
> Co-developed-by: Derek Foreman <derek.foreman@collabora.com>
> Signed-off-by: Derek Foreman <derek.foreman@collabora.com>
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> ---
>  drivers/gpu/drm/bridge/synopsys/Kconfig      |   8 +
>  drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c | 220 +++++++++++++++++++++++++++
>  drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.h |  14 ++
>  3 files changed, 242 insertions(+)

For the DRM CEC parts only:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
