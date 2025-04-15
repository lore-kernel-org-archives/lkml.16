Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 918D32973D8;
	Tue, 15 Apr 2025 14:30:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744727416; cv=none; b=uQI7yJX9jpMxfx6JOqhC4fIqFTxloLfMQsXsM4LwL/gCRQc8XDhRGRTMJ+4LQqxMFTmzvc5x/ZKJv4ZXJuFIkSyTnwCY/s1RdfUSAv4yQ491WjIiagXyY/YmF2lE4wGZIv9my4E7EEmcWFJjE0ZUt4hU+6Vzbdt1LwYnHjkz64A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744727416; c=relaxed/simple;
	bh=rSLNgVWj5qpZs5sQRSm5+2qoH0KVwXp8IEn94Pr5CWk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ntKT4z/fwsVkyND4Uoy+SzaDUZSc4T0Yy78NLrfmOGfZPjg61eKHjtyEXwH4YBYwHF140P8djGTeBV8A8QKNggMram7zkmrx9Jq4JCWeQ/80SuO6yA8KTynDrgi615iCTankuH/8pX6klSmtETKuqq7nvsz1fFsAViYCqVtAH1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5CC161756;
	Tue, 15 Apr 2025 07:30:12 -0700 (PDT)
Received: from pluto.guest.local (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E2B293F694;
	Tue, 15 Apr 2025 07:30:11 -0700 (PDT)
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
Subject: [PATCH 3/4] firmware: arm_scmi: quirk: Fix CLOCK_DESCRIBE_RATES triplet
Date: Tue, 15 Apr 2025 15:29:32 +0100
Message-ID: <20250415142933.1746249-4-cristian.marussi@arm.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250415142933.1746249-1-cristian.marussi@arm.com>
References: <20250415142933.1746249-1-cristian.marussi@arm.com>
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
 drivers/firmware/arm_scmi/clock.c  | 49 ++++++++++++++++--------------
 drivers/firmware/arm_scmi/quirks.c |  2 ++
 drivers/firmware/arm_scmi/quirks.h |  3 ++
 3 files changed, 32 insertions(+), 22 deletions(-)

diff --git a/drivers/firmware/arm_scmi/clock.c b/drivers/firmware/arm_scmi/clock.c
index 2ed2279388f0..cb9839ec96d7 100644
--- a/drivers/firmware/arm_scmi/clock.c
+++ b/drivers/firmware/arm_scmi/clock.c
@@ -11,6 +11,7 @@
 
 #include "protocols.h"
 #include "notify.h"
+#include "quirks.h"
 
 /* Updated only after ALL the mandatory features for that version are merged */
 #define SCMI_PROTOCOL_SUPPORTED_VERSION		0x30000
@@ -429,6 +430,31 @@ static void iter_clk_describe_prepare_message(void *message,
 	msg->rate_index = cpu_to_le32(desc_index);
 }
 
+#define QUIRK_OUT_OF_SPEC_TRIPLET					       \
+	({								       \
+	/* Warn about out of spec replies ... */			       \
+	if (!p->clk->rate_discrete &&					       \
+	    (st->num_returned != 3 || st->num_remaining != 0)) {	       \
+		dev_warn(p->dev,					       \
+			 "Out-of-spec CLOCK_DESCRIBE_RATES reply for %s - returned:%d remaining:%d rx_len:%zd\n",\
+			 p->clk->name, st->num_returned, st->num_remaining,    \
+			 st->rx_len);					       \
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
+	}								       \
+	})
+
 static int
 iter_clk_describe_update_state(struct scmi_iterator_state *st,
 			       const void *response, void *priv)
@@ -442,28 +468,7 @@ iter_clk_describe_update_state(struct scmi_iterator_state *st,
 	st->num_returned = NUM_RETURNED(flags);
 	p->clk->rate_discrete = RATE_DISCRETE(flags);
 
-	/* Warn about out of spec replies ... */
-	if (!p->clk->rate_discrete &&
-	    (st->num_returned != 3 || st->num_remaining != 0)) {
-		dev_warn(p->dev,
-			 "Out-of-spec CLOCK_DESCRIBE_RATES reply for %s - returned:%d remaining:%d rx_len:%zd\n",
-			 p->clk->name, st->num_returned, st->num_remaining,
-			 st->rx_len);
-
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
-	}
+	SCMI_QUIRK(clock_rates_triplet_out_of_spec, QUIRK_OUT_OF_SPEC_TRIPLET);
 
 	return 0;
 }
diff --git a/drivers/firmware/arm_scmi/quirks.c b/drivers/firmware/arm_scmi/quirks.c
index 2f95b35b5ca1..b523bd1ca49f 100644
--- a/drivers/firmware/arm_scmi/quirks.c
+++ b/drivers/firmware/arm_scmi/quirks.c
@@ -86,6 +86,7 @@ struct scmi_quirk {
 	__DEFINE_SCMI_QUIRK_ENTRY(_qn, _comp, _ven, _sub, _impl)
 
 /* Global Quirks Definitions */
+DEFINE_SCMI_QUIRK(clock_rates_triplet_out_of_spec, NULL, NULL, NULL, NULL);
 
 /*
  * Quirks Pointers Array
@@ -94,6 +95,7 @@ struct scmi_quirk {
  * defined quirks descriptors.
  */
 static struct scmi_quirk *scmi_quirks_table[] = {
+	__DECLARE_SCMI_QUIRK_ENTRY(clock_rates_triplet_out_of_spec),
 	NULL
 };
 
diff --git a/drivers/firmware/arm_scmi/quirks.h b/drivers/firmware/arm_scmi/quirks.h
index 0f1a14b13ba5..e5252ba4774b 100644
--- a/drivers/firmware/arm_scmi/quirks.h
+++ b/drivers/firmware/arm_scmi/quirks.h
@@ -37,4 +37,7 @@ static inline void scmi_quirks_enable(struct device *dev, const char *compat,
 
 #endif /* CONFIG_ARM_SCMI_QUIRKS */
 
+/* Quirk delarations */
+DECLARE_SCMI_QUIRK(clock_rates_triplet_out_of_spec);
+
 #endif /* _SCMI_QUIRKS_H */
-- 
2.47.0

