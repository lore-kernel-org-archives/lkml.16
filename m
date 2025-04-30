Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B031B2641E4;
	Wed, 30 Apr 2025 12:49:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746017368; cv=none; b=a3UoH2FQhjzxpiFO3xV8PdOwvJSXiixTjXUzaQqtVQIqt2+VY7Y9gD0Cok38JAO7Xb2hoALEhWhIfRI2zgpMp0JDo48S/x0fUN5agKruGaxZUBe/rBnnzu4hUCLDVBKcBRHdJlXAkYWE//4XQgLGWmxEUezv2aDMLt19IlyxHmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746017368; c=relaxed/simple;
	bh=lhY3UhDu5nx+O1Fi44z/mcLChAzZrf0RUHIYCmu8iL8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pY2CTjjJWPPfNL9u6jRmWWzR25LlIbWCW6d521lUzAG0UJmC+pvae4/Wmewbl2pZ/QEqi/uwdV7dKNHFk7RvDxTrBZT4/YjisuNafqHrfS6WbLZtf5nKxbb8l0ljvMEjKw/N5jbOTZhjlAAuV+PeayZgF7tHdv0I6aMHAuRoCZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Ebwegr2r; arc=none smtp.client-ip=217.70.183.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Ebwegr2r"
Received: by mail.gandi.net (Postfix) with ESMTPA id 92F1A43A27;
	Wed, 30 Apr 2025 12:49:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1746017364;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=H/OUpl+c2QHHtmrmXPqlciNY816qMvdz6fKciUiS4VQ=;
	b=Ebwegr2rIAxBxL8bhqE5Pba9Oj2gUFEWboHFOgeUMV00aAtSmU/5yM0rsb/XgKfRv+lOkf
	s8EbNI4+/jEoC18NFn21QM+5hAUjZJ24pIcIEOjncTCmWeu7mt1oTSS6mHg6q+e8ittex3
	5zFAThF+WhaZDSUVoxm01BxdvI8HVo/NlLbwTne2/1gFF6Y9z6vDOoh3evuh40bzwz85QE
	qJFi8KNbJXoaykxJcf4C2MpffEZT++8NY3+CqGVt7ct6tToIx47/f1z1I5+v21CyfhfW0O
	d8H+TKzCFJWqKqAoV9rOIYk/GQOAI5p3Qe9UXT3+eDRiu/6O5ak4Eny7Pm0NyQ==
From: Herve Codina <herve.codina@bootlin.com>
To: David Gibson <david@gibson.dropbear.id.au>,
	Andrew Davis <afd@ti.com>,
	Ayush Singh <ayush@beagleboard.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Herve Codina <herve.codina@bootlin.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Saravana Kannan <saravanak@google.com>
Cc: devicetree@vger.kernel.org,
	devicetree-compiler@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: [PATCH 7/7] of: unittest: Add tests for export symbols
Date: Wed, 30 Apr 2025 14:49:06 +0200
Message-ID: <20250430124910.195368-8-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250430124910.195368-1-herve.codina@bootlin.com>
References: <20250430124910.195368-1-herve.codina@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvieeijeegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefjvghrvhgvucevohguihhnrgcuoehhvghrvhgvrdgtohguihhnrgessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepheffiefgjeeuleeuueffleeufefglefhjefhheeigedukeetieeltddthfffkeffnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopehlohgtrghlhhhoshhtrdhlohgtrghlughomhgrihhnpdhmrghilhhfrhhomhephhgvrhhvvgdrtghoughinhgrsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeduiedprhgtphhtthhopegurghvihgusehgihgsshhonhdrughrohhpsggvrghrrdhiugdrrghupdhrtghpthhtoheprghfugesthhirdgtohhmpdhrtghpthhtoheprgihuhhshhessggvrghglhgvsghorghrugdrohhrghdprhgtphhtthhopehgvggvrhhtsehlihhnuhigqdhmieekkhdrohhrghdprhgtphhtthhopehrohgshheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepk
 hhriihkodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheptghonhhorhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehhvghrvhgvrdgtohguihhnrgessghoohhtlhhinhdrtghomh
X-GND-Sasl: herve.codina@bootlin.com

The export symbols feature allows to use some additional symbols
provided in an export symbols node to resolve overlay symbols.

Add tests to exercise the export symbols feature.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
Tested-by: Ayush Singh <ayush@beagleboard.org>
---
 drivers/of/unittest-data/Makefile             |  5 ++
 .../unittest-data/overlay_export_symbols.dtso | 15 +++++
 .../of/unittest-data/testcases_common.dtsi    |  1 +
 .../unittest-data/tests-export-symbols.dtsi   | 30 +++++++++
 drivers/of/unittest.c                         | 65 +++++++++++++++++++
 5 files changed, 116 insertions(+)
 create mode 100644 drivers/of/unittest-data/overlay_export_symbols.dtso
 create mode 100644 drivers/of/unittest-data/tests-export-symbols.dtsi

diff --git a/drivers/of/unittest-data/Makefile b/drivers/of/unittest-data/Makefile
index 01a966e39f23..b51be046749a 100644
--- a/drivers/of/unittest-data/Makefile
+++ b/drivers/of/unittest-data/Makefile
@@ -34,6 +34,7 @@ obj-$(CONFIG_OF_OVERLAY) += overlay.dtbo.o \
 			    overlay_gpio_04a.dtbo.o \
 			    overlay_gpio_04b.dtbo.o \
 			    overlay_pci_node.dtbo.o \
+			    overlay_export_symbols.dtbo.o \
 			    overlay_bad_unresolved.dtbo.o
 
 # enable creation of __symbols__ node
@@ -66,6 +67,10 @@ DTC_FLAGS_testcases += -Wno-interrupts_property \
 #			  overlay_bad_add_dup_prop.dtbo \
 #			  overlay_bad_phandle.dtbo \
 #			  overlay_bad_symbol.dtbo \
+#
+# Also overlay_export_symbols_ovl.dtbo is designed to be applied to a specific
+# node and cannot be applied statically with fdtoverlay
+
 
 apply_static_overlay_1 := overlay_0.dtbo \
 			  overlay_1.dtbo \
diff --git a/drivers/of/unittest-data/overlay_export_symbols.dtso b/drivers/of/unittest-data/overlay_export_symbols.dtso
new file mode 100644
index 000000000000..89c9df4ef89b
--- /dev/null
+++ b/drivers/of/unittest-data/overlay_export_symbols.dtso
@@ -0,0 +1,15 @@
+// SPDX-License-Identifier: GPL-2.0
+/dts-v1/;
+/plugin/;
+
+/ {
+	fragment@0 {
+		target-path="";
+		__overlay__ {
+			ovl_node {
+				ref-base = <&test_export_base>;
+				ref-node = <&test_export_node>;
+			};
+		};
+	};
+};
diff --git a/drivers/of/unittest-data/testcases_common.dtsi b/drivers/of/unittest-data/testcases_common.dtsi
index 1c2cdf353ae3..21ffe0fb03ef 100644
--- a/drivers/of/unittest-data/testcases_common.dtsi
+++ b/drivers/of/unittest-data/testcases_common.dtsi
@@ -18,4 +18,5 @@ node-remove {
 #include "tests-address.dtsi"
 #include "tests-platform.dtsi"
 #include "tests-overlay.dtsi"
+#include "tests-export-symbols.dtsi"
 #include "tests-lifecycle.dtsi"
diff --git a/drivers/of/unittest-data/tests-export-symbols.dtsi b/drivers/of/unittest-data/tests-export-symbols.dtsi
new file mode 100644
index 000000000000..1650289b34cd
--- /dev/null
+++ b/drivers/of/unittest-data/tests-export-symbols.dtsi
@@ -0,0 +1,30 @@
+// SPDX-License-Identifier: GPL-2.0
+
+/ {
+	testcase-data {
+		test-export-symbols {
+			test_export_symbols_b0: base0 {
+				test_export_symbols_n0: node {
+					dummy;
+				};
+
+				export-symbols {
+					test_export_base = <&test_export_symbols_b0>;
+					test_export_node = <&test_export_symbols_n0>;
+				};
+			};
+
+			test_export_symbols_b1: base1 {
+
+				test_export_symbols_n1: node {
+					dummy;
+				};
+
+				export-symbols {
+					test_export_base = <&test_export_symbols_b1>;
+					test_export_node = <&test_export_symbols_n1>;
+				};
+			};
+		};
+	};
+};
diff --git a/drivers/of/unittest.c b/drivers/of/unittest.c
index 11091b0176e0..bf286902c65b 100644
--- a/drivers/of/unittest.c
+++ b/drivers/of/unittest.c
@@ -4164,6 +4164,69 @@ static __init void of_unittest_overlay_high_level(void)
 	mutex_unlock(&of_mutex);
 }
 
+OVERLAY_INFO_EXTERN(overlay_export_symbols);
+
+static __init void of_unittest_export_symbols(const char *prefix,
+					      const char *base_full_path)
+{
+	const struct overlay_info ovl = OVERLAY_INFO(overlay_export_symbols, 0, 0);
+	struct device_node *ovl_node;
+	struct device_node *base;
+	struct device_node *node;
+	struct device_node *ref;
+	int ovcs_id;
+	u32 size;
+	int ret;
+
+	base = of_find_node_by_path(base_full_path);
+	if (unittest(base, "%s: Get base (%s) failed\n", prefix, base_full_path))
+		return;
+
+	node = of_get_child_by_name(base, "node");
+	if (unittest(base, "%s: Get node from %pOF failed\n", prefix, base))
+		goto end_put_base;
+
+	size = ovl.dtbo_end - ovl.dtbo_begin;
+	ret = of_overlay_fdt_apply(ovl.dtbo_begin, size, &ovcs_id, base, "export-symbols");
+	if (unittest(!ret, "%s: Apply '%s' failed (%d)\n", prefix, ovl.name, ret))
+		goto end_put_node;
+
+	ovl_node = of_get_child_by_name(base, "ovl_node");
+	if (unittest(ovl_node, "%s: Get ovl_node from %pOF failed\n", prefix, base))
+		goto end_remove_overlay;
+
+	ref = of_parse_phandle(ovl_node, "ref-base", 0);
+	if (unittest(ref, "%s: Parse 'ref-base' from %pOF failed\n", prefix, ovl_node))
+		goto end_put_ovl_node;
+	unittest(ref == base,
+		 "%s: Node from 'ref-base' phandle mismatches (got %pOF, expected %pOF)\n",
+		 prefix, ref, base);
+	of_node_put(ref);
+
+	ref = of_parse_phandle(ovl_node, "ref-node", 0);
+	if (unittest(ref, "%s: Parse 'ref-node' from %pOF failed\n", prefix, ovl_node))
+		goto end_put_ovl_node;
+	unittest(ref == node,
+		 "%s: Node from 'ref-node' phandle mismatches (got %pOF, expected %pOF)\n",
+		 prefix, ref, node);
+	of_node_put(ref);
+
+end_put_ovl_node:
+	of_node_put(ovl_node);
+end_remove_overlay:
+	of_overlay_remove(&ovcs_id);
+end_put_node:
+	of_node_put(node);
+end_put_base:
+	of_node_put(base);
+}
+
+static __init void of_unittest_overlay_export_symbols(void)
+{
+	of_unittest_export_symbols("base0", "/testcase-data/test-export-symbols/base0");
+	of_unittest_export_symbols("base1", "/testcase-data/test-export-symbols/base1");
+}
+
 static int of_unittest_pci_dev_num;
 static int of_unittest_pci_child_num;
 
@@ -4349,6 +4412,7 @@ static void __init of_unittest_pci_node(void)
 #else
 
 static inline __init void of_unittest_overlay_high_level(void) {}
+static inline __init void of_unittest_overlay_export_symbols(void) {}
 static inline __init void of_unittest_pci_node(void) { }
 
 #endif
@@ -4404,6 +4468,7 @@ static int __init of_unittest(void)
 	of_unittest_overlay();
 	of_unittest_lifecycle();
 	of_unittest_pci_node();
+	of_unittest_overlay_export_symbols();
 
 	/* Double check linkage after removing testcase data */
 	of_unittest_check_tree_linkage();
-- 
2.49.0

