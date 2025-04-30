Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D31025B1ED;
	Wed, 30 Apr 2025 12:49:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746017363; cv=none; b=dCDoKNR6BbqBaJhVyaluZwALTnMa09s0IKz5OcM6GBAlWsBDT9DWfT74HOvHL15yPDFIHeRRLmv5IVKpBQHjtk2qrbOw4cQlO636B5DmMMT1rzNGBC7jAF72+kPHUHyAtf0swAdo+X1SslaH6oIewf4DJ4hHxnf0JoRbOzZ0q3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746017363; c=relaxed/simple;
	bh=04Lgsevk075WoZNcBOi6TghRMwt8xkLiKvl4P7+VTdQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=k5G0QqvF7XmMGbwaHB9u2BMhV2aQ9TEpNVU7QaV11x3X/FuG017jKoN3z3jt1JCKP7bsbQHYsrC2dSquq7IZuwYq0ujyNRmf/j40FHrzcDa23k/o+LPgdq+PpsqZPT4TcK5AzjmWD3KG8F1nsXHaduBLDG+svI/9QPLYirbWM8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=cgMUN41r; arc=none smtp.client-ip=217.70.183.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="cgMUN41r"
Received: by mail.gandi.net (Postfix) with ESMTPA id 3639243A20;
	Wed, 30 Apr 2025 12:49:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1746017359;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MeC3Blleg5ID5FjARVSQZ7w0x3ZCmA8mRG7YjX82K+A=;
	b=cgMUN41rz0j5Hn/kW6LtBkT82ZawzHmcxf2xAk9kY6r44Xtkqm64/Ls9XflMX+tfsfkVJT
	pdVjC8NGRagn9GYnL1/q+OxPOR5T4o65ebmnH9GzUXfC9cPhm1+PVBiOj6XFpw7fAYXQkF
	q6DirTKNhpxghdwFt1lgS9jwCl/Gl94kOFYxcn86yDPW/RzNczID3hcPVDeXJwpr+wx5Z3
	NUCSWX7hzXRswHuK3j2FnBxSs7+u3B56A8NVq5wST9u0gbftDFVeq8qckUJHXv9q0gdSb4
	AN06n1MR8pW0RVXplgZDgbMC97ufC6tekm4Y3NA3HPDh7c8nRhvmQifZ7uMf7g==
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
Subject: [PATCH 2/7] of: resolver: Introduce get_phandle_from_symbols_node()
Date: Wed, 30 Apr 2025 14:49:01 +0200
Message-ID: <20250430124910.195368-3-herve.codina@bootlin.com>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvieeijeegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefjvghrvhgvucevohguihhnrgcuoehhvghrvhgvrdgtohguihhnrgessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepheffiefgjeeuleeuueffleeufefglefhjefhheeigedukeetieeltddthfffkeffnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopehlohgtrghlhhhoshhtrdhlohgtrghlughomhgrihhnpdhmrghilhhfrhhomhephhgvrhhvvgdrtghoughinhgrsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeduiedprhgtphhtthhopegurghvihgusehgihgsshhonhdrughrohhpsggvrghrrdhiugdrrghupdhrtghpthhtoheprghfugesthhirdgtohhmpdhrtghpthhtoheprgihuhhshhessggvrghglhgvsghorghrugdrohhrghdprhgtphhtthhopehgvggvrhhtsehlihhnuhigqdhmieekkhdrohhrghdprhgtphhtthhopehrohgshheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepk
 hhriihkodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheptghonhhorhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehhvghrvhgvrdgtohguihhnrgessghoohhtlhhinhdrtghomh
X-GND-Sasl: herve.codina@bootlin.com

In order to simplify the introduction of the export symbols node
handling, group necessary operations done to get a phandle from the
__symbols__ node in this dedicated get_phandle_from_symbols_node()
function.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
Tested-by: Ayush Singh <ayush@beagleboard.org>
---
 drivers/of/resolver.c | 39 ++++++++++++++++++++++++++-------------
 1 file changed, 26 insertions(+), 13 deletions(-)

diff --git a/drivers/of/resolver.c b/drivers/of/resolver.c
index 86424e145919..2c7a3b479b15 100644
--- a/drivers/of/resolver.c
+++ b/drivers/of/resolver.c
@@ -212,6 +212,28 @@ static int adjust_local_phandle_references(const struct device_node *local_fixup
 	return 0;
 }
 
+static int get_phandle_from_symbols_node(const struct device_node *tree_symbols,
+					 const char *symbol_name,
+					 phandle *phandle)
+{
+	struct device_node *refnode;
+	const char *refpath;
+	int err;
+
+	err = of_property_read_string(tree_symbols, symbol_name, &refpath);
+	if (err)
+		return err;
+
+	refnode = of_find_node_by_path(refpath);
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
@@ -247,11 +269,9 @@ static int adjust_local_phandle_references(const struct device_node *local_fixup
  */
 int of_resolve_phandles(struct device_node *overlay)
 {
-	struct device_node *child, *refnode;
-	struct device_node *overlay_fixups;
+	struct device_node *child, *overlay_fixups;
 	struct device_node __free(device_node) *local_fixups = NULL;
 	struct property *prop;
-	const char *refpath;
 	phandle phandle, phandle_delta;
 	int err;
 
@@ -298,21 +318,14 @@ int of_resolve_phandles(struct device_node *overlay)
 		if (!of_prop_cmp(prop->name, "name"))
 			continue;
 
-		err = of_property_read_string(tree_symbols,
-				prop->name, &refpath);
+		err = get_phandle_from_symbols_node(tree_symbols, prop->name,
+						    &phandle);
 		if (err) {
-			pr_err("node label '%s' not found in live devicetree symbols table\n",
+			pr_err("node label '%s' not found or invalid in live devicetree symbols table\n",
 			       prop->name);
 			return err;
 		}
 
-		refnode = of_find_node_by_path(refpath);
-		if (!refnode)
-			return -ENOENT;
-
-		phandle = refnode->phandle;
-		of_node_put(refnode);
-
 		err = update_usages_of_a_phandle_reference(overlay, prop, phandle);
 		if (err)
 			break;
-- 
2.49.0

