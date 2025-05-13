Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D53A157A55
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 22:48:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747176505; cv=none; b=M/vBn9ljE/Oq3IPAjTJTAqZV2jJmIDV3ACumUZf7wv1osMcm3zWQ+Wbhn5Rlv494uqxg0ir/FEaxq7MhoZJSP2JvL8ljFS5MskM3HoeVFUGDFhoWZhiOg+Gej7q7aM06sAmo8ctq2K248uFBI9HompXHV1JyjaQh6HbGtGux3tM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747176505; c=relaxed/simple;
	bh=GVphq6Soitz8QP8iIAV1m1l4LSACcQ2AVf3yy49d6kU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pFSIdA6RUmfqC2i0RAj1YLBH8Nydh3RpBT+ivDlSa5RNisE5xJLFM3MzKbsnPqBi8zkNYMlbfMWA+Ao8mwZtBjf7iMpwb8oGNR9Xunu2oqR0/rZ+Nh6Mj3bQPE6fMQ40vQWg35nvk9AwsJfPuHE/SQWAPspuCnBIE1ABTgmmsSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=TTyePoUQ; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="TTyePoUQ"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-7399a2dc13fso7937554b3a.2
        for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 15:48:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1747176504; x=1747781304; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iTriUws8LgtsAGEIjPiDbS58DLvrYKHOfvDput20H78=;
        b=TTyePoUQqlYGgzUX4JnOXQqipSDYJPuk1kHIsS5jEYo5JK122kUPxgzPm+fyrPBgu9
         Mm6n1FFmbXkaiV0ZRfP0PcEmdtA3g3wf8f5Yf2hqjLC2rKKBS9JL0bcG+ZPcRne2vdCQ
         i8HJZVlhxfQwQlxdCqTdwP6jykeLz+Wpzp3X0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747176504; x=1747781304;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iTriUws8LgtsAGEIjPiDbS58DLvrYKHOfvDput20H78=;
        b=PpLTprwr5x2ATVXKa+INWuVugz6vtDOFsovjf2KcOwrmX6fTlxf4T+T1sNwxtvN+cl
         AePY2v7LFa/e0EQ5i8DJ/3I/6VesBqPR8THuGbWqr61P1d+FbI95ww4q2ryL3iM9lEj1
         5k3I8eL5WcSAH9u8C0CzuDV9zdgjUEhz4l/tkFsfh/O2SiIOQrudKqqVdg87RMV9cLwk
         FFZO94cyFEOPv4yDUPnb4m7fYZt9buQrhmSv8IWxuHhHV55xXE5Kw3sTyJHnYk8ELm7O
         NPPFp2XjUpwfVB1T1lAMpiGZy4scgfTKMk4mkuk2JTZOuRo850qHv/Z3/QFZYO1dcAdE
         AvsA==
X-Forwarded-Encrypted: i=1; AJvYcCVz0zCCeArNTIquK6bRE2sPcfxrSg+siWbLUdSogfTNbn8tyJPVn8ZZ2Ggz/s+MoqPwyAp6wMOBRk0Veis=@vger.kernel.org
X-Gm-Message-State: AOJu0YzuyBEKpc0a27su0Vghid6/XHR97wVR714n6GcaD8BQ0ot9alSO
	+6azeQO1hoVbqIOisf8uyW1sx0QRWhZXn/fKCX99qEygtw2edQGEnWK0WrSGfA==
X-Gm-Gg: ASbGncu1eBAf6Iom4BeydItJXZH5uRqAi4graiuQmgldjY5dcLgueWoC4v4OzMLHJt/
	TqX6uXvbWwzXyLMUVh+PZuXnF1k4uG+Vy75R/RZdFBLPotG9TceTqwlsFeemPrnWUUdUOwZuzJc
	JZl1/qUG1um0bPJkSPMAAng6YoKPeAmsI9Wvm5NrFXTsuaWdCCP9tw8xW61Vot51mAXb8BxgGD7
	axmridUgV5vqo4zkhVDb61HUmncpTgk0Qdob1NpGOYzmRjELca1Xex0M25JzK0+2wMlefF15Ngw
	JCsTwMohTuXpG62BmkItprJgvDC+Eh9ZaPXmXhdh4Xm8fSYKnmQNoGxmBmbXf59UMXqLtFkXvBV
	8CyuE0bWYlpNte2AZzAsa8vwG
X-Google-Smtp-Source: AGHT+IHKZLbsIisFhZLabHCwQHd1wupzdqXVKimvOfaYLCRzcvdwMYkLudaMniJetk4cIeLJ6YiAaA==
X-Received: by 2002:a05:6a00:2308:b0:73e:23bb:e750 with SMTP id d2e1a72fcca58-7428934c348mr1593574b3a.23.1747176503628;
        Tue, 13 May 2025 15:48:23 -0700 (PDT)
Received: from localhost ([2a00:79e0:2e14:7:b0a6:1dea:5306:7727])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-74237a38c7bsm8246999b3a.123.2025.05.13.15.48.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 May 2025 15:48:22 -0700 (PDT)
From: Brian Norris <briannorris@chromium.org>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Douglas Anderson <dianders@chromium.org>,
	Tsai Sung-Fu <danielsftsai@google.com>,
	linux-kernel@vger.kernel.org,
	Brian Norris <briannorris@chromium.org>
Subject: [PATCH 0/2] genirq: Retain disable-depth across irq_{shutdown,startup}()
Date: Tue, 13 May 2025 15:42:36 -0700
Message-ID: <20250513224402.864767-1-briannorris@chromium.org>
X-Mailer: git-send-email 2.49.0.1045.g170613ef41-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

I'm seeing problems in a driver that:
(a) requests an affinity-managed IRQ (struct
    irq_affinity_desc::is_managed == 1);
(b) disables that IRQ (disable_irq()); and
(c) undergoes CPU hotplug for the affined CPU.

When we do the above, the genirq core leaves the IRQ in a different
state than it started -- the kernel IRQ is re-enabled after CPU hot
unplug/plug.

This problem seems to stem from the behavior of irq_shutdown() and
irq_shutdown(): that they assume they always run with an enabled IRQ,
and can simply set depth to 1 and 0 respectively.

I encode my test cases in a few kunit tests in patch 1, and I provide a
blunt attempt at solving the test failures in patch 2. I'm not very
confident in my solution, so please take it with a heavy dose of salt.

Side note: I understand my colleague has reported other issues related
to the same code:
Subject: [PATCH] genirq/PM: Fix IRQCHIP_ENABLE_WAKEUP_ON_SUSPEND if depth > 1
https://lore.kernel.org/lkml/20250512173250.1.If5c00cf9f08732f4af5f104ae59b8785c7f69536@changeid/

We're addressing different problems, but they do happen to hit on some
of the same awkwardness in irq_startup(). These two patches obviously
would need to be reconciled in some way.


Brian Norris (2):
  genirq: Add kunit tests for depth counts
  genirq: Retain disable depth across irq shutdown/startup

 kernel/irq/Kconfig    |  10 +++
 kernel/irq/Makefile   |   1 +
 kernel/irq/chip.c     |   7 +-
 kernel/irq/irq_test.c | 162 ++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 178 insertions(+), 2 deletions(-)
 create mode 100644 kernel/irq/irq_test.c

-- 
2.49.0.1045.g170613ef41-goog

