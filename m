Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A5012512FC;
	Fri, 25 Apr 2025 12:53:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745585606; cv=none; b=LmpGDeaJXROrz0khtEqm5lyjPMWnaNnpReJelqd/GA+LEHSYEdTOa8oN/cxwbvT7TQ55RzqqQTX/mkaA8mUor/SQEJYm0EROOXj+VbyjgogO0HilYIECJZyKkPPSwGWXpFqi8P67Rm2HmBt46s8OzW5N6rS5aMY5wKCxThF8QoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745585606; c=relaxed/simple;
	bh=arctqHiIywNbfj4fQK7aS63ifAk/uioKQr9Lz4NYF5w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DFhfAlzCqjmQJCy64+WLh/PDulRohJF8cesqp+pQk/I5dmfOucxUAsthfe62NUoUZ6Y3zYQtueNMjpKO9Q32sxkwAeUiQLzrCzIGHk5TNqlmj0sp+djHV376cAhr38Dn6hhQFQr8IXk/hbzLSMY3nbQd2+uNo5pBUg6pW0ayPPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3AE2C168F;
	Fri, 25 Apr 2025 05:53:17 -0700 (PDT)
Received: from pluto.. (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CC82D3F59E;
	Fri, 25 Apr 2025 05:53:19 -0700 (PDT)
From: Cristian Marussi <cristian.marussi@arm.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org
Cc: sudeep.holla@arm.com,
	james.quinlan@broadcom.com,
	f.fainelli@gmail.com,
	vincent.guittot@linaro.org,
	peng.fan@oss.nxp.com,
	michal.simek@amd.com,
	quic_sibis@quicinc.com,
	dan.carpenter@linaro.org,
	maz@kernel.org,
	johan@kernel.org,
	Cristian Marussi <cristian.marussi@arm.com>
Subject: [PATCH v2 3/4] firmware: arm_scmi: quirk: Fix CLOCK_DESCRIBE_RATES triplet
Date: Fri, 25 Apr 2025 13:52:49 +0100
Message-ID: <20250425125250.1847711-4-cristian.marussi@arm.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250425125250.1847711-1-cristian.marussi@arm.com>
References: <20250425125250.1847711-1-cristian.marussi@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert an existing quirk in CLOCK_DESCRIBE_RATES parsing to the new quirk
framework. This is a sort of a peculiar quirk since it matches any platform
and any firmware.

Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
---
V1 -> V2
- reduced the quirk size by placing the warn outside
- using new compatibles conditions
---
 drivers/firmware/arm_scmi/clock.c  | 33 ++++++++++++++++++------------
 drivers/firmware/arm_scmi/quirks.c |  2 ++
 drivers/firmware/arm_scmi/quirks.h |  3 +++
 3 files changed, 25 insertions(+), 13 deletions(-)

diff --git a/drivers/firmware/arm_scmi/clock.c b/drivers/firmware/arm_scmi/clock.c
index 2ed2279388f0..afa7981efe82 100644
--- a/drivers/firmware/arm_scmi/clock.c
+++ b/drivers/firmware/arm_scmi/clock.c
@@ -11,6 +11,7 @@
 
 #include "protocols.h"
 #include "notify.h"
+#include "quirks.h"
 
 /* Updated only after ALL the mandatory features for that version are merged */
 #define SCMI_PROTOCOL_SUPPORTED_VERSION		0x30000
@@ -429,6 +430,23 @@ static void iter_clk_describe_prepare_message(void *message,
 	msg->rate_index = cpu_to_le32(desc_index);
 }
 
+#define QUIRK_OUT_OF_SPEC_TRIPLET					       \
+	({								       \
+		/*							       \
+		 * A known quirk: a triplet is returned but num_returned != 3  \
+		 * Check for a safe payload size and fix.		       \
+		 */							       \
+		if (st->num_returned != 3 && st->num_remaining == 0 &&	       \
+		    st->rx_len == sizeof(*r) + sizeof(__le32) * 2 * 3) {       \
+			st->num_returned = 3;				       \
+			st->num_remaining = 0;				       \
+		} else {						       \
+			dev_err(p->dev,					       \
+				"Cannot fix out-of-spec reply !\n");	       \
+			return -EPROTO;					       \
+		}							       \
+	})
+
 static int
 iter_clk_describe_update_state(struct scmi_iterator_state *st,
 			       const void *response, void *priv)
@@ -450,19 +468,8 @@ iter_clk_describe_update_state(struct scmi_iterator_state *st,
 			 p->clk->name, st->num_returned, st->num_remaining,
 			 st->rx_len);
 
-		/*
-		 * A known quirk: a triplet is returned but num_returned != 3
-		 * Check for a safe payload size and fix.
-		 */
-		if (st->num_returned != 3 && st->num_remaining == 0 &&
-		    st->rx_len == sizeof(*r) + sizeof(__le32) * 2 * 3) {
-			st->num_returned = 3;
-			st->num_remaining = 0;
-		} else {
-			dev_err(p->dev,
-				"Cannot fix out-of-spec reply !\n");
-			return -EPROTO;
-		}
+		SCMI_QUIRK(clock_rates_triplet_out_of_spec,
+			   QUIRK_OUT_OF_SPEC_TRIPLET);
 	}
 
 	return 0;
diff --git a/drivers/firmware/arm_scmi/quirks.c b/drivers/firmware/arm_scmi/quirks.c
index 9e93a8242182..120ac933ed2e 100644
--- a/drivers/firmware/arm_scmi/quirks.c
+++ b/drivers/firmware/arm_scmi/quirks.c
@@ -167,6 +167,7 @@ struct scmi_quirk {
 	__DEFINE_SCMI_QUIRK_ENTRY(_qn, _ven, _sub, _impl, ##__VA_ARGS__)
 
 /* Global Quirks Definitions */
+DEFINE_SCMI_QUIRK(clock_rates_triplet_out_of_spec, NULL, NULL, NULL);
 
 /*
  * Quirks Pointers Array
@@ -175,6 +176,7 @@ struct scmi_quirk {
  * defined quirks descriptors.
  */
 static struct scmi_quirk *scmi_quirks_table[] = {
+	__DECLARE_SCMI_QUIRK_ENTRY(clock_rates_triplet_out_of_spec),
 	NULL
 };
 
diff --git a/drivers/firmware/arm_scmi/quirks.h b/drivers/firmware/arm_scmi/quirks.h
index 28829b4f0646..7fdc496c94c7 100644
--- a/drivers/firmware/arm_scmi/quirks.h
+++ b/drivers/firmware/arm_scmi/quirks.h
@@ -45,4 +45,7 @@ static inline void scmi_quirks_enable(struct device *dev, const char *vend,
 
 #endif /* CONFIG_ARM_SCMI_QUIRKS */
 
+/* Quirk delarations */
+DECLARE_SCMI_QUIRK(clock_rates_triplet_out_of_spec);
+
 #endif /* _SCMI_QUIRKS_H */
-- 
2.47.0

