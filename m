Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FBF4D530
	for <linux-kernel@vger.kernel.org>; Sun, 27 Apr 2025 01:22:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.229.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745716981; cv=none; b=T/JLGJQjA2NgbfDInl7lQp/YAuVSaye+t6rhRPO++yf4PBEFC/tyELIaSV7fkisCLnRJonfjpug04AjIBiuqqlp9w9vghZPV//6LxOHsPC0v+PHgUSLrFTt+Fmr3LlURhGLeMQ4dWj3gcqpBRGgDBr3mTFKvz3OYSxSyfifmsfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745716981; c=relaxed/simple;
	bh=fEX+59ag3imFa8GqlDM/EEM3i6sAOoK81fQCOVxrbzI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LDB30Xvf/aCYKoKK1e1JwxQJuCTSjuYMLrImqaDntKDjotvlJZmjTWg4sgCtc5aRTR7Ef2wS4MM52KTYB7KkcqAhImf1uWjqHxGU7qsU7sXj70wf9SLQLXtk2n31GsUwa/7/1D3lWypM5oyDZ+xgIQz34Nz5wo0Cg2y6opPXBQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org; spf=pass smtp.mailfrom=treblig.org; dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b=A56f7W0f; arc=none smtp.client-ip=46.235.229.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=treblig.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b="A56f7W0f"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=MIME-Version:Message-ID:Date:Subject:From:Content-Type:From
	:Subject; bh=JO551g2WHEhEdipJcdDRnOYvb81qG97yGVQmxR7KK0s=; b=A56f7W0fS+LbYj1x
	4iKlV5klDQlG+ITrCNdc49dBzfAosS4d+wZRg2EYEuRd/HkDd0q+TxKCnJgWTwXhK1l/TimJJVRZQ
	zXWqduOQBXVTZlCnxp2WFbzziEiMkmkSFyf9lD1lUjO1NLl213cUT0nqVTFRvLLm9EXuqQ8bOnHRj
	j3zqnMfAP32pmFIlayADGql7v/IyDS+ASYXb7vExRnZOIsjYeFxQdMD+3tXGMbuA9re8qjNS+tV7H
	ectvzVMtFt0vc82MG7+bVO6jyFBDNFNYwmTB4rJZ+OwnO0JCvm96RNylHrc43UBMnlTOH3YMN3AHu
	c3A3UmyQUU7uQJwnpg==;
Received: from localhost ([127.0.0.1] helo=dalek.home.treblig.org)
	by mx.treblig.org with esmtp (Exim 4.96)
	(envelope-from <linux@treblig.org>)
	id 1u8qjK-00E5d8-1w;
	Sun, 27 Apr 2025 01:22:50 +0000
From: linux@treblig.org
To: broonie@kernel.org,
	gregkh@linuxfoundation.org,
	rafael@kernel.org,
	dakr@kernel.org
Cc: linux-kernel@vger.kernel.org,
	"Dr. David Alan Gilbert" <linux@treblig.org>
Subject: [PATCH] regmap: Remove unused regmap_field_bulk_(alloc,free)
Date: Sun, 27 Apr 2025 02:22:50 +0100
Message-ID: <20250427012250.244752-1-linux@treblig.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Dr. David Alan Gilbert" <linux@treblig.org>

regmap_field_bulk_alloc() and regmap_field_bulk_free() were added in
2020 by
commit ea470b82f205 ("regmap: add support to regmap_field_bulk_alloc/free
apis")

but have remained unused.

Remove them.

The devm_ versions are still used and are left alone.

Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
---
 drivers/base/regmap/regmap.c | 46 ------------------------------------
 include/linux/regmap.h       |  5 ----
 2 files changed, 51 deletions(-)

diff --git a/drivers/base/regmap/regmap.c b/drivers/base/regmap/regmap.c
index f2843f814675..b805753fc556 100644
--- a/drivers/base/regmap/regmap.c
+++ b/drivers/base/regmap/regmap.c
@@ -1248,40 +1248,6 @@ struct regmap_field *devm_regmap_field_alloc(struct device *dev,
 }
 EXPORT_SYMBOL_GPL(devm_regmap_field_alloc);
 
-
-/**
- * regmap_field_bulk_alloc() - Allocate and initialise a bulk register field.
- *
- * @regmap: regmap bank in which this register field is located.
- * @rm_field: regmap register fields within the bank.
- * @reg_field: Register fields within the bank.
- * @num_fields: Number of register fields.
- *
- * The return value will be an -ENOMEM on error or zero for success.
- * Newly allocated regmap_fields should be freed by calling
- * regmap_field_bulk_free()
- */
-int regmap_field_bulk_alloc(struct regmap *regmap,
-			    struct regmap_field **rm_field,
-			    const struct reg_field *reg_field,
-			    int num_fields)
-{
-	struct regmap_field *rf;
-	int i;
-
-	rf = kcalloc(num_fields, sizeof(*rf), GFP_KERNEL);
-	if (!rf)
-		return -ENOMEM;
-
-	for (i = 0; i < num_fields; i++) {
-		regmap_field_init(&rf[i], regmap, reg_field[i]);
-		rm_field[i] = &rf[i];
-	}
-
-	return 0;
-}
-EXPORT_SYMBOL_GPL(regmap_field_bulk_alloc);
-
 /**
  * devm_regmap_field_bulk_alloc() - Allocate and initialise a bulk register
  * fields.
@@ -1318,18 +1284,6 @@ int devm_regmap_field_bulk_alloc(struct device *dev,
 }
 EXPORT_SYMBOL_GPL(devm_regmap_field_bulk_alloc);
 
-/**
- * regmap_field_bulk_free() - Free register field allocated using
- *                       regmap_field_bulk_alloc.
- *
- * @field: regmap fields which should be freed.
- */
-void regmap_field_bulk_free(struct regmap_field *field)
-{
-	kfree(field);
-}
-EXPORT_SYMBOL_GPL(regmap_field_bulk_free);
-
 /**
  * devm_regmap_field_bulk_free() - Free a bulk register field allocated using
  *                            devm_regmap_field_bulk_alloc.
diff --git a/include/linux/regmap.h b/include/linux/regmap.h
index d17c5ea3d55d..d4e9b39f1946 100644
--- a/include/linux/regmap.h
+++ b/include/linux/regmap.h
@@ -1444,11 +1444,6 @@ struct regmap_field *devm_regmap_field_alloc(struct device *dev,
 		struct regmap *regmap, struct reg_field reg_field);
 void devm_regmap_field_free(struct device *dev,	struct regmap_field *field);
 
-int regmap_field_bulk_alloc(struct regmap *regmap,
-			     struct regmap_field **rm_field,
-			     const struct reg_field *reg_field,
-			     int num_fields);
-void regmap_field_bulk_free(struct regmap_field *field);
 int devm_regmap_field_bulk_alloc(struct device *dev, struct regmap *regmap,
 				 struct regmap_field **field,
 				 const struct reg_field *reg_field,
-- 
2.49.0

