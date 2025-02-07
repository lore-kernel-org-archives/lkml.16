Received: from mtxmxout4.matrox.com (mtxmxout4.matrox.com [138.11.2.94])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A02C2417DB
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 13:30:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=138.11.2.94
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738935022; cv=none; b=BvcpLYAyOtalVi4xOxCqTLx8BFDV3laXhoVu5edYZenNFnohPBsvBHd6s6XMbsBBV06nkJIcjSBjWkqRNqN4QhGCURSwW5dfXrLcONZL6DPo8frbPAHajzjWrZX810G+FfnP59TfjWhRtvAEkUGVZyc7ps/QwO740j5jhUnWrZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738935022; c=relaxed/simple;
	bh=w1yXffZ+RZJ+yAMZtJVc6f/BK7ivJB7WZHQGyQdfnEY=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type; b=p/ctk68wWbWOcicnkw58aPasCyRqWDZUdUp4fXpP9D48YeqotSH5gCk8mU4gGk0D2mRWHe38MsnAuL+/IaeLo6CIKUuFrbMHFQjNmwr5dgkbGZgPRTzOYaKOE7lI2i2dNl57Oo4ki4D5A6sTQiJM3nwAZo6I2ovo59Gzv1G4HrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=matrox.com; spf=pass smtp.mailfrom=matrox.com; dkim=pass (1024-bit key) header.d=matrox.com header.i=@matrox.com header.b=OYlQd/qA; arc=none smtp.client-ip=138.11.2.94
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=matrox.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=matrox.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=matrox.com header.i=@matrox.com header.b="OYlQd/qA"
Received: from venus.matrox.com (unknown [192.168.1.36])
	by mtxmxout4.matrox.com (Postfix) with ESMTP id 69F3340119
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 08:21:05 -0500 (EST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=matrox.com; s=dkim;
	t=1738934465; bh=w1yXffZ+RZJ+yAMZtJVc6f/BK7ivJB7WZHQGyQdfnEY=;
	h=Date:From:To:Subject;
	b=OYlQd/qAJ0TOeC2xeozifCB4r3e3QxxXbElx5QkkdAB5ipkozCAP8lI2NZCXtx2uB
	 boO8gBWJvvTEwvfxQbyFr0mD0Hiamsl3Qv19xv17CTMOJ80cvoZ8OcXPoE7bP7RjgM
	 nMl1mzG4gPMkP16rNNHXdZpQw3YZvuMCBL4oTedQ=
Received: (from ssmsp@localhost)
	by venus.matrox.com (8.14.6/8.13.2) id 517DL5hd032746
	for linux-kernel@vger.kernel.org; Fri, 7 Feb 2025 08:21:05 -0500
Received: from localhost (localhost.localdomain [127.0.0.1])
	by venus.matrox.com (Postfix) with ESMTP id 5D4E35F765;
	Fri,  7 Feb 2025 08:21:05 -0500 (EST)
X-Virus-MTX-Scanned: by Matrox Virus scanner at venus.matrox.com
Received: from venus.matrox.com ([127.0.0.1])
	by localhost (venus.matrox.com [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 8rrw3tKMJ-mM; Fri,  7 Feb 2025 08:21:05 -0500 (EST)
Received: from venus-in.matrox.com (localhost.localdomain [127.0.0.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by venus.matrox.com (Postfix) with ESMTPS id 4BB895F760;
	Fri,  7 Feb 2025 08:21:05 -0500 (EST)
Received: from pluton.matrox.com (pluton.matrox.com [192.168.8.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by venus-in.matrox.com (Postfix) with ESMTPS id 4833761F04;
	Fri,  7 Feb 2025 08:21:05 -0500 (EST)
Received: by pluton.matrox.com (Postfix, from userid 3820)
	id 419CE340678; Fri,  7 Feb 2025 08:21:05 -0500 (EST)
Received: from localhost (localhost [127.0.0.1])
	by pluton.matrox.com (Postfix) with ESMTP id 3F17C34014D;
	Fri,  7 Feb 2025 08:21:05 -0500 (EST)
Date: Fri, 7 Feb 2025 08:21:05 -0500 (EST)
From: Gwenael Georgeault <ggeorgea@matrox.com>
To: Dave Airlie <airlied@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>,
        Jocelyn Falempe <jfalempe@redhat.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
        Simona Vetter <simona@ffwll.ch>, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, mgi_lnx@matrox.com
Subject: [PATCH] drm/mgag200: Added support for the new device G200eH5
Message-ID: <alpine.LFD.2.00.2502070816590.23666@pluton.matrox.com>
User-Agent: Alpine 2.00 (LFD 1167 2008-08-23)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; format=flowed; charset=US-ASCII

- Added the new device ID
- Added new pll algorithm

Signed-off-by: Gwenael Georgeault <ggeorgea@matrox.com>
Co-authored-by: Mamadou Insa Diop <mdiop@matrox.com>
---
  drivers/gpu/drm/mgag200/Makefile          |   1 +
  drivers/gpu/drm/mgag200/mgag200_drv.c     |   4 +
  drivers/gpu/drm/mgag200/mgag200_drv.h     |   3 +
  drivers/gpu/drm/mgag200/mgag200_g200eh5.c | 205 ++++++++++++++++++++++
  4 files changed, 213 insertions(+)
  create mode 100644 drivers/gpu/drm/mgag200/mgag200_g200eh5.c

diff --git a/drivers/gpu/drm/mgag200/Makefile b/drivers/gpu/drm/mgag200/Makefile
index 5a02203fad12..94f063c8722a 100644
--- a/drivers/gpu/drm/mgag200/Makefile
+++ b/drivers/gpu/drm/mgag200/Makefile
@@ -6,6 +6,7 @@ mgag200-y := \
  	mgag200_g200.o \
  	mgag200_g200eh.o \
  	mgag200_g200eh3.o \
+	mgag200_g200eh5.o \
  	mgag200_g200er.o \
  	mgag200_g200ev.o \
  	mgag200_g200ew3.o \
diff --git a/drivers/gpu/drm/mgag200/mgag200_drv.c b/drivers/gpu/drm/mgag200/mgag200_drv.c
index 069fdd2dc8f6..32cd8ac018c0 100644
--- a/drivers/gpu/drm/mgag200/mgag200_drv.c
+++ b/drivers/gpu/drm/mgag200/mgag200_drv.c
@@ -214,6 +214,7 @@ static const struct pci_device_id mgag200_pciidlist[] = {
  	{ PCI_VENDOR_ID_MATROX, 0x534, PCI_ANY_ID, PCI_ANY_ID, 0, 0, G200_ER },
  	{ PCI_VENDOR_ID_MATROX, 0x536, PCI_ANY_ID, PCI_ANY_ID, 0, 0, G200_EW3 },
  	{ PCI_VENDOR_ID_MATROX, 0x538, PCI_ANY_ID, PCI_ANY_ID, 0, 0, G200_EH3 },
+	{ PCI_VENDOR_ID_MATROX, 0x53a, PCI_ANY_ID, PCI_ANY_ID, 0, 0, G200_EH5 },
  	{0,}
  };

@@ -256,6 +257,9 @@ mgag200_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
  	case G200_EH3:
  		mdev = mgag200_g200eh3_device_create(pdev, &mgag200_driver);
  		break;
+	case G200_EH5:
+		mdev = mgag200_g200eh5_device_create(pdev, &mgag200_driver);
+		break;
  	case G200_ER:
  		mdev = mgag200_g200er_device_create(pdev, &mgag200_driver);
  		break;
diff --git a/drivers/gpu/drm/mgag200/mgag200_drv.h b/drivers/gpu/drm/mgag200/mgag200_drv.h
index 0608fc63e588..819a7e9381e3 100644
--- a/drivers/gpu/drm/mgag200/mgag200_drv.h
+++ b/drivers/gpu/drm/mgag200/mgag200_drv.h
@@ -196,6 +196,7 @@ enum mga_type {
  	G200_EV,
  	G200_EH,
  	G200_EH3,
+	G200_EH5,
  	G200_ER,
  	G200_EW3,
  };
@@ -334,6 +335,8 @@ struct mga_device *mgag200_g200eh_device_create(struct pci_dev *pdev,
  						const struct drm_driver *drv);
  struct mga_device *mgag200_g200eh3_device_create(struct pci_dev *pdev,
  						 const struct drm_driver *drv);
+struct mga_device *mgag200_g200eh5_device_create(struct pci_dev *pdev,
+						 const struct drm_driver *drv);
  struct mga_device *mgag200_g200er_device_create(struct pci_dev *pdev,
  						const struct drm_driver *drv);
  struct mga_device *mgag200_g200ew3_device_create(struct pci_dev *pdev,
diff --git a/drivers/gpu/drm/mgag200/mgag200_g200eh5.c b/drivers/gpu/drm/mgag200/mgag200_g200eh5.c
new file mode 100644
index 000000000000..2c4265293504
--- /dev/null
+++ b/drivers/gpu/drm/mgag200/mgag200_g200eh5.c
@@ -0,0 +1,205 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+#include <limits.h>
+
+#include <linux/pci.h>
+#include <linux/units.h>
+
+#include <drm/drm_atomic.h>
+#include <drm/drm_atomic_helper.h>
+#include <drm/drm_drv.h>
+#include <drm/drm_gem_atomic_helper.h>
+#include <drm/drm_probe_helper.h>
+
+#include "mgag200_drv.h"
+
+/*
+ * PIXPLLC
+ */
+
+static int mgag200_g200eh5_pixpllc_atomic_check(struct drm_crtc *crtc,
+						struct drm_atomic_state *new_state)
+{
+	const unsigned long long VCO_MAX = 10 * GIGA; // Hz
+	const unsigned long long VCO_MIN = 2500 * MEGA; // Hz
+	const unsigned long long PLL_FREQ_REF = 25 * MEGA; // Hz
+
+	struct drm_crtc_state *new_crtc_state = drm_atomic_get_new_crtc_state(new_state, crtc);
+	struct mgag200_crtc_state *new_mgag200_crtc_state = to_mgag200_crtc_state(new_crtc_state);
+	long clock = new_crtc_state->mode.clock;
+	struct mgag200_pll_values *pixpllc = &new_mgag200_crtc_state->pixpllc;
+
+	unsigned long long fdelta = ULLONG_MAX;
+
+	u16 mult_max = (u16)(VCO_MAX / PLL_FREQ_REF); // 400 (0x190)
+	u16 mult_min = (u16)(VCO_MIN / PLL_FREQ_REF); // 100 (0x64)
+
+	u64 ftmp_delta;
+	u64 computed_fo;
+
+	u16 test_m;
+	u8 test_div_a;
+	u8 test_div_b;
+	u64 fo_hz;
+
+	u8 uc_m = 0;
+	u8 uc_n = 0;
+	u8 uc_p = 0;
+
+	fo_hz = (u64)clock * HZ_PER_KHZ;
+
+	for (test_m = mult_min; test_m <= mult_max; test_m++) { // This gives 100 <= M <= 400
+		for (test_div_a = 8; test_div_a > 0; test_div_a--) { // This gives 1 <= A <= 8
+			for (test_div_b = 1; test_div_b <= test_div_a; test_div_b++) {
+				// This gives 1 <= B <= A
+				computed_fo = (PLL_FREQ_REF * test_m) /
+					(4 * test_div_a * test_div_b);
+
+				if (computed_fo > fo_hz)
+					ftmp_delta = computed_fo - fo_hz;
+				else
+					ftmp_delta = fo_hz - computed_fo;
+
+				if (ftmp_delta < fdelta) {
+					fdelta = ftmp_delta;
+					uc_m = (u8)(0xFF & test_m);
+					uc_n = (u8)((0x7 & (test_div_a - 1))
+						| (0x70 & (0x7 & (test_div_b - 1)) << 4));
+					uc_p = (u8)(1 & (test_m >> 8));
+				}
+				if (fdelta == 0)
+					break;
+			}
+			if (fdelta == 0)
+				break;
+		}
+		if (fdelta == 0)
+			break;
+	}
+
+	pixpllc->m = uc_m + 1;
+	pixpllc->n = uc_n + 1;
+	pixpllc->p = uc_p + 1;
+	pixpllc->s = 0;
+
+	return 0;
+	}
+
+/*
+ * Mode-setting pipeline
+ */
+
+static const struct drm_plane_helper_funcs mgag200_g200eh5_primary_plane_helper_funcs = {
+	MGAG200_PRIMARY_PLANE_HELPER_FUNCS,
+};
+
+static const struct drm_plane_funcs mgag200_g200eh5_primary_plane_funcs = {
+	MGAG200_PRIMARY_PLANE_FUNCS,
+};
+
+static const struct drm_crtc_helper_funcs mgag200_g200eh5_crtc_helper_funcs = {
+	MGAG200_CRTC_HELPER_FUNCS,
+};
+
+static const struct drm_crtc_funcs mgag200_g200eh5_crtc_funcs = {
+	MGAG200_CRTC_FUNCS,
+};
+
+static int mgag200_g200eh5_pipeline_init(struct mga_device *mdev)
+{
+	struct drm_device *dev = &mdev->base;
+	struct drm_plane *primary_plane = &mdev->primary_plane;
+	struct drm_crtc *crtc = &mdev->crtc;
+	int ret;
+
+	ret = drm_universal_plane_init(dev, primary_plane, 0,
+				       &mgag200_g200eh5_primary_plane_funcs,
+				       mgag200_primary_plane_formats,
+				       mgag200_primary_plane_formats_size,
+				       mgag200_primary_plane_fmtmods,
+				       DRM_PLANE_TYPE_PRIMARY, NULL);
+	if (ret) {
+		drm_err(dev, "drm_universal_plane_init() failed: %d\n", ret);
+		return ret;
+	}
+	drm_plane_helper_add(primary_plane, &mgag200_g200eh5_primary_plane_helper_funcs);
+	drm_plane_enable_fb_damage_clips(primary_plane);
+
+	ret = drm_crtc_init_with_planes(dev, crtc, primary_plane, NULL,
+					&mgag200_g200eh5_crtc_funcs, NULL);
+	if (ret) {
+		drm_err(dev, "drm_crtc_init_with_planes() failed: %d\n", ret);
+		return ret;
+	}
+
+	drm_crtc_helper_add(crtc, &mgag200_g200eh5_crtc_helper_funcs);
+
+	/* FIXME: legacy gamma tables, but atomic gamma doesn't work without */
+	drm_mode_crtc_set_gamma_size(crtc, MGAG200_LUT_SIZE);
+	drm_crtc_enable_color_mgmt(crtc, 0, false, MGAG200_LUT_SIZE);
+	ret = mgag200_vga_bmc_output_init(mdev);
+
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+/*
+ * DRM device
+ */
+
+static const struct mgag200_device_info mgag200_g200eh5_device_info =
+	MGAG200_DEVICE_INFO_INIT(2048, 2048, 0, false, 1, 0, false);
+
+static const struct mgag200_device_funcs mgag200_g200eh5_device_funcs = {
+	.pixpllc_atomic_check = mgag200_g200eh5_pixpllc_atomic_check,
+	.pixpllc_atomic_update = mgag200_g200eh_pixpllc_atomic_update, // same as G200EH
+};
+
+struct mga_device *mgag200_g200eh5_device_create(struct pci_dev *pdev,
+						 const struct drm_driver *drv)
+{
+	struct mga_device *mdev;
+	struct drm_device *dev;
+	resource_size_t vram_available;
+	int ret;
+
+	mdev = devm_drm_dev_alloc(&pdev->dev, drv, struct mga_device, base);
+
+	if (IS_ERR(mdev))
+		return mdev;
+	dev = &mdev->base;
+
+	pci_set_drvdata(pdev, dev);
+
+	ret = mgag200_init_pci_options(pdev, 0x00000120, 0x0000b000);
+	if (ret)
+		return ERR_PTR(ret);
+
+	ret = mgag200_device_preinit(mdev);
+	if (ret)
+		return ERR_PTR(ret);
+
+	ret = mgag200_device_init(mdev, &mgag200_g200eh5_device_info,
+				  &mgag200_g200eh5_device_funcs);
+
+	if (ret)
+		return ERR_PTR(ret);
+
+	mgag200_g200eh_init_registers(mdev); // same as G200EH
+	vram_available = mgag200_device_probe_vram(mdev);
+
+	ret = mgag200_mode_config_init(mdev, vram_available);
+	if (ret)
+		return ERR_PTR(ret);
+
+	ret = mgag200_g200eh5_pipeline_init(mdev);
+	if (ret)
+		return ERR_PTR(ret);
+
+	drm_mode_config_reset(dev);
+	drm_kms_helper_poll_init(dev);
+
+	return mdev;
+}
-- 
2.34.1
