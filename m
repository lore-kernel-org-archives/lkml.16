Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6EE91CEE8D
	for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 11:25:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738322719; cv=none; b=gA+tbTlCVgzOgF0BL4Yf4LJp5gJHf3Gum9I3XQndWasSxDPpyZjTvB+4wIAJkuYCopqnH7HRxMZ3XoprlCMCg46orxS8W3Fe5CdN95RH6NQfI7JonCxgkd5FBrYG+syWncxvdZnTPcpfXGqC0tN8FmD1G4zuG7tHaAvTQwpRy6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738322719; c=relaxed/simple;
	bh=eazUrEHzI9tgu7HGeZo00Su8OKcdX3GAHEGm8aY/0lo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To; b=IZd+mKLCu4XaqBQ0Hm2ScMOJ+9F+cUbrLYkBsIZ3efUdzp7g18Q4jzZVhTDdizY/tg0PM5aNTJxrpCKOqsjsPshfLnixp/yF759QVJJ/GtwmUWeLNneXdimT1c1cZsTfWazTaWMqe8HPpwNIfHvdWeu+enMEiWKGN/ylO8Zp0Pg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 11B401007;
	Fri, 31 Jan 2025 03:25:43 -0800 (PST)
Received: from e133711.arm.com (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E128E3F63F;
	Fri, 31 Jan 2025 03:25:16 -0800 (PST)
From: Sudeep Holla <sudeep.holla@arm.com>
Date: Fri, 31 Jan 2025 11:24:11 +0000
Subject: [PATCH v2 11/18] firmware: arm_ffa: Upgrade FF-A version to v1.2
 in the driver
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250131-ffa_updates-v2-11-544ba4e35387@arm.com>
References: <20250131-ffa_updates-v2-0-544ba4e35387@arm.com>
In-Reply-To: <20250131-ffa_updates-v2-0-544ba4e35387@arm.com>
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Sudeep Holla <sudeep.holla@arm.com>, Viresh Kumar <viresh.kumar@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1372; i=sudeep.holla@arm.com;
 h=from:subject:message-id; bh=eazUrEHzI9tgu7HGeZo00Su8OKcdX3GAHEGm8aY/0lo=;
 b=owEBbQKS/ZANAwAIAQBBurwxfuKYAcsmYgBnnLMQduI8J2ZBF/yjeq/uoVdCw7wEPbFdQjDr/
 m5zy7spEcyJAjMEAAEIAB0WIQS6ceUSBvMeskPdk+EAQbq8MX7imAUCZ5yzEAAKCRAAQbq8MX7i
 mDfZD/0bKrdYu/vpeuu6kBgWsDBaaRfdKZ59GwkwC87iz0SXQYmWpu6tZWe71+TmJJhtx4HLwiX
 ElAQDv7+MvEjboXR2IcTgzMiAYg30ysRk5QYo4/M+QU25gM/APQhWoI/kZpuV65LI52532Jk/8C
 2kWXvhJCwc6ZzKTZQVzlsvlUyZgOyQ1puX6p+JQYwRoVI2fug485dj9tHWsCrdgJ8kSDpPwAdrG
 j8SGnd0R8P9dPMy7OcQJz4fugW7aGzu8qqxDdBbzt75STbAZ2Tt+J7hOMU3q1xNgv16a2krB1Id
 MqkhdnzRljShO0oT7wpu0mPf9Iu1r9wukiIXtG7meCKv0SW+KGCkYYum8T9khTkpQejpUFem0DL
 uIZqhC9mZ92OYJhWSjRor6TsraeyfE30pWlg4PQUlCvIrc2rI6e1j0Qdx9bnS+j6S10c0MXdccU
 uWKGNMYx8T5l1ONQv2h0Y3hhAqbGhe5vC9Rp3J36pHDIFG2L7j36MqiFMxFidZR580SAE01szIS
 AtVEWIV2TaXDf0qYft8LaW5yrJ3591gWzXS80pc3jtJFKVXKRx4I8Ld9tIY3WSs1mDwGaIdxcC3
 U1ksvimT3Or4xYoRsbg22O4PmajhypXQ/6rBuY2OWK40AFMfrKRXDUfculbF4NGkazus2CrN6Om
 0OkIWNOtbWb4zjA==
X-Developer-Key: i=sudeep.holla@arm.com; a=openpgp;
 fpr=7360A21742ADF5A11767C1C139CFD4755FE2D5B4

The basic and mandatory features of FF-A v1.2 are all supported now.
The driver supported version can be bumped from v1.1 to v1.2

Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
---
 drivers/firmware/arm_ffa/driver.c | 2 +-
 include/linux/arm_ffa.h           | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/firmware/arm_ffa/driver.c b/drivers/firmware/arm_ffa/driver.c
index cbe0fe5f22bd8c60f3070f5e45d8722e3c9c23c8..8188c8dd3ed6ceb9e9966148b42ef2f88baa6dd3 100644
--- a/drivers/firmware/arm_ffa/driver.c
+++ b/drivers/firmware/arm_ffa/driver.c
@@ -44,7 +44,7 @@
 
 #include "common.h"
 
-#define FFA_DRIVER_VERSION	FFA_VERSION_1_1
+#define FFA_DRIVER_VERSION	FFA_VERSION_1_2
 #define FFA_MIN_VERSION		FFA_VERSION_1_0
 
 #define SENDER_ID_MASK		GENMASK(31, 16)
diff --git a/include/linux/arm_ffa.h b/include/linux/arm_ffa.h
index bd78deeff284e2f46d42cfc7af218f4a0f3d1478..4fcbdc70cbc985eabb90733329c974384d229053 100644
--- a/include/linux/arm_ffa.h
+++ b/include/linux/arm_ffa.h
@@ -112,6 +112,7 @@
 	 FIELD_PREP(FFA_MINOR_VERSION_MASK, (minor)))
 #define FFA_VERSION_1_0		FFA_PACK_VERSION_INFO(1, 0)
 #define FFA_VERSION_1_1		FFA_PACK_VERSION_INFO(1, 1)
+#define FFA_VERSION_1_2		FFA_PACK_VERSION_INFO(1, 2)
 
 /**
  * FF-A specification mentions explicitly about '4K pages'. This should

-- 
2.34.1

