Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 364FFEAC7;
	Tue, 15 Apr 2025 14:30:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744727419; cv=none; b=FDiGTTy3C6MF4XvQBqFh4AVk/hz6hKLNVCMrco3rQmqnClP0RfOTkXnzNA7iLFlysyTGRSmANkdTYwZ1bdxj/SB+BRhynB7CzHKVL3rJzvsN6MyySxbUI0MECB7hO0gCNN2MrrdjeF8EJPUdyhrvWXOD8wWRu+VHFcbgk/1r7jw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744727419; c=relaxed/simple;
	bh=a4ZwrR1VvUBppHXUT6mwYMQSNlX5JxtCSjYaQEKueQU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BsutPdfX+MiSiR4bb1c2WSThZLkIlQHG6W086KPQqbMGnLZZPLTu2R9rOj3XpBpq9/RpJj0A9tYJMCFg9PEkifQqeh2uJJhwqaCmvW2fTrYYcuRuvbKJPVTQtn2jUbbW44Rj06A1cUo7f1INMjNoJ2wUSW9ELRHauMXfWf9LTY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DED1615A1;
	Tue, 15 Apr 2025 07:30:14 -0700 (PDT)
Received: from pluto.guest.local (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6F3AC3F694;
	Tue, 15 Apr 2025 07:30:14 -0700 (PDT)
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
Subject: [PATCH 4/4] [NOT FOR UPSTREAM] firmware: arm_scmi: quirk: Ignore FC bit in attributes
Date: Tue, 15 Apr 2025 15:29:33 +0100
Message-ID: <20250415142933.1746249-5-cristian.marussi@arm.com>
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

Some platform misreported the support of FastChannel when queried: ignore
that bit on selected platforms.

Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
---
Match features has to be set-up properly before upstreaming this.
Ideally the out-of-spec firmware should be matched with a quirk matching
pattern based on Vendor/SubVendor/ImplVersion....but it is NOT clear if the
platform at hand will ship with future fixed firmwares where the ImplVersion
field is properly handled.
If we cannot be sure about that, we should fallback to a compatible match.

RFC->V1
- fix QUIRKS conditions
---
 drivers/firmware/arm_scmi/driver.c | 8 ++++++++
 drivers/firmware/arm_scmi/quirks.c | 3 +++
 drivers/firmware/arm_scmi/quirks.h | 1 +
 3 files changed, 12 insertions(+)

diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
index 1d500663004a..e38cf3c3b157 100644
--- a/drivers/firmware/arm_scmi/driver.c
+++ b/drivers/firmware/arm_scmi/driver.c
@@ -1904,6 +1904,13 @@ struct scmi_msg_resp_desc_fc {
 	__le32 db_preserve_hmask;
 };
 
+#define QUIRK_PERF_FC_FORCE						\
+	({								\
+		if (pi->proto->id == SCMI_PROTOCOL_PERF &&		\
+		    message_id == 0x8 /* PERF_LEVEL_GET */)		\
+			attributes |= BIT(0);				\
+	})
+
 static void
 scmi_common_fastchannel_init(const struct scmi_protocol_handle *ph,
 			     u8 describe_id, u32 message_id, u32 valid_size,
@@ -1924,6 +1931,7 @@ scmi_common_fastchannel_init(const struct scmi_protocol_handle *ph,
 
 	/* Check if the MSG_ID supports fastchannel */
 	ret = scmi_protocol_msg_check(ph, message_id, &attributes);
+	SCMI_QUIRK(perf_level_get_fc_force, QUIRK_PERF_FC_FORCE);
 	if (ret || !MSG_SUPPORTS_FASTCHANNEL(attributes)) {
 		dev_dbg(ph->dev,
 			"Skip FC init for 0x%02X/%d  domain:%d - ret:%d\n",
diff --git a/drivers/firmware/arm_scmi/quirks.c b/drivers/firmware/arm_scmi/quirks.c
index b523bd1ca49f..3e3b61a03780 100644
--- a/drivers/firmware/arm_scmi/quirks.c
+++ b/drivers/firmware/arm_scmi/quirks.c
@@ -87,6 +87,8 @@ struct scmi_quirk {
 
 /* Global Quirks Definitions */
 DEFINE_SCMI_QUIRK(clock_rates_triplet_out_of_spec, NULL, NULL, NULL, NULL);
+DEFINE_SCMI_QUIRK(perf_level_get_fc_force,
+		  NULL, "bad-vend", NULL, "0x20000-");
 
 /*
  * Quirks Pointers Array
@@ -96,6 +98,7 @@ DEFINE_SCMI_QUIRK(clock_rates_triplet_out_of_spec, NULL, NULL, NULL, NULL);
  */
 static struct scmi_quirk *scmi_quirks_table[] = {
 	__DECLARE_SCMI_QUIRK_ENTRY(clock_rates_triplet_out_of_spec),
+	__DECLARE_SCMI_QUIRK_ENTRY(perf_level_get_fc_force),
 	NULL
 };
 
diff --git a/drivers/firmware/arm_scmi/quirks.h b/drivers/firmware/arm_scmi/quirks.h
index e5252ba4774b..f8a7f234b2ae 100644
--- a/drivers/firmware/arm_scmi/quirks.h
+++ b/drivers/firmware/arm_scmi/quirks.h
@@ -39,5 +39,6 @@ static inline void scmi_quirks_enable(struct device *dev, const char *compat,
 
 /* Quirk delarations */
 DECLARE_SCMI_QUIRK(clock_rates_triplet_out_of_spec);
+DECLARE_SCMI_QUIRK(perf_level_get_fc_force);
 
 #endif /* _SCMI_QUIRKS_H */
-- 
2.47.0

