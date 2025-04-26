Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C91CC25DD1B;
	Sat, 26 Apr 2025 17:52:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.229.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745689967; cv=none; b=U3cQDMtnxb1LMr/8GEMtkz4cNDLjE1LXd4h3XmkNLDpLPyu2uOpf9lpb9P0r3O4Hg1K1UzBr+CJ6f08X9BybYVKMcYB+bwTDrSslQlo5JLLeTwaS+EL4hoNc7cxBSKqUNyFcy1rqRQNsFSklm1JEo4O+x4h3/90Nlx2BgfZT2mU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745689967; c=relaxed/simple;
	bh=8w+rNR6eu8fY+v+RULFbSJzlXnJopNHfRtWnyLB7khA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=J+Kigylfa2EmT+KR+3N7G2mITo4hdIe8DNaduBWCX00Mjb00elr40WnJd5gwRFUKR/p9Fx1l4XvNyGEC0d8/E/btZbh5AuZuqmfBN4mnE9nAumQUUeSxGje9Z0EKF6l4rcsU2QQzonweydeO9izKZp282E8n5mWJBbjOeVJPVJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org; spf=pass smtp.mailfrom=treblig.org; dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b=VsB/dk91; arc=none smtp.client-ip=46.235.229.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=treblig.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b="VsB/dk91"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=MIME-Version:Message-ID:Date:Subject:From:Content-Type:From
	:Subject; bh=RMpr1kjjVDMlujzzN7oLiP/WXryaePyGDqrdliHt/k4=; b=VsB/dk91gxtcR663
	du6HypK+wTqplfOslMFi+1Xw+loPFzKehTVFd+pmrrcWtgMYaLUQT9ab+RPk6kWGJ4BEALGeUBVU7
	AwWSt7aLTKw9nHGWXp6ClgaFH1/4wnEcGRiDyAl0EOy0w0yF3t7X/WHCx/CrmHVydmpq5D7smcd2l
	e4sZ+JT/j2Rr2GCbzUQ/EehwYdPy3BYsf6k8CF5dTqRv/VNREdzCtOzZTFIfxSw7tz1XW/Jx7mNXf
	sFXfgsJiB6IBjH3plkIIEfkNtzaC8aPQbR22mTVO6L0lui3lvT2GLds1jVRXHuBW/mcJMQCngR6jB
	xfTME92v2KPLTeRTbg==;
Received: from localhost ([127.0.0.1] helo=dalek.home.treblig.org)
	by mx.treblig.org with esmtp (Exim 4.96)
	(envelope-from <linux@treblig.org>)
	id 1u8jhg-00E44n-2S;
	Sat, 26 Apr 2025 17:52:40 +0000
From: linux@treblig.org
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: linux-doc@vger.kernel.org,
	corbet@lwn.net,
	linux-kernel@vger.kernel.org,
	"Dr. David Alan Gilbert" <linux@treblig.org>
Subject: [PATCH 5/5] regulator: core: Remove unused regulator_set_suspend_voltage
Date: Sat, 26 Apr 2025 18:51:43 +0100
Message-ID: <20250426175143.128086-6-linux@treblig.org>
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

regulator_set_suspend_voltage() was added as part of 2018's
commit f7efad10b5c4 ("regulator: add PM suspend and resume hooks")
but is unused.

Remove it, and the helpers it's the only user of.

Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
---
 drivers/regulator/core.c           | 46 ------------------------------
 include/linux/regulator/consumer.h | 11 -------
 2 files changed, 57 deletions(-)

diff --git a/drivers/regulator/core.c b/drivers/regulator/core.c
index 90449f387b98..a0d740a565a6 100644
--- a/drivers/regulator/core.c
+++ b/drivers/regulator/core.c
@@ -446,12 +446,6 @@ int regulator_check_voltage(struct regulator_dev *rdev,
 	return 0;
 }
 
-/* return 0 if the state is valid */
-static int regulator_check_states(suspend_state_t state)
-{
-	return (state > PM_SUSPEND_MAX || state == PM_SUSPEND_TO_IDLE);
-}
-
 /* Make sure we select a voltage that suits the needs of all
  * regulator consumers
  */
@@ -4244,46 +4238,6 @@ int regulator_set_voltage(struct regulator *regulator, int min_uV, int max_uV)
 }
 EXPORT_SYMBOL_GPL(regulator_set_voltage);
 
-static int _regulator_set_suspend_voltage(struct regulator *regulator,
-					  int min_uV, int max_uV,
-					  suspend_state_t state)
-{
-	struct regulator_dev *rdev = regulator->rdev;
-	struct regulator_state *rstate;
-
-	rstate = regulator_get_suspend_state(rdev, state);
-	if (rstate == NULL)
-		return -EINVAL;
-
-	if (rstate->min_uV == rstate->max_uV) {
-		rdev_err(rdev, "The suspend voltage can't be changed!\n");
-		return -EPERM;
-	}
-
-	return regulator_set_voltage_unlocked(regulator, min_uV, max_uV, state);
-}
-
-int regulator_set_suspend_voltage(struct regulator *regulator, int min_uV,
-				  int max_uV, suspend_state_t state)
-{
-	struct ww_acquire_ctx ww_ctx;
-	int ret;
-
-	/* PM_SUSPEND_ON is handled by regulator_set_voltage() */
-	if (regulator_check_states(state) || state == PM_SUSPEND_ON)
-		return -EINVAL;
-
-	regulator_lock_dependent(regulator->rdev, &ww_ctx);
-
-	ret = _regulator_set_suspend_voltage(regulator, min_uV,
-					     max_uV, state);
-
-	regulator_unlock_dependent(regulator->rdev, &ww_ctx);
-
-	return ret;
-}
-EXPORT_SYMBOL_GPL(regulator_set_suspend_voltage);
-
 /**
  * regulator_set_voltage_time - get raise/fall time
  * @regulator: regulator source
diff --git a/include/linux/regulator/consumer.h b/include/linux/regulator/consumer.h
index a5479de53906..3383a6de58d1 100644
--- a/include/linux/regulator/consumer.h
+++ b/include/linux/regulator/consumer.h
@@ -257,10 +257,6 @@ int regulator_unregister_notifier(struct regulator *regulator,
 void devm_regulator_unregister_notifier(struct regulator *regulator,
 					struct notifier_block *nb);
 
-/* regulator suspend */
-int regulator_set_suspend_voltage(struct regulator *regulator, int min_uV,
-				  int max_uV, suspend_state_t state);
-
 /* driver data - core doesn't touch */
 void *regulator_get_drvdata(struct regulator *regulator);
 
@@ -604,13 +600,6 @@ static inline int devm_regulator_unregister_notifier(struct regulator *regulator
 	return 0;
 }
 
-static inline int regulator_set_suspend_voltage(struct regulator *regulator,
-						int min_uV, int max_uV,
-						suspend_state_t state)
-{
-	return -EINVAL;
-}
-
 static inline void *regulator_get_drvdata(struct regulator *regulator)
 {
 	return NULL;
-- 
2.49.0

