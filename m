Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA62B22FE18
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 18:27:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749839233; cv=none; b=sNZADmdMr4JJoy4IIy0veTjyXoDB5k7upG0T/0X+oE98goHz3EO1ASaBMiUIl7LQvNRLpNxFSCXHV795G1ibN+pxVAia3oaVi29JUAXgW2ECRVi51TouW/j+jw4LwFdhVypoknsRQ2NX/avr80jY+7x10aKc/Kp9PpOCuY0Wo9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749839233; c=relaxed/simple;
	bh=cc1aGyoS7GYVlAEz6PyebiR4C1p77UwmtsDAOb9rkPA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rGjVfHEDG04ZWajJDwBd8wcume7HHRenHaIx8UACfN7DEVF4xjscnF9MOA/sLwKZmTABVDB3BBo8v21XcvvUzSxxxV8+1D4SxQkFWjKTV5S6eyMPvRZLAnLFATXjxf9OPbZgyUSA4jISvKBUIcoy8QJ4Ff07AN3wkozAhwNM9+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=d2VKEaFV; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="d2VKEaFV"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=TUXPkE87OXJAHaOZK6ahNNVbIJxz7eNpz1YGq7eIuRc=; b=d2VKEaFVWxssYhQV70dvsctYtZ
	+vtX/HI7fMGE6d3djo2Av0potudAUBDIuSyRxvbYdKIFVmc8v6hiS4nzDLaCi074yM4pIb+YoPcTL
	IDrCR4NORRfnU4GOsRyiO0aaAe5PlNTDpRXJKff1hCdi6WXvE87wJWS1/0Atz7hSWX9Tr3Yyc4/TK
	mVeFutgOlORgqSn+pblbGqmOe+HhP1/z0S6QRj1yhPbvDkMF1xmy/poNOHS+mBkrOf41RMHWbrSde
	DrzpCxsGDo6kFmyVJ45yMkZzANcfTYsCyooJKG/+wyRyH2Eg92IjEU8JtTPzSkBBaRN2lTYG/AEVn
	4/ha6o0A==;
Received: from [191.204.192.64] (helo=localhost.localdomain)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1uQ97K-0039wK-OM; Fri, 13 Jun 2025 20:27:07 +0200
From: =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>
To: "Alex Deucher" <alexander.deucher@amd.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Thomas Zimmermann <tzimmermann@suse.de>
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	kernel-dev@igalia.com,
	amd-gfx@lists.freedesktop.org,
	=?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>
Subject: [PATCH 2/2] drm/amd: Include <linux/export.h> when needed
Date: Fri, 13 Jun 2025 15:26:51 -0300
Message-ID: <20250613182651.1758760-3-andrealmeid@igalia.com>
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

warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing

Signed-off-by: André Almeida <andrealmeid@igalia.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c  | 1 +
 drivers/gpu/drm/amd/amdxcp/amdgpu_xcp_drv.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
index 73403744331a..e9530ed6ad43 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
@@ -32,6 +32,7 @@
 #include <linux/list.h>
 #include <linux/slab.h>
 #include <linux/dma-buf.h>
+#include <linux/export.h>
 
 #include <drm/drm_drv.h>
 #include <drm/amdgpu_drm.h>
diff --git a/drivers/gpu/drm/amd/amdxcp/amdgpu_xcp_drv.c b/drivers/gpu/drm/amd/amdxcp/amdgpu_xcp_drv.c
index faed84172dd4..8bc36f04b1b7 100644
--- a/drivers/gpu/drm/amd/amdxcp/amdgpu_xcp_drv.c
+++ b/drivers/gpu/drm/amd/amdxcp/amdgpu_xcp_drv.c
@@ -21,6 +21,7 @@
  *
  */
 
+#include <linux/export.h>
 #include <linux/init.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
-- 
2.49.0

