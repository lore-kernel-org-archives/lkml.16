Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE3B42676C9
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 07:07:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747638480; cv=none; b=AQ0zEq3eCvUVvA/uOFRISgv0OCq6cmqqUSvDx8LQEpXducZUt0y/qpQU5cpYoXywm1gdUhmnGdbwf2rhjyiFZZ8nYo+2ILsLCTLzMaXm4RT51J2CpUbtmnnya7DMmUKO+FAqa0q6RETfzC4Vd5TEz+KnPRZds9m+ZnY/Yx0y/rY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747638480; c=relaxed/simple;
	bh=4HWksdgns8ejVb++Q4NJVdKDSuHEDHdMmvi+j+YhGlo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=f8yFE7eufgklEthrbw04FuQOBLbSHvJjrI/75yyLDLGxjmxBtQcE0aV6xUXa55uNcKk99whUF09Dkmimdem8tmKVoOgNBXoFncgjzVzHsVP90EZ5Xj4oKHoFlBvoKxg4X67xKr3LmdYtuN4JJLMfT4RXUTl3MncydEIiK2zLXsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oURx1vhr; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oURx1vhr"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-742af848148so1687298b3a.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 00:07:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747638478; x=1748243278; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WNsggH78Gujq22EIg5QA+ygoUlPHiqAj8S6vH5ayXvk=;
        b=oURx1vhrE893jp72/YQ/sUBnRtO8aTJTcAZq5IkvzRVzrRghsh/zfhBt3kO+2Ga9/G
         fnJkmwPOzd1K3K4/rrKi9ygZw1pfP93z2gBG8A344F1E5f7w5mN9TfgGNcvlT6Eijth2
         Y2YFbybWguowNkOL5aE+oxSz7y2h+7zuZoRC0T+gxDZxj84wWzcmMcLv9Rn63M4Gbd9/
         HLmVcagmqxawzKlfHBGBXrW+LhRhyTm13qBaomzswvepcjQl2Thmjm2o6R3asXRgHWbn
         5HUMxLz35a+CGiV3YJJe2VzhL6cSdsEsj3ETo/AAcjtm6de/iYaX+dfhcp+i2R3ILLm2
         XH4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747638478; x=1748243278;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WNsggH78Gujq22EIg5QA+ygoUlPHiqAj8S6vH5ayXvk=;
        b=QCGlkAqGYtvJ09v2qZDcdov9acvYtd+I/wIeZcXjtsTZ9uhyA/P+FQO2bXVZ91JeLu
         N7gUY1/iTDtEWkvAAGgWxvOtx3QInCTdeDcwRncQGR5tX/AHMkGYkg1tK9v6HK9Mb3zE
         QbyL0nQdekebhOVt2Qs5Yp13zdO9sb8ASFJBs2FFUM9O+P40RJufXLW0DXNFFaZiGpo8
         kvsrFp7HFtSiY8P/aWhQlodNWNztfZ6UpUFEMmda6av70iOgEFKYyQ5S7FF3rI9PTWB/
         PNFowyEZKknFkqm1z4jGTLZalnDPUL3hRU0Kn9AxNRIuWzcA0f7VkMUVSOjOY0ncTSzc
         SIpQ==
X-Forwarded-Encrypted: i=1; AJvYcCV3gYfhf7sKp3wmeW7WbIQjsuagSVQBdAKIWaNSMUg3WcUP4fJkXZ0ykfusWtGlA/yYb3+jFxGXZRcbenQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8Z6IitxQyagPxL72El8uAZ6b5rwT6NsB/d5Rte7xQm1RtZ3TY
	Rb8csKwt8uuaZwlUnHhNAnI96y+5GwZzerqIdwA9gjDuXuk+5VRmAJ25cgAPCHmQ3sI=
X-Gm-Gg: ASbGncvhKK/cUjTgQ2KR/vOksEiDEOufg15I3oPl+VkEeOmpWnfLs7kIXrbtlTkcqwV
	WB4ye1m6DmfKluL/4G8NluTQIZb+uGrGKgcNjm58G9UUUXDyHJ2TH2foNh8Qr/wyxa+xXzpHTpr
	DUIopgisGWpemneki9pyddC52zBlMDJfGabjz8eko6ls1aVtUoSQCFo+Jl6xYLIceVTz8IsZZhk
	gFYQRRTPzH245Z2cGLPrMwWtPx8vTBAv9f7fguOf/51n7r6oXnjjh9dfkT1mT89KnAxoPp6zdgM
	Tdz0J3z03UjTjQmnZFMhmRldsOhkl6XEvuHwVEG8QVW5CCZYDlP2vKJRidB8xNc=
X-Google-Smtp-Source: AGHT+IHyX79iTRiEese5DXhXzl4RcrDdeFt3S9RU8Ax4nAHLTvc2jaPooDG34VMRP3xDbTxlkEsoKQ==
X-Received: by 2002:a17:90b:558e:b0:30e:840a:92ed with SMTP id 98e67ed59e1d1-30e840a93d2mr16053139a91.31.1747638478085;
        Mon, 19 May 2025 00:07:58 -0700 (PDT)
Received: from localhost ([122.172.81.72])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30ef3c50c31sm1582169a91.45.2025.05.19.00.07.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 00:07:57 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>,
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	Danilo Krummrich <dakr@redhat.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Viresh Kumar <viresh.kumar@linaro.org>,
	linux-pm@vger.kernel.org,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Nishanth Menon <nm@ti.com>,
	rust-for-linux@vger.kernel.org,
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Joakim Bech <joakim.bech@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Yury Norov <yury.norov@gmail.com>,
	Burak Emir <bqe@google.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Russell King <linux@armlinux.org.uk>,
	linux-clk@vger.kernel.org,
	Andrew Ballance <andrewjballance@gmail.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH V12 04/15] rust: clk: Add helpers for Rust code
Date: Mon, 19 May 2025 12:37:09 +0530
Message-Id: <0ec0250c1170a8a6efb2db7a6cb49ae974d7ce05.1747634382.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
In-Reply-To: <cover.1747634382.git.viresh.kumar@linaro.org>
References: <cover.1747634382.git.viresh.kumar@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Non-trivial C macros and inlined C functions cannot be used directly
in the Rust code and are used via functions ("helpers") that wrap
those so that they can be called from Rust.

In order to prepare for adding Rust abstractions for the clock APIs,
add clock helpers required by the Rust implementation.

Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 MAINTAINERS                     |  1 +
 rust/bindings/bindings_helper.h |  1 +
 rust/helpers/clk.c              | 66 +++++++++++++++++++++++++++++++++
 rust/helpers/helpers.c          |  1 +
 4 files changed, 69 insertions(+)
 create mode 100644 rust/helpers/clk.c

diff --git a/MAINTAINERS b/MAINTAINERS
index bd7c54af4fd4..608689342aaf 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5883,6 +5883,7 @@ F:	include/dt-bindings/clock/
 F:	include/linux/clk-pr*
 F:	include/linux/clk/
 F:	include/linux/of_clk.h
+F:	rust/helpers/clk.c
 X:	drivers/clk/clkdev.c
 
 COMMON INTERNET FILE SYSTEM CLIENT (CIFS and SMB3)
diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
index ab37e1d35c70..f53d6e1a21f2 100644
--- a/rust/bindings/bindings_helper.h
+++ b/rust/bindings/bindings_helper.h
@@ -10,6 +10,7 @@
 #include <linux/blk-mq.h>
 #include <linux/blk_types.h>
 #include <linux/blkdev.h>
+#include <linux/clk.h>
 #include <linux/cpumask.h>
 #include <linux/cred.h>
 #include <linux/device/faux.h>
diff --git a/rust/helpers/clk.c b/rust/helpers/clk.c
new file mode 100644
index 000000000000..6d04372c9f3b
--- /dev/null
+++ b/rust/helpers/clk.c
@@ -0,0 +1,66 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <linux/clk.h>
+
+/*
+ * The "inline" implementation of below helpers are only available when
+ * CONFIG_HAVE_CLK or CONFIG_HAVE_CLK_PREPARE aren't set.
+ */
+#ifndef CONFIG_HAVE_CLK
+struct clk *rust_helper_clk_get(struct device *dev, const char *id)
+{
+	return clk_get(dev, id);
+}
+
+void rust_helper_clk_put(struct clk *clk)
+{
+	clk_put(clk);
+}
+
+int rust_helper_clk_enable(struct clk *clk)
+{
+	return clk_enable(clk);
+}
+
+void rust_helper_clk_disable(struct clk *clk)
+{
+	clk_disable(clk);
+}
+
+unsigned long rust_helper_clk_get_rate(struct clk *clk)
+{
+	return clk_get_rate(clk);
+}
+
+int rust_helper_clk_set_rate(struct clk *clk, unsigned long rate)
+{
+	return clk_set_rate(clk, rate);
+}
+#endif
+
+#ifndef CONFIG_HAVE_CLK_PREPARE
+int rust_helper_clk_prepare(struct clk *clk)
+{
+	return clk_prepare(clk);
+}
+
+void rust_helper_clk_unprepare(struct clk *clk)
+{
+	clk_unprepare(clk);
+}
+#endif
+
+struct clk *rust_helper_clk_get_optional(struct device *dev, const char *id)
+{
+	return clk_get_optional(dev, id);
+}
+
+int rust_helper_clk_prepare_enable(struct clk *clk)
+{
+	return clk_prepare_enable(clk);
+}
+
+void rust_helper_clk_disable_unprepare(struct clk *clk)
+{
+	clk_disable_unprepare(clk);
+}
diff --git a/rust/helpers/helpers.c b/rust/helpers/helpers.c
index e1c21eba9b15..ae595c9cd91b 100644
--- a/rust/helpers/helpers.c
+++ b/rust/helpers/helpers.c
@@ -11,6 +11,7 @@
 #include "bug.c"
 #include "build_assert.c"
 #include "build_bug.c"
+#include "clk.c"
 #include "cpumask.c"
 #include "cred.c"
 #include "device.c"
-- 
2.31.1.272.g89b43f80a514

