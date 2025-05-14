Received: from zg8tmja2lje4os4yms4ymjma.icoremail.net (zg8tmja2lje4os4yms4ymjma.icoremail.net [206.189.21.223])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC8DE17736;
	Wed, 14 May 2025 00:23:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=206.189.21.223
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747182207; cv=none; b=Rwu3enZxBh6KQbGU2RS+D9g2aQMOmTGX3J3Y0CEmuc5Gotf4XrZvLDGbKLsfNma8sG7Q+KxApKiK6bISaFwLfEclZ0tJvQAO4PdZstCLNLbdygWrdZptkBEtsN1LKXGCR9iaPOZm1xqvMmypDfuHCaj68WJ0/R0VtSokLeMDYgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747182207; c=relaxed/simple;
	bh=cFC1F7++j3WMyMwjFA/nCZ2NwSzv1c9tSpdx48jRjmE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=sMnIQgOOCyib3Kl11T8EOQiWGHSbgDZ7efYNZerHfP5HQoiStqE2bqR/Ol9Ugutk2QRnogVZ7YZy9BJ67spaWJ9yBQguVePfyKhhmiblhUPuWCEYGojoBOxFIteWkLsi2k29x1jSM8AxYv6YEfXXmTIYSgmBfk/V4Eg2HI0hEFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=eswincomputing.com; spf=pass smtp.mailfrom=eswincomputing.com; arc=none smtp.client-ip=206.189.21.223
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=eswincomputing.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=eswincomputing.com
Received: from E0005152DT.eswin.cn (unknown [10.12.96.41])
	by app2 (Coremail) with SMTP id TQJkCgDHWZNp4iNonLF4AA--.2974S2;
	Wed, 14 May 2025 08:23:07 +0800 (CST)
From: dongxuyang@eswincomputing.com
To: mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: ningyu@eswincomputing.com,
	linmin@eswincomputing.com,
	huangyifeng@eswincomputing.com,
	Xuyang Dong <dongxuyang@eswincomputing.com>
Subject: [PATCH 0/2] Add driver support for ESWIN eic700 SoC clock controller
Date: Wed, 14 May 2025 08:22:33 +0800
Message-Id: <20250514002233.187-1-dongxuyang@eswincomputing.com>
X-Mailer: git-send-email 2.31.1.windows.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:TQJkCgDHWZNp4iNonLF4AA--.2974S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Ww4DJryxKw15Aw45GF15Jwb_yoW8Zw45pF
	4UCF95Ar1UXFW7Xa1xtayF9ryfAan7JFyYkFZ7Xa4UZas0yFy8JF4ftas8JF97Zw1xAw1S
	qFn0ga1rCF4UAFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUBq14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
	Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628v
	n2kIc2xKxwAKzVCY07xG64k0F24lc7CjxVAaw2AFwI0_Jw0_GFylc2xSY4AK6svPMxAIw2
	8IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4l
	x2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrw
	CI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI
	42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z2
	80aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUbknY7UUUUU==
X-CM-SenderInfo: pgrqw5xx1d0w46hv4xpqfrz1xxwl0woofrz/

From: Xuyang Dong <dongxuyang@eswincomputing.com>

	Add support for the clock functionality in the Linux kernel.
	The driver provides basic functionality to manage and control
	the clock signals for the eic7700 series chips, which are part of
	the ESWIN SoC family.

	The driver is integrated with the Linux clock subsystem, allowing
	kernel code to use clock signals on hardware and ensuring proper
	handling of clock events.

	Features:
	 Implement support for the ESWIN eic7700 SoC clock controller.
	 Provide API to manage clock signals for the eic7700 series SoC.
	 Integrate with the Linux clock subsystem for consistency and
	 scalability.

	Supported chips:
	 ESWIN eic7700 series SoC.

	Test:
	 The tests tested on the Sifive HiFive Premier P550 (which uses the EIC7700 SoC),
	 including system boot, networking, EMMC, display, and other peripherals.
	 The drivers for these modules all use the clock module,
	 so the verifies that this clock driver patch is working properly.

Xuyang Dong (2):
  dt-bindings: clock: eswin: Documentation for eic7700 SoC
  clock: eswin: Add eic7700 clock driver

 .../bindings/clock/eswin,eic7700-clock.yaml   |   53 +
 drivers/clk/Kconfig                           |    1 +
 drivers/clk/Makefile                          |    1 +
 drivers/clk/eswin/Kconfig                     |   10 +
 drivers/clk/eswin/Makefile                    |    8 +
 drivers/clk/eswin/clk-eic7700.c               | 3811 +++++++++++++++++
 drivers/clk/eswin/clk-eic7700.h               |  194 +
 drivers/clk/eswin/clk.c                       | 1069 +++++
 drivers/clk/eswin/clk.h                       |  209 +
 .../dt-bindings/clock/eswin,eic7700-clock.h   |  588 +++
 10 files changed, 5944 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/eswin,eic7700-clock.yaml
 create mode 100644 drivers/clk/eswin/Kconfig
 create mode 100644 drivers/clk/eswin/Makefile
 create mode 100644 drivers/clk/eswin/clk-eic7700.c
 create mode 100644 drivers/clk/eswin/clk-eic7700.h
 create mode 100644 drivers/clk/eswin/clk.c
 create mode 100644 drivers/clk/eswin/clk.h
 create mode 100644 include/dt-bindings/clock/eswin,eic7700-clock.h

--
2.17.1

