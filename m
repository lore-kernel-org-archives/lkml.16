Received: from Atcsqr.andestech.com (60-248-80-70.hinet-ip.hinet.net [60.248.80.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1DFD2DBB25
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 08:16:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.248.80.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751616971; cv=none; b=JeAcYU9rGaeu0N3J2DTtiVOeyCXJD6ots7NkZHIEDsyZLz1bU6fW+vPIP0W+X7jk4XgADZMljJzlo2u/w1RtkP0Z4sKm5w16bWr81//fd1iqc3RCuaCw9plc/vIJ9diJXZvpQJO9uSO0ABGJ4iR1b8TqNG5gqbUF6lm9K7L5zvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751616971; c=relaxed/simple;
	bh=zylAOvDJUdBHWCYEsmH/F3qbW1VoaC4/zwHAJ5vXbps=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LapZifXQyJfqHdZsri7rN/6hcooc3mxSjJdb7je5x2GidGSdYqZFo5mkHheMzQ5QqcFQs+G13pJAHoEjoQc4ZhPeVd23r8emjy3wCk51Jbjk9f3f/3ZE70lBcMRUKRJDrt1fDKbqFKC0I0vH9G0hawxp0EK3iE28+f2Hde5PXaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=andestech.com; spf=pass smtp.mailfrom=andestech.com; arc=none smtp.client-ip=60.248.80.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=andestech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=andestech.com
Received: from mail.andestech.com (ATCPCS31.andestech.com [10.0.1.89])
	by Atcsqr.andestech.com with ESMTPS id 5648EwqC091878
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 4 Jul 2025 16:14:58 +0800 (+08)
	(envelope-from ben717@andestech.com)
Received: from swlinux02.andestech.com (10.0.15.183) by ATCPCS31.andestech.com
 (10.0.1.89) with Microsoft SMTP Server id 14.3.498.0; Fri, 4 Jul 2025
 16:14:57 +0800
From: Ben Zong-You Xie <ben717@andestech.com>
To:
CC: <arnd@arndb.de>, <paul.walmsley@sifive.com>, <palmer@dabbelt.com>,
        <aou@eecs.berkeley.edu>, <alex@ghiti.fr>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <tglx@linutronix.de>,
        <daniel.lezcano@linaro.org>, <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        <devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <soc@lists.linux.dev>,
        <tim609@andestech.com>, Ben Zong-You Xie <ben717@andestech.com>
Subject: [PATCH 2/8] dt-bindings: riscv: add Andes QiLai SoC and the Voyager board bindings
Date: Fri, 4 Jul 2025 16:14:45 +0800
Message-ID: <20250704081451.2011407-3-ben717@andestech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250704081451.2011407-1-ben717@andestech.com>
References: <20250704081451.2011407-1-ben717@andestech.com>
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
X-MAIL:Atcsqr.andestech.com 5648EwqC091878

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
index 6135a36a54a8..f4b4261d3c44 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -21285,6 +21285,11 @@ F:	drivers/irqchip/irq-riscv-intc.c
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

