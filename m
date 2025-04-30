Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 507AC25C708;
	Wed, 30 Apr 2025 12:52:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746017533; cv=none; b=k6oAR2QQUierMfrGryo1Khxjw5jW5hqbeL+1W+dLmnr52H4DnSUbd6nNn0XY4oxcvpW/KhMI6W80xvBYSMoKXgaxGY9ZbUcRAS0Hq4UCQ36KZdXZh/wdeidfDNrEgU1Ga5XQ7mNu/JTtf4sFk5gMnrTYOK7XOW5dwrqEMeIZECo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746017533; c=relaxed/simple;
	bh=MLKFKlOcqD3JrCWLLX9Qo1rkuxqN8kw5WpQ7AXVTpbc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=m5AxiNRe0jZP54wIkDENRkji73iDgCeG5AVi2ttz6Q6ZjFKYzjQulF1L42u2AsNQ7obm5EGnk7mjYUDqVvvwjOlOCKCsE29rwegif0czpAm0BMbTyhQ3aL7dDzXlfD9ANTd1Hy2QGBCzvVWTc1YxYi4KoWL4epZL6MYb1C6p3xE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=pMc4nRAz; arc=none smtp.client-ip=217.70.183.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="pMc4nRAz"
Received: by mail.gandi.net (Postfix) with ESMTPA id D2A61438B0;
	Wed, 30 Apr 2025 12:52:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1746017529;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iuXqI1mGwNYFzjUQZRY2v46st1QeOvBPHRc4DlxvEp4=;
	b=pMc4nRAzepJbhk2GQKrbP/vE4gAQMmmdeHbbMW9ZtELHNwv+UjFEu/uyBWGtf9ITdf2x1m
	tqOnX5kKPfgTgTWdCbqrtMBT0RVJHEreAHGtxTEZpb4egKVOp70HNlCxTn/trGbjr4YHgM
	NUPOBwwouWGbQGdtkuMr2vsxWrI7ADUyBWbE0hePLaU7x1eUgfeZ2NWfjnxRIzJzgnQ3HX
	ED/Ja8+aok4Sg9Cz0qo5NKCRXQOZmmr0L45xdJ/cYioR/Y978Lpe9iPKM4gXjrruz0NDvB
	t+x+GJj1mBNpgjtJLB0qtGFVSWnz3YvVjMSVZL3yxfwYYJz3hMyzkrY/HgDbKA==
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
Subject: [PATCH v2 4/7] of: resolver: Add support for the export symbols node
Date: Wed, 30 Apr 2025 14:51:48 +0200
Message-ID: <20250430125154.195498-5-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250430125154.195498-1-herve.codina@bootlin.com>
References: <20250430125154.195498-1-herve.codina@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvieeijeehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefjvghrvhgvucevohguihhnrgcuoehhvghrvhgvrdgtohguihhnrgessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepheffiefgjeeuleeuueffleeufefglefhjefhheeigedukeetieeltddthfffkeffnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopehlohgtrghlhhhoshhtrdhlohgtrghlughomhgrihhnpdhmrghilhhfrhhomhephhgvrhhvvgdrtghoughinhgrsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeduiedprhgtphhtthhopegurghvihgusehgihgsshhonhdrughrohhpsggvrghrrdhiugdrrghupdhrtghpthhtoheprghfugesthhirdgtohhmpdhrtghpthhtoheprgihuhhshhessggvrghglhgvsghorghrugdrohhrghdprhgtphhtthhopehgvggvrhhtsehlihhnuhigqdhmieekkhdrohhrghdprhgtphhtthhopehrohgshheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepk
 hhriihkodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheptghonhhorhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehhvghrvhgvrdgtohguihhnrgessghoohhtlhhinhdrtghomh
X-GND-Sasl: herve.codina@bootlin.com

Symbols resolution done when an overlay is applied looks only at the
global __symbol__ node to resolve unknown symbols from the overlay (i.e
symbols listed in the overlay __fixups__ node).

In order to provide flexibilities and allow to define some additional
symbols visible only when an overlay is applied to a specific node,
introduce the export symbols node.

The export symbols node adds some additional symbols that can be used
in the symbols resolution. The resolver tries to match unresolved
symbols first using the export symbols node and, if a match is not
found, it tries to match using the global __symbol__ node.

Contrary to symbols available in the global __symbols__ node, symbols
listed in the export symbols node can be considered as local symbols.
Indeed, they can be changed depending on the node the overlay is going
to be applied to and are only visibible from the current recolver call.

Handle those additional symbols given by the export symbols node in the
symbols resolution.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
Tested-by: Ayush Singh <ayush@beagleboard.org>
---
 drivers/of/resolver.c | 33 +++++++++++++++++++++++++++++----
 drivers/of/unittest.c |  4 ++--
 2 files changed, 31 insertions(+), 6 deletions(-)

diff --git a/drivers/of/resolver.c b/drivers/of/resolver.c
index 5c492711b21f..c2b63cec1865 100644
--- a/drivers/of/resolver.c
+++ b/drivers/of/resolver.c
@@ -220,6 +220,9 @@ static int get_phandle_from_symbols_node(const struct device_node *tree_symbols,
 	const char *refpath;
 	int err;
 
+	if (!tree_symbols)
+		return -ENOENT;
+
 	err = of_property_read_string(tree_symbols, symbol_name, &refpath);
 	if (err)
 		return err;
@@ -234,6 +237,25 @@ static int get_phandle_from_symbols_node(const struct device_node *tree_symbols,
 	return 0;
 }
 
+static int get_phandle_from_export_node(const struct device_node *export_symbols,
+					const char *symbol_name,
+					phandle *phandle)
+{
+	struct device_node *refnode;
+
+	if (!export_symbols)
+		return -ENOENT;
+
+	refnode = of_parse_phandle(export_symbols, symbol_name, 0);
+	if (!refnode)
+		return -ENOENT;
+
+	*phandle = refnode->phandle;
+	of_node_put(refnode);
+
+	return 0;
+}
+
 /**
  * of_resolve_phandles - Relocate and resolve overlay against live tree
  *
@@ -312,7 +334,7 @@ int of_resolve_phandles(struct device_node *overlay, const struct device_node *e
 		return 0;
 
 	struct device_node __free(device_node) *tree_symbols = of_find_node_by_path("/__symbols__");
-	if (!tree_symbols) {
+	if (!tree_symbols && !export_symbols) {
 		pr_err("no symbols in root of device tree.\n");
 		return -EINVAL;
 	}
@@ -323,10 +345,13 @@ int of_resolve_phandles(struct device_node *overlay, const struct device_node *e
 		if (!of_prop_cmp(prop->name, "name"))
 			continue;
 
-		err = get_phandle_from_symbols_node(tree_symbols, prop->name,
-						    &phandle);
+		err = get_phandle_from_export_node(export_symbols, prop->name,
+						   &phandle);
+		if (err)
+			err = get_phandle_from_symbols_node(tree_symbols, prop->name,
+							    &phandle);
 		if (err) {
-			pr_err("node label '%s' not found or invalid in live devicetree symbols table\n",
+			pr_err("node label '%s' not found or invalid in live devicetree symbols or export tables\n",
 			       prop->name);
 			return err;
 		}
diff --git a/drivers/of/unittest.c b/drivers/of/unittest.c
index 620237365566..658690fd6980 100644
--- a/drivers/of/unittest.c
+++ b/drivers/of/unittest.c
@@ -4146,7 +4146,7 @@ static __init void of_unittest_overlay_high_level(void)
 	/* ---  overlay_bad_unresolved  --- */
 
 	EXPECT_BEGIN(KERN_ERR,
-		     "OF: resolver: node label 'this_label_does_not_exist' not found in live devicetree symbols table");
+		     "OF: resolver: node label 'this_label_does_not_exist' not found or invalid in live devicetree symbols or export tables");
 	EXPECT_BEGIN(KERN_ERR,
 		     "OF: resolver: overlay phandle fixup failed: -22");
 
@@ -4156,7 +4156,7 @@ static __init void of_unittest_overlay_high_level(void)
 	EXPECT_END(KERN_ERR,
 		   "OF: resolver: overlay phandle fixup failed: -22");
 	EXPECT_END(KERN_ERR,
-		   "OF: resolver: node label 'this_label_does_not_exist' not found in live devicetree symbols table");
+		   "OF: resolver: node label 'this_label_does_not_exist' not found or invalid in live devicetree symbols or export tables");
 
 	return;
 
-- 
2.49.0

