Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7995E13633F;
	Fri, 25 Apr 2025 15:45:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745595922; cv=none; b=siHRhaMtHt/ixY2wJmOnyysO3D7Hf5XnX4U4uLz9xWsmcwcEph9evpP86PoolP/TZcd0oaQXWf4OBRUtZF6OEzozaFRSq5qy+m24c5vLn/fN2pQF8D+Ay5PiexkRiae5/ISFqCGstpR+vNGLUSHCMGo8Kz0asgX0Xu+fj6GlQLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745595922; c=relaxed/simple;
	bh=sRi/0qV3JSGKETAC4Fwxq3NckwzSxUNJJwotSy9MGQ4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Y7TM3HkfDtb5kP4I1nc9/MMhgMugHfpPV/ifiddn55gfmAuv8PpL07y6jT04LwkwQ45ggevsFcUlMmXA5bRqyjqln3KDQ5j32NOciXRygo7nKx/cBwydZqSPMKgT/Wy93Ciko7ErFaQkim99Tpk4WzJpT5nrW9niOZySoyQeEtg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=twGtmhGW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="twGtmhGW"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 04D42C4CEE9;
	Fri, 25 Apr 2025 15:45:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745595922;
	bh=sRi/0qV3JSGKETAC4Fwxq3NckwzSxUNJJwotSy9MGQ4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=twGtmhGWY3mybCMLhxRq4h47cvBaMi+GCAHTuKhEMFrBgXm/m56vvm/OJkXAS3hns
	 lKIBlZz2x7R3wBvUtwnqkillcN/3xjRPfcNPasX0+RzOYFQU9U8v4wAP+ATxpKofo1
	 /rUF/QYBGa4P5/5bXpCMMNCY+5EtOMtS8VQe3KrEdY573ZiLrB6LHIZlOxutYPL0YG
	 Tg7XAl7ZzfehYPfjAmuP74HvLyinG3IQeoZf/2yINtFJzZHf7CJkDhwm1d9mgfU8zL
	 AyUOvzDRBxsSF3qkNoz3nuEpRfiZ6QnJhHAtD3oI66Qluut45UBpgm6pQ6lJN/X0NX
	 KxX9+5VoqeIxg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8276C369D3;
	Fri, 25 Apr 2025 15:45:21 +0000 (UTC)
From: Kurt Borja via B4 Relay <devnull+kuurtb.gmail.com@kernel.org>
Date: Fri, 25 Apr 2025 12:45:06 -0300
Subject: [PATCH 1/2] platform/x86: alienware-wmi-wmax: Fix uninitialized
 bitmap in awcc_hwmon_fans_init()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250425-temp-id-fix-v1-1-372d71f732bf@gmail.com>
References: <20250425-temp-id-fix-v1-0-372d71f732bf@gmail.com>
In-Reply-To: <20250425-temp-id-fix-v1-0-372d71f732bf@gmail.com>
To: =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Hans de Goede <hdegoede@redhat.com>, Armin Wolf <W_Armin@gmx.de>
Cc: platform-driver-x86@vger.kernel.org, Dell.Client.Kernel@dell.com, 
 linux-kernel@vger.kernel.org, Kurt Borja <kuurtb@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1295; i=kuurtb@gmail.com;
 h=from:subject:message-id;
 bh=g/Dk2JpTbYSEVwfZMItolcD7wZ6KOPVE70YJFfQTbXY=;
 b=owGbwMvMwCUmluBs8WX+lTTG02pJDBnc6wR23FvxjPv7lsB6jq+tLVcs33P/PK+0l0comK3OK
 VIqv7+5o5SFQYyLQVZMkaU9YdG3R1F5b/0OhN6HmcPKBDKEgYtTACZy4B3Df5+gtodLub/pfVIR
 XM+w4Dd/sViQ7xIpHjmh6aeeflKfvofhv//ND522DctXJl+SWL9WZ93VDW3P3rnb6p5TD5XsNJ+
 fygEA
X-Developer-Key: i=kuurtb@gmail.com; a=openpgp;
 fpr=54D3BE170AEF777983C3C63B57E3B6585920A69A
X-Endpoint-Received: by B4 Relay for kuurtb@gmail.com/default with
 auth_id=387
X-Original-From: Kurt Borja <kuurtb@gmail.com>
Reply-To: kuurtb@gmail.com

From: Kurt Borja <kuurtb@gmail.com>

Initialize fan_temps bitmap to zero before using it for the first time
in each iteration.

Fixes: d69990783495 ("platform/x86: alienware-wmi-wmax: Add HWMON support")
Signed-off-by: Kurt Borja <kuurtb@gmail.com>
---
 drivers/platform/x86/dell/alienware-wmi-wmax.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/dell/alienware-wmi-wmax.c b/drivers/platform/x86/dell/alienware-wmi-wmax.c
index faeddfe3b79e0aa51e7c8c6b23aa4ac5c7218706..27e5b0b23c27356cd5d72dbc5d3b5b4bdb03e8af 100644
--- a/drivers/platform/x86/dell/alienware-wmi-wmax.c
+++ b/drivers/platform/x86/dell/alienware-wmi-wmax.c
@@ -1027,6 +1027,8 @@ static int awcc_hwmon_fans_init(struct wmi_device *wdev)
 		if (ret)
 			return ret;
 
+		bitmap_zero(fan_temps, AWCC_ID_BITMAP_SIZE);
+
 		for (j = 0; j < temp_count; j++) {
 			ret = awcc_get_fan_sensors(wdev, AWCC_OP_GET_FAN_TEMP_ID,
 						   id, j, &temp_id);
@@ -1048,8 +1050,6 @@ static int awcc_hwmon_fans_init(struct wmi_device *wdev)
 		bitmap_gather(gather, fan_temps, priv->temp_sensors, AWCC_ID_BITMAP_SIZE);
 		bitmap_copy(&fan_data->auto_channels_temp, gather, BITS_PER_LONG);
 		priv->fan_data[i] = fan_data;
-
-		bitmap_zero(fan_temps, AWCC_ID_BITMAP_SIZE);
 	}
 
 	return 0;

-- 
2.49.0


