Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40F78221F12;
	Fri, 20 Jun 2025 19:28:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750447738; cv=none; b=S0u9YqkA1zEqjMGM6sqr0Kq11AeucJGl/V2tHQ2lcobuLB/4/Vx4tp15sy46aqclY0Mi+nT//fPdGQAZZNb89G9CAZPykMU0GKfZefHH3eRnCvtgNfw2stviIForbyTUy86T/8cB8zSZwlk9bfdBoXM43v0Gz3b8Qv4EaUcp1ag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750447738; c=relaxed/simple;
	bh=9ZMgjZCPC+lBHp0QqotHidVX4Qfl3YhujfAoMy/663c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=A/ggOnnXD2gY7y9rrllQqsuZzapaqVx66l4LE6wrpdWp8Ys6ClyVlFjTfUkVXlxsaX1ODgBZ2O/RZDb1iep/nVNowBGZLtyEstNJs+0+5C7VjWU0ZnAMF71GjnpyF8Gq+cT4xTaebbUzqlbh+eu27E/yD/KIOmhCAjL+o3W7Du8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DDA9C16F2;
	Fri, 20 Jun 2025 12:28:35 -0700 (PDT)
Received: from pluto.fritz.box (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 255623F673;
	Fri, 20 Jun 2025 12:28:53 -0700 (PDT)
From: Cristian Marussi <cristian.marussi@arm.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org
Cc: sudeep.holla@arm.com,
	james.quinlan@broadcom.com,
	f.fainelli@gmail.com,
	vincent.guittot@linaro.org,
	etienne.carriere@st.com,
	peng.fan@oss.nxp.com,
	michal.simek@amd.com,
	quic_sibis@quicinc.com,
	dan.carpenter@linaro.org,
	d-gole@ti.com,
	souvik.chakravarty@arm.com,
	Cristian Marussi <cristian.marussi@arm.com>
Subject: [RFC PATCH 1/7] firmware: arm_scmi: Define a common SCMI_MAX_PROTOCOLS value
Date: Fri, 20 Jun 2025 20:28:07 +0100
Message-ID: <20250620192813.2463367-2-cristian.marussi@arm.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250620192813.2463367-1-cristian.marussi@arm.com>
References: <20250620192813.2463367-1-cristian.marussi@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a common definition of SCMI_MAX_PROTOCOLS and use it all over the
SCMI stack.

Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
---
 drivers/firmware/arm_scmi/notify.c | 4 +---
 include/linux/scmi_protocol.h      | 3 +++
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/firmware/arm_scmi/notify.c b/drivers/firmware/arm_scmi/notify.c
index e160ecb22948..27a53a6729dd 100644
--- a/drivers/firmware/arm_scmi/notify.c
+++ b/drivers/firmware/arm_scmi/notify.c
@@ -94,8 +94,6 @@
 #include "common.h"
 #include "notify.h"
 
-#define SCMI_MAX_PROTO		256
-
 #define PROTO_ID_MASK		GENMASK(31, 24)
 #define EVT_ID_MASK		GENMASK(23, 16)
 #define SRC_ID_MASK		GENMASK(15, 0)
@@ -1652,7 +1650,7 @@ int scmi_notification_init(struct scmi_handle *handle)
 	ni->gid = gid;
 	ni->handle = handle;
 
-	ni->registered_protocols = devm_kcalloc(handle->dev, SCMI_MAX_PROTO,
+	ni->registered_protocols = devm_kcalloc(handle->dev, SCMI_MAX_PROTOCOLS,
 						sizeof(char *), GFP_KERNEL);
 	if (!ni->registered_protocols)
 		goto err;
diff --git a/include/linux/scmi_protocol.h b/include/linux/scmi_protocol.h
index 688466a0e816..6f8d36e1f8fc 100644
--- a/include/linux/scmi_protocol.h
+++ b/include/linux/scmi_protocol.h
@@ -926,8 +926,11 @@ enum scmi_std_protocol {
 	SCMI_PROTOCOL_VOLTAGE = 0x17,
 	SCMI_PROTOCOL_POWERCAP = 0x18,
 	SCMI_PROTOCOL_PINCTRL = 0x19,
+	SCMI_PROTOCOL_LAST = 0xff,
 };
 
+#define SCMI_MAX_PROTOCOLS	(SCMI_PROTOCOL_LAST + 1)
+
 enum scmi_system_events {
 	SCMI_SYSTEM_SHUTDOWN,
 	SCMI_SYSTEM_COLDRESET,
-- 
2.47.0

