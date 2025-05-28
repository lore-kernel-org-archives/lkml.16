Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 299D92874F2
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 13:49:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748440176; cv=none; b=VPH1JyPORxAfKMou3QjDpBvjlMdVi3xBEVkPTN83Dh69sm6uj/6f4T6b6sbVBx8N8nEtVj5xidWBvhzT4mER7gwi2FdTozY2H51P69SRbTX4CNcduCytxrIoaM/lgzo1Ge2jDG9twICBCt54DxdRlWdcHn/aWdrA6WiZFvjmg2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748440176; c=relaxed/simple;
	bh=ghaXBE1MgUHH3Jlnqhk3hqjJWrRd4NAWpHTaQalt0HU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KWvmnGek/1fniL0EKQ3ReJH6J4EAkX9FvfwFcDbFZCefIz7e+yS6TFsoTIIaSYR4GydF0LrQrSBr+LJ+U/vXYTBP2C/kio7LnOTrf89mjvBXGexD0JioDjeRs9KhYCyDFQHrc2Ty1U/+Zst29dxa+gO4iAixl2yyDA8gYeNRt34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=i8MzSD6n; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="i8MzSD6n"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54S9lCkf013860
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 13:49:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aR8odOp1bWcix/LESz5USRpAg6qn2kdhUsn02vsANFE=; b=i8MzSD6nVRzQJFym
	YeapS9mErWPakUo/a349MpEC/gkKDj+SMzl+ehS5QHAd60G5R5x7SL0GWnFzXfr8
	AINR7hl68lundk6eiXStqVMcvLBSiXEivBvFygOYQalAEIDuWXyvwUbMzJxq4aZe
	hYokdVFaQaV1DeqjeqpZK5FZhEJKORO8W8kCm1OlgJnGaUGy+SU3IW2lgk9xOBPN
	Nk3f5t/wkOKj/1S7PyIkoOYiayOcvwwt5sVZoRORkQPkisygtbL34rMERCXcJGQb
	RnSs/eVUS/BZT+Bqsi0KGuZLTgKlfWZnsDYxm5wYboenKTE5tZSgmInoVzFQMcPw
	vtXP7g==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46w691cw20-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 13:49:34 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6faa913360fso73022986d6.3
        for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 06:49:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748440167; x=1749044967;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aR8odOp1bWcix/LESz5USRpAg6qn2kdhUsn02vsANFE=;
        b=ldRD7ISQSZCaJcPpNvD8nB2zpVs6b4B/ihQywo2vBQ1x2dkJbHfntMoKJNAhgZt9dq
         wD/lfpLB57fMF6Tkt1bVd+/I2WXC3HteKnVclBZ/BpdGte2kbr16EodO/xEb2gEBlpxp
         PIGhe7oN8PjKnL5X3FoRQEgrXs7JoA1LkXXA+0dbnIPPEK41ld+gl19VLry5O5Z6WN50
         /EE2AA4fJCKV8QPqA9xl/fPEvgC8OvHNGlye+iuXW9pMP+hXlyjckEWwYFOSN4oYmmo8
         dGFSKFamIELDecO1jLCdz8qPAEDoJ2+baE8J1+dVbH5xwSqyRqJ9icC1aOfraCHG4zkm
         psGA==
X-Forwarded-Encrypted: i=1; AJvYcCW16ATLTyegd/PORWAeS9XFTgywCAMmcvJMqFBwWVVPMPpwrgtOfleF8ZWDZl3uY13Nwc1UDQkQWq6xvZY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzpDQaN0IcdkKVqgwgBl8ti36cFBZPgLcy8lwpCXJqCTAYLIbvp
	QBCRSPfyTJFr5mlgjfaaCgyy4cz25azSXCLOqGczyFiihMVRjR2Sr2Ja0MZNp1w8ombtvvi8566
	ri3tSgT08Ohh36Hoo5EhmiAT3xOnh0YU4OPISQAszQhhqbsEn3DdawFXMoqzccSK339s=
X-Gm-Gg: ASbGncthRl19qgEOy7ISob2hfgm7PW3hGrZ+79sCAOBNMq2zbORwKEMVIUSkApBQxVz
	xsV62FktEnYBzn8IYTIN2bSeOjv9hbbRvURJaivj+8a4X5rpYlhJ6QuBJw3Jof3dNZRGVFQe2rK
	lWHWeSBnFfGiNBirQdyezIot8d90rcbojKPfR/dsD+ivvQ5XrFI7L5ATvmz4ASb4w9WrXogfi17
	yLeCYgNps+yDTr1IT68HZHUHtrqWlGu7VHlVvHbS9vQ0ZAtKr9Q1K5TPnGR8KjZ7J24RELnk7pP
	GrabLgfqsywby7L1DBGyoZW9eUEJT3Nq1DHV25djQll895k3/X9Yp9VFhA0zOsOqyITgwSa3SjB
	Bw4Qb1krJg5DmvUJ3ZZ6+Tx4C
X-Received: by 2002:a05:6214:4115:b0:6ed:19d1:212f with SMTP id 6a1803df08f44-6fa9cff156fmr267535416d6.5.1748440166988;
        Wed, 28 May 2025 06:49:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHDO6tyMZzFc/D9U+K6bEzH7XCUHyfwSxg+WJm9sWUexygSxn7JoUOf89bLsbQ1ceAIxPl3Rg==
X-Received: by 2002:a05:6214:4115:b0:6ed:19d1:212f with SMTP id 6a1803df08f44-6fa9cff156fmr267534936d6.5.1748440166606;
        Wed, 28 May 2025 06:49:26 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5532f6a6253sm289576e87.202.2025.05.28.06.49.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 06:49:25 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: tomm.merciai@gmail.com,
        Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: linux-renesas-soc@vger.kernel.org, biju.das.jz@bp.renesas.com,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Adam Ford <aford173@gmail.com>,
        Douglas Anderson <dianders@chromium.org>,
        Jesse Van Gavere <jesseevg@gmail.com>, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] Improve adv7511_mode_set()
Date: Wed, 28 May 2025 16:49:25 +0300
Message-Id: <174844015640.298125.2461085924621609472.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250528070452.901183-1-tommaso.merciai.xr@bp.renesas.com>
References: <20250528070452.901183-1-tommaso.merciai.xr@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=WfoMa1hX c=1 sm=1 tr=0 ts=6837146e cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=Uzkek4HQei2ilSC5KyYA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: ReQ8-66kT_ZcjsTrEKOErTfkKptFatDv
X-Proofpoint-ORIG-GUID: ReQ8-66kT_ZcjsTrEKOErTfkKptFatDv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI4MDEyMSBTYWx0ZWRfX3zT5CupwGA7g
 X//yOfzUJJAKU0FqINt3aowng36asX6eCqos4ZjBi5mq9xQVaX0ZdYkwfadcTNw0bvZdTIu/Cl4
 g4yXnrgnGxSKPMmW53lPZmWej8fXy+8WdGYB9atyYrf1eycO0ARxlULRs454gCnsR5aeUk1q9od
 qrqr3wrwZbA6iXjmtL6eAWWsyWXIyN6B3HO0ee04sLrNXcCL1XqdkGpXwiKH/kUeDQfwWe5it6r
 lZe1uAY0LX1fu+ev3Y/bp1ZSAFvNJlrSKJTpSA8ZvY/rlZnXpzrKC5OlbWUx65M7do6CLbhARLm
 kaD+2OYd5+3oktuKmlzJS7P7j8ZhJPsxuJCaaDGN5bgMJp3VSITiCMWcNzzRHBibLQJJYnRK05/
 esnQPsUeN3M5dEC+7qzYLw4TP+5Hb8xHmvgqK+11O86t7VLPGjjM5b4nK57fztl9ZJiFTfxZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-28_07,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 mlxlogscore=999 priorityscore=1501 mlxscore=0
 bulkscore=0 adultscore=0 spamscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505280121

On Wed, 28 May 2025 09:04:36 +0200, Tommaso Merciai wrote:
> Currently adv7511_bridge_atomic_enable() call adv7511_power_on(), then
> adv7511_dsi_config_timing_gen() that is responsible to update h/v porch
> params.
> 
> But during the adv7511_mode_set() adv7511->curr_mode change and this is
> not reflected into the h/v ADV porch regs, then h/w porch regs are keeping
> the old values.
> 
> [...]

Applied to drm-misc-next, thanks!

[1/2] drm/bridge: adv7511: Move adv711_dsi_config_timing_gen() into adv7511_mode_set()
      commit: 1f5090c4ae71d070aa9dac49b8ef3efe0da0fb36
[2/2] drm/bridge: adv7511: Rename adv7511_dsi_config_timing_gen() into adv7533_dsi_config_timing_gen()
      commit: 6e76b312a681224881c05835ed5a26e012ce80ea

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
