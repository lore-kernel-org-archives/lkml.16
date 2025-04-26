Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E942C25E44B;
	Sat, 26 Apr 2025 17:52:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.229.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745689951; cv=none; b=mF//9XnuUUuTTh+X1MvctBP4Vdj3xpkCYjgNQL8z0tPfnhk0TbfxSUgcJZ9qBcxV+KtoHao4ZtbZ+qjPLFcwOeV1mr6VRvaJuAMhaOwvoJpW8Ols7gCYLe4JEqmWiuTy86H7tIaIV2DWbbTdkxBZh9Po7epeYaZ27LT6nEm5DYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745689951; c=relaxed/simple;
	bh=NAt10LZBeqEWHfZdM5eVz5PYKVVcgF6L19KxgNYKQ5U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cFA0J8UvewSynWnPviyTaC4r25tSEpSSST2o7DN5MyyVmXJ8fsTYAJGWiUXmAEKRqg9uFZ/HktA0s2Nqst50YjpQggVl1CrkdbegMwztmJOmEBCd/732aea+XZ5D8KbSS/jxbyWqwl1wRUrwukPvuFj9kdpzcxWyppwlO265jHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org; spf=pass smtp.mailfrom=treblig.org; dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b=IC3EpR6c; arc=none smtp.client-ip=46.235.229.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=treblig.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b="IC3EpR6c"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=MIME-Version:Message-ID:Date:Subject:From:Content-Type:From
	:Subject; bh=hoQcdVh4NTeufFeA4Okoft80aRjA9PYTz59tnqkdNKk=; b=IC3EpR6co+J+FAVF
	DD4X8ia3/bZQ0wFu0pPJX1EDme9q7MaVdVBsq+VdfgNVzSPmUE1d+dNTQF2qTuxEW1jlDqErhFzdx
	gCJcGF1B6vUvNQQEmR/GfjRPhBObHUGd8Kth3L4SN2zLrtLxFhtLqSxcHq0I7CuaGEebQbBDeOz7S
	hxsLZPN32KC/GbGDAUv++DjiekESrqs5gIVJqVKVPNV5eMOhFHblS/ZUspef6mh0lL/IAFhWz/RyD
	8Y9BOiqxr8iWapD+XLuRtkDNhRnk99A82Mu84Ao+bRIS4Uvz3sunO4gtMUAePkk89GfeY8lgloHsX
	FQaI6bCL5jrG9l/mGg==;
Received: from localhost ([127.0.0.1] helo=dalek.home.treblig.org)
	by mx.treblig.org with esmtp (Exim 4.96)
	(envelope-from <linux@treblig.org>)
	id 1u8jhS-00E44n-0L;
	Sat, 26 Apr 2025 17:52:26 +0000
From: linux@treblig.org
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: linux-doc@vger.kernel.org,
	corbet@lwn.net,
	linux-kernel@vger.kernel.org,
	"Dr. David Alan Gilbert" <linux@treblig.org>
Subject: [PATCH 3/5] regulator: core: Remove unused regulator_*drvdata functions
Date: Sat, 26 Apr 2025 18:51:41 +0100
Message-ID: <20250426175143.128086-4-linux@treblig.org>
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

regulator_get_init_drvdata() was added in 2008 by the
commit a5766f11cfd3 ("regulator: core - Rework machine API to remove string
based functions.")
regulator_set_drvdata() was also added in 2008 by the
commit 414c70cb91c4 ("regulator: regulator framework core")

neither have been used since,

Remove them.

Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
---
 drivers/regulator/core.c           | 17 -----------------
 include/linux/regulator/consumer.h |  6 ------
 include/linux/regulator/driver.h   |  1 -
 3 files changed, 24 deletions(-)

diff --git a/drivers/regulator/core.c b/drivers/regulator/core.c
index 32e3919e37d2..60c72d77f77a 100644
--- a/drivers/regulator/core.c
+++ b/drivers/regulator/core.c
@@ -6096,17 +6096,6 @@ void *regulator_get_drvdata(struct regulator *regulator)
 }
 EXPORT_SYMBOL_GPL(regulator_get_drvdata);
 
-/**
- * regulator_set_drvdata - set regulator driver data
- * @regulator: regulator
- * @data: data
- */
-void regulator_set_drvdata(struct regulator *regulator, void *data)
-{
-	regulator->rdev->reg_data = data;
-}
-EXPORT_SYMBOL_GPL(regulator_set_drvdata);
-
 /**
  * rdev_get_id - get regulator ID
  * @rdev: regulator
@@ -6131,12 +6120,6 @@ struct regmap *rdev_get_regmap(struct regulator_dev *rdev)
 }
 EXPORT_SYMBOL_GPL(rdev_get_regmap);
 
-void *regulator_get_init_drvdata(struct regulator_init_data *reg_init_data)
-{
-	return reg_init_data->driver_data;
-}
-EXPORT_SYMBOL_GPL(regulator_get_init_drvdata);
-
 #ifdef CONFIG_DEBUG_FS
 static int supply_map_show(struct seq_file *sf, void *data)
 {
diff --git a/include/linux/regulator/consumer.h b/include/linux/regulator/consumer.h
index 999eba865c20..0e9275079e17 100644
--- a/include/linux/regulator/consumer.h
+++ b/include/linux/regulator/consumer.h
@@ -267,7 +267,6 @@ int regulator_set_suspend_voltage(struct regulator *regulator, int min_uV,
 
 /* driver data - core doesn't touch */
 void *regulator_get_drvdata(struct regulator *regulator);
-void regulator_set_drvdata(struct regulator *regulator, void *data);
 
 /* misc helpers */
 
@@ -633,11 +632,6 @@ static inline void *regulator_get_drvdata(struct regulator *regulator)
 	return NULL;
 }
 
-static inline void regulator_set_drvdata(struct regulator *regulator,
-	void *data)
-{
-}
-
 static inline int regulator_count_voltages(struct regulator *regulator)
 {
 	return 0;
diff --git a/include/linux/regulator/driver.h b/include/linux/regulator/driver.h
index 4a216fdba354..e849bab379f2 100644
--- a/include/linux/regulator/driver.h
+++ b/include/linux/regulator/driver.h
@@ -765,7 +765,6 @@ int regulator_set_active_discharge_regmap(struct regulator_dev *rdev,
 int regulator_set_current_limit_regmap(struct regulator_dev *rdev,
 				       int min_uA, int max_uA);
 int regulator_get_current_limit_regmap(struct regulator_dev *rdev);
-void *regulator_get_init_drvdata(struct regulator_init_data *reg_init_data);
 int regulator_find_closest_bigger(unsigned int target, const unsigned int *table,
 				  unsigned int num_sel, unsigned int *sel);
 int regulator_set_ramp_delay_regmap(struct regulator_dev *rdev, int ramp_delay);
-- 
2.49.0

