Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AC7C25A2AA
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 14:11:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746454321; cv=none; b=Odm4mgw1IX6BR8t6Wt6MRKVYSw5zF6xGk4pym41HVxjJgdNSa/mj/qwyiKF5aO3m9800xJKH+Z7Y17QFraN7zMh3G6TK0tDel7tn/nFlxDRwTgavcuyTTD9I+MSERYWWugy9FMWqIT28ITI1hw470ZTcBr7pLpQsAfLfK+ePiZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746454321; c=relaxed/simple;
	bh=/enN1zzXgWLN6TP2Q9v37bu1VnQvmfewf6HUUiqEyQk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ECII5vnZJ3NsKn9skEHgpJfGiuSBu8n11Se4gQUhac4RV6SY0GnY5Et/DAJO5Z1KtjsWpwviJi3wM5f3KFt4qqLrdaSAgPQKZWTZEJDj8yLGL6/0fLl4nyBlftaxZfW37ptvpxj4WG8NgpLVFzL4O5GRkRjsUS5vmOcyD5pf/C8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=EVnW6Jbt; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="EVnW6Jbt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1746454317;
	bh=/enN1zzXgWLN6TP2Q9v37bu1VnQvmfewf6HUUiqEyQk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=EVnW6JbteY7iY9MZb9CEGvKVCX6saM92cxxh5IDrTtXEgc2dVewXP/cje4+ES2OwR
	 65i5WXIOLqcU+lowrh/I6xWdZd/T5945k6be9QQL1ZyWKEQFKYZ3ty1BOmP0If19rE
	 1faP4fFMjalc3MDHGNTh3F/SUfLhr/o+Ef2AiDoiynpeDiLzxNBsg6LvHdNPt+QIwM
	 5m7psi8ytzE3FhElJOEYXhS1KXjZvjPo97DsL7CxOHZeXuQtnmMuuzAodM2e/RQIeX
	 LwEQPGrqaYRihq9JHnPb3swHp57PJhDQsE7Rn3ARd6gu5X6dAKTMN2ko1jCDHsTnVx
	 pudPG1cdXlskw==
Received: from debian.. (unknown [171.76.80.110])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: vignesh)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C522017E0F89;
	Mon,  5 May 2025 16:11:53 +0200 (CEST)
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
Subject: [PATCH v2 1/2] drm/ci: python-artifacts: use shallow clone
Date: Mon,  5 May 2025 19:41:33 +0530
Message-ID: <20250505141139.472175-2-vignesh.raman@collabora.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250505141139.472175-1-vignesh.raman@collabora.com>
References: <20250505141139.472175-1-vignesh.raman@collabora.com>
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

Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
---

v2:
  - Set GIT_DEPTH only for python-artifacts job.

---
 drivers/gpu/drm/ci/gitlab-ci.yml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/ci/gitlab-ci.yml b/drivers/gpu/drm/ci/gitlab-ci.yml
index 65adcd97e06b..193f67121328 100644
--- a/drivers/gpu/drm/ci/gitlab-ci.yml
+++ b/drivers/gpu/drm/ci/gitlab-ci.yml
@@ -230,6 +230,11 @@ stages:
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

