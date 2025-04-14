Received: from pv50p00im-hyfv10011601.me.com (pv50p00im-hyfv10011601.me.com [17.58.6.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04341267F4E
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 09:53:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=17.58.6.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744624442; cv=none; b=CFDvDKrwtxuiXi3yWt5i3A338rNSu/q5pMnHyv3o+oSyCcYFlarV1J7xUzvIn7j100oAjUEHvuKm3tPqmxEHj9EgxkERhHL8oGMMIwUbvu10vIOADlZiS7uvAniHcNtmVw0M2TnH5cJe2DY8S+T3CO4pxhdBOgMnOELOpCqIe/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744624442; c=relaxed/simple;
	bh=gT+UhUX0QyqLLLrvyKECQCtxYK/Pau+ebvJTKqmnf0I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=efK6u6W+3EoYkk27IDnKO2aAiAhxMZ1hMCc/c/QaaUd9q8EH4tPRJN7cMw3h8uhDmi3v4GIclhPF9gzInsrQLoU6txB2KwxGJk0b8KuuE7JLG2YSO8qXVcTnlm70aw5h+j9syWTBYR54ekzPl82j7zasSqz8+j13tPk71TPLeps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=etehtsea.me; spf=pass smtp.mailfrom=etehtsea.me; dkim=pass (2048-bit key) header.d=etehtsea.me header.i=@etehtsea.me header.b=b9fJRN/G; arc=none smtp.client-ip=17.58.6.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=etehtsea.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=etehtsea.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=etehtsea.me header.i=@etehtsea.me header.b="b9fJRN/G"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=etehtsea.me; s=sig1;
	bh=Ybx8WjOqXxdOPt7jZILI3TQyxAH2lerFDHqdPBDPGyI=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:x-icloud-hme;
	b=b9fJRN/G8UE2xxLqmqQXE2YrxmbrCFA27S4njRGjhbbnIKSIpIydlaS8WBnimOrTZ
	 7tq+yP5FZHB73dZYuqpBlDtkCPbvnp/vds+rcsVitrrdRuif2zTe9woenvAnYwSbcU
	 LluGsewjMrU0TXxWv0pl0m5URMdYmwQe9CeP8ifgT0uTxdacdZh20pYo6mYHfY4U2N
	 ycugs9vPnMc7yNtD9eKzliTD3eGMEFgBc7ssd2gE2FRtx6zVgzg6sASlFjWhyeyiS1
	 i0JXC477vFsl9K6wN/5SUpQAS9URR3GEeHb0huaaYQH5RNUHaZqWm3C+zFRv20SqdS
	 QHU/SN7VWOB1A==
Received: from pv50p00im-hyfv10011601.me.com (pv50p00im-hyfv10011601.me.com [17.58.6.43])
	by pv50p00im-hyfv10011601.me.com (Postfix) with ESMTPS id 30A2DC80118;
	Mon, 14 Apr 2025 09:53:52 +0000 (UTC)
Received: from localhost (pv50p00im-dlb-asmtp-mailmevip.me.com [17.56.9.10])
	by pv50p00im-hyfv10011601.me.com (Postfix) with ESMTPSA id 27735C8009F;
	Mon, 14 Apr 2025 09:53:51 +0000 (UTC)
From: Konstantin Shabanov <mail@etehtsea.me>
To: Sandy Huang <hjc@rock-chips.com>,
	=?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
	Andy Yan <andy.yan@rock-chips.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
Cc: Konstantin Shabanov <mail@etehtsea.me>,
	Daniel Stone <daniel@fooishbar.org>,
	Dan Callaghan <djc@djc.id.au>,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] (drm/rockchip) Reject AFBC for resolutions >2560x1600
Date: Mon, 14 Apr 2025 09:53:31 +0000
Message-ID: <20250414095332.9674-1-mail@etehtsea.me>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250402125320.21836-1-mail@etehtsea.me>
References: <20250402125320.21836-1-mail@etehtsea.me>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 4idf3hj8_sYT2UrNeBvaZFeG976A8GMg
X-Proofpoint-ORIG-GUID: 4idf3hj8_sYT2UrNeBvaZFeG976A8GMg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-14_03,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 clxscore=1030 bulkscore=0
 mlxscore=0 adultscore=0 malwarescore=0 mlxlogscore=999 suspectscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2308100000 definitions=main-2504140071

As it isn't supported by hardware. At least, RK3399 doesn't support
it. From the datasheet[1]
("1.2.10 Video IN/OUT", "Display Interface", p. 17):

  Support AFBC function co-operation with GPU
    * support 2560x1600 UI

Manually tested on RockPro64 (rk3399):
- ARM_AFBC modifier is used for 1920x1080
- DRM_FORMAT_MOD_LINEAR modifier us used for 3840x2160
- No noise on the screen when sway is running in 4k
- Dynamic resolution switching works correctly in sway

Signed-off-by: Konstantin Shabanov <mail@etehtsea.me>
Cc: Daniel Stone <daniel@fooishbar.org>
Reported-by: Dan Callaghan <djc@djc.id.au>
Closes: https://gitlab.freedesktop.org/mesa/mesa/-/issues/7968

[1]: https://opensource.rock-chips.com/images/d/d7/Rockchip_RK3399_Datasheet_V2.1-20200323.pdf
---
 drivers/gpu/drm/rockchip/rockchip_drm_fb.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_fb.c b/drivers/gpu/drm/rockchip/rockchip_drm_fb.c
index dcc1f07632c3..1379bc3cd937 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_fb.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_fb.c
@@ -18,6 +18,8 @@
 #include "rockchip_drm_fb.h"
 #include "rockchip_drm_gem.h"

+#define ROCKCHIP_AFBC_MAX_WIDTH		2560
+
 static const struct drm_framebuffer_funcs rockchip_drm_fb_funcs = {
 	.destroy       = drm_gem_fb_destroy,
 	.create_handle = drm_gem_fb_create_handle,
@@ -52,6 +54,13 @@ rockchip_fb_create(struct drm_device *dev, struct drm_file *file,
 	}

 	if (drm_is_afbc(mode_cmd->modifier[0])) {
+		if (mode_cmd->width > ROCKCHIP_AFBC_MAX_WIDTH) {
+			DRM_DEBUG_KMS("AFBC is not supported for the width %d (max %d)\n",
+				      mode_cmd->width,
+				      ROCKCHIP_AFBC_MAX_WIDTH);
+			return ERR_PTR(-EINVAL);
+		};
+
 		int ret, i;

 		ret = drm_gem_fb_afbc_init(dev, mode_cmd, afbc_fb);

base-commit: e7bb7d44c3b97aea1f0e354c6499900154ac67f2
--
2.48.1
