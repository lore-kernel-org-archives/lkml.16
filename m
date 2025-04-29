Received: from mail-43171.protonmail.ch (mail-43171.protonmail.ch [185.70.43.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76BDB2BE7DE;
	Tue, 29 Apr 2025 09:56:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745920601; cv=none; b=oHo9VC5G9fwE4K19WP1lWdlZqtNeQb3ufZQ+s9OzyBUhTz65+Jg3f1f7zli4J5YCWMvQgLm1WI1z9d+Yqe+lJl8VmVxEKuYjzKtpVDTmAqylDNwiyZgWEwqcIob+nFB6vBYOTYUaK3Y6/8r22IOyUPxSMyeKu5j5cXWrUQozlwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745920601; c=relaxed/simple;
	bh=TOitCNlEHavJgJ0406Fj4t6giqT2OUkC7+UWGeAosKA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BkxhkvEAu5cn+oJmfvLQClcx49qC9BF1L1ceY+MpNC9545i1z27lkUPIe7xnSztqQ81yAxgfPIqRgtB5qFZ0N5w0O4YZKXtYIqVoyL40eKYU1E+QDtJB9yEPJW03+zFAPXRTiwercZNJgUWChXdHZkDkrj5V8HBCmFE1v2CCY44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=geanix.com; spf=pass smtp.mailfrom=geanix.com; dkim=pass (2048-bit key) header.d=geanix.com header.i=@geanix.com header.b=t9LMIS//; arc=none smtp.client-ip=185.70.43.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=geanix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=geanix.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=geanix.com header.i=@geanix.com header.b="t9LMIS//"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=geanix.com;
	s=protonmail; t=1745920595; x=1746179795;
	bh=BIj1PH3AC001SwYGa/4ndDv3Snnx5p8N27N5kIu5Rbc=;
	h=From:Date:Subject:Message-Id:References:In-Reply-To:To:Cc:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector:
	 List-Unsubscribe:List-Unsubscribe-Post;
	b=t9LMIS//QjgJ8QRB7fuXYgrlz0+YSKRYLo2ZrufxkcAa4IbMTUWPW2b2feaamkQ0h
	 zs9hlz8nKn9MeslWZ8iCOVmwjw2uL3lfVPzJzf/mjZ0dbhdHytrViLXIXAaaGE2LM8
	 8Qc4P4lbMhJh92FyYUxRk8KcuXXXZm5+gtjwwJEWMOaijX8H8Hw+6h2liT+odhcnig
	 9OZvu9xI6L8WF5hmpN4vp3/bgXetKc3TWSjj8ECQUZvL1m6oUAQxkEPTDA5Hdnyp4S
	 lxA5nTPLGHTe4vNIWtL1L1TBVx5HTlvs2mNogIxJedz6LPWYIADJ9kdkPuYEq7D+wC
	 aTqNbj9/9cJSA==
X-Pm-Submission-Id: 4Zmwgx4bQDz44r
From: Esben Haabendal <esben@geanix.com>
Date: Tue, 29 Apr 2025 11:56:12 +0200
Subject: [PATCH v2 2/2] Input: goodix - Allow DT specification of missing
 reset pull-up
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250429-goodix-no-reset-pull-up-v2-2-0687a4ad5a04@geanix.com>
References: <20250429-goodix-no-reset-pull-up-v2-0-0687a4ad5a04@geanix.com>
In-Reply-To: <20250429-goodix-no-reset-pull-up-v2-0-0687a4ad5a04@geanix.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Hans de Goede <hdegoede@redhat.com>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Esben Haabendal <esben@geanix.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745920580; l=2058;
 i=esben@geanix.com; s=20240523; h=from:subject:message-id;
 bh=TOitCNlEHavJgJ0406Fj4t6giqT2OUkC7+UWGeAosKA=;
 b=LXGLbkRsBK9V1v9vARAI3xti/9Iwl1ti7/D+c9GdS507CofovXMkB2RdwJ2zMiUDgvauKGzB9
 N6J9RfslxibA9p3OyEb9/8b6aDPK2+3ib3kDq0oqU/byGOJXhkohZro
X-Developer-Key: i=esben@geanix.com; a=ed25519;
 pk=PbXoezm+CERhtgVeF/QAgXtEzSkDIahcWfC7RIXNdEk=

In commit a2fd46cd3dbb ("Input: goodix - try not to touch the reset-pin on x86/ACPI devices")
a fix for problems on various x86/ACPI devices where external
pull-up is missing were added. The same type of problem can exist on
device-tree platforms, and the fix can be activated by adding the
no-reset-pull-up device-tree property.

Signed-off-by: Esben Haabendal <esben@geanix.com>
Reviewed-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/input/touchscreen/goodix.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/drivers/input/touchscreen/goodix.c b/drivers/input/touchscreen/goodix.c
index a3e8a51c91449533b4d5185746df6b98676053dd..ce4622bbcc89434a4d89c49bb97f084fb61aa448 100644
--- a/drivers/input/touchscreen/goodix.c
+++ b/drivers/input/touchscreen/goodix.c
@@ -772,10 +772,12 @@ int goodix_reset_no_int_sync(struct goodix_ts_data *ts)
 
 	/*
 	 * Put the reset pin back in to input / high-impedance mode to save
-	 * power. Only do this in the non ACPI case since some ACPI boards
-	 * don't have a pull-up, so there the reset pin must stay active-high.
+	 * power.
+	 * Avoid doing this on boards that are known to not have external
+	 * pull-up, and all ACPI boards since some ACPI boards don't have a
+	 * pull-up. These boards need the reset pin to stay active-high.
 	 */
-	if (ts->irq_pin_access_method == IRQ_PIN_ACCESS_GPIO) {
+	if (ts->gpiod_rst_flags == GPIOD_IN) {
 		error = gpiod_direction_input(ts->gpiod_rst);
 		if (error)
 			goto error;
@@ -969,6 +971,13 @@ static int goodix_get_gpio_config(struct goodix_ts_data *ts)
 	 */
 	ts->gpiod_rst_flags = GPIOD_IN;
 
+	/*
+	 * Devices that does not have pull-up on reset signal should not be
+	 * changed to input
+	 */
+	if (device_property_read_bool(dev, "goodix,no-reset-pull-up"))
+		ts->gpiod_rst_flags = GPIOD_ASIS;
+
 	ts->avdd28 = devm_regulator_get(dev, "AVDD28");
 	if (IS_ERR(ts->avdd28))
 		return dev_err_probe(dev, PTR_ERR(ts->avdd28), "Failed to get AVDD28 regulator\n");

-- 
2.49.0

