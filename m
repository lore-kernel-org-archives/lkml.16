Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EAFD215192
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 15:00:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738681243; cv=none; b=N7byuVbX87uNYLgf7x8aNBMn5rophQwjbazgoz5bU8eJGZMfbzqGgbLxoxuS8imocTfnh968WnRG6LDZm8vI12pa/hEay1ricjQZFLxUGpEolbpNRalOUBrqlNb9WMT1a0c2kOFZqt+z0XgU3gHCTnGUIDIkhHBmKDiTG98Y/SI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738681243; c=relaxed/simple;
	bh=bDFzSB1N/8eD1Wxk9D/RS0yHlXy3r7EmA4MdBs3iBEk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IJ5E1s7HEg81whFqdsE23KVL09sY+0Cz1mpdRXc8Wa/nna8MGHz89XkFC7b47MH71LKUGMXp6iB1IM2r5sXIB1zXXf9xyTiv+eHXoTYvcMdwN7lm0o+YriDia3IiKbmo2Yj/gjew6W+cAvEV1TdvKVVklb6vm+TLVO+KCPD/jkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n/aQcFVX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n/aQcFVX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27F01C4CEDF;
	Tue,  4 Feb 2025 15:00:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738681243;
	bh=bDFzSB1N/8eD1Wxk9D/RS0yHlXy3r7EmA4MdBs3iBEk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=n/aQcFVXKsyEzg+xqZ9yIlCk618BRZ6bCFxh0VQWF3zd5/n7EHGu/yhyvhhu1TQlY
	 Lc134NmJnH1TCEZS87CF3p8y8XyLFsQf6eB2CP9xU3qU6FNMxY/6WETS/SSX0p7Zr5
	 Mg9OOpDK05TE/9bVwFINLsE7eVGZxFWvphKSvJGTQ/ZWfYsvgem+dycj8QJ8XCqwPP
	 AHIQiPXUvvufwx6LdwjXAcxmnlu22wJh/Jr3jtFoxaaUtVU4aRicBUX57+YsPcZb4y
	 y00uo698jCmY97C0BOvijTcIvCqc4yDhNqlmUAjgylPLu9QYq/K09vEf3XT1TRxGZD
	 GZVF9Z+RtlE7g==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 04 Feb 2025 15:57:57 +0100
Subject: [PATCH v2 29/35] drm/bridge: Assume that a bridge is atomic if it
 has atomic_reset
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250204-bridge-connector-v2-29-35dd6c834e08@kernel.org>
References: <20250204-bridge-connector-v2-0-35dd6c834e08@kernel.org>
In-Reply-To: <20250204-bridge-connector-v2-0-35dd6c834e08@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Douglas Anderson <dianders@chromium.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1718; i=mripard@kernel.org;
 h=from:subject:message-id; bh=bDFzSB1N/8eD1Wxk9D/RS0yHlXy3r7EmA4MdBs3iBEk=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDOmLtL56rOlbvCWtTG2bx7KcM2+mmL0MFsvryVn17/vzm
 Ojnizf87JjKwiDMySArpsjyRCbs9PL2xVUO9it/wMxhZQIZwsDFKQAT8U1nrLNz489LaN71sLiu
 edIKV6ueqH+f7s9O13FgTXEN47twLO53q24dy6859queJhyNrTt9grE+Ky/efPHZeK+Z7LEZF8z
 C6z59Le9pmFj6y+bPxlNFjQKf7x+Y2urtXtCkaaSUxnzCbwoA
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

A bridge is considered atomic-enabled if it has an atomic_check
implementation. However, atomic_check is optional and thus a driver
might very well not provide an implementation, and yet still be atomic.

Switch to atomic_reset, which allocates the initial bridge state and is
thus a better candidate.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/drm_bridge.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index d7c17a26e86fd9a3e5a39f335edff4ffce30dd79..ad91a0ac375a9c8cf82834354ec7f654a59a7292 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -794,23 +794,25 @@ EXPORT_SYMBOL(drm_atomic_bridge_chain_enable);
 
 static int drm_atomic_bridge_check(struct drm_bridge *bridge,
 				   struct drm_crtc_state *crtc_state,
 				   struct drm_connector_state *conn_state)
 {
-	if (bridge->funcs->atomic_check) {
+	if (bridge->funcs->atomic_reset) {
 		struct drm_bridge_state *bridge_state;
 		int ret;
 
 		bridge_state = drm_atomic_get_new_bridge_state(crtc_state->state,
 							       bridge);
 		if (WARN_ON(!bridge_state))
 			return -EINVAL;
 
-		ret = bridge->funcs->atomic_check(bridge, bridge_state,
-						  crtc_state, conn_state);
-		if (ret)
-			return ret;
+		if (bridge->funcs->atomic_check) {
+			ret = bridge->funcs->atomic_check(bridge, bridge_state,
+							  crtc_state, conn_state);
+			if (ret)
+				return ret;
+		}
 	} else if (bridge->funcs->mode_fixup) {
 		if (!bridge->funcs->mode_fixup(bridge, &crtc_state->mode,
 					       &crtc_state->adjusted_mode))
 			return -EINVAL;
 	}

-- 
2.48.0

