Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 956D41DE3B8;
	Thu,  6 Feb 2025 18:15:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.154.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738865761; cv=none; b=OKk8BmV9n+SbRo0rp0tku2U66kkB3gQLkXV2ZYo1YeRzESJlTFYCo5ucSiovfHbqIoGJ7qrTfKwbSHUDyB7i+MCH21FO7m6s2xZaV5TPTEM9YsABa1uHwNdgUyvJq/png2V+wUAmHc7G2w7S9IF8iZkiq2BYMY/+WVVrT5Xxm1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738865761; c=relaxed/simple;
	bh=SKD2TenQ+bwI8i63TXBEgYe65VNMUMjWKYtu7WqmTuM=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=mX3XnnOi5lUbv2nmKW2C03ahUarN169lc6U4gZkxHByzMFdJTqUh3KcvQiSY5WgL6wpNrdBsueVRi96OHL6XyWzESPuJRIJZ1kyzPf+etZ5ScsXBeDnQYgJQYO6qYNFO+BBTcZC8m2MQ5BdIPwvOkyPiiUShrjBiNd/Q+q6yb2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=gbov5gjE; arc=none smtp.client-ip=68.232.154.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="gbov5gjE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1738865759; x=1770401759;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=SKD2TenQ+bwI8i63TXBEgYe65VNMUMjWKYtu7WqmTuM=;
  b=gbov5gjEseDMC7vdyqYNrLSNer/NowcC1U5cB/Df8vExfs8LP0jLUl8L
   hiorJSF8WHCNe/bbIfJOk7sqyW/skhzRrXJqY2F+AwVPEtTgXrATgsydo
   PSlpYrd4GbwjxkUilA07CzFYjYX3cCq2CjQQGWs5xJfhYa7+j+JkBcABb
   5+r/eeCdBIKh1xgGUJZs+CfzwBmJJNSKgwdkbmpbgD/WyTjhR1fYmpiTT
   Jr4ejQf1tfGEsa2dr+kFM/Zr4pJHXVYhJxU0n+m+Di9rL/8ePdwAztMNC
   iXFtfzF5kC0BzEe1mVkQM7h6OAi//44qwkvG4rkyVO4IN+Snwajf0yPrG
   A==;
X-CSE-ConnectionGUID: RUzZ0s40Rb2+hOFS2V1Qww==
X-CSE-MsgGUID: mtkiLefeRM2SZn7B6gED8w==
X-IronPort-AV: E=Sophos;i="6.13,264,1732604400"; 
   d="scan'208";a="36973012"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 06 Feb 2025 11:15:52 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 6 Feb 2025 11:15:32 -0700
Received: from ryan-Precision-3630-Tower.microchip.com (10.10.85.11) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Thu, 6 Feb 2025 11:15:32 -0700
From: <Ryan.Wanner@microchip.com>
To: <mturquette@baylibre.com>, <sboyd@kernel.org>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>
CC: <linux-clk@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <mripard@kernel.org>, Ryan Wanner
	<Ryan.Wanner@microchip.com>
Subject: [PATCH 0/2] AT91 Clock Adjustments
Date: Thu, 6 Feb 2025 11:14:41 -0700
Message-ID: <cover.1738864727.git.Ryan.Wanner@microchip.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Ryan Wanner <Ryan.Wanner@microchip.com>

This set has clock system adjustments for the AT91 clock system.

The first is to adjust the slow clock driver to account for the updated
DT node-naming for clocks and xtals and ensuring the driver is still
backwards compatible.

The second is a adding a missing clk_hw struct that is not added into
parent_data struct causing a incorrect parent for main_osc.

Ryan Wanner (2):
  clk: at91: sckc: Fix parent_data struct for slow osc
  clk: at91: sama7d65: Add missing clk_hw to parent_data

 drivers/clk/at91/sama7d65.c |  1 +
 drivers/clk/at91/sckc.c     | 12 ++++++------
 2 files changed, 7 insertions(+), 6 deletions(-)

-- 
2.43.0

