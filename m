Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A6873C3C
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 15:28:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739287735; cv=none; b=GAWhuJuND6EtD0+aB/fI2ueVdLP6zMDWeQL/O4rXQiAfGnuMsRu+8vgHTcW9jl8wLIxMcYT7kkD7gMXqHaVg7wSf9X+hYjVX2OjPXrCqKIcZ+NS7UeLfP9MBwUxPMahrvp4C4/sk8M6n8Cl5tg2uvkCYAKw4zKQy+/TRKxDDrW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739287735; c=relaxed/simple;
	bh=g/VzPgjMTUf8b4KZq8wW7K14EeqxaK8deIugM6ijxdc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oOdicqGYeWKXeGuk9/Xu3Q0CcJGkIHV2RZQjVDHOUAdFPpqwjpqv6QqMaPE97XgIXNrhNQs07czQ/1NwngtRwpZ2hfrmCTGNeRdfu+SOCWVTXsw1hCqrFrNOkewri90Re4rkG2vpIp1PcbHugN1XmH+bW1r2xbjyIhrWmCbpNrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=Nj4bO6lQ; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="Nj4bO6lQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1739287731;
	bh=g/VzPgjMTUf8b4KZq8wW7K14EeqxaK8deIugM6ijxdc=;
	h=From:To:Cc:Subject:Date:From;
	b=Nj4bO6lQijRHRd5TqwliuF33tQ5gK5ernjeZp67nLCx5mPOt98Uge9263E377n8+d
	 wAOkh7e1NGSXpLHpUR7eXo2CMV6tzCDW3POi2snbciX8On3OPqUwyghDhDRKCkcyvg
	 UEOqFqfMLWc3adTEGjy0iwhDNtYqEVr4k/peliTTCiwbcPVh4si/GG9jIP6gd+UTBf
	 DDKmSRTHDLK4qkkncJUNMMQnCjGMyDekIi3793c9VwYsL/QbUngPYd6YIokjPGd+qS
	 S+gDg4E7AHPlSN1UN836dzpE2qwAFvZOYSNfydj8Y8YCxbVwi4GFSZmuahw+q0GNqm
	 lLkRY7gZ5zHmQ==
Received: from localhost.localdomain (unknown [171.76.80.66])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: vignesh)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9984717E014F;
	Tue, 11 Feb 2025 16:28:46 +0100 (CET)
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
	jani.nikula@linux.intel.com,
	dmitry.baryshkov@linaro.org,
	mripard@kernel.org,
	boqun.feng@gmail.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/3] drm/ci: enable lockdep detection
Date: Tue, 11 Feb 2025 20:58:03 +0530
Message-ID: <20250211152812.54018-1-vignesh.raman@collabora.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series enables lockdep detection in drm-ci. Any lockdep
failures will be shown as warnings in the pipeline. This series
also enables CONFIG_DEBUG_WW_MUTEX_SLOWPATH for mutex slowpath
debugging and refactors software-driver stage jobs.

Test run with this series,
https://gitlab.freedesktop.org/vigneshraman/linux/-/pipelines/1362134

Link to v1:
https://lore.kernel.org/all/20240812112030.81774-1-vignesh.raman@collabora.com/

Vignesh Raman (3):
  drm/ci: refactor software-driver stage jobs
  drm/ci: enable CONFIG_DEBUG_WW_MUTEX_SLOWPATH
  drm/ci: enable lockdep detection

 Documentation/gpu/automated_testing.rst |  4 ++
 drivers/gpu/drm/ci/build.yml            |  6 +-
 drivers/gpu/drm/ci/igt_runner.sh        | 11 ++++
 drivers/gpu/drm/ci/test.yml             | 78 +++++++++++++------------
 4 files changed, 58 insertions(+), 41 deletions(-)

-- 
2.43.0

