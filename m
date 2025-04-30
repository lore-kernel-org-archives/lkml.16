Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE1E025CC60;
	Wed, 30 Apr 2025 12:49:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746017364; cv=none; b=KhqJUqkqcj14ZUkmoD9xEuAoq7dkxr+Zu6rsprHcXDQFg9ZL2WPolNPZ8K55bBTYOUeu9pgCW0Cxq7+E/Ad8XCSC0AsK2+k5Yz5dCKWftHGGoY9RwG+tZeg40QS6y5pAmahzNFJNuopf3qm8MMv3EL0Bec0CTVOwIVpC/qa1iDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746017364; c=relaxed/simple;
	bh=Y7Zm8w9wG8YslhOw/WDwwhycO9VpWrlfhSRsBRFKNw8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uH6uGptYTh396sg0Uqpc9odmtWaeTZpW2YtTQ16aTQcc3R1U+lx4OJmQlV4ZCjQ9AB0y7HDszQ04UuofZOa9coBEzHhhHtGD+3SmVPhrttt8ExUHkMpL0Pk7C6OW/y784etWeCzmMxVgJ94sNAzGGmKPSaTY3X0PPVamux1jAE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=KPGJlb9A; arc=none smtp.client-ip=217.70.183.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="KPGJlb9A"
Received: by mail.gandi.net (Postfix) with ESMTPA id 11D2943A17;
	Wed, 30 Apr 2025 12:49:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1746017360;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zc5KU+vZ9ltSWyx9XaPn8D3Abm11V5SwRuQjnQVNZsw=;
	b=KPGJlb9AYG5I/aMhUjP/A/eUXR2Iuk5UtmmIJ62S0up8ZQxjhxGHi9M7++iM5C343KybwI
	Ladmpcp50bnNbimcgej0U+iVet4HsxdpWpaxOIboiG+Q6yWR1V/4yzgWMvg8nfu4HR3Dxb
	feHAPwvalmwW52KAd0w47mmWSJhC5ckrD9UkQ7kfXsBpXXuELlJj/mOUIptjueBTGZ+aA0
	3VeVU5XSxXNOzZYoqbSUkRfPp/eXOBfl/yWzP1G3s5kaXEAyNpa+EYY3H6nVysvRuvXrmg
	1usISGe1UFUhusjz1c8CNtuK3Wfw4g14AEMlqcKdOxwK8jyaDdG5k+e8WROjGQ==
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
Subject: [PATCH 3/7] of: resolver: Add export_symbols in of_resolve_phandles() parameters
Date: Wed, 30 Apr 2025 14:49:02 +0200
Message-ID: <20250430124910.195368-4-herve.codina@bootlin.com>
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

In order to prepare the introduction of the export symbols node
handling, add a export_symbols parameter in of_resolve_phandles().

The export_symbols is the export symbols device tree node the resolver
will use for the overlay symbols resolution.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
Tested-by: Ayush Singh <ayush@beagleboard.org>
---
 drivers/of/of_private.h | 2 +-
 drivers/of/overlay.c    | 2 +-
 drivers/of/resolver.c   | 9 +++++++--
 drivers/of/unittest.c   | 4 ++--
 4 files changed, 11 insertions(+), 6 deletions(-)

diff --git a/drivers/of/of_private.h b/drivers/of/of_private.h
index df0bb00349e0..cf68edb873ab 100644
--- a/drivers/of/of_private.h
+++ b/drivers/of/of_private.h
@@ -94,7 +94,7 @@ static inline void __of_detach_node_sysfs(struct device_node *np) {}
 #endif
 
 #if defined(CONFIG_OF_RESOLVE)
-int of_resolve_phandles(struct device_node *tree);
+int of_resolve_phandles(struct device_node *tree, const struct device_node *export_symbols);
 #endif
 
 void __of_phandle_cache_inv_entry(phandle handle);
diff --git a/drivers/of/overlay.c b/drivers/of/overlay.c
index 1af6f52d0708..aa1b97e634aa 100644
--- a/drivers/of/overlay.c
+++ b/drivers/of/overlay.c
@@ -919,7 +919,7 @@ static int of_overlay_apply(struct overlay_changeset *ovcs,
 {
 	int ret = 0, ret_revert, ret_tmp;
 
-	ret = of_resolve_phandles(ovcs->overlay_root);
+	ret = of_resolve_phandles(ovcs->overlay_root, NULL);
 	if (ret)
 		goto out;
 
diff --git a/drivers/of/resolver.c b/drivers/of/resolver.c
index 2c7a3b479b15..5c492711b21f 100644
--- a/drivers/of/resolver.c
+++ b/drivers/of/resolver.c
@@ -237,7 +237,8 @@ static int get_phandle_from_symbols_node(const struct device_node *tree_symbols,
 /**
  * of_resolve_phandles - Relocate and resolve overlay against live tree
  *
- * @overlay:	Pointer to devicetree overlay to relocate and resolve
+ * @overlay:		Pointer to devicetree overlay to relocate and resolve
+ * @export_symbols:	Pointer to devicetree export symbols node.
  *
  * Modify (relocate) values of local phandles in @overlay to a range that
  * does not conflict with the live expanded devicetree.  Update references
@@ -257,6 +258,10 @@ static int get_phandle_from_symbols_node(const struct device_node *tree_symbols,
  * corresponding to that symbol in the live tree.  Update the references in
  * the overlay with the phandle values in the live tree.
  *
+ * @export_symbols can be use in this references update. The resolver tries
+ * first to find a match in the @export_symbols. If not found, it uses the
+ * "__symbol__" node in the live tree.
+ *
  * @overlay must be detached.
  *
  * Resolving and applying @overlay to the live expanded devicetree must be
@@ -267,7 +272,7 @@ static int get_phandle_from_symbols_node(const struct device_node *tree_symbols,
  *
  * Return: %0 on success or a negative error value on error.
  */
-int of_resolve_phandles(struct device_node *overlay)
+int of_resolve_phandles(struct device_node *overlay, const struct device_node *export_symbols)
 {
 	struct device_node *child, *overlay_fixups;
 	struct device_node __free(device_node) *local_fixups = NULL;
diff --git a/drivers/of/unittest.c b/drivers/of/unittest.c
index 64d301893af7..620237365566 100644
--- a/drivers/of/unittest.c
+++ b/drivers/of/unittest.c
@@ -2026,7 +2026,7 @@ static int __init unittest_data_add(void)
 	 */
 	of_overlay_mutex_lock();
 
-	rc = of_resolve_phandles(unittest_data_node);
+	rc = of_resolve_phandles(unittest_data_node, NULL);
 	if (rc) {
 		pr_err("%s: Failed to resolve phandles (rc=%i)\n", __func__, rc);
 		of_overlay_mutex_unlock();
@@ -3915,7 +3915,7 @@ static __init void of_unittest_overlay_high_level(void)
 	 * because kmalloc() was not yet available.
 	 */
 	of_overlay_mutex_lock();
-	of_resolve_phandles(overlay_base_root);
+	of_resolve_phandles(overlay_base_root, NULL);
 	of_overlay_mutex_unlock();
 
 
-- 
2.49.0

