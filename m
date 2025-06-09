Received: from relay.smtp-ext.broadcom.com (relay.smtp-ext.broadcom.com [192.19.166.231])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDF0A21D5B2;
	Mon,  9 Jun 2025 21:23:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.19.166.231
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749504240; cv=none; b=BabcI7ab3MrEVPfhLAn/HVL/xMmCMdwm/HuoLFcKagostlvyeuSttib7Cf/iBQ242C4tT7DnbQ52OtgzrTb3PogqVzAwfcuAFT7lGDiEUWoAlp9/wBQi1+WJ8SnCWmmFrzQDe51EntNIGLx5o8HOy8dYzA4rUTwxZzPfCXDWFu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749504240; c=relaxed/simple;
	bh=8B9T9fn+R7WMR3vhm8/H3/wrhSAPlt2l7bsP0FgP/s4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=M1EcGgt/79aJ1wZMb75HaBTLDQXAY1X2fWZo6TiYl3jXTNqmtVFmca5Bye0gXtDA3t5D7eeFCCxFsYKVkRXDnpG+rL2hbPMlNWMfv3F+I4hb5waxAkRo1SD89UBZEpeOekrOn/wEJRR6OH93I0xdxpp7QIqAzOVQ6pocTwoCt9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=VpN39uzV; arc=none smtp.client-ip=192.19.166.231
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="VpN39uzV"
Received: from mail-lvn-it-01.broadcom.com (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id 50D7BC000338;
	Mon,  9 Jun 2025 14:23:58 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com 50D7BC000338
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1749504238;
	bh=8B9T9fn+R7WMR3vhm8/H3/wrhSAPlt2l7bsP0FgP/s4=;
	h=From:To:Cc:Subject:Date:From;
	b=VpN39uzV142RfVfXMPWNk4TP03tBp1tKhQKAoEJ2YqsxEy/nlcd9Mt1wal1xU/5gj
	 Hm09oS5jyP7zVIzi3WyOuakYBmzdKw7I4/QKrIZvHlb7k369aqRIERDnepEVL1C400
	 FvuYv310y75JhZLgSidXxe1ta3Dp8DIrAid9HNp8=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-lvn-it-01.broadcom.com (Postfix) with ESMTPSA id 2C9861800051E;
	Mon,  9 Jun 2025 14:23:58 -0700 (PDT)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: linux-kernel@vger.kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-arm-kernel@lists.infradead.org (moderated list:BROADCOM BCM7XXX ARM ARCHITECTURE)
Subject: [PATCH v2 0/2] Simplify compatible matching for brcmstb_memc
Date: Mon,  9 Jun 2025 14:23:54 -0700
Message-ID: <20250609212356.2264244-1-florian.fainelli@broadcom.com>
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

