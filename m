Received: from mail.thorsis.com (mail.thorsis.com [217.92.40.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C208925290A;
	Mon, 10 Feb 2025 16:45:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.92.40.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739205931; cv=none; b=rMjGcRp6y3HbSLDb18sP/+HRH2N7vOlcKCx8VOBl3gkxyuZPlcmEB13Ukjr3+bigblxc4Ba4FvoK/gpStakB470MIbuc0SPIEZPV5djkAWMr22za3A0DxvGMXeW79Rm5UqmQ13UAzkV9B8wpGBWOD4QUkfUdlvLs7HCqwynDTRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739205931; c=relaxed/simple;
	bh=LjrwlwZ+3R1B7xD0oalyvet03mKMfgLP08Mc6sltId8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=R0/RBwEItLsF5jwyC4bAD4mSiIZ3nPjws1IKD224naEJLy4/QOrIWBZlf3l4rfxiRAPzjZBXNyr5k5RC7NRpj+DxjiBm8vgV3Gj209tax5rORHW0TlmbF5pFH0HbY3HPLY+QO5/e1NKT3KcTockERicVKDJE6QFn9zJX97+obXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=thorsis.com; spf=pass smtp.mailfrom=thorsis.com; dkim=pass (2048-bit key) header.d=thorsis.com header.i=@thorsis.com header.b=bNcPmcyc; arc=none smtp.client-ip=217.92.40.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=thorsis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thorsis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thorsis.com header.i=@thorsis.com header.b="bNcPmcyc"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 36879148026A;
	Mon, 10 Feb 2025 17:45:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=thorsis.com; s=dkim;
	t=1739205927;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0WHUhKfS+ZaE2np/nTIVSoQCKqx2vGtVJRjfiTaKlFI=;
	b=bNcPmcycV16BVxYBZn4F/R/IPE5AjKPvr1AaFSMK12kIuoE0BNKJ8Cf23OP4hppFsuIOqR
	3lIVX8EhZlpJfRggCvq0YttBKutSbqIhi5PNgMPwI3QrBk0nmS2XWfd7ValonGF7hISV3A
	wfAMZ1Hv5YVzrXpeAO0LTP98ALZZfIEg6FuyJlle2Y0UuqGe2URVFn1cdALz2K2RVZLGhT
	srEOTJkp8b/B8azWu0R1fnlFHsc/h/NYk2qpMU9C+1WQK0UpnZl3IXTDf0BEEKwyqj0GMV
	bKCIAuER9uvBpFVNfOvka4YmEXpJxSn49oJ1SbQSBBKWEIa5FXUPqsSH5YJsWw==
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
Subject: [PATCH v2 04/16] dt-bindings: clock: at91: Allow referencing main rc oscillator in DT
Date: Mon, 10 Feb 2025 17:44:54 +0100
Message-Id: <20250210164506.495747-5-ada@thorsis.com>
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

The main rc oscillator will be needed for the OTPC to work properly.

The new index introduced here was not used on the four affected SoC
clock drivers before, but for sama5d2 only (PMC_I2S1_MUX).

Link: https://lore.kernel.org/linux-devicetree/20250207-jailbird-circus-bcc04ee90e05@thorsis.com/T/#u
Signed-off-by: Alexander Dahl <ada@thorsis.com>
---

Notes:
    v2:
    - new patch, not present in v1

 include/dt-bindings/clock/microchip,sam9x60-pmc.h  | 3 +++
 include/dt-bindings/clock/microchip,sam9x7-pmc.h   | 3 +++
 include/dt-bindings/clock/microchip,sama7d65-pmc.h | 3 +++
 include/dt-bindings/clock/microchip,sama7g5-pmc.h  | 3 +++
 4 files changed, 12 insertions(+)

diff --git a/include/dt-bindings/clock/microchip,sam9x60-pmc.h b/include/dt-bindings/clock/microchip,sam9x60-pmc.h
index e01e867e8c4da..dcd3c74f75b54 100644
--- a/include/dt-bindings/clock/microchip,sam9x60-pmc.h
+++ b/include/dt-bindings/clock/microchip,sam9x60-pmc.h
@@ -16,4 +16,7 @@
 
 #define SAM9X60_PMC_PLLACK	PMC_PLLACK	/* 7 */
 
+/* new from after bindings splitup */
+#define SAM9X60_PMC_MAIN_RC	6
+
 #endif
diff --git a/include/dt-bindings/clock/microchip,sam9x7-pmc.h b/include/dt-bindings/clock/microchip,sam9x7-pmc.h
index 2df1ff97a5b18..6f17d6553b33c 100644
--- a/include/dt-bindings/clock/microchip,sam9x7-pmc.h
+++ b/include/dt-bindings/clock/microchip,sam9x7-pmc.h
@@ -22,4 +22,7 @@
 #define SAM9X7_PMC_PLLADIV2	PMC_PLLADIV2	/* 14 */
 #define SAM9X7_PMC_LVDSPLL	PMC_LVDSPLL	/* 15 */
 
+/* new from after bindings splitup */
+#define SAM9X7_PMC_MAIN_RC	6
+
 #endif
diff --git a/include/dt-bindings/clock/microchip,sama7d65-pmc.h b/include/dt-bindings/clock/microchip,sama7d65-pmc.h
index f5be643be9b36..5c8e52299c110 100644
--- a/include/dt-bindings/clock/microchip,sama7d65-pmc.h
+++ b/include/dt-bindings/clock/microchip,sama7d65-pmc.h
@@ -29,4 +29,7 @@
 
 #define SAMA7D65_PMC_INDEX_MAX		25
 
+/* new from after bindings splitup */
+#define SAMA7D65_PMC_MAIN_RC		6
+
 #endif
diff --git a/include/dt-bindings/clock/microchip,sama7g5-pmc.h b/include/dt-bindings/clock/microchip,sama7g5-pmc.h
index ad69ccdf9dc78..7bcd2634da37e 100644
--- a/include/dt-bindings/clock/microchip,sama7g5-pmc.h
+++ b/include/dt-bindings/clock/microchip,sama7g5-pmc.h
@@ -21,4 +21,7 @@
 
 #define SAMA7G5_PMC_MCK1	PMC_MCK1	/* 13 */
 
+/* new from after bindings splitup */
+#define SAMA7G5_PMC_MAIN_RC	6
+
 #endif
-- 
2.39.5

