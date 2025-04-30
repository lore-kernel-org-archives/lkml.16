Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A8191A23AF;
	Wed, 30 Apr 2025 06:49:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745995797; cv=none; b=MhgWjmg8MFJlIBotdk11cq4OPiBjKwciGkpWuG/Jx7hKQUAQ0Sj6ODQaVe64h8vOxlPC35Szhrg7OgXDJ7Q29A1oel1a6p9PHXC756cUfU33N84e/Qz0NSJ4dXIv0Po50/1+k5Nsa8gLADKSDA/rl7c5iPHaHYt5F7N/Jeq/hio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745995797; c=relaxed/simple;
	bh=mEDqqO5IwYQog+inxyD6TGZhz/tBnkvIVV9VwQAlVbM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=LLVN0VUjISgutqtqHHlXaVRUONDYZejFem9IJ39T7ErU2jdu0R0QCcTHXaCpimmCwXqWwymQXQVnaZnZjljbPsWmIqq5IT24ceJ29g/4zd97FQaApuOSdQopYQ0/l2yql2eqFd+2qQweU0SQpHQeJFWxa9DKgjI1dluk3s8z9mI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P4mnMVm5; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P4mnMVm5"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5f6222c6c4cso10685607a12.1;
        Tue, 29 Apr 2025 23:49:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745995794; x=1746600594; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=clDl+4DEgtMu+yPPyECO1i6UnZBtJomv0kuVg//7ejM=;
        b=P4mnMVm5rTEQ/+Qe+tsxQdBN9JpMMikGvAK/4Xhp1/CRz4ZT3Kf0tM+nIrYYSBCqc+
         zIhUelnoKMi5Rwfzwrk/b+PjCryQlpasTcwNCy+WgvMo0NicRqM+Pe5a7mVKCrUbkW14
         coFpzkZoNXtuaAx0SFNzqAMdhzBpQ9Fl9xptuhnJkp8+YA/Vbxg1JXrx6KHnCj8GviBy
         oDBUg1M7Ho0ZRqk0eVl+F6mszH0JcS6wo8cw9u9RwxSB+kNzTyVjFNRmYeKeElRqBh3X
         caH+CTGKm4GxkbjhfCtaYksww3eA3GU/y14qsYkXZVh/k30xyEaE/mXlUgZGW0UB+EoF
         fXSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745995794; x=1746600594;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=clDl+4DEgtMu+yPPyECO1i6UnZBtJomv0kuVg//7ejM=;
        b=rUpof0o3I1XlD+zckuIj9avmrj6aY4vHYvA3Uag4Y2JGlhJ1vcRT8F9NaAcmkgrRz1
         JFZvfW55lYFIUZNG/BPOFgkOuTReVNEAC59FHyzZJ5S0EOBnVr74vKeFRoqf7ByJoABe
         O4dUMXdLns+RL9hCKGS/8I0qRnHlbjoW+4aai1Ig4+piMzz8YJkty70iQHsTfso01ODZ
         rLBMnpuoMT5Ndmmky715UcpRDs8Iphmn/BCljIjwMQ0mA8s2u3NEw7XHuyt1SXb8ybdC
         YiRlbjYuFFQfETw85xpy8dVeCqsfj0cM/YYuRtzAjp4h/I1A8n44MP6Wdq44e801+yKn
         I0QA==
X-Forwarded-Encrypted: i=1; AJvYcCUGif2tAhEoyXs470kof0CF9lcTRDlHTZIHXeJPiA8bx/rrGjLrRgj+hX7noxr+P7L8mQurWUS5qKiNrRzY@vger.kernel.org, AJvYcCV+WIWYwgoDpKmeuuOyGhOWZu57uIjVmhcsn2igCfZsBtYSsH9wAPIIe4k2AlIaAibirIyi3q8NjRfO@vger.kernel.org, AJvYcCVyB1l2lgcdQKmnqde9YUdqQJHZkxwBVt6Yu/wHGekvAm9dyVjHS0By4DqV5aoYzJOOM++5yLKEcDcR@vger.kernel.org
X-Gm-Message-State: AOJu0YxYGCeLgVz+5RfSLtG7iUF1Xpk3xzPjbqevd8KXcymnAsX81Yiw
	764ub++O3TqQg3Ajeuwa21XWTkq0cgGI5d23HhWuoAxfbTU2LlDN
X-Gm-Gg: ASbGncv03d4YY9SaNBKg1iSSvQPI6XpnlgBTImJFVqsK/jVeBnOsJIgg1mpzbGYGWlc
	FmD3QV4WkIAdNuhTFsQWwxCkUA/JXqjmHEvu71xOs/leTeIOirXDsL1gLV/P3d8CVNaN3iJZrKj
	3rYCryFo0oFo8qPQxQY1MDesisZQ1ninb2R2TuV36bbybv+jRAnhfPBNlCxTLC9XcvrcRko1XZ5
	2TO5OlOEDa2lvNGuvybGspLWXb5NOeNi4DWCDnayCy6eU3z8rjaiEnr+5lyRIgrWYgl0BmqO5gQ
	P3HJwf87fWNHoMBhvUZeTH7IWmKR1a+mkjiWx2+ECzB61dAC8JAyZGhKBb8eaXpxdjCvtPLYoX8
	MAsChxTvDiJQ=
X-Google-Smtp-Source: AGHT+IFBM7R6OthMZFzKw0gjro3xWIr8oi9NS4AlYFPmZ7/55XoeVl9SUXu0eLd9hymlrW/B0YdmcA==
X-Received: by 2002:a17:907:7f8d:b0:aca:9a61:931d with SMTP id a640c23a62f3a-acedc629b6bmr221664666b.30.1745995794035;
        Tue, 29 Apr 2025 23:49:54 -0700 (PDT)
Received: from hex.my.domain (83.8.121.197.ipv4.supernova.orange.pl. [83.8.121.197])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6e5087e4sm881222866b.73.2025.04.29.23.49.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 23:49:53 -0700 (PDT)
From: Artur Weber <aweber.kernel@gmail.com>
Subject: [PATCH v5 0/8] clk: bcm: kona: Add bus clock support, bus clocks
 for BCM21664/BCM281xx
Date: Wed, 30 Apr 2025 08:49:47 +0200
Message-Id: <20250430-kona-bus-clock-v5-0-46766b28b93a@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAvIEWgC/2XM0QrCIBiG4VsJjzP016nrqPuIDtT9llQzZo1i7
 N6zIBrb4ffB8w4kYxcxk+1qIB32McfUllGtV8SfbHtEGpuyCTCoGHCg59Ra6h6Z+kvyZyqh1oj
 BYi0ZKejWYYjPb3B/KPsU8z11r2+/55/3l1LzVM8po2i0rhutrQqwO15tvGx8upJPqoc/F0wsO
 BRuhRJeWeV0beZcTLlZcFF4o4KrXPDCKT3ncsL5ksvCQyUlV2gEmDDl4zi+AV3hYj9pAQAA
X-Change-ID: 20250212-kona-bus-clock-4297eefae940
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Alex Elder <elder@kernel.org>, 
 Stanislav Jakubek <stano.jakubek@gmail.com>, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 ~postmarketos/upstreaming@lists.sr.ht, 
 Artur Weber <aweber.kernel@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Alex Elder <elder@riscstar.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745995792; l=3464;
 i=aweber.kernel@gmail.com; s=20231030; h=from:subject:message-id;
 bh=mEDqqO5IwYQog+inxyD6TGZhz/tBnkvIVV9VwQAlVbM=;
 b=oeU9e36OrkdD4LsiWXKTVloWDdD7S8TgjkYXEJWPysmpV2GdirKtrr/I/Y/5deVMB5QJdAiB3
 6RCJPa88FH+AaHabJi+05FlNaFCOyWNl0WLVW+/uixsuQFK6U2o6EVW
X-Developer-Key: i=aweber.kernel@gmail.com; a=ed25519;
 pk=RhDBfWbJEHqDibXbhNEBAnc9FMkyznGxX/hwfhL8bv8=

This patchset does the following:

- Introduce support for bus clocks. These are fairly similar to
  peripheral clocks, but only implement policy, gate and hyst.

- Add matching bus clocks for BCM21664 and BCM281xx peripheral clocks
  and update device tree bindings to match.

The previous (RFC) version of this patchset also introduced a
prerequisite clock mechanism to enable bus clocks before their
corresponding peripheral clocks. It seems that this is unnecessary - 
the way these clocks are initialized leaves them enabled by default.
Thus, the prerequisite mechanism has been dropped from this version.

This is fine for now, and more accurate to hardware (bus clocks are
a prerequisite for the bus, not the peripheral clock). I had an idea
to connect bus clocks to buses using "simple-pm-bus" in DT, but
this is a task for another patchset.

Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
---
Changes in v5:
- Pick up Reviewed-by trailer from Krzysztof on patch 3
- Rebase on v6.14
- No code changes since v4
- Link to v4: https://lore.kernel.org/r/20250318-kona-bus-clock-v4-0-f54416e8328f@gmail.com

Changes in v4:
- Rename moved CLOCK_COUNT defines to CLK_COUNT to avoid redefinition
- Squash BCM21664/BCM281xx bus clock DT bindings commits together
- Link to v3: https://lore.kernel.org/r/20250308-kona-bus-clock-v3-0-d6fb5bfc3b67@gmail.com

Changes in v3:
- Fix DT schema example in BCM281xx bus clock bindings
- Move CLOCK_COUNT defines from dt-bindings header to the driver
- Fix BCM21664 UARTBx_APB IDs being out of order compared to clock
  driver
- Link to v2: https://lore.kernel.org/r/20250303-kona-bus-clock-v2-0-a363c6a6b798@gmail.com

Changes in v2:
- Drop prerequisite clock patch
- Move clock/bcm21664.h dt-bindings header change to dt-bindings patch
- Add BCM281xx bus clocks
- Link to v1: https://lore.kernel.org/r/20250216-kona-bus-clock-v1-0-e8779d77a6f2@gmail.com

---
Artur Weber (8):
      clk: bcm: kona: Move CLOCK_COUNT defines into the driver
      dt-bindings: clock: brcm,kona-ccu: Drop CLOCK_COUNT defines from DT headers
      dt-bindings: clock: brcm,kona-ccu: Add BCM21664 and BCM281xx bus clocks
      clk: bcm: kona: Add support for bus clocks
      clk: bcm21664: Add corresponding bus clocks for peripheral clocks
      clk: bcm281xx: Add corresponding bus clocks for peripheral clocks
      ARM: dts: bcm2166x-common: Add matching bus clocks for peripheral clocks
      ARM: dts: bcm11351: Add corresponding bus clocks for peripheral clocks

 .../devicetree/bindings/clock/brcm,kona-ccu.yaml   |  49 ++++++-
 arch/arm/boot/dts/broadcom/bcm11351.dtsi           |  33 +++--
 arch/arm/boot/dts/broadcom/bcm2166x-common.dtsi    |  28 ++--
 drivers/clk/bcm/clk-bcm21664.c                     |  99 ++++++++++++++-
 drivers/clk/bcm/clk-bcm281xx.c                     | 141 ++++++++++++++++++++-
 drivers/clk/bcm/clk-kona-setup.c                   | 116 +++++++++++++++++
 drivers/clk/bcm/clk-kona.c                         |  62 ++++++++-
 drivers/clk/bcm/clk-kona.h                         |  12 +-
 include/dt-bindings/clock/bcm21664.h               |  17 ++-
 include/dt-bindings/clock/bcm281xx.h               |  24 +++-
 10 files changed, 538 insertions(+), 43 deletions(-)
---
base-commit: 38fec10eb60d687e30c8c6b5420d86e8149f7557
change-id: 20250212-kona-bus-clock-4297eefae940

Best regards,
-- 
Artur Weber <aweber.kernel@gmail.com>

