Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE78A1D95A9
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 05:11:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743484318; cv=none; b=U7+htDsXW1CqraHmWbxKsMSs2ZK8JEPFrjxvEhiAnS4vwnXCiJtjsz44rAhawHP0/gDlzKI5sFf2u1bFG4kIxZGt8JeZ6kafLcv1kxwwPkZVVm2hc5ckfCRkH71fzzkJhFASwO/+ZHanp4bG1ynHFbdNWKe9I3eKHXKIf5Nl7io=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743484318; c=relaxed/simple;
	bh=RS0KjeYPoBvamlmnFd2NBoW0tS+Zy7JyWmtQ+gO1iuA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gxiSal2tP0gxPI/fG1lJLLdIfkaxZkActWf/U84dl6+cyIalMunXz4GZFmrzSZI7dIfGbd8/cRv2uogDv8/MkDOYN3nA21NBDiF+libMQ6ar19s0DwNTaxzfjUCWPZZ1Iw1628B/Prb0QFsFLSaxjusDqDh1Q+0qGRdyNNmUqP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AZnrR2RB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AZnrR2RB"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52VKGQUS008415
	for <linux-kernel@vger.kernel.org>; Tue, 1 Apr 2025 05:11:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VBSCjPGCW0P1y4nfgwnHBrOMK8O23HlmU6c+y6UxQ9k=; b=AZnrR2RBLclL33yf
	lE4aAoslAssXRenWwOIZsj19y+kHwGjLhIUzu2c7sKEchcUse+cHfhcKLra1MW7B
	5LS51S76TyEqRko9OFw1VV2+gS1/spQ2ErcwzYRsD7SHatKrVLFh+YPle7nTp5yX
	rcWwgKHhpRclTHtDpgb2r2c1TVNW+nP2LC8MoGP8CYEVLeq8qbl4CsPZIU3crrt/
	bErIQt3vUtrXvDekm06xZAIsNnSuNGCcY6YFafMFnjlw9pjgYNEvtJpN5S16UDMp
	A8peMojvb5Q0cvhMLFqg7X2M27tP07ewc89BgUIRl8ByePDUSmM7LC1UI2w1S67J
	Y22WXQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45r1xnh0bc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 01 Apr 2025 05:11:55 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c5c77aff78so477033685a.0
        for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 22:11:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743484315; x=1744089115;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VBSCjPGCW0P1y4nfgwnHBrOMK8O23HlmU6c+y6UxQ9k=;
        b=PXzbyKYxohlfvBLJNpOvoL4Ipa3F8y5+E1FabX2PCm+UCXB9etSqFbOK8vo/YxhfJ2
         WvKgA5ZUdz/bsaYtdkkhuJkx9+K+hfNL+qZX1xOhMWGX3xj48FthyYzoLY3Lzzf5twa9
         yI6BGQic3SjN6QH6/7zu8usbtFRCKfENenAIfuzW4/kOnmZ8MnYeIgSgn6RQ2bTJFemn
         zrQk9QHQScbcZpb4BcHm4tN3Qui8Aq8GDw8/QbsQGUo2Lx1wtN1tqh5uqlsWOxY6I0EU
         WIVwQWFL8OBPvn4Jz0j9V+E3kwGwwR2oCsloIUIxNdEPcObgVq6hQ+Yq5LpoEStEALoN
         X+uQ==
X-Forwarded-Encrypted: i=1; AJvYcCVCKxfQyAh+4DsFmBmqq9wBLQ8HNRWlXRwn4BggngCKZFVyVPXu5He36l618PNLOYPslDceCIkW6EePY6U=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0/7Yx8e0W+pVg91u0jdIIS872J0rtYQzARJs20NmPIEhiQ8q1
	yVHrZyrdhoWSUFUXLkqsUpqeOJor4sIOI9Uvf6RGgr/hlqYlfrXmhFYeJ3bUIO5kFfEWeZrMu0J
	l7j0yWf/vFlyyBElsFq5mB0kNqituHVw624KerveO0kqkGUerULcrq4ShSWKbs1c=
X-Gm-Gg: ASbGncstm7xfsQCeNye4mcVclvW086hmQPwmzNmbo5AjW5gETQSkcpAFpQ9eTCoyPaB
	OTw1hd3YeNicxo+r7xg0lrvoCrghjVOK8E/nOMD4qKXD8zRn5g/fXG5777R/TSwZuOwqr+wPlTH
	t+s19gzFVO8c8hNMyJKtFv4E1QBVNdDGPR1MkqseZFnlVcxGc5poBl6/JMnLdC0B7ETImubebya
	wXiFURFH3gw/CaIww1vF0xfw10tjydRaX898MksI34X4+L98zayq+yg9JkXlF+hDlmWxIOXlrrH
	uQPVW39fUA5FLLfPoYEdXwS4KPUMqBDJP/vXNzKdzrj2zdIM3WLYc+zc58Nyy5EYYwxIybuuepU
	KowlaU9Lg+o0FpXXUM6OcEa7iIqPb
X-Received: by 2002:a05:620a:2904:b0:7c5:6b15:1488 with SMTP id af79cd13be357-7c6862ec10dmr1530046485a.10.1743484314726;
        Mon, 31 Mar 2025 22:11:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFmq8v31bGp9RgA36fTNf4A/LLjyL/mIvfn2jtE9aoUU3ok0DTMu2FADrICd9v9edcSjrDYyw==
X-Received: by 2002:a05:620a:2904:b0:7c5:6b15:1488 with SMTP id af79cd13be357-7c6862ec10dmr1530043285a.10.1743484314331;
        Mon, 31 Mar 2025 22:11:54 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54b095a21b0sm1251697e87.243.2025.03.31.22.11.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Mar 2025 22:11:53 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 01 Apr 2025 08:11:34 +0300
Subject: [PATCH 2/7] drm/bridge: analogix_dp: drop unused argument to
 analogix_dp_prepare_panel()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250401-panel-return-void-v1-2-93e1be33dc8d@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3082;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=RS0KjeYPoBvamlmnFd2NBoW0tS+Zy7JyWmtQ+gO1iuA=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBn63WQXl77jaWxK+F7Bmpq6cdN14tgPEK3j0x42
 2HTw0DvA1KJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ+t1kAAKCRCLPIo+Aiko
 1eH8CACjt+43AIX/4PZirqgVYx0D+5t+Yv8ZImawHw8xlKGyQzLeC0N282H+QQrhODQpXHhYdkJ
 cZf4VprPLKH3cmRRw8qEZmWBl6fPVgvHlPoF5nZfJkaN42VSsgIOstrZyc0DmiBdzkR2CpxaJ/0
 jT0fvN3VXrWNwnpWcTkDZin1SjHSb3BARlrzg5WvNT72FoVPpWftW1KjuQrMfzorqbdV+r1KGQx
 wefK+VLpLlHi96q5Sm0TRB4bh4IbQf9C2ObaztZYmfU5wbvOAiqr8lZiQRXhBAPpMmeL0xCmL8j
 +WHoN8Yb1kn5p2U+fMxyr9c437rdOGdbFs0QRL/l8OVryT1E
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: nVbbARTQESI9xayhhoZxvbrbbIJYh3SM
X-Proofpoint-ORIG-GUID: nVbbARTQESI9xayhhoZxvbrbbIJYh3SM
X-Authority-Analysis: v=2.4 cv=Qv1e3Uyd c=1 sm=1 tr=0 ts=67eb759b cx=c_pps a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=Vyz2l5lDUG1q_RmMdnAA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-01_01,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 spamscore=0
 mlxscore=0 impostorscore=0 adultscore=0 priorityscore=1501 bulkscore=0
 phishscore=0 malwarescore=0 mlxlogscore=999 lowpriorityscore=0
 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504010033

After previous cleanup all calling sites pass true as is_modeset_prepare
argument to analogix_dp_prepare_panel(). Drop dead code depending on
that argument being false.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/bridge/analogix/analogix_dp_core.c | 19 +++++--------------
 1 file changed, 5 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
index ab1cfc340aa95bbf13fe021bd33227b565a5458d..82dc4b01806f9728dc882b0128171838e81f21b0 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
@@ -963,13 +963,13 @@ static int analogix_dp_disable_psr(struct analogix_dp_device *dp)
  * If @prepare is true, this function will prepare the panel. Conversely, if it
  * is false, the panel will be unprepared.
  *
- * If @is_modeset_prepare is true, the function will disregard the current state
+ * The function will disregard the current state
  * of the panel and either prepare/unprepare the panel based on @prepare. Once
  * it finishes, it will update dp->panel_is_modeset to reflect the current state
  * of the panel.
  */
 static int analogix_dp_prepare_panel(struct analogix_dp_device *dp,
-				     bool prepare, bool is_modeset_prepare)
+				     bool prepare)
 {
 	int ret = 0;
 
@@ -978,13 +978,6 @@ static int analogix_dp_prepare_panel(struct analogix_dp_device *dp,
 
 	mutex_lock(&dp->panel_lock);
 
-	/*
-	 * Exit early if this is a temporary prepare/unprepare and we're already
-	 * modeset (since we neither want to prepare twice or unprepare early).
-	 */
-	if (dp->panel_is_modeset && !is_modeset_prepare)
-		goto out;
-
 	if (prepare)
 		ret = drm_panel_prepare(dp->plat_data->panel);
 	else
@@ -993,8 +986,7 @@ static int analogix_dp_prepare_panel(struct analogix_dp_device *dp,
 	if (ret)
 		goto out;
 
-	if (is_modeset_prepare)
-		dp->panel_is_modeset = prepare;
+	dp->panel_is_modeset = prepare;
 
 out:
 	mutex_unlock(&dp->panel_lock);
@@ -1072,7 +1064,6 @@ analogix_dp_detect(struct drm_connector *connector, bool force)
 {
 	struct analogix_dp_device *dp = to_dp(connector);
 	enum drm_connector_status status = connector_status_disconnected;
-	int ret;
 
 	if (dp->plat_data->panel)
 		return connector_status_connected;
@@ -1194,7 +1185,7 @@ static void analogix_dp_bridge_atomic_pre_enable(struct drm_bridge *bridge,
 	if (old_crtc_state && old_crtc_state->self_refresh_active)
 		return;
 
-	ret = analogix_dp_prepare_panel(dp, true, true);
+	ret = analogix_dp_prepare_panel(dp, true);
 	if (ret)
 		DRM_ERROR("failed to setup the panel ret = %d\n", ret);
 }
@@ -1294,7 +1285,7 @@ static void analogix_dp_bridge_disable(struct drm_bridge *bridge)
 
 	pm_runtime_put_sync(dp->dev);
 
-	ret = analogix_dp_prepare_panel(dp, false, true);
+	ret = analogix_dp_prepare_panel(dp, false);
 	if (ret)
 		DRM_ERROR("failed to setup the panel ret = %d\n", ret);
 

-- 
2.39.5

