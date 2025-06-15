Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEE92284663
	for <linux-kernel@vger.kernel.org>; Sun, 15 Jun 2025 20:13:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750018426; cv=none; b=gVK2Fl9JOyQFpHI6behNt/XyAEvOsMEhtTvQ8NV+/8G0h6hogDJe/JNVvlJ2YxUKjnx1PtTufhFuUAA6ti3c+kD1JbN9CVKWeU9GopLuNfnWOegGOqtJ9/5TXukc8m8TuhVdRMcz2PWe6rAiBB9fvC3h5XEAUP+r/uNbzRAWTdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750018426; c=relaxed/simple;
	bh=oHZbb1rJLMK/tA9SmXNvYNtEnDhZ66dzgATbWxqSwxE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MT54NYeGxXEwqAbk4yq459+amzxPWjVs1Xyxs/NlX6GuQDddTkVH5ig92r2c0SozW9JvyiLfi5NKxiDtToAFG5r5A0TsL/ObslXu2R8KseP9M7yaUiU4kDgJ+Lqkv2yEY/YSa9vzqqWpNY0/4KIWN9G4VVUO6JBfEILEDejks00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=GqRdM6xK; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="GqRdM6xK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750018424;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NTJH2oEMnZkAgKTN2kihe9Bkl6Baj4XXA5GAcS4y8jg=;
	b=GqRdM6xKwKV1lU91JlyzmbxA1xjqyzyJiti9CfBiIWbwemun3HqvDbscJarECmujJl1G8R
	3eGU1JHm02lYR6jR684GwdkOO1ZEEeeIZKlkQkOHaatzg2/F/jXk2PXb3chDkh848uSoqg
	X5WqOyDzHe0wngv9CnorI29KWRQP2nI=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-361-rIjcTFZxP9a5cK7Ka2xBPA-1; Sun,
 15 Jun 2025 16:13:39 -0400
X-MC-Unique: rIjcTFZxP9a5cK7Ka2xBPA-1
X-Mimecast-MFC-AGG-ID: rIjcTFZxP9a5cK7Ka2xBPA_1750018417
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 54C0C19560B2;
	Sun, 15 Jun 2025 20:13:37 +0000 (UTC)
Received: from p16v.luc.cera.cz (unknown [10.45.224.53])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 26F87180035E;
	Sun, 15 Jun 2025 20:13:28 +0000 (UTC)
From: Ivan Vecera <ivecera@redhat.com>
To: netdev@vger.kernel.org
Cc: Vadim Fedorenko <vadim.fedorenko@linux.dev>,
	Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>,
	Jiri Pirko <jiri@resnulli.us>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Prathosh Satish <Prathosh.Satish@microchip.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Shannon Nelson <shannon.nelson@amd.com>,
	Dave Jiang <dave.jiang@intel.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Michal Schmidt <mschmidt@redhat.com>,
	Petr Oros <poros@redhat.com>
Subject: [PATCH net-next v10 07/14] dpll: zl3073x: Add clock_id field
Date: Sun, 15 Jun 2025 22:12:16 +0200
Message-ID: <20250615201223.1209235-8-ivecera@redhat.com>
In-Reply-To: <20250615201223.1209235-1-ivecera@redhat.com>
References: <20250615201223.1209235-1-ivecera@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

Add .clock_id to zl3073x_dev structure that will be used by later
commits introducing DPLL feature. The clock ID is required for DPLL
device registration.

To generate this ID, use chip ID read during device initialization.
In case where multiple zl3073x based chips are present, the chip ID
is shifted and lower bits are filled by an unique value - using
the I2C device address for I2C connections and the chip-select value
for SPI connections.

Signed-off-by: Ivan Vecera <ivecera@redhat.com>
---
 drivers/dpll/zl3073x/core.c | 6 +++++-
 drivers/dpll/zl3073x/core.h | 4 +++-
 drivers/dpll/zl3073x/i2c.c  | 4 +++-
 drivers/dpll/zl3073x/spi.c  | 4 +++-
 4 files changed, 14 insertions(+), 4 deletions(-)

diff --git a/drivers/dpll/zl3073x/core.c b/drivers/dpll/zl3073x/core.c
index 9d9d1403645f3..ab578c729ac40 100644
--- a/drivers/dpll/zl3073x/core.c
+++ b/drivers/dpll/zl3073x/core.c
@@ -737,13 +737,14 @@ static void zl3073x_devlink_unregister(void *ptr)
  * zl3073x_dev_probe - initialize zl3073x device
  * @zldev: pointer to zl3073x device
  * @chip_info: chip info based on compatible
+ * @dev_id: device ID to be used as part of clock ID
  *
  * Common initialization of zl3073x device structure.
  *
  * Returns: 0 on success, <0 on error
  */
 int zl3073x_dev_probe(struct zl3073x_dev *zldev,
-		      const struct zl3073x_chip_info *chip_info)
+		      const struct zl3073x_chip_info *chip_info, u8 dev_id)
 {
 	u16 id, revision, fw_ver;
 	struct devlink *devlink;
@@ -787,6 +788,9 @@ int zl3073x_dev_probe(struct zl3073x_dev *zldev,
 		FIELD_GET(GENMASK(15, 8), cfg_ver),
 		FIELD_GET(GENMASK(7, 0), cfg_ver));
 
+	/* Use chip ID and given dev ID as clock ID */
+	zldev->clock_id = ((u64)id << 8) | dev_id;
+
 	/* Initialize mutex for operations where multiple reads, writes
 	 * and/or polls are required to be done atomically.
 	 */
diff --git a/drivers/dpll/zl3073x/core.h b/drivers/dpll/zl3073x/core.h
index 0d052c02065e5..fcf142f3f8cb6 100644
--- a/drivers/dpll/zl3073x/core.h
+++ b/drivers/dpll/zl3073x/core.h
@@ -57,6 +57,7 @@ struct zl3073x_synth {
  * @dev: pointer to device
  * @regmap: regmap to access device registers
  * @multiop_lock: to serialize multiple register operations
+ * @clock_id: clock id of the device
  * @ref: array of input references' invariants
  * @out: array of outs' invariants
  * @synth: array of synths' invariants
@@ -65,6 +66,7 @@ struct zl3073x_dev {
 	struct device		*dev;
 	struct regmap		*regmap;
 	struct mutex		multiop_lock;
+	u64			clock_id;
 
 	/* Invariants */
 	struct zl3073x_ref	ref[ZL3073X_NUM_REFS];
@@ -91,7 +93,7 @@ extern const struct regmap_config zl3073x_regmap_config;
 
 struct zl3073x_dev *zl3073x_devm_alloc(struct device *dev);
 int zl3073x_dev_probe(struct zl3073x_dev *zldev,
-		      const struct zl3073x_chip_info *chip_info);
+		      const struct zl3073x_chip_info *chip_info, u8 dev_id);
 
 /**********************
  * Registers operations
diff --git a/drivers/dpll/zl3073x/i2c.c b/drivers/dpll/zl3073x/i2c.c
index bca1cd729895c..82cc929e543d7 100644
--- a/drivers/dpll/zl3073x/i2c.c
+++ b/drivers/dpll/zl3073x/i2c.c
@@ -24,7 +24,9 @@ static int zl3073x_i2c_probe(struct i2c_client *client)
 		return PTR_ERR(zldev->regmap);
 	}
 
-	return zl3073x_dev_probe(zldev, i2c_get_match_data(client));
+	/* Initialize device and use I2C address as dev ID */
+	return zl3073x_dev_probe(zldev, i2c_get_match_data(client),
+				 client->addr);
 }
 
 static const struct i2c_device_id zl3073x_i2c_id[] = {
diff --git a/drivers/dpll/zl3073x/spi.c b/drivers/dpll/zl3073x/spi.c
index 219676da71b78..6327d4c9c8d94 100644
--- a/drivers/dpll/zl3073x/spi.c
+++ b/drivers/dpll/zl3073x/spi.c
@@ -24,7 +24,9 @@ static int zl3073x_spi_probe(struct spi_device *spi)
 		return PTR_ERR(zldev->regmap);
 	}
 
-	return zl3073x_dev_probe(zldev, spi_get_device_match_data(spi));
+	/* Initialize device and use SPI chip select value as dev ID */
+	return zl3073x_dev_probe(zldev, spi_get_device_match_data(spi),
+				 spi_get_chipselect(spi, 0));
 }
 
 static const struct spi_device_id zl3073x_spi_id[] = {
-- 
2.49.0

