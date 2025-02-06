Received: from out-189.mta0.migadu.com (out-189.mta0.migadu.com [91.218.175.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B92114B080
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 19:41:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.189
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738870918; cv=none; b=rUe0Ji+SKR5xdWP6vkoL2xk0eXHZOA3vrFHMm2iNz68Dg3Rt1j7ZtnP9jwFnwBIVp2Dye7zU7wqZ/ajvBGr7sFwm2KQqa7tKqK9sSCTGWZB9CfgDxqlXHJGtUqXhrMg/T35SstVuzW0FHpOut89kliPrldc65ouU4QD9XWLIY/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738870918; c=relaxed/simple;
	bh=UiPpvLfFo2VI6xFgUBB6L8NWVX5/OqRe6IO+80S+KqA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=nYbgmmdmpWsz+ZiADyxnc1qm97LeGPibtGeh1PdGDmcVXcBxPAq/wJsWsET9Pu585D0ubhoand86/U0Gvuax4l48gHePpCd2cS2cdVRoHxzaHfiiGtk8L9EkK75wUIrAN+HEB+HyV87UZMUGgC4L+FlGprWC4NYRfFUmJ5JBqR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=wT6+1JkQ; arc=none smtp.client-ip=91.218.175.189
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="wT6+1JkQ"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1738870908;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=H3ERdyORHyhsdzYOMftryM/Ef5Li3AJl8m+M0gEaqgk=;
	b=wT6+1JkQUkGc+yfPr+1grUe8rHdlRqzGZfWVntt+KINN1QflyxK2Sk/VTtvH9aRDE5hdEx
	6DP7q/LhK49EUDCqPRe/EivkxM3mP4HA3O38lYtmpkg5ESXJZQ54EpPI2xj+Gakq9XbLxe
	0nlAoEUC5U8wdTd56AWzk4B3BpWXZu8=
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
Subject: [PATCH 0/2] drm: zynqmp_dp: Use scope-based mutex helpers
Date: Thu,  6 Feb 2025 14:41:16 -0500
Message-Id: <20250206194117.1496245-1-sean.anderson@linux.dev>
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


Bart Van Assche (1):
  drm: zynqmp_dp: Fix a deadlock in zynqmp_dp_ignore_hpd_set()

Sean Anderson (1):
  drm: zynqmp_dp: Use scope-based mutex helpers

 drivers/gpu/drm/xlnx/zynqmp_dp.c | 151 ++++++++++++-------------------
 1 file changed, 58 insertions(+), 93 deletions(-)

-- 
2.35.1.1320.gc452695387.dirty

