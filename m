Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7900C1F0E25
	for <linux-kernel@vger.kernel.org>; Sat,  7 Jun 2025 20:28:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749328086; cv=none; b=Id2c0zT9eT/SLgZAcPMZN0mwvWYm5mi5KGtjqqRXC5skFCSn6RWqv0LuZ9yI8l8Qvb2h5IOYD45VpKNY4+WtHjLOYL7i6NPvZyvqAd9yup/c16T/vo6JuK3wpTnbuAy0aFYjVRVl3ifUalFmLUfqbgfvYiPWl9UQMlZ2qCzzeBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749328086; c=relaxed/simple;
	bh=7neKK/LUxYPlYgKjRN/Lyrv3ugJoj6FkgGZxKg3h/qg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sOTgDVcsBZX5y5dVGlJls/9TC8aa4Za/+GZQSKXpD2tx0r6vT4ykUETlGt6bRfcA42XFsHfQ+d5WnJ4vU6KwoXDOEIqe5WvHHaDDVmZIfC+dVhwF7Lcr48JehiPdqGxOgJeJNHJyp5vpg+bR5gb9ZBXPdF9yCNL8olm2lSK3Y9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=AsrJ72WN; arc=none smtp.client-ip=209.85.160.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="AsrJ72WN"
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-2da73155e91so1308914fac.0
        for <linux-kernel@vger.kernel.org>; Sat, 07 Jun 2025 13:28:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1749328083; x=1749932883; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+L1F7WN7oNU4Rha4L1L/e482m8K2Vmc2Laqvym1FnH4=;
        b=AsrJ72WNerF5tbq7x4oi8Nlc9KOyvOHacdJ4vNFR8BS6AQv5zVggzrLQ5D4HG1KHAx
         OjJBUhh+CJMdGn5jV06hLC9RgMqoaSWE3Iv/7fdVuJohhSc4nrvlsItT3Rt6zNku9TKl
         n932V1FNBKHgNnXOpXhMzSFE1FmMksNMJfUEPG3Qd48VDDkgv02e+fY5jEwbYKAcv4Z+
         +WjTq1uIPDk6X7sTmnn3HyMk30uV1kx27KCvBt0GnuQYjB6tFsucjSdpxLH2ZUzsWGZy
         /9Vxe5i57K6RRPGjaRGZBcfy7jhy9fwW6s95YcU1ap0qMzRdLP6zvIaPRUeRZ6A4BXTQ
         a70g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749328083; x=1749932883;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+L1F7WN7oNU4Rha4L1L/e482m8K2Vmc2Laqvym1FnH4=;
        b=wW1NIDcLoW9kcYgSb5lZKJhkiQ7/2XhfTXohZ94e3uJBVyuRr/2a1ZXkw0uspzDluR
         WLufY9A1rzU82mOBTlonPTRlVdAwf8vBDJedJBOaw2bJ0AfvJgJJZ6sqGDCK/DzZ8GpF
         iAne3c69Zic1chFtVxEa4dlpeHK4slE3P8QRjBuDFwVgSyNc7Ct9mJQrpE6jMrTDyvaI
         N7QZaFy36lXfnnScgcpxb8LmWK12WP0o9y9W27ZEhRNU/2EJonyh0Z67YYCTv+p2GV3X
         R73drYmNCvK7A2Ej66eYTfUYD2pmbX6l1tubFRescPzTxDY89cGCnxuDcb/Ps9ghg9J4
         8Ewg==
X-Forwarded-Encrypted: i=1; AJvYcCUUkOleHlhdrxWPZ7r1JNjK1ShznSSdKVqNBrATolgBkP/ZcFKk/4Pi+I45Oalm6e6vw4uvo1lcd/2MRx4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyP3VG5PUcLFdKe67tK9r67F+HSgKrdkArIpR7eD18mc7D+h2VW
	fN3XkpAtb4Gu6iJ2t/SHA4pjsgComjsEFzQ2q2RZv6eERxoGFkcrJGmFWZHxTXaE1Po=
X-Gm-Gg: ASbGncu/yobPesgDPaLq3/+rqEKvrFHc5YCuQLUczipVryRkJaK3Ekh1xZi7Mp1UBQE
	FIWKJmZM9RPpfAYJt+Pv7HGA5ZK4VdLPMUeZqv7d4gyWKfWjreqxJOIevdpS2Hf7+EvFEvfyY9c
	eBXj/5UVo/kOiw6o/cHRUsnnohBhaZ1tQNpbc1GO7f1/k1049b/JWHJ30QO2ESsT+f0yz8ag2Bp
	QINPASJY71yHFeUFdniD638/EXlx3FJi1b8xdBhFgFLLzwWNedAWa5JxFd6sS+QifNEN1wYhJOW
	Zcs77tmgAxtevEOJz3WufB7eFopTuxB9kNs6ugBw3LJbXMT9rZuU7/Mvpr1IhFSxi/80iKvlVs5
	c/xYXSv4xIcJ3CfonbHEOE4kJ5OiPrY8=
X-Google-Smtp-Source: AGHT+IEvPgGJvDGOrI6eAu5IXXdeG5KtOXQ02AqjXd9yxzuhdNHpWFjKBYNJ0mWoWzWzeLONozHNTA==
X-Received: by 2002:a05:6870:818f:b0:2e8:ff0e:17d3 with SMTP id 586e51a60fabf-2ea009b7c99mr4489727fac.21.1749328083498;
        Sat, 07 Jun 2025 13:28:03 -0700 (PDT)
Received: from presto.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-60f3e46bc17sm747593eaf.0.2025.06.07.13.28.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Jun 2025 13:28:02 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: mturquette@baylibre.com,
	sboyd@kernel.org
Cc: dlan@gentoo.org,
	heylenay@4d2.org,
	inochiama@outlook.com,
	elder@riscstar.com,
	linux-clk@vger.kernel.org,
	spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Guodong Xu <guodong@riscstar.com>
Subject: [PATCH] clk: spacemit: mark K1 pll1_d8 as critical
Date: Sat,  7 Jun 2025 15:27:58 -0500
Message-ID: <20250607202759.4180579-1-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The pll1_d8 clock is enabled by the boot loader, and is ultimately a
parent for numerous clocks.  Guodong Xu was recently testing DMA,
adding a reset property, and discovered that the needed reset was
not yet ready during initial probe.  It dropped its clock reference,
which dropped parent references, and along the way it dropped the sole
reference to pll1_d8 (from its prior clk_get()).  Clock pll1_d8 got
disabled, which resulted in a non-functioning system.

Mark that clock critical so it doesn't get turned off in this case.
We might be able to turn this flag off someday, but for now it
resolves the problem Guodong encountered.

Define a new macro CCU_FACTOR_GATE_DEFINE() to allow clock flags to
be supplied for a CCU_FACTOR_GATE clock.

Fixes: 1b72c59db0add ("clk: spacemit: Add clock support for SpacemiT K1 SoC")
Signed-off-by: Alex Elder <elder@riscstar.com>
Tested-by: Guodong Xu <guodong@riscstar.com>
---
 drivers/clk/spacemit/ccu-k1.c  |  3 ++-
 drivers/clk/spacemit/ccu_mix.h | 21 +++++++++++++--------
 2 files changed, 15 insertions(+), 9 deletions(-)

diff --git a/drivers/clk/spacemit/ccu-k1.c b/drivers/clk/spacemit/ccu-k1.c
index cdde37a052353..df65009a07bb1 100644
--- a/drivers/clk/spacemit/ccu-k1.c
+++ b/drivers/clk/spacemit/ccu-k1.c
@@ -170,7 +170,8 @@ CCU_FACTOR_GATE_DEFINE(pll1_d4, CCU_PARENT_HW(pll1), APBS_PLL1_SWCR2, BIT(3), 4,
 CCU_FACTOR_GATE_DEFINE(pll1_d5, CCU_PARENT_HW(pll1), APBS_PLL1_SWCR2, BIT(4), 5, 1);
 CCU_FACTOR_GATE_DEFINE(pll1_d6, CCU_PARENT_HW(pll1), APBS_PLL1_SWCR2, BIT(5), 6, 1);
 CCU_FACTOR_GATE_DEFINE(pll1_d7, CCU_PARENT_HW(pll1), APBS_PLL1_SWCR2, BIT(6), 7, 1);
-CCU_FACTOR_GATE_DEFINE(pll1_d8, CCU_PARENT_HW(pll1), APBS_PLL1_SWCR2, BIT(7), 8, 1);
+CCU_FACTOR_GATE_FLAGS_DEFINE(pll1_d8, CCU_PARENT_HW(pll1), APBS_PLL1_SWCR2, BIT(7), 8, 1,
+		CLK_IS_CRITICAL);
 CCU_FACTOR_GATE_DEFINE(pll1_d11_223p4, CCU_PARENT_HW(pll1), APBS_PLL1_SWCR2, BIT(15), 11, 1);
 CCU_FACTOR_GATE_DEFINE(pll1_d13_189, CCU_PARENT_HW(pll1), APBS_PLL1_SWCR2, BIT(16), 13, 1);
 CCU_FACTOR_GATE_DEFINE(pll1_d23_106p8, CCU_PARENT_HW(pll1), APBS_PLL1_SWCR2, BIT(20), 23, 1);
diff --git a/drivers/clk/spacemit/ccu_mix.h b/drivers/clk/spacemit/ccu_mix.h
index 51d19f5d6aacb..668c8139339e1 100644
--- a/drivers/clk/spacemit/ccu_mix.h
+++ b/drivers/clk/spacemit/ccu_mix.h
@@ -101,16 +101,21 @@ static struct ccu_mix _name = {							\
 	}									\
 }
 
+#define CCU_FACTOR_GATE_FLAGS_DEFINE(_name, _parent, _reg_ctrl, _mask_gate, _div,	\
+			       _mul, _flags)					\
+struct ccu_mix _name = {							\
+	.gate	= CCU_GATE_INIT(_mask_gate),					\
+	.factor	= CCU_FACTOR_INIT(_div, _mul),					\
+	.common = {								\
+		.reg_ctrl	= _reg_ctrl,					\
+		CCU_MIX_INITHW(_name, _parent, spacemit_ccu_factor_gate_ops, _flags)	\
+	}									\
+}
+
 #define CCU_FACTOR_GATE_DEFINE(_name, _parent, _reg_ctrl, _mask_gate, _div,	\
 			       _mul)						\
-static struct ccu_mix _name = {							\
-	.gate	= CCU_GATE_INIT(_mask_gate),					\
-	.factor	= CCU_FACTOR_INIT(_div, _mul),					\
-	.common = {								\
-		.reg_ctrl	= _reg_ctrl,					\
-		CCU_MIX_INITHW(_name, _parent, spacemit_ccu_factor_gate_ops, 0)	\
-	}									\
-}
+	CCU_FACTOR_GATE_FLAGS_DEFINE(_name, _parent, _reg_ctrl, _mask_gate, _div,	\
+			       _mul, 0)
 
 #define CCU_MUX_GATE_DEFINE(_name, _parents, _reg_ctrl, _shift, _width,		\
 			    _mask_gate, _flags)					\
-- 
2.45.2

