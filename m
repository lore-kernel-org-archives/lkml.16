Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B0062459DE
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 23:11:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744845082; cv=none; b=r3/xm0L9kJeWZMMc2e4b/ilzJ2Ca0//bR8LfMN66IiHU4uJVqbayijxJAX/0+YLeWydc/Jx2omyFaZK8DrDDzhRjNYLq84NjRzU5DaPPBWxwp6AC6TaCQDK2xUN26NEaU9ynnc4+mz8BhuWxW/GBBnbsR1FRzBxGlcabBIxftgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744845082; c=relaxed/simple;
	bh=QOnBohye2lCBfKZylFV+0g2+PfYV24j6WkQ1MxBBizs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=XPcDgztZLVwq7mwkATfyu9Ka/BoA3NLHpF3ww4HxkvonR/nsnk3853K6YQcgbonaRofWVVeMv+YCfqQtT/Po010ecwJk9fqzDTnAPdoTV4AKFi72yQdQZ0fclENpNncQLkRgMzRIuROOhf0qCVBi+iA8uM4HJ7sdXXnB0pFtXmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gJoIoySF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gJoIoySF"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53GLlCK0007012
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 23:11:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	98niqdlXLK9J+3bRG9oA4bu8nQ0nZNhuz/jgIqf5jH8=; b=gJoIoySFnGjo7i2b
	7sd60WduwzJ6/N6ONq3aMlXMFfxjlJ9gHnNZImNWA2QmaHHzEKeHxtWHFk5xfoek
	fud5nae1xxnCQyr6LWwrawoR/gOSovQ3gxlJ0P5LNRpPpbKRVe+eN8xnSGxH8LVl
	rHBDsZ+xs74EN7CQVMzN42Tf4pyyIP17kaBIakFkBE3P+vN134oUi+34QIW4tIGl
	qX5Ge4N59CLcEcPbIVkxMsY0cB/o8V/jrMZmQZA6xITMlaQmQeegvGQVzabGYxPl
	tmpfceqMJBi0mPjwJUZIhh2GOvD/nke116OCXp9UOXoSXK7BaD5Ni+y5RfrLEtaT
	Usy2DA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ygd6n3ny-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 23:11:20 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6e8feea216aso20448546d6.0
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 16:11:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744845079; x=1745449879;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=98niqdlXLK9J+3bRG9oA4bu8nQ0nZNhuz/jgIqf5jH8=;
        b=dLnLZmTLVVlIB6Z270B1O+dAglk7xKL9TcS84UpTHhC1cBnjlJEKIU6FcVZGPG2qkt
         zZ3AevSw9qEMoWA/5tFIewLcZa6y26QOsf6Taf2X1gvUwRHOMBSa2ov4o7BxjKJ43Ig4
         6V9z20EocG4H+r9j8j8uAKECAQuqUEBBDubByyUqzudMGbZsjrusSMtc1BSJ+BVpUjoe
         V9d+bohYrEI9sNLfc/klqbk8X9VHnL+IppYYrAqCu2Pq5vRZ/lYZ7pBIpb6A+c76+4Hf
         hswJyd6446EXWizmMZVTc9fb2XY6O0plLcQPjMZEfugT89GvraTAoE/Fg9MC5pUbdzL+
         ufAA==
X-Forwarded-Encrypted: i=1; AJvYcCVOMsA1U4jh2U5F4VB5DXtd6CbhfEu438/YnLeI6UoL/1weFtiqRfkTTzBp1DlahlAMk1aGRcY5AImhPB4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyQHZ3KfEeQBWMYFt7K53X1+X/wrZ7rrjvIe3212QaCjDOjB516
	ubNK+SaZR31DlLknpzh5J7iArsVupm/L2bqBBrE6HxZXgcYOsq26LWTNT5YJRgPqkPGXWpUi4IK
	PzfrragyKrj2I3CtlMSGcmSZJ2a/SkaktcT12Ege9EP34YR6eSmROqaXNWPBMiZ4=
X-Gm-Gg: ASbGncszePNPWhLQdHTmQOU9zYjBTl42I+Vg2jS/YoZcUNjEqMPaV3lyzWGp5tjJENy
	rzEeb2ttBI9gQ66mTgX+04S/rCe0MuPzHTDAm9nY/nNWORgM3i0hn1+9x35Egfw3JcfOUVA+1su
	NTkz4r7LIWPqks1FDBEizt01Qmfg911CicT7LV42QakJoTTnajitmjLTiqTZfmAUubBVr8SpBxJ
	/ymB/jmQr0tPPO8bXTOhMetM4MhxwK8ZZ+rgKMrzA+vXEC8RX6AbVXCtpyrY8Wmlg13aLikpFSk
	rU+0aUs6L+v9lXDJ40QYVCQyHvT3GXj2UbtGOTbw/Svk76w/8NfAcgUTFrhfU3zfB/DR+3Js8yU
	=
X-Received: by 2002:ad4:5d61:0:b0:6e4:5a38:dd0f with SMTP id 6a1803df08f44-6f2ba6368cdmr14109026d6.4.1744845079522;
        Wed, 16 Apr 2025 16:11:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF5OXDnohbl8oeAzsRqeqnMfuWC8/Rpk1ZK4IPEy4zY5pYR3a7jLV2D9p0jr1tIe8cERst8zw==
X-Received: by 2002:ad4:5d61:0:b0:6e4:5a38:dd0f with SMTP id 6a1803df08f44-6f2ba6368cdmr14108726d6.4.1744845079206;
        Wed, 16 Apr 2025 16:11:19 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30f464cbbb0sm25320081fa.30.2025.04.16.16.11.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 16:11:17 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: lumag@kernel.org, Andy Yan <andyshrk@163.com>
Cc: cristian.ciocaltea@collabora.com, mripard@kernel.org,
        neil.armstrong@linaro.org, andrzej.hajda@intel.com,
        dianders@chromium.org, jernej.skrabec@gmail.com,
        Laurent.pinchart@ideasonboard.com, maarten.lankhorst@linux.intel.com,
        rfoss@kernel.org, simona@ffwll.ch, tzimmermann@suse.de,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        heiko@sntech.de, Andy Yan <andy.yan@rock-chips.com>
In-Reply-To: <20250411115941.318558-1-andyshrk@163.com>
References: <20250411115941.318558-1-andyshrk@163.com>
Subject: Re: [PATCH v2] drm/bridge: dw-hdmi: Avoid including uapi headers
Message-Id: <174484507750.205743.4528979929062374879.b4-ty@oss.qualcomm.com>
Date: Thu, 17 Apr 2025 02:11:17 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: f9qSTVy-qZcX_L_eOTks_EhmSkV9ZYNI
X-Proofpoint-GUID: f9qSTVy-qZcX_L_eOTks_EhmSkV9ZYNI
X-Authority-Analysis: v=2.4 cv=ANaQCy7k c=1 sm=1 tr=0 ts=68003918 cx=c_pps a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=3vWo_mccuV0xSmgm2PwA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-16_09,2025-04-15_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 mlxlogscore=768 suspectscore=0 clxscore=1015 lowpriorityscore=0
 phishscore=0 impostorscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504160186

On Fri, 11 Apr 2025 19:59:37 +0800, Andy Yan wrote:
> It is not recommended for drivers to include UAPI header
> directly.
> 
> 

Applied to drm-misc-next, thanks!

[1/1] drm/bridge: dw-hdmi: Avoid including uapi headers
      commit: 4890d68db651562ea80250f2c93205a5c0327a6a

Best regards,
-- 
With best wishes
Dmitry


