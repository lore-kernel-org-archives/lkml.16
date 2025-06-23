Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 680AD276021
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 19:26:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750706768; cv=none; b=Q5ykL+MixPYDUfmkC5zhNYdk/QmTXK3LraOETw+JHtVNLu6XRaLUhPkLEwx0ud6Zf3nInc6XrffUF3o1xruMHf890aGdH+AOwfoYMTKd3iKeMr3atpgLl5r1ZUOhNnMlptR0CZyc0aZnzYntT7u0MFgZ2kkqtF428y9BI/4kWV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750706768; c=relaxed/simple;
	bh=Tb0ZhRQbmgRVB0YC1b+cooD7cNfiLhIfQGi5uv343BA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=RXWE/QMPC7V7PeGsGMpQUaZFl0XaCVxBVW7f4I6+dFelYWBP1IDuIG/FT05KYHeWLWt0ST8YFYymfDGgsGUVki0qVTsRfFMAkmXpVK0A5YUtfMSzdzjmA8eSmAkbDcIhH+8TZ0BASk0zNmeROINo5xPQC+TcpxaJEBjFGuJFatU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=WsWLBibN; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="WsWLBibN"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-ade58ef47c0so927267966b.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 12:26:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1750706764; x=1751311564; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=X7gDhYwtC9+5bZaRcP33/OCKJG2ETjRJUZEJZituxt8=;
        b=WsWLBibNuZtBwP2T9rJejvQQgEziLI6Xr3J55XTrz9rsh27JJ0nuuBb4Yx3JbMqFPo
         OnuIp6LmVdkSxrhXM7Y8Mhkr2kX2MEPtVKx4DyUBFg2owYdD8WhocSA6hC77Fgcpn5SS
         hlaAKcV9WXOyInfJzZTXDbCyddAdMx6d1NKWKaMN291TRWHWEx8JWohosk4HL0qbOyF2
         nfgSfDr8F832LQ6S8914YLkauqA3SWzJbEn2Cx31mdY1kSQeqFrAHeYLzZWpk6mvs+x5
         CBo7t+nNHVChcbZbcz8LHRcVq/oB4SzZuSnv3hRb53bNw/6iAUq5RNuRS2kqBxdq2PiR
         G8qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750706764; x=1751311564;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X7gDhYwtC9+5bZaRcP33/OCKJG2ETjRJUZEJZituxt8=;
        b=NhPkwgSzIykz+3extgKt6gZ/GcYbyoaXog3lwudcerLDJBb/b2qqk8fGzInOS+j1Pw
         0yUsqRViwKIk23W7aklw2YDAsay0lJKP62fkcU9nHvfJeYATX8kTxWIg6BSj3aTSe0lq
         ETwtDHz0qkoQhgLQ2W2uwaSqctxrMbIY8ztotSBWkv1Pn2uCNpCT8u+0lHZ3ZtKJBXff
         cmJU9dyb+w00AYZizNdUXhU84duUQkqWSHVitKdeN4Elr7SCg/x6EkUqlRqFUkfM3t2R
         sNnJGe6Pj9Yw5I3qhpwbWIolVRN0Lu+/qmWErtjAaL/czBms3On8JiApSBwc79Vzh2C+
         Kp8w==
X-Forwarded-Encrypted: i=1; AJvYcCXVISMonjbVGI3yknKud3bZ1p2/7uRn5/YRw1q2B9YGDTVAAgoK6Be+mOgRoA0C9lPV88ldH4mNsE0E24w=@vger.kernel.org
X-Gm-Message-State: AOJu0YzWhIYRKZZ2+XdOyritgZ+4EmxV71W57laqYmkzHziXbrOSIdrF
	LBalkwNEU1pIZBvw89GjAqhnvhWzXopk7fJbdH2I4YUKC2iLCkI9z0j3nr65c6iv6J8=
X-Gm-Gg: ASbGnctDfuEbYPjCb79nLTof8Mtj8F6kkh/nOC57C5EPB2tk2LRNdeBrM8xOeZ1CjfZ
	iCjlct+r7tFH4GNt48M3DgbbL/gY6wfPfzkLeCZb8cjuN3XeN1/IjvK/fg5iOxLlndez2ej3wbF
	1FdS9REnZIyMoN53fws4d7asaQNRzG0cVFr9DYu2m2PbHQAvxtqLytkmXev0t9WwAP3cWooxamw
	TpTUkQPacqAu4ovAm/y9C+0u2/jx23zKZHSiIZvbhZGLhdYldkQuBpIp8Ow0QH+P3EdBMUNYa0N
	8xQImdQC5XjEE1atxJgDKOT2awIaZSfuHzHURcYCUj5nFOfpPHkZ3h7zDCU=
X-Google-Smtp-Source: AGHT+IHL5tn+SuoHTy4pO9qNuv0L0SBc60HN7s3l6SWa+UkX4X6L0cz5eqQfq8MvHdCXOlz5gSJBgA==
X-Received: by 2002:a17:907:3da3:b0:ae0:a245:2ff4 with SMTP id a640c23a62f3a-ae0a6fe05efmr82786666b.0.1750706763674;
        Mon, 23 Jun 2025 12:26:03 -0700 (PDT)
Received: from localhost ([2001:4090:a244:83c4:9fe4:a128:a20c:8b84])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-ae06b87b31esm564682366b.92.2025.06.23.12.26.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 12:26:03 -0700 (PDT)
From: Markus Schneider-Pargmann <msp@baylibre.com>
Subject: [PATCH 0/3] clocksource/drivers/timer-ti-dm: Add clocksource and
 clockevent support
Date: Mon, 23 Jun 2025 21:24:27 +0200
Message-Id: <20250623-topic-ti-dm-clkevt-v6-16-v1-0-b00086761ee1@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOupWWgC/x3MTQqAIBBA4avErBtQQ6OuEi3Sphr6RUWC6O5Jy
 2/x3gOBPFOAtnjAU+LA55EhywLcMhwzIY/ZoITSwqgK43mxw8g47ui2lVLEZFAatJqMbhpbOyE
 h55enie9/3fXv+wGJa38xagAAAA==
X-Change-ID: 20250623-topic-ti-dm-clkevt-v6-16-b5e6599b7c01
To: Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Thomas Gleixner <tglx@linutronix.de>
Cc: Vishal Mahaveer <vishalm@ti.com>, Kevin Hilman <khilman@baylibre.com>, 
 Dhruva Gole <d-gole@ti.com>, Sebin Francis <sebin.francis@ti.com>, 
 Kendall Willis <k-willis@ti.com>, Akashdeep Kaur <a-kaur@ti.com>, 
 linux-kernel@vger.kernel.org, Markus Schneider-Pargmann <msp@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1104; i=msp@baylibre.com;
 h=from:subject:message-id; bh=Tb0ZhRQbmgRVB0YC1b+cooD7cNfiLhIfQGi5uv343BA=;
 b=owGbwMvMwCXWejAsc4KoVzDjabUkhozIVUbRn3O+bP7Tmx/6eddN4xrurw+PKK+d4b1+y9rg/
 hjndA7+jlIWBjEuBlkxRZbOxNC0//I7jyUvWrYZZg4rE8gQBi5OAZiIfzMjw/Mesx+VS1f8PFI8
 uSmTr1b2092PCgY7nJk9dZavfBkr9Z/hf1iF05FIo+CA4i0TTycpBvZ8fFOzVZlvxe6Xz/l15af
 oMgAA
X-Developer-Key: i=msp@baylibre.com; a=openpgp;
 fpr=BADD88DB889FDC3E8A3D5FE612FA6A01E0A45B41

Hi,

this series adds support for both clocksource and clockevent to the TI
Dual-Mode Timer driver. This can be used as a time source for low power
modes in which the CPUs are temporarily not running.

The driver looks for two always on timers in the DT to be used for
clocksource and clockevent. These are then handled as reserved and can
not be used for normal use.

This series is based on v6.16-rc1.

Best
Markus

Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
---
Markus Schneider-Pargmann (3):
      clocksource/drivers/timer-ti-dm: Fix property name in comment
      clocksource/drivers/timer-ti-dm: Add clocksource support
      clocksource/drivers/timer-ti-dm: Add clockevent support

 drivers/clocksource/timer-ti-dm-systimer.c |   2 +-
 drivers/clocksource/timer-ti-dm.c          | 265 ++++++++++++++++++++++++++++-
 2 files changed, 265 insertions(+), 2 deletions(-)
---
base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
change-id: 20250623-topic-ti-dm-clkevt-v6-16-b5e6599b7c01

Best regards,
-- 
Markus Schneider-Pargmann <msp@baylibre.com>

