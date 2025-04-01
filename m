Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C12335103F
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 22:27:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743546481; cv=none; b=caBiePEufTFBK9xKG8cVLvxl1URG4AKu6afkKZYQoztq7HPot2iy5GtifQU7xM361y5ER3G4OUIOUXZAxBW/+eX+7hI2A9cSHSFqAyr5UCwoeqa5r2EdgYJcQQmOs37ewA5FTxSOhGzof7AL/b4WsCAGss8HCQuTLGfWx9U+ajU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743546481; c=relaxed/simple;
	bh=2cK6jsTCQ0+byX5JsZ1JmO5CdKi2AhlXUiTffN/Rsc4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=E/r1WwYa7PVheHb1sKH4G92pB5ovYE3t+6i0RHErInUk07tTWXRVqAeXRteM8zHE1qflXfDexGheiIc0+1iC/8b4NqPeTDWc5fofoeYlCsEnxFK9n+QevejleKyuBn1FHB6TvsQ83DRyhBNMxNuMUXN/y0bCDvsXdD52BixqEWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=N852wd/i; arc=none smtp.client-ip=217.70.183.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="N852wd/i"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 595C043280;
	Tue,  1 Apr 2025 22:27:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1743546471;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=LAQY608XfP5NAZc5MUlDIbKeurURn1qFgrDB951n4qs=;
	b=N852wd/ikTPwprK1sR2+nDbo6RhOlVSQZzYfs/cUFxpuG/FaDU+4RvYI6pv5c/h38B1A0Z
	Aeta2n25Jlto0gGvVaUf9KzZ+8bwHLBh8wGC6v/LjGjvnFMNvcv8a6QO2MIRRvkWJmuCSZ
	yoo30yMCRBfNGdyF9MOZiT7vCh44E6Xfk+1BojFCMzjiWHEg7t9ckFhnVK4/XSb46j81Z6
	IqdEB1GaVGa6nQSm//z+B6+WIJ6o1n1B8Sh88Ej1pJDuED6ATGqy7B5myb1/ux+5lQRTtm
	ezS/sW9Ek49Y52To9zQKws9U2vVS7J3aIpTBAtVXHmG1acAan7K67kks2pAtsg==
Date: Wed, 2 Apr 2025 00:27:51 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [GIT PULL] I3C changes for 6.15
Message-ID: <2025040122275143b58a41@mail.local>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddukeefleelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfggtggusehttdertddttddvnecuhfhrohhmpeetlhgvgigrnhgurhgvuceuvghllhhonhhiuceorghlvgigrghnughrvgdrsggvlhhlohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhephfegfefhtdehgffgkedtfeelkedugefgtdeugeegffdvkeefjefhkefhffetvdeknecuffhomhgrihhnpehkvghrnhgvlhdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegvtdgrmedvugemieefjedtmeejkegvtdemtgdtvgekmedvkedtieemkegrtgeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegvtdgrmedvugemieefjedtmeejkegvtdemtgdtvgekmedvkedtieemkegrtgeipdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpegrlhgvgigrnhgurhgvrdgsvghllhhonhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeefpdhrtghpthhtohepthhorhhvrghlughssehlihhnuhigqdhfohhunhgurghtihhonhdrohhrghdprhgtphhtthhopehlihhnuhigqdhifegtsehlihhsthhsrdhinhhfr
 hgruggvrggurdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-GND-Sasl: alexandre.belloni@bootlin.com

Hello Linus,

Here is the i3c subsystem pull request for 6.15. The silvaco driver gets
support for the integration of the IP in the Nuvoton npcm845 SoC. There
is also a fix for a possible NULL pointer dereference that can happen
with early IBIs.

The following changes since commit 2014c95afecee3e76ca4a56956a936e23283f05b:

  Linux 6.14-rc1 (2025-02-02 15:39:26 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/i3c/linux.git tags/i3c/for-6.15

for you to fetch changes up to bd496a44f041da9ef3afe14d1d6193d460424e91:

  i3c: Add NULL pointer check in i3c_master_queue_ibi() (2025-03-31 11:44:00 +0200)

----------------------------------------------------------------
I3C for 6.15

Core:
 - Fix a possible NULL pointer dereference due to IBI coming when the target
   driver is not yet probed.

Drivers:
 - mipi-i3c-hci: Use I2C DMA-safe api
 - svc: add Nuvoton npcm845 support

----------------------------------------------------------------
Andy Shevchenko (1):
      i3c: master: Drop duplicate check before calling OF APIs

Billy Tsai (2):
      i3c: Remove the const qualifier from i2c_msg pointer in i2c_xfers API
      i3c: mipi-i3c-hci: Use I2C DMA-safe api

Frank Li (3):
      MAINTAINERS: Remove Conor Culhane from Silvaco I3C
      MAINTAINERS: Add Frank Li to Silvaco I3C
      i3c: master: svc: Flush FIFO before sending Dynamic Address Assignment(DAA)

Manjunatha Venkatesh (1):
      i3c: Add NULL pointer check in i3c_master_queue_ibi()

Michal Simek (1):
      dt-bindings: i3c: dw: Add power-domains

Nathan Chancellor (1):
      i3c: master: svc: Fix implicit fallthrough in svc_i3c_master_ibi_work()

Stanley Chu (9):
      dt-bindings: i3c: silvaco: Add npcm845 compatible string
      i3c: master: svc: Add support for Nuvoton npcm845 i3c
      i3c: master: svc: Fix npcm845 FIFO empty issue
      i3c: master: svc: Fix npcm845 invalid slvstart event
      i3c: master: svc: Fix npcm845 DAA process corruption
      i3c: master: svc: Fix i3c_master_get_free_addr return check
      i3c: master: svc: Fix missing the IBI rules
      i3c: master: svc: Use readsb helper for reading MDB
      i3c: master: svc: Fix missing STOP for master request

 CREDITS                                            |   4 +
 .../bindings/i3c/silvaco,i3c-master.yaml           |   4 +-
 .../bindings/i3c/snps,dw-i3c-master.yaml           |   3 +
 MAINTAINERS                                        |   4 +-
 drivers/i3c/master.c                               |  21 ++--
 drivers/i3c/master/dw-i3c-master.c                 |   2 +-
 drivers/i3c/master/i3c-master-cdns.c               |   2 +-
 drivers/i3c/master/mipi-i3c-hci/core.c             |  10 +-
 drivers/i3c/master/svc-i3c-master.c                | 138 +++++++++++++++++++--
 include/linux/i3c/master.h                         |   2 +-
 10 files changed, 154 insertions(+), 36 deletions(-)

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
