Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CCF924C669
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 12:14:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743682462; cv=none; b=or4kXktRmbudM0bkK82cnqkYA0N0eh7WYR7pQut19mwenGPS7jVRUu5ve/zbwRAC169zeW970A9/CdJLnx6SAAHrNyVdH84kySGifeJgHZeeWocfMrRKaPbQn074mYxyymiNZP1FQJCBrvBBzkSpVUOamWK+hB8yrPjDu4JDuTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743682462; c=relaxed/simple;
	bh=7d13QVyEyEnoQEAR13QWW1PydVxVzD6quHFwo0EX69I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dlUrxV9gHnhYNFltHLvjE9UuW6bIKRmzEvfvRm1IPcDwDz5/QuOm2T15U5AaaaOtbnUyfnJnUZ7mXbx/WMN8924umxcMY4fJIGTalFLb3Lza45Reqt5jtPoMnXkeS38sX0TaGPjtTGz2n0cqhxM0B/POAuScEYsGI5fZec/oq68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Fv64jfy4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Fv64jfy4"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5339s05H009817
	for <linux-kernel@vger.kernel.org>; Thu, 3 Apr 2025 12:14:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=dLykAhXWunHI8kSEy4WPYTUf
	hVytF9OGgggs8oTBDs0=; b=Fv64jfy4d7VRv6OsrA0sxh9Ku25e6unlukHU6c8p
	8wQRIVptsYgJVqd4mxFejsLZQnguSeTRwvPFTYtvOfNMLE8+o1xkA8yzM1wwWX17
	prCeJ45gxLCpz281i9Zx8jhwFPi45eQrnO2je3DMhgdPaFhJj5GlTsQvAnErxwUu
	1XWG+1JkZ2GKOrbDR95XS8ecyAmk8rLhItrK0frTlP/J7nsK8ooiW1ihsf1wW26f
	+K/8K+vwERjvObuiVkQqAmMG29cif/nhfrpSqm9hcHZbBpBEG9ZeGphNmLww1rkW
	/NFr51LzS1VWyJDoBuHowhLSC6T20TBssRh5KzZ0aLcizg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45se4g1syn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 03 Apr 2025 12:14:19 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c5f7210995so169590485a.1
        for <linux-kernel@vger.kernel.org>; Thu, 03 Apr 2025 05:14:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743682458; x=1744287258;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dLykAhXWunHI8kSEy4WPYTUfhVytF9OGgggs8oTBDs0=;
        b=WFTTjYZoYf3EdIu9IRf3Oe9HnBactgmFaqdwzDH+dBGnVidRiEkie+KHMr7y+11x0y
         hZS8CiQhLlnOS01y7KNf+4Z9lA7C1111fB/a6gpb8VrsasAJvhp2mEtV+aoTx93rBLOG
         qeXYfa5XznRg8gg8vAx4T3PlcTU9Vg1Z1/rnxWUEpsermYMK3es7vg/Vj4yAR/bEognJ
         NSR+EBdFoQnugf5LGjjnV6+dKPZqbnnaS1hsQZNLaL9nBk1sfzKHXxwspAUe4nT5qwYt
         kAb7cLrF1zSHAkGf5YJgPx3nAhhVDpJzfaQ9qqup2PfswqiJOVqrxRgH5qI2etg297rD
         AO3g==
X-Forwarded-Encrypted: i=1; AJvYcCVJkPIgyVO6DyZ4omEG7SFd13xZ56nd6REz2NL8N7HD5dWlqMfYpz5VgBwiTLeC7OYPqMEJ3MFd69AvICg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxuX/OZM0RAxEZSFVoil7xn80Bh0DkRaR7ai+dCZ8Fylcqqpdxs
	hlyfFQdzKhBlRri7/R9I389yB7Lbl5qQ6j2E6ZGOZRRlU6Jvh+ryv/3Z0sc49pjVEdolNpbD3ZD
	BqCHvZZyaxSdzKcaT9G33q7kq67OuZQ1BqrwcUIVhw9mgbHB8Sk6KM+gfKdP6phU=
X-Gm-Gg: ASbGncuc9nwa4lpPZ1uNl+uf/oX/c/sWxoHnN1W2FykOD1GjmKBut9fJVw4xw/fIluO
	ozXoAbklsD5uCn7/x5EAhNm0W4EONeoRmUJTGSFuhtBsyo9+2rJ/GYUBviutdzzzi2bieZLvtEp
	GuEz0+vc1iv4mCbmEJ69l478MXs3G3h3QL89uQGF42t3Bqw0qmbLsWhU67M15RjmF1BKB53dOTp
	29NsmT/a2F2zTM6hPM9x+DKZMv949cL3Zwfgys5OqWwvEXaMU+AdmkV62rLQaHyQlG9sPJFL2JG
	MdvRBG01JDLERKwzkBAEJOVAN6d36WAYpQo9uvKtHoKLiboSM+1co7pZlx1TN44Qn5ndDlLCOs0
	q9ZU=
X-Received: by 2002:a05:620a:2910:b0:7c3:b7c2:acf6 with SMTP id af79cd13be357-7c76c98f7dbmr511678085a.15.1743682457791;
        Thu, 03 Apr 2025 05:14:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEQP5HNZ7qkcK4qHlBcQj9o3SAvJ8aXKNFHMdgvICYbDg+OhKlKPefSoRKfg6pRpmiRTZ1ysw==
X-Received: by 2002:a05:620a:2910:b0:7c3:b7c2:acf6 with SMTP id af79cd13be357-7c76c98f7dbmr511673185a.15.1743682457414;
        Thu, 03 Apr 2025 05:14:17 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54c1e5cc52csm138973e87.105.2025.04.03.05.14.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 05:14:15 -0700 (PDT)
Date: Thu, 3 Apr 2025 15:14:13 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Andy Yan <andyshrk@163.com>
Cc: heiko@sntech.de, hjc@rock-chips.com, mripard@kernel.org, naoki@radxa.com,
        stephen@radxa.com, cristian.ciocaltea@collabora.com,
        neil.armstrong@linaro.org, Laurent.pinchart@ideasonboard.com,
        yubing.zhang@rock-chips.com, krzk+dt@kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-rockchip@lists.infradead.org, robh@kernel.org,
        sebastian.reichel@collabora.com, Andy Yan <andy.yan@rock-chips.com>
Subject: Re: [PATCH v3 5/9] drm/birdge: simple-bridge: Add support for radxa
 ra620
Message-ID: <mp6dgybevy5uercnqam3ok4rorpmo7a7ok5jcgadmxypl7ueaf@yl64do47jnp3>
References: <20250403033748.245007-1-andyshrk@163.com>
 <20250403033748.245007-6-andyshrk@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250403033748.245007-6-andyshrk@163.com>
X-Proofpoint-GUID: inoDQbzTRJElrtE6pic_JP3cJHy9Gm6G
X-Authority-Analysis: v=2.4 cv=a8Iw9VSF c=1 sm=1 tr=0 ts=67ee7b9b cx=c_pps a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=s8YR1HE3AAAA:8 a=EUspDBNiAAAA:8 a=mpY5dVvo0S6m34Ll3HoA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=jGH_LyMDp9YhSvY-UuyI:22
X-Proofpoint-ORIG-GUID: inoDQbzTRJElrtE6pic_JP3cJHy9Gm6G
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-03_05,2025-04-02_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 impostorscore=0
 adultscore=0 phishscore=0 priorityscore=1501 mlxscore=0 lowpriorityscore=0
 suspectscore=0 bulkscore=0 mlxlogscore=922 malwarescore=0 spamscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504030051

On Thu, Apr 03, 2025 at 11:37:33AM +0800, Andy Yan wrote:
> From: Andy Yan <andy.yan@rock-chips.com>
> 
> The RA620 is an active DP to HDMI converter chip, basically
> no software is involved to drive it.
> 
> Add it to simple bridge to make it can be find by the drm bridge chain.
> 
> Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
> 
> ---
> 
> Changes in v3:
> - First introduced in this version.
> 
>  drivers/gpu/drm/bridge/simple-bridge.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
