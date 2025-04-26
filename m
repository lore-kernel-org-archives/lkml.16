Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B1571DE883;
	Sat, 26 Apr 2025 17:52:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.229.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745689947; cv=none; b=siVvjcKjKSfhG7LkmsaUK2tNgkePXUL1u8Us5tVjQa4e4TNHuRs2rke4wV+L1oBAf1ZrER8xuA2hq54XfL7XV8zteIQ3KCdc1O+q996ZCIEMjXAdzck20HKvRHKVyzgzweudouDSRqf1GF6dnDP0/IFmlrHBFeD7wfTbiI9cAYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745689947; c=relaxed/simple;
	bh=/uh2f4BTN14XsIz3+Nr7E4au5x2/32t2+an01LvJun4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RUbZ2BPzusribIpWy8aanHnHB/tBOxcL9v2Fsnjc9tfxBEYS5oYElxv+dXIzFrDp3rcBZyJOJ5lR5uIolusIo+WxiM/LmU5NAAM1YyJTSUeQEDVRFJXltambgYshFHdzblL1BvD2AX8u/2/aEZ/bzIxkKSo2QVyQZLyFFXX5UF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org; spf=pass smtp.mailfrom=treblig.org; dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b=XOTd83cc; arc=none smtp.client-ip=46.235.229.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=treblig.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b="XOTd83cc"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=MIME-Version:Message-ID:Date:Subject:From:Content-Type:From
	:Subject; bh=/o189ne/jQPGYgD8OUPO8z1q2TFdEwQ0I6J22Cp9OBY=; b=XOTd83ccw1btb6QK
	Bq4TZoXSQGpP+XSRzoAlI6OQwXA4lA8ZtRQvbFcfmVUGWNzLKSa+/Qsj/AMIbG0un5UtxvpWGBV90
	dIorF6SR17LBjCZXQXFAHXb4xRk9zHfB1ySJ4eZlPB4iHjucWTDOAFtwRfC9jYX6QvcyI/cjI57Pp
	9XGevhqBJhRTIixikvdkv8L1OE+NWs1boIalWKvAmroK1bomG5iLqhVKHpBh2YajN0OmRyRkOSp0X
	EcjNLY0tdLppRJdSPcyvjf5xjFbxjxlDM9jFTanqKaVpKenLHVpTATRs6ooAUzNsr9pe+T86ArBMl
	UVyXMlVoQcafSxYwJA==;
Received: from localhost ([127.0.0.1] helo=dalek.home.treblig.org)
	by mx.treblig.org with esmtp (Exim 4.96)
	(envelope-from <linux@treblig.org>)
	id 1u8jhN-00E44n-06;
	Sat, 26 Apr 2025 17:52:21 +0000
From: linux@treblig.org
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: linux-doc@vger.kernel.org,
	corbet@lwn.net,
	linux-kernel@vger.kernel.org,
	"Dr. David Alan Gilbert" <linux@treblig.org>
Subject: [PATCH 2/5] regulator: core: Remove unused regulator_bulk_force_disable
Date: Sat, 26 Apr 2025 18:51:40 +0100
Message-ID: <20250426175143.128086-3-linux@treblig.org>
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

regulator_bulk_force_disable() was explicitly added in 2012 by
commit e1de2f423462 ("regulator: add regulator_bulk_force_disable
function")

but hasn't been used.

Remove it.

Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
---
 drivers/regulator/core.c           | 34 ------------------------------
 include/linux/regulator/consumer.h |  8 -------
 2 files changed, 42 deletions(-)

diff --git a/drivers/regulator/core.c b/drivers/regulator/core.c
index 90629a756693..32e3919e37d2 100644
--- a/drivers/regulator/core.c
+++ b/drivers/regulator/core.c
@@ -5196,40 +5196,6 @@ int regulator_bulk_disable(int num_consumers,
 }
 EXPORT_SYMBOL_GPL(regulator_bulk_disable);
 
-/**
- * regulator_bulk_force_disable - force disable multiple regulator consumers
- *
- * @num_consumers: Number of consumers
- * @consumers:     Consumer data; clients are stored here.
- *
- * This convenience API allows consumers to forcibly disable multiple regulator
- * clients in a single API call.
- * NOTE: This should be used for situations when device damage will
- * likely occur if the regulators are not disabled (e.g. over temp).
- * Although regulator_force_disable function call for some consumers can
- * return error numbers, the function is called for all consumers.
- *
- * Return: 0 on success or a negative error number on failure.
- */
-int regulator_bulk_force_disable(int num_consumers,
-			   struct regulator_bulk_data *consumers)
-{
-	int i;
-	int ret = 0;
-
-	for (i = 0; i < num_consumers; i++) {
-		consumers[i].ret =
-			    regulator_force_disable(consumers[i].consumer);
-
-		/* Store first error for reporting */
-		if (consumers[i].ret && !ret)
-			ret = consumers[i].ret;
-	}
-
-	return ret;
-}
-EXPORT_SYMBOL_GPL(regulator_bulk_force_disable);
-
 /**
  * regulator_bulk_free - free multiple regulator consumers
  *
diff --git a/include/linux/regulator/consumer.h b/include/linux/regulator/consumer.h
index 1e20c7330cd4..999eba865c20 100644
--- a/include/linux/regulator/consumer.h
+++ b/include/linux/regulator/consumer.h
@@ -209,8 +209,6 @@ int devm_regulator_bulk_get_enable(struct device *dev, int num_consumers,
 				   const char * const *id);
 int regulator_bulk_disable(int num_consumers,
 			   struct regulator_bulk_data *consumers);
-int regulator_bulk_force_disable(int num_consumers,
-			   struct regulator_bulk_data *consumers);
 void regulator_bulk_free(int num_consumers,
 			 struct regulator_bulk_data *consumers);
 
@@ -470,12 +468,6 @@ static inline int regulator_bulk_disable(int num_consumers,
 	return 0;
 }
 
-static inline int regulator_bulk_force_disable(int num_consumers,
-					struct regulator_bulk_data *consumers)
-{
-	return 0;
-}
-
 static inline void regulator_bulk_free(int num_consumers,
 				       struct regulator_bulk_data *consumers)
 {
-- 
2.49.0

