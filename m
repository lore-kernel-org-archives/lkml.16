Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC2CC2E9EC9;
	Thu,  3 Jul 2025 18:47:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751568433; cv=none; b=Uf7+qb94UCUUX5ZiaXCHtihd+nHY6p3fV/rwZNse/hJ9QqdyP7HAf5tukirCexfz0boXl02BKn0o5bD6sGQKixS3obUdppkDQX6WiWO+N1ECDLeUObCrsg/pzYO8WbBzFgh6nZHdTpJ/p9gL+sDYayRa78UkeG/9MNIDe3Cn+5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751568433; c=relaxed/simple;
	bh=Uqx2K8iqj8C9J2fe3pyivDhLY31N5WS3GpKgVecfeqw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=auLqR4vX2lqU0xPMT6v2Gooe0vcz82g5C5NZT6wFBodqkXZA1jGN0EM+Ocfo0MRKs+sPREqST/gNL3VcZks0WzefRdVCBK5uhSvzZ64TCZGckQpQchUsrkkkgknTTNlEJnb5Cr9iFSXnk/wfQfiCbVJS2KqCKQrTehCOfCG6VQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c2bn4N/r; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c2bn4N/r"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-73972a54919so356425b3a.3;
        Thu, 03 Jul 2025 11:47:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751568430; x=1752173230; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9OzOvhq3GmbvaBtGUgAaXSZiV6ZbsCylTW2ygbBRF/o=;
        b=c2bn4N/rMo9bFuwgs3PdlVMrV79i+cs62MNBQNTsg41YBFCutQ4MMLgC5KVsVkjuTG
         A74jeKWehQetmYBrPrsLhrQolI+/W2CnuTzQOqRMciI92yB2VsoQcwrhruVULyJfmjhG
         d+z43gD8gToZN2GeF/HhuhU0bLX7q3ycW+xD895QJ0YDXWO57KVk3/yJmkAj8o4nJSQr
         KwDvoWMqK8Db0r2vVCsCZj8zZNDEGj7IEfO4W7X3/lkyCTqElHwypcEiaUcA87zqZ2Vo
         l+PmhqO+E/nl6vKF3DA7/mKCAZv8KRXS9WSjDUjwJOR7l1cIwLhbxcUhIH91ltO52WZV
         vKcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751568430; x=1752173230;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9OzOvhq3GmbvaBtGUgAaXSZiV6ZbsCylTW2ygbBRF/o=;
        b=vQoqQMNRVJ8lXCowLHjLI2ZlAT3hll8Po+firPukoxxDKG4IVBZHJy/Bd0pGbTTLxh
         Rc/QCTxYCE9y3kHHu3PlTuFNHFldhLeXxcdZglWIxdo8k2xmzyAyRDVbtnN93OjpIBqi
         NQedMLDdpKiUnFb1cAn4O70ZYJGcjEf3lhXzyk8/ZnOcnX7XjFOX9Fg7pmEsp9uDszgF
         6ZcaiGaDJcKAJT+WWI6yj0lRvqQgIhMoMyYq34DcLYO9Q1EuSIC2vsqbcJ/+WEHPC2eu
         31pdMMF3egvS8AgoBS6tsp+ZWYbOEW8OyVFNxUXqmefaQDkG2jbd3Rh/wJj+ek8F2n5A
         djjg==
X-Forwarded-Encrypted: i=1; AJvYcCVPyCzZMrBcKbWR/CAzFcR5xNYi8/4Khvr8mF9bIe4ZTE3MCI6YRHBGDUrpsCaweLWeYuVLkBkCIdJzrAg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwMmollY613lg8M+sSYDTd7GapYQxbqVqB5Vr4HBkPcZ3c6Y/wt
	KiLhgOIDjwamClqzCZDOEUorAuA2VaCucQKDnjBLfYNOJjBtrbrSl6+o
X-Gm-Gg: ASbGncut4Uv/MGbTOO/MlcwJy9RhW7SiI7+dQQzYJILVhPd6KsSkxELfhtVi41OtXGl
	Dz4QDf5WJMv/qCb2dSk/uscozhM64JVZ5iBeFAC/0cXpbJgWUKzfmxf5Z2MgKY/drqfH7fSsdtw
	6mIm11oX7bCARVsLUvzinVbOfJULmW9ruzlezQjH+vFnDxKaw296iTgiIFETnP0usMCsJqQuzz6
	TrztwHp+402W4+KdWZXM/u4Di/gyiNvwuo6ebxOQi/tCNjIZQ8MoYO9eysdrBPVIOVu8CNE6Cvo
	vED5+vlwyPv0RrEq4Q3KQ0MUythxSA/G8LFrbcFdzAu++oUTGHAG7EYPGvFZFJhXyvcbqnRMdSK
	aQ04yCl//WMl86t3SYw==
X-Google-Smtp-Source: AGHT+IGGdSrO72xn9qTSPHgCp+n9DyMAPuvEbKUXrsvqwInd/blTS202ynaZjuZx54FTS1JJgB0QIg==
X-Received: by 2002:a05:6a21:7a47:b0:21f:4ecc:11a9 with SMTP id adf61e73a8af0-222d7f08449mr14018200637.32.1751568430070;
        Thu, 03 Jul 2025 11:47:10 -0700 (PDT)
Received: from ak-workspace.tail730999.ts.net ([2406:7400:63:5144:cefd:59bd:c444:e2b1])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74ce42cefccsm193739b3a.156.2025.07.03.11.47.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 11:47:09 -0700 (PDT)
From: Akshaykumar Gunari <akshaygunari@gmail.com>
To: corbet@lwn.net,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com
Cc: linux-doc@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Akshaykumar Gunari <akshaygunari@gmail.com>
Subject: [PATCH] docs: arm: stm32: fix typo "busses" -> "buses"
Date: Fri,  4 Jul 2025 00:16:59 +0530
Message-ID: <20250703184659.3110-1-akshaygunari@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix the spelling of "busses" to the preferred form "buses" in STM32 ARM
architecture documentation.

Signed-off-by: Akshaykumar Gunari <akshaygunari@gmail.com>
---
 Documentation/arch/arm/stm32/stm32f746-overview.rst  | 2 +-
 Documentation/arch/arm/stm32/stm32f769-overview.rst  | 2 +-
 Documentation/arch/arm/stm32/stm32h743-overview.rst  | 2 +-
 Documentation/arch/arm/stm32/stm32h750-overview.rst  | 2 +-
 Documentation/arch/arm/stm32/stm32mp13-overview.rst  | 2 +-
 Documentation/arch/arm/stm32/stm32mp151-overview.rst | 2 +-
 6 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/Documentation/arch/arm/stm32/stm32f746-overview.rst b/Documentation/arch/arm/stm32/stm32f746-overview.rst
index 78befddc7740..335f0855a858 100644
--- a/Documentation/arch/arm/stm32/stm32f746-overview.rst
+++ b/Documentation/arch/arm/stm32/stm32f746-overview.rst
@@ -15,7 +15,7 @@ It features:
 - SD/MMC/SDIO support
 - Ethernet controller
 - USB OTFG FS & HS controllers
-- I2C, SPI, CAN busses support
+- I2C, SPI, CAN buses support
 - Several 16 & 32 bits general purpose timers
 - Serial Audio interface
 - LCD controller
diff --git a/Documentation/arch/arm/stm32/stm32f769-overview.rst b/Documentation/arch/arm/stm32/stm32f769-overview.rst
index e482980ddf21..ef31aadee68f 100644
--- a/Documentation/arch/arm/stm32/stm32f769-overview.rst
+++ b/Documentation/arch/arm/stm32/stm32f769-overview.rst
@@ -15,7 +15,7 @@ It features:
 - SD/MMC/SDIO support*2
 - Ethernet controller
 - USB OTFG FS & HS controllers
-- I2C*4, SPI*6, CAN*3 busses support
+- I2C*4, SPI*6, CAN*3 buses support
 - Several 16 & 32 bits general purpose timers
 - Serial Audio interface*2
 - LCD controller
diff --git a/Documentation/arch/arm/stm32/stm32h743-overview.rst b/Documentation/arch/arm/stm32/stm32h743-overview.rst
index 4e15f1a42730..7659df24d362 100644
--- a/Documentation/arch/arm/stm32/stm32h743-overview.rst
+++ b/Documentation/arch/arm/stm32/stm32h743-overview.rst
@@ -15,7 +15,7 @@ It features:
 - SD/MMC/SDIO support
 - Ethernet controller
 - USB OTFG FS & HS controllers
-- I2C, SPI, CAN busses support
+- I2C, SPI, CAN buses support
 - Several 16 & 32 bits general purpose timers
 - Serial Audio interface
 - LCD controller
diff --git a/Documentation/arch/arm/stm32/stm32h750-overview.rst b/Documentation/arch/arm/stm32/stm32h750-overview.rst
index 0e51235c9547..be032b77d1f1 100644
--- a/Documentation/arch/arm/stm32/stm32h750-overview.rst
+++ b/Documentation/arch/arm/stm32/stm32h750-overview.rst
@@ -15,7 +15,7 @@ It features:
 - SD/MMC/SDIO support
 - Ethernet controller
 - USB OTFG FS & HS controllers
-- I2C, SPI, CAN busses support
+- I2C, SPI, CAN buses support
 - Several 16 & 32 bits general purpose timers
 - Serial Audio interface
 - LCD controller
diff --git a/Documentation/arch/arm/stm32/stm32mp13-overview.rst b/Documentation/arch/arm/stm32/stm32mp13-overview.rst
index 3bb9492dad49..b5e9589fb06f 100644
--- a/Documentation/arch/arm/stm32/stm32mp13-overview.rst
+++ b/Documentation/arch/arm/stm32/stm32mp13-overview.rst
@@ -24,7 +24,7 @@ More details:
 - ADC/DAC
 - USB EHCI/OHCI controllers
 - USB OTG
-- I2C, SPI, CAN busses support
+- I2C, SPI, CAN buses support
 - Several general purpose timers
 - Serial Audio interface
 - LCD controller
diff --git a/Documentation/arch/arm/stm32/stm32mp151-overview.rst b/Documentation/arch/arm/stm32/stm32mp151-overview.rst
index f42a2ac309c0..b58c256ede9a 100644
--- a/Documentation/arch/arm/stm32/stm32mp151-overview.rst
+++ b/Documentation/arch/arm/stm32/stm32mp151-overview.rst
@@ -23,7 +23,7 @@ More details:
 - ADC/DAC
 - USB EHCI/OHCI controllers
 - USB OTG
-- I2C, SPI busses support
+- I2C, SPI buses support
 - Several general purpose timers
 - Serial Audio interface
 - LCD-TFT controller
-- 
2.43.0

