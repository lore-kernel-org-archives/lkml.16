Received: from mta-64-225.siemens.flowmailer.net (mta-64-225.siemens.flowmailer.net [185.136.64.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCDEC25B1CE
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 11:35:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.136.64.225
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751369712; cv=none; b=VV3lDrsYk5qT3dbTQo9jmxLfj3zxh7jTSp2VqGkiBO43tusIt0YdL3+kcBTkdorxonTIADCQ12h+BOu54fGdHK0kvj0Pws2rshlz0vN1h4MNXQQWIE/tBwcEuiQ3Gj4Tk9HkUyRmVLN/EineiHOolzy9PxlS67yglsb9QoRADXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751369712; c=relaxed/simple;
	bh=toy7KDrxRKaBrKEHAnZbNH7DtmKUMTVQeK+rdhzUSuo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OeKR4WI5xbezrjJO27dz2N6eoVmPjJhG2rOmpE+3p+8siewqx28W9mUfa1ZF0YvmVSIuZZVRtGUCrQmAW9JiC+M7tolh9AUh6lsY381CCAO70nef+Wr+v0eK5D5MMQ4Pio9rMq8TqylAQNulcBCv7aG4vSvS2CaTuP1lcqzVZDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com; spf=pass smtp.mailfrom=rts-flowmailer.siemens.com; dkim=pass (2048-bit key) header.d=siemens.com header.i=alexander.sverdlin@siemens.com header.b=NlTMdQLJ; arc=none smtp.client-ip=185.136.64.225
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rts-flowmailer.siemens.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=siemens.com header.i=alexander.sverdlin@siemens.com header.b="NlTMdQLJ"
Received: by mta-64-225.siemens.flowmailer.net with ESMTPSA id 20250701105441ebbc6e3793791ffcb9
        for <linux-kernel@vger.kernel.org>;
        Tue, 01 Jul 2025 12:54:41 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=alexander.sverdlin@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=pKdITuxJaA8EUNftYYb9o+8QYm/n/GOV6BYJNqWHBdI=;
 b=NlTMdQLJsQKRO+x5KTq2hOtxXWNHIw353VOH8ecekqR3fqCkYXcy1GzkN9+2Xg9zIpPkNS
 sIRAboDhQrWMSj8jSueadSK4W+XMLHWoccNhJf+HoWpcXJjQQOnEB5m2EceC8fcDC62X3BtH
 kvzdFOmQUmHRD/2kVxsxPE6dhP3BdwfiGnGcGG976L4ED6bZJHdwd7D4KzCw1cYZz5AKsuR/
 Bo7Y2cGuwVUKQVGThkbxmxByWBd1p+EZr0DYDF6AajBbXL6eq8keZCa1AbFRUKdDyHKK6/dx
 RI578UZhJNo0TpgPfkvGI0xYWezdfGKm1q2MS8tWtcizhHKizrbVHTzw==;
From: "A. Sverdlin" <alexander.sverdlin@siemens.com>
To: devicetree@vger.kernel.org
Cc: Alexander Sverdlin <alexander.sverdlin@siemens.com>,
	Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: ti: k3-pinctrl: Enable Schmitt Trigger by default
Date: Tue,  1 Jul 2025 12:54:35 +0200
Message-ID: <20250701105437.3539924-1-alexander.sverdlin@siemens.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-456497:519-21489:flowmailer

From: Alexander Sverdlin <alexander.sverdlin@siemens.com>

Switch Schmitt Trigger functions for PIN_INPUT* macros by default. This is
HW PoR configuration, the slew rate requirements without ST enabled are
pretty tough for these devices. We've noticed spurious GPIO interrupts even
with noise-free edges but not meeting slew rate requirements (3.3E+6 V/s
for 3.3v LVCMOS).

It's not obvious why one might want to disable the PoR-enabled ST on any
pin. Just enable it by default. As it's not possible to provide OR-able
macros to disable the ST, shall anyone require it, provide a set of
new macros with _NOST suffix.

Signed-off-by: Alexander Sverdlin <alexander.sverdlin@siemens.com>
---
This patch could be considered a v2 of [1] but the subject has been changed.

[1] Link: https://lore.kernel.org/all/20250627131332.2806026-1-alexander.sverdlin@siemens.com/

 arch/arm64/boot/dts/ti/k3-pinctrl.h | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-pinctrl.h b/arch/arm64/boot/dts/ti/k3-pinctrl.h
index cac7cccc11121..38590188dd51c 100644
--- a/arch/arm64/boot/dts/ti/k3-pinctrl.h
+++ b/arch/arm64/boot/dts/ti/k3-pinctrl.h
@@ -8,6 +8,7 @@
 #ifndef DTS_ARM64_TI_K3_PINCTRL_H
 #define DTS_ARM64_TI_K3_PINCTRL_H
 
+#define ST_EN_SHIFT		(14)
 #define PULLUDEN_SHIFT		(16)
 #define PULLTYPESEL_SHIFT	(17)
 #define RXACTIVE_SHIFT		(18)
@@ -19,6 +20,10 @@
 #define DS_PULLUD_EN_SHIFT	(27)
 #define DS_PULLTYPE_SEL_SHIFT	(28)
 
+/* Schmitt trigger configuration */
+#define ST_DISABLE		(0 << ST_EN_SHIFT)
+#define ST_ENABLE		(1 << ST_EN_SHIFT)
+
 #define PULL_DISABLE		(1 << PULLUDEN_SHIFT)
 #define PULL_ENABLE		(0 << PULLUDEN_SHIFT)
 
@@ -32,9 +37,13 @@
 #define PIN_OUTPUT		(INPUT_DISABLE | PULL_DISABLE)
 #define PIN_OUTPUT_PULLUP	(INPUT_DISABLE | PULL_UP)
 #define PIN_OUTPUT_PULLDOWN	(INPUT_DISABLE | PULL_DOWN)
-#define PIN_INPUT		(INPUT_EN | PULL_DISABLE)
-#define PIN_INPUT_PULLUP	(INPUT_EN | PULL_UP)
-#define PIN_INPUT_PULLDOWN	(INPUT_EN | PULL_DOWN)
+#define PIN_INPUT		(INPUT_EN | ST_ENABLE | PULL_DISABLE)
+#define PIN_INPUT_PULLUP	(INPUT_EN | ST_ENABLE | PULL_UP)
+#define PIN_INPUT_PULLDOWN	(INPUT_EN | ST_ENABLE | PULL_DOWN)
+/* Input configurations with Schmitt Trigger disabled */
+#define PIN_INPUT_NOST		(INPUT_EN | PULL_DISABLE)
+#define PIN_INPUT_PULLUP_NOST	(INPUT_EN | PULL_UP)
+#define PIN_INPUT_PULLDOWN_NOST	(INPUT_EN | PULL_DOWN)
 
 #define PIN_DEBOUNCE_DISABLE	(0 << DEBOUNCE_SHIFT)
 #define PIN_DEBOUNCE_CONF1	(1 << DEBOUNCE_SHIFT)
-- 
2.50.0

