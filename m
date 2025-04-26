Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF6991A08DB;
	Sat, 26 Apr 2025 17:52:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.229.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745689950; cv=none; b=EtGQ8Ogk/1uU9XYnCCKBeNK//ajuR8WVaaq2Xv8vhcVeFdwkEWVMBz9pURip+PE2Jz2Gl8O0xDhDUBhH2szl06S/Kslh17KVFO0KThqf/mhZKO7pvSNubcJYndr0WPvz7KmiXravWnBhlDnYRknuAcVRHARXqa/Lia1iBf4qugA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745689950; c=relaxed/simple;
	bh=vJgy8tQMrt+aoG2ttElS3cDlnT/MD3d+wjc/TizjeCo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sBCQDPBNQXtXFhycQwEBV2RMXibPLPUiqP3LnMQgMLKij95bPr3ecthguCISdZETKIkHa4+LvA0nTWi0p8qXj4nqBANoo1hSlWUXEJorDfqFaCPggqEiQho3XlLIFERToBLC7dUZY0Fx+HNJBxwdFL47YH+/F/S/+we9YeWNhSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org; spf=pass smtp.mailfrom=treblig.org; dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b=K5QGhbeI; arc=none smtp.client-ip=46.235.229.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=treblig.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b="K5QGhbeI"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=MIME-Version:Message-ID:Date:Subject:From:Content-Type:From
	:Subject; bh=nODb2/Dg6J9XfTDKpylGMZozA/0cRZe7/w52L6ftxRw=; b=K5QGhbeIogdaidpq
	aGoVoSKkoHsY1l/0ieb852CntaIRHSasdmM20mNfyyaG1hVgV0G89bXid7xyrDj0twwAaDxWXdaub
	qfFE+LtoLYeivj2Loj3qbGLCDxT9oa0+zc6Lekg1xRnp4sgc3S1utFjEbmz7UtYE9Pul6pBuRDs/B
	kLrsj0DEibPa9pMAIQNHarfhQbeVkwexNP2JBII5K3LmO8GOe3FyWDK/9A4HqNuHCCYSaFDd5EYHt
	vtLZxpr3slwZlW3g+8HQN2NZDL5uqRclVDdhqSAtGgtHJeZ7virYtuzWtiEHLQ9u4oX/aMhPlnFob
	nLIrK/ry8CqVnNbubA==;
Received: from localhost ([127.0.0.1] helo=dalek.home.treblig.org)
	by mx.treblig.org with esmtp (Exim 4.96)
	(envelope-from <linux@treblig.org>)
	id 1u8jhG-00E44n-1d;
	Sat, 26 Apr 2025 17:52:14 +0000
From: linux@treblig.org
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: linux-doc@vger.kernel.org,
	corbet@lwn.net,
	linux-kernel@vger.kernel.org,
	"Dr. David Alan Gilbert" <linux@treblig.org>
Subject: [PATCH 1/5] regulator: devres: Remove unused devm_regulator_bulk_register_supply_alias
Date: Sat, 26 Apr 2025 18:51:39 +0100
Message-ID: <20250426175143.128086-2-linux@treblig.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250426175143.128086-1-linux@treblig.org>
References: <20250426175143.128086-1-linux@treblig.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Dr. David Alan Gilbert" <linux@treblig.org>

devm_regulator_bulk_register_supply_alias() has been unused since 2014's
commit d137be00ee01 ("mfd: core: Don't use devres functions before device
is added")

Remove it, and the static helpers only it used.

Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
---
 .../driver-api/driver-model/devres.rst        |  1 -
 drivers/regulator/devres.c                    | 74 -------------------
 include/linux/regulator/consumer.h            |  6 --
 3 files changed, 81 deletions(-)

diff --git a/Documentation/driver-api/driver-model/devres.rst b/Documentation/driver-api/driver-model/devres.rst
index d75728eb05f8..9a0122fceabd 100644
--- a/Documentation/driver-api/driver-model/devres.rst
+++ b/Documentation/driver-api/driver-model/devres.rst
@@ -424,7 +424,6 @@ PWM
   devm_fwnode_pwm_get()
 
 REGULATOR
-  devm_regulator_bulk_register_supply_alias()
   devm_regulator_bulk_get()
   devm_regulator_bulk_get_const()
   devm_regulator_bulk_get_enable()
diff --git a/drivers/regulator/devres.c b/drivers/regulator/devres.c
index 2cf03042fddf..3fb01417fa5a 100644
--- a/drivers/regulator/devres.c
+++ b/drivers/regulator/devres.c
@@ -490,15 +490,6 @@ struct regulator_supply_alias_match {
 	const char *id;
 };
 
-static int devm_regulator_match_supply_alias(struct device *dev, void *res,
-					     void *data)
-{
-	struct regulator_supply_alias_match *match = res;
-	struct regulator_supply_alias_match *target = data;
-
-	return match->dev == target->dev && strcmp(match->id, target->id) == 0;
-}
-
 static void devm_regulator_destroy_supply_alias(struct device *dev, void *res)
 {
 	struct regulator_supply_alias_match *match = res;
@@ -547,71 +538,6 @@ int devm_regulator_register_supply_alias(struct device *dev, const char *id,
 }
 EXPORT_SYMBOL_GPL(devm_regulator_register_supply_alias);
 
-static void devm_regulator_unregister_supply_alias(struct device *dev,
-						   const char *id)
-{
-	struct regulator_supply_alias_match match;
-	int rc;
-
-	match.dev = dev;
-	match.id = id;
-
-	rc = devres_release(dev, devm_regulator_destroy_supply_alias,
-			    devm_regulator_match_supply_alias, &match);
-	if (rc != 0)
-		WARN_ON(rc);
-}
-
-/**
- * devm_regulator_bulk_register_supply_alias - Managed register
- * multiple aliases
- *
- * @dev:       device to supply
- * @id:        list of supply names or regulator IDs
- * @alias_dev: device that should be used to lookup the supply
- * @alias_id:  list of supply names or regulator IDs that should be used to
- *             lookup the supply
- * @num_id:    number of aliases to register
- *
- * @return 0 on success, a negative error number on failure.
- *
- * This helper function allows drivers to register several supply
- * aliases in one operation, the aliases will be automatically
- * unregisters when the source device is unbound.  If any of the
- * aliases cannot be registered any aliases that were registered
- * will be removed before returning to the caller.
- */
-int devm_regulator_bulk_register_supply_alias(struct device *dev,
-					      const char *const *id,
-					      struct device *alias_dev,
-					      const char *const *alias_id,
-					      int num_id)
-{
-	int i;
-	int ret;
-
-	for (i = 0; i < num_id; ++i) {
-		ret = devm_regulator_register_supply_alias(dev, id[i],
-							   alias_dev,
-							   alias_id[i]);
-		if (ret < 0)
-			goto err;
-	}
-
-	return 0;
-
-err:
-	dev_err(dev,
-		"Failed to create supply alias %s,%s -> %s,%s\n",
-		id[i], dev_name(dev), alias_id[i], dev_name(alias_dev));
-
-	while (--i >= 0)
-		devm_regulator_unregister_supply_alias(dev, id[i]);
-
-	return ret;
-}
-EXPORT_SYMBOL_GPL(devm_regulator_bulk_register_supply_alias);
-
 struct regulator_notifier_match {
 	struct regulator *regulator;
 	struct notifier_block *nb;
diff --git a/include/linux/regulator/consumer.h b/include/linux/regulator/consumer.h
index 56fe2693d9b2..1e20c7330cd4 100644
--- a/include/linux/regulator/consumer.h
+++ b/include/linux/regulator/consumer.h
@@ -185,12 +185,6 @@ int devm_regulator_register_supply_alias(struct device *dev, const char *id,
 					 struct device *alias_dev,
 					 const char *alias_id);
 
-int devm_regulator_bulk_register_supply_alias(struct device *dev,
-					      const char *const *id,
-					      struct device *alias_dev,
-					      const char *const *alias_id,
-					      int num_id);
-
 /* regulator output control and status */
 int __must_check regulator_enable(struct regulator *regulator);
 int regulator_disable(struct regulator *regulator);
-- 
2.49.0

