Received: from relay.smtp-ext.broadcom.com (relay.smtp-ext.broadcom.com [192.19.166.228])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1017B1E3DF2;
	Mon,  9 Jun 2025 21:29:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.19.166.228
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749504590; cv=none; b=gXTGSlYSbs3EODeeJTFTOBuZZbwx2sEP5kmTqhIPKRaDKy1J8zJHMXJ0vIAX6JEiS3OocJ/tfIN43H3NoMkTZexx2ynCqayxIrmDWTxD6FAGfbHEGhe+QMpYEmiUaqDtipbHMdPPvwL/mFkqOUVDAjJbBYBC+UfuN8xfGBXo+cs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749504590; c=relaxed/simple;
	bh=8B9T9fn+R7WMR3vhm8/H3/wrhSAPlt2l7bsP0FgP/s4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=t5dJCav7ZBJvFNj6t1h9rjwavwYb9gsSw4HlLtIgfCsXiXS3P/x5Fd010NMHFqUIZdw2LCPOZmDu/AfVfldPhzJadA4gv5JrW0QNObaMyagOxsO0cIWV9Izqe3vALwMOWBy+Lc/VpuuxrvdcT3prxR9d06pyoect3mrWIGQ2fYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=UO3LtBzY; arc=none smtp.client-ip=192.19.166.228
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="UO3LtBzY"
Received: from mail-lvn-it-01.broadcom.com (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id 7904EC0000F4;
	Mon,  9 Jun 2025 14:23:13 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com 7904EC0000F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1749504193;
	bh=8B9T9fn+R7WMR3vhm8/H3/wrhSAPlt2l7bsP0FgP/s4=;
	h=From:To:Cc:Subject:Date:From;
	b=UO3LtBzYqhiICZRjUBNeBG25UcPnjsbEEjH2A6kagf111YN/VBcxkycxwKSU8e8Ju
	 5YJ5J1lwTRn8li2Mz9sQ1q+PgCH8nB/BFwsNm5kVqUzgx6cZA80wvyJ2brB8LWJ4Nl
	 r5qhHPvW3aEGWPyHv1wjdEM88rFsQ0SloLeTYK3s=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-lvn-it-01.broadcom.com (Postfix) with ESMTPSA id 4C8051800051E;
	Mon,  9 Jun 2025 14:23:13 -0700 (PDT)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: linux-kernel@vger.kernel.orgg
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	linux-kernel@vger.kernel.org (open list:MEMORY CONTROLLER DRIVERS),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-arm-kernel@lists.infradead.org (moderated list:BROADCOM BCM7XXX ARM ARCHITECTURE)
Subject: [PATCH v2 0/2] Simplify compatible matching for brcmstb_memc
Date: Mon,  9 Jun 2025 14:23:09 -0700
Message-ID: <20250609212311.2264108-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since the conversation died off in
https://lore.kernel.org/all/20241217194439.929040-2-florian.fainelli@broadcom.com/
here is a second attempt at addressing what I understood from the
conversation back then.

Changes in v2:

- define "brcm,brcmstb-memc-ddr-rev-b.2.1" as the fallback property

Florian Fainelli (2):
  dt-bindings: memory-controller: Define fallback compatible
  memory: brcmstb_memc: Simplify compatible matching

 .../brcm,brcmstb-memc-ddr.yaml                | 54 +++++++++++-------
 drivers/memory/brcmstb_memc.c                 | 56 +------------------
 2 files changed, 36 insertions(+), 74 deletions(-)

-- 
2.43.0

