Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC89A215F6B
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 18:27:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749839231; cv=none; b=il8r6n1hd5teesIdCUI5glKnMKQQvPbUu/twZhMhT1yjda9zAquw5cWICV2jjIPrR0B9hxBmfGugEE0+mSlqVDkRw472OQb++JIqhjnzTuDhbChQRYZCe7wf94UqFpdDzS2wg7iZqlkFeEvrcpGNvNobdgwc0hr1nNIvtMiD+i4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749839231; c=relaxed/simple;
	bh=qj+DVYWX1CiIt4YMAzkLP/DRFMkrDqM1bMgstIVWZL8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hVn0rj7wP2Xn0CQhBmMFqAs9oyTaXQrg/YfwLOcTiJFZD4Ifs0yesDhk7gh33/4pxYk7Nb8vYM4eSmCn8OD30bsHPJ3MH7Z4OnrBusxUfAPAwVziiLG1Emrl9rqB0dG5sA69tqkHsoMY6C6U9C+X1SBHpiU4g+E08/Nq1GYf9fc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=eYMjH+Py; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="eYMjH+Py"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=Jw6eTSGfc4LaSGLZJqS1CUGcSRHDcI0cmlisVpdZ69E=; b=eYMjH+Pysm5yO3qLIkENlqwKrC
	0C0wl7zz5jYJQwc7wvrINNDlammEszgL63jIdHnpa1Ri2Nm8cKWVmLCkWUrwqzrVtyMpsdxdsW9+V
	HUSqC4wCt2aTfAcn5QsU90+6BaF2RBXC1QbEGjZHsrmFAWyVyLczDS7B+89hdpO3WvV0xnVANax01
	gYJZHAVeN1xD5MXem9aRLfwxkaD0PJO8uxt9qTLBqcVuQ3qxlAg0rDeH7vHiwD/yQ+hMtHHiV+oS4
	c0q2tgmAdiCW/cFcYVdPneR0sIz5KAXFdP2YUua4mwVrzDqbdg/HJijUc5JB1rDpOby8gcgVXdVkb
	R4Vq1UQg==;
Received: from [191.204.192.64] (helo=localhost.localdomain)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1uQ97I-0039wK-GK; Fri, 13 Jun 2025 20:27:04 +0200
From: =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>
To: "Alex Deucher" <alexander.deucher@amd.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Thomas Zimmermann <tzimmermann@suse.de>
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	kernel-dev@igalia.com,
	amd-gfx@lists.freedesktop.org,
	=?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>
Subject: [PATCH 1/2] drm/amd: Do not include <linux/export.h> when unused
Date: Fri, 13 Jun 2025 15:26:50 -0300
Message-ID: <20250613182651.1758760-2-andrealmeid@igalia.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250613182651.1758760-1-andrealmeid@igalia.com>
References: <20250613182651.1758760-1-andrealmeid@igalia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Fix the following compile time warning when building with W=1:

warning: EXPORT_SYMBOL() is not used, but #include <linux/export.h> is present

Signed-off-by: André Almeida <andrealmeid@igalia.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_i2c.c      | 1 -
 drivers/gpu/drm/amd/amdkfd/kfd_chardev.c     | 1 -
 drivers/gpu/drm/amd/amdkfd/kfd_flat_memory.c | 1 -
 3 files changed, 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_i2c.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_i2c.c
index 8179d0814db9..57101d24422f 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_i2c.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_i2c.c
@@ -24,7 +24,6 @@
  *          Alex Deucher
  */
 
-#include <linux/export.h>
 #include <linux/pci.h>
 
 #include <drm/drm_edid.h>
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
index a2149afa5803..828a9ceef1e7 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
@@ -22,7 +22,6 @@
  */
 
 #include <linux/device.h>
-#include <linux/export.h>
 #include <linux/err.h>
 #include <linux/fs.h>
 #include <linux/file.h>
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_flat_memory.c b/drivers/gpu/drm/amd/amdkfd/kfd_flat_memory.c
index dbcb60eb54b2..1d170dc50df3 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_flat_memory.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_flat_memory.c
@@ -23,7 +23,6 @@
  */
 
 #include <linux/device.h>
-#include <linux/export.h>
 #include <linux/err.h>
 #include <linux/fs.h>
 #include <linux/sched.h>
-- 
2.49.0

