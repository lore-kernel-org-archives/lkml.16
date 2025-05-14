Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D6AA293753
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 20:14:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747253644; cv=none; b=i1TxxsFmvoVt6Lej9Tmxhf8bdcGOoWvOVZ1SsfODXM/6v1pyJkCjrxR5eYpc8gwaDjKyKJZcxEY4gb1/kA2ErWBEJpabzmmh/cVq9FHDQQTd4Ep4vX3qjWgvIpm/C7KD6rOPqXNXCQLGMk1V4yk5ok/C2GUpxM/3ljZ44t5Zmbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747253644; c=relaxed/simple;
	bh=4AtAxAz5XCYC01uWKwLjgY2ITITdF031o9n1wsPBzmw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=At969sPWlT6a/MSfrK4D8NGDCDbc/rp4g7AlygPMANFLxR+np3jbYo38LYNc3sNqHccxBRnXW3um0KiwMpEHLws8UwTsknV8K6mP3L/G+0CxvHaK7p4ZEjIFAd/MT3S0Y0B/9iDhDFRS7kEGHGpNsGsFRtWM5YtqY+/4pPDz9gU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=eAQno6Ka; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="eAQno6Ka"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-7399838db7fso283583b3a.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 13:14:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1747253642; x=1747858442; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=c9puVoSYvf2ZCA0MRaHWdsYInOPeWpOtDifMmwWo0K0=;
        b=eAQno6KaPRLNVG+JpoteJjuj0aqILKDNCEwE4BOFCeRLZ4MJUfTbfxZgluZ1ogqK1L
         Vp/oEy+2MUShTHthxBPEmS32qUEZAS130aEG6GgADHpHjdHCM+Zbjjd1Inz1tNrvfu6F
         maJDM9FYgPuMeRFRL0JRyxEu9Oc8GFT24B/hY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747253642; x=1747858442;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c9puVoSYvf2ZCA0MRaHWdsYInOPeWpOtDifMmwWo0K0=;
        b=lmOOGakVSp2Q89zUBWtlmrEaB6AY4qzrGk4pDSSDnGTi72EsH12bW6RHqnZ8jFoE/N
         HkB7is6Hgx38lz6iJQ6ncGiMBGeGteN2oKjyKhYcNUdSyNcb8pI6rcqG318xKQ1v/hJL
         dg0RGFlWsizoWVKrQQqt4FIn9nAP4uyMAWtXVtqhUW2KU0gA2bHXEkxNZg7ZOSiaLeVm
         llPCmOOMiUI+wzMKh0pWSyd75skMdnThWjuVErnay8V1STy5+wFudYwSJTiR1ayAKJoX
         9xa/7T6ZzAzc8ZEr+5Zz/ydJ6Mrwbf0KLXY8y1reqj4zPQfDUniv27jpKRvgTiqGjsAa
         GXfQ==
X-Forwarded-Encrypted: i=1; AJvYcCVQlRxSr4Z+MYHuLKRnMExOor5PyT1hvxoHWZqpSF8Qm9uh8LVsmkVlvkjmCMkiaYA2k0+FE0qag8EKccc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwwCqIpgEFug7X6vg4dftf0q6kvF+QpMqN4UOWKBZ2T54/Uu5Qs
	cFkAOIaHdTxak05CVqWMEYg25wbA3hQD8R2TVb5NGppGtCbjrR430Dj6VFnr8HEaqw==
X-Gm-Gg: ASbGnculZJHlD3sdUNHFHAXpVneBTLrw2We64snRjFY9dNRAt+fZhXTEqJtEqBcTOrH
	F1Q49XndxDdnedDIEe2yixuEYZISXSozzSdIU60hOOj68mUToZRhyMVjSPkVbkyppGwqWs6w8xs
	NZbDAmOa/e47XX2mkXOThu/wRwPLkFfV8h83dN+43xUHarpMAHCHyL3/EHp147QO8BOF+yZHsHf
	gyQqKTqJJGwpUuFHXpCpA8h4+nh4/dbAvXnez/USh0E+krnh7eh9rZHdlKZe9P6VFWzTasLceae
	Owb9PDr8qHU8Zi6i6IcsVq1edplxY6jFjnlGKNxHHo0e0RjzA2n9dXdGvSJr0PuUQEO2ieFmjay
	i10UkhWYcwNTNHg==
X-Google-Smtp-Source: AGHT+IHoUXLcPOugi0OP5qmWxF/0I5CG1K6+KioRdB/AvGshIQxAvD0Unf702FWVo16AMekYC9DA/w==
X-Received: by 2002:a05:6a00:828c:b0:740:6f6:7338 with SMTP id d2e1a72fcca58-742961a931fmr1111602b3a.3.1747253642419;
        Wed, 14 May 2025 13:14:02 -0700 (PDT)
Received: from localhost ([2a00:79e0:2e14:7:cd06:335b:936a:7dc1])
        by smtp.gmail.com with UTF8SMTPSA id 41be03b00d2f7-b2350ddbf13sm9303926a12.59.2025.05.14.13.14.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 May 2025 13:14:01 -0700 (PDT)
From: Brian Norris <briannorris@chromium.org>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Tsai Sung-Fu <danielsftsai@google.com>,
	Douglas Anderson <dianders@chromium.org>,
	linux-kernel@vger.kernel.org,
	Brian Norris <briannorris@chromium.org>
Subject: [PATCH v2 0/2] genirq: Retain depth for managed IRQs across CPU hotplug
Date: Wed, 14 May 2025 13:13:15 -0700
Message-ID: <20250514201353.3481400-1-briannorris@chromium.org>
X-Mailer: git-send-email 2.49.0.1045.g170613ef41-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

v1:
 https://lore.kernel.org/lkml/20250513224402.864767-1-briannorris@chromium.org/
 [PATCH 0/2] genirq: Retain disable-depth across irq_{shutdown,startup}()

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

I incorporate a fix suggested by Thomas Gleixner in patch 1, and provide
some new kunit test cases for this area in patch 2.

Side note: I understand my colleague has reported other issues related
to the same code:

  Subject: [PATCH] genirq/PM: Fix IRQCHIP_ENABLE_WAKEUP_ON_SUSPEND if depth > 1
  https://lore.kernel.org/lkml/20250512173250.1.If5c00cf9f08732f4af5f104ae59b8785c7f69536@changeid/

We're addressing different problems, but they do happen to hit on some
of the same awkwardness in irq_startup(). These two patches would
probably need to be reconciled in some way.

Changes in v2:
 * Adapt Thomas Gleixner's alternative solution, to focus only on CPU
   hotplug cases
 * add request_irq()/disable_irq()/free_irq()/request_irq() test
   sequence
 * clean up more resources in tests
 * move tests to patch 2 (i.e., after bugs are fixed and tests pass)
 * adapt to irq_startup_managed() (new API)

Brian Norris (2):
  genirq: Retain depth for managed IRQs across CPU hotplug
  genirq: Add kunit tests for depth counts

 kernel/irq/Kconfig      |  11 ++
 kernel/irq/Makefile     |   1 +
 kernel/irq/chip.c       |  22 +++-
 kernel/irq/cpuhotplug.c |   2 +-
 kernel/irq/internals.h  |   1 +
 kernel/irq/irq_test.c   | 229 ++++++++++++++++++++++++++++++++++++++++
 6 files changed, 264 insertions(+), 2 deletions(-)
 create mode 100644 kernel/irq/irq_test.c

-- 
2.49.0.1045.g170613ef41-goog

