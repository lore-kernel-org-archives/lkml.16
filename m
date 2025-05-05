Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53E9B1E1DE5
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 14:11:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746454317; cv=none; b=eCHSKcQu9AqRfX3jQIK397yvhm+IpEu8eoc2caFMx7s80PGZRsBS4wChQYSPUkwwwzLvpNJUyvm2yrBS5G2hdmfe3gnJEZJglGxta9A8RtCUzZSkeZ7sLQXReThRCyrLlNma+xhZOk5bG13umAFMkc0Lw41Fp6H0K6ChSPlmkao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746454317; c=relaxed/simple;
	bh=tIGZnInO3llyMoWK2+bBt9gCAfiyHT0iGIZI7DNasFA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hAE1E/2b/kAZuqzXRNO97C2vp2ZMlPHlsJZiM7YropqiAK1Opcws1XyM1Z5LHp8Cg9RcHkaBdGISzQlbLIYC09Nu8En88DrutLLO/89slKNgz4MmcTV6D6wMNKljdnJXfBxC5NWY6Vajrd5v/uix88U6FQ/kP+Rm14+NYbTRLis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=NTVyD1hN; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="NTVyD1hN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1746454313;
	bh=tIGZnInO3llyMoWK2+bBt9gCAfiyHT0iGIZI7DNasFA=;
	h=From:To:Cc:Subject:Date:From;
	b=NTVyD1hNHE9T2BbS9OH/QtHqy5WuDNOWMfxR2dpNDpxZk0G7RagZjVVRugH3qzYXQ
	 aW85Rz1EV6xc5wYASvhDRfm8dmtfKCWmb7qY2+cyGSjeUg/Mj4ZBeDvdHmPL1vDYL5
	 PbkHuUDNZAS0LR1wHqNDbq0cAQ13DZ3Ze5k0vnwxfrUjKIbY21y/beVifACHdNxSQd
	 34nUu9ufbfifT/MKhaYSv2JDxFP2PJ1HouzS7kHu9y9zaTHDmCj6v0IhOnFj58xh8C
	 p1uUW/FxhR+jI0JMO+R23Krrv3OAAEGj6BxBlE9g3xqUMpqaSPg5Eit1T3UJSAX8AU
	 9gvlocWpaFl4g==
Received: from debian.. (unknown [171.76.80.110])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: vignesh)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7E07717E0F66;
	Mon,  5 May 2025 16:11:49 +0200 (CEST)
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
Subject: [PATCH v2 0/2] drm/ci: mesa uprev and python-artifacts fixes
Date: Mon,  5 May 2025 19:41:32 +0530
Message-ID: <20250505141139.472175-1-vignesh.raman@collabora.com>
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
specified limits. Set GIT_DEPTH to 10 to speed up cloning and avoid
build failures due to timeouts when fetching the full repository.

The current s3cp stopped working after the migration. Update to the
latest mesa and ci-templates to get s3cp working again and adapt to
recent changes in mesa-ci.

check-patch testing,
MR - https://gitlab.freedesktop.org/vigneshraman/linux/-/merge_requests/22
pipeline - https://gitlab.freedesktop.org/vigneshraman/linux/-/pipelines/1418294

mesa uprev testing,
pipeline - https://gitlab.freedesktop.org/vigneshraman/linux/-/pipelines/1418293

i915:cml jobs are stuck due to some issue with devices in the lava lab.

Vignesh Raman (2):
  drm/ci: python-artifacts: use shallow clone
  drm/ci: uprev mesa and ci-templates

 drivers/gpu/drm/ci/build.yml      | 10 +++++--
 drivers/gpu/drm/ci/container.yml  | 30 +++++---------------
 drivers/gpu/drm/ci/gitlab-ci.yml  | 46 ++++++++++++++++++++++---------
 drivers/gpu/drm/ci/igt_runner.sh  |  5 +++-
 drivers/gpu/drm/ci/image-tags.yml | 20 +++++---------
 drivers/gpu/drm/ci/lava-submit.sh |  4 ++-
 drivers/gpu/drm/ci/test.yml       | 31 ++++++++++-----------
 7 files changed, 77 insertions(+), 69 deletions(-)

-- 
2.47.2

