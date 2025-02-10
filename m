Received: from mx1.sberdevices.ru (mx1.sberdevices.ru [37.18.73.165])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39E5E1F8BDF
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 14:34:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=37.18.73.165
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739198086; cv=none; b=I4r4tQLZL0t4t+QoVGZS1InEuXOEE1QRRyzUDDzYAaBD90pqTA/Oz6gE+RNg/Isk/qJNe9nWQBkgTtllGceqDGCjwyTilPz7hHEPxJ4t+0tSAXMivFEQBOguHG7iykDomd3HtC5jAwMtx4L23CcscWqU5OagrqRRa0oOa3jkEVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739198086; c=relaxed/simple;
	bh=Su+xUnj29jEDroMHrxZ3sQTdKQqF4prBHb0PDtMYkSg=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=cWLznNXQV/rUAaoG0Mm6Kk0V1eIaxyxO/NIKtS6PfBn1OewYveZ0OiJCn3nAqlDtQICXBPJCsnTCKzA1MY1Amy2gh0J8oVgR8MjaAdNpXT2BiejE9pTPF6R3vqL+2JuVIHmdOzR2egce/Se6FZTeRaO4JvzwFYv1QzotL8lKyec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=salutedevices.com; spf=pass smtp.mailfrom=salutedevices.com; dkim=pass (2048-bit key) header.d=salutedevices.com header.i=@salutedevices.com header.b=Qs6JuEPr; arc=none smtp.client-ip=37.18.73.165
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=salutedevices.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=salutedevices.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=salutedevices.com header.i=@salutedevices.com header.b="Qs6JuEPr"
Received: from p-infra-ksmg-sc-msk01.sberdevices.ru (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 4F6E710000D;
	Mon, 10 Feb 2025 17:34:40 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 4F6E710000D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1739198080;
	bh=VIBk/bIEGoVw9/ZRg0E3oUUj8GEqsT4qLTRfIvmhKOI=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=Qs6JuEPrR2d1Q5XARmVt3DJNBXejYuBvM49zYHYdyMxDpFh5Ut5J2oEzuOxkri226
	 HxyvWX9RUbRAeCJIoi5cu+IAexqEaZvjnRCy9vJc5y3W5sQHaQ0ASiCCSTJl0a2YDv
	 Umcd/MYPy7k8AEbh0eOT2s3Rte92Hpga0symu3zQl7eWHfwj1WlHh8iL6+3Y38C/Ae
	 iU2GEWIbTlZYTp1rnlmlniKxw8cf2OBIxIkrY0/0wL+b1CzPbZXsxIvpDOHmUiXdou
	 cfjsl7sle6BzZDaGWfb3pf/fIRjiJbsbSTbmU1obGD4ADoo+A44g0TmROZyWRcqj8N
	 sDjsSOkX9RIDA==
Received: from smtp.sberdevices.ru (p-i-exch-sc-m01.sberdevices.ru [172.16.192.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Mon, 10 Feb 2025 17:34:39 +0300 (MSK)
From: Martin Kurbanov <mmkurbanov@salutedevices.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
	<richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Ezra Buehler
	<ezra.buehler@husqvarnagroup.com>, Cheng Ming Lin <chengminglin@mxic.com.tw>,
	Pratyush Yadav <pratyush@kernel.org>, Daniel Golle <daniel@makrotopia.org>,
	Frieder Schrempf <frieder.schrempf@kontron.de>, Alexey Romanov
	<avromanov@salutedevices.com>
CC: <linux-kernel@vger.kernel.org>, <linux-mtd@lists.infradead.org>,
	<kernel@salutedevices.com>, Martin Kurbanov <mmkurbanov@salutedevices.com>
Subject: [PATCH v5 0/6] mtd: spinand: add OTP support
Date: Mon, 10 Feb 2025 17:34:12 +0300
Message-ID: <20250210143429.286803-1-mmkurbanov@salutedevices.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: p-i-exch-a-m2.sberdevices.ru (172.24.196.120) To
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 190904 [Feb 10 2025]
X-KSMG-AntiSpam-Version: 6.1.1.7
X-KSMG-AntiSpam-Envelope-From: mmkurbanov@salutedevices.com
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 51 0.3.51 68896fb0083a027476849bf400a331a2d5d94398, {Tracking_uf_ne_domains}, {Tracking_from_domain_doesnt_match_to}, lore.kernel.org:7.1.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;127.0.0.199:7.1.2;salutedevices.com:7.1.1;smtp.sberdevices.ru:7.1.1,5.0.1, FromAlignment: s
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean, bases: 2025/02/10 13:13:00
X-KSMG-LinksScanning: Clean, bases: 2025/02/10 11:09:00
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2025/02/10 08:53:00 #27153032
X-KSMG-AntiVirus-Status: Clean, skipped

This patchset implements the SPI-NAND OTP functions to allow access to
the SPI-NAND OTP data.
Specific support is added for Micron MT29F2G01ABAGD and ESMT F50L1G41LB/
F50D1G41LB flash chips.

Changelog:
  v5 since v4 at [1]:
    - Rebased to master

  v4 since v3 at [2]:
    - Support for factory OTP

  v3 since v2 at [3]:
    - Make cosmetic changes (Miquel Raynal)
    - Separate patch to introduce helper functions
    - Use dev_warn() instead of pr_warn()/WARN()
    - New patch for introducing the start_page field when defining OTP
    - Use mem_is_zero()

  v2 since v1 at [4]:
    - Make cosmetic changes (Miquel Raynal)

Links:
  [1] https://lore.kernel.org/all/20250127153848.199526-1-mmkurbanov@salutedevices.com/
  [2] https://lore.kernel.org/all/20241226135623.43098-1-mmkurbanov@salutedevices.com/
  [3] https://lore.kernel.org/all/20240827174920.316756-1-mmkurbanov@salutedevices.com/
  [4] https://lore.kernel.org/all/20240617133504.179705-1-mmkurbanov@salutedevices.com/

Martin Kurbanov (6):
  mtd: spinand: make spinand_{read,write}_page global
  mtd: spinand: add OTP support
  mtd: spinand: make spinand_{wait,otp_page_size} global
  mtd: spinand: otp: add helpers functions
  mtd: spinand: micron: OTP access for MT29F2G01ABAGD
  mtd: spinand: esmt: OTP access for F50{L,D}1G41LB

 drivers/mtd/nand/spi/Makefile |   3 +-
 drivers/mtd/nand/spi/core.c   |  50 ++++-
 drivers/mtd/nand/spi/esmt.c   |  90 ++++++++-
 drivers/mtd/nand/spi/micron.c | 135 ++++++++++++-
 drivers/mtd/nand/spi/otp.c    | 362 ++++++++++++++++++++++++++++++++++
 include/linux/mtd/spinand.h   | 110 +++++++++++
 6 files changed, 738 insertions(+), 12 deletions(-)
 create mode 100644 drivers/mtd/nand/spi/otp.c

-- 
2.43.0

