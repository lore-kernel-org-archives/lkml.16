Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D6751581EE
	for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 11:25:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738322710; cv=none; b=gZFSonCVg5lWaKAW351NNP7fAsW/7vqVXD1JIPj36l2OUfArfWqJRuWtjVNWj6JM70PuDXhZlKJ64m8AX+xvkD04ilXdKGcISMH5Bq4iWddd4TvX9Z64vYWp+q5q5QZ0ercs8oKcmrvYa1djJxvkaLEU/suDFpDsqp/1LkHgOdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738322710; c=relaxed/simple;
	bh=F0mUi+DToOzDCZQ+Cn7ewDbLcZibROUf9A/AQezLWS0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To; b=Rb0D0CYkmWmKEz1dXhTXRVG5WvK1a3KeUGv4eRGv18GaVgTcOiFkiQhyZmeDgp6EmiFbZHBnNQHf9bLKt2yJcMTwGRtHBORHef+lUPJKo84Lz3E3xvWvY2ftdjxFNNuQMijGhFPYrB0VDwJNteWDgfy3Hepf8OyhzT7g/1hE9no=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C9BCFFEC;
	Fri, 31 Jan 2025 03:25:32 -0800 (PST)
Received: from e133711.arm.com (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A52C23F63F;
	Fri, 31 Jan 2025 03:25:06 -0800 (PST)
From: Sudeep Holla <sudeep.holla@arm.com>
Date: Fri, 31 Jan 2025 11:24:01 +0000
Subject: [PATCH v2 01/18] firmware: arm_ffa: Replace SCMI by FF-A in the
 macro
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250131-ffa_updates-v2-1-544ba4e35387@arm.com>
References: <20250131-ffa_updates-v2-0-544ba4e35387@arm.com>
In-Reply-To: <20250131-ffa_updates-v2-0-544ba4e35387@arm.com>
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Sudeep Holla <sudeep.holla@arm.com>, Viresh Kumar <viresh.kumar@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1548; i=sudeep.holla@arm.com;
 h=from:subject:message-id; bh=F0mUi+DToOzDCZQ+Cn7ewDbLcZibROUf9A/AQezLWS0=;
 b=owEBbQKS/ZANAwAIAQBBurwxfuKYAcsmYgBnnLMPHU0BHBADhcUbjEDO5bElZzu4c8yq1eRlV
 dx2WhQzW1yJAjMEAAEIAB0WIQS6ceUSBvMeskPdk+EAQbq8MX7imAUCZ5yzDwAKCRAAQbq8MX7i
 mB8YD/4kyPIAVsx80cJp2NPKX7f5qxVzLjzZzMNN++CP1xKfIOW+r44nTZTgLy4UdBUg5q1pPdX
 X6nz1YIlZ8mD2YcY5tYSdg8NrTaFXf80oPI4ikreyqpaCPHYh3u9od44kesatM8JrlqeEQvKRg3
 NXW/5J/wxil2TK7VY4dLNgOOujsgH9E3LrbIRYYFKx3/CWTSzpkprItloXO4VNq2PGuVCvdGQeT
 71lacqAfSQM7BEc/kNy744L2yEnRY05I/laQo+k04IdjtMhs8I30eozX1BkjDq0eFYLwCB6ZD9p
 istKdpa/DzqTr5GwS/CN2vcbNABilzXS3kFwLT0Vr81iuvfxAal1+oYNIsAA7F73y6wKz3ac6BX
 1vlpNN68jF/1yw71n70jUEzvz7HbBxWgpaePtuyoZGjJs5ha28T31GO20XZwn6wrWWXg5KMHHzB
 XwTzMmH74zpd9qx77x3vgoIV+6M+mjA1hzXN3QsSs3tOHGEPJ3mExUCBzuh2n3Y/YPR2CS5J17v
 2VWArp6Yt+6l0XSxQLQVlGCuW9FP7VL2yqSuFytJ+jt7C3bxh/83PYv/skPj9MIwzUMKWOBdBc4
 yWRcawxarc3kd9kYiX7BjnSe0c1cKVWPB2LCPxKyYCv9Ip1TwAfkQMaXd9zDUrLtzGl0NXcrYCe
 Jnf4nLuX/kPRVkg==
X-Developer-Key: i=sudeep.holla@arm.com; a=openpgp;
 fpr=7360A21742ADF5A11767C1C139CFD4755FE2D5B4

Commit 22779149e93d ("firmware: arm_ffa: Emit modalias for FF-A devices")
added modalias for FF-A devices. However the macro added used SCMI
incorrectly. Replace the reference to SCMI by FF-A and update the macro.
(i.e. s/SCMI/FFA/)

No functional change.

Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
---
 drivers/firmware/arm_ffa/bus.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/firmware/arm_ffa/bus.c b/drivers/firmware/arm_ffa/bus.c
index dfda5ffc14db7208e8b622cdd648194c9cb1ef34..52b1f09209a0e51e321cd23a69aa7e4c4daa8dd1 100644
--- a/drivers/firmware/arm_ffa/bus.c
+++ b/drivers/firmware/arm_ffa/bus.c
@@ -15,7 +15,7 @@
 
 #include "common.h"
 
-#define SCMI_UEVENT_MODALIAS_FMT	"arm_ffa:%04x:%pUb"
+#define FFA_UEVENT_MODALIAS_FMT	"arm_ffa:%04x:%pUb"
 
 static DEFINE_IDA(ffa_bus_id);
 
@@ -68,7 +68,7 @@ static int ffa_device_uevent(const struct device *dev, struct kobj_uevent_env *e
 {
 	const struct ffa_device *ffa_dev = to_ffa_dev(dev);
 
-	return add_uevent_var(env, "MODALIAS=" SCMI_UEVENT_MODALIAS_FMT,
+	return add_uevent_var(env, "MODALIAS=" FFA_UEVENT_MODALIAS_FMT,
 			      ffa_dev->vm_id, &ffa_dev->uuid);
 }
 
@@ -77,7 +77,7 @@ static ssize_t modalias_show(struct device *dev,
 {
 	struct ffa_device *ffa_dev = to_ffa_dev(dev);
 
-	return sysfs_emit(buf, SCMI_UEVENT_MODALIAS_FMT, ffa_dev->vm_id,
+	return sysfs_emit(buf, FFA_UEVENT_MODALIAS_FMT, ffa_dev->vm_id,
 			  &ffa_dev->uuid);
 }
 static DEVICE_ATTR_RO(modalias);

-- 
2.34.1

