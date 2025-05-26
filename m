Received: from smtpbgbr2.qq.com (smtpbgbr2.qq.com [54.207.22.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BD7919B5B1
	for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 09:39:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.207.22.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748252391; cv=none; b=caNrT+cWrL/IBueWPBS/pB6SBfzSxv9WZEyURRXSnturo/aOzye5ohDYgdmjzhmc/o33EKeM9cqqkDwN3B208TNl/0yPoETx7aYmAnc7OUw/MJr7KzL+FS88dO+VYNqmB8JRK+TSAB6fd/+C4+eo8Na6kY5ab6bJpEJFdTFEWgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748252391; c=relaxed/simple;
	bh=X23QSIwegBE8G7bURwdV+f5iHUK/4f41ONT6pBASI3Y=;
	h=From:To:Cc:Subject:Date:Message-Id; b=H/lQYRWIwqNJR0ozqSOt8qOvHsNywtsSkrwm7OG+jI7bVmroqoqHFcZ8qwOqh0QNqSkRgvYXbXbzuAgomgn+1xbqQso4wkQdhms4zoDerE09HpZegyGGrTnTup42o1ADS7a+pCokd6NiVZG1wA3NgdjJoW6yE3PPXHETSnSz+hU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=airkyi.com; spf=pass smtp.mailfrom=airkyi.com; dkim=pass (1024-bit key) header.d=airkyi.com header.i=@airkyi.com header.b=IKLDvxEv; arc=none smtp.client-ip=54.207.22.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=airkyi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=airkyi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=airkyi.com header.i=@airkyi.com header.b="IKLDvxEv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
	s=altu2504; t=1748252350;
	bh=Hk4LQge5dZN0PKJMnUNEwLr8KrYB0N4+j6gEFlg+Ep0=;
	h=From:To:Subject:Date:Message-Id;
	b=IKLDvxEvg+vDFMZYtrST0hkf59tURDMUhiMLt95MU+6aqwx9cKcrrF14+7wcV119l
	 IneuxIaqIX8bibAoAAnsSrrI8CECfxF3m+7xBqE8U6x5O0Gj3sLFiRFjj5shMdDAiM
	 sj+6STmKdB+FsJmSZPGHtD1543Fukelfl0/CqGcM=
X-QQ-mid: esmtpgz14t1748252348teb365f02
X-QQ-Originating-IP: yzT5xFtzjg3BpXAt1VENHE/RF5xaEqf0KDYL8emxbHc=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 26 May 2025 17:39:06 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 17899155140509127111
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
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Andy Yan <andy.yan@rock-chips.com>
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Chaoyi Chen <chaoyi.chen@rock-chips.com>
Subject: [PATCH] drm/bridge-connector: Fix bridge in drm_connector_hdmi_audio_init()
Date: Mon, 26 May 2025 17:38:27 +0800
Message-Id: <20250526093827.202-1-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:airkyi.com:qybglogicsvrsz:qybglogicsvrsz4a-0
X-QQ-XMAILINFO: MlQiyfGa8H9NF28VZTfoIrw9xK91dFQtI5g5XT9cHVDVUSGi/xDuMZds
	TB4F0Q94+xzclxU2Jm9/lf2cwcktpKPv97qS/KtyC4+H/l/f2+AoeQWelRFAZXI7O6ZnarN
	lJtxZ+2A0O+Ilts9rNSSJxVmj2NJ3cUObHEgoIVRNm26rcujPcQltj2EnrQ0mh3ORhoABNN
	52RfCzS0iDopBqOpPD9JHvEqbKMTwvL1uRYKFPZHCHbZKCiEjcOipMXEmHE+OkM98x4BvOq
	MwY/D1xsuZc8nGLczLrpPu6CrQFVGTZDYeoPml/SsfsGwHkBAt/jTIDOkkOxs0N2iQ0xPJj
	Zs88GqW4a7Z1fJVFnVNzV+Eu7RPAcb6Gko5osWDwb6x4cIDMBGGF4gwlr6CcauBIRY7p81S
	bQ6KPyFEUAgs9Fz0GvgCRGElQYSIBjNJfug5yvJ7ctesBd/b20NZELW00O9OjGXQv61UIAQ
	98tA4Huh1Cz7mw2S/hwPqJmEUnzKLwk6LWRb21NsvdmjhnKoSZYArNP8MQPB1j6CNXT58vM
	0PQY0X6Q24/iIaG34RuS38GwGWvCOg7KwP/xLYOLjKad6iMRUKRBvvr1uulKG7DzF472Xlf
	vHfkiAQC1+Yg/J5YgM2mKnfrAqYYZSdiWW8UNPb5cX2N7SHvS4CDMlwMNTrTM5a5Ryb3tc2
	4K3gHmnlyn/1f6urrNyNogOgI219WNqpgaZC5tJ7AWCa6NhkguTDEJbokXRoiJZPph7B+Re
	ztUnrGEjYnJc9QIBEo9KkobA0W0zXuZUc/FDKv+f37uG1+dOPuBdRXInu+2PNhTNKVMjDPp
	oKuMRL5wOTtsWRkniJoL8x/d88CtzP53b9GqEn5TsL8UlM8H9e2Bcw5nQf+U45MPAjAHnJq
	3f5/2HA3T0pgSPFbpamarYVhTQ/rNpBKHfCezsf97xaYDdKP/swjTVqF5BwYAwyJ/cv82rY
	x/8Dwheyuo33FkKwewAmuK2AaX+HmbbART8o=
X-QQ-XMRINFO: NI4Ajvh11aEj8Xl/2s1/T8w=
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

