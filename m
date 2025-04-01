Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8765D1D63DF
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 05:11:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743484317; cv=none; b=SEyYJ7uhqqZC2QF0VmXLsXfV4vtRHY0NBbf4qUNtm7MCe7WgfrD3NfLRx/VuRO7ZghOrPdJa+Jes120Vu9GsR3NWn2cLInuGhxfy7MZuJK6CqHiah7i85NuW5+k8pPVft5dXm2GDba/wpUU1TO/uDiv8SpTIwqVEKBLFaVon6V8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743484317; c=relaxed/simple;
	bh=yoW5522ZzqPZUOVagrebp1jFhYqOlDKf+OwXbxdaN/M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VZ4q29Dk+Gb5+NBNcV1GBINiuxn3ST4ZfwL4GU+pF11L62GRRHvTzxDNQscKXEtI2rxIPW5gBzIXV+PHHAW15GN7GMzOKF1+ft9ra2PXgqQ8IAd4lCAplTS5jhzp8uB3LUXtqLcc2rSJ6/0THw4SxYB84CDuExTLbekZ02nT7sY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N9rW0mtN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N9rW0mtN"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52VFCuuF011995
	for <linux-kernel@vger.kernel.org>; Tue, 1 Apr 2025 05:11:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	y1r0Q6x0yLTab8MbDQMGfrMrTbeTQKCtYurLTk8HHuI=; b=N9rW0mtN6ikW3b1q
	YdPeg/3NeHnBAkCvm/wBzoW8esFhiXJLQSSbCoOPwNqOtbCkAJlfL9g6/TwGN1/x
	thZMT6Ly5Mma/2VJd18PdK1MGibF+XDSmVOGYbj/rPrVOWSM3mmxas0/GGomnb76
	5yHHFn/IL9mzM6qo/5qqh47oqIfQngdQGDW2ltzDlzqbwfbMpx0QODAJpMkecQLu
	pxIo117sxMOgdnIFLJvofBTR7vYyll6mzaIr8Nxy8Fb7ChjA9KBD5fuL8Ugs344+
	yVVgXh/MIOHb0zeiiXccDEMkLEkA2JpzhZsoUpI8PC9TgCVVFM7Y/2e/x5qbnrSD
	GADweQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45p9mjpe8h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 01 Apr 2025 05:11:54 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c54e9f6e00so987512485a.0
        for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 22:11:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743484313; x=1744089113;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y1r0Q6x0yLTab8MbDQMGfrMrTbeTQKCtYurLTk8HHuI=;
        b=RNojfa4zkbJeqdsQlxcitJwzPhYOg65MFVsR58tMdyLGvcwRIqJGp/t5PpKPh5A8VO
         7Vm311YjS/A7EOZfTKtYH4hO8WD/Yl5fVDMaCS734rUVpl0wNho0IX/gelN4s2pqtP2e
         LguieTxWdkQkRbqg+VIo6nE5uiJZIUMJnPsCnP2RRCshdWRJYZGy6nANai9SDZJz8Mpt
         IGXr4vo51vB2DwKu8Ov2/g8luTwyQk0xsvzk34MOVnmOBF/YSy750zv8Wg/zt0QLtzti
         6p+bbJAkZb9g/s/LOBYCtjCBi6yj6nUQveSs0VLoOPq2ynKVvARLgHvoAwQAashDeIR0
         Ikow==
X-Forwarded-Encrypted: i=1; AJvYcCX9nbC38KRt8luJyTyxPDg4Sf4F4Nt+YJqU/jSRhosnZu2LQYBjPisPv+BdFGgNhfFQX2QY3IMeZwaFaPU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwhyUH+3cy/zwxjI0UADFcE/MaVNAZa08SJ0wpWwCnFT20ilkSE
	bV4+rjSFvXPpSR9Fn3rGXw2L2tjfMAXcVhvM4ncKzIA2dpPT4dXUV2T3O99yOpTyDYAIFRBJ1gt
	y0VG62kvw2l9mlqNwhe0OanAf9fGGroTO3IUtfLmgzD3zefAZ5T4BeUs7+t3i6sU=
X-Gm-Gg: ASbGncsInN+lW8hdMenTaRz2ap8svNgalLd4PtKtxNT8r/dl+9KBkaC73ntSorTyZ2i
	042I7kHvE65hzqHMQeACA9PI4HHX/l0WfEZqMACEN+JBX/ANxR2TqnKRKPvXqqILyZkeiCz4NWC
	7/w/TPcyg0wNOYLxhq1o/sx543AnZ4/a9uL4K3w9dAv0sUUUas3u1D2BnlcdfvrFpHNzTdqua2u
	Ym8JSRpPGX8QwNhj2kAK0hIC0ukPv/6WQpenuTvt0j6xxgMwGNbyQ6JhRsEDC9icduDx+MlUXEQ
	+MuosdMNbT1bd38WjVx18qPv5S818B0Pe0TMQMBELeEKyunQ/T+3eL3cp13cc5hzx+GJnEEidK5
	20oh2DdBTrh4bREclmvlpZVOhjbes
X-Received: by 2002:a05:620a:44d4:b0:7b7:142d:53a8 with SMTP id af79cd13be357-7c62b47efbemr1553548885a.19.1743484313152;
        Mon, 31 Mar 2025 22:11:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG3lexU6EBfcncm54A9Kd24CaLpiEaLaaFnAPz5TDD1Kke4bgebndJIyZ/RegXQxIUw0y9c8Q==
X-Received: by 2002:a05:620a:44d4:b0:7b7:142d:53a8 with SMTP id af79cd13be357-7c62b47efbemr1553547285a.19.1743484312792;
        Mon, 31 Mar 2025 22:11:52 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54b095a21b0sm1251697e87.243.2025.03.31.22.11.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Mar 2025 22:11:50 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 01 Apr 2025 08:11:33 +0300
Subject: [PATCH 1/7] drm/bridge: analogix_dp: drop extra calls to
 analogix_dp_prepare_panel()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250401-panel-return-void-v1-1-93e1be33dc8d@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2268;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=yoW5522ZzqPZUOVagrebp1jFhYqOlDKf+OwXbxdaN/M=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBn63WQNdABavZ64pNwjFHAQter1xgT/pdXOsfS1
 AVXUKi4MQ+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ+t1kAAKCRCLPIo+Aiko
 1WovB/4zgZXMr4h83m6nu7k4IPGcuN0P1q3uOAHuxOS3tXLL/Nv6+l7wOGFOE6uQbEjBOiun+Kl
 0FbDiTku/4J17/2Y0QAac2UU59sYQyaC5l1A68yAvFAP4IgGxzJa6fXtxJUad1ioIlybRVWdvF3
 XprgVePJOdYWN/k7oUErLXI87SO2fh6t27aKoCzNLBRViAJbBr9T57KNEG6kgdxF4qZio6EW2Y/
 a5sX7zFCVWGIg7pR1KcMVL3bs/TMfjpQwuq8ZCgPtKbz5ecqY+TS7paVfxxKfviPnpvJLX+AeJm
 g0B2qFPKg3dbztEnUbvgg0qLjSDgGWlmtIfrAtdHtl8cEI6k
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=Mfhsu4/f c=1 sm=1 tr=0 ts=67eb759a cx=c_pps a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=Aj65s_fBnqv-yqA8UToA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: opQizIkReRN_e_Ctp3LPlQt0FCqa9qqx
X-Proofpoint-GUID: opQizIkReRN_e_Ctp3LPlQt0FCqa9qqx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-01_01,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 mlxlogscore=999 suspectscore=0 clxscore=1015 impostorscore=0
 malwarescore=0 spamscore=0 adultscore=0 phishscore=0 mlxscore=0
 bulkscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2504010033

The analogix_dp_prepare_panel() returns immediately if there is no
attached panel. Drop several calls to this function which are performed
when dp->plat_data->panel is NULL.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/bridge/analogix/analogix_dp_core.c | 22 +---------------------
 1 file changed, 1 insertion(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
index 042154e2d8ccd74ac2dc27fe527e810a50e08a09..ab1cfc340aa95bbf13fe021bd33227b565a5458d 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
@@ -1005,17 +1005,11 @@ static int analogix_dp_get_modes(struct drm_connector *connector)
 {
 	struct analogix_dp_device *dp = to_dp(connector);
 	const struct drm_edid *drm_edid;
-	int ret, num_modes = 0;
+	int num_modes = 0;
 
 	if (dp->plat_data->panel) {
 		num_modes += drm_panel_get_modes(dp->plat_data->panel, connector);
 	} else {
-		ret = analogix_dp_prepare_panel(dp, true, false);
-		if (ret) {
-			DRM_ERROR("Failed to prepare panel (%d)\n", ret);
-			return 0;
-		}
-
 		drm_edid = drm_edid_read_ddc(connector, &dp->aux.ddc);
 
 		drm_edid_connector_update(&dp->connector, drm_edid);
@@ -1024,10 +1018,6 @@ static int analogix_dp_get_modes(struct drm_connector *connector)
 			num_modes += drm_edid_connector_add_modes(&dp->connector);
 			drm_edid_free(drm_edid);
 		}
-
-		ret = analogix_dp_prepare_panel(dp, false, false);
-		if (ret)
-			DRM_ERROR("Failed to unprepare panel (%d)\n", ret);
 	}
 
 	if (dp->plat_data->get_modes)
@@ -1087,19 +1077,9 @@ analogix_dp_detect(struct drm_connector *connector, bool force)
 	if (dp->plat_data->panel)
 		return connector_status_connected;
 
-	ret = analogix_dp_prepare_panel(dp, true, false);
-	if (ret) {
-		DRM_ERROR("Failed to prepare panel (%d)\n", ret);
-		return connector_status_disconnected;
-	}
-
 	if (!analogix_dp_detect_hpd(dp))
 		status = connector_status_connected;
 
-	ret = analogix_dp_prepare_panel(dp, false, false);
-	if (ret)
-		DRM_ERROR("Failed to unprepare panel (%d)\n", ret);
-
 	return status;
 }
 

-- 
2.39.5

