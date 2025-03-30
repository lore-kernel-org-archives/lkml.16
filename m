Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C772E524F
	for <linux-kernel@vger.kernel.org>; Sun, 30 Mar 2025 16:55:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743353721; cv=none; b=iqLbHYobyimT9Cs8a2VYgw+IftrF16AQ0SQ+SfwO+UtKDHm9S0N5WgzHgCwuG1WALyOAPHFq1Kah6jRxNaNY3yw4F9fYj0jZHTBJOtGNPvRarVDWgbbHD8ntEsRn0orempPK7m1y4YceFAGnyoxhwh2CVmAPX/DzP90eybqtxQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743353721; c=relaxed/simple;
	bh=+UJDYfplEK3WpB9U/KFLjPElg2p3sdeKDknHUqVAEaE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MO7rYvE5X+8b3tnNH4XpKwCa5CHgK8f2TPJ5AwYly7+8SYuZXuJfArPZQ0bjmQlHtLGWflu4ADD0rg+flyUY/3JdsBvVkur6P7Ex3zSx1AornvIlby2nmBPQr7NLylXtP1hRl62+yhBi+CYRpyzteEtpv8Ur2evW91JPqAAnuAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ce84ToK0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ce84ToK0"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52U8phLm025248
	for <linux-kernel@vger.kernel.org>; Sun, 30 Mar 2025 16:55:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GUrBfIYYw5qsuVg+BKVVhTizYQpWebXJ5V8Ck22XQcY=; b=Ce84ToK03dnR+Iot
	pyECRxPQQx9zLrdco4FGIsRUeLjigkmumSRZk4yiEHETbH8bj5vjQkJOAyHQKFhR
	yg9oRy5CdwgXai/8xnIA+YEeLwohQzwbVOyXAChFVWzGeiD8XLs95fxu/QEcXhqt
	YOi4tnqN2DbSR7X/Pq0XTOiABrHn3zG1yRrqRlFnrRNlSoSvSht3o6/xeaFgerm6
	gT7V5MrMVxKY1ODLGepIHo4xibrOXZRen37pzM09t1bZlrN1mh+Jb/CW+/sgunrc
	qiOfkWfAs8NFVrKtMg1ysi/UkhEHMMisBA4mBQ/m31khsMmE56d3WX3+uvsB52aP
	V96z8g==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45p8f1aj1a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 30 Mar 2025 16:55:18 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c0a3ff7e81so691063285a.3
        for <linux-kernel@vger.kernel.org>; Sun, 30 Mar 2025 09:55:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743353717; x=1743958517;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GUrBfIYYw5qsuVg+BKVVhTizYQpWebXJ5V8Ck22XQcY=;
        b=DC16MDbNGRG74NdGWFAN64r8TKGTVPCWedOqGte7GVB8NcJ5zskYqodYm0e13rmQTL
         Tgw5dbRkl0Ncnphl35TDVuvlf1F7HPdWXeBh6fxqfLsZnL1Xxi0E74L+vHyk8vZqSDl6
         vmWuRRH/LpjOlmye6cW3bS5/jdJ1gO9ZGrRSp5jOlAdghAIVPmWqrKGTCEHJ4XKyF6ap
         75CUVfdkuzv3xlXtqbYmrhG1NgxUbAnKG1GsXz5YF1ij8jCGlheTr57KYTiWo1RUAfEs
         5Ow11nOj2WJbyH0bLLPT8PPuei3EebiNkKfmUlmhP2FwC+fOfTXzq5Ut6gxgX45D5tmA
         Yh0A==
X-Forwarded-Encrypted: i=1; AJvYcCUSuVUd3UkRfwkieKFa9kJhj+0sX7bCxAT+Gk1cQ054PpQlxtFoC3b/SarxAOXAo1Cc9G9b0usJ2/sVyRQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YySxC+t6Q6JfQH9N/RL5Ya3xo/FcbllSIZk1c8CIxsMe0KkAI7r
	4Tb7AdJJ04hH3BwQja5bx3sJvs/Lv4JDho7M2OEzke4OhAxRkgJeVCu0Bw68h4Fe/e6FBn27oR2
	p649fnaHHSwU1Sx1ro6AjzoDWJrSZKMRr9OjIwMaf1wiasb7NtL23b2W7WFPcIhU=
X-Gm-Gg: ASbGncuYwj1Jg1f6aextsCFCMwZqOzd9XNOXLhoSVA1dD8G/G27SRTM039fZvr9+LIy
	cTz1rIDOcDOJnv8hHldXhq6M5xsujzbRuI2s0YadqamMkiu5ZO7SGqF9bq1tiygwc9Yxdso+Hgw
	HKodCK3H6xjjaPuH09Vdyt5j8JX73NuwuJ4l/3flamgtGZ2mwNfmhNtAm6IXXQ1f49cU0oUZ6So
	hpYYQ0AB253aftav8W+xYF1HpjveuWLGlyGArYUIJbqjSt0ZbZ8Sxt8+9sNgG5YsKTU/ru8tZtU
	JOnDPEa4nM641oSDdODmpR/6XJGw6cHMPx89M2I27BanQv/ZgBJE199BjA+Ytlu82uU=
X-Received: by 2002:a05:620a:1a83:b0:7c5:61fc:d325 with SMTP id af79cd13be357-7c69072a768mr984589285a.31.1743353717392;
        Sun, 30 Mar 2025 09:55:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH364mIFZJW3hoz85FbxuesUCOvVrbLJe9Tx2HRSGKqXtJp8FuUZyrC4KRjGSWtAKEsT6D0ng==
X-Received: by 2002:a05:620a:1a83:b0:7c5:61fc:d325 with SMTP id af79cd13be357-7c69072a768mr984586385a.31.1743353717015;
        Sun, 30 Mar 2025 09:55:17 -0700 (PDT)
Received: from eriador.lan (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54b09592ea6sm926902e87.170.2025.03.30.09.55.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Mar 2025 09:55:14 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Aradhya Bhatia <aradhya.bhatia@linux.dev>
Cc: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
        Devarsh Thakkar <devarsht@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Udit Kumar <u-kumar1@ti.com>, Jayesh Choudhary <j-choudhary@ti.com>,
        Alexander Sverdlin <alexander.sverdlin@siemens.com>,
        Dominik Haller <d.haller@phytec.de>,
        DRI Development List <dri-devel@lists.freedesktop.org>,
        Linux Kernel List <linux-kernel@vger.kernel.org>
Subject: Re: (subset) [PATCH v11 00/14] drm/bridge: cdns-dsi: Fix the color-shift issue
Date: Sun, 30 Mar 2025 19:55:11 +0300
Message-ID: <174335361171.2556605.12634785416741695829.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250329113925.68204-1-aradhya.bhatia@linux.dev>
References: <20250329113925.68204-1-aradhya.bhatia@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=AsDu3P9P c=1 sm=1 tr=0 ts=67e97776 cx=c_pps a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=d6wwUhUekskWgI7q1RoA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: akV6hUPjD7WE7OEUaiV9K-EccUvvXaGs
X-Proofpoint-ORIG-GUID: akV6hUPjD7WE7OEUaiV9K-EccUvvXaGs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-30_08,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 malwarescore=0
 mlxscore=0 mlxlogscore=999 priorityscore=1501 spamscore=0 bulkscore=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 adultscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503300117

On Sat, 29 Mar 2025 17:09:11 +0530, Aradhya Bhatia wrote:
> This series provides some crucial fixes and improvements for the Cadence's DSI
> TX (cdns-dsi) controller found commonly in Texas Instruments' J7 family of SoCs,
> as well as in Sitara AM62P and AM62L SoCs.
> 
> Along with that, this series aims to fix the color-shift issue that has been
> going on with the DSI controller. This controller requires to be enabled before
> the previous entity enables its stream[0]. It's a strict requirement which, if
> not followed, causes the colors to "shift" on the display. The fix happens in
> 2 steps.
> 
> [...]

Applied to drm-misc-next, thanks!

[01/14] drm/bridge: cdns-dsi: Fix connecting to next bridge
        commit: 688eb4d465484bc2a3471a6a6f06f833b58c7867
[02/14] drm/bridge: cdns-dsi: Fix phy de-init and flag it so
        commit: fd2611c13f69cbbc6b81d9fc7502abf4f7031d21
[03/14] drm/bridge: cdns-dsi: Fix the clock variable for mode_valid()
        commit: 132bdcec399be6ae947582249a134b38cf56731c
[04/14] drm/bridge: cdns-dsi: Check return value when getting default PHY config
        commit: c6a7ef0d4856b9629df390e9935d7fd67fe39f81
[05/14] drm/bridge: cdns-dsi: Wait for Clk and Data Lanes to be ready
        commit: 47c03e6660e96cbba0239125b1d4a9db3c724b1d
[06/14] drm/bridge: cdns-dsi: Move to devm_drm_of_get_bridge()
        commit: 7ad8b3441b8ebfc56b439a28328f78c755bbef29
[07/14] drm/mipi-dsi: Add helper to find input format
        commit: e83967c355d6194c906e7bb3f1c72cb002e14c9d
[08/14] drm/bridge: cdns-dsi: Add input format negotiation
        commit: bc36ee983fb34962a407c06196cc7874bf408146
[09/14] drm/bridge: cdns-dsi: Move DSI mode check to _atomic_check()
        commit: a53d987756eab40678f241d7cd0eb7e1ca42bba7

I have applied only cdns-dsi specific patches. I think that generic framework
changes should get a review from somebody closer to a core, with better view of
possible consequences.

Best regards,
-- 
With best wishes
Dmitry

