Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D2C85C603
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 05:33:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751002431; cv=none; b=e3xHtKfaaxdmS4WtwXboithAqgEDayL+pDS9wLfmwAA+1IV/M46Ms6DYIZE3UOTPGAKlg8z7CYgVMKcpXN9LgSQ7i8k1kbC7bdPtieaV1wx9ZUPAKL3LeKKorY8Xi1H4e2GN4pKxZDSgrJvUXJiGjKNlGlfSAyYLJIVs9LDXfN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751002431; c=relaxed/simple;
	bh=Ms2iiL6xHTka+KbRnWw4lch5UjQ/8n+zuH+88WExL5c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=vFVwq03N8zhyNUzoSsKL1XQ2H3hxm9vEj0tfv1lL5rrwHbEdBeu6uSktONk4Z8veLhlnId0BAiivNGhEcJvXfd1Zvlrw43PfTjOAxxoRxbBP2WaCrbH9CqVCV58nNdjjRvFSreH6O7+3/xG5By6YQ1mkRoF8MPPEW90RdYe2IV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=Tlc18/1G; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="Tlc18/1G"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1751002427;
	bh=Ms2iiL6xHTka+KbRnWw4lch5UjQ/8n+zuH+88WExL5c=;
	h=From:To:Cc:Subject:Date:From;
	b=Tlc18/1GHDYGFI/whANjkPRjiKXbXElX917+cIdO5Zmav24KJxbb92ZQLvZ54tguq
	 zoJU8VqWws8FhTMQnbxvUGfBn+gRe5nNVHnUfvq2kBqifLqbunZ3mwKoI6+ewgsSww
	 lRw9imU+JK/5Akjod/g1FG3CdeiyDAvH7R3nrGeK95uiWzy58x0ykPE7dfr9euxsro
	 2NPHwNKdzghpZzd+jsmIwEGxcVprhoT+rrl7vkt1/5isSz04ZP4RXBqRzW5uJvQn7X
	 P4Rhs/xfQPPUma8KkUgQSZEH++Q+4k3hLUiXmusaQp46Q4J6wi8YnvVE4ED6lfV3OC
	 Wm0lhja6Pwyog==
Received: from debian.. (unknown [171.76.82.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: vignesh)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 4E3B217E04AA;
	Fri, 27 Jun 2025 07:33:43 +0200 (CEST)
From: Vignesh Raman <vignesh.raman@collabora.com>
To: dri-devel@lists.freedesktop.org
Cc: daniels@collabora.com,
	daniel@fooishbar.org,
	helen.fornazier@gmail.com,
	airlied@gmail.com,
	simona.vetter@ffwll.ch,
	robdclark@gmail.com,
	robin.clark@oss.qualcomm.com,
	guilherme.gallo@collabora.com,
	sergi.blanch.torne@collabora.com,
	valentine.burley@collabora.com,
	lumag@kernel.org,
	dmitry.baryshkov@oss.qualcomm.com,
	quic_abhinavk@quicinc.com,
	mripard@kernel.org,
	maarten.lankhorst@linux.intel.com,
	tzimmermann@suse.de,
	intel-gfx@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1] drm/ci: i915: cml: Fix the runner tag
Date: Fri, 27 Jun 2025 11:03:19 +0530
Message-ID: <20250627053321.283208-1-vignesh.raman@collabora.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The GitLab runner tags are case sensitive, and Flip-hatch's tag was
incorrectly lowercase. This prevented jobs from being picked up
by the runner. Fix the runner tag for Flip-hatch.

Based on https://gitlab.freedesktop.org/mesa/mesa/-/commit/03b480d3

Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
---

v1:
  - MR - https://gitlab.freedesktop.org/drm/msm/-/merge_requests/174
    This series depends on,
    https://lore.kernel.org/all/20250514050340.1418448-1-vignesh.raman@collabora.com/
    https://gitlab.freedesktop.org/drm/msm/-/merge_requests/169

---
 drivers/gpu/drm/ci/test.yml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/ci/test.yml b/drivers/gpu/drm/ci/test.yml
index 795a2631833b..01bb38842123 100644
--- a/drivers/gpu/drm/ci/test.yml
+++ b/drivers/gpu/drm/ci/test.yml
@@ -322,7 +322,7 @@ i915:cml:
   variables:
     DEVICE_TYPE: asus-C436FA-Flip-hatch
     GPU_VERSION: cml
-    RUNNER_TAG: mesa-ci-x86-64-lava-asus-C436FA-flip-hatch
+    RUNNER_TAG: mesa-ci-x86-64-lava-asus-C436FA-Flip-hatch
 
 i915:tgl:
   extends:
-- 
2.47.2

