Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 091BD28314A
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 15:14:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750864489; cv=none; b=hqO16bRVQl8bp8uP8FLaZIdxaEo2p4rPecQczwMFeOh6b9xmF2VHhdg4VyhCTeClEIi4d9tJWPOgzaJKJgUyLlizzTg+cU21r/LoL1mXj8eZnjny6kBxc9u/rVWhXQLj2Ew+j0PKGFp1yCgM62vb0TT2AwFfLh8LJ5RLwylcWY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750864489; c=relaxed/simple;
	bh=Vthh/L3MebKKagJT+09Dvf4YTj8xAm67xpaVjQwLZmw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VP6okQqZAI174QAiFv276e5Ttsy0fXG3mzv7L2dCKntTGVwUdsPhRQhu1U2VQV5Q7dm0AMBATeFKe0CUKjo1v+pT7hlYpi6R83ue2gqgbztkcHbq1p0wCoE0P/DbwoRshsxK90MyO/47/ImBXLKLzJCG79GARu6GQiVPAn8kTIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Tno2wOHr; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Tno2wOHr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B9CAC4CEEB;
	Wed, 25 Jun 2025 15:14:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750864488;
	bh=Vthh/L3MebKKagJT+09Dvf4YTj8xAm67xpaVjQwLZmw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Tno2wOHrZj5HFIf1O/ds59YErXaXRfduVqsLnRW4SmES9tU2vzztj4Bo5dUDxDeAi
	 R8ZQUENimLHK2fZ9S01H5I0yguAKTfFgQmlWjxhN2ctR1HXVyIwWwtu9IHjcQMM83f
	 zELLA1uaYSb1NtZASKvj52+X5Xc0niH7DwgjkEnR7GlbLJJ6BlLLcWH1X5jTAwM8Rb
	 uEKpj9OKabtN/v3EYEY11g48NJJoqE/TEiaCExLijvc818YRnlrMVBQ8tVN/iQQyIm
	 Nb3RxM1BPztXQbUefKGPe57NOwedEIoi5i0JoGpkaU0uxBhLm57DNBskHw+f/oPa80
	 3YaaBZATgXppA==
From: Maxime Ripard <mripard@kernel.org>
Date: Wed, 25 Jun 2025 17:14:37 +0200
Subject: [PATCH 3/3] drm/tests: edid: Add edid-decode --check output
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250625-drm-update-edid-v1-3-2d963743ab9e@kernel.org>
References: <20250625-drm-update-edid-v1-0-2d963743ab9e@kernel.org>
In-Reply-To: <20250625-drm-update-edid-v1-0-2d963743ab9e@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: Dmitry Baryshkov <lumag@kernel.org>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5845; i=mripard@kernel.org;
 h=from:subject:message-id; bh=Vthh/L3MebKKagJT+09Dvf4YTj8xAm67xpaVjQwLZmw=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDBkxQrHGpXxnizZkRxvH6Agd03i7TPCBRbbi7bJ07lKT/
 2futMzqmMrCIMzJICumyPJEJuz08vbFVQ72K3/AzGFlAhnCwMUpABN5WMtYX7D22tXNx3YuS79k
 dNK/gT+E1f7PGuW7q+a+uLJdmOsXc8DHyyvdrc59sC4JEpZteCeoxVjD9S3LfbOKyH/O9gOWDjN
 51qfxKfYKtnVU66hL8Gw3eJvNt+R8NKe8wzauNc1ns9UOxAMA
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

Some of our EDIDs are (rightfully) invalid, but most of them should be
valid.

Let's add the edid-decode --check of these EDIDs when they were
generated, so we know what to expect going forward, and a comment to
explicitly mention when we expect them to be broken.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/tests/drm_kunit_edid.h | 51 ++++++++++++++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/drivers/gpu/drm/tests/drm_kunit_edid.h b/drivers/gpu/drm/tests/drm_kunit_edid.h
index 14782a3840f00c50c7daee38bba98585003c13a2..34395bbb912f0919e17a7093624170dd278a87f4 100644
--- a/drivers/gpu/drm/tests/drm_kunit_edid.h
+++ b/drivers/gpu/drm/tests/drm_kunit_edid.h
@@ -44,10 +44,17 @@
  *     Display Product Name: 'Test EDID'
  *     Display Range Limits:
  *       Monitor ranges (GTF): 50-70 Hz V, 30-70 kHz H, max dotclock 150 MHz
  *     Dummy Descriptor:
  * Checksum: 0xab
+ *
+ * ----------------
+ *
+ * edid-decode 1.30.0-5367
+ * edid-decode SHA: 41ebf7135691 2025-05-01 10:19:22
+ *
+ * EDID conformity: PASS
  */
 static const unsigned char test_edid_dvi_1080p[] = {
 	0x00, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0x00, 0x31, 0xd8, 0x2a, 0x00,
 	0x00, 0x00, 0x00, 0x00, 0x00, 0x21, 0x01, 0x03, 0x81, 0xa0, 0x5a, 0x78,
 	0x0a, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
@@ -60,10 +67,14 @@ static const unsigned char test_edid_dvi_1080p[] = {
 	0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
 	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xab
 };
 
 /*
+ *
+ * This edid is intentionally broken with the 100MHz limit. It's meant
+ * to be used only with tests in unusual situations.
+ *
  * edid-decode (hex):
  *
  * 00 ff ff ff ff ff ff 00 31 d8 2a 00 00 00 00 00
  * 00 21 01 03 81 a0 5a 78 02 00 00 00 00 00 00 00
  * 00 00 00 20 00 00 01 01 01 01 01 01 01 01 01 01
@@ -134,10 +145,22 @@ static const unsigned char test_edid_dvi_1080p[] = {
  *     CE scan behavior: Always Underscanned
  *   Vendor-Specific Data Block (HDMI), OUI 00-0C-03:
  *     Source physical address: 1.2.3.4
  *     Maximum TMDS clock: 100 MHz
  * Checksum: 0x10  Unused space in Extension Block: 106 bytes
+ *
+ * ----------------
+ *
+ * edid-decode 1.30.0-5367
+ * edid-decode SHA: 41ebf7135691 2025-05-01 10:19:22
+ *
+ * Failures:
+ *
+ * EDID:
+ *   CTA-861: The maximum HDMI TMDS clock is 100000 kHz, but one or more video timings go up to 148500 kHz.
+ *
+ * EDID conformity: FAIL
  */
 static const unsigned char test_edid_hdmi_1080p_rgb_max_100mhz[] = {
 	0x00, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0x00, 0x31, 0xd8, 0x2a, 0x00,
 	0x00, 0x00, 0x00, 0x00, 0x00, 0x21, 0x01, 0x03, 0x81, 0xa0, 0x5a, 0x78,
 	0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x20,
@@ -235,10 +258,17 @@ static const unsigned char test_edid_hdmi_1080p_rgb_max_100mhz[] = {
  *     CE scan behavior: Always Underscanned
  *   Vendor-Specific Data Block (HDMI), OUI 00-0C-03:
  *     Source physical address: 1.2.3.4
  *     Maximum TMDS clock: 200 MHz
  * Checksum: 0xfc  Unused space in Extension Block: 106 bytes
+ *
+ * ----------------
+ *
+ * edid-decode 1.30.0-5367
+ * edid-decode SHA: 41ebf7135691 2025-05-01 10:19:22
+ *
+ * EDID conformity: PASS
  */
 static const unsigned char test_edid_hdmi_1080p_rgb_max_200mhz[] = {
 	0x00, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0x00, 0x31, 0xd8, 0x2a, 0x00,
 	0x00, 0x00, 0x00, 0x00, 0x00, 0x21, 0x01, 0x03, 0x81, 0xa0, 0x5a, 0x78,
 	0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x20,
@@ -336,10 +366,17 @@ static const unsigned char test_edid_hdmi_1080p_rgb_max_200mhz[] = {
  *     CE scan behavior: Always Underscanned
  *   Vendor-Specific Data Block (HDMI), OUI 00-0C-03:
  *     Source physical address: 1.2.3.4
  *     Maximum TMDS clock: 340 MHz
  * Checksum: 0xe0  Unused space in Extension Block: 106 bytes
+ *
+ * ----------------
+ *
+ * edid-decode 1.30.0-5367
+ * edid-decode SHA: 41ebf7135691 2025-05-01 10:19:22
+ *
+ * EDID conformity: PASS
  */
 static const unsigned char test_edid_hdmi_1080p_rgb_max_340mhz[] = {
 	0x00, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0x00, 0x31, 0xd8, 0x2a, 0x00,
 	0x00, 0x00, 0x00, 0x00, 0x00, 0x21, 0x01, 0x03, 0x81, 0xa0, 0x5a, 0x78,
 	0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x20,
@@ -443,10 +480,17 @@ static const unsigned char test_edid_hdmi_1080p_rgb_max_340mhz[] = {
  *     DC_36bit
  *     DC_30bit
  *     DC_Y444
  *     Maximum TMDS clock: 200 MHz
  * Checksum: 0xd4  Unused space in Extension Block: 106 bytes
+ *
+ * ----------------
+ *
+ * edid-decode 1.30.0-5367
+ * edid-decode SHA: 41ebf7135691 2025-05-01 10:19:22
+ *
+ * EDID conformity: PASS
  */
 static const unsigned char test_edid_hdmi_1080p_rgb_yuv_dc_max_200mhz[] = {
 	0x00, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0x00, 0x31, 0xd8, 0x2a, 0x00,
 	0x00, 0x00, 0x00, 0x00, 0x00, 0x21, 0x01, 0x03, 0x81, 0xa0, 0x5a, 0x78,
 	0x1a, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x20,
@@ -550,10 +594,17 @@ static const unsigned char test_edid_hdmi_1080p_rgb_yuv_dc_max_200mhz[] = {
  *     DC_36bit
  *     DC_30bit
  *     DC_Y444
  *     Maximum TMDS clock: 340 MHz
  * Checksum: 0xb8  Unused space in Extension Block: 106 bytes
+ *
+ * ----------------
+ *
+ * edid-decode 1.30.0-5367
+ * edid-decode SHA: 41ebf7135691 2025-05-01 10:19:22
+ *
+ * EDID conformity: PASS
  */
 static const unsigned char test_edid_hdmi_1080p_rgb_yuv_dc_max_340mhz[] = {
 	0x00, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0x00, 0x31, 0xd8, 0x2a, 0x00,
 	0x00, 0x00, 0x00, 0x00, 0x00, 0x21, 0x01, 0x03, 0x81, 0xa0, 0x5a, 0x78,
 	0x0a, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x20,

-- 
2.49.0

