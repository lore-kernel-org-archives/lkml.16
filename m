Received: from outbound.pv.icloud.com (p-west1-cluster6-host5-snip4-8.eps.apple.com [57.103.67.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DF15219A68
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 06:58:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.67.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744873099; cv=none; b=IOFqRfheJo5HKswI04W8wji6yKYK0Ydo5/vbkiAD54AaWgG23vDUhiIX6CMljNeGwuObHthrb39VWjOS/YCdAYhzt7n8el5cx7WF8EjA+6c/WlUyhVo3q8lFIrVIJV+PghA/Z0+aElPUx+wRG8mXG7VHR1TdkhL4Y1upm8hk6uc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744873099; c=relaxed/simple;
	bh=GeoZ/Z2uFZ4EUNMyCtrFfzLyLopoE4r3HdTNq6wXZdY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Tlx+Sk+jkK4HNXIAfQKaSwss1WesuOG8+ytfprcLCXIUFp3EloOl6JL3obNJ+CgFhElQ+ZrJocwV4upGHzN5iNY8mLHMzV7CgkalsLVhUiyFIV6U69EOBn1KAuwU746H94TEVky+vEZ3REAuC+UE81UbNWMSCuUTYYGVU5UJRuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=etehtsea.me; spf=pass smtp.mailfrom=etehtsea.me; dkim=pass (2048-bit key) header.d=etehtsea.me header.i=@etehtsea.me header.b=kRJLB/2r; arc=none smtp.client-ip=57.103.67.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=etehtsea.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=etehtsea.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=etehtsea.me header.i=@etehtsea.me header.b="kRJLB/2r"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=etehtsea.me; s=sig1;
	bh=2Ww4hpp+z6fgi+nJK6FyaJfCKTs87q137A6aiYcfvEc=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:x-icloud-hme;
	b=kRJLB/2rV6qKWhiRvYq1W/QRIhp8ThfVUSEGHb4sbhgLpFogsuV79f38wqoxC3nl+
	 N1ajnwRaBAa8fh546L8DmgWtTsTGrQvav5+FqGlUnCujhi1jYOgDmun5QphkvnjztC
	 NiIBQ0rdP5Q5l9FRQran2dkkW8Z7YOHPwtWh2j3J2N+WNA712vSB5bfaUwGCBgdG9z
	 OOS8xi97GDWJRP3bfQLWv/GjIb1BIZMwSR1mutQiLaS6B6TRl5dyxjJQUT9wt19qWl
	 Y5O2TLQLMf1dzqaxU8OpY39+3oEiYf15dpplEtI+VOvB5q0/iKCz+Q/YyMjHeDVdam
	 Op7XbW3b9j9aA==
Received: from localhost (pv-asmtp-me-k8s.p00.prod.me.com [17.56.9.36])
	by outbound.pv.icloud.com (Postfix) with ESMTPSA id 9762B18001FD;
	Thu, 17 Apr 2025 06:58:08 +0000 (UTC)
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
	Andy Yan <andyshrk@163.com>,
	Dan Callaghan <djc@djc.id.au>,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4] drm/rockchip: Disable AFBC for res >2560 on rk3399
Date: Thu, 17 Apr 2025 06:57:58 +0000
Message-ID: <20250417065759.5948-1-mail@etehtsea.me>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250414095332.9674-1-mail@etehtsea.me>
References: <20250414095332.9674-1-mail@etehtsea.me>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: rwAzO9rQriuU_yzyVXMfa2RlWH8B6Ckm
X-Proofpoint-ORIG-GUID: rwAzO9rQriuU_yzyVXMfa2RlWH8B6Ckm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-17_01,2025-04-15_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 spamscore=0 bulkscore=0
 malwarescore=0 adultscore=0 suspectscore=0 phishscore=0 mlxlogscore=999
 clxscore=1030 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2308100000 definitions=main-2504170053

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
Cc: Andy Yan <andyshrk@163.com>
Reported-by: Dan Callaghan <djc@djc.id.au>
Closes: https://gitlab.freedesktop.org/mesa/mesa/-/issues/7968

[1]: https://opensource.rock-chips.com/images/d/d7/Rockchip_RK3399_Datasheet_V2.1-20200323.pdf
---
V3 -> V4: Correct redundant header inclusion
V2 -> V3: Run check only on rk3399
V1 -> V2: Move the check to the fb_create callback

 drivers/gpu/drm/rockchip/rockchip_drm_fb.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_fb.c b/drivers/gpu/drm/rockchip/rockchip_drm_fb.c
index dcc1f07632c3..45e1619b5c97 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_fb.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_fb.c
@@ -5,6 +5,7 @@
  */

 #include <linux/kernel.h>
+#include <linux/of.h>

 #include <drm/drm.h>
 #include <drm/drm_atomic.h>
@@ -18,6 +19,8 @@
 #include "rockchip_drm_fb.h"
 #include "rockchip_drm_gem.h"

+#define RK3399_AFBC_MAX_WIDTH		2560
+
 static const struct drm_framebuffer_funcs rockchip_drm_fb_funcs = {
 	.destroy       = drm_gem_fb_destroy,
 	.create_handle = drm_gem_fb_create_handle,
@@ -52,6 +55,15 @@ rockchip_fb_create(struct drm_device *dev, struct drm_file *file,
 	}

 	if (drm_is_afbc(mode_cmd->modifier[0])) {
+		if (of_machine_is_compatible("rockchip,rk3399")) {
+			if (mode_cmd->width > RK3399_AFBC_MAX_WIDTH) {
+				DRM_DEBUG_KMS("AFBC is not supported for the width %d (max %d)\n",
+					      mode_cmd->width,
+					      RK3399_AFBC_MAX_WIDTH);
+				return ERR_PTR(-EINVAL);
+			};
+		}
+
 		int ret, i;

 		ret = drm_gem_fb_afbc_init(dev, mode_cmd, afbc_fb);

base-commit: 4890d68db651562ea80250f2c93205a5c0327a6a
--
2.48.1
