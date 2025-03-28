Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73910B676
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 11:02:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743159780; cv=none; b=CFLtr1U/DH38SuOSUG9+qSaTogHDWyr2tbvh5xTZfoxF1dUdY3amd/iHK+QT1E/aiBhY3J900TV4A7qZFVuuAiwJtYcIfkfBRQ2QRYaHPmPblnxIT91U/VUviJSGNf+HlejYhCNAQ8Yq+Zo/o3FO2+uqeHhzAnYR+3mrZ3yMnHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743159780; c=relaxed/simple;
	bh=Eg4htkgtKxBxfGSXYOZ7EIc8dBXBO4HYGaR+6HLT4nk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YhloQVASLbApvUIeqidXUvsgW9cksk2eK94x5iyPwFo0cn84jgN9sLwRMDALlpbBfBaYh9ZFuI4W1no9vk1GobuHoWmupDWlev6tMDcpF9U5rhI941ijE5t8WPwWaIW8U8jBd7Q1DZlXLzSHRZji/EKOy9SF45lOpUzJOmlFzIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=Sz2kqWji; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="Sz2kqWji"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1743159771;
	bh=Eg4htkgtKxBxfGSXYOZ7EIc8dBXBO4HYGaR+6HLT4nk=;
	h=From:To:Cc:Subject:Date:From;
	b=Sz2kqWjiL6JPedeWh2Yu1sKA0RuuOaiMvI3zA0EHxyfMhBe5Sfpl1W2M4fOUJ6WHU
	 +QjOOGFWFcPepp7uF5IAW4fOX/8tzagh4MZnNSOJfaqFhFASQCjP12u2BzkjG3y9Xs
	 PaLpuH2xPaiXbnb3JtiUNuIQGc/1BIhU/7a5vzRkmkPmo68wzNGK9KonaoMvdEpafM
	 CCw/ZJzaaOeJ0O3HJvq0i+mdcR+uxDZLB0RsYqG99cjjGB8m+IGpiRwk0thUH7Omp0
	 /FD65Y9bJ8CfxH0djH4PiynHWIdXGMzfUO37myCXcpvI4zr8pp24OX87jVJVIz+RUP
	 KdZ2k5wbLuqPQ==
Received: from debian.. (unknown [171.76.87.92])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: vignesh)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 19A4C17E0673;
	Fri, 28 Mar 2025 12:02:47 +0100 (CET)
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
Subject: [PATCH v1 0/3] drm/ci: mesa uprev and python-artifacts/check-patch fixes
Date: Fri, 28 Mar 2025 16:32:30 +0530
Message-ID: <20250328110239.993685-1-vignesh.raman@collabora.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The python-artifacts job has a timeout of 10 minutes, which causes
build failures as it was unable to clone the repository within the
specified limits. This patch sets GIT_DEPTH to 10 to speed up cloning
and avoid build failures due to timeouts when fetching the full
repository.

The check-patch job is also updated to ensure the repository is not
shallow before fetching branches. This prevents issues where git
merge-base fails due to incomplete history. Additionally, the timeout
for the check-patch job is set to 1 hour.

The current s3cp implementation does not work anymore after the migration.
Uprev mesa to adapt these changes. Also replace broken s3cp command with a
curl wrapper call in drm-ci.

check-patch testing,
MR - https://gitlab.freedesktop.org/vigneshraman/linux/-/merge_requests/18
pipeline - https://gitlab.freedesktop.org/vigneshraman/linux/-/pipelines/1391545

mesa uprev testing,
MR - https://gitlab.freedesktop.org/vigneshraman/linux/-/merge_requests/18
pipeline - https://gitlab.freedesktop.org/vigneshraman/linux/-/pipelines/1391440

Google farm is down, so the baremetal jobs failed.
i915:cml jobs are stuck due to some devices in the lab being under maintenance.

Vignesh Raman (3):
  drm/ci: use shallow clone to avoid timeouts
  drm/ci: check-patch: unshallow repository before fetching
  drm/ci: uprev mesa

 drivers/gpu/drm/ci/build-igt.sh      |  2 +-
 drivers/gpu/drm/ci/build.sh          |  6 +++---
 drivers/gpu/drm/ci/check-patch.py    | 16 ++++++++++++----
 drivers/gpu/drm/ci/gitlab-ci.yml     |  8 ++++++--
 drivers/gpu/drm/ci/image-tags.yml    |  2 +-
 drivers/gpu/drm/ci/lava-submit.sh    |  2 +-
 drivers/gpu/drm/ci/static-checks.yml |  1 +
 7 files changed, 25 insertions(+), 12 deletions(-)

-- 
2.47.2

