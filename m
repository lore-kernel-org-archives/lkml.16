Received: from out-182.mta1.migadu.com (out-182.mta1.migadu.com [95.215.58.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3692023C8CD
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 16:25:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738945560; cv=none; b=M0xet2YviB9lAPYVNQufWCgTnNC47ssViRkWVUmvA9pDyAwDLkv+g2nJEgjDbxvrtDfnLAMYtDwRRJbX81gSlu6V92d0toJT82sWQ/w37jj/yADMD6xhRgxOrpDgxEhPZf93IIkVVXPYDAp4m9G29nI2zV02MWBqm7k+7JV5Oso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738945560; c=relaxed/simple;
	bh=yawkmvQtOltaptWe5cezSCNDT4beCZweKeSaC69T7+c=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=TpDr7+3hB/PIcTjiRSrAvCv+SY9Qx6aIso5L89eSGv/wSSTSqcC4aKUu69if00gBRDfvk3EJDm282Q33CSEaAtqLGnbxKFx668FVgtRHLpQlMo59NozsDW5ZPbAeNlngzfB18V5ybxITGWVyOdk5rxis3ydGDjCmoln/0rSXEA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=MPlDx1D4; arc=none smtp.client-ip=95.215.58.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="MPlDx1D4"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1738945555;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=tLZO5TvQipH7o3nT35LlHz7fY3vZ+oh2KE+7W4p1NmY=;
	b=MPlDx1D4hKyZxpnkM7gWL7ClY+G8TgNEpPFVZ9dHBoRPNNqY0lsJTo0L2t2KRFSFJhjrpI
	AutxiuNzupGNlBYhWN2vOeA7/XDFPsiDlWAbgeTLqrurZv4sDFVTjYdCn74G7IUrPPKK00
	U0h9RTa4AxqiMP3YJsh11wRVligoW+Y=
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
Subject: [PATCH v2 0/2] drm: zynqmp_dp: Use scope-based mutex helpers
Date: Fri,  7 Feb 2025 11:25:26 -0500
Message-Id: <20250207162528.1651426-1-sean.anderson@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Fix a mutex bug and convert most of the explicit mutex_(un)locks to
guards.

Changes in v2:
- Convert some conditional return statements to returns of ternary
  expressions.
- Remove unnecessary whitespace change

Bart Van Assche (1):
  drm: zynqmp_dp: Fix a deadlock in zynqmp_dp_ignore_hpd_set()

Sean Anderson (1):
  drm: zynqmp_dp: Use scope-based mutex helpers

 drivers/gpu/drm/xlnx/zynqmp_dp.c | 147 +++++++++++--------------------
 1 file changed, 50 insertions(+), 97 deletions(-)

-- 
2.35.1.1320.gc452695387.dirty

