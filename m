Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BED52FE33C
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 20:56:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.90.84.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751403410; cv=none; b=I5HToisKsZ5beuAKgOHXAKYyJXRkhV9Nh3h7GavyDcI1SKo8NcmqmW/BMo1c21jUFasp1ElGai/8AU8h6Qy6r3WI58o/fpIVz5+hNUDpl8nS8Cpc83nyZJvUY3/fBbWwqx+DS82+S2FroSPZW7QtHdGnkv1fKvt9bmUNWhbBNPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751403410; c=relaxed/simple;
	bh=xs1k1IKAt2QUNwG4AyLQYMUY9rKaJpNgz35MNxAhIfU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FBmv/b3oGygaea8efa5TaB6Shi5ThJZDIicUYPBTv7xsHB4ebiIMdY9BdJJLf19NaG5G53HwSSVgEmJof1vvI/Jnyvf3u4JvW/I3mMsuVuXpx/XPJ3pOl4YaOW8MofeCtkKu5AtGJIR8B3JAOPvScd3pyT6RgHDEQc30RzdxC3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com; spf=pass smtp.mailfrom=tuxedocomputers.com; dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b=YRnCJaCr; arc=none smtp.client-ip=157.90.84.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="YRnCJaCr"
Received: from wse-pc.fritz.box (pd9e59880.dip0.t-ipconnect.de [217.229.152.128])
	(Authenticated sender: wse@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPA id 4C31D2FC022C;
	Tue,  1 Jul 2025 22:56:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1751403398;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=oiDQGr9MkOCts7ZkE3xY4x9skLNvAEcRqxFvVngRJEo=;
	b=YRnCJaCrDEE3QOlZP/VEVkYCmhAdqZXmT9XgOPcrduoyeid8qoE9ktRHx/VjNIL6z/Tjlv
	xSUheyXdHre0/ulWgKsoBk4q+5seNn/tznKNTb4Zkdq40nCzFm018QbgnimK4LXdn3LM/F
	jLmc2gPCjvi5raV+SAxEu8ypZBpWHtI=
Authentication-Results: mail.tuxedocomputers.com;
	auth=pass smtp.auth=wse@tuxedocomputers.com smtp.mailfrom=wse@tuxedocomputers.com
From: Werner Sembach <wse@tuxedocomputers.com>
To: Keith Busch <kbusch@kernel.org>,
	Jens Axboe <axboe@kernel.dk>,
	Christoph Hellwig <hch@lst.de>,
	Sagi Grimberg <sagi@grimberg.me>
Cc: Georg Gottleuber <ggo@tuxedocomputers.com>,
	Werner Sembach <wse@tuxedocomputers.com>,
	linux-nvme@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] nvme-pci: Add TUXEDO IBS Gen8 to Samsung sleep quirk
Date: Tue,  1 Jul 2025 22:55:49 +0200
Message-ID: <20250701205630.64031-1-wse@tuxedocomputers.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Georg Gottleuber <ggo@tuxedocomputers.com>

On the TUXEDO InfinityBook S Gen8, a Samsung 990 Evo NVMe leads to
a high power consumption in s2idle sleep (3.5 watts).

This patch applies 'Force No Simple Suspend' quirk to achieve a sleep with
a lower power consumption, typically around 1 watts.

Signed-off-by: Georg Gottleuber <ggo@tuxedocomputers.com>
Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
Cc: stable@vger.kernel.org
---
 drivers/nvme/host/pci.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/nvme/host/pci.c b/drivers/nvme/host/pci.c
index 8ff12e415cb5d..d677080e67d33 100644
--- a/drivers/nvme/host/pci.c
+++ b/drivers/nvme/host/pci.c
@@ -3198,10 +3198,12 @@ static unsigned long check_vendor_combination_bug(struct pci_dev *pdev)
 		 * Exclude Samsung 990 Evo from NVME_QUIRK_SIMPLE_SUSPEND
 		 * because of high power consumption (> 2 Watt) in s2idle
 		 * sleep. Only some boards with Intel CPU are affected.
+		 * (Note for testing: Samsung 990 Evo Plus has same PCI ID)
 		 */
 		if (dmi_match(DMI_BOARD_NAME, "DN50Z-140HC-YD") ||
 		    dmi_match(DMI_BOARD_NAME, "GMxPXxx") ||
 		    dmi_match(DMI_BOARD_NAME, "GXxMRXx") ||
+		    dmi_match(DMI_BOARD_NAME, "NS5X_NS7XAU") ||
 		    dmi_match(DMI_BOARD_NAME, "PH4PG31") ||
 		    dmi_match(DMI_BOARD_NAME, "PH4PRX1_PH6PRX1") ||
 		    dmi_match(DMI_BOARD_NAME, "PH6PG01_PH6PG71"))
-- 
2.43.0

