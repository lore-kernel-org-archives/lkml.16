Received: from out-170.mta0.migadu.com (out-170.mta0.migadu.com [91.218.175.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9A401A9B24
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 19:42:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738870938; cv=none; b=pyTGwrmFHyDOzHndSvkyh8bdu6EGSHVavtornqQ6aN0TCvIb796jac0DeyaQ6B0omZzrf+cHN9V0srGxiiwAwX7SmuNi43kqGBwXqGYfbyMQlVPYRB7eQ1PJGnb5QqS3w5E2EJMCtVeD1sqT4KSYeQojO46RNQLG1f1Zd/hTjto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738870938; c=relaxed/simple;
	bh=Od6Dxan21jz8/keSWi3Lrad9ObbuNyRJj00h5n3STbg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=m26bc3RE1GFMUQeFw4SXcgdGoPc/fD1/XV3LdimUdgLO/AB7it5Lqz+rzwTyTNMUpIsbXGJvc5aFxcl00X2RFv/cG9p9QyF+VVVhUCacbevfXccuXnu5p+Z/13mSY80MHcTnd3GxA4nylnZ4OT81gAM2DODC3vNHsmOUTvUJif4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=GHa1uwp2; arc=none smtp.client-ip=91.218.175.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="GHa1uwp2"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1738870928;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nZK/bu+U+BunpfC6VHKB5s7S43oPvXJGJkXPxJV9DLc=;
	b=GHa1uwp2L4ZpkRxR8aMWI3YDryRt/1t3jE/emX03upQMoAirq6MpvaHREEZiCsqLbA+B67
	x2k7uL+sLJD5CjAFi6jUGHbvz1bRPpxXy8e1lY/u8aOcpNr+xdRd152UPv1O0NoHVx5fx0
	kcePpf8A6GFUM+jpQrAa7pHiKpqa63k=
From: Sean Anderson <sean.anderson@linux.dev>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	dri-devel@lists.freedesktop.org (open list:DRM DRIVERS FOR XILINX)
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/ZYNQ ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list),
	David Airlie <airlied@gmail.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Michal Simek <michal.simek@amd.com>,
	Maxime Ripard <mripard@kernel.org>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Bart Van Assche <bvanassche@acm.org>,
	Sean Anderson <sean.anderson@linux.dev>
Subject: [PATCH 1/2] drm: zynqmp_dp: Fix a deadlock in zynqmp_dp_ignore_hpd_set()
Date: Thu,  6 Feb 2025 14:41:18 -0500
Message-Id: <20250206194117.1496245-2-sean.anderson@linux.dev>
In-Reply-To: <20250206194117.1496245-1-sean.anderson@linux.dev>
References: <20250206194117.1496245-1-sean.anderson@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

From: Bart Van Assche <bvanassche@acm.org>

Instead of attempting the same mutex twice, lock and unlock it.

This bug has been detected by the Clang thread-safety analyzer.

Cc: Sean Anderson <sean.anderson@linux.dev>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Fixes: 28edaacb821c ("drm: zynqmp_dp: Add debugfs interface for compliance testing")
Signed-off-by: Bart Van Assche <bvanassche@acm.org>
Reviewed-by: Sean Anderson <sean.anderson@linux.dev>
Signed-off-by: Sean Anderson <sean.anderson@linux.dev>
---

 drivers/gpu/drm/xlnx/zynqmp_dp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xlnx/zynqmp_dp.c b/drivers/gpu/drm/xlnx/zynqmp_dp.c
index 979f6d3239ba..189a08cdc73c 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_dp.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_dp.c
@@ -2295,7 +2295,7 @@ static int zynqmp_dp_ignore_hpd_set(void *data, u64 val)
 
 	mutex_lock(&dp->lock);
 	dp->ignore_hpd = val;
-	mutex_lock(&dp->lock);
+	mutex_unlock(&dp->lock);
 	return 0;
 }
 
-- 
2.35.1.1320.gc452695387.dirty

