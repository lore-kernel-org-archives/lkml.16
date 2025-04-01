Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 716C71D2F53
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 05:12:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743484325; cv=none; b=QlrFkzVmwTkL54SpZg/3LQ6YGFghIYwSQ0/qDlINPDSh+kXPlW+I9QoBQvRJsHJaQY27e9qdFBXIDXeG43A9FzPf7Lf0n0t8NgqGX7CQGNQ0Y3XB03J1H6ygserTDce3ibubo+lFKAxhcxWn56uYpPrBOUr4MP8iz01uql8gNpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743484325; c=relaxed/simple;
	bh=ljnxHNh77aJKTn5PBnRyQ46dmjys7Q6lroI6kcr2K88=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=laCj4l1o5RzPinpvHUKB6/E4lWoKshYtYFm9cNUMeNu4poSSEdt1cyzqfyJn/Wz/zQ6DaBd6/V9xsuHjkCe4Eh5Qa923vKTjGLxW3dUDKP4vEfy7z8AlOE6Q5QSCb4OsDXPudjjnEN3itsfRfVz+O2AuBFVkUz0a69PnUrmtIho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GySIRYLN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GySIRYLN"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52VFDx38009286
	for <linux-kernel@vger.kernel.org>; Tue, 1 Apr 2025 05:12:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	su5HDLNPv0sRzcPmNzYwCft3R4LA3Sh56oZUJ6HjWts=; b=GySIRYLNGHbm1OAx
	K7XD7CAFr9HvrcWsAVJ5zIjE5YtAJJ+q3yAel+r02N50ESi6SggQzJQE1WFgr3e5
	DtePswXabB1iK4dAgraXOzCJlWgLCh/2TNAsL9TukKNDXkNfKfhLq6t2nw+KVNRa
	LQxdDa5VWaIO0Mc58IVdCDTssY/7gyk0pxTR71sN6wLOqr7OHZDsAX6cPpvVwOVb
	VUvKUsXiNVbZ3pPZZkCG2AZV/Kzn9LknffHnzoH/iwTQg1rvZjnQxpRFytKszn25
	Btrwqek5LmwHuaDeGLeYPIN5hxAh++ntsGK3+Wcn4wPVGy5uvDFPtl80UAfkV4Yk
	n4D/rQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45pa1nxdvu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 01 Apr 2025 05:12:03 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c548e16909so487399685a.2
        for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 22:12:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743484322; x=1744089122;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=su5HDLNPv0sRzcPmNzYwCft3R4LA3Sh56oZUJ6HjWts=;
        b=R6KsIDvvc715O0VCWZWUyXvjWgRsITsJbKr4bfN1PoftOmSL3f4EmyV7kE5vVTPFnc
         7P7uunse8YC4eR7wego+1j2qMK0M9YDKytd+Qrg6JBZOitIwseebXphL/ozgBjApuQGK
         MbdF7TpSJ2KRSR0qLZrguRI1lrqKGiVVXoBa71p4kuvFVhnV6PfR8PoOgtLyvkDzf4Ay
         Q4MzbvQU80BtLoaOR5VmCj3Yxc8sMkYphrasJf+NTPiffBI2LXFqPPLsiWUTzAW+hRha
         I3lL08x7T8Mt1NlzmJftEOHrzx6wrX14dpkRSJfrUhNrmZQ2TInL7bf5zkymvB9EoGyw
         b91g==
X-Forwarded-Encrypted: i=1; AJvYcCUQfN4jqUDGz8kl+1vdqHC/rPT4zk9E0X0hBJHn4YKxh6ngjGQXSjY7fsGGD+7Ea+E6PL/u8+5jYGDuHhA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzvaznt8ScuQD8ZBuYFapGmnTFaaTljlNMxb2CLHOtkQNFjJVQV
	IQX/3RzqqEgLDgH28lCxeO6jlxIXtgFQ0tTLZFEsZPGP3V86pWzuRenIe60xhRnm9WDd7TSTAZT
	HJh4Vb1nKO1DIKUsxCfAMRz3tSxVuHd3am4zGmz0QJSBNEPpwMz4WtF/rTBZRtc4=
X-Gm-Gg: ASbGncstJdPxjXbTX8D0znS3/dV0i060sq6WF77pWCvK5EN9OKqjjm3JgF+zAzbXt/n
	tHwOr6DQZhFOUIgtpabTyFbzfd7MBNCWOtOLIG0sCWdwMEaSoHWQnzqmWGKOki01qZCccdiOfz2
	OtWH4Sg14sYloGzDWzC3R1NwE1n3b1+2Bh1X9P/t0RIStIGppJA7+Z7CHWHWO0ztN8+BwY0NXYA
	eOfPtm9GAXVVrC3s7J6BMqFhFNDJkto17RfkFrjIPfN16lpsHEBg58yOm6KGHNIpepLT6xjplRy
	rFUAIgEXwX3IONF/YwzKR6lbMrKIHKj7G9Gj5PUHTIm/4hiJInN4uWZLS2k/7VJxVHFaGspZ+XH
	4KwhDiry2L6kWRFk13oabZeZPvyLk
X-Received: by 2002:a05:620a:2a0b:b0:7c5:4b37:ae49 with SMTP id af79cd13be357-7c69089511cmr1850601385a.48.1743484322114;
        Mon, 31 Mar 2025 22:12:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHfkh+VwvyZqGWd26i2DZpAeXVnuJcT2uXByll2V8BgpOUSTAvnwlH3MR5aeFbdPqlccIuedw==
X-Received: by 2002:a05:620a:2a0b:b0:7c5:4b37:ae49 with SMTP id af79cd13be357-7c69089511cmr1850598585a.48.1743484321703;
        Mon, 31 Mar 2025 22:12:01 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54b095a21b0sm1251697e87.243.2025.03.31.22.11.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Mar 2025 22:11:59 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 01 Apr 2025 08:11:36 +0300
Subject: [PATCH 4/7] drm/bridge: analogic_dp: drop panel_lock
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250401-panel-return-void-v1-4-93e1be33dc8d@oss.qualcomm.com>
References: <20250401-panel-return-void-v1-0-93e1be33dc8d@oss.qualcomm.com>
In-Reply-To: <20250401-panel-return-void-v1-0-93e1be33dc8d@oss.qualcomm.com>
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
        Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1985;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=ljnxHNh77aJKTn5PBnRyQ46dmjys7Q6lroI6kcr2K88=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBn63WQ9JDhpO2O3km+J66d3OvjPxAK1AuTTf1XK
 9nMcbqhsXqJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ+t1kAAKCRCLPIo+Aiko
 1d2jCACvEOox/CQElqeioCPPoLsvAIxMwsML921E+NqK2RDDDcNofLsW12QfFmN4lf9xy3tbJ2h
 021oWlZ6tZF0FEUMjYqCe6OgIOaDaOCH2M1x0QVRLzVYOPzh/IAZeVGMA0VCtwylSfD17NqvK91
 vJ39nQupM51Yiq1BrM8jXCQG0hHmAfK8L5gpjSbL2Rxz6usoM1fbhtZdzKad+RJb7xsS9+W0DWu
 wljR/PcNZNKEiZDd5L15P74eNEgh1BAVP3UYCUOWxSJphSs4oHFSKi/KpT23St7eLsPh/S+MR+/
 H8xy5QoBR5qqJgTmEQF3iU9JXnBFdY7sXLZmSeGl7g9YrCPQ
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: iMTuo-_TY0CiLpoII72vYc62Gnpk-hHw
X-Proofpoint-GUID: iMTuo-_TY0CiLpoII72vYc62Gnpk-hHw
X-Authority-Analysis: v=2.4 cv=MPlgmNZl c=1 sm=1 tr=0 ts=67eb75a3 cx=c_pps a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=KfGKz8IhEdz9gtDduwEA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-01_01,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 malwarescore=0 suspectscore=0 phishscore=0 spamscore=0 clxscore=1015
 bulkscore=0 mlxlogscore=999 impostorscore=0 mlxscore=0 adultscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504010033

The analogix_dp_prepare_panel() function is called from bridge's
atomic_pre_enable() and atomic_post_disable() callbacks, which can not
happen simultaneously. Drop the useless mutex.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/bridge/analogix/analogix_dp_core.c | 5 -----
 drivers/gpu/drm/bridge/analogix/analogix_dp_core.h | 2 --
 2 files changed, 7 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
index 704c6169116eb2601d2ad02dc7294455ceff5460..1ec4d277fe6bb03ad9eb8451ae2af5ad5ada0978 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
@@ -974,14 +974,11 @@ static int analogix_dp_prepare_panel(struct analogix_dp_device *dp,
 	if (!dp->plat_data->panel)
 		return 0;
 
-	mutex_lock(&dp->panel_lock);
-
 	if (prepare)
 		ret = drm_panel_prepare(dp->plat_data->panel);
 	else
 		ret = drm_panel_unprepare(dp->plat_data->panel);
 
-	mutex_unlock(&dp->panel_lock);
 	return ret;
 }
 
@@ -1523,8 +1520,6 @@ analogix_dp_probe(struct device *dev, struct analogix_dp_plat_data *plat_data)
 	dp->dev = &pdev->dev;
 	dp->dpms_mode = DRM_MODE_DPMS_OFF;
 
-	mutex_init(&dp->panel_lock);
-
 	/*
 	 * platform dp driver need containor_of the plat_data to get
 	 * the driver private data, so we need to store the point of
diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.h b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.h
index b679d5b71d276f458d905c936160f107225bc6c5..2b54120ba4a3ef55af518a0629a5c8469f275a0f 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.h
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.h
@@ -169,8 +169,6 @@ struct analogix_dp_device {
 	bool			fast_train_enable;
 	bool			psr_supported;
 
-	struct mutex		panel_lock;
-
 	struct analogix_dp_plat_data *plat_data;
 };
 

-- 
2.39.5

