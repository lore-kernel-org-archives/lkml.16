Received: from out-170.mta1.migadu.com (out-170.mta1.migadu.com [95.215.58.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4169123C8AF
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 16:26:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738945562; cv=none; b=ACMEpRyZuyYz8XRToL8ErudU9zb916cspHwnteFvHGEL74HqegV5QEoxTZ9gW0xfaIa5NSa6AXHbAbFK8NEUhNHa1DQjU3EkrTMcAiBjV1AW6c5ZvrazxXYrQr4cOFXQ8NLB4kOuBeT4RSdtUMh5AJnop7Mjp2LMSRh9BXM1W8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738945562; c=relaxed/simple;
	bh=lITkNCku0X7B4kDxLhLsKS7n7DFR/ohW5Eu7ptL8iIs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=t9MeqCYNqq424W6VFVFgecEWkhePP3X7BmZTshWO0yZF4mXbXkaO75NWDwvRQ6Fs9isJaTqGmNVV6CmbcX9ePESRN5Kf2u5WiB11ABO/+9LLN1N55s73WQmB+4LqTb9rdkP83wGGLmWd3LiXdAiw2vCVay24CTBvkKJhjtFQdr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=IsbGU1an; arc=none smtp.client-ip=95.215.58.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="IsbGU1an"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1738945558;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Sn0a84LV83FbtYgNJ4zSoh8nNRElw7Uji670f7zb7LM=;
	b=IsbGU1anshlM1CRTqZjHlSwaUX9IGhKzANB7px9fpOzmqY/osEQc8c2J4gKNuJQx8/vSx0
	ZVgRfZU61uhr4PISnxgcqNmgq6++91s8N09mxoJmiXTcYDc4ElzeXwRqoUX3TKK9xP84YW
	Xpr+4G4PddsdlaV3phQQK+jvN0OE/C0=
From: Sean Anderson <sean.anderson@linux.dev>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	dri-devel@lists.freedesktop.org (open list:DRM DRIVERS FOR XILINX)
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Michal Simek <michal.simek@amd.com>,
	Maxime Ripard <mripard@kernel.org>,
	linux-kernel@vger.kernel.org (open list),
	Thomas Zimmermann <tzimmermann@suse.de>,
	Bart Van Assche <bvanassche@acm.org>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/ZYNQ ARCHITECTURE),
	Sean Anderson <sean.anderson@linux.dev>
Subject: [PATCH v2 1/2] drm: zynqmp_dp: Fix a deadlock in zynqmp_dp_ignore_hpd_set()
Date: Fri,  7 Feb 2025 11:25:27 -0500
Message-Id: <20250207162528.1651426-2-sean.anderson@linux.dev>
In-Reply-To: <20250207162528.1651426-1-sean.anderson@linux.dev>
References: <20250207162528.1651426-1-sean.anderson@linux.dev>
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

(no changes since v1)

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

