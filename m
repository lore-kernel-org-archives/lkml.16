Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 922DD23FC54
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 10:28:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745576907; cv=none; b=iC3N0PQRzCTTn2uDmDBlbQNA/18RcHv+X3QqLrjbBkT4rm6EUOHZ6CZC22Lv0sUdjGE3rCZlXWB6MDWrZMjYmYzmJeiD3+CRUG+Z4cCvv9qrMkl2xHkMvGXrkEM1ANK3P2VklWRdnyXfWErrhq8+sxLYk8OKbiicCxY/3rNvAwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745576907; c=relaxed/simple;
	bh=et9K11m7U26jM/XhRhXMdA0treky0/PVv4RY8I3cu50=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RI9XmFFe4z4z1crwCGo6fhA5YR2/Hw/w7MVSrYfzPesyX+kKZ53LfEGWviCTEVl+2dMl07Mhd6ayhW+wuE389XR8uc0knP74OpSHFv7szRw7mQtqWAs+OkvdBc5ddZ1R4UzO29OrH9n6OgX4o5NXKelmUUE6gNjq5YQpXgZMWJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=ev7YgVTr; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="ev7YgVTr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1745576903;
	bh=et9K11m7U26jM/XhRhXMdA0treky0/PVv4RY8I3cu50=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ev7YgVTraWglrd9Hx6RzDmVepZgXMJv9yN/OKqrsnmgLJQlEAJx5c8T8dcC0V8xtA
	 uwV2N9DPBu/gt7ZlAjyBImmvaHsyJsM+WqAdDzk3q/RuCmfBxMh5fRUU48EQhj9oLv
	 6LHcob9nuCaU3wbQ6pvd2ubTx+XKxta+RABeui6XhsRhRtzsh8W5+QlEaVy8RlkBa4
	 0pcO/XSFySky3jT0GB/4vxyGvByU13fsiQx7eo83gpDrEg7ERvmAXZNS0tspBhQ9ZL
	 6SVUZLTxoSu7rNs/QKWO7y+ZgdEdRDXxopcz7LRGwUPrRTurm/J7EguboT2mBTzPF9
	 TrUgW5O7bCSyQ==
Received: from localhost (unknown [82.76.59.226])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with UTF8SMTPSA id BC4C517E36C8;
	Fri, 25 Apr 2025 12:28:23 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Fri, 25 Apr 2025 13:26:57 +0300
Subject: [PATCH v4 06/23] drm/connector: hdmi: Use YUV420 output format as
 an RGB fallback
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250425-hdmi-conn-yuv-v4-6-5e55e2aaa3fa@collabora.com>
References: <20250425-hdmi-conn-yuv-v4-0-5e55e2aaa3fa@collabora.com>
In-Reply-To: <20250425-hdmi-conn-yuv-v4-0-5e55e2aaa3fa@collabora.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2

Try to make use of YUV420 when computing the best output format and
RGB cannot be supported for any of the available color depths.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/display/drm_hdmi_state_helper.c | 22 +++++++++++++++++-----
 1 file changed, 17 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_hdmi_state_helper.c b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
index 9e0a468073acbb2477eff1abef1c09d63620afaa..1fba10b92a6baa49150b6ff1e96bf2c2739bf269 100644
--- a/drivers/gpu/drm/display/drm_hdmi_state_helper.c
+++ b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
@@ -648,14 +648,26 @@ hdmi_compute_config(const struct drm_connector *connector,
 				       8, connector->max_bpc);
 	int ret;
 
-	/*
-	 * TODO: Add support for YCbCr420 output for HDMI 2.0 capable
-	 * devices, for modes that only support YCbCr420.
-	 */
 	ret = hdmi_compute_format_bpc(connector, conn_state, mode, max_bpc,
 				      HDMI_COLORSPACE_RGB);
+	if (!ret)
+		return 0;
 
-	return ret;
+	if (!connector->ycbcr_420_allowed) {
+		drm_dbg_kms(connector->dev,
+			    "YUV420 output format not allowed for connector.\n");
+		return -EINVAL;
+	}
+
+	ret = hdmi_compute_format_bpc(connector, conn_state, mode, max_bpc,
+				      HDMI_COLORSPACE_YUV420);
+	if (ret) {
+		drm_dbg_kms(connector->dev,
+			    "YUV420 output format doesn't work.\n");
+		return ret;
+	}
+
+	return 0;
 }
 
 static int hdmi_generate_avi_infoframe(const struct drm_connector *connector,

-- 
2.49.0

