Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D1D5202F8D;
	Tue,  1 Apr 2025 12:26:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743510383; cv=none; b=msznl/NUdUF26FLABU55pKt8Q+C8en1TEzDXA49KeUun0xRwC8kZ2xEYIA9/4GkRGUe/dB3bsWeXUvAlvugwOSgKk/VoN5X2MMx4301SqVSmtQefMhvhiArde+iKJhz07opIUTfQ1OWTMMb2vDFBIFdGh5ASq8M6R6U0QNsis7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743510383; c=relaxed/simple;
	bh=G8kAZyAy6JX+PJvsNeB0u6WkvkI2cIXHVan8JNyxU4Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=D8aAVBAy4H41uGlNogpdUl4oB3kIhaxz2dICoDs+gXlJyIhLbWPJKn63dUQ1y9btz4289g/WCtPb1ouazTI939NRrjZrGzOLGk3402XXGvhGtb+/H+GDkxAcYzof9A98V6iuxaNWuqudI0N5h9iJ1UqDAewDa9nR+IhMyR7uX6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 286D822D7;
	Tue,  1 Apr 2025 05:26:25 -0700 (PDT)
Received: from pluto.guest.local (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5D3313F63F;
	Tue,  1 Apr 2025 05:26:19 -0700 (PDT)
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
Subject: [RFC PATCH 3/3] [NOT FOR UPSTREAM] firmware: arm_scmi: quirk: Ignore FC bit in attributes
Date: Tue,  1 Apr 2025 13:25:45 +0100
Message-ID: <20250401122545.1941755-4-cristian.marussi@arm.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250401122545.1941755-1-cristian.marussi@arm.com>
References: <20250401122545.1941755-1-cristian.marussi@arm.com>
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
---
 drivers/firmware/arm_scmi/driver.c | 8 ++++++++
 drivers/firmware/arm_scmi/quirks.c | 3 +++
 drivers/firmware/arm_scmi/quirks.h | 3 +++
 3 files changed, 14 insertions(+)

diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
index 4266ef852c48..212456305bc9 100644
--- a/drivers/firmware/arm_scmi/driver.c
+++ b/drivers/firmware/arm_scmi/driver.c
@@ -1904,6 +1904,13 @@ struct scmi_msg_resp_desc_fc {
 	__le32 db_preserve_hmask;
 };
 
+#define QUIRK_PERF_FC_FORCE						\
+	({								\
+		if (pi->proto->id == SCMI_PROTOCOL_PERF ||		\
+		    message_id == 0x5 /* PERF_LEVEL_GET */)		\
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
index 83798bc3b043..78d51bd0e5b5 100644
--- a/drivers/firmware/arm_scmi/quirks.c
+++ b/drivers/firmware/arm_scmi/quirks.c
@@ -70,6 +70,8 @@ struct scmi_quirk {
 	__DEFINE_SCMI_QUIRK_ENTRY(_qn, _comp, _ven, _sub, _impl)
 
 /* Global Quirks Definitions */
+DEFINE_SCMI_QUIRK(perf_level_get_fc_force,
+		  "your-bad-compatible", NULL, NULL, 0x0);
 
 /*
  * Quirks Pointers Array
@@ -78,6 +80,7 @@ struct scmi_quirk {
  * defined quirks descriptors.
  */
 static struct scmi_quirk *scmi_quirks_table[] = {
+	__DECLARE_SCMI_QUIRK_ENTRY(perf_level_get_fc_force),
 	NULL
 };
 
diff --git a/drivers/firmware/arm_scmi/quirks.h b/drivers/firmware/arm_scmi/quirks.h
index 0f1a14b13ba5..3968eba375cf 100644
--- a/drivers/firmware/arm_scmi/quirks.h
+++ b/drivers/firmware/arm_scmi/quirks.h
@@ -37,4 +37,7 @@ static inline void scmi_quirks_enable(struct device *dev, const char *compat,
 
 #endif /* CONFIG_ARM_SCMI_QUIRKS */
 
+/* Quirk delarations */
+DECLARE_SCMI_QUIRK(perf_level_get_fc_force);
+
 #endif /* _SCMI_QUIRKS_H */
-- 
2.47.0

