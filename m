Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EACC01C84AA
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 16:30:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.90.84.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744216247; cv=none; b=EnsW/p1HdcpzJIVf0wsYp6KEGl7fPeJuhiqhgP5nE5lzFkomExpemUCjSg5mdXX8uQtY+QPaD4EkPETKlByw0lzp8zAbM4DWyAe0S1HPDMPyYDn+DEvLMy8OS5iwsmYZF3bVl09aI6AsvwklvsWyPVeKVYesJ0N+VbsFfydy2vE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744216247; c=relaxed/simple;
	bh=Q/X+FN87AaEgSDHEwiiw1dU3MDuO+kYIqxnG/MeEXh8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=knWdtu6BQg2NrLDLb8shD75+2Unb2ksj/bVRMkPYjj/mBBVVghXTSnV72vncMkdq14s21mBW+/vqV+G9lVQUsR5JaUEVmQcxtemIB6pmQxG02njS7QFvQ50EGce+ahoOBqjQ71cYaggfmEuZgs2/7GPu69KAqRcKqBqWJpeHESU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com; spf=pass smtp.mailfrom=tuxedocomputers.com; dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b=Mmiq4Hv3; arc=none smtp.client-ip=157.90.84.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="Mmiq4Hv3"
Received: from wse-pc.fritz.box (host-88-217-226-44.customer.m-online.net [88.217.226.44])
	(Authenticated sender: wse@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPA id C73C52FC0050;
	Wed,  9 Apr 2025 18:30:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1744216234;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=cNCf3IuAjyApDX/6a4t81bLCKE7aJ1LuEin2d7+4gNE=;
	b=Mmiq4Hv3lSTucmEFxCstErkmcb31wuADE8bC0TYAdXtNwb7uW1iN5ehQgQliIWBtf35qxR
	iwKuS3rlwb3eWoXX8UXLQNkwFzkfJhSDXZ++/7woGdfQ76tMNafMlU8KVtXyKVOKq3rICp
	G14RB+RbCG/epTWizptPWZaw5zzDhGE=
Authentication-Results: mail.tuxedocomputers.com;
	auth=pass smtp.auth=wse@tuxedocomputers.com smtp.mailfrom=wse@tuxedocomputers.com
From: Werner Sembach <wse@tuxedocomputers.com>
To: harry.wentland@amd.com,
	sunpeng.li@amd.com,
	siqueira@igalia.com,
	alexander.deucher@amd.com,
	christian.koenig@amd.com,
	airlied@gmail.com,
	simona@ffwll.ch
Cc: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Werner Sembach <wse@tuxedocomputers.com>
Subject: [PATCH 0/1] drm/amd/display: Add quirk to force backlight type on some TUXEDO devices
Date: Wed,  9 Apr 2025 18:26:59 +0200
Message-ID: <20250409163029.130651-1-wse@tuxedocomputers.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is a quirk we currently manually apply via our installer, but we don't
have this exact device + panel configuration in our archive anymore so I
could only test the qurik moking in other ids.

Werner Sembach (1):
  drm/amd/display: Add quirk to force backlight type on some TUXEDO
    devices

 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 32 ++++++++++++++++++-
 1 file changed, 31 insertions(+), 1 deletion(-)

-- 
2.43.0

