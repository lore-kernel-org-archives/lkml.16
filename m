Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5093A54F81;
	Thu,  3 Apr 2025 03:38:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743651518; cv=none; b=g2rBtGThsK32CReQK3aJjbpwPxRjmJD5s12DmCrOvrEtvmWzs+OdBOh93qQ1xB2HwynQWENEaGSCNM+X9FAMRGRNYlqi+u6DYDauhqUl5fpXGA5pSNHmmg+QZqwxBZB2iH0Y0rBJAC4wzzoje1UlYx2/rOvFfJsKMT3bcw8/QCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743651518; c=relaxed/simple;
	bh=j2TEqKGGtvH5TfbrEIIclWmOeMBXwJz6KG7LyCynLbg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=m3IfylzyL/1yKzs7OdmyBe7LOsKVICVOt4XjszH3vZM8nFr4f/oyTdDPN5w90hXWPQAJvU7OHHRSzBx02VDbKVJbax3K/e9w3pj4AL5ytDneKnMvzpdfMR+d0jSMlIlqE3BjduDK8ZoHWnXmcbNIWxV9NAdnzf/Haevvt8xy0no=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=EqYLfYFY; arc=none smtp.client-ip=117.135.210.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="EqYLfYFY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-ID:MIME-Version; bh=XuXpK
	K37RNjycDW51PN1NECFP4c5XagfJ9K0+hOaEcU=; b=EqYLfYFYWQEh4JMy7A4uq
	bzZpNXzm5cb5W0Gc5CoSaClw3Mt6ECh1Ocvk09BpOqW0oHtz/r4CP88t2TvaUJcM
	MdJNvobT+rY0JQczvnzhkBUPpohZNIkGRI4+ljfiE7KSz9z6JBOWTnY6/8h8wRi2
	EO0qX4HmtVmirauXN4mxPU=
Received: from ProDesk.. (unknown [])
	by gzga-smtp-mtada-g0-3 (Coremail) with SMTP id _____wBHWgmNAu5n7FfDDg--.28713S7;
	Thu, 03 Apr 2025 11:38:01 +0800 (CST)
From: Andy Yan <andyshrk@163.com>
To: dmitry.baryshkov@oss.qualcomm.com,
	heiko@sntech.de
Cc: hjc@rock-chips.com,
	mripard@kernel.org,
	naoki@radxa.com,
	stephen@radxa.com,
	cristian.ciocaltea@collabora.com,
	neil.armstrong@linaro.org,
	Laurent.pinchart@ideasonboard.com,
	yubing.zhang@rock-chips.com,
	krzk+dt@kernel.org,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	robh@kernel.org,
	sebastian.reichel@collabora.com,
	Andy Yan <andy.yan@rock-chips.com>
Subject: [PATCH v3 5/9] drm/birdge: simple-bridge: Add support for radxa ra620
Date: Thu,  3 Apr 2025 11:37:33 +0800
Message-ID: <20250403033748.245007-6-andyshrk@163.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250403033748.245007-1-andyshrk@163.com>
References: <20250403033748.245007-1-andyshrk@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wBHWgmNAu5n7FfDDg--.28713S7
X-Coremail-Antispam: 1Uf129KBjvdXoW7Gw47tr48Jr4ftr4xKrWUtwb_yoWDtrg_CF
	nayryUJr4rZr95KF43Zw43Ary2vw18urZ7Xr1vgrZxArs3Zw17uwnrZr9rZ34rAF10kF9F
	y3W5JFWayr17ujkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU0LZ23UUUUU==
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbBkAEkXmft-iHCxwAAs7

From: Andy Yan <andy.yan@rock-chips.com>

The RA620 is an active DP to HDMI converter chip, basically
no software is involved to drive it.

Add it to simple bridge to make it can be find by the drm bridge chain.

Signed-off-by: Andy Yan <andy.yan@rock-chips.com>

---

Changes in v3:
- First introduced in this version.

 drivers/gpu/drm/bridge/simple-bridge.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/bridge/simple-bridge.c b/drivers/gpu/drm/bridge/simple-bridge.c
index 70db5b99e5bb8..df2d8106ee755 100644
--- a/drivers/gpu/drm/bridge/simple-bridge.c
+++ b/drivers/gpu/drm/bridge/simple-bridge.c
@@ -261,6 +261,11 @@ static const struct of_device_id simple_bridge_match[] = {
 			.timings = &default_bridge_timings,
 			.connector_type = DRM_MODE_CONNECTOR_VGA,
 		},
+	}, {
+		.compatible = "radxa,ra620",
+		.data = &(const struct simple_bridge_info) {
+			.connector_type = DRM_MODE_CONNECTOR_HDMIA,
+		},
 	}, {
 		.compatible = "ti,opa362",
 		.data = &(const struct simple_bridge_info) {
-- 
2.43.0

