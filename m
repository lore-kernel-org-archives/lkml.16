Received: from zg8tmja2lje4os4yms4ymjma.icoremail.net (zg8tmja2lje4os4yms4ymjma.icoremail.net [206.189.21.223])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9440219E0;
	Wed, 14 May 2025 00:30:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=206.189.21.223
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747182626; cv=none; b=eAQ2STtAOcDa/VlQs/xkRIhbIAHaaABLMTiLaEhfx/7+uQ7lO7pLgjrTQtX0vz3IMdrP20cxapya1VPh6TcpxB/cwezc2NptwiXFXg2ZSwFpUjmCF9p7ku9lUxzCFLrY56ys1d60XXRdvsX1DWreJNtS/IZV1zJ9lcteo2RrJaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747182626; c=relaxed/simple;
	bh=qcJlSkPCiOGZSrlEbQQaWQaj/ShWUe1nOf8dqaN2sSM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=hZZBQqkZ373gTOXlo39+iTzOgoQP/AfjLp6fCmiGjIw9ngiONf4tHjMlHWYdA/ZYz+hbpd5/YbThZNZ54VurveX700Sj8+cQADH1SnLiACPuLa9tWeVVhRxAAoypW/cE//FU27qRw+3ILYLQSp/Z751PfmNxvJEUZhNm9M50VoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=eswincomputing.com; spf=pass smtp.mailfrom=eswincomputing.com; arc=none smtp.client-ip=206.189.21.223
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=eswincomputing.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=eswincomputing.com
Received: from E0005152DT.eswin.cn (unknown [10.12.96.41])
	by app2 (Coremail) with SMTP id TQJkCgCHJpUY5CNofLR4AA--.14402S2;
	Wed, 14 May 2025 08:30:18 +0800 (CST)
From: dongxuyang@eswincomputing.com
To: p.zabel@pengutronix.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: ningyu@eswincomputing.com,
	linmin@eswincomputing.com,
	huangyifeng@eswincomputing.com,
	Xuyang Dong <dongxuyang@eswincomputing.com>
Subject: [PATCH 0/2] Add driver support for ESWIN eic7700 SoC reset controller
Date: Wed, 14 May 2025 08:29:45 +0800
Message-Id: <20250514002945.415-1-dongxuyang@eswincomputing.com>
X-Mailer: git-send-email 2.31.1.windows.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:TQJkCgCHJpUY5CNofLR4AA--.14402S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Ww4fuF4xJF4kKw43Kry5twb_yoW8WrW7pF
	45CF13Krn8ZFZ7Xan3Ja10kr4fAa1ftrWY9rs2g3W7X398JF1rJr13tF15ZF9rAw18XryS
	qF1ag34j9FyjyaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUBv14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
	6r4UJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
	CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_Jrv_JF1lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2
	Y2ka0xkIwI1lw4CEc2x0rVAKj4xxMxkF7I0En4kS14v26r1q6r43MxkIecxEwVCm-wCF04
	k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18
	MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr4
	1lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1l
	IxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4
	A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUHCJQUUUUU=
X-CM-SenderInfo: pgrqw5xx1d0w46hv4xpqfrz1xxwl0woofrz/

From: Xuyang Dong <dongxuyang@eswincomputing.com>

	Add support for the reset functionality in the Linux kernel.
	The driver provides basic functionality to manage and control
	the reset signals for the eic7700 series chips, which are part of
	the Eswin SoC family.

	The driver integrates with the Linux reset subsystem, allowing kernel
	code to trigger resets on the hardware and ensuring proper handling of
	reset events.

	Features:

	 Implement support for the ESWIN eic7700 SoC reset controller.
	 Provide API to manage reset signals for the eic7700 series SoC.
	 Integrate with the Linux reset subsystem for consistency and
	 scalability.

	Supported chips:
	 ESWIN eic7700 series SoC.

	Test:
	 The tests tested on the Sifive HiFive Premier P550 (which uses the EIC7700 SoC),
	 including system boot, networking, EMMC, display, and other peripherals.
	 The drivers of these modules all use the reset module,
	 so the verifies that this clock driver patch is working properly.

Xuyang Dong (2):
  dt-bindings: reset: eswin: Documentation for eic7700 SoC
  reset: eswin: Add eic7700 reset driver

 .../bindings/reset/eswin,eic7700-reset.yaml   |  57 +++
 drivers/reset/Kconfig                         |   9 +
 drivers/reset/Makefile                        |   1 +
 drivers/reset/reset-eic7700.c                 | 249 ++++++++++
 .../dt-bindings/reset/eswin,eic7700-reset.h   | 460 ++++++++++++++++++
 5 files changed, 776 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/reset/eswin,eic7700-reset.yaml
 create mode 100644 drivers/reset/reset-eic7700.c
 create mode 100644 include/dt-bindings/reset/eswin,eic7700-reset.h

--
2.17.1

