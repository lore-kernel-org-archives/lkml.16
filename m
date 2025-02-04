Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80A78218858
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 15:00:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738681256; cv=none; b=V6oELe26G6td7tmB8rHZqO9sgd5KZ+mfu3VWXi5vZIsWzDjJZWzXaAvtV1nk0Zto0Y620yxQhuthUOh+63klhVCDR4j6Xhu1D/8P2IKICovLp8Tv1sR0cn9bVKAXn6NzMLZ73wkxioDGz9OhseR+BIEZf9lNYE3LWR3T/A87QE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738681256; c=relaxed/simple;
	bh=dVVSqhEjCDXw9391XwgMOugJcxOfDSIJu4GCSZhaJlw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hSYEbxjdw+dGQ2vXH1+PN6oXBlsj+boobhW7iJpAtkOa1hiHm1fV7m7i4yp97yXbU+pRLVpJZJTpS4Qv6vcgkDLmfoe4bkLEh4wCoXuHyiFVrLS47motFFd1IVXl07gnuI2R+RDlhL4Y2i9QXsOS4tiBAi1d6J5LpKqN3Mvq4j8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XGGfdIge; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XGGfdIge"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0FFD7C4CEDF;
	Tue,  4 Feb 2025 15:00:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738681256;
	bh=dVVSqhEjCDXw9391XwgMOugJcxOfDSIJu4GCSZhaJlw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=XGGfdIgeVBmK7L97DIYzeAYAD2C/o039YVVw7KVVLu6L/rUl8biZMC24IKITEF/3s
	 dP0x4RiImXyDhKSOk+PhGJxySk4139Uc22eb9BXXnzdR1He+m751rR5HvPRSjgZrNZ
	 Tbc5J30d365acn77aCMDvl9OSENohfvOuf3wI+6ibKkK6shXit6+mrhEMwgRe3TTjM
	 oHMNQoyR6Y/I/g/u61mPqWWFUkxSuvRNf87gGQKN++25ckfJ+bUHZYvB736KA6Zr0y
	 LIasEpNYEzPebdH7gR3sG0f7NuSSWz3m1L/BJUcE9bIrePQUwoczqZV4IGfUuSu4/X
	 Vi257FVV0TsBg==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 04 Feb 2025 15:57:59 +0100
Subject: [PATCH v2 31/35] drm/bridge: Make encoder pointer deprecated
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250204-bridge-connector-v2-31-35dd6c834e08@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1482; i=mripard@kernel.org;
 h=from:subject:message-id; bh=dVVSqhEjCDXw9391XwgMOugJcxOfDSIJu4GCSZhaJlw=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDOmLtL4Z9qixbHkppHsp3LTxdWfkwt3GCkmx3tOX5+/Ni
 TtwbVtHx1QWBmFOBlkxRZYnMmGnl7cvrnKwX/kDZg4rE8gQBi5OAZjI6WDGhk991191q2b+zWwN
 /cN828XmuGxW8/u9k7cUmn9e5DqD4+m89/2XtzrvWufRHTN5ze9ngowNrydfP8qt+Yc71aSsov/
 5xmfb+/i9/28Oa3vC4ajmbbHpX6PnXLvmYO+9k3bmhn34b94EAA==
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

Other entities (drm_connector.crtc, drm_encoder.crtc, etc.) have
pointer to other currently bound entities. They are all considered
relevant only for non-atomic drivers, and generally perceived as
deprecated in favour of the equivalent pointers in the atomic states.

It used to be useful because we didn't have alternatives, but now that
we do, let's make sure it's done for drm_bridge.encoder too.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 include/drm/drm_bridge.h | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index 7a3664770c3ab8634a69e953b37a30ac467139b3..80ca28af4c56449ffa760c198c3016b456f1f346 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -822,12 +822,18 @@ enum drm_bridge_ops {
 struct drm_bridge {
 	/** @base: inherit from &drm_private_object */
 	struct drm_private_obj base;
 	/** @dev: DRM device this bridge belongs to */
 	struct drm_device *dev;
-	/** @encoder: encoder to which this bridge is connected */
+
+	/** @encoder:
+	 *
+	 * encoder to which this bridge is connected. Only meaningful
+	 * for non-atomic drivers. Deprecated.
+	 */
 	struct drm_encoder *encoder;
+
 	/** @chain_node: used to form a bridge chain */
 	struct list_head chain_node;
 	/** @of_node: device node pointer to the bridge */
 	struct device_node *of_node;
 	/** @list: to keep track of all added bridges */

-- 
2.48.0

