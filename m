Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 102FC25EF82;
	Sat, 26 Apr 2025 17:52:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.229.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745689957; cv=none; b=XpTZRW/6s/Fbi2WxKOtZCp4t5fup1G6nigCjZ//p4n9zkUJzTkaYdvEgnpfRHf1zBA463oq4kBIWtCiQROYYVfhgxqzHPIKK2MV1RPIf3A0P/IYiQlNn0t4jq7GxHF+0xrt6EaK+XHebjhlv5gm1KNcLiVD+X4B+uAyQiBDUg7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745689957; c=relaxed/simple;
	bh=xbtbngHvOCi4Ro+jEiyoc4Stf5WoaqvLmDrAcxQpY3s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=b9LadtPq10a1laJyLF56khJAAUAwE5izfhXFMviz6d/07ADYNUQp96NNsj97FvRnvmyzbvVef5k1e/T3By/v0VLRNtGt3QiY1zGqWUwAuK9gNKoc3gPYiN++4MIiGXZ9N5IoPI1e5SQMaXTuKX0hMxdV51tbBmSeQqkw4Mx2BC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org; spf=pass smtp.mailfrom=treblig.org; dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b=Xnb2z96M; arc=none smtp.client-ip=46.235.229.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=treblig.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b="Xnb2z96M"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=MIME-Version:Message-ID:Date:Subject:From:Content-Type:From
	:Subject; bh=hLe/NEDwH1YdpkKS3VuvEd3SqsKOowWSgbtWazS7OU4=; b=Xnb2z96MHV7lH/So
	dVTIPj0V1S0meyZVi1uO1YzWKSLy5mrELOU0JEpuwX9wE5zXo7MWGT9NWvnvJCZSNR8clbdxRcvST
	WR/IsLjS6G72w5nGI+joSIpnX15YiDm87OPeu5/9MlBV8B4wg/rIfVNuhQSonUR2t4z06Jp5eyZCU
	Srzjq2ZPn7tPex4yoGaB/5GQDDFEp4h5PhEdjCVih4p/lMrfxN0xwzcZ/Idpy0bT08soxdLlW6eaR
	eNRTOUnka1/BpnqLHa+BvfeEyRW12ddAWgyPBd8Uyi/zrePI8QmNhiI6j7hslVOqya7dbA5dFsmZD
	qp3zezJ/rOgge4wlzA==;
Received: from localhost ([127.0.0.1] helo=dalek.home.treblig.org)
	by mx.treblig.org with esmtp (Exim 4.96)
	(envelope-from <linux@treblig.org>)
	id 1u8jhY-00E44n-0p;
	Sat, 26 Apr 2025 17:52:32 +0000
From: linux@treblig.org
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: linux-doc@vger.kernel.org,
	corbet@lwn.net,
	linux-kernel@vger.kernel.org,
	"Dr. David Alan Gilbert" <linux@treblig.org>
Subject: [PATCH 4/5] regulator: core: Remove unused regulator_suspend_(disable|enable)
Date: Sat, 26 Apr 2025 18:51:42 +0100
Message-ID: <20250426175143.128086-5-linux@treblig.org>
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

regulator_suspend_disable() and regulator_suspend_enable() were added
by 2018's
commit f7efad10b5c4 ("regulator: add PM suspend and resume hooks")

but have remained unused.

Remove them and their helper function regulator_suspend_toggle().

Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
---
 drivers/regulator/core.c           | 44 ------------------------------
 include/linux/regulator/consumer.h | 16 -----------
 2 files changed, 60 deletions(-)

diff --git a/drivers/regulator/core.c b/drivers/regulator/core.c
index 60c72d77f77a..90449f387b98 100644
--- a/drivers/regulator/core.c
+++ b/drivers/regulator/core.c
@@ -4244,50 +4244,6 @@ int regulator_set_voltage(struct regulator *regulator, int min_uV, int max_uV)
 }
 EXPORT_SYMBOL_GPL(regulator_set_voltage);
 
-static inline int regulator_suspend_toggle(struct regulator_dev *rdev,
-					   suspend_state_t state, bool en)
-{
-	struct regulator_state *rstate;
-
-	rstate = regulator_get_suspend_state(rdev, state);
-	if (rstate == NULL)
-		return -EINVAL;
-
-	if (!rstate->changeable)
-		return -EPERM;
-
-	rstate->enabled = (en) ? ENABLE_IN_SUSPEND : DISABLE_IN_SUSPEND;
-
-	return 0;
-}
-
-int regulator_suspend_enable(struct regulator_dev *rdev,
-				    suspend_state_t state)
-{
-	return regulator_suspend_toggle(rdev, state, true);
-}
-EXPORT_SYMBOL_GPL(regulator_suspend_enable);
-
-int regulator_suspend_disable(struct regulator_dev *rdev,
-				     suspend_state_t state)
-{
-	struct regulator *regulator;
-	struct regulator_voltage *voltage;
-
-	/*
-	 * if any consumer wants this regulator device keeping on in
-	 * suspend states, don't set it as disabled.
-	 */
-	list_for_each_entry(regulator, &rdev->consumer_list, list) {
-		voltage = &regulator->voltage[state];
-		if (voltage->min_uV || voltage->max_uV)
-			return 0;
-	}
-
-	return regulator_suspend_toggle(rdev, state, false);
-}
-EXPORT_SYMBOL_GPL(regulator_suspend_disable);
-
 static int _regulator_set_suspend_voltage(struct regulator *regulator,
 					  int min_uV, int max_uV,
 					  suspend_state_t state)
diff --git a/include/linux/regulator/consumer.h b/include/linux/regulator/consumer.h
index 0e9275079e17..a5479de53906 100644
--- a/include/linux/regulator/consumer.h
+++ b/include/linux/regulator/consumer.h
@@ -258,10 +258,6 @@ void devm_regulator_unregister_notifier(struct regulator *regulator,
 					struct notifier_block *nb);
 
 /* regulator suspend */
-int regulator_suspend_enable(struct regulator_dev *rdev,
-			     suspend_state_t state);
-int regulator_suspend_disable(struct regulator_dev *rdev,
-			      suspend_state_t state);
 int regulator_set_suspend_voltage(struct regulator *regulator, int min_uV,
 				  int max_uV, suspend_state_t state);
 
@@ -608,18 +604,6 @@ static inline int devm_regulator_unregister_notifier(struct regulator *regulator
 	return 0;
 }
 
-static inline int regulator_suspend_enable(struct regulator_dev *rdev,
-					   suspend_state_t state)
-{
-	return -EINVAL;
-}
-
-static inline int regulator_suspend_disable(struct regulator_dev *rdev,
-					    suspend_state_t state)
-{
-	return -EINVAL;
-}
-
 static inline int regulator_set_suspend_voltage(struct regulator *regulator,
 						int min_uV, int max_uV,
 						suspend_state_t state)
-- 
2.49.0

