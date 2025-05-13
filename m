Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EE252BF964
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 18:49:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747162193; cv=none; b=NpKK5OS32bzFuNwPnDW9OOH1xZLL4KXTd4BRVVELZwEMyQ8aigig/YDDZ79d31lHSx4RR1OBOGWiCdYlUzCPZabvb9U5ppHNsjEn3cIvzD3w9QotvEC5EpIGiXUYEHN8m+HzDj2dhDQF6p8vKydFzPJU44sssvqs9BAZiZRLe7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747162193; c=relaxed/simple;
	bh=7jV0gWLhUYLAfF5n95PURVvMxbGLkMaUPNgufE+LH40=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=WXS+h4b8q3kyrVOiImgMJI5ZuJkpSZV1N9qHi9Am+KH+Pr8RJKeP2eXdZvQd+a3qnkCWDuZJLtlwORBanKF0KPHtbEADmqT+GogG0k7sKn9mtnlxHGO/V3CWHMX8d1rU0zPhipN/gbxJMqrIcuT97uAj32n3LW1xKw3YK+nAJH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TDVamqxT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TDVamqxT"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54DIU1Ia006516
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 18:49:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=ur9/QT3f4NlSVORj6iKHoh
	GpLAR+WNwm5SSazTAarpQ=; b=TDVamqxTGbcl3NkeGqGoC9M6ehkZzyeuo1fV9+
	nmvINUnjQxyC3HP0pOaU0f5v1sht2Cvo9fli/KKDHXP3YcffPcNaDgKM1ZAd/3P7
	BVtApOQ1kSQTkRUdHXNLpKxrkV48gQHfVMy6fC0arge1LJREH9/shPWVcZMUC+Qt
	4Cx+4Xv+ZEdyojfRerdefaASD2yvYjHWqMjLyY3sP6AciaB85GTSj2LE9T6g8gQT
	vG4Baocv2fPEpaSXhTPy/MlsWyngUolKLrVzBdSXR267xFmfx+uBkUpO6qFZNCJU
	Ndt83Jw8DfxHdipAKoCK7P0wwmY1RXiKTK9GxU+gb/tuvSgQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcyg2j5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 18:49:50 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6f6f06890e2so111993696d6.3
        for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 11:49:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747162189; x=1747766989;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ur9/QT3f4NlSVORj6iKHohGpLAR+WNwm5SSazTAarpQ=;
        b=fE/IrWg1HCTG0Bv4gdLopTfkXiKRSisQDgqPqrf76SqeSRQ11IKJv1Lw4diPguF57V
         qd3Urvx3VghxUWOEQHnJpqX67V30QtVNB/Vc9/ELwC3Pv06QK7Mr0EFAKq/+kmoluCsi
         uSPTDKLOICYeysfyhoVVz8Ws9EzciCk4HVyrQnDenCSMBEEJjV7uaLpK0DQn9ITRviTR
         0AfAsO+NJZZwoJCnIErXumNTcqEpAorviZJSLkAR0jp2smy/R+zGJ+xJy0mZSmi1CwrX
         YA+9eN+P2/R2nAiIjshNRQw69VFNwZW8wI6Rk67Eq15RIlbaI35fbhw+fBE4pIEKXhvB
         nd0w==
X-Forwarded-Encrypted: i=1; AJvYcCW2LhZPwV8dOedL0bZdJ85ew7Du+gqAHtZ3PuEhxin0Q/DkGW81UQ1clYEsJv1JV0+iqfYH80+l0FB4uCE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwN/0on/ZRtAGUZ2m/YH2Uah4xk9z9J5JzKzZNb3a8vq34U9vCp
	/UhheYCBMIHiJN9oLnlI87hNUGaQE5wV2FXNgSujiPkj7XpwercVhcFvwYB+Lpv01jIreC47rIs
	/+MnYfyctqPQQTCJ5Y6u+H16pMTTgiI8pXs1pYhiKuHQ0lPzepUlFBtFcPvymEcM=
X-Gm-Gg: ASbGnctJa7Rsu8j/F35bIxyDGxjos7xr09fmUwu2bYaIXOzI0+igFqH8vaRIYtfawq8
	moHIO/qajSu1dR28cDsU1OdBIrNRaQ+rFYDHOyt3qGr4PnZaixB/3hA5z/7+pyS+aSO7pw9gU8X
	D5YIZ3QSE2Gh6HrV3TNMAGTGmZkplMsB1tTrctVKeAnUXUx6bJwgPcja8kWf+s6fSZ/Zh700EXq
	GL0M+6Jj2AvmZ9Et8ESUVcKTEw6SGxa/6q9FoxJpQ6rZU4zXz17emFSmhDw/zyWC7vPtAalgfmV
	Ss9v3QGGZrLAqqXBKpUj2CSlve5cPIL86VZ7VTHA86w1yi2pxBfsbhLs2xrpstreLlV2GKKPqdt
	Qmmvp8/hAplWeK+uTxBaaOx8a
X-Received: by 2002:ad4:4ea8:0:b0:6e8:9021:9090 with SMTP id 6a1803df08f44-6f896e57104mr7119826d6.26.1747162189241;
        Tue, 13 May 2025 11:49:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHYnx9KwLkHl8XFIlHZ3IWinoz3V+RESVtbgcJ3yCiSuf6iNbP/S+IwmwOZLbJQYeQ1xuPiMA==
X-Received: by 2002:ad4:4ea8:0:b0:6e8:9021:9090 with SMTP id 6a1803df08f44-6f896e57104mr7119496d6.26.1747162188881;
        Tue, 13 May 2025 11:49:48 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54fc64b6e08sm1967837e87.120.2025.05.13.11.49.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 11:49:47 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 13 May 2025 21:49:47 +0300
Subject: [PATCH] drm: ci: skip msm_mapping@shadow on SM8350
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250513-msm-ci-fixes-v1-1-baba185529a2@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAEqUI2gC/x3LTQqAIBBA4avErBvwBwm7SrQInWoWWjgQgXj3p
 OXH41UQKkwC81Ch0MPCV+7Q4wDh3PJByLEbjDJOOW0xScLAuPNLgpamQMb5qKOHvtyF/tCPZW3
 tA6h3V79eAAAA
X-Change-ID: 20250513-msm-ci-fixes-3e7ce259d1d9
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Helen Koike <helen.fornazier@gmail.com>,
        Vignesh Raman <vignesh.raman@collabora.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1333;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=7jV0gWLhUYLAfF5n95PURVvMxbGLkMaUPNgufE+LH40=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoI5RLxylC+eSk8QHj68u4toWVFFh7POdzPeK1z
 GHJsIszJW6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaCOUSwAKCRCLPIo+Aiko
 1c6+CACUeWGBzYCTAfwvVZeYBUtwdgNnLgXwOMBBLBRRT68ZEkTSaSQ3uRcCWam/prkEliXHBn4
 kETx+C9CZT8Y320rLBoI7rQq2YH2m2OytziosPDB3XKe4PMrTwlqfINfkJu4TsDjv+qldaybpxG
 vMn2yLEuIzGO0kRcFS40BD1yBKXVhmMVeBp9SkSahTivWwnyts+f3E7pwMJCDPz/vKgxi8PnF/4
 +P/dy95wXvT/it4EVzNyKXP2serWeeiWf6uwWEdMPC4SFbbMt9s1Bbl0Eba7PMOxP1moqUtPbsO
 C1hp+FZQcxX2YH9r8fS7rU4SU9YHH7UpNHZDbxeisCuhU6zx
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: Tow0LYbWt4sZwZOuStGiM7hOqhU7FscY
X-Proofpoint-ORIG-GUID: Tow0LYbWt4sZwZOuStGiM7hOqhU7FscY
X-Authority-Analysis: v=2.4 cv=JszxrN4C c=1 sm=1 tr=0 ts=6823944e cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8 a=HB0QJ2FYAIsZ-nyMV3gA:9
 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTEzMDE3OSBTYWx0ZWRfX9xs+OIWfhTu7
 A5SVv1Y6iKh2imqtxKT+xl+W+kumQX93kOeYcJVSbbigkwALfy6Qy7BAA1QQh17VPW6Eahsa8y3
 mvUnIj1M7Pn8shwRy8+0ey596tagJNoav8qjhR8eNVWRjsVwJDn+Yo9FXXEjBr1gouZhc/gm6sj
 D9D99DYuK8TeXXYRVgpoZUIiIVq2bt0RZ8L47fnYpE4NVzJUMNfInNlGDLX9KQIPj5DjYEJYtcv
 l8tgI1nCyk0yNABjsMYxa8wVI/8iro+8vYGczJnZB0K5FAqfPFdIO+t0uNgXtxpP7SXtvEJEpeo
 7uZSlPaJ4mJuVEirOgOKksDX8G+PjspnLxDYo4UIYOFdiJXvfukywCvTooayfYQgTLl6UGsZ8Ru
 ndMvBEWq0tnDBbkWYov9QuJ3kbyfYEOdwbTSadnDSauFxPmUQ8yPN7a/IuWeNs7bOsgFmDKB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-13_03,2025-05-09_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 suspectscore=0 mlxlogscore=738 bulkscore=0
 malwarescore=0 mlxscore=0 adultscore=0 phishscore=0 spamscore=0
 lowpriorityscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505130179

The msm_mapping@shadow test fails on SM8350, which means that the write
might get through (hopefully not though). Disable the test completely
for now until we can fix the issue.

Link: https://gitlab.freedesktop.org/drm/msm/-/issues/77
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/ci/xfails/msm-sm8350-hdk-skips.txt | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/ci/xfails/msm-sm8350-hdk-skips.txt b/drivers/gpu/drm/ci/xfails/msm-sm8350-hdk-skips.txt
index 9450f2a002fd7e68f0f674ac6ac84aeebf28347f..a8b535abc8ef0d996d0c73ece1c7a9622250928e 100644
--- a/drivers/gpu/drm/ci/xfails/msm-sm8350-hdk-skips.txt
+++ b/drivers/gpu/drm/ci/xfails/msm-sm8350-hdk-skips.txt
@@ -210,3 +210,8 @@ msm/msm_mapping@ring
 # [  229.752499] CPU features: 0x18,00000017,00200928,4200720b
 # [  229.758095] Memory Limit: none
 # [  229.761291] ---[ end Kernel panic - not syncing: softlockup: hung tasks ]---
+
+# Protection doesn't seem to be enforced, don't perform write which might get through
+# https://gitlab.freedesktop.org/drm/msm/-/issues/77
+msm/msm_mapping@shadow
+

---
base-commit: 8f5264d302e803e7ef82a61f9632a0d2ef67413f
change-id: 20250513-msm-ci-fixes-3e7ce259d1d9

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

