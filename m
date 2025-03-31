Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61F5F7081C
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 17:03:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743440618; cv=none; b=cChUDIoyi99qX8JwBsJBs5zH4v1x4fMbAwNzvbVDtyjd/bUUo5s+ifQ2ennk3JtrdizXRNIbbsd98b6E5PQwuz9/juYHvnqZZNVh4IhwddJ3Oc1rVacIcYI9zfjim8Tm4G5zG6d8ZG+EpNBFSxYAYsudTOQ4Avk2h6HZIGQq8SM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743440618; c=relaxed/simple;
	bh=zYUBTx3mP3FxfTSGErZ2JJwH6vnMYKAlrU3a0Dl0ZXk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Srgx1T8MR9L/FlqJajDLAmZ62h5XPKIs3Sjqj5LPjOnm+eU29Nq2kixI7SY3Uj5rZmdjq6I8Zl2dI6kXMaLsmdn9V+RPVzDyon+LwjN1tFRqVz5dp8rUJ3/Ktnwj3lxudvI6T7Mdcaq/zUVMlHWNiXa5VLe/BK0I28jaNpXCXz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PRrAmqNg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PRrAmqNg"
Received: by smtp.kernel.org (Postfix) with ESMTPS id C5AF5C4CEE3;
	Mon, 31 Mar 2025 17:03:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743440617;
	bh=zYUBTx3mP3FxfTSGErZ2JJwH6vnMYKAlrU3a0Dl0ZXk=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=PRrAmqNgtIDA+kR0ViCSFkcepfjq0kq2B8xNNSLfZ4a4zR2FpL4a/+OvHH4h1akhp
	 cC3OSOEvWDU0Oj8kpauJwB1b2sTcRS1n7UcWjtkHaeATA75qQYqhOTch08nDYQ6IAK
	 EMulF4yRDFLpJAiK8woJrA17HHST2OOtnhc2dbOgsCAjgEW9h5VEGBkZcQw619a4dt
	 ceONc12PmdsTG7vFcsWFTDGS+Jyu6zl5TtDd09h7i+z0FtZ+6BcyvZ63bwOTFR5Do2
	 XGh7BHBbmE86alGI0E0yUy1pNd9F7/XEYIhLRjckdiqpMIUIQYfLJbJjn5fN2AbghU
	 5ZV7kFVYBOvYw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0F56C3600B;
	Mon, 31 Mar 2025 17:03:37 +0000 (UTC)
From: Mark Dietzer via B4 Relay <devnull+git.doridian.net@kernel.org>
Date: Mon, 31 Mar 2025 10:03:33 -0700
Subject: [PATCH v3] drm: panel-backlight-quirks: Add Framework 16 panel
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250331-framework16-drm-quirks-v3-1-7fd29770a918@doridian.net>
X-B4-Tracking: v=1; b=H4sIAOXK6mcC/4WOQW7DIBBFrxKx7lhAbAxd5R5VFgSGepRi3MF1W
 0W+e4kv0M2X3uI/vYeoyIRVvJ4egnGjSmVucH45iTD5+R2BYmOhpR6k1hYS+4zfhe/KQOQMn1/
 E9wpjfxtslHI8WyPaeWFM9HOI366NE5cM68ToD50KzlilEPo49NBb6eEWpGsTtXMOLRpz8cvSJ
 V/X7OmjCyU/vRPVtfDv0bvpp/3ftE2DgjAmn6xJA7p4iYUpkp+7GVdx3ff9D8XlE+8HAQAA
X-Change-ID: 20250228-framework16-drm-quirks-74b58d007386
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Mark Dietzer <git@doridian.net>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1743440617; l=1963;
 i=git@doridian.net; s=20250228; h=from:subject:message-id;
 bh=ZU/61npGl+rwUoUEE7wnye9HmuwhwaVSQG0fvTUZY9k=;
 b=8cNITSsSusv0HSWzqGUPM3xOgLyl5BeDJyoHuVZMAJik6fSOLLTq4zTFDMXsj5MLfJEtXbeZE
 3n6etJtw7WbAPeF+zTDTX6GnDHDArlR3+lK58lLwozmr4tSAg296RSn
X-Developer-Key: i=git@doridian.net; a=ed25519;
 pk=XY9bZ7EBhoLNoRt6zd2/vutpAXC3tsX6OytpZHjbUsQ=
X-Endpoint-Received: by B4 Relay for git@doridian.net/20250228 with
 auth_id=353
X-Original-From: Mark Dietzer <git@doridian.net>
Reply-To: git@doridian.net

From: Mark Dietzer <git@doridian.net>

Similarly for the Framework 13 panels already handled in those quirks,
the 16 can be helped by the same kind of patch.

I have run this on my own 16 for multiple months (hard coding the value to
0 before the quirks made it upstream) and it has resulted in a darker
minimum brightness (as expected) and no issues.

The Framework community threads between the 13 and 16 for this improvement
are the same one, so user reports in the link below will be mixed and
likely more focused on the 13.

Link: https://community.frame.work/t/solved-even-lower-screen-brightness/25711/60

Signed-off-by: Mark Dietzer <git@doridian.net>
Reviewed-by: Thomas Weißschuh <linux@weissschuh.net>
---
Changes in v3:
- Fix the EDID, first submission was incorrect
- Link to v2: https://lore.kernel.org/r/20250228-framework16-drm-quirks-v2-1-c7faf86f5e9d@doridian.net
---
 drivers/gpu/drm/drm_panel_backlight_quirks.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/drm_panel_backlight_quirks.c b/drivers/gpu/drm/drm_panel_backlight_quirks.c
index c477d98ade2b41314d4218281ced7d3c4d087769..1370fd02f0e0667ef8ec76839d415092102e02c8 100644
--- a/drivers/gpu/drm/drm_panel_backlight_quirks.c
+++ b/drivers/gpu/drm/drm_panel_backlight_quirks.c
@@ -41,6 +41,14 @@ static const struct drm_panel_min_backlight_quirk drm_panel_min_backlight_quirks
 		.ident.name = "NE135A1M-NY1",
 		.min_brightness = 0,
 	},
+	/* 16 inch panel */
+	{
+		.dmi_match.field = DMI_BOARD_VENDOR,
+		.dmi_match.value = "Framework",
+		.ident.panel_id = drm_edid_encode_panel_id('B', 'O', 'E', 0x0bc9),
+		.ident.name = "NE160QDM-NZ6",
+		.min_brightness = 0,
+	},
 };
 
 static bool drm_panel_min_backlight_quirk_matches(const struct drm_panel_min_backlight_quirk *quirk,

---
base-commit: 76544811c850a1f4c055aa182b513b7a843868ea
change-id: 20250228-framework16-drm-quirks-74b58d007386

Best regards,
-- 
Mark Dietzer <git@doridian.net>


