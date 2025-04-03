Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45BC222A804;
	Thu,  3 Apr 2025 19:18:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743707922; cv=none; b=e5NOweOBIaESAlWIU+JzYBQZ9y9jVz39KkEiAivr+SlISFToCk8akPYFUGpNKV7YYV+iZmC94fJ0tCNs050YEZo24vu7I6b75+nEqUHOQLVmjrZf1VMh2MGxv4qhPRnalRxWpJOBkKBlpNFqvsdZYuT2EFp1JP8wWz3DfIYDvfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743707922; c=relaxed/simple;
	bh=/m5bVa6TpCzS6RGtpo9/JUJxy4QwEAhGF+KqMsUtHqQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hjreF0mtBsQ7yRxTRqg0Kd0RtumzCwoIQ+Fi2NGIaejmJYMry+2wGmV2qb/HAX5CY94dbari5r5Lk8mPtj/65k6BGCa0aRALUMAT5bJpA3eMYZ32VveXpcVx+SXioXm+2KxpBe+vKBrbtsW/3zNZc3lsRwTKJLPTfU7UruyqIdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MRPnPuE5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MRPnPuE5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6BC5C4CEE3;
	Thu,  3 Apr 2025 19:18:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743707922;
	bh=/m5bVa6TpCzS6RGtpo9/JUJxy4QwEAhGF+KqMsUtHqQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MRPnPuE5Gx6Boa3EVF3PqiUaS75KZsEISihnHxkI63dZkmq6nJNim8aSgBNLzpOq+
	 nZW0WmuHdCnyW9Vqp/D4StRGUtZ0Fr/M8zGQ0aT2+//49bZ8/v0LMqPKsjfSpPxgUU
	 Nx5bECYoh/cBA44PqLD2OCX2hBzvhSE7V6Gy7iqrRPk/NQp/4kAXQfmMpVot/4Sst/
	 H/Hhp/RdGpkYAXsg8g2emdDlSgTjFhd0z+ONRLuldiucHkZFnUpcChCG6bHXEDSCCV
	 MktBmCJQ9snHw5goWl+rRGCJuE4fQz9OWntwxGcCbGqKprTJvWJrLxva2hDZLURu9O
	 Ob9GWg7XJbDag==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Andrew Wyatt <fewtarius@steamfork.org>,
	John Edwards <uejji@uejji.net>,
	=?UTF-8?q?Jo=C3=A3o=20Pedro=20Kurtz?= <joexkurtz@gmail.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Hans de Goede <hdegoede@redhat.com>,
	Sasha Levin <sashal@kernel.org>,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	airlied@gmail.com,
	simona@ffwll.ch,
	dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.6 08/23] drm: panel-orientation-quirks: Add quirk for OneXPlayer Mini (Intel)
Date: Thu,  3 Apr 2025 15:18:01 -0400
Message-Id: <20250403191816.2681439-8-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250403191816.2681439-1-sashal@kernel.org>
References: <20250403191816.2681439-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.85
Content-Transfer-Encoding: 8bit

From: Andrew Wyatt <fewtarius@steamfork.org>

[ Upstream commit b24dcc183583fc360ae0f0899e286a68f46abbd0 ]

The Intel model of the OneXPlayer Mini uses a 1200x1920 portrait LCD panel.
The DMI strings are the same as the OneXPlayer, which already has a DMI
quirk, but the panel is different.

Add a DMI match to correctly rotate this panel.

Signed-off-by: Andrew Wyatt <fewtarius@steamfork.org>
Co-developed-by: John Edwards <uejji@uejji.net>
Signed-off-by: John Edwards <uejji@uejji.net>
Tested-by: João Pedro Kurtz <joexkurtz@gmail.com>
Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Hans de Goede <hdegoede@redhat.com>
Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Link: https://patchwork.freedesktop.org/patch/msgid/20250213222455.93533-6-uejji@uejji.net
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/drm_panel_orientation_quirks.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/drm_panel_orientation_quirks.c b/drivers/gpu/drm/drm_panel_orientation_quirks.c
index 12d547f093bd2..036b095c98882 100644
--- a/drivers/gpu/drm/drm_panel_orientation_quirks.c
+++ b/drivers/gpu/drm/drm_panel_orientation_quirks.c
@@ -129,6 +129,12 @@ static const struct drm_dmi_panel_orientation_data lcd1080x1920_rightside_up = {
 	.orientation = DRM_MODE_PANEL_ORIENTATION_RIGHT_UP,
 };
 
+static const struct drm_dmi_panel_orientation_data lcd1200x1920_leftside_up = {
+	.width = 1200,
+	.height = 1920,
+	.orientation = DRM_MODE_PANEL_ORIENTATION_LEFT_UP,
+};
+
 static const struct drm_dmi_panel_orientation_data lcd1200x1920_rightside_up = {
 	.width = 1200,
 	.height = 1920,
@@ -473,6 +479,12 @@ static const struct dmi_system_id orientation_data[] = {
 		  DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "ONE XPLAYER"),
 		},
 		.driver_data = (void *)&lcd1600x2560_leftside_up,
+	}, {	/* OneXPlayer Mini (Intel) */
+		.matches = {
+		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "ONE-NETBOOK TECHNOLOGY CO., LTD."),
+		  DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "ONE XPLAYER"),
+		},
+		.driver_data = (void *)&lcd1200x1920_leftside_up,
 	}, {	/* OrangePi Neo */
 		.matches = {
 		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "OrangePi"),
-- 
2.39.5

