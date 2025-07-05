Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE13B212B31
	for <linux-kernel@vger.kernel.org>; Sat,  5 Jul 2025 19:06:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751742405; cv=none; b=NLedSQkAcuy7/9rLwsv+dGgEEO8Eexew+xJRrGCvxZZrIw6sbD/8B/o1bQbwjLCu2C+fDpQ/+loXN0I3ARpZfNlvoZUOSsha+z8/H4dEfPzxM3ClAVxL5l5vazSLScWeoo/v+gO+DDvBjFp266jc0NKgHQyA7aATumX2FeXY5HA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751742405; c=relaxed/simple;
	bh=pO0zFVK9oc2/uCR4Vh1qvCcYjVug+NYzs8T7O6gjoy0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=uuMhlHdzodW361ip0eqqAjnXRlpjAi/YVjU4bJlN+p79yNzE3uZ9VBSSBYakIZITNjJ+wBmgIO7GWH6gxGsGMktB+PQsOCy3FtrvbhwiuZmwzCkze72d1mV8NPES0LSlwlbjiHf/1qHtlN8xpS+I8s6cztevx/TBo4QLqoa3qLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SI2R4JFQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SI2R4JFQ"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 565J0pkI013002
	for <linux-kernel@vger.kernel.org>; Sat, 5 Jul 2025 19:06:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	t6XQnLaTPoi8ccl6X7Yo5PDD6ywDE3LoQxRYWhwU+VM=; b=SI2R4JFQ4nLOk4Yg
	mYeuqGcGykYQJzzN4w0I7N2rGlqgDgJtvucnHGcU5X9ZU1gzuZoKzSZoJSdTKJD9
	VMWGh+JWUrOHQzEZkDN0PHTf9dVba2yzPHPz78BjskGmWUs2C56uTrmOfkJ8NI/B
	dFnm9VgTmKEbPgK5e+h5u1Krh+ZdMTzdzfRDZ/9jHAJeKsGdi4/gNlp844tSPhPM
	BiydnYE7/irctPKuOj48bIiQAO1622YmhZG725kuClgy0QS1P9VFVPmJDdeiT9lS
	r5zVFcvkzCRoWAOeHHm0UujzIlBXjY9aGtsZjHjKkSgXoPZUxVGtQYtazHlqc7GD
	rPYo5w==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pun21vva-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 05 Jul 2025 19:06:42 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7d3d3f6471cso304880685a.3
        for <linux-kernel@vger.kernel.org>; Sat, 05 Jul 2025 12:06:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751742402; x=1752347202;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t6XQnLaTPoi8ccl6X7Yo5PDD6ywDE3LoQxRYWhwU+VM=;
        b=BRhkbTK03Z2SCc4oVbS7tACqb8LfqdDgStj3oPWQCUI11Ng+NM3/XH7ji48baUxgwV
         wqFau/6cgT2Nffb178rOYMz/aQYN8IxZV9lWzDc1ktdCsZM2TBBe6AQll3S8ursMPQP5
         7XsWG4kNBjFVsAkjbOkpyOirlznI/33AJ4kB1OvTLbS97hAI2JHXXt2n9YJnkjC3Z9Ad
         /ls/Mv4fMCK5pfgRz9/euhq6wfI74ywQoKXgxJJl6q0YV5E1+/bZLMPdqfwEVnEADYrE
         NnZCBhIz4+roR3uI6MVP9tuFnubq4vZ3bsN2r9eDkThyE1uO2ustDktzE/9Or2R/mbtF
         pBgw==
X-Forwarded-Encrypted: i=1; AJvYcCW8MwvPO3pGFOXHidsIUsgmjED4C8nrusAJYWtR7zmdMuDvLX8nwCSP0uQ03MvN5iy91i8qrYf/wMvlsJc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyfHq4bxscuxUBX11tbzzqTVbxU6P9oHpOzY0C/yVu75dMmvdWG
	JJ74ENP0v/JZXbORASHf+QexllbMux9zpzUbl08fYDB8KVYGZro7oJzU7huS1vnBvkfbsJE1z2K
	TSp2q7/XrVNfB045RZBQdDECM9IjpUjLH+A7uho7p4YPOrS39IebxIfFjE7mUTAUFtNg=
X-Gm-Gg: ASbGncuwVHRLF0gz+8c3MkoBSX7E53O+IYSXoIMgHTCNA+CI0zuivwR2ScL7wrpnXCl
	YHieuA8rhPCW/fnrs41aMgCmETCg7GW1I9GH3+XwwDwFmFPiByxjPnoD5MgpDS9UmeYYKg+X4eo
	IJMX+4ZZdeqtQQ1wvdBynWMugqBJ4L4FI/6DBUILrdworOoar+vujNuJky5OxX7O7J7ThRn8r/j
	8JioYARWc8c90zLq65YtGenezhxx/tnj7a+YRSy29ECbG+kcP5dBG9aOfK6hiyVQFy1uns46okl
	L3UQceloZtm1YBCVAqRpV+bZiHUnGQL0LNbsPiwqISuSaovFpDam5Q93khTss9QuJvy4D1hMzWr
	/0ksYc76LHNqvMz9aIvjW0jreSIKOGHH0TDU=
X-Received: by 2002:a05:620a:2b8a:b0:7d4:2841:9c with SMTP id af79cd13be357-7d5dcc751d9mr1018327385a.8.1751742401936;
        Sat, 05 Jul 2025 12:06:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEdJetRllyfwwSgin++nTYIyzbzfjO0Tf+iKLl2gWqNvpNrUmzlVcrPSxiurUzcyC3C6ATRBQ==
X-Received: by 2002:a05:620a:2b8a:b0:7d4:2841:9c with SMTP id af79cd13be357-7d5dcc751d9mr1018323785a.8.1751742401498;
        Sat, 05 Jul 2025 12:06:41 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-556384a8fdbsm662261e87.169.2025.07.05.12.06.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Jul 2025 12:06:40 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
In-Reply-To: <20250704-adv7511-bridge-ops-fix-v1-1-c1385922066e@collabora.com>
References: <20250704-adv7511-bridge-ops-fix-v1-1-c1385922066e@collabora.com>
Subject: Re: [PATCH] drm/bridge: adv7511: Fix
 DRM_BRIDGE_OP_HDMI_{AUDIO|CEC_ADAPTER} setup
Message-Id: <175174240044.1825705.3743497752836229087.b4-ty@oss.qualcomm.com>
Date: Sat, 05 Jul 2025 22:06:40 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: 8WhnpbVJoyw0NUU0PvRu3Gn3qbg48sTs
X-Authority-Analysis: v=2.4 cv=GdUXnRXL c=1 sm=1 tr=0 ts=686977c2 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Wb1JkmetP80A:10 a=1kJDpHXNGl3mU_r8nRYA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: 8WhnpbVJoyw0NUU0PvRu3Gn3qbg48sTs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA1MDEyNiBTYWx0ZWRfX74g6mrKOlPr3
 Gj1O1f50zfcURbJkSrNJonIOGV2m2cU53xyXIsLdoqCFFwee++e+plQ5hfcfDnw9ypBXUejdPWI
 Op46bwkBfOMrW+avAZCbZTd1bOwAgKfqlKH7ut6NJn2uhre/lZ3GkAcQ/Gaw+t+yYLtBCHVhKnz
 HOBi64jnT91C5Z1yFbndMTrntuisWnzVzP6W4hVH1gaMZtV013OHBvmi/W4mlPftYkyUZ10EEuk
 e0Ey9bYWHmXArDJptXPx5FQtcKx+ZchCFktvfG9bVEBRIXBPQ7sBvH+siBba5EwyQTlPYor6Pho
 jgePZDvqmv/zVdSY5OWLwm9WVACZMCOFhweL8m9S3zVeBc6GfPJelTGHHBkQvC43whoHjyB5qA9
 7cfMTj5JbCS8MU4pJqwXSG3V2dxklfcW6967088cAV7U9yw/K3cEB2cLaUxuwC27iVqQc1Sx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_07,2025-07-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0 clxscore=1015
 malwarescore=0 mlxscore=0 phishscore=0 impostorscore=0 suspectscore=0
 mlxlogscore=999 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507050126

On Fri, 04 Jul 2025 14:52:54 +0300, Cristian Ciocaltea wrote:
> When driver is built with either CONFIG_DRM_I2C_ADV7511_AUDIO or
> CONFIG_DRM_I2C_ADV7511_CEC disabled, drm_bridge_connector_init() is
> expected to fail with -EINVAL.  That is because all required audio (or
> CEC) related callbacks in adv7511_bridge_funcs ended up being NULL.
> 
> Set DRM_BRIDGE_OP_HDMI_AUDIO and DRM_BRIDGE_OP_HDMI_CEC_ADAPTER bridge
> ops only when the aforementioned kernel config options have been
> enabled.
> 
> [...]

Applied to drm-misc-next, thanks!

[1/1] drm/bridge: adv7511: Fix DRM_BRIDGE_OP_HDMI_{AUDIO|CEC_ADAPTER} setup
      commit: 40818680d8350dc35b1d1ac31c75038d13461126

Best regards,
-- 
With best wishes
Dmitry


