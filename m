Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A550915CD74
	for <linux-kernel@vger.kernel.org>; Sun, 30 Mar 2025 17:52:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743357155; cv=none; b=dOUjwrL1Szkop5w948DBxdUv41S0kGFd69RSAUe69ua43vh5Nrb+Emo53cJ8Lv0dt9MSU9eaXegnmgIDcSlKSbkHoTVd3Qg+u5pxme4uYAjZX87OrIRP0CieHmUhpcmZ2sIJyQFAkTjSCPBUn777ATxlEW5/prVPN+YcJT0jgzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743357155; c=relaxed/simple;
	bh=EA4KcZPr3mnA2HfaRwScb1sqX5QQbQGr36NvLllEblY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DoJQ2bBxiJTs+P203lbPHnic8RhOx/K6/7TkRo0H+xXNHDvAAx7a3BDMEYvAeZ0A7ny/7ksZm6npeQ5cTLuLDZT7JYuN2p0aOt8+qsQloY9LoXXrJzihwd9VNgedXCjLOdNt4faUrJd7PVBLPrKFCJkwBpp40/FiUMs+6fjTzGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aFUec8+Y; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aFUec8+Y"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52UHbxdV017193
	for <linux-kernel@vger.kernel.org>; Sun, 30 Mar 2025 17:52:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=yfNrr9IWXB5j/RFLxcg5ak0n
	+LLaTpY+LShrMT5MZf0=; b=aFUec8+YWE1jnyv0nk/UwcyIDxhVVm/YbGUA+jt1
	kB1+g/9hulsP7Th5jWEjH4OsgzywWxhXU2h9XSZCxl0pdUCwiey4JcpYzLXajBlf
	JqcWj9i+knFv6i+zvuoUJApQ8X04Gd5XxAYMlyESWeLU1v1lH0xYDOHneldKer7h
	lCjIm5oza06P6dRV1pUFXEWCtzhnBaZhyyS/azLyZahyIBZULLBcju3jKyJTxOSz
	Mrm5om78MEYR5cIp+DBoZKMuwp8EIZQE+o4RGVjzXoM56bFC9/PuQGSJIUiL6NjA
	C++vGODQhgxbE0WaScqwObvkDfm39Uo2V4r6HjYc64HDuQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45pa1ntgm4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 30 Mar 2025 17:52:32 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c09f73873fso577677885a.1
        for <linux-kernel@vger.kernel.org>; Sun, 30 Mar 2025 10:52:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743357151; x=1743961951;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yfNrr9IWXB5j/RFLxcg5ak0n+LLaTpY+LShrMT5MZf0=;
        b=b8wMlPb2mmslmqMk6vIUOV73A6Kf5SiChrWGzNnBkf8UXjtjssl7TwqToTexQ+/LVD
         GsI+hhbHJK2TN6+jPPTmYUKtTQRIS+7dss+tOulgbeFv7q7PkQCbsmq+lXGnda1zXb4I
         nfhFaALVSIipzroRLDb04aVIFALx6v41bpfAUdl43s7L3uXKu4Ce713jUc5p7xsKwN5k
         veMvrvgcbPDdFw+j7yjRAyKZRNQcBmFmozM1F8PWCMnXMvXxENG/TOWMh3NHiG6GyeUy
         kqU0qsvefbWGKzAAtLy5BQSrJjmuiJXY44TitMP8JUDSSusb5xsMESeeKNW+u2UDj5ts
         Su8Q==
X-Forwarded-Encrypted: i=1; AJvYcCX1yk701FBDcHj4ySJXzv6S5uzLBVBBOJpeVVuurB1gOrENlu5vIuecK4pgpJiXHDKe9e2l4A8KDUsRnkM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzOUv6PR0XQtyEhiouQlezOzmUJOMwVE5XrOrD+lHBe6b5Y0BJN
	cmH5Y3e/aHO089YoHU6zXfpiYpDla5AqoEwX/FEb5w91TvOclqgmga4id+O0Afz8UQ4QncQD4K0
	7Q0O2tYpfDUUaoGbKc7kEz7fJWRac1dX/i07LeFUEIGY4svV0CJt7bB0oum4lwmw=
X-Gm-Gg: ASbGncug0NjM8z3IrfIAV+pnLcfSGfDX/vQ21wVSCZBKlRjMcQBnauPwItO5R5aIPS0
	vbgtBWwePnJVnoJYemy6P11SgOyyQU8e3NgmeZNjm/rgf5pXPYRHVBeys5/2l7J7zKRQVQgUVLO
	2IoDeioOrbM8Ixxe+ds3naM4r2dULtBpetlhwq87vyXBnc8LMeYeof7yyUvxZMxDYw6qAMcf3iO
	/PXPbWPjM++Ja/dwmGSnaG3tvrf6Xr6LZhUx82/uQvEJZCtKH6yuT+5wgyCSPGaOu+fxbefp3x0
	OAfp9KPeTnZ8Aa35yRqxYmgkiNoXDUYxmqwOwwU6Tm1XLheBImMtHBnmj3bUhGc/DVIJq6ghndJ
	610o=
X-Received: by 2002:a05:620a:462b:b0:7c5:e370:5c3 with SMTP id af79cd13be357-7c6862ebacamr786301885a.7.1743357151452;
        Sun, 30 Mar 2025 10:52:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFy5zLBvgqZ9PHFag3iQjcsiuGTjpjVXIsJR4FiwTqbGCjzxceuXoViknNhd3e/sRnunh8apA==
X-Received: by 2002:a05:620a:462b:b0:7c5:e370:5c3 with SMTP id af79cd13be357-7c6862ebacamr786299585a.7.1743357151150;
        Sun, 30 Mar 2025 10:52:31 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30dd2b4cd28sm11640941fa.70.2025.03.30.10.52.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Mar 2025 10:52:29 -0700 (PDT)
Date: Sun, 30 Mar 2025 20:52:26 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Charles Han <hanchunchao@inspur.com>
Cc: victor.liu@nxp.com, andrzej.hajda@intel.com, neil.armstrong@linaro.org,
        rfoss@kernel.org, Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
        jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
        mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
        simona@ffwll.ch, shawnguo@kernel.org, s.hauer@pengutronix.de,
        kernel@pengutronix.de, festevam@gmail.com,
        dri-devel@lists.freedesktop.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/imx: legacy-bridge: fix inconsistent indenting
 warning
Message-ID: <444lkvxa7iuymc6wx2gmcsjm5zv5wa4nq7dyhf4nkxmtfaxrhv@tm4hpcsoxo73>
References: <20250325075503.3852-1-hanchunchao@inspur.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250325075503.3852-1-hanchunchao@inspur.com>
X-Proofpoint-ORIG-GUID: KlHnl_9j9Pcra6-_oGeJ0ssfY1Kh-xV7
X-Proofpoint-GUID: KlHnl_9j9Pcra6-_oGeJ0ssfY1Kh-xV7
X-Authority-Analysis: v=2.4 cv=MPlgmNZl c=1 sm=1 tr=0 ts=67e984e0 cx=c_pps a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=Vs1iUdzkB0EA:10 a=F_93P0QhAAAA:8 a=EUspDBNiAAAA:8 a=hZwuMZaz95D9sbrnA4gA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=v2fne3mUlQEKA94IZ0Od:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-30_08,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 malwarescore=0 suspectscore=0 phishscore=0 spamscore=0 clxscore=1015
 bulkscore=0 mlxlogscore=679 impostorscore=0 mlxscore=0 adultscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503300125

On Tue, Mar 25, 2025 at 03:55:03PM +0800, Charles Han wrote:
> Fix below inconsistent indenting smatch warning.
> smatch warnings:
> drivers/gpu/drm/bridge/imx/imx-legacy-bridge.c:79 devm_imx_drm_legacy_bridge() warn: inconsistent indenting
> 
> Signed-off-by: Charles Han <hanchunchao@inspur.com>
> ---
>  drivers/gpu/drm/bridge/imx/imx-legacy-bridge.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
