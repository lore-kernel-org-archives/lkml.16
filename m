Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 901F5242D9F;
	Thu, 19 Jun 2025 07:06:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.154.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750316813; cv=none; b=kseZZM40w76lkLA4NymOkLsHaXT8S4lYZuACLIuDn4IB32l4CKjp4qmK9+U0yTL1tgoY/5d0f6PW88ScDvK9FE4GL6LMVMz7MuNAMB/duXTmTHPR3GtwLqfs1JJbnIfj4pmjpSxk/cYWalN5qYRYuCCYxX+j52m0Wt8o+kbg+LM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750316813; c=relaxed/simple;
	bh=o//kVFDTunc99C0AXM+9AtF6fAsGoPk6QCMYBVVFa0Q=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=GVv4eMBz8dZxemlNZ67+pa7HdripdadiwOxE+52TOv4kJdsUT92H5f0uum3qaCNR2vpigO4apZzMFuKK3/Vy9lCZ52GXbBoZl0PpsZ+JUSLwWMqIGeCfSltOVoavFSPHbdpQ9utg8LDfqAx32nYf6BvYdtixUaPP2YZjPeKc7u4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=ipyZVNkl; arc=none smtp.client-ip=68.232.154.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="ipyZVNkl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1750316811; x=1781852811;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=o//kVFDTunc99C0AXM+9AtF6fAsGoPk6QCMYBVVFa0Q=;
  b=ipyZVNklz8LJ7sms3UddP5+tyORGoNylq4dea2Kof6exw2brRPmk9xjv
   8FQn0FBz/DQBBcnQWaG2KQUlLY7R344PapJ1hBMqXyaumCDxT/XOGsDXJ
   QaiTWY3mRTMA8l4Dbj7FoNu8hn+a4XtqleublFJdHazm+yayhZmQjqrko
   yZ5h5oIT66q/lqWAJBitF5n742ipADhcpG76VZJiOTDVBP5ZP18YXU3/X
   reXXnrkaOGINEqS6a20LWjaUPwReH9mdl+meORd5qi6PtiRSjXdh/uhPS
   38I/4DZnR6UOeSY8dEEVR9ZQ0l+79HkgTe5kK+W4FnJYmSifLkkir/u4D
   A==;
X-CSE-ConnectionGUID: oDr9x4EZQ9ubUqoabc0KFg==
X-CSE-MsgGUID: lIjcawPLQnK5EqrSyawKcQ==
X-IronPort-AV: E=Sophos;i="6.16,247,1744095600"; 
   d="scan'208";a="43565501"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 19 Jun 2025 00:06:44 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 19 Jun 2025 00:06:44 -0700
Received: from archlinux.mchp-main.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.44 via Frontend Transport; Thu, 19 Jun 2025 00:06:41 -0700
From: Mihai Sain <mihai.sain@microchip.com>
To: <nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: Mihai Sain <mihai.sain@microchip.com>
Subject: [PATCH v3 0/2] Add cache configuration for Microchip SAMA7D and SAMA7G MPUs
Date: Thu, 19 Jun 2025 10:06:34 +0300
Message-ID: <20250619070636.8844-1-mihai.sain@microchip.com>
X-Mailer: git-send-email 2.50.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

This patch series adds cache configuration for Microchip SAMA7D and SAMA7G MPUs.
The cache configuration is described in datasheet chapter 15.2.

Changelog:

v2 -> v3:
- Remove the l1-cache node
- Move the L1 cache properties in the cpu node
- Align with device node requirements for cpu: 
  https://devicetree-specification.readthedocs.io/en/latest/chapter3-devicenodes.html#internal-l1-cache-properties

v1 -> v2:
- Remove the cache-unified property from l1-cache node

Mihai Sain (2):
  ARM: dts: microchip: sama7d65: Add cache configuration for cpu node
  ARM: dts: microchip: sama7g5: Add cache configuration for cpu node

 arch/arm/boot/dts/microchip/sama7d65.dtsi | 10 ++++++++++
 arch/arm/boot/dts/microchip/sama7g5.dtsi  | 10 ++++++++++
 2 files changed, 20 insertions(+)


base-commit: fb4d33ab452ea254e2c319bac5703d1b56d895bf
-- 
2.50.0

