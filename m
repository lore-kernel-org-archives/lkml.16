Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20FAD19DF49
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 18:23:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738866221; cv=none; b=IeKEHzaXmSQnEIxmehsR84Mqj/3LaedQGMTEx4u6jjA+PLwwm/UvZ+vSt9y5xb6m6/ZNkaNDfbSx2Qej4VIKegYdd/7luxA5roKzd0AM8m2wqXJqg80MR5Lig0eOGgpeKX5b7m60yGp489AohYnaCwPi9VxQxjeudL31klR4wXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738866221; c=relaxed/simple;
	bh=FLEpWeaq8lMjgXnMOY8Ul5HTEWMCzOGB3nADQ1KspsQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=MNmgzu8H5C2e9IqdHZC6wTsZAmFPLTI1mZWBkQiryYhye+YZJ8wvJT7uY0etAAIBjVtMR1oyAlB0ku8CFLoOHPDo9DfRVtP3J9D+r0YbCdtFlkRRHKluHlhXEpCGeVxW2UU02Vc7OVKRMolWufb8Q9y2fpAiyVsjNvClgm3gIFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=2ChAWN0S; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="2ChAWN0S"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-38db34a5c5fso616706f8f.2
        for <linux-kernel@vger.kernel.org>; Thu, 06 Feb 2025 10:23:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1738866217; x=1739471017; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+moNcLzRZPZGe3z658yJwr+85bQ2FXrKHEVgrCHoS5E=;
        b=2ChAWN0SVjkYBt67aOUQfDRVUngPDIMQ54bm6aNnU+V1dvhf1VZeN7vdPVQjhSOe6w
         oA/kh7it+otKv9Gvi8kTJ/Du3mDBFLrbsyPPHxN9/F9D5kC0BSE+vHfxBSirCVj5Krly
         ZawoJVuScopoWTtmb2MvPQAGgj0ohbxfXLxMcZOFYnwUNe6nVKOLaz4H7Td04ykxtkRn
         vg+x4BBZCvsaTtyKGX31e/KG8+e/yzuCsK8x/4z8j/T82IbVsJwvfHVpbI9GvI7e4zub
         YP0wNahYqLZAIb9fHLBXumey/4ROxUisb6jDUG1MoC9pUzEzTn+8SgtpiAFjRox9mFUA
         ujpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738866217; x=1739471017;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+moNcLzRZPZGe3z658yJwr+85bQ2FXrKHEVgrCHoS5E=;
        b=xBH9v/Js+VKgE9+C7xHMoo1HBW9ME6/ToXp5DUHepUWyvpOwNltx8jLDtHg150+JZ2
         YogbbxBUY8IValXbi/MSHUBnjmc9LuFzVWtWpjrgInW56vd97Qym6SevR41b/pXQ03+q
         ueAuDb+mXGQCGl5Z+GwLlszFXjCZcgIbA8Fw048aBXcCoziDRYayWXoDBphVZ71L3RF3
         A4cWKI0TnhziCPBs9JudwE2JJafa+835MCqDtVMdlYWjP3g5dgs6mVZmdWky7pat9v2n
         dPQ6C6t6Yco+2lzwkLce47HaGe6SWUktFZlzcOzBoR9Yi+ObrPKeyy3yzvAD2Rjzkkdx
         HymQ==
X-Forwarded-Encrypted: i=1; AJvYcCU2b9tAgFaWf8dwZEj8PAFR5crVyprKfJkQjvRVLSpAdQp9t4Nhe1sabGM2TROpe+oEMlC2m0F/Lc6gM10=@vger.kernel.org
X-Gm-Message-State: AOJu0YzPelKKx9P9xqISxGFivJ93A+kwJFIfguJoE7l8T9z96TTx533t
	AFisfauKUi3jOU8ATFERdd0CKkL30tVvUeD9VBdPKVcgFmXQi0Ep9rSM2aAXE20=
X-Gm-Gg: ASbGncuUSTRgyry5WLD4xheuZXlnT0pwx/uBfSdnQeqlBNxcDW7wH9c2hQ9iDBCBVTa
	cJh9SICkUbF89tb/1KBPLsaWO1Djrq8l922yO7g0YvANPFoWowLInDi0efi0VQK/KaxVIDnpoNF
	gmS5M974JkUMO33Aow8X4SJ8H1HFrv35R9EaV5cE281iCAhqcsP0gUA4GxBt15DC2j3hV/vWwlP
	E5j78SKoZ2D+Vw+jeglNQhAsaaWHeMT8XTMLeywGfCHuwuwOpON+649knp7cLwraBakNLRNOJlY
	FvbF+QHJySoqVXP17g==
X-Google-Smtp-Source: AGHT+IFDsxoKOlYE9hVJEcjDMbMddAqnQRggizK5OgNVO4OHwNPRiJ82/8mZ5zWHijwDhAxcU0RH8A==
X-Received: by 2002:a05:6000:2cf:b0:385:fbb7:672d with SMTP id ffacd0b85a97d-38dc9373265mr3498f8f.52.1738866215879;
        Thu, 06 Feb 2025 10:23:35 -0800 (PST)
Received: from toaster.lan ([2a01:e0a:3c5:5fb1:a0d6:294f:5246:28d4])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4390d94d802sm66111445e9.12.2025.02.06.10.23.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 10:23:35 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dave Ertman <david.m.ertman@intel.com>,
	Ira Weiny <ira.weiny@intel.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/7] driver core: auxiliary bus: add device creation helper
Date: Thu,  6 Feb 2025 19:23:10 +0100
Message-ID: <20250206-aux-device-create-helper-v2-0-fa6a0f326527@baylibre.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Change-ID: 20241210-aux-device-create-helper-93141524e523
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2560; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=FLEpWeaq8lMjgXnMOY8Ul5HTEWMCzOGB3nADQ1KspsQ=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBnpPrIM9GVu8rIOVgwlxjrw4llP6WTN4gs/nrdZ
 mGu9ZRooGaJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCZ6T6yAAKCRDm/A8cN/La
 hSwrD/9ozovKISoFfb+fykKfOG8GZkeh2et7vo6c3bOzbZzdrhzZ3LnR2O0Dc3eTabxaLs5N97I
 VqRH5Z5EYlZHr1Mv7vPphWCdKMH4k8tnQucM5KmA0Gx7atccud35NM8XwWHdQBs0QSESam5dRMw
 pWWK4MAlGEqt9wTbhGSr6c9f5PYG5rBR8MbG+XtMMZhCxXir5Xzu35LBEv9YEO5Lv0hKDIvZsLw
 ObQ4QU+fRIFDTj0P2LdtqNmr0FcZWr+rOaYdgXen4pqvaECAxeK3ABMdCpfoHHM2C0aqyOv+6pe
 p0ATfqUwLAK8lCSkCOcqDrcRgN04IoW7H0pqJS2ao3l0nbhbc7rW96P0gorcW2gwneyslXtCFl3
 bo3keFfE5yfGeMghzMRc9Hn+qZMuM7lVO+Vo8L299BODjjwX5rB4hZLxeC+x7XYR7aQN3IOpOXJ
 HNwlRoaLhy7I6C8t7BgM91BfRXKV7cgDbheaSLbIlupBsrWa3v56bD7c4IgA/BABfHWFOziZx9l
 7sfaPBvorlFD8Eew9JemgZLQRIVuRf23pgPMu5UnDReSGU/CPXg3HS/gZ17ACl2xF8p4GCWq4sz
 +LoMoQE9Cs2U1HrJ5d39PqyPFKxVxYdqV7oZyaAmz1Z5iXnBqZ+G2HrYD7bDPgAvP5T3Gb6qj/O RO1+43EqORWTgFA==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp; fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
Content-Transfer-Encoding: 8bit

The suggestion for this change was initially discussed here: [1]

This patchset adds and use a helper to create a simple auxiliary device.
The goal is to remove boilerplate code that tends to get repeated for
simple cases.

Only the last change was tested on actual HW. The other usage of the helper
have only been compile tested with x64_64 allmodconfig. There are many other
simple cases of auxiliary device creation but those tend to use the
'container_of' trick to allocate the auxiliary device. It is possible to
convert these drivers to use the provided helper but the conversion is
slightly more complex.

[1]: https://lore.kernel.org/linux-clk/df0a53ee859e450d84e81547099f5f36.sboyd@kernel.org

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
Changes in v2:
- Add usage examples, as requested.
- Add 'id' as function parameter:  Adding the example usage showed that
  handling IDA allocation was not appropriate and making the usage more
  complex for simple use case.
- Also add 'modname' as parameter: Most driver have been using
  KBUILD_MODNAME and this actually rarely align with the driver name.
- Link to v1: https://lore.kernel.org/r/20241210-aux-device-create-helper-v1-1-5887f4d89308@baylibre.com

---
Jerome Brunet (7):
      driver core: auxiliary bus: add device creation helper
      reset: mpfs: use the auxiliary device creation helper
      drm/bridge: ti-sn65dsi86: use the auxiliary device creation helper
      platform: arm64: lenovo-yoga-c630: use the auxiliary device creation helper
      clk: eyeq: use the auxiliary device creation helper
      clk: clk-imx8mp-audiomix: use the auxiliary device creation helper
      clk: amlogic: axg-audio: use the auxiliary reset driver - take 2

 drivers/base/auxiliary.c                  |  88 +++++++++++++++++++++++
 drivers/clk/clk-eyeq.c                    |  57 ++++-----------
 drivers/clk/imx/clk-imx8mp-audiomix.c     |  57 ++-------------
 drivers/clk/meson/Kconfig                 |   2 +-
 drivers/clk/meson/axg-audio.c             | 114 ++++--------------------------
 drivers/gpu/drm/bridge/ti-sn65dsi86.c     |  88 +++++++----------------
 drivers/platform/arm64/lenovo-yoga-c630.c |  43 ++---------
 drivers/reset/reset-mpfs.c                |  53 ++------------
 include/linux/auxiliary_bus.h             |   6 ++
 9 files changed, 160 insertions(+), 348 deletions(-)
---
base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
change-id: 20241210-aux-device-create-helper-93141524e523

Best regards,
-- 
Jerome

