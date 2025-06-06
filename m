Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03722A31;
	Fri,  6 Jun 2025 20:40:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749242429; cv=none; b=t8lt152wvbpJOMwZv7YxWDYd+PQfLQoqaTRFquU4Vm4XV7Xyzo03jwR1MNwAktlv01nnN7PX9obpuM5zqiM/kMLeT/bTuVCMBK6t+LUKfzQ9OOz7NPp5YYkDZBr79vAfluAUm15S8+hbeyZSKnNSkRgq/ld7JEpYQQimJ0y0zSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749242429; c=relaxed/simple;
	bh=PYJ17zVlwG6h6k8ktBpCxEgg0pf1P1oAEKV/s7pyeeY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LdiSkME6pYHYEWanHbdLKK0yAGDXYWuktvqS6FOVvwprLyCOeHof43NxA9heBqoulqSPDxXpuR100A99FrTwAJ9gcjd2SSskMZk+ajEWc0hKiOQ05nzccypD1KNR54s2SXD72NMbGQWvp0I9YLSWPHZRhyBrHighaxc7XL4LXIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=listout.xyz; spf=pass smtp.mailfrom=listout.xyz; dkim=pass (2048-bit key) header.d=listout.xyz header.i=@listout.xyz header.b=tRA8tjyp; arc=none smtp.client-ip=80.241.56.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=listout.xyz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=listout.xyz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=listout.xyz header.i=@listout.xyz header.b="tRA8tjyp"
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4bDY9F2gn0z9sqs;
	Fri,  6 Jun 2025 22:40:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=listout.xyz; s=MBO0001;
	t=1749242417;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=itUArjAKsAYhptKQCK+BX5ePPL1yAExXPENZKWZynC0=;
	b=tRA8tjypf1SBzyhIWfD8S5NO55tkte5uSZ7uDILW/gxo6Kezz/DetjB24SmKR2Z/NDm17U
	HWCyMC802dmXd+2U4Fpam92wwlnJc28qPqs/WewnsP5FZMwOPWpcaJzXN2mGrjviGDHrql
	0j/+SyNSXfFcdMU1tRYGxWDcmRiUyuuWEH9aHI+bmqEz9vIQky45V52T2IgWV5q4+JltCx
	k83XUc/pQNA+bzD4z+/uzz8B7wrR+VuFNr5NWhtODzMqGarzqRURs2Ri0Iq2S6oRCemZnF
	lqHBwVbu0wgH+kFiYuZNehZtQSCShbeMhwOnYI35c6/RQcQ3IUO6oQUpIv5OxA==
From: Brahmajit Das <listout@listout.xyz>
To: linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org
Cc: wychay@ctl.creative.com,
	tiwai@suse.com,
	perex@perex.cz
Subject: [PATCH 1/1] ALSA: ctxfi: Replace deprecated strcpy() with strscpy()
Date: Sat,  7 Jun 2025 02:10:00 +0530
Message-ID: <20250606204000.8156-1-listout@listout.xyz>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 4bDY9F2gn0z9sqs

strcpy() is deprecated; use strscpy() instead. Use strscpy() to copy the
long name because there's no string to format with sprintf().

No functional changes intended.

Link: https://github.com/KSPP/linux/issues/88

Signed-off-by: Brahmajit Das <listout@listout.xyz>
---
 sound/pci/ctxfi/xfi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/pci/ctxfi/xfi.c b/sound/pci/ctxfi/xfi.c
index 713d36ea40cb..d8dd84d41c87 100644
--- a/sound/pci/ctxfi/xfi.c
+++ b/sound/pci/ctxfi/xfi.c
@@ -98,8 +98,8 @@ ct_card_probe(struct pci_dev *pci, const struct pci_device_id *pci_id)
 	if (err < 0)
 		goto error;
 
-	strcpy(card->driver, "SB-XFi");
-	strcpy(card->shortname, "Creative X-Fi");
+	strscpy(card->driver, "SB-XFi");
+	strscpy(card->shortname, "Creative X-Fi");
 	snprintf(card->longname, sizeof(card->longname), "%s %s %s",
 		 card->shortname, atc->chip_name, atc->model_name);
 
-- 
2.49.0

