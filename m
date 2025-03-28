Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E16F2192E1
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 11:03:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743159784; cv=none; b=sv0IOJdJJacaabN4Ibp4j6oRbiaXVYXTtUP9D6YNKiUvn/XNPffLs8B45MfwO5kDpLUfehqGdPgEr4S6y2DmdHwUGGP5oWS1yXI0rMuLl3lZBZSvkZoJFcxQOmzHKyo6/SpG1yYn5ObRDN43G/cFAsBOSPrslVbiHbI/ShqGyWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743159784; c=relaxed/simple;
	bh=7gy1PCwTeA3zrOaph8dR8GeMlGJqVYW4rsM70LIsyrk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JYp0VrZwSoC87O46p4rBLVokLf0olYwKEaqpRfYom3qbeAB5ZpSN6ayFwhk7PZ/fKgYEgoLM7ynLTSkrMGY+6ay5PBUDj7XAVdmbo4XD+ewCTyX17n7uNmjcRR4LvyDlW8DQI0fhTP2zTiq8bIsuXIXPJDYe7Pas2lpdpRCpxgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=QjunYh2M; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="QjunYh2M"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1743159775;
	bh=7gy1PCwTeA3zrOaph8dR8GeMlGJqVYW4rsM70LIsyrk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QjunYh2MVCTo4147QjmjnJxxdN8soJecGnAr6wzZ5eNH19KVIy/3Gy5IgZwswBT3/
	 5UcpdwRa3VJ0V9Foijld98swymMJJ2tC5HxMl+K5LJj37c49oKZDOzjldT5PZWyxxr
	 hJY+QHcqGLTz7KZ236/TLZ+imnq60uuB+hWC25dgXZjcG7lFJAT3RKl67d4bFeAsQ+
	 kDKUk61G3xo7RlXtbCMv0xi4rPevdufFD0UczfespO8F9tTXKnmfMY0hyMkOekGWLc
	 u0QEEFIuX+5I1/RDwQX1VUBvDXE/3s0O+9qrJNO75QndPoJNfQ3A3pz+4YiQecdbkI
	 58uCd8lDqR+bA==
Received: from debian.. (unknown [171.76.87.92])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: vignesh)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id E4CE017E0C8C;
	Fri, 28 Mar 2025 12:02:51 +0100 (CET)
From: Vignesh Raman <vignesh.raman@collabora.com>
To: dri-devel@lists.freedesktop.org
Cc: daniels@collabora.com,
	helen.fornazier@gmail.com,
	airlied@gmail.com,
	simona.vetter@ffwll.ch,
	robdclark@gmail.com,
	guilherme.gallo@collabora.com,
	sergi.blanch.torne@collabora.com,
	valentine.burley@collabora.com,
	lumag@kernel.org,
	quic_abhinavk@quicinc.com,
	mripard@kernel.org,
	maarten.lankhorst@linux.intel.com,
	tzimmermann@suse.de,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/3] drm/ci: use shallow clone to avoid timeouts
Date: Fri, 28 Mar 2025 16:32:31 +0530
Message-ID: <20250328110239.993685-2-vignesh.raman@collabora.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250328110239.993685-1-vignesh.raman@collabora.com>
References: <20250328110239.993685-1-vignesh.raman@collabora.com>
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
 drivers/gpu/drm/ci/gitlab-ci.yml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/ci/gitlab-ci.yml b/drivers/gpu/drm/ci/gitlab-ci.yml
index 65adcd97e06b..6850ce99a673 100644
--- a/drivers/gpu/drm/ci/gitlab-ci.yml
+++ b/drivers/gpu/drm/ci/gitlab-ci.yml
@@ -40,6 +40,8 @@ variables:
   ARTIFACTS_BASE_URL: https://${CI_PROJECT_ROOT_NAMESPACE}.${CI_PAGES_DOMAIN}/-/${CI_PROJECT_NAME}/-/jobs/${CI_JOB_ID}/artifacts
   # Python scripts for structured logger
   PYTHONPATH: "$PYTHONPATH:$CI_PROJECT_DIR/install"
+  # Set to 0 to disable shallow cloning
+  GIT_DEPTH: 10
 
 
 default:
-- 
2.47.2

