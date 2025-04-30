Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC1FC25DAEB;
	Wed, 30 Apr 2025 13:52:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746021122; cv=none; b=RIk9q12YwaL+GcQIJyYYB1gHqDAmYfZvpK4vhrSavcqY0xgyra9AghM1GWIvgZlChm38OtxgTR5uUjsYjacBC++tHE5vg6dEFINV8aToWUS6WHvBU1hgEb0wa1QF6U8WHfLWQZQP3B2GKUE6spBqkGOnywcMw9I2GtR2YVsaIgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746021122; c=relaxed/simple;
	bh=xf1uFp/EVSDzohAXpVq0ni+m7CYH2QXJJpG3H9J9ivg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EXFeyGwg03/Hv+T/YC7BsJlEl2Si9B2FzlJZKg+EPAPUVHLIXdfuOaJR8EDOIkuF/h5ZUqh7+4w4h1J1vZhXnF06OrX5MjqGvX5ftdb6NE7ON0Cy+nP4YasuuDhu9jRh1dlBVEYJNozasDU4pnLH9NuoYxGN/yRUX4N10M4GPSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FDrZ5ylV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FDrZ5ylV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 260B7C4CEEB;
	Wed, 30 Apr 2025 13:52:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746021122;
	bh=xf1uFp/EVSDzohAXpVq0ni+m7CYH2QXJJpG3H9J9ivg=;
	h=From:To:Cc:Subject:Date:From;
	b=FDrZ5ylVhgyEL2WIZLvXJRJH+61d9KI0jJI03lZum2EuNfKXzS610Xq0f4/u/gMe2
	 tXMBZVomy6mEmBEVXIqOqEOzWIMTe/2H6/a+LyMNU5AhW7nFAZmy9ySN1zPH8Dcuy+
	 OQD0dHPHIBDEwvoBkK5XtFLiqoGGHg9jhw5NsKPK9sa9SVLy7MBHY7lTuR17JwVpZn
	 4XTUoYBCv7QIZ3NfWdaQ9+J6G9MTXPz17fZoZzuRKXUEZyQuD7e63xuaiE026fk38w
	 dYU7Idi8aZMUIfUxLu8CoMAwOKCMiIWtrPupaMCobbh7HHOxNNtNw7ZYcuxSusjUil
	 y7qhhXi7Oci4g==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan+linaro@kernel.org>)
	id 1uA7r3-000000001Lh-2fnM;
	Wed, 30 Apr 2025 15:52:05 +0200
From: Johan Hovold <johan+linaro@kernel.org>
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	Sibi Sankar <quic_sibis@quicinc.com>,
	Marc Zyngier <maz@kernel.org>,
	arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan+linaro@kernel.org>
Subject: [PATCH] firmware: arm_scmi: quirk: force perf level get fastchannel
Date: Wed, 30 Apr 2025 15:51:46 +0200
Message-ID: <20250430135146.5154-1-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Qualcomm SCP firmware in X1E machines like the Lenovo ThinkPad T14s
does not set the FastChannel supported attribute bit for PERF_LEVEL_GET
but crashes when falling back to regular messaging.

Use the new SCMI quirk framework to force FastChannel initialisation for
this implementation.

Note that we can add an upper bound on the version matching when we
learn which version has a fix (or limit matching using a SoC compatible
string in the unlikely event that always enabling FC causes trouble
somewhere).

Link: https://lore.kernel.org/lkml/Z4Dt8E7C6upVtEGV@hovoldconsulting.com/
Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---

This one depends on the new SCMI quirk framework:

	https://lore.kernel.org/lkml/20250429141108.406045-1-cristian.marussi@arm.com/	

Johan


 drivers/firmware/arm_scmi/driver.c | 8 ++++++++
 drivers/firmware/arm_scmi/quirks.c | 2 ++
 drivers/firmware/arm_scmi/quirks.h | 1 +
 3 files changed, 11 insertions(+)

diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
index 6a18670ea261..eb6bec39c02d 100644
--- a/drivers/firmware/arm_scmi/driver.c
+++ b/drivers/firmware/arm_scmi/driver.c
@@ -1900,6 +1900,13 @@ struct scmi_msg_resp_desc_fc {
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
@@ -1920,6 +1927,7 @@ scmi_common_fastchannel_init(const struct scmi_protocol_handle *ph,
 
 	/* Check if the MSG_ID supports fastchannel */
 	ret = scmi_protocol_msg_check(ph, message_id, &attributes);
+	SCMI_QUIRK(perf_level_get_fc_force, QUIRK_PERF_FC_FORCE);
 	if (ret || !MSG_SUPPORTS_FASTCHANNEL(attributes)) {
 		dev_dbg(ph->dev,
 			"Skip FC init for 0x%02X/%d  domain:%d - ret:%d\n",
diff --git a/drivers/firmware/arm_scmi/quirks.c b/drivers/firmware/arm_scmi/quirks.c
index 120ac933ed2e..48bf45b8bcf9 100644
--- a/drivers/firmware/arm_scmi/quirks.c
+++ b/drivers/firmware/arm_scmi/quirks.c
@@ -168,6 +168,7 @@ struct scmi_quirk {
 
 /* Global Quirks Definitions */
 DEFINE_SCMI_QUIRK(clock_rates_triplet_out_of_spec, NULL, NULL, NULL);
+DEFINE_SCMI_QUIRK(perf_level_get_fc_force, "Qualcomm", NULL, "0x20000-");
 
 /*
  * Quirks Pointers Array
@@ -177,6 +178,7 @@ DEFINE_SCMI_QUIRK(clock_rates_triplet_out_of_spec, NULL, NULL, NULL);
  */
 static struct scmi_quirk *scmi_quirks_table[] = {
 	__DECLARE_SCMI_QUIRK_ENTRY(clock_rates_triplet_out_of_spec),
+	__DECLARE_SCMI_QUIRK_ENTRY(perf_level_get_fc_force),
 	NULL
 };
 
diff --git a/drivers/firmware/arm_scmi/quirks.h b/drivers/firmware/arm_scmi/quirks.h
index 7fdc496c94c7..a71fde85a527 100644
--- a/drivers/firmware/arm_scmi/quirks.h
+++ b/drivers/firmware/arm_scmi/quirks.h
@@ -47,5 +47,6 @@ static inline void scmi_quirks_enable(struct device *dev, const char *vend,
 
 /* Quirk delarations */
 DECLARE_SCMI_QUIRK(clock_rates_triplet_out_of_spec);
+DECLARE_SCMI_QUIRK(perf_level_get_fc_force);
 
 #endif /* _SCMI_QUIRKS_H */
-- 
2.49.0

