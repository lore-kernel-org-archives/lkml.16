Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E7B5198851
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 18:33:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749753228; cv=none; b=WCzU32rugFYgTFRiQd4g05bUndZvR+whE8G5aUhXLOXQg7G2zEsDyYoLqJ/1ZhzreADjFoE3XkVEy0ucIdfOtqxB1XfZTXqu0vD2xVic49BXCK7qFXHfrcVQpqn+JPhNZFmea4ICBjVukl/0F898dotHD8r6ANRDHS3nwmcwHOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749753228; c=relaxed/simple;
	bh=YAsMkR5njyHv17j4cGvK1awInPdxHdob5mMwy4xoAVE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Tc+eTiaquX/vl8giPAJlM4Ej/Jv97Y6pmCaD2TdcsUHsNLj3lkxxVzQDJhhn+dmOCluRbHRPaEQOe/0oWFrBcid9d08Q0ob4Gyi9kZ5qMzYz4Y2+l/je4safD/4MMYnNWD6+2/sDDAOqWXmlLlmi9pJweaLGzmV16Dodl/MtP0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Ln33awb3; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Ln33awb3"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-74877ac9d42so966716b3a.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 11:33:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1749753227; x=1750358027; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hZB0u8tCL8ABMKV4ulGXtfWfZ8oMyK86f0TLHOlv8zM=;
        b=Ln33awb3wn3W7togFVOppTVR/ViaZzbvlXPZOcb4vdjnKA9x+BfGbRFRvfoxOvyzI2
         ODzAWZPOPYE3TEzrkMYsBNeXTBlz7lQZio34rKV/4uhAl8SBnt+ncD7WDQvwDnolRm2F
         MNKaAa2jjBbRGqXP7SzUaC2/CxU497BXFINXo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749753227; x=1750358027;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hZB0u8tCL8ABMKV4ulGXtfWfZ8oMyK86f0TLHOlv8zM=;
        b=X8PesDet1XAsmEl8lqbJLAFQ6k3/IS4BlSUYjQIOy2sYjurkm9AWqAGBk8Sd6lxvZa
         ICAHLG6UMrWYT7/p57dtDZ/KZ/uNqe1aw6Fiup5kXqsfB++gUGhCf5JZdTSqFLp9bB6Z
         +Db/tYB5KHP2hYCUn4YGITwzMmnO6WStA9BZ4nQJdFFKkC7gPP76bvWabW4IsTDf7E2m
         m7OmJghn3j0UujbNlck/1K7JLbg2o9Vr/2wMb2EFwx0oF3sUytYuQdsEIPNugV6/6sw+
         I+mqLbqLQS/4PGcPQfRNiP+LlqsviGWmnsBnDEVYMwY3Ph0Pk9EBUHvhwA4DOaWXl0kb
         ELtQ==
X-Forwarded-Encrypted: i=1; AJvYcCUloxyFUclJtv1QiRT714pifuSaNROdgnM85TAzpNxSZ0PNQ9lQ0GuzZxENsT6JLHFpa5Bb83BCDZqadHQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxgIJe3EZFueGlYMeqpGfV2w+asVCkjOhKQY16hUBuWPs55H0FY
	W51X+SOwdyLty1lXi5Ksa1MubrisbHFT2PxDI8uVcxSQv7KIoG8sPsBU7N2vtKR1OQ==
X-Gm-Gg: ASbGnctqslgXIsDbZgNyG/SsgVP4lFdM1cXJctXsbA3ZySPUwOTW/XFBSxffK5XT4xK
	6u360dWfJByXacxijEZ14Uk8XCiZXOFpep8mOaOybTsxnpnnLSND9oQOsbmwlOhjCVPc7vlIsX0
	lktDI/ESKSfDD8QsL7q3lziX6DReCUabmFDbTVZJVyro3Pn/YxE3aqZazJr6pnTcN1LGHhqJUQC
	BmNV8k+rWaSqwLs5urd/ymFg0dN4z7mYaDItfHXtymJOU4jlx+Dqu95VTA149dZFmqoLlxzRzkm
	YHgEdl87BgtBKiQhG2BWp9HgRDndX5tQXWY/SrMDOFG/9h6FF4r0TSY/XDuu4kEz4556RW/qj5l
	SK2UW1aXqFG/M7gEUJWomxqHc
X-Google-Smtp-Source: AGHT+IGHEu6mWrPCSbvZxsdSVAz/j6kzCajj2Uhg6fmZ6oYuG4jVjrZuP9x95BX/Z8xal6OO5RWqgA==
X-Received: by 2002:a05:6a20:431a:b0:215:dfd0:fd21 with SMTP id adf61e73a8af0-21faa5ebac5mr805338637.34.1749753226628;
        Thu, 12 Jun 2025 11:33:46 -0700 (PDT)
Received: from localhost ([2a00:79e0:2e14:7:e790:5956:5b47:d0a7])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-748900d7e0asm28191b3a.174.2025.06.12.11.33.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Jun 2025 11:33:46 -0700 (PDT)
From: Brian Norris <briannorris@chromium.org>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Douglas Anderson <dianders@chromium.org>,
	David Stevens <stevensd@chromium.org>,
	linux-kernel@vger.kernel.org,
	Tsai Sung-Fu <danielsftsai@google.com>,
	Aleksandrs Vinarskis <alex.vinarskis@gmail.com>,
	Johan Hovold <johan@kernel.org>,
	Brian Norris <briannorris@chromium.org>
Subject: [PATCH 6.16 0/2] genirq: Fixes for CPU hotplug / disable-depth regressions
Date: Thu, 12 Jun 2025 11:32:50 -0700
Message-ID: <20250612183303.3433234-1-briannorris@chromium.org>
X-Mailer: git-send-email 2.50.0.rc1.591.g9c95f17f64-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

Commit 788019eb559f ("genirq: Retain disable depth for managed
interrupts across CPU hotplug") was merged for v6.16-rc1, but it turns
out there were a few oversights.

One such report:

Re: [PATCH v2 1/2] genirq: Retain depth for managed IRQs across CPU hotplug
https://lore.kernel.org/lkml/24ec4adc-7c80-49e9-93ee-19908a97ab84@gmail.com/

This series contains two fixes for bugs that I've found locally and with
others' help. Some of the testing involved:

1. Aleksandrs Vinarskis tested suspend/resume + NVMe on Qualcomm
   Snapdragon X1E/X1P laptops:
   https://lore.kernel.org/lkml/CAMcHhXrT-y3EotxrcCZ0Pj8Sic6wsPSmRiW7NSzdG=9iH8xqKg@mail.gmail.com/

2. Locally-updated versions of kunit tests I've been working on for
   various kernel/irq/ code:
   Subject: [PATCH v4] genirq: Add kunit tests for depth counts
   https://lore.kernel.org/lkml/20250522210837.4135244-1-briannorris@chromium.org/

3. NVMe + x86 QEMU workloads, + system suspend

4. Pixel phones + modem driver + various CPU hotplug / system
   suspend/resume tests.
   (This is probably least compelling, because this doesn't use the
   latest mainline kernel, and it uses non-upstream drivers for some
   relevant components. But I figured I'd mention it, because we've
   noticed some similar problems to #1 here.)

Regards,
Brian


Brian Norris (2):
  genirq: Rebalance managed interrupts across multi-CPU hotplug
  genirq/cpuhotplug: Restore affinity even for suspended IRQ

 kernel/irq/chip.c       | 8 ++++++++
 kernel/irq/cpuhotplug.c | 7 -------
 2 files changed, 8 insertions(+), 7 deletions(-)

-- 
2.50.0.rc1.591.g9c95f17f64-goog

