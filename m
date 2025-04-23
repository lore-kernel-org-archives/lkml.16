Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CB1C27C85C
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 08:21:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745396477; cv=none; b=G+Rq33J3JbUmCQVvX8x+06HHMWUfb3Itq0wcBkGSVfblnI99d75wHtyMLVxdYyGDspSY4LP9Q+R0JdBIo+pMLawtzeIlXZKNfHAsZcrT0h9tEbfQ//dinHGRtSjlhRA75YcHH/H4NMfAaqzqH/JcILm2UauwDxbrML0KIIlaQGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745396477; c=relaxed/simple;
	bh=ac5S2X3sWmh08U5JD9QdCfMbz/52WrPI+ah0XzYURio=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=olousT2EEIGtqmwyD5lH+uJISg3O3tC1seO+fH0zwC7NNLRarlr5IDoAJ5YgXDRn94N6ng2snu9m5FKyQ99t1BizURTYwnJ6C6aJcxLBEQZ9nLUmrOk8spxa/Rb3hTqw7kOCjVEy1XHAWiJ+ICVuP3wh8b5WLhk1S4GIVQ9cUbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <s.hauer@pengutronix.de>)
	id 1u7VLu-0003K4-5H; Wed, 23 Apr 2025 10:21:06 +0200
Received: from dude02.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::28])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <s.hauer@pengutronix.de>)
	id 1u7VLt-001gbF-1w;
	Wed, 23 Apr 2025 10:21:05 +0200
Received: from localhost ([::1] helo=dude02.red.stw.pengutronix.de)
	by dude02.red.stw.pengutronix.de with esmtp (Exim 4.96)
	(envelope-from <s.hauer@pengutronix.de>)
	id 1u7VLt-00BoAZ-1Z;
	Wed, 23 Apr 2025 10:21:05 +0200
From: Sascha Hauer <s.hauer@pengutronix.de>
Subject: [PATCH v2 0/4] wifi: mwifiex: drop asynchronous init waiting code
Date: Wed, 23 Apr 2025 10:21:01 +0200
Message-Id: <20250423-mwifiex-drop-asynchronous-init-v2-0-1bb951073a06@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAO2iCGgC/42NQQ6CMBBFr0Jm7Zi2WBVX3sOwaGAKs7AlLWAJ6
 d2tnMDl+/l5b4dIgSnCo9oh0MqRvSugThV0o3EDIfeFQQmlxUUKfH/YMiXsg5/QxM11Y/DOLxH
 Z8YxGWlXXjWi0uUGRTIEspyPwaguPHGcftqO3yt/6t3qVKPBqlFTWNPKu6TmRG5a5fDide4I25
 /wFFhrEIdEAAAA=
To: Brian Norris <briannorris@chromium.org>, 
 Francesco Dolcini <francesco@dolcini.it>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, 
 kernel@pengutronix.de, Sascha Hauer <s.hauer@pengutronix.de>, 
 Francesco Dolcini <francesco.dolcini@toradex.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745396465; l=1565;
 i=s.hauer@pengutronix.de; s=20230412; h=from:subject:message-id;
 bh=ac5S2X3sWmh08U5JD9QdCfMbz/52WrPI+ah0XzYURio=;
 b=zVfDL9QyPySAhVoQt4Jy16nC1/aLV9W91br+67JJy3kzZybOpY/sGh+hxgIzM1Qr9RB0ZhFye
 pF3JdR1uHHYCZTIt6siOhK0Ff2/AeuFwWjhHs21GJ9oy7S+OpM3PFyl
X-Developer-Key: i=s.hauer@pengutronix.de; a=ed25519;
 pk=4kuc9ocmECiBJKWxYgqyhtZOHj5AWi7+d0n/UjhkwTg=
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: s.hauer@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-kernel@vger.kernel.org

This is a spin-off from my mwifiex cleanup series. I have split the
original single patch into a series which hopefully makes the changes
easier to follow and verify.

Sascha

Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---
Changes in v2:
- squashed fixup sent separately into series
- Fix some checkpatch warnings in commit messages
- Add Acked-by tags from Brian Norris
- Add Reviewed-by tags from Francesco Dolcini
- Link to v1: https://lore.kernel.org/r/20250410-mwifiex-drop-asynchronous-init-v1-0-6a212fa9185e@pengutronix.de

---
Sascha Hauer (4):
      wifi: mwifiex: remove unnecessary queue empty check
      wifi: mwifiex: let mwifiex_init_fw() return 0 for success
      wifi: mwifiex: drop asynchronous init waiting code
      wifi: mwifiex: remove mwifiex_sta_init_cmd() last argument

 drivers/net/wireless/marvell/mwifiex/cfg80211.c |  8 ++++----
 drivers/net/wireless/marvell/mwifiex/cmdevt.c   | 16 ----------------
 drivers/net/wireless/marvell/mwifiex/init.c     | 21 ++++++++-------------
 drivers/net/wireless/marvell/mwifiex/main.c     | 25 +++----------------------
 drivers/net/wireless/marvell/mwifiex/main.h     |  8 +-------
 drivers/net/wireless/marvell/mwifiex/sta_cmd.c  |  8 +-------
 drivers/net/wireless/marvell/mwifiex/util.c     | 18 ------------------
 7 files changed, 17 insertions(+), 87 deletions(-)
---
base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
change-id: 20250410-mwifiex-drop-asynchronous-init-a1f2339095a7

Best regards,
-- 
Sascha Hauer <s.hauer@pengutronix.de>

