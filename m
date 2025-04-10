Received: from naesa06.arrow.com (naesa06.arrow.com [216.150.161.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E70D28CF60;
	Thu, 10 Apr 2025 15:26:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.150.161.27
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744298797; cv=none; b=OIV6GHe3fckZH9V7IG1Y8wXSyrCCktrqMG3UmcW1F9yJkcqA4CscwI3fnggo4XM5NazsAFOqy/nlKqoedAa44ccXR/2TubNjFgpcI7dNo6Gh/MYrWCXYrYlFMFYsMebI2d3swYO0u7B3aH9Fncgb9CK90I0lChG9EDVWx1Hx+ro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744298797; c=relaxed/simple;
	bh=uZOB3X0Rptqx7C6PbBhyK+HO+QC/b55sWURO5S5ASPc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=N/x6sxzdcKr6Lb1ZrxvO2kRmGN3uQ8wmNQ2IWWoDG5hbF+gR6dKXG903hEa4QLOLMVivyNgh6tsAMj6MnWrv49+BrB8+DtOr26BwCdlL+W4iGhRaY9NtsDFdOw5jZESdddhjiwOAzcA5SBuYf0PIsNXyBf+UO1LLlHERUgm/SLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=einfochips.com; spf=pass smtp.mailfrom=einfochips.com; dkim=pass (2048-bit key) header.d=einfochips.com header.i=@einfochips.com header.b=q4m3ZXnW; arc=none smtp.client-ip=216.150.161.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=einfochips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=einfochips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=einfochips.com header.i=@einfochips.com header.b="q4m3ZXnW"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=einfochips.com; i=@einfochips.com; l=2174; q=dns/txt;
  s=NAESA-Selector1; t=1744298795; x=1775834795;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=uZOB3X0Rptqx7C6PbBhyK+HO+QC/b55sWURO5S5ASPc=;
  b=q4m3ZXnWgV8MRcVaHyfUKDb/y7wfqv8FnsjS6J6NnRiyOKHPmIu8xa6K
   FPZRkdYeI8DEliMsO8zKHzwvKUVZKyjFOI7XklG5f5V3MgLXTma1vodlA
   HFSDW4n4hY+YOHL51WW0MfABsNPFnHPaBgq0jVXPM8eV4KuHpXxUtvUkM
   h+JFtS/ZRtqKz5KIqMJDaE8EaAU6reu+AsZozAUYsRBPThCYBu7E+lI/E
   B3amOuMii/cbkNtO+zWs4eKF7OPD24iAryqeVlCCqsg450PVkT4v906BB
   HQZxcnO76MLV8skdceyQeubAUqRX4MugXZKZqOUvnB2nuckb+6gKZwNqY
   w==;
X-CSE-ConnectionGUID: YYFZM9OWRU+7qCXd47zyMw==
X-CSE-MsgGUID: ++KS8ZuhRqyd6kO0AzLREg==
X-IronPort-AV: E=Sophos;i="6.15,202,1739862000"; 
   d="scan'208";a="22941697"
Received: from unknown (HELO eicahmirelay01.einfochips.com) ([10.100.49.50])
  by naesa06out.arrow.com with ESMTP; 10 Apr 2025 09:25:26 -0600
Received: from AHMCPU1888.ap.corp.arrow.com ([172.25.5.100]) by eicahmirelay01.einfochips.com with Microsoft SMTPSVC(10.0.14393.4169);
	 Thu, 10 Apr 2025 20:55:19 +0530
From: Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>
To: Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Min Lin <linmin@eswincomputing.com>,
	Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>,
	Pritesh Patel <pritesh.patel@einfochips.com>,
	Yangyu Chen <cyy@cyyself.name>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Yu Chien Peter Lin <peterlin@andestech.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Kanak Shilledar <kanakshilledar@gmail.com>,
	Darshan Prajapati <darshan.prajapati@einfochips.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Aradhya Bhatia <a-bhatia1@ti.com>,
	rafal@milecki.pl,
	Anup Patel <anup@brainfault.org>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 04/10] dt-bindings: riscv: Add SiFive HiFive Premier P550 board
Date: Thu, 10 Apr 2025 20:55:13 +0530
Message-Id: <20250410152519.1358964-5-pinkesh.vaghela@einfochips.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250410152519.1358964-1-pinkesh.vaghela@einfochips.com>
References: <20250410152519.1358964-1-pinkesh.vaghela@einfochips.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 10 Apr 2025 15:25:19.0838 (UTC) FILETIME=[C50677E0:01DBAA2C]

From: Pritesh Patel <pritesh.patel@einfochips.com>

Add DT binding documentation for the ESWIN EIC7700 SoC and
HiFive Premier P550 Board

Signed-off-by: Pritesh Patel <pritesh.patel@einfochips.com>
Reviewed-by: Samuel Holland <samuel.holland@sifive.com>
Signed-off-by: Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>
Reviewed-by: Matthias Brugger <matthias.bgg@kernel.org>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../devicetree/bindings/riscv/eswin.yaml      | 29 +++++++++++++++++++
 MAINTAINERS                                   |  7 +++++
 2 files changed, 36 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/riscv/eswin.yaml

diff --git a/Documentation/devicetree/bindings/riscv/eswin.yaml b/Documentation/devicetree/bindings/riscv/eswin.yaml
new file mode 100644
index 000000000000..c603c45eef22
--- /dev/null
+++ b/Documentation/devicetree/bindings/riscv/eswin.yaml
@@ -0,0 +1,29 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/riscv/eswin.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ESWIN SoC-based boards
+
+maintainers:
+  - Min Lin <linmin@eswincomputing.com>
+  - Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>
+  - Pritesh Patel <pritesh.patel@einfochips.com>
+
+description:
+  ESWIN SoC-based boards
+
+properties:
+  $nodename:
+    const: '/'
+  compatible:
+    oneOf:
+      - items:
+          - enum:
+              - sifive,hifive-premier-p550
+          - const: eswin,eic7700
+
+additionalProperties: true
+
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index bfcdf2bced61..f90c940f286c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8768,6 +8768,13 @@ L:	linux-can@vger.kernel.org
 S:	Maintained
 F:	drivers/net/can/usb/esd_usb.c
 
+ESWIN DEVICETREES
+M:	Min Lin <linmin@eswincomputing.com>
+M:	Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>
+M:	Pritesh Patel <pritesh.patel@einfochips.com>
+S:	Maintained
+F:	Documentation/devicetree/bindings/riscv/eswin.yaml
+
 ET131X NETWORK DRIVER
 M:	Mark Einon <mark.einon@gmail.com>
 S:	Odd Fixes
-- 
2.25.1

