Received: from relay.smtp-ext.broadcom.com (relay.smtp-ext.broadcom.com [192.19.144.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0994B298C0F;
	Fri, 23 May 2025 18:51:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.19.144.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748026278; cv=none; b=jpuTTcakxZgOi3iObg8QSikc8I97Em2XzCMnkJOqim+rsqqmQGqSyoTdo2DANs1SYhrApMPIns5Ruc+y5vWmR5C6fwL4ZQ3oFt3MnPbO+qIPYBpA1Y4Xj69j5q+ZB+R2KFik4MnXACeO/QlSAvTW1qQZRNXDkUOBvBAt6jDNHuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748026278; c=relaxed/simple;
	bh=JPmw13LQjUX7dzgaZHyy9hQs9P4b4WDlWaBHH8jMG7Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aE4H51AOKFsQbwIWHzc71nV3+cw/w/5QTWlaZIXfusSHb8aSSYcHiRJsLGBs2Qknxx+f0xLP7rCQdEShZjBwKoPXkYDsBN/N2wJ9j2K2x5vw42nKJ3kF2pv1J1gGWh7+xhKVi0RygMDGCVyosM9NTpq/XtYFQl6sGX4fmPmulh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=TUHGx0fR; arc=none smtp.client-ip=192.19.144.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="TUHGx0fR"
Received: from mail-lvn-it-01.broadcom.com (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id 600D3C001532;
	Fri, 23 May 2025 11:43:57 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com 600D3C001532
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1748025837;
	bh=JPmw13LQjUX7dzgaZHyy9hQs9P4b4WDlWaBHH8jMG7Y=;
	h=From:To:Cc:Subject:Date:From;
	b=TUHGx0fRw9QmtMB9S/6+P4mM7cQRL71O21/8jEVoq2Y+kNSldPXCeI//4SHWomPtj
	 rT2fu+uS6B9kxmOz1d0caEmIAogNHn+5th/1a+yPuFB/J7hGxAQ67cSiYXr1IyZBZL
	 4eE6NCOtOyLXjvQUZ0uptYiCnDdW9kO9nbAOxMNY=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-lvn-it-01.broadcom.com (Postfix) with ESMTPSA id 00B7C18000530;
	Fri, 23 May 2025 11:43:56 -0700 (PDT)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: linux-kernel@vger.kernel.org
Cc: justin.chen@broadcom.com,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-arm-kernel@lists.infradead.org (moderated list:BROADCOM BCM7XXX ARM ARCHITECTURE)
Subject: [PATCH 0/2] Simplify compatible matching for brcmstb_memc
Date: Fri, 23 May 2025 11:43:52 -0700
Message-ID: <20250523184354.1249577-1-florian.fainelli@broadcom.com>
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

Thank you

Florian Fainelli (2):
  dt-bindings: memory-controller: Define fallback compatible
  memory: brcmstb_memc: Simplify compatible matching

 .../brcm,brcmstb-memc-ddr.yaml                | 51 +++++++++-------
 drivers/memory/brcmstb_memc.c                 | 58 +------------------
 2 files changed, 34 insertions(+), 75 deletions(-)

-- 
2.43.0

