Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CA5D1C07F5
	for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 11:25:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738322710; cv=none; b=t4f07xv97x36fRkO4IdCNVkJwGg27frPeX5QdXOHb4o+NJFi/azNtfDC80IxwnM5zbbucopkh4PFK79xW60AGXjYi7h9oY/u9tlzLV5zgtps9cDz+CVOi0ya5gjZxTF0KPCjfR8tr+paGa3PN7DDswsPrd1jArxzu4/zbFRHdWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738322710; c=relaxed/simple;
	bh=an0T8BaHmmjnOIWFrg0XcNclda/TDCEpL5ml8sjKwio=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To; b=S7ECavCd8ms11dAMb+avs8hdxxvZEwcNI8wRCQKcBDiuJyigm/O24iQ58iZEqDm+mzb1Aj6V7sEiijMQgl/VFQsRue3+BEAbGC1GNA/9k065pFD+Eu9Ktbj+g5djQUgvoo05hnXCQ37uZ5o3mlNyvLty5oWWTCeBgCnztUk4Y+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D07481007;
	Fri, 31 Jan 2025 03:25:33 -0800 (PST)
Received: from e133711.arm.com (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AB21C3F63F;
	Fri, 31 Jan 2025 03:25:07 -0800 (PST)
From: Sudeep Holla <sudeep.holla@arm.com>
Date: Fri, 31 Jan 2025 11:24:02 +0000
Subject: [PATCH v2 02/18] firmware: arm_ffa: Replace UUID buffer to
 standard UUID format
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250131-ffa_updates-v2-2-544ba4e35387@arm.com>
References: <20250131-ffa_updates-v2-0-544ba4e35387@arm.com>
In-Reply-To: <20250131-ffa_updates-v2-0-544ba4e35387@arm.com>
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Sudeep Holla <sudeep.holla@arm.com>, Viresh Kumar <viresh.kumar@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1783; i=sudeep.holla@arm.com;
 h=from:subject:message-id; bh=an0T8BaHmmjnOIWFrg0XcNclda/TDCEpL5ml8sjKwio=;
 b=owEBbQKS/ZANAwAIAQBBurwxfuKYAcsmYgBnnLMPvsTuXlYTc75Eg3d1Qp62BX2OhJ9rXBo1N
 ddU03iBR4OJAjMEAAEIAB0WIQS6ceUSBvMeskPdk+EAQbq8MX7imAUCZ5yzDwAKCRAAQbq8MX7i
 mIpVEACLNNX/8+chGpqM9MPBuCAooVDzcLaWm3lQnrrmEwQ+PbGHAqdrGo+tDKF7W3eklxpVXK7
 QAZvGsVXzkVbIdYQzRkn8N76ysNopUkNIC9fhVYfDCjNpxi1QazaeusfyskztdqRGURwP4wDnJt
 zDA6skVjvdoOiBDHRWvkdZ/7lXu/EL4QPDvyusVYiK9LCUOUEpZGaVYI13+IWGbqtstufisPX/F
 rFQgM9iKwPiAJ1EFxc1xkauvDcHaiwt+f6FvWW+xq4TrXg1+DcYV3OdxxWzQGSnSFIl+5UHSTg4
 0z3Tu4jeS8hysbBtN4Baih0/BNBQVrsgf287rYs+VxaUHnQSQUmS7oqtCBwj8lMf2POxbh32g+W
 02+z0tsk4nnLIOs2fcYwUm+O0Q1/ANrkwteaX0AHJuS+PbDvnFJJYalYwC/auIO0gBFh1u2sof4
 LbGiZRBiaVo0Kc2uEMXGd+GuqCykagTct9ZQQlD/E53ihlO0a/5vY2ghCYDjFHoJhUfwltAKLfV
 g0fUt0OZ6OtOWOt2215nBo9lM5zgXeY1RNwph/jfD7KWUHRfQQTtCLX1JCaJo6dhUsTmJ8FJxze
 tujiPj20cDuAGsCbQO45fcnRath7xuX5D/wtFSEnyLVvp84IP3o4dqb7cz+PiKS7Ujy6tAzugpP
 WdXWHUZHAJ2ooxw==
X-Developer-Key: i=sudeep.holla@arm.com; a=openpgp;
 fpr=7360A21742ADF5A11767C1C139CFD4755FE2D5B4

Currently ffa_partition_info structure holds the UUID in the format
compatible with the firmware interface. However, most of the functions
in the FF-A core driver deals directly with uuid_t type.

Replace UUID buffer to standard UUID format in the ffa_partition_info
structure.

Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
---
 drivers/firmware/arm_ffa/bus.c | 4 +---
 include/linux/arm_ffa.h        | 2 +-
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/firmware/arm_ffa/bus.c b/drivers/firmware/arm_ffa/bus.c
index 52b1f09209a0e51e321cd23a69aa7e4c4daa8dd1..a90e2faa990219574ff20b8f573dbb7ca76137d9 100644
--- a/drivers/firmware/arm_ffa/bus.c
+++ b/drivers/firmware/arm_ffa/bus.c
@@ -192,7 +192,6 @@ ffa_device_register(const struct ffa_partition_info *part_info,
 		    const struct ffa_ops *ops)
 {
 	int id, ret;
-	uuid_t uuid;
 	struct device *dev;
 	struct ffa_device *ffa_dev;
 
@@ -218,8 +217,7 @@ ffa_device_register(const struct ffa_partition_info *part_info,
 	ffa_dev->vm_id = part_info->id;
 	ffa_dev->properties = part_info->properties;
 	ffa_dev->ops = ops;
-	import_uuid(&uuid, (u8 *)part_info->uuid);
-	uuid_copy(&ffa_dev->uuid, &uuid);
+	uuid_copy(&ffa_dev->uuid, &part_info->uuid);
 
 	ret = device_register(&ffa_dev->dev);
 	if (ret) {
diff --git a/include/linux/arm_ffa.h b/include/linux/arm_ffa.h
index 74169dd0f65948b05991732358855cdc31b54adb..abd0208f0f74c15ef4ee4c81de81eb7800a0eb1d 100644
--- a/include/linux/arm_ffa.h
+++ b/include/linux/arm_ffa.h
@@ -238,7 +238,7 @@ struct ffa_partition_info {
 /* partition runs in the AArch64 execution state. */
 #define FFA_PARTITION_AARCH64_EXEC	BIT(8)
 	u32 properties;
-	u32 uuid[4];
+	uuid_t uuid;
 };
 
 static inline

-- 
2.34.1

