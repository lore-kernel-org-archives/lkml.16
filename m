Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6268B207DE2
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 17:37:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747330635; cv=none; b=NzHbFxvC1Ol1sf4UPLlYcKKySaBUIrgXVXkm8CwL610rrPDGyE0BoGJmTX8pONUhF/9s68Fnzm+bLxPPvWO/fIjU0hEFf92VybNlbRPOa/lJ6cxjFsbfK+zz8XVCOxAkDm3d6CRbcxba8WL4caT5tMIxyH3t7Ow9OFg8qZKSpvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747330635; c=relaxed/simple;
	bh=6qMgjxdTCzXmZfwTSwN0iu9t85SHvq1aYnMUf0GnRBE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=C3XI+BuR+rWTlG9agufFH+CUfm+gBlCIVVFpna6RCTstiMJHcitYcMOWc3Ftt52B5rPVGyUK97nzKnQO5Mq6apizEphba1DCuBJtRKPABTIyqRitS72sMBpAVXI3u1nUpy/SgS6+HP7lj3wCG/x0PvMa4jW6/pYXn/w2sDGK+uE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from dude02.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::28])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <m.felsch@pengutronix.de>)
	id 1uFcVk-0008Ry-Ck; Thu, 15 May 2025 19:36:48 +0200
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
	alexander.stein@ew.tq-group.com
Cc: kernel@pengutronix.de,
	linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v2 0/2] i.MX fsl-ldb cleanups
Date: Thu, 15 May 2025 19:36:41 +0200
Message-Id: <20250515173643.2140748-1-m.felsch@pengutronix.de>
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

Marco Felsch (2):
  drm/bridge: fsl-ldb: make use of dev_err_probe
  drm/bridge: fsl-ldb: simplify device_node error handling

 drivers/gpu/drm/bridge/fsl-ldb.c | 41 ++++++++++++++------------------
 1 file changed, 18 insertions(+), 23 deletions(-)

-- 
2.39.5

