Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3E62213E71
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 22:25:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747261516; cv=none; b=XgIkEep/vtk8aWx+eQjiKst7hmP/gO5cPl3+vfg570zxq3/8R4Zgcmr2rz8A5eYtLp4LghnNTWed5dzYSAHIiZvpoDQ6Cy6nf979gVGRVOeRp1Fwj0rE0Kz9AygZNX+/12QUP+HPCbRhhH8vLpCjBFVgAi1cIo/npl34kEcDr5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747261516; c=relaxed/simple;
	bh=Plooael3bnGho8oi0h7sbPBhNwaamlOrzpZfWkNeqL4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=e8xBAzR1soYzJ0wyE+lLMMaSPKn089QuqVwABqLZdOxEGpDSIleGJxVmD0SqVUT3wbwyJKI4kgJc/qW91f6OJd1RKlSOkk3qHeehdXGdESg48FwAIqgH8CC4sUY3bXO2cVv/WJ9xhCNTNsGv/p2p0qHcsaP58rCMKPORNT5ovSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from dude02.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::28])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <m.felsch@pengutronix.de>)
	id 1uFKX5-0007tY-Kj; Thu, 15 May 2025 00:24:59 +0200
From: Marco Felsch <m.felsch@pengutronix.de>
To: andrzej.hajda@intel.com,
	neil.armstrong@linaro.org,
	rfoss@kernel.org,
	Laurent.pinchart@ideasonboard.com,
	jonas@kwiboo.se,
	jernej.skrabec@gmail.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	kernel@pengutronix.de
Subject: [PATCH 0/3] i.MX fsl-ldb cleanups
Date: Thu, 15 May 2025 00:24:50 +0200
Message-Id: <20250514222453.440915-1-m.felsch@pengutronix.de>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::28
X-SA-Exim-Mail-From: m.felsch@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-kernel@vger.kernel.org

Hi,

just a small series to cleanup the fsl-ldb lvds bridge driver a bit.

Regards,
Marco

Marco Felsch (3):
  drm/bridge: fsl-ldb: make use of driver_private
  drm/bridge: fsl-ldb: make use of dev_err_probe
  drm/bridge: fsl-ldb: simplify device_node error handling

 drivers/gpu/drm/bridge/fsl-ldb.c | 57 ++++++++++++++------------------
 1 file changed, 24 insertions(+), 33 deletions(-)

-- 
2.39.5

