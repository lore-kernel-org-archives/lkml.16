Received: from mslow3.mail.gandi.net (mslow3.mail.gandi.net [217.70.178.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DC8A19C556
	for <linux-kernel@vger.kernel.org>; Sun,  1 Jun 2025 09:47:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.178.249
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748771267; cv=none; b=d1o3eQdk5rReZp1TPTIku/Q1f/FpzAmWEMfKVMdN8JGyy3kbknsiIuqm4ME0Vbcui3vBr4vyAN77eFnWjGrSiPMOO048lidnG3uAPDWLmHHIH2oOcpbF3WF0g9IDk+LH+ehrZtqY1D+jM7UL7hj20C3VXrtPqVjT1RSXjkN955I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748771267; c=relaxed/simple;
	bh=IJ9YKz9nftFChsERBfLpc86x+9Dr5EnLA5EWOxQ8RPY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AjwBztt0LnJMgKH/6fqqfucE21bGesk1deYZq+Gex73dVwj/k8O8A4IssoY/8l2Xxo47uTHCc8GdIdCN8tKq5V3ahk+Bki/JErYEpgLiATb3bAMDD3+hAi05wAiFuO//F4CqDj5zPPayJH4d2dJOQo2kECcIwkpmX8yu91qkZH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=lv16smVT; arc=none smtp.client-ip=217.70.178.249
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="lv16smVT"
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::225])
	by mslow3.mail.gandi.net (Postfix) with ESMTP id E67405810F7
	for <linux-kernel@vger.kernel.org>; Sun,  1 Jun 2025 09:20:46 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A05B441CFB;
	Sun,  1 Jun 2025 09:20:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1748769639;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=SG79vLzOV4NvBFmDiztTAzYiWAj60flBXkGh8eD/hO0=;
	b=lv16smVT/71yEyiugIQd530TMj+K0O68k7wwOcJud+LAHk4NJiaBlF+0Dr0ykzB5xIwoHA
	1owzn5pe47i5uAVPbwi4i/AsD6oEY/nvPRXq0F4kvDUQ0gNwa8Ile749/P463hXUhjKqyK
	PFpxQvZU36uJ/Zw5qlLgPFcOrfs1QAw9jutB3aKGOHVu6DRGBswmUVMRZpzOaePpd9CpcA
	3Br8wnraxH2tyZVCBhq1zcsRNmkOrjVPTOLEkqvfwVuzbGhXKyOrUkL0WkANtftXfEMzw5
	+eToKas7k6oMHPELxGODD+AKzEO437uxtUJGYcrAQQfYQWNgtMPDsk+s4QJPZg==
Date: Sun, 1 Jun 2025 11:20:38 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [GIT PULL] I3C changes for 6.16
Message-ID: <20250601092038f33de29e@mail.local>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgdefgeegtdculddtuddrgeefvddrtddtmdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkgggtugesthdtredttddtvdenucfhrhhomheptehlvgigrghnughrvgcuuegvlhhlohhnihcuoegrlhgvgigrnhgurhgvrdgsvghllhhonhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpefhgeefhfdthefggfektdefleekudeggfdtueeggeffvdekfeejhfekhffftedvkeenucffohhmrghinhepkhgvrhhnvghlrdhorhhgpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemvgdtrgemvdgumeeifeejtdemjeekvgdtmegttdgvkeemvdektdeimeekrggtieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemvgdtrgemvdgumeeifeejtdemjeekvgdtmegttdgvkeemvdektdeimeekrggtiedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomheprghlvgigrghnughrvgdrsggvlhhlohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepfedprhgtphhtthhopehtohhrvhgrlhgusheslhhinhhugidqfhhouhhnuggrthhiohhnrdhorhhgpdhrtghpthhtoheplhhinhhugidqiheft
 geslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-GND-Sasl: alexandre.belloni@bootlin.com

Hello Linus,

Here is the i3c subsystem pull request for 6.16. There is not much this this,
mostly fixes around interrupt and IBI handling.

The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089ac8:

  Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/i3c/linux.git tags/i3c/for-6.16

for you to fetch changes up to 00286d7d643d3c98e48d9cc3a9f471b37154f462:

  i3c: controllers do not need to depend on I3C (2025-05-24 22:49:07 +0200)

----------------------------------------------------------------
I3C for 6.16

Drivers:
 - mipi-i3c-hci: interrupt handling fixes
 - svc: i.MX94 and i.MX95 support, IBI handling fixes

----------------------------------------------------------------
Carlos Song (2):
      dt-bindings: i3c: silvaco,i3c-master: add i.MX94 and i.MX95 I3C
      i3c: master: svc: switch to bulk clk API for flexible clock support

Frank Li (1):
      i3c: master: svc: skip address resend on repeat START

Jarkko Nikula (5):
      i3c: mipi-i3c-hci: Allow only relevant INTR_STATUS bit updates
      i3c: mipi-i3c-hci: Fix handling status of i3c_hci_irq_handler()
      i3c: mipi-i3c-hci: Clear INTR_STATUS unconditionally
      i3c: mipi-i3c-hci: Change name of INTR_STATUS bit 11
      i3c: mipi-i3c-hci: Move unexpected INTR_STATUS print before IO handler

Stanley Chu (2):
      i3c: master: svc: Receive IBI requests in interrupt context
      i3c: master: svc: Emit STOP asap in the IBI transaction

Wolfram Sang (1):
      i3c: controllers do not need to depend on I3C

 .../bindings/i3c/silvaco,i3c-master.yaml           |  45 +++++++--
 drivers/i3c/master/Kconfig                         |   4 -
 drivers/i3c/master/mipi-i3c-hci/core.c             |  32 +++---
 drivers/i3c/master/svc-i3c-master.c                | 109 ++++++++-------------
 4 files changed, 98 insertions(+), 92 deletions(-)

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
