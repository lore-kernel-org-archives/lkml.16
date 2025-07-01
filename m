Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3928626B97F;
	Tue,  1 Jul 2025 12:07:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751371632; cv=none; b=MwsqFLrkUyaO8b+4fMLB9nddGPvWaeBNPrl6OwhFdDy+XN+7DPSH4wfQ6iAgsozDeGGw8+JhJm6ud2iRC+AU06hmtCnJ3P7k0XSnLGt7oZM2UGstU852K2YLOLbHr0PlJzKGIXqanxCvTkdAyz2xqyb6z0QEj1ZOrwhjBe/qrIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751371632; c=relaxed/simple;
	bh=zdQNmqbysWdxXUYiaVVlHOhxVRge3N7XydcHJPPQNu4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fHQei9E10MGGUeC5Z8ZVVu5eQlL6aTJcbYJQk7xsUDIKy9s2GJaXlraiOx3IdF1yj2NQdOZwiQ7AecjV35yqWRvqFPkQgT5rzIMitUXigz+DPa4j6RvskvbITA5+FCh+45BTl5CXxO0+3x/UvXVCJ0G4fccPz48/5WLziBIxtZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ju65JOmy; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ju65JOmy"
Received: by smtp.kernel.org (Postfix) with ESMTPS id D5222C4CEF1;
	Tue,  1 Jul 2025 12:07:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751371631;
	bh=zdQNmqbysWdxXUYiaVVlHOhxVRge3N7XydcHJPPQNu4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=ju65JOmy9oCkN1QPH9pvJ14VODmGp+h0gKYTzdrsBHKcubtbU31s5XzcCI3PzmK5X
	 bpaOMU79xBKlPk/Pk4dpKRpCuxXeareE3r5eYdZ7RCO0YAYkGGy61w6idIkvyraqsp
	 KSPq4p5MNK82yDe6An4BioRZLi0GNJYmNVyWEvnnvEARIcOTW1pdZHGpAyMoIINarF
	 dAHhsFu/Av+c7PmCC/iy4YXPtvOcrsnCillv1kdNA4JN9t6AU7CSkr4LsMLRaX5vo+
	 cN1zXFhwOYqflprfph5qltj6dKqpiK/cskN0XWvHtjmC1yARDCaq2NPv8YdQuaMlDn
	 R0QmpamrS9OUw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7917C8303A;
	Tue,  1 Jul 2025 12:07:11 +0000 (UTC)
From: Jack Cheng via B4 Relay <devnull+Cheng.JackHY.inventec.com@kernel.org>
Date: Tue, 01 Jul 2025 12:03:46 +0000
Subject: [PATCH 2/2] hwmon: (pmbus/q54sj108a2) Add support for q50sn12072
 and q54sn120a1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250701-add-support-for-q50sn12072-and-q54sn120a1-v1-2-c387baf928cb@inventec.com>
References: <20250701-add-support-for-q50sn12072-and-q54sn120a1-v1-0-c387baf928cb@inventec.com>
In-Reply-To: <20250701-add-support-for-q50sn12072-and-q54sn120a1-v1-0-c387baf928cb@inventec.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jean Delvare <jdelvare@suse.com>, 
 Guenter Roeck <linux@roeck-us.net>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-hwmon@vger.kernel.org, Jack Cheng <Cheng.JackHY@inventec.com>, 
 Jack Cheng <cheng.jackhy@inventec.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751371491; l=4040;
 i=Cheng.JackHY@inventec.com; s=20250701; h=from:subject:message-id;
 bh=zA/Fyy6uru6kWhlC/CVZ1MMPpQZdr70m76wF9y8wM0E=;
 b=QlcIod5aR81TXWHqlkwVyvOkCRY/AtaejFlk3i22kPJkuiboUBmK/08hqeqhxGwLTA0PRDLNe
 5p8ab4oEfHcDWbfGUziBEVK5/oK3VtBAkhHAxKR7QkHymIkHyaKILOT
X-Developer-Key: i=Cheng.JackHY@inventec.com; a=ed25519;
 pk=L+GNI15NJXj7JAu9YqFXp9hL3rwZWbBbjlEeDjPvm68=
X-Endpoint-Received: by B4 Relay for Cheng.JackHY@inventec.com/20250701
 with auth_id=449
X-Original-From: Jack Cheng <Cheng.JackHY@inventec.com>
Reply-To: Cheng.JackHY@inventec.com

From: Jack Cheng <cheng.jackhy@inventec.com>

The Q54SN12072 and Q54SN120A1 are high-efficiency, high-density DC-DC power
module from Delta Power Modules.

The Q54SN12072, quarter brick, single output 12V. This product provides up
to 1200 watts of output power at 38~60V. The Q54SN12072 offers peak
efficiency up to 98.3%@54Vin.

The Q54SN120A1, quarter brick, single output 12V. This product provides up
to 1300 watts of output power at 40~60V. The Q54SN120A1 offers peak
efficiency up to 98.1%@54Vin.

Add support for them to q54sj108a2 driver.

Signed-off-by: Jack Cheng <cheng.jackhy@inventec.com>
---
 drivers/hwmon/pmbus/q54sj108a2.c | 51 ++++++++++++++++++++++++++++++++++++++--
 1 file changed, 49 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/pmbus/q54sj108a2.c b/drivers/hwmon/pmbus/q54sj108a2.c
index 4d7086d83aa3..34233d955c48 100644
--- a/drivers/hwmon/pmbus/q54sj108a2.c
+++ b/drivers/hwmon/pmbus/q54sj108a2.c
@@ -21,11 +21,14 @@
 #define PMBUS_FLASH_KEY_WRITE		0xEC
 
 enum chips {
-	q54sj108a2
+	q50sn12072,
+	q54sj108a2,
+	q54sn120a1
 };
 
 enum {
-	Q54SJ108A2_DEBUGFS_OPERATION = 0,
+	Q50SN12072_DEBUGFS_VOUT_COMMAND = 0,
+	Q54SJ108A2_DEBUGFS_OPERATION,
 	Q54SJ108A2_DEBUGFS_CLEARFAULT,
 	Q54SJ108A2_DEBUGFS_WRITEPROTECT,
 	Q54SJ108A2_DEBUGFS_STOREDEFAULT,
@@ -54,6 +57,20 @@ struct q54sj108a2_data {
 #define to_psu(x, y) container_of((x), struct q54sj108a2_data, debugfs_entries[(y)])
 
 static struct pmbus_driver_info q54sj108a2_info[] = {
+	[q50sn12072] = {
+		.pages = 1,
+
+		/* Source : Delta Q50SN12072 */
+		.format[PSC_TEMPERATURE] = linear,
+		.format[PSC_VOLTAGE_IN] = linear,
+		.format[PSC_CURRENT_OUT] = linear,
+
+		.func[0] = PMBUS_HAVE_VIN | PMBUS_HAVE_IIN | PMBUS_HAVE_PIN |
+		PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT |
+		PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_IOUT |
+		PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP |
+		PMBUS_HAVE_STATUS_INPUT | PMBUS_HAVE_POUT,
+	},
 	[q54sj108a2] = {
 		.pages = 1,
 
@@ -68,6 +85,20 @@ static struct pmbus_driver_info q54sj108a2_info[] = {
 		PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP |
 		PMBUS_HAVE_STATUS_INPUT,
 	},
+	[q54sn120a1] = {
+		.pages = 1,
+
+		/* Source : Delta Q54SN120A1 */
+		.format[PSC_TEMPERATURE] = linear,
+		.format[PSC_VOLTAGE_IN] = linear,
+		.format[PSC_CURRENT_OUT] = linear,
+
+		.func[0] = PMBUS_HAVE_VIN | PMBUS_HAVE_IIN | PMBUS_HAVE_PIN |
+		PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT |
+		PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_IOUT |
+		PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP |
+		PMBUS_HAVE_STATUS_INPUT | PMBUS_HAVE_POUT,
+	},
 };
 
 static ssize_t q54sj108a2_debugfs_read(struct file *file, char __user *buf,
@@ -177,6 +208,7 @@ static ssize_t q54sj108a2_debugfs_write(struct file *file, const char __user *bu
 {
 	u8 flash_key[4];
 	u8 dst_data;
+	u16 val;
 	ssize_t rc;
 	int *idxp = file->private_data;
 	int idx = *idxp;
@@ -187,6 +219,17 @@ static ssize_t q54sj108a2_debugfs_write(struct file *file, const char __user *bu
 		return rc;
 
 	switch (idx) {
+	case Q50SN12072_DEBUGFS_VOUT_COMMAND:
+		rc = kstrtou16_from_user(buf, count, 0, &val);
+		if (rc < 0)
+			return rc;
+
+		rc = pmbus_write_word_data(psu->client, 0x00,
+					   PMBUS_VOUT_COMMAND, (const u16)val);
+		if (rc < 0)
+			return rc;
+
+		break;
 	case Q54SJ108A2_DEBUGFS_OPERATION:
 		rc = kstrtou8_from_user(buf, count, 0, &dst_data);
 		if (rc < 0)
@@ -268,7 +311,9 @@ static const struct file_operations q54sj108a2_fops = {
 };
 
 static const struct i2c_device_id q54sj108a2_id[] = {
+	{ "q50sn12072", q50sn12072 },
 	{ "q54sj108a2", q54sj108a2 },
+	{ "q54sn120a1", q54sn120a1 },
 	{ },
 };
 
@@ -401,7 +446,9 @@ static int q54sj108a2_probe(struct i2c_client *client)
 }
 
 static const struct of_device_id q54sj108a2_of_match[] = {
+	{ .compatible = "delta,q50sn12072", .data = (void *)q50sn12072 },
 	{ .compatible = "delta,q54sj108a2", .data = (void *)q54sj108a2 },
+	{ .compatible = "delta,q54sn120a1", .data = (void *)q54sn120a1 },
 	{ },
 };
 

-- 
2.43.0


