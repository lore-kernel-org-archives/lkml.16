Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F2481DD877
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 11:42:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743162125; cv=none; b=CQSfG8H/m+L8lVat5x+nIPZdoNh+gMcdEoNq93J/VkL4xJ79/NA3MOcVxRQCdWOKmLxq/8Vu6setJ8aJuLaeG9ydH21OoBWqAM8p8+zRYACfk4Zym1wqNkzEHNDWOEJMTyg58u/qdTEqpk4zaMf5djcWzxDiGxIRToet5OoGEi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743162125; c=relaxed/simple;
	bh=PFZ4TMRgtKdeGj2aNdIxMtFoTXajuTar5AF4BMOWugk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SAyvggCYU/bldrcHCHMGHnwAg3ITVLMFaAOt7iie7dJ6hMOOoMTZeEMy6aIINl0JNLE+aqbTBqHICK7DfgeUC0k1ZkRgpPPQrSCGEUIvwnmEzTKCnXFOR8FAd+QNviBSd3FUV9oZx45Pm7JoEZ4okB8oA3EH74Suv4JamGxWJZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=muaH3KoX; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="muaH3KoX"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43cf034d4abso22300835e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 04:42:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743162121; x=1743766921; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8qU5AiWpbN3KM74t30WidB9pTNIUeBMiW8GyuUSbcvA=;
        b=muaH3KoXo3iSq9fjvchf4biTUdghVETDMqOEu2MFsvLIwDJXWtDzCsO3VArQgWOvSg
         n3OQCTy3Iix33B1rTPa8tPgwB1n/5L7pDgcwI7DdNb3sKBcwoE44LAqVtw66goG29hqE
         ucojNRxEPh2unU8yGV2rEVopEiWtmsqK6jn5Q++U0dbTTcz2a8nijUZxuZRWnZX5MRTD
         TNF3YkElwEVNsBz3B53GkXrSQFcUBRhkXbv8RptERr9x3F7TlZLH5S4XA5GMJeSgJnN6
         T1XaY20HHVAK3dDvcQTEDzRpXF/QhZ8Ybvj0tx23/FAB0qXVpcWUmG/fwSLTS9Af5C0/
         Azuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743162121; x=1743766921;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8qU5AiWpbN3KM74t30WidB9pTNIUeBMiW8GyuUSbcvA=;
        b=bha6+ngNLqw/ax9lyRoW8jpca9pK0pxnVDob8k/4QgCf8ZBvZsDbkR8t41grbZaJot
         axWum8Fl+Hd270hwF13Pxz7Hrtrj5ayvKOIrdLBrY3PaHgFc4JuOhWZue1vg74OQgAn3
         KYfxnZ3mLqI5yCJVbllLTFmm+ciXpCzra7MoLDsp40n5tdC5tYehaYvQuIQSacUNlXOx
         cecyf018l63JYQ369OqvEKmlqsawOIrQfJiFNWlPXDMK8mWCqhSeLeY9TYf3XQ0U1VHO
         oVqDNkdYRdfXi5DhiO+YnM2HJEumYv14qqya0iwlqOPlfG+WesWhdiqvSbY9WdcP799B
         DxEQ==
X-Forwarded-Encrypted: i=1; AJvYcCV/1EcH19oGAk/pvtoBx6+4tVoW3089/Tyb5bQYZYO54sfID2McHgmDpxS545wfEKwnRSXrU+7wUkwmpD8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzx4gKebuOQ8fWSJ8/i/ndRTkVADWj0TJeDT7BnuVey024aD6/I
	BHFQTsDaCNsBR7cfwa1Jupe131/OT0hTRCYpxIDg1kMDrzmuXUtWBpJVAg==
X-Gm-Gg: ASbGncttGoaoRhKlscXXFQoz/7jhxgnTzv/qiFO1+jIqUDyzeYTKrABJn6Jma4dm7EH
	NvJiKT9C5Lx1XoAfv0Z6r8ru4p9Fn73UXLEQwixPjZgADjQS0pyE4HMARPMgh9uG/MWvKbWSe4c
	hcSP9rO5QfiMuuzqbPWYiSnBeRCPT9CqfTw0jnNQsy94Z/a3Tw3xGHjRL3hobb2AxVyctNayFmc
	aornVgykrDxkJwEJ3of09Qbaatq5OTB1KE/zXtkyvaw9wUmx5VRHa7hFOdP99ruCDs4JNWEuukE
	tSHgLzLdAH7u5gUhAJ9JoFEySPWUlY6pBOJJx6zFTy7D
X-Google-Smtp-Source: AGHT+IE6NyaKSWsufmYH5cuBADybmG03r6oOy5QuUTP68hFuOh3PEqtETMHUqZz02lhy8vWkbThYlA==
X-Received: by 2002:a05:600c:354a:b0:43c:eec7:eab7 with SMTP id 5b1f17b1804b1-43d91789e8bmr24547425e9.11.1743162121507;
        Fri, 28 Mar 2025 04:42:01 -0700 (PDT)
Received: from localhost ([2001:861:3385:e20:6384:4cf:52c5:3194])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-39c0b6656afsm2335864f8f.40.2025.03.28.04.42.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Mar 2025 04:42:01 -0700 (PDT)
From: Raphael Gallais-Pou <rgallaispou@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] drm: of: fix documentation reference
Date: Fri, 28 Mar 2025 12:41:48 +0100
Message-ID: <20250328114148.260322-1-rgallaispou@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Documentation/devicetree/bindings/graph.txt content has move directly to
the dt-schema repo.

Point to the YAML of the official repo instead of the old file.

Signed-off-by: Raphael Gallais-Pou <rgallaispou@gmail.com>
---
 drivers/gpu/drm/drm_of.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_of.c b/drivers/gpu/drm/drm_of.c
index 5530919e0ba0..964a746e90aa 100644
--- a/drivers/gpu/drm/drm_of.c
+++ b/drivers/gpu/drm/drm_of.c
@@ -55,7 +55,8 @@ EXPORT_SYMBOL(drm_of_crtc_port_mask);
  * and generate the DRM mask of CRTCs which may be attached to this
  * encoder.
  *
- * See Documentation/devicetree/bindings/graph.txt for the bindings.
+ * See https://github.com/devicetree-org/dt-schema/blob/main/dtschema/schemas/graph.yaml
+ * for the bindings.
  */
 uint32_t drm_of_find_possible_crtcs(struct drm_device *dev,
 				    struct device_node *port)
@@ -106,7 +107,9 @@ EXPORT_SYMBOL_GPL(drm_of_component_match_add);
  * Parse the platform device OF node and bind all the components associated
  * with the master. Interface ports are added before the encoders in order to
  * satisfy their .bind requirements
- * See Documentation/devicetree/bindings/graph.txt for the bindings.
+ *
+ * See https://github.com/devicetree-org/dt-schema/blob/main/dtschema/schemas/graph.yaml
+ * for the bindings.
  *
  * Returns zero if successful, or one of the standard error codes if it fails.
  */
-- 
2.49.0

