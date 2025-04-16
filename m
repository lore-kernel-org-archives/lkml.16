Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73E4B22B8BE
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 06:40:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744785609; cv=none; b=fTGEXP1InTH3CVkgOt/XNfPNtLfv+fs1nbzlUhr7XEwvEcjAV57k2kCfRVxXFilC8VSboPaGqsdvjs5s6AG0vD2UgFMNwDhEzri8O1+P8iPgHBabNyZTAXgSVN67HQNggmbJujoChHBB0SQfQPkFtCqFKoA8QLba86PR03x0eyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744785609; c=relaxed/simple;
	bh=4HWksdgns8ejVb++Q4NJVdKDSuHEDHdMmvi+j+YhGlo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=MGwe0YNSTLg7YxrD1GxxI7Ubyj4q+dGrI0/TUqetS2vaN7CwGzd2+1dQ8e4Y3cV7rhbKL6MfmOhfMUGc6cdBfUo1LcalScKm1uaQHjpbsxZy+E3i2LgvFp96Z1WZIF/LItYoSuoo9tMFBo9H4FTsrnZBRviaKa6kqEsuftVeM/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yVkwDNHK; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yVkwDNHK"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2295d78b433so66567595ad.2
        for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 23:40:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744785607; x=1745390407; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WNsggH78Gujq22EIg5QA+ygoUlPHiqAj8S6vH5ayXvk=;
        b=yVkwDNHKd773ietJQVhcDSIcPR0scv67jKk94RIHiTDgBIoYEtjWTsxKy0bZdTXtTM
         oC5bscRTdZ/wLlxMw44OlWfMxBSkug+3RYxl9Xo2sGo0Eg3ipqfWHzJixXZ4jgeegd6D
         eNpI+xWdRng1ygV35TW3u8QTo9DWfrZTpZavG4gPL8WQrslQkhSNNjsX7XcPDwYwa/2x
         h4UXgDeZwKGf7JdNIbWfZzHl/T1+L7gcgQ4uTq6ABe8hThJjvhOlqUYPee4Ro8cFBEnh
         CBTWV3+cMYZyxu1WoRy0r5X064DxNplYitVyvlGFdLEvlMA+Lp7MLbszHgI2jNM8/r8i
         kF/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744785607; x=1745390407;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WNsggH78Gujq22EIg5QA+ygoUlPHiqAj8S6vH5ayXvk=;
        b=UyigMDdjy+TQsTDvukyISJljj/quIMO0up4S2sYIc2S9bhWxsfH+W8e5y69AkaPNMt
         UGvxzqNnmPXICevNqym6ACVbGngjMFGpEQ8jV9ntIpvFtm4XYzgYgeH0l60mhzBniAT9
         HXHSFWOSFFkZyVa1PjcsgWsw326JSMHEMBFofLVHCwvCQMBXk9oovBTxhBzJt+u6TDd3
         PzyOgrB+LhpOWIPzRsL+eelfWrFECfaWnd6jcbebonF0SnBJUrimW9xa966Ch0AiqK8i
         O7wX4tBeFnz4LMAcBRySPmsa4bn/3NfO4KO1+7MsZ68AsBOSy+XhNtP6JN5MWTwls1AR
         90Sw==
X-Forwarded-Encrypted: i=1; AJvYcCWSKnzxMmiqNHJrwjaqnvM0aQL59A3GFbHoG5waLu/JZvq2HNuFhtB57GTp2mnNX6Go3UxrOYKcSRkP+PU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxV4dDRoaAZpiWFAIJ7R88sFvxrTWZ9uuNiu0B96g1vawbhs/eJ
	Q6CWwRg5GqfR9h71aTxfxWgpW8KRkih6kqxw42XEmYVou6kmnLUdXDwL7RVoAac=
X-Gm-Gg: ASbGncvRTtLW0X82s7s3+95K0WW3cFSA3D1R1Hbl0o5ZnO1cZYNRguPllGvT1LhYfcd
	TTO2twfyBcoIWGc9yd1PNpbwi22E0U5al2+UheC0nc5bywx7Nlscp4ukxFi8S1ibl6CGy/jBhQq
	81IxjPEmIZY1IlBL3dAQSTYBkSKMOp0fNYnIM+0BzdEhpg9J1Su9R1TGvOmCX7Y02cUAUBLNKPM
	LEGBVqHU/Vsj6NYFhDgdNkAchDFtAs/8FcfKPWAnMn5GIJEdUGCjQzhTpAy/52QGm8tRgzVB54+
	GWwi1NttxJka2rYYVgBZvw/NDgGPUF/kCN0/ONZGKw==
X-Google-Smtp-Source: AGHT+IEjYJIomZsBzT4VP3kt4Qqlp10kJpH2tsSbgblMt/ChgJzb0bcD6XJqL4gtPDZEGDyA54icng==
X-Received: by 2002:a17:902:fc86:b0:225:adf8:8634 with SMTP id d9443c01a7336-22c359913a1mr10848965ad.51.1744785606709;
        Tue, 15 Apr 2025 23:40:06 -0700 (PDT)
Received: from localhost ([122.172.83.32])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bd22f1259sm9656834b3a.119.2025.04.15.23.40.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 23:40:06 -0700 (PDT)
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
	Daniel Almeida <daniel.almeida@collabora.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH V10 04/15] rust: clk: Add helpers for Rust code
Date: Wed, 16 Apr 2025 12:09:21 +0530
Message-Id: <97741e1c82feecbd650183c6a52d2e8bbafad79f.1744783509.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
In-Reply-To: <cover.1744783509.git.viresh.kumar@linaro.org>
References: <cover.1744783509.git.viresh.kumar@linaro.org>
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

