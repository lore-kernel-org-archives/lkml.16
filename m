Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0762B25CC4A;
	Wed, 30 Apr 2025 12:52:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746017534; cv=none; b=ndLQqLUaQgWvuwu+Cq7CaeGmDcev5drJQW+ZRJRPSE0pNgorruUhHzcQyby4+OI8JvgnOzhahf4u8xOWUYBk7+g+Hb9WOgOCwKTTZ91ULoxQWpp/mhscbDjCjTCD+OrXOlgwij0TeLP06EHM7r9N+n36zMI+Eef5C2j93VBXAL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746017534; c=relaxed/simple;
	bh=GJIUO/LfuuEyx2C59Bql/hQ7zaQ2Afe6Myf8SeIhfEA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=byv9xBkLD7Ae58Nz71RPb6aYm9XhjafoJKzd2RmH/oURdbZl3o9rP5jKWreNUjlA5cSwdoIyDoqcBhi+CcxL3NzsFCqWIYXyJHi6xaJ5zdZHF1AOpvxGCk2NoBpxG3BlZqaLGMVY/dxdtfIWdZKPJLcYWN+Pg//wi7+IhbKIv+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=d0QMZ7Kq; arc=none smtp.client-ip=217.70.183.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="d0QMZ7Kq"
Received: by mail.gandi.net (Postfix) with ESMTPA id 9CE5D438B5;
	Wed, 30 Apr 2025 12:52:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1746017530;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JCHiV2KgzmFR5ylUD36LT9XNI75ngLRnaSotflKdIX8=;
	b=d0QMZ7KqKE3cw9oLBOYt32bSUFzSYQhazzFElPcTHZbP/HMAbfvUR/S5/9BuSyH/m0kY0v
	s25KcT97Dq2H/qHYXO1itChK9bELiFr2HKOBsGd9QfkCqPs+gBtNmtd5gq6EXICssPV4tv
	8zxXs1xLQtW/HVfHUBgt5/+9YPWecWWrCdNKAK3i/hSbuEDvByUr3L6hbesxqs6fNtB3GO
	vF940UFt5hJLpoEZ3moIsL0SWB7tYH4vbbmmHhMUZe7i0muG+4JfffMqHJva9VPa+C1erD
	V9KTfMduirbSCB+3brtJKK+wls7WTf5nPL2kpeviyxefVdmPhCXhf4kks7jjjg==
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
Subject: [PATCH v2 5/7] of: overlay: Add export_symbols_name in of_overlay_fdt_apply() parameters
Date: Wed, 30 Apr 2025 14:51:49 +0200
Message-ID: <20250430125154.195498-6-herve.codina@bootlin.com>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvieeijeehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefjvghrvhgvucevohguihhnrgcuoehhvghrvhgvrdgtohguihhnrgessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepheffiefgjeeuleeuueffleeufefglefhjefhheeigedukeetieeltddthfffkeffnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgepfeenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopehlohgtrghlhhhoshhtrdhlohgtrghlughomhgrihhnpdhmrghilhhfrhhomhephhgvrhhvvgdrtghoughinhgrsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeduiedprhgtphhtthhopegurghvihgusehgihgsshhonhdrughrohhpsggvrghrrdhiugdrrghupdhrtghpthhtoheprghfugesthhirdgtohhmpdhrtghpthhtoheprgihuhhshhessggvrghglhgvsghorghrugdrohhrghdprhgtphhtthhopehgvggvrhhtsehlihhnuhigqdhmieekkhdrohhrghdprhgtphhtthhopehrohgshheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepk
 hhriihkodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheptghonhhorhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehhvghrvhgvrdgtohguihhnrgessghoohhtlhhinhdrtghomh
X-GND-Sasl: herve.codina@bootlin.com

In order to prepare the introduction of the export symbols node
handling, add a export_symbols_name parameter in of_overlay_fdt_apply().

The export_symbols_name is the name of the export symbols subnode
available in the base node that will be used by the resolver to handle
export symbols resolution.

Having the name of the subnode in parameters instead of the subnode
itself avoids the use of an export symbol node that is not directly
related to the base node.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
Tested-by: Ayush Singh <ayush@beagleboard.org>
---
 drivers/misc/lan966x_pci.c    | 3 ++-
 drivers/of/of_kunit_helpers.c | 2 +-
 drivers/of/overlay.c          | 7 ++++++-
 drivers/of/unittest.c         | 4 ++--
 include/linux/of.h            | 6 ++++--
 5 files changed, 15 insertions(+), 7 deletions(-)

diff --git a/drivers/misc/lan966x_pci.c b/drivers/misc/lan966x_pci.c
index 9c79b58137e5..f05cb040ec69 100644
--- a/drivers/misc/lan966x_pci.c
+++ b/drivers/misc/lan966x_pci.c
@@ -128,7 +128,8 @@ static int lan966x_pci_load_overlay(struct lan966x_pci *data)
 	u32 dtbo_size = __dtbo_lan966x_pci_end - __dtbo_lan966x_pci_begin;
 	void *dtbo_start = __dtbo_lan966x_pci_begin;
 
-	return of_overlay_fdt_apply(dtbo_start, dtbo_size, &data->ovcs_id, dev_of_node(data->dev));
+	return of_overlay_fdt_apply(dtbo_start, dtbo_size, &data->ovcs_id,
+				    dev_of_node(data->dev), NULL);
 }
 
 static void lan966x_pci_unload_overlay(struct lan966x_pci *data)
diff --git a/drivers/of/of_kunit_helpers.c b/drivers/of/of_kunit_helpers.c
index 7b3ed5a382aa..476b43474168 100644
--- a/drivers/of/of_kunit_helpers.c
+++ b/drivers/of/of_kunit_helpers.c
@@ -56,7 +56,7 @@ int of_overlay_fdt_apply_kunit(struct kunit *test, void *overlay_fdt,
 		return -ENOMEM;
 
 	ret = of_overlay_fdt_apply(overlay_fdt, overlay_fdt_size,
-				   ovcs_id, NULL);
+				   ovcs_id, NULL, NULL);
 	if (ret)
 		return ret;
 
diff --git a/drivers/of/overlay.c b/drivers/of/overlay.c
index aa1b97e634aa..73ff38c41de2 100644
--- a/drivers/of/overlay.c
+++ b/drivers/of/overlay.c
@@ -968,6 +968,10 @@ static int of_overlay_apply(struct overlay_changeset *ovcs,
  * @overlay_fdt_size:	number of bytes in @overlay_fdt
  * @ret_ovcs_id:	pointer for returning created changeset id
  * @base:		pointer for the target node to apply overlay
+ * @export_symbols_name:
+ *			Name of the export symbol subnode of the @base node to
+ *			provide extra symbols. Those extra symbols are used in
+ *			the overlay symbols resolution.
  *
  * Creates and applies an overlay changeset.
  *
@@ -983,7 +987,8 @@ static int of_overlay_apply(struct overlay_changeset *ovcs,
  */
 
 int of_overlay_fdt_apply(const void *overlay_fdt, u32 overlay_fdt_size,
-			 int *ret_ovcs_id, const struct device_node *base)
+			 int *ret_ovcs_id, const struct device_node *base,
+			 const char *export_symbols_name)
 {
 	void *new_fdt;
 	void *new_fdt_align;
diff --git a/drivers/of/unittest.c b/drivers/of/unittest.c
index 658690fd6980..11091b0176e0 100644
--- a/drivers/of/unittest.c
+++ b/drivers/of/unittest.c
@@ -3858,7 +3858,7 @@ static int __init overlay_data_apply(const char *overlay_name, int *ovcs_id)
 		pr_err("no overlay data for %s\n", overlay_name);
 
 	ret = of_overlay_fdt_apply(info->dtbo_begin, size, &info->ovcs_id,
-				   NULL);
+				   NULL, NULL);
 	if (ovcs_id)
 		*ovcs_id = info->ovcs_id;
 	if (ret < 0)
@@ -4198,7 +4198,7 @@ static int testdrv_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 	}
 
 	size = info->dtbo_end - info->dtbo_begin;
-	ret = of_overlay_fdt_apply(info->dtbo_begin, size, &ovcs_id, dn);
+	ret = of_overlay_fdt_apply(info->dtbo_begin, size, &ovcs_id, dn, NULL);
 	of_node_put(dn);
 	if (ret)
 		return ret;
diff --git a/include/linux/of.h b/include/linux/of.h
index a62154aeda1b..d8e0dd210e09 100644
--- a/include/linux/of.h
+++ b/include/linux/of.h
@@ -1749,7 +1749,8 @@ struct of_overlay_notify_data {
 #ifdef CONFIG_OF_OVERLAY
 
 int of_overlay_fdt_apply(const void *overlay_fdt, u32 overlay_fdt_size,
-			 int *ovcs_id, const struct device_node *target_base);
+			 int *ovcs_id, const struct device_node *target_base,
+			 const char *export_symbols_name);
 int of_overlay_remove(int *ovcs_id);
 int of_overlay_remove_all(void);
 
@@ -1759,7 +1760,8 @@ int of_overlay_notifier_unregister(struct notifier_block *nb);
 #else
 
 static inline int of_overlay_fdt_apply(const void *overlay_fdt, u32 overlay_fdt_size,
-				       int *ovcs_id, const struct device_node *target_base)
+				       int *ovcs_id, const struct device_node *target_base,
+				       const char *export_symbols_name)
 {
 	return -ENOTSUPP;
 }
-- 
2.49.0

