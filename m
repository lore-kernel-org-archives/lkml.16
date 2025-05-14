Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AECB91F4CB7
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 05:04:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747199059; cv=none; b=r2gU+Kd95/HTOXXl2o6fxD4WP8E2YlF75oJSxGMMtc6dOusIhFYAYXGz8lfdoF/crFlqUjUozfpaarGFJktQMT5xl1zbE5qFja2/gPBDzI2I+F85NgneUpO0s8r1Z0I5l6tqr20Kyxyn//qv0kiAq8XLbxJM+VItQTxP6RFLPFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747199059; c=relaxed/simple;
	bh=fIu2GoblYaX9oVr9OdXmzneCDdQNm6ehbUVzxgRA1Fk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KqqixuX8Ti9IMfTmFLFz9/tmbTwTlbhJp3IqBc1fK4p9kfaSH/xwAoa9g66hijyEmCr7ilfminXRwjVlNkagHouMDrWgbNCo7yWcxKvOSDumNMlUoi8KLuEaXa9At3maMd36aAcgztzXdD+VZYfv6BL8F47UUKcnJuWcZv0bc4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=Mgfe1tkp; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="Mgfe1tkp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1747199055;
	bh=fIu2GoblYaX9oVr9OdXmzneCDdQNm6ehbUVzxgRA1Fk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Mgfe1tkpySKK6a/e4jJDjwGMlhFF0bj7wV2YU8S2ShEnyiFCpE1XZg3Q07HcOv9yY
	 RM1abqmi/Jax16PEyP6fzCXs5XInkitC0deWNAEXBXkDgUVVeUEFZwrjGdF12U4RVP
	 BvpJyR1gARjVREtP3fs3o+jfZqI2W2wG96fxRuZZvMF4hgcei1jwNHffYx7B8rjve/
	 YnIGzmAsz8WO1tyTJvI5RPYp5d1AngF31M34FhxPHH9F0T1W85ZnpE8kV/+gCfwDxE
	 vev9sWoV1SQ4ALQtVO3pIvM2OTX3HgeW4by2e2/cUuSb41bxu+bCN4V59NYPnomaVA
	 ZczCbV//dDhxA==
Received: from debian.. (unknown [171.76.80.110])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: vignesh)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id EE33417E361D;
	Wed, 14 May 2025 07:04:11 +0200 (CEST)
From: Vignesh Raman <vignesh.raman@collabora.com>
To: dri-devel@lists.freedesktop.org
Cc: daniels@collabora.com,
	daniel@fooishbar.org,
	helen.fornazier@gmail.com,
	airlied@gmail.com,
	simona.vetter@ffwll.ch,
	robdclark@gmail.com,
	guilherme.gallo@collabora.com,
	sergi.blanch.torne@collabora.com,
	valentine.burley@collabora.com,
	lumag@kernel.org,
	dmitry.baryshkov@oss.qualcomm.com,
	quic_abhinavk@quicinc.com,
	mripard@kernel.org,
	maarten.lankhorst@linux.intel.com,
	tzimmermann@suse.de,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/2] drm/ci: python-artifacts: use shallow clone
Date: Wed, 14 May 2025 10:33:35 +0530
Message-ID: <20250514050340.1418448-2-vignesh.raman@collabora.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250514050340.1418448-1-vignesh.raman@collabora.com>
References: <20250514050340.1418448-1-vignesh.raman@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The python-artifacts job has a timeout of 10 minutes, which causes
build failures as it was unable to clone the repository within the
specified limits. Set GIT_DEPTH to 10 to speed up cloning and avoid
build failures due to timeouts when fetching the full repository.

Acked-by: Helen Koike <helen.fornazier@gmail.com>
Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
---

v2:
  - Set GIT_DEPTH only for python-artifacts job.

v3:
  - No changes.

---
 drivers/gpu/drm/ci/gitlab-ci.yml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/ci/gitlab-ci.yml b/drivers/gpu/drm/ci/gitlab-ci.yml
index ba75b3a7eca4..cffcacfd070e 100644
--- a/drivers/gpu/drm/ci/gitlab-ci.yml
+++ b/drivers/gpu/drm/ci/gitlab-ci.yml
@@ -232,6 +232,11 @@ stages:
       - _build/meson-logs/strace
 
 
+python-artifacts:
+  variables:
+    GIT_DEPTH: 10
+
+
 # Git archive
 make git archive:
   extends:
-- 
2.47.2

