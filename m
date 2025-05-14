Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A59BA1F4611
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 05:04:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747199055; cv=none; b=I2yOaClaN663Nky10ikVXL/qYHz/yRaq9ziR1G75LLdIxyxEtlu4p2PUK0jjcSel3t3by9SlcdfCnOjPSg3S4qhJo3Dc7asRnpW42FGY6N/A9CIgG16L/g5iD9v959GHJ6GGuB+WJjUTSniqKqzs2A5Hc8haZP7R4nGcsbf3fh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747199055; c=relaxed/simple;
	bh=ZsOFui9ij8DvfsTnHWcK2/pJHcNnLLty5sjRita0fQc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=q2+1lJawyPoC+rF7z2cvTJnamp/BKCxxIqeR8DF0+uBJ61MGGOZZe8scaYmMjnlMX5ExeMvvJmvKXgInJ++17cSGnFoVBB2zPMldH5RwcFBcYXSS2+RUD6vGhtMfL5o3TP0PWel2k3JxF82dBRiObUCkQViwCQ81W2Bi/6++zX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=FM/3ed9R; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="FM/3ed9R"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1747199051;
	bh=ZsOFui9ij8DvfsTnHWcK2/pJHcNnLLty5sjRita0fQc=;
	h=From:To:Cc:Subject:Date:From;
	b=FM/3ed9RhZi/R1zjwYKLCcWdDJ3+ubSM/J20JxODrQm9UToaQTMD+4i9bevQ8SKAq
	 O8xPYMAU/uXd6hFQ+KjahwUEJwln9+c6h5nLCWIYRP2zj89BclYMQl+Qiry+tfsw95
	 DqGk8WlkDi9vhbf0BnV4IbsM16d9z/VINDQctryicr5egSGOaLNXwJ77Qkh5L1/KFX
	 HDuDP0onN911I9TA6NLMJyIuMAvXk+dtJaocluocjbrNXUR6tg0UXBlRP9bC3k73Or
	 aVlPTVNe9A8k6c7woanOkNMtdvb1w0N5brBlR6C/p7ReMsoiHR/tPDmI0fHsCephnW
	 Xer8pCHSIIfag==
Received: from debian.. (unknown [171.76.80.110])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: vignesh)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 8CF8A17E1561;
	Wed, 14 May 2025 07:04:07 +0200 (CEST)
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
Subject: [PATCH v3 0/2] drm/ci: mesa uprev and python-artifacts fixes
Date: Wed, 14 May 2025 10:33:34 +0530
Message-ID: <20250514050340.1418448-1-vignesh.raman@collabora.com>
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

msm merge request,
https://gitlab.freedesktop.org/drm/msm/-/merge_requests/169
 
i915:cml jobs are stuck due to some issue with devices in the lava lab.

Vignesh Raman (2):
  drm/ci: python-artifacts: use shallow clone
  drm/ci: uprev mesa and ci-templates

 drivers/gpu/drm/ci/build-igt.sh   |  2 +-
 drivers/gpu/drm/ci/build.sh       |  6 ++--
 drivers/gpu/drm/ci/build.yml      | 10 +++++--
 drivers/gpu/drm/ci/container.yml  | 30 +++++--------------
 drivers/gpu/drm/ci/gitlab-ci.yml  | 50 +++++++++++++++++++++----------
 drivers/gpu/drm/ci/igt_runner.sh  |  1 +
 drivers/gpu/drm/ci/image-tags.yml | 20 +++++--------
 drivers/gpu/drm/ci/lava-submit.sh |  6 ++--
 drivers/gpu/drm/ci/test.yml       | 31 ++++++++++---------
 9 files changed, 80 insertions(+), 76 deletions(-)

-- 
2.47.2

