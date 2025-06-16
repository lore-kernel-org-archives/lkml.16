Received: from naesa03.arrow.com (naesa03.arrow.com [216.150.161.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DC512EA46D;
	Mon, 16 Jun 2025 11:24:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.150.161.23
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750073073; cv=none; b=RNIn+u/JSPyCvWk1WG4oVHEtZ5GB0u8QRrzT5VE10nogJHDOyh2j+4hh4j0OfDNIJjUXPfCfr6J6mVr4ds0Via58RUWX02sh1xoygk4DG+rrRvl7Q1lqXQI9xZTm5g2SH+ARB7UF4W+wStoy4aVXXlUBCv4MbDzAMwxoZZsxG5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750073073; c=relaxed/simple;
	bh=EJJhfSahaZIB8Ca/itivoDt+i23MPeJ1MfoSOfBJ2lc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=rf0XZQmapHA4N/JzjiiayLk16zpffE5Qr6g319zVD3zViY64E1ZhVqupHWQwk2G49NHiKVgJbX4tNLO9OLPY55GmGwWxN4Znv7xN4E22d3+bhtsK1BAYPgGDODJpKkbianEzQ2iowZiXpjJTrAxs7dqxuZayOw45LhcX2uUXrVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=einfochips.com; spf=pass smtp.mailfrom=einfochips.com; dkim=pass (2048-bit key) header.d=einfochips.com header.i=@einfochips.com header.b=cz9fipz+; arc=none smtp.client-ip=216.150.161.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=einfochips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=einfochips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=einfochips.com header.i=@einfochips.com header.b="cz9fipz+"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=einfochips.com; i=@einfochips.com; l=2221; q=dns/txt;
  s=NAESA-Selector1; t=1750073071; x=1781609071;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=EJJhfSahaZIB8Ca/itivoDt+i23MPeJ1MfoSOfBJ2lc=;
  b=cz9fipz+rNLEkFQZDUfA9tSs+ozqiOVBl/tkIR5o3LXwHaFoGgUUuIJf
   bxlkO8Ka4geH73lzTdmPSHYRIWvRHfYH0ns+6zMoNAuinV6w8Bolqlu7f
   8ZGtmf8kJ902iHjZvPMk+zsYoj08t95JTUVffDE7eT9YxoDjeeJOB1PlA
   lBMdH0o+olUpUcUWUuiHElD4tByZeWevxSmxAv6snjJOj2h9wnkBhgjTe
   JoVeFsZl7m9cLIGft0bslI96Wcd2evIlERmWaHzoQRQ7Ph9uW5pcvUF7G
   0BILz5+2rUukqZEcu6tYzERiQN2WMCUTWPb+ovw4UIXm7BC/QZK6XQ3tV
   g==;
X-CSE-ConnectionGUID: fB+oYebPTW2Wo1hDzPw5Tw==
X-CSE-MsgGUID: dl/jDeMFRwKd9RN0HcFDvQ==
X-IronPort-AV: E=Sophos;i="6.16,241,1744092000"; 
   d="scan'208";a="86117899"
Received: from unknown (HELO eicahmirelay01.einfochips.com) ([10.100.49.50])
  by naesa03out.arrow.com with ESMTP; 16 Jun 2025 05:23:23 -0600
Received: from AHMCPU1888.ap.corp.arrow.com ([172.25.5.100]) by eicahmirelay01.einfochips.com with Microsoft SMTPSVC(10.0.14393.4169);
	 Mon, 16 Jun 2025 16:53:16 +0530
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
Subject: [PATCH v4 4/7] dt-bindings: riscv: Add SiFive HiFive Premier P550 board
Date: Mon, 16 Jun 2025 16:53:13 +0530
Message-Id: <20250616112316.3833343-5-pinkesh.vaghela@einfochips.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250616112316.3833343-1-pinkesh.vaghela@einfochips.com>
References: <20250616112316.3833343-1-pinkesh.vaghela@einfochips.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 16 Jun 2025 11:23:16.0624 (UTC) FILETIME=[0E312100:01DBDEB1]

From: Pritesh Patel <pritesh.patel@einfochips.com>

Add DT binding documentation for the ESWIN EIC7700 SoC and
HiFive Premier P550 Board

Signed-off-by: Pritesh Patel <pritesh.patel@einfochips.com>
Reviewed-by: Samuel Holland <samuel.holland@sifive.com>
Signed-off-by: Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>
Reviewed-by: Matthias Brugger <matthias.bgg@kernel.org>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Acked-by: Min Lin <linmin@eswincomputing.com>
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
index a92290fffa16..8fadb4bae91f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8914,6 +8914,13 @@ L:	linux-can@vger.kernel.org
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

