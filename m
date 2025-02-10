Received: from mail.thorsis.com (mail.thorsis.com [217.92.40.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E9F52580D4;
	Mon, 10 Feb 2025 16:45:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.92.40.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739205927; cv=none; b=F6SqSJvd2kRHkUqDZWfcrkgWbmkZvt5QPYxj1t6AnPLfLW864I2mFZA+DSqlw5Ql0xCTcmmY7ac+H7OiXaeOvYo9mNfq6MPe5pip16tGjF99I0OcXMKX+4+UV8Fuu9cCDKIkYHqcdPKineK2jMnlYj/GX5A4KXwWRQuCgOHUdLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739205927; c=relaxed/simple;
	bh=ls5z6yKtjpDimhSK7my0ZfFh65dMvJQB5T49MSYmQLY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=WWpte8MTW/IO2nba5alSa+V3WtfbKQJqSCGM9MndDfm/WBI8GI6T4b2+NB7iZz1oSGZJLw8xBrmpjVGUdbVGwjJGy2TTScfLMkXPAc7ed9G4OjtCo9RpUTTs90xJXJujUg6UGBfW8wyKhfcbQcuOaHYsGo0JS9l3bXUgYkARXow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=thorsis.com; spf=pass smtp.mailfrom=thorsis.com; dkim=pass (2048-bit key) header.d=thorsis.com header.i=@thorsis.com header.b=M8zTLMLo; arc=none smtp.client-ip=217.92.40.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=thorsis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thorsis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thorsis.com header.i=@thorsis.com header.b="M8zTLMLo"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 85B061480320;
	Mon, 10 Feb 2025 17:45:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=thorsis.com; s=dkim;
	t=1739205916;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=p59kS6BgnDtLm2RBmPDFSxO8EjcssSjUIbakAXnj8oY=;
	b=M8zTLMLoc4D5DvNZU+oxhDSzqwcZ+Rt1xIPKEzcXnqo+rkk0uPE079v4tFKly210tV3/iD
	H33MAdHt0yc5PO9pF0N6qDHZ82Fy1EoUtc87ymhVhb4dtGmvG649uGqQW1G2e8bcOnZGhc
	a9zvbvC5/9vDCF97BkAW0vWqpKKFdd6OxcoCQkGL/Zh8nhvr47YG33SwgSJJCaK3ElsvMU
	qRljw57U1Av6tyHo2+/lHE0nFu6xUsQl8DKJ4eD8QT+gkXpd+zlAha/sHrBvDOUE1HzhkY
	T49pgK+ics1ztVZfA5AiMIosXyBk0NIkI5nv/DOE+JPuk5ce67lSpdd+ZzOyzw==
From: Alexander Dahl <ada@thorsis.com>
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>,
	Ryan Wanner <ryan.wanner@microchip.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v2 01/16] dt-bindings: clock: at91: Split up per SoC partially
Date: Mon, 10 Feb 2025 17:44:51 +0100
Message-Id: <20250210164506.495747-2-ada@thorsis.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250210164506.495747-1-ada@thorsis.com>
References: <20250210164506.495747-1-ada@thorsis.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Before adding even more new indexes creating more holes in the
clk at91 drivers pmc_data->chws arrays, split this up.

This is a partial split up only for SoCs affected by upcoming changes
and by that PMC_MAIN + x hack, others could follow by the same scheme.

Binding splitup was proposed for several reasons:

1) keep the driver code simple, readable, and efficient
2) avoid accidental array index duplication
3) avoid memory waste by creating more and more unused array members.

Old values are kept to not break dts, and to maintain dt ABI.

Link: https://lore.kernel.org/linux-devicetree/20250207-jailbird-circus-bcc04ee90e05@thorsis.com/T/#u
Signed-off-by: Alexander Dahl <ada@thorsis.com>
---

Notes:
    v2:
    - new patch, not present in v1

 .../dt-bindings/clock/microchip,sam9x60-pmc.h | 19 +++++++++++
 .../dt-bindings/clock/microchip,sam9x7-pmc.h  | 25 +++++++++++++++
 .../clock/microchip,sama7d65-pmc.h            | 32 +++++++++++++++++++
 .../dt-bindings/clock/microchip,sama7g5-pmc.h | 24 ++++++++++++++
 4 files changed, 100 insertions(+)
 create mode 100644 include/dt-bindings/clock/microchip,sam9x60-pmc.h
 create mode 100644 include/dt-bindings/clock/microchip,sam9x7-pmc.h
 create mode 100644 include/dt-bindings/clock/microchip,sama7d65-pmc.h
 create mode 100644 include/dt-bindings/clock/microchip,sama7g5-pmc.h

diff --git a/include/dt-bindings/clock/microchip,sam9x60-pmc.h b/include/dt-bindings/clock/microchip,sam9x60-pmc.h
new file mode 100644
index 0000000000000..e01e867e8c4da
--- /dev/null
+++ b/include/dt-bindings/clock/microchip,sam9x60-pmc.h
@@ -0,0 +1,19 @@
+/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause */
+/*
+ * The constants defined in this header are being used in dts and in
+ * at91 sam9x60 clock driver.
+ */
+
+#ifndef _DT_BINDINGS_CLOCK_MICROCHIP_SAM9X60_PMC_H
+#define _DT_BINDINGS_CLOCK_MICROCHIP_SAM9X60_PMC_H
+
+#include <dt-bindings/clock/at91.h>
+
+/* old from before bindings splitup */
+#define SAM9X60_PMC_MCK		PMC_MCK		/* 1 */
+#define SAM9X60_PMC_UTMI	PMC_UTMI	/* 2 */
+#define SAM9X60_PMC_MAIN	PMC_MAIN	/* 3 */
+
+#define SAM9X60_PMC_PLLACK	PMC_PLLACK	/* 7 */
+
+#endif
diff --git a/include/dt-bindings/clock/microchip,sam9x7-pmc.h b/include/dt-bindings/clock/microchip,sam9x7-pmc.h
new file mode 100644
index 0000000000000..2df1ff97a5b18
--- /dev/null
+++ b/include/dt-bindings/clock/microchip,sam9x7-pmc.h
@@ -0,0 +1,25 @@
+/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause */
+/*
+ * The constants defined in this header are being used in dts and in
+ * at91 sam9x7 clock driver.
+ */
+
+#ifndef _DT_BINDINGS_CLOCK_MICROCHIP_SAM9X7_PMC_H
+#define _DT_BINDINGS_CLOCK_MICROCHIP_SAM9X7_PMC_H
+
+#include <dt-bindings/clock/at91.h>
+
+/* old from before bindings splitup */
+#define SAM9X7_PMC_MCK		PMC_MCK		/* 1 */
+#define SAM9X7_PMC_UTMI		PMC_UTMI	/* 2 */
+#define SAM9X7_PMC_MAIN		PMC_MAIN	/* 3 */
+
+#define SAM9X7_PMC_PLLACK	PMC_PLLACK	/* 7 */
+
+#define SAM9X7_PMC_AUDIOPMCPLL	PMC_AUDIOPMCPLL	/* 9 */
+#define SAM9X7_PMC_AUDIOIOPLL	PMC_AUDIOIOPLL	/* 10 */
+
+#define SAM9X7_PMC_PLLADIV2	PMC_PLLADIV2	/* 14 */
+#define SAM9X7_PMC_LVDSPLL	PMC_LVDSPLL	/* 15 */
+
+#endif
diff --git a/include/dt-bindings/clock/microchip,sama7d65-pmc.h b/include/dt-bindings/clock/microchip,sama7d65-pmc.h
new file mode 100644
index 0000000000000..f5be643be9b36
--- /dev/null
+++ b/include/dt-bindings/clock/microchip,sama7d65-pmc.h
@@ -0,0 +1,32 @@
+/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause */
+/*
+ * The constants defined in this header are being used in dts and in
+ * at91 sama7d65 clock driver.
+ */
+
+#ifndef _DT_BINDINGS_CLOCK_MICROCHIP_SAMA7D65_PMC_H
+#define _DT_BINDINGS_CLOCK_MICROCHIP_SAMA7D65_PMC_H
+
+#include <dt-bindings/clock/at91.h>
+
+/* old from before bindings splitup */
+#define SAMA7D65_PMC_MCK0		PMC_MCK		/* 1 */
+#define SAMA7D65_PMC_UTMI		PMC_UTMI	/* 2 */
+#define SAMA7D65_PMC_MAIN		PMC_MAIN	/* 3 */
+#define SAMA7D65_PMC_CPUPLL		PMC_CPUPLL	/* 4 */
+#define SAMA7D65_PMC_SYSPLL		PMC_SYSPLL	/* 5 */
+
+#define SAMA7D65_PMC_BAUDPLL		PMC_BAUDPLL	/* 8 */
+#define SAMA7D65_PMC_AUDIOPMCPLL	PMC_AUDIOPMCPLL	/* 9 */
+#define SAMA7D65_PMC_AUDIOIOPLL		PMC_AUDIOIOPLL	/* 10 */
+#define SAMA7D65_PMC_ETHPLL		PMC_ETHPLL	/* 11 */
+
+#define SAMA7D65_PMC_MCK1		PMC_MCK1	/* 13 */
+
+#define SAMA7D65_PMC_LVDSPLL		PMC_LVDSPLL	/* 15 */
+#define SAMA7D65_PMC_MCK3		PMC_MCK3	/* 16 */
+#define SAMA7D65_PMC_MCK5		PMC_MCK5	/* 17 */
+
+#define SAMA7D65_PMC_INDEX_MAX		25
+
+#endif
diff --git a/include/dt-bindings/clock/microchip,sama7g5-pmc.h b/include/dt-bindings/clock/microchip,sama7g5-pmc.h
new file mode 100644
index 0000000000000..ad69ccdf9dc78
--- /dev/null
+++ b/include/dt-bindings/clock/microchip,sama7g5-pmc.h
@@ -0,0 +1,24 @@
+/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause */
+/*
+ * The constants defined in this header are being used in dts and in
+ * at91 sama7g5 clock driver.
+ */
+
+#ifndef _DT_BINDINGS_CLOCK_MICROCHIP_SAMA7G5_PMC_H
+#define _DT_BINDINGS_CLOCK_MICROCHIP_SAMA7G5_PMC_H
+
+#include <dt-bindings/clock/at91.h>
+
+/* old from before bindings splitup */
+#define SAMA7G5_PMC_MCK0	PMC_MCK		/* 1 */
+#define SAMA7G5_PMC_UTMI	PMC_UTMI	/* 2 */
+#define SAMA7G5_PMC_MAIN	PMC_MAIN	/* 3 */
+#define SAMA7G5_PMC_CPUPLL	PMC_CPUPLL	/* 4 */
+#define SAMA7G5_PMC_SYSPLL	PMC_SYSPLL	/* 5 */
+
+#define SAMA7G5_PMC_AUDIOPMCPLL	PMC_AUDIOPMCPLL	/* 9 */
+#define SAMA7G5_PMC_AUDIOIOPLL	PMC_AUDIOIOPLL	/* 10 */
+
+#define SAMA7G5_PMC_MCK1	PMC_MCK1	/* 13 */
+
+#endif
-- 
2.39.5

