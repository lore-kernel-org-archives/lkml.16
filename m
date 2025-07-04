Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C6B623A58E
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 12:11:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751631064; cv=none; b=fzU1swU11h7lzP36u2ggZJMfpzzZhfMqf+mNmRNfRu0KEgA9pqh0cyjWzBpPuO0kuDLxvPM4FEoAMbj1nip9icBKTjCFH81QSsK9vfqpKcwJwWF1AcRIShy+wrymbnRuvOMV+Oq6kJdsAFOmIFWvfy+2rwrLTiPPheU+anTfcnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751631064; c=relaxed/simple;
	bh=s/BTvjGsLyWSyYcogYQCXg9SBj7pTxbZdItj3kmKrMg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Zi+QfnXHPTafcbLeH4PBE0JYtUV438Y0l4gECGh15Qq/4bnrJkrtQLxssZGVFnboKe3zMrbJDiV4jUxRQNjyv9XXmbvFj7c6L9nJY6/vaM+TIEpxQzP8FJKQikciEveeVcJLmsUP+Le8bEptZgOn8doeS4albD7YkBqgSMj2Ius=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=V59ghQFw; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="V59ghQFw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1751631060;
	bh=s/BTvjGsLyWSyYcogYQCXg9SBj7pTxbZdItj3kmKrMg=;
	h=From:Date:Subject:To:Cc:From;
	b=V59ghQFw7gERmdIzPGqBVyv1NCFX0NlwFbcCHPMdIKNGlW5gwLeW/vgNhDiPa5Qf9
	 LEmwH3o9xlFP9yvMiTPdair+7wMlZO6yss0PuBpZLa8urr8VL6hkL3mdZv1t1h4ro0
	 nf0MXdrNoIlUGJlw0++KMoWxWzX4EKPq7UoN1x0LA7F1gAoeot3myl4BCwEb2rJn0T
	 2VzeBmA5o+2WQuqtL+gs2dJQ/9aHnBBYaBqnwpHHKOXykt3SH4Am4Ags/8gItajMCd
	 yMk+Y/29m/4POZ0scjB4yVZdnNwfRvIKgG0Pa9Ow/BElHmQXjGhhJsM2ElzCLr2xnw
	 tqla8tCcB6g+Q==
Received: from localhost (unknown [212.93.144.165])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with UTF8SMTPSA id 1430E17E0202;
	Fri,  4 Jul 2025 14:11:00 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Fri, 04 Jul 2025 15:10:45 +0300
Subject: [PATCH] drm/bridge: Fix kdoc comment for
 DRM_BRIDGE_OP_HDMI_CEC_ADAPTER
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250704-drm-bridge-kdoc-fix-v1-1-b08c67212851@collabora.com>
X-B4-Tracking: v=1; b=H4sIAMTEZ2gC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDcwMT3ZSiXN2koswUoEx2Sn6yblpmhW6KkYW5kYmxoZFZopkSUGdBUSp
 QGGxqdGxtLQBsajgoZQAAAA==
X-Change-ID: 20250704-drm-bridge-kdoc-fix-d287243126a6
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2

Correct the kernel-doc comment for DRM_BRIDGE_OP_HDMI_CEC_ADAPTER member
of enum drm_bridge_ops.  This seems to be just a copy-paste artifact
from DRM_BRIDGE_OP_HDMI_CEC_NOTIFIER above.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 include/drm/drm_bridge.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index 7f66f9018c1090642876ff948bbf06ca66a46bfe..d2454ba83db36f8f0d475b0b37468c2ebe7e921d 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -1051,7 +1051,7 @@ enum drm_bridge_ops {
 	 */
 	DRM_BRIDGE_OP_HDMI_CEC_NOTIFIER = BIT(7),
 	/**
-	 * @DRM_BRIDGE_OP_HDMI_CEC_ADAPTER: The bridge requires CEC notifier
+	 * @DRM_BRIDGE_OP_HDMI_CEC_ADAPTER: The bridge requires CEC adapter
 	 * to be present.
 	 */
 	DRM_BRIDGE_OP_HDMI_CEC_ADAPTER = BIT(8),

---
base-commit: 86c947b363f003153768d879ee15f8358cbf29c5
change-id: 20250704-drm-bridge-kdoc-fix-d287243126a6

