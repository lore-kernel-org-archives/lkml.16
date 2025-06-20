Received: from smtpbgau1.qq.com (smtpbgau1.qq.com [54.206.16.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD7BF30E82C
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 01:17:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.206.16.166
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750382243; cv=none; b=oaNh6ifultwVTI32MOw+fmeEqbGpWjacXp3esRWaGdHL23ju7JlY7KPxklaaei3nA4863MHhzHjI5spAVrHZuciBNqoC6WKQMEsUPADG9XuXprqqo8qLJCEvLsxjOrwXy8smtZA26kELwlO/rWPEGHdTSa0fQdQWktZcH6yAmH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750382243; c=relaxed/simple;
	bh=X23QSIwegBE8G7bURwdV+f5iHUK/4f41ONT6pBASI3Y=;
	h=From:To:Cc:Subject:Date:Message-Id; b=WOrqHsMx84Yk/9LWyLBB9klSSeoeEsyyQAVxG8AfolOigeEbyS8djJp5QQU9jnJLh3rSbymu2/uth/hkaBo5KEFYaCkvWDrNKFUMaEdaLJUja61FuzgE+ZXeDSYIP/VF4eYuCVLtLJGVVdsEP4RwxWXykWKEGb8tgPGCdj96p1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=airkyi.com; spf=pass smtp.mailfrom=airkyi.com; dkim=pass (1024-bit key) header.d=airkyi.com header.i=@airkyi.com header.b=RtKiqCHH; arc=none smtp.client-ip=54.206.16.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=airkyi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=airkyi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=airkyi.com header.i=@airkyi.com header.b="RtKiqCHH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
	s=altu2504; t=1750382189;
	bh=Hk4LQge5dZN0PKJMnUNEwLr8KrYB0N4+j6gEFlg+Ep0=;
	h=From:To:Subject:Date:Message-Id;
	b=RtKiqCHHuEglrNVUQZQjWZQDz7lv7WmFziwNVDV/KuUBAXqpkj61PVXwxuz+Mutyw
	 z2ZEy98zeKxZEXuRXM3sBAiutTQjcBON5o0PDJijZJv2OeYPWqN9HcOhzd8/HsbU+P
	 AEGGzv7UKkqLbin2mIL/aISwmlQD/XVRdH+UrUbA=
X-QQ-mid: esmtpgz12t1750382187t7a3389cc
X-QQ-Originating-IP: sQXtZrTrRWkPHpCLRXEKYqYrB1xzMxgT06FWXQbhkTQ=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 20 Jun 2025 09:16:25 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 7161152192131492949
From: Chaoyi Chen <kernel@airkyi.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Chaoyi Chen <chaoyi.chen@rock-chips.com>
Subject: [PATCH RESEND] drm/bridge-connector: Fix bridge in drm_connector_hdmi_audio_init()
Date: Fri, 20 Jun 2025 09:16:16 +0800
Message-Id: <20250620011616.118-1-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:airkyi.com:qybglogicsvrsz:qybglogicsvrsz4a-0
X-QQ-XMAILINFO: MxdW4jxL6NvXQoGjJXfegqa9j77uCv7romqb6bzpxIiwh+0rKaCybytc
	ez9ZCzwsFdfVyIcPUddTNoLQUzdZY+IQU0+rhvzrqBwut3qLiTARk5+WuKuESb4j03KmGkC
	NdAQ2Fix5NQrJxqUMRrVnRPbXHLD6ReAiIVRv3AkhdFMWmMY5p+HNZF10tNlusCN8MX8jrn
	ve8CzKrSybEj/ju+Pl4f+NENXYoyfvyAJ0lrqqFZ+u3uQyEYZAQou/LsXifrgC/l2+LJHOx
	7L7RbcIDcPJ8aJO38WnZJCkGzLHDNO45oWgpFOUanA/UjNKJIx88zY+XtSSFrqLDBzd4bDq
	KLkCjLVJB5xx9O7hwTK9tN5kfa3WdumkDg74sPMbWyJ2xxhxprcUrQDER+lS7SG7a5rAmzD
	gPxQSP3IpaUSLHeIyW+Ny1fm1wnyyrcf4z4c3zBcU58W7XdCC9wbDs6AX0hDRYI2Q3ysj8B
	twBkTnC180Bxv1HJGB8Nx/5LsH6roBxsJmeah5ghtks7w/QR+4/LURMQMoW21iuLjMBL/82
	zy6Aecfuw4KVHCAIjtkPF4fkhnXR2kP1odKGFPCU/v55xUgeEzdNs8Y4VUt7Yfp3MfK0QV0
	/Up3G4bmu7H/4QyLVSncYtfzoN0Unkg/jletPmirWtUbdfJnuNWNbclzWXLYt59BBVhxlSz
	Fm8JIkbrlYtJbfrwTjcIGl0xmxxnSKo3FSNsGEuilHHNOI3QYvY1rwivS2pRPUEdP2qOL6U
	Fn7HGsZKBNXtNPevRln7rYXVhJ95w/ipyTXJHUnYNTqJXxLm5OY7vtGbnNJrHER2TkfbQ3C
	8Psxgi8fmytvNz/m+PmI5jj8FaDDY4Gcj4LKJ0QjyxN/xsvr1V5M1v4BXfm4ifmw7eJ+0di
	vCaXS4mXhEvTKEuX3uBxM3Xij5wTkh2jgdSRspS13at4S9LQX2W/2/jwtDhHtlJkVB8WNWt
	oKD+WfibHMUw1VybJHVDAQsHx
X-QQ-XMRINFO: MSVp+SPm3vtS1Vd6Y4Mggwc=
X-QQ-RECHKSPAM: 0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

From: Chaoyi Chen <chaoyi.chen@rock-chips.com>

The bridge used in drm_connector_hdmi_audio_init() does not correctly
point to the required audio bridge, which lead to incorrect audio
configuration input.

Fixes: 231adeda9f67 ("drm/bridge-connector: hook DisplayPort audio support")
Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
---
 drivers/gpu/drm/display/drm_bridge_connector.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
index 7d2e499ea5de..262e93e07a28 100644
--- a/drivers/gpu/drm/display/drm_bridge_connector.c
+++ b/drivers/gpu/drm/display/drm_bridge_connector.c
@@ -708,11 +708,14 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
 	if (bridge_connector->bridge_hdmi_audio ||
 	    bridge_connector->bridge_dp_audio) {
 		struct device *dev;
+		struct drm_bridge *bridge;
 
 		if (bridge_connector->bridge_hdmi_audio)
-			dev = bridge_connector->bridge_hdmi_audio->hdmi_audio_dev;
+			bridge = bridge_connector->bridge_hdmi_audio;
 		else
-			dev = bridge_connector->bridge_dp_audio->hdmi_audio_dev;
+			bridge = bridge_connector->bridge_dp_audio;
+
+		dev = bridge->hdmi_audio_dev;
 
 		ret = drm_connector_hdmi_audio_init(connector, dev,
 						    &drm_bridge_connector_hdmi_audio_funcs,
-- 
2.49.0


