Received: from Atcsqr.andestech.com (60-248-80-70.hinet-ip.hinet.net [60.248.80.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A59C15CD74
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 06:08:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.248.80.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748844488; cv=none; b=oVlcHsqFauR7PZd0lJX2KMhizj/W/QDanmFVSsqGD7jenoxLMDjtcvCht6ZuoSiMVDcRuDurJka+7zakray3ris4VqS77cvj5/DMM4Eb+tuxXJfSAP6g2JThnlBCoWkHT0HdJSePlG5OdRAQsARJ22XSFLcJIGpV/jXIVhDE+s0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748844488; c=relaxed/simple;
	bh=ZpDOMEl/yPfbwLjHMkQtQ2arHfZLniFr5WzrncQ13o8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kXmdAKcJPqjdbuKDDLSLP5KoZ0Qbr0buYB7+L+KP+MYVVnoG5ejHH3cWh2Km/sa+Cirb8q0RWr1vR/aQm5pjd88ADpBCEUFtndsKs4SYh3eF8wEsbdhGk+NC2FyuuM8jmByCrU4Sit6deOs52zpUDe8uTGH37a6s7GE76VAB6hg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=andestech.com; spf=pass smtp.mailfrom=andestech.com; arc=none smtp.client-ip=60.248.80.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=andestech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=andestech.com
Received: from mail.andestech.com (ATCPCS31.andestech.com [10.0.1.89])
	by Atcsqr.andestech.com with ESMTPS id 55267tWC096149
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 2 Jun 2025 14:07:55 +0800 (+08)
	(envelope-from ben717@andestech.com)
Received: from swlinux02.andestech.com (10.0.15.183) by ATCPCS31.andestech.com
 (10.0.1.89) with Microsoft SMTP Server id 14.3.498.0; Mon, 2 Jun 2025
 14:07:55 +0800
From: Ben Zong-You Xie <ben717@andestech.com>
To:
CC: <paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
        <alex@ghiti.fr>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <tglx@linutronix.de>,
        <daniel.lezcano@linaro.org>, <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        <devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <tim609@andestech.com>,
        Ben Zong-You Xie <ben717@andestech.com>
Subject: [PATCH v5 2/8] dt-bindings: riscv: add Andes QiLai SoC and the Voyager board bindings
Date: Mon, 2 Jun 2025 14:07:41 +0800
Message-ID: <20250602060747.689824-3-ben717@andestech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250602060747.689824-1-ben717@andestech.com>
References: <20250602060747.689824-1-ben717@andestech.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-DKIM-Results: atcpcs31.andestech.com; dkim=none;
X-DNSRBL: 
X-SPAM-SOURCE-CHECK: pass
X-MAIL:Atcsqr.andestech.com 55267tWC096149

Add DT binding documentation for the Andes QiLai SoC and the
Voyager development board.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Ben Zong-You Xie <ben717@andestech.com>
---
 .../devicetree/bindings/riscv/andes.yaml      | 25 +++++++++++++++++++
 MAINTAINERS                                   |  5 ++++
 2 files changed, 30 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/riscv/andes.yaml

diff --git a/Documentation/devicetree/bindings/riscv/andes.yaml b/Documentation/devicetree/bindings/riscv/andes.yaml
new file mode 100644
index 000000000000..aa1edf1fdec7
--- /dev/null
+++ b/Documentation/devicetree/bindings/riscv/andes.yaml
@@ -0,0 +1,25 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/riscv/andes.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Andes SoC-based boards
+
+maintainers:
+  - Ben Zong-You Xie <ben717@andestech.com>
+
+description:
+  Andes SoC-based boards
+
+properties:
+  $nodename:
+    const: '/'
+  compatible:
+    oneOf:
+      - items:
+          - enum:
+              - andestech,voyager
+          - const: andestech,qilai
+
+additionalProperties: true
diff --git a/MAINTAINERS b/MAINTAINERS
index e45559690b28..3777a6e83a6b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -20947,6 +20947,11 @@ F:	drivers/irqchip/irq-riscv-intc.c
 F:	include/linux/irqchip/riscv-aplic.h
 F:	include/linux/irqchip/riscv-imsic.h
 
+RISC-V ANDES SoC Support
+M:	Ben Zong-You Xie <ben717@andestech.com>
+S:	Maintained
+F:	Documentation/devicetree/bindings/riscv/andes.yaml
+
 RISC-V ARCHITECTURE
 M:	Paul Walmsley <paul.walmsley@sifive.com>
 M:	Palmer Dabbelt <palmer@dabbelt.com>
-- 
2.34.1

