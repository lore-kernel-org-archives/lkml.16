Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D43A25D8F6;
	Wed, 30 Apr 2025 12:52:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746017535; cv=none; b=Km5hxMQXeqVBy6AW3yGbIrcIDx0pIbr1sd8NJPBMx8GWJyK1zlryY0vv0meHHzVGqi3O8Z6uqxfQIaztxUDsAb2yKfb6yuFAOJxG7Nf55lfAY42+ieSrp8NgpDazfzBrDaNZ0ueg6PTRmPwdsJ+xE1bghO0I3dQ08kJWorvEDWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746017535; c=relaxed/simple;
	bh=Zlo0JIAVBhVcxhoeRxFpnpqdS1ScVVuHOETJuuNopRY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=H8yNtKb7ThpsLHTNpcFNsMRGc+8i3yD6xQqdDQjR4X0yXkUCDqUfrZrnReBUU26oCEa/vjAYRwMGy6gC97I+FZXJX4ZfatOmWdASzO371r1MKFlFv76xryc2tl/ygDhD0R82CEN+xdLOlqw2qgzuFWYOQTBT8M7QPn4AQz/hf0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=RHgV4Lqd; arc=none smtp.client-ip=217.70.183.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="RHgV4Lqd"
Received: by mail.gandi.net (Postfix) with ESMTPA id 75148438B6;
	Wed, 30 Apr 2025 12:52:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1746017531;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nLx+9dvUsBPx0JucbrUMlWbWrTUIqTh5/5kioAg10L8=;
	b=RHgV4LqdLorrR6xJm4/uLjDusLIrre5bEQL+2OF5f1XHVd+XyTQ0Kq1AyDUzz4v9OLD5sp
	aJyGhhGNCzzWdP5rbLc/UQT3VXWMTaNFdOQh8mM9Y/pixP4S41SjEnMwuIcQUw0+MzKsK7
	xWm40X91jIFmWEZo6RBwhjOTVYZtEPS01QBuuw1P1qZYvTFiuRyZvc6ZNue4way7Nty/9k
	ZseoqTURf5y4jP1WiVqzdl4fwMdeG5DeIp1Vh4Q+hYr6R1VEq86Q3Y6p25OaNipfdxZTuN
	IIJM3RYF4wUeC7yZZ+ntmbwbIUXGnEWBYWszyQoo5AHavMdHZk9SG5L2IECmeA==
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
Subject: [PATCH v2 6/7] of: overlay: Add support for the export symbols node
Date: Wed, 30 Apr 2025 14:51:50 +0200
Message-ID: <20250430125154.195498-7-herve.codina@bootlin.com>
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

