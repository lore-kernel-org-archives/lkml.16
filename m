Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5913146D40
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 13:48:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738763312; cv=none; b=INCt/5uI5WTRJSG/XTRg+1yq/O9HcXgXS9CWDvoTgOhoZs9CJBPfyFayrWj6IFv/ryElnQarfVL7yUQAGU+DRUXAIq+cGBlOnxEFdq/qSJU+4G/am1mGZbyr1rGxvG5GRwmSIpdLSi1v5JdeOt/vXHfEhRZlB3y3LsdLn51jF1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738763312; c=relaxed/simple;
	bh=+Fw6FinwCoS1WkNYStwmJ7zMFCgSMn0hedbU3b3hUss=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Z57ULK9aqCIOr5I9pN+yi8Ykh+D2/O8HMT9DeOa/yFQ/I2lLyjfx9MVNfoaxE6QNcaIbqo+1JqMY/mWKE5C2IMjMJYWOm3SMxGAmJS8sBaqjpZ1fcMBR6lnueeng+7wSUrpwX6t6VA1MQg+EGTMCissA19IknsCrkxqn3h1g5DA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=ny+bN/op; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="ny+bN/op"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1738763308;
	bh=+Fw6FinwCoS1WkNYStwmJ7zMFCgSMn0hedbU3b3hUss=;
	h=From:To:Cc:Subject:Date:From;
	b=ny+bN/opkt8izdf1zNx3PJXQ3I5fY0iDJHp8vUYhfodATUfn0t4Mh2fm2few1Y/zF
	 PrT7+zRuHfmkSfrpvXyP6xkiSlYhK76fGfQ/JadvkMCm/+vUfZxlh6GcGnAhGC3JoO
	 s161xetTfW2+ca8Iy+tlxy4rvT7k15Rqey2cX+1ARhSCrT2iEz/7WZt+ESkPwqW0NX
	 BydBR15eEU0kzAUke42FMLPGDyF6JtZkOYojuKd/Rpr9E3PUGTpRXftmpVhQvKptgk
	 Ddmopt7FVK/8BU9dDeodTJa/zzCY8aHknp2ajNY2GlDeUuX4Lo1Q4GOiOgYKFwffie
	 PKDE2g5bn9eWg==
Received: from localhost.localdomain (unknown [171.76.83.215])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: vignesh)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C6A6817E0858;
	Wed,  5 Feb 2025 14:48:25 +0100 (CET)
From: Vignesh Raman <vignesh.raman@collabora.com>
To: dri-devel@lists.freedesktop.org
Cc: daniels@collabora.com,
	helen.koike@collabora.com,
	airlied@gmail.com,
	simona.vetter@ffwll.ch,
	robdclark@gmail.com,
	guilherme.gallo@collabora.com,
	sergi.blanch.torne@collabora.com,
	valentine.burley@collabora.com,
	jani.nikula@linux.intel.com,
	dmitry.baryshkov@linaro.org,
	mripard@kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1] MAINTAINERS: Update drm/ci maintainers
Date: Wed,  5 Feb 2025 19:17:47 +0530
Message-ID: <20250205134811.2002718-1-vignesh.raman@collabora.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update drm/ci maintainer entries:

* Add myself as drm/ci maintainer.
* Update Helen's email address.

Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
---
 MAINTAINERS | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index b256bb4f6d3f..2b4e08c7e119 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7940,7 +7940,8 @@ F:	drivers/gpu/drm/ttm/
 F:	include/drm/ttm/
 
 DRM AUTOMATED TESTING
-M:	Helen Koike <helen.koike@collabora.com>
+M:	Helen Koike <helen.fornazier@gmail.com>
+M:	Vignesh Raman <vignesh.raman@collabora.com>
 L:	dri-devel@lists.freedesktop.org
 S:	Maintained
 T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
-- 
2.43.0

