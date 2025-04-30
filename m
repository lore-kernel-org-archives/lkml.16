Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C20D25A642;
	Wed, 30 Apr 2025 12:49:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746017367; cv=none; b=kU9I1daGB//dxnaZUZJkuH/tV6bNWTeBY7ZH+hnyFOUipxPai2adzu9d6b0SV4OTnlWX4eqX98b9U/gTWe0AXyShm1wGXrhGxHV7zlFRLx04ReooyPBPTG9mV8NyQqQTQ+nBR2oOY47nbEh/yyOcAgFn8Pf2ojwo84Y7JacJg3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746017367; c=relaxed/simple;
	bh=Zlo0JIAVBhVcxhoeRxFpnpqdS1ScVVuHOETJuuNopRY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=loPoM5N5t2GvBA9KUw+tdHS4Uz5ZJZ7TqlS9bAC/UaVplxZsklpMUmFwyv1cICmKdwY5gAjSlGlVuZcvYx6GCIjpM2F7hJWABym9xidxIQ6xyKo2gAXWMNNieUEcLWdNA7NKQanI+qsUEuHjnR22y0B+v6QdFGXLuV/oE/QcjP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=U7BOWd6y; arc=none smtp.client-ip=217.70.183.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="U7BOWd6y"
Received: by mail.gandi.net (Postfix) with ESMTPA id C0C2D43A23;
	Wed, 30 Apr 2025 12:49:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1746017363;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nLx+9dvUsBPx0JucbrUMlWbWrTUIqTh5/5kioAg10L8=;
	b=U7BOWd6yAvH7Qrqkc5aO+agXbyN4f9TSYFRh6wPbaJFPEyeHgb0YRJ+dyGxa3VDvNR530R
	6apuZYIXL9JXsdZoPktxotOpyEZeCEo3ooKbbg4V+26vnyo0O9Lw3IraXLfVIJlqoIcq2b
	9PQTTBR+T36TmcqcBWthygybVVwV2jEnSghs6ng1aFgx0MW11SKot5vd7Qmm/LXoYYp0cU
	p4jG4Q9RliSwHp3Q0W1MqYECHkkKibXsrrUk7Ebl5DhtUUFLH+MNaZYeNT7Vp5/2LWYnQY
	j2dsRqSIPBfI8mWKEOLDYdrcGGepC1jF7pu7bConLuGtEyOMwMpxDOM5I5ryqw==
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
Subject: [PATCH 6/7] of: overlay: Add support for the export symbols node
Date: Wed, 30 Apr 2025 14:49:05 +0200
Message-ID: <20250430124910.195368-7-herve.codina@bootlin.com>
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

The resolver already supports the use of the export symbol node.

Add support of the export symbol node feature in of_overlay_fdt_apply()
simply getting the export node from its name and passing it to the
resolver.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
Tested-by: Ayush Singh <ayush@beagleboard.org>
---
 drivers/of/overlay.c | 23 ++++++++++++++++++++---
 1 file changed, 20 insertions(+), 3 deletions(-)

diff --git a/drivers/of/overlay.c b/drivers/of/overlay.c
index 73ff38c41de2..7c55d39f89af 100644
--- a/drivers/of/overlay.c
+++ b/drivers/of/overlay.c
@@ -891,6 +891,10 @@ static void free_overlay_changeset(struct overlay_changeset *ovcs)
  * of_overlay_apply() - Create and apply an overlay changeset
  * @ovcs:	overlay changeset
  * @base:	point to the target node to apply overlay
+ * @export_symbols_name:
+ *		Name of the export symbol subnode of the @base node to
+ *		provide extra symbols. Those extra symbols are used in
+ *		the overlay symbols resolution.
  *
  * Creates and applies an overlay changeset.
  *
@@ -915,11 +919,24 @@ static void free_overlay_changeset(struct overlay_changeset *ovcs)
  */
 
 static int of_overlay_apply(struct overlay_changeset *ovcs,
-			    const struct device_node *base)
+			    const struct device_node *base,
+			    const char *export_symbols_name)
 {
+	struct device_node *export_symbols = NULL;
 	int ret = 0, ret_revert, ret_tmp;
 
-	ret = of_resolve_phandles(ovcs->overlay_root, NULL);
+	if (base && export_symbols_name) {
+		export_symbols = of_get_child_by_name(base, export_symbols_name);
+		if (!export_symbols) {
+			pr_err("overlay get export symbols '%s' from %pOF failed\n",
+			       export_symbols_name, base);
+			ret = -EINVAL;
+			goto out;
+		}
+	}
+
+	ret = of_resolve_phandles(ovcs->overlay_root, export_symbols);
+	of_node_put(export_symbols);
 	if (ret)
 		goto out;
 
@@ -1059,7 +1076,7 @@ int of_overlay_fdt_apply(const void *overlay_fdt, u32 overlay_fdt_size,
 	}
 	ovcs->overlay_mem = overlay_mem;
 
-	ret = of_overlay_apply(ovcs, base);
+	ret = of_overlay_apply(ovcs, base, export_symbols_name);
 	/*
 	 * If of_overlay_apply() error, calling free_overlay_changeset() may
 	 * result in a memory leak if the apply partly succeeded, so do NOT
-- 
2.49.0

