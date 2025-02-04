Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 132AC217F5C
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 15:00:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738681232; cv=none; b=mnXunt5QrZY6PQ806z3zjey6hGsq8uklYExi2pHmXl9tmTYyiZdnPAjeKVbV9WA8p3OJTkOSLPLrqnkNWudw2WhNnvyUqlUvMkrGTT89hOxw65ULRoMILhUnp3cJX+bAnk4Ne448hCp2T32R2uXEcnV/iKTychrg8gePWTyCrRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738681232; c=relaxed/simple;
	bh=SZ80RYYbOzS9KBgx+LvZ/ITH8QJeNJfXoz1zlA4N1ZM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Klm6norY4LLSvKj3rV2AcKume52BsD+AowXXfWYahX0Wa2chzLZN1/7CUJUKZdls5l8CT5Q5QrLwYauawGB5e2s2qsjkcS/O3pKpPGu7TscS7+lWxBRn7zF04ikU45eLE9c+frwLD3s5y+WyTHEHM8A89yZopANsOQOm7HisIgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a8XgoH16; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a8XgoH16"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F739C4CEE6;
	Tue,  4 Feb 2025 15:00:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738681231;
	bh=SZ80RYYbOzS9KBgx+LvZ/ITH8QJeNJfXoz1zlA4N1ZM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=a8XgoH16h0po1cDBCNjxTR3jinuLzvt9v9OJM8KP805TguPW/PRmzmfE/UGB+UPUt
	 sIAb475qR3ZPTbrQ2rmqgAB8rxVpPnYuPeFOwTCZWAoZ5R8HuJfYcfDwysm0YeSDPr
	 f8NhqUnfHA8oI8PHkrGA+xdYkETjivE1jptTR5IvKaVXVcaPZbub2h2HbzSXrP1ZsJ
	 BNAWHO6ojZSaHOwDSiUaOMka79q390SJkciwhStEvdnc7lVCYDRNYEc+LIZDDIx10C
	 mGnDpFauKERNtuNEyBO34QMdnupoWVGYDHjU9z0sIoZHSs1Xqlw2Vtk6f42PUu0Ecp
	 60iV6j9aEyRKQ==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 04 Feb 2025 15:57:56 +0100
Subject: [PATCH v2 28/35] drm/bridge: Provide a helper to retrieve current
 bridge state
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250204-bridge-connector-v2-28-35dd6c834e08@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1333; i=mripard@kernel.org;
 h=from:subject:message-id; bh=SZ80RYYbOzS9KBgx+LvZ/ITH8QJeNJfXoz1zlA4N1ZM=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDOmLtL7mvXArLK15Lan/rP39bPWwGSudk7sPSAusEF+vK
 CYrVW7bMZWFQZiTQVZMkeWJTNjp5e2LqxzsV/6AmcPKBDKEgYtTACYSUsrYsHqfmvYa4xPGr7xO
 HcjVuNahpS9V4CHtJe8oduLwKYds35pNvYZNqh23ezU0/58z8tFlrE/bGFUvPM90PqtFX+50i0V
 /Qr8zn3KVeuzwVOyLar3xfvEVC5N+X+OeHWYa27fXeVrPWQA=
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

The current bridge state is accessible from the drm_bridge structure,
but since it's fairly indirect it's not easy to figure out.

Provide a helper to retrieve it.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 include/drm/drm_bridge.h | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index cf7ab89e652a982510ae9df1f5972b9c6eb13cf2..7a3664770c3ab8634a69e953b37a30ac467139b3 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -955,10 +955,31 @@ static inline struct drm_bridge *of_drm_find_bridge(struct device_node *np)
 {
 	return NULL;
 }
 #endif
 
+/**
+ * @drm_bridge_get_current_state() - Get the current bridge state
+ * @bridge: bridge object
+ *
+ * This function must be called with the modeset lock held.
+ *
+ * RETURNS:
+ *
+ * The current bridge state, or NULL if there is none.
+ */
+static inline struct drm_bridge_state *
+drm_bridge_get_current_state(struct drm_bridge *bridge)
+{
+	lockdep_assert_held(&bridge->base.lock.mutex.base);
+
+	if (!bridge)
+		return NULL;
+
+	return drm_priv_to_bridge_state(bridge->base.state);
+}
+
 /**
  * drm_bridge_get_next_bridge() - Get the next bridge in the chain
  * @bridge: bridge object
  *
  * RETURNS:

-- 
2.48.0

