Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 289FE254852
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 22:39:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747780798; cv=none; b=VLkarfFUvVd3cmYvh27WTn5XoUj5cIDDVmOmjt6dCaMNaGkvvY98xGZYmbGPuXIQtX8Qc9Oc9kk8tW5WcBG0GpWSWmYvZYhOUhibXDUlvTMpv0dtTIdRhWsY53L2vYwQniJRaazHUXu9b6GJpzhkT3SWMkBYU3fVqxhNiF3N/mI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747780798; c=relaxed/simple;
	bh=XE25ZX58jAiZRBZmXx7jeeHy2rt2xcwnkJKCGd4Uxg0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=g1m6qU+itYRh/bN99IVAPAalRszOF8mCb8gKiWp73WwNqti96ztrfjjv42vOUU7+xXnJ5p4qjCwCWj4Yc0S/SHjex6t9L97L1S3o528jd2x57IBU/cd+yAf2uc5qjpSMeUyZvV3XNYglUG5/xG9Pf+nF8NGXQ8yjDMCZ5TV7200=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O1WvMlEJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O1WvMlEJ"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54KGeEVW027127
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 22:39:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	INGdFU5uhKSwcTxbYag2RBqvK2YNeFulWsxZPVI5EJ0=; b=O1WvMlEJz1DuPYbu
	woYHxwqX3sIpmqqkoqhAgL0crckdvaZQqlwyTkJZqDa9rVNv7q6YtW2szt10CVza
	0tFjixGc8pK0jMWN3dNuJVYplWYAvte1edVHUVGrBH66LsbOTri9v4f3HY1azjVM
	korwOVXLhdjyIuZDjrQdkJbj6bp6H06hByGisS5/99zsHrRE+utGESv5dU8oL6Sr
	+eLw9ErtUfPNgi61piNLo7RaNQOHsXFEj1X0mUtsHlVe/zmwaVN/PaFO4LgreabN
	ceIbNIZ+CCGMltrgYJvmc2P2S4IRnU0/y8fDqOnFIFPeBsbUAzVB0aOtILNex7sX
	FqGuDQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf98stj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 22:39:55 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6f8cb4b1861so56976846d6.3
        for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 15:39:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747780795; x=1748385595;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=INGdFU5uhKSwcTxbYag2RBqvK2YNeFulWsxZPVI5EJ0=;
        b=T6fSV6u8mMaA3uXK408gO8gjw1ihkyJ3HGPw+NM6jXMoUdEOdTI1KHjqnLsiZR4zDe
         bwuVb6mBhELYEBdHdp1X2qZ4xfB307VusonQsOtJiObtVyNc3WcrWnrboTqgVaV28KOG
         w+jh0/Wsj1NZgs8hV/qm8STzwwXoJ03NczTRvBXA0n2fpM4fcgVQzUKJuI4AQ/2WYU5k
         ipdi3xWu1zrvcBSv5cPbptmMh4/1sPa+Tm9+OxDHTwgkIBF2CYdP/KxyR0phn/c2VEaU
         XOzfd82f1R55UealRfzn5/Yi/B6GTS+PToPFS4XMyvSYFuLMiMuY0TB7ZCEy8IWi7h6e
         1m1w==
X-Forwarded-Encrypted: i=1; AJvYcCW2f93BLHn3L22oaeuFLSsywPRWDDc9KU+t2SalvzUV5gQD7HXrQhie3PwFiWjJ15MmmP2PEMhig96zQQo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx60yJTgYUvx9pGdYlBH7hTNYGhZBEP9uPHGjB1cZKqeVQDV/Ad
	+fA98zNvcpeUKEKqLgHx4RSN317076KJNR7TanuUk37wCUzhLdgMkF05E+aHobmRDwOQLObnRg9
	qH90StARHE7FVNjN3K4ezo04BE3LuEeeD0U7RfmrNihwdkqcB+fOFt4iZou+/ukuWNbI=
X-Gm-Gg: ASbGncs7uidXLZP13DiMDzRVc10lHLzAJa04vtBArhiQ6pvIYm34lCe18/CqDHSCWdK
	YPazRLXlEUpI/FUwWamIMeDlpkBbQWR96NxyrJhhZ5skh9i8z5nXj88aOCm0rzBNzkgNfe8PbeH
	Yq7GIRsei2sCelHPnDj/fTkUO48vTEiP6TrpvfbDzfbK+9JDRPg0SQPUHTQhaJ59rZI15scFOXY
	nn7HgrQWHzpQDfJR8xyeMs7eCZ6BBpsXYXG408bosVfuoRotPQyHZBnZYBhftwFQN9NsQfx3sha
	1roEVnFASFMVeukQwCJD7I+A0ZLvQDvhZX2kXxj/3oXWJHCDckX/sU+7c9ed82HsgtWzLMRxiJp
	JFvHV1nxCDO831kWr38obj5uL
X-Received: by 2002:ad4:5aa3:0:b0:6f5:ea0:3c1e with SMTP id 6a1803df08f44-6f8b08813a0mr297701086d6.23.1747780794871;
        Tue, 20 May 2025 15:39:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGD0xAlJ3wH/oaYSOPdYI13RJeyfCfPRN9Ue6gywW+z9FJavZ09CQuxwlq9iCgVyt/X5U+Qgg==
X-Received: by 2002:ad4:5aa3:0:b0:6f5:ea0:3c1e with SMTP id 6a1803df08f44-6f8b08813a0mr297700576d6.23.1747780794401;
        Tue, 20 May 2025 15:39:54 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55208f7b362sm9497e87.236.2025.05.20.15.39.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 15:39:53 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
        Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <lumag@kernel.org>
In-Reply-To: <20250517-drm-hdmi-connector-cec-v6-0-35651db6f19b@oss.qualcomm.com>
References: <20250517-drm-hdmi-connector-cec-v6-0-35651db6f19b@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v6 00/10] drm/display: generic HDMI CEC
 helpers
Message-Id: <174778079318.1447836.14176996867060604138.b4-ty@oss.qualcomm.com>
Date: Wed, 21 May 2025 01:39:53 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: 1900JI49HRIZ62NyLa6zikoOYx2L6NCW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIwMDE4MyBTYWx0ZWRfX+D1OmDD/jQo3
 xA5xO64T+e90WGK/ITuBhlbSANbtCyviQFri7BY1qWLKWvohglx22XLsubPPOzkYYQngx4yFq9Z
 H+CtoPcCq1GmUQ7usBjpQ7bXsprFla6ELdorO8BD4/Mj2LIyhy9FH7Nr422wFVFuuqj9dq/+HvO
 UlPv0o0fmioNUmYUFw6GY/M5WCiXsQZi3sYiia/ov/C6/yFQmCeESj/D3i31EY1nlnMan80183i
 7tt1x6yizDNSTRFI5v+ORSCERdINTvLMWP2LWx1Vy6revAI6Ew5tlkcS3K5qjo4jV1p+W/kJRMR
 1CVg60iK3rAE+1T9Mm1eoLnYspLiPwEf42+xC2N8N4QLMUnW3sqJprI+08fc1+NhuCMgyqvk1bg
 y6zeyf3YUTp9dHQbv6YTVq7S6pLZj8XD8XYPCLV8LNVGQhLUDrQqj4hB6D23xZlbQQ9Cg/wn
X-Authority-Analysis: v=2.4 cv=GawXnRXL c=1 sm=1 tr=0 ts=682d04bb cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=DPgAmGmmPoEzzsVRo1kA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: 1900JI49HRIZ62NyLa6zikoOYx2L6NCW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-20_10,2025-05-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 mlxlogscore=906 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 clxscore=1015 malwarescore=0 phishscore=0 bulkscore=0
 spamscore=0 suspectscore=0 adultscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505200183


On Sat, 17 May 2025 04:59:36 +0300, Dmitry Baryshkov wrote:
> Currently it is next to impossible to implement CEC handling for the
> setup using drm_bridges and drm_bridge_connector: bridges don't have a
> hold of the connector at the proper time to be able to route CEC events.
> 
> At the same time it not very easy and obvious to get the CEC physical
> address handling correctly. Drivers handle it at various places, ending
> up with the slight differences in behaviour.
> 
> [...]

Applied, thanks!

[01/10] drm/bridge: move private data to the end of the struct
        commit: fa3769e09be76142d51c617d7d0c72d9c725a49d
[02/10] drm/bridge: allow limiting I2S formats
        commit: d9f9bae6752f5a0280a80d1bc524cabd0d60c886
[03/10] drm/connector: add CEC-related fields
        commit: e72cd597c35012146bfe77b736a30fee3e77e61e
[04/10] drm/display: move CEC_CORE selection to DRM_DISPLAY_HELPER
        commit: bcc8553b6228d0387ff64978a03efa3c8983dd2f
[05/10] drm/display: add CEC helpers code
        commit: 8b1a8f8b2002d31136d83e4d730b4cb41e9ee868
[06/10] drm/display: hdmi-state-helper: handle CEC physical address
        commit: 603ce85427043ecb29ef737c1b350901ce3ebf09
[08/10] drm/display: bridge-connector: hook in CEC notifier support
        commit: 65a2575a68e4ff03ba887b5aef679fc95405fcd2
[09/10] drm/display: bridge-connector: handle CEC adapters
        commit: a74288c8ded7c34624e50b4aa8ca37ae6cc03df4
[10/10] drm/bridge: adv7511: switch to the HDMI connector helpers
        commit: ae01d3183d2763ed27ab71f4ef5402b683d9ad8a

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

