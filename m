Received: from out-178.mta1.migadu.com (out-178.mta1.migadu.com [95.215.58.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47A7B9475
	for <linux-kernel@vger.kernel.org>; Sat,  5 Apr 2025 02:46:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743821187; cv=none; b=SjtUHKGM0gvK+Kg7tWnm8b9DWRqKKkU/rrpNMY14Px57m4cs1DLMWeWHjVpdH5TzxaUWK+NRybk+bmXH6bJcil36K5YSdwMhgaQ1W9rHt3LGsvatqfO0Rzyd3peh/XFpakmn6UwVPci+8QHKcV8j4ogrQu2iBMD3OkW7KWxeZ2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743821187; c=relaxed/simple;
	bh=bPVU9yDqUtwG2qdRfRi4qrOEsRagxKisWfaznoBfwNw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=O5NpyQAdx9HHW4b6VRrSGhmuwAOyPTgtWnPiJ1Q85VUXxpNN/sJcN/gstE1GIhSVCfkfL1B+GFNr9s2X3W/yfrrwIT/cKhBM7kvG2H4SZm8MmeheHa8DpnoxQNlBzbTPKBTs9/Ul/R5fv/5ixUMCdBUKvI+Zokht+gtFl+H5JqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=oKdFSYqe; arc=none smtp.client-ip=95.215.58.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="oKdFSYqe"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1743821177;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=EP478WzMsSCtRI5Mu7jauIRslH9HlpNNETR+bFH5QtM=;
	b=oKdFSYqeE317Rli9vCrvCassxByQPZTBufb5vxPkw7IwqVlQ05Q52HOQWdQAmYd3qegXSW
	HnGfQzfkoHx4nCX1GVq4lkaKHYdxdrhvzGas7TR2y/oN8a2p73BgGZqKLClpYxA034+CdI
	wOF94oq1+mUJAMIloGkH+YM/9wplvkE=
From: sunliming@linux.dev
To: mripard@kernel.org,
	dave.stevenson@raspberrypi.com,
	mcanal@igalia.com,
	kernel-list@raspberrypi.com,
	maarten.lankhorst@linux.intel.com,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	sunliming <sunliming@kylinos.cn>,
	kernel test robot <lkp@intel.com>,
	Dan Carpenter <dan.carpenter@linaro.org>
Subject: [PATCH] drm/vc4: fix uninitialized smatch warnings
Date: Sat,  5 Apr 2025 10:45:03 +0800
Message-Id: <20250405024503.694981-1-sunliming@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

From: sunliming <sunliming@kylinos.cn>

Fix below smatch warnings:
drivers/gpu/drm/vc4/vc4_gem.c:604 vc4_lock_bo_reservations() error: uninitialized symbol 'ret'.

Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Closes: https://lore.kernel.org/r/202504021500.3AM1hKKS-lkp@intel.com/
Signed-off-by: sunliming <sunliming@kylinos.cn>
---
 drivers/gpu/drm/vc4/vc4_gem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vc4/vc4_gem.c b/drivers/gpu/drm/vc4/vc4_gem.c
index 8125f87edc60..04ea1696fc5d 100644
--- a/drivers/gpu/drm/vc4/vc4_gem.c
+++ b/drivers/gpu/drm/vc4/vc4_gem.c
@@ -582,7 +582,7 @@ static int
 vc4_lock_bo_reservations(struct vc4_exec_info *exec,
 			 struct drm_exec *exec_ctx)
 {
-	int ret;
+	int ret = 0;
 
 	/* Reserve space for our shared (read-only) fence references,
 	 * before we commit the CL to the hardware.
-- 
2.25.1

