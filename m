Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2996C221FB4
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 17:18:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.90.84.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744391893; cv=none; b=N0+2xiZUZ1LRIre2DDKnDoO1yEOtqwUwJTOBEXmwSIq7sGsF37dsUbdzNhbBU1EVpUAg9EdKL3P44nPfi+KE1fCN/59ldjH8P6heMCzXqmdGQKOd883PrclhNOOWXlovMALRY0gqTwYi7/5s1vm7xbAm1m0YJr1NInr0BAbIIXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744391893; c=relaxed/simple;
	bh=7wVC8TJAMr4aZxVfGJtdXp8Its1tWhnkzwp7/PKQrqY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=A5/aQpYBjhmvLqI/E6wAE5Esyyanr7Q3eu5V0iqI/ujbyqGpHPFjMDvlos8KH3QJuPahPmR/ax1WLkWU9/yFjNeb3t43VHofFDWjArxyW5D/Guf7uaUYbZrsE1xjd+paPVBO5WNjht8+3MkXHffGQ5M+Kf/H8NM/fWllAK03IV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com; spf=pass smtp.mailfrom=tuxedocomputers.com; dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b=XKRlE1WR; arc=none smtp.client-ip=157.90.84.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="XKRlE1WR"
Received: from wse-pc.fritz.box (host-88-217-226-44.customer.m-online.net [88.217.226.44])
	(Authenticated sender: wse@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPA id 79C3B2FC0055;
	Fri, 11 Apr 2025 19:18:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1744391882;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=NyVZJW2evaHgtQ9r9PhHJ1mjUqOm15rHIODTnDeP2QE=;
	b=XKRlE1WR+vCbKsn8N8zDxBRE4HN5QNfzn+h2KNJ5Kx8Awv8CfwOyKpntQDWX6du/OgyMkC
	f+K4GtzemR9ou4IgsA8StiloOH+Cr5cuqRi4G3DWHlnUbHZV7F2XGpYbDqbgdRikJuAysI
	hU7GBikI5DPKcfDeN+bo86bj6MGGHjE=
Authentication-Results: mail.tuxedocomputers.com;
	auth=pass smtp.auth=wse@tuxedocomputers.com smtp.mailfrom=wse@tuxedocomputers.com
From: Werner Sembach <wse@tuxedocomputers.com>
To: jani.nikula@linux.intel.com,
	rodrigo.vivi@intel.com,
	joonas.lahtinen@linux.intel.com,
	tursulin@ursulin.net,
	airlied@gmail.com,
	simona@ffwll.ch
Cc: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Werner Sembach <wse@tuxedocomputers.com>
Subject: [PATCH 0/1] drm/i915/display: Add quirk to force backlight type on some TUXEDO devices
Date: Fri, 11 Apr 2025 17:55:07 +0200
Message-ID: <20250411171756.142777-1-wse@tuxedocomputers.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is a quirk we currently manually apply via our installer via the boot
parameter, but we don't have this exact device + panel configuration in our
archive anymore so I could only test the qurik moking in other ids. This is
the same situation we have here:
https://lore.kernel.org/all/20250409163029.130651-1-wse@tuxedocomputers.com/

Werner Sembach (1):
  drm/i915/display: Add quirk to force backlight type on some TUXEDO
    devices

 .../drm/i915/display/intel_dp_aux_backlight.c | 14 ++++++-
 drivers/gpu/drm/i915/display/intel_quirks.c   | 42 +++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_quirks.h   |  1 +
 3 files changed, 56 insertions(+), 1 deletion(-)

-- 
2.43.0

