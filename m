Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37FEC241695
	for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 19:11:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751224318; cv=none; b=s2FsmVd+NsNgfoBPU8MLr+OhVrOoDWxXwFvlY1F5+TMJi+eFC2+8MU9dQ9JU+Gkv7cDpRU/NRjUK7T2ov/FYnAncXxDy9O8lURFhkum/GPZKNQvZJYwro5jVgCxL67dnFL9w4sX0PP1ckX4q8TCtBtemAkpX4vsALS+DEqysD90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751224318; c=relaxed/simple;
	bh=S+mDiXQOMw5fVa5ujngFUFvXmH88o/5GAnYoCpypnz0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=J+e30xcR5XBjt4lDQh4nDKH6kpJa9HwvZiWIidWLMmOhqIJwO819Af5w+yR+UrsKce4A40+ZwMXFxqUiJS7DKISm1tiuFN3L11JwDip3UQ1dWqf34DW+GfeTou1b9mbnIsoOEc61+eFbJRKrmoO9ugeIpbIbacI8/sn/sc5g7Sc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hkzahUiH; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hkzahUiH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751224316;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CuOBqohkGmgU8kB3XfAEKuXZzpHHvJyo+MHhDXDHaj4=;
	b=hkzahUiHISsD23DLLUwVsHpih75myWB9ondWQfYx0fU0uzlg006vPzvC+/cCtq1HSIeVe9
	fIw/dJw4dFASfK+ABG4Ohsga3YBX16SlCs60Trv8PGgnQ2FHrb+UzYGDbni085WXwWb3W6
	XUyG5KiRPNB0pUYbyxOGpffXRx0EUao=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-399-EI-PAUSSPn-v7iNsL5eI8g-1; Sun,
 29 Jun 2025 15:11:52 -0400
X-MC-Unique: EI-PAUSSPn-v7iNsL5eI8g-1
X-Mimecast-MFC-AGG-ID: EI-PAUSSPn-v7iNsL5eI8g_1751224309
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 921951800289;
	Sun, 29 Jun 2025 19:11:49 +0000 (UTC)
Received: from p16v.luc.cera.cz (unknown [10.45.224.33])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 0B738180035C;
	Sun, 29 Jun 2025 19:11:42 +0000 (UTC)
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
Subject: [PATCH net-next v12 07/14] dpll: zl3073x: Add clock_id field
Date: Sun, 29 Jun 2025 21:10:42 +0200
Message-ID: <20250629191049.64398-8-ivecera@redhat.com>
In-Reply-To: <20250629191049.64398-1-ivecera@redhat.com>
References: <20250629191049.64398-1-ivecera@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

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
index b99dd81077d56..94c78a36d9158 100644
--- a/drivers/dpll/zl3073x/core.c
+++ b/drivers/dpll/zl3073x/core.c
@@ -743,13 +743,14 @@ static void zl3073x_devlink_unregister(void *ptr)
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
@@ -793,6 +794,9 @@ int zl3073x_dev_probe(struct zl3073x_dev *zldev,
 		FIELD_GET(GENMASK(15, 8), cfg_ver),
 		FIELD_GET(GENMASK(7, 0), cfg_ver));
 
+	/* Use chip ID and given dev ID as clock ID */
+	zldev->clock_id = ((u64)id << 8) | dev_id;
+
 	/* Initialize mutex for operations where multiple reads, writes
 	 * and/or polls are required to be done atomically.
 	 */
diff --git a/drivers/dpll/zl3073x/core.h b/drivers/dpll/zl3073x/core.h
index 2c831f1a4a5d1..1df2dc194980d 100644
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
@@ -87,7 +89,7 @@ extern const struct regmap_config zl3073x_regmap_config;
 
 struct zl3073x_dev *zl3073x_devm_alloc(struct device *dev);
 int zl3073x_dev_probe(struct zl3073x_dev *zldev,
-		      const struct zl3073x_chip_info *chip_info);
+		      const struct zl3073x_chip_info *chip_info, u8 dev_id);
 
 /**********************
  * Registers operations
diff --git a/drivers/dpll/zl3073x/i2c.c b/drivers/dpll/zl3073x/i2c.c
index 7bbfdd4ed8671..13942ee43b9e5 100644
--- a/drivers/dpll/zl3073x/i2c.c
+++ b/drivers/dpll/zl3073x/i2c.c
@@ -22,7 +22,9 @@ static int zl3073x_i2c_probe(struct i2c_client *client)
 		return dev_err_probe(dev, PTR_ERR(zldev->regmap),
 				     "Failed to initialize regmap\n");
 
-	return zl3073x_dev_probe(zldev, i2c_get_match_data(client));
+	/* Initialize device and use I2C address as dev ID */
+	return zl3073x_dev_probe(zldev, i2c_get_match_data(client),
+				 client->addr);
 }
 
 static const struct i2c_device_id zl3073x_i2c_id[] = {
diff --git a/drivers/dpll/zl3073x/spi.c b/drivers/dpll/zl3073x/spi.c
index af901b4d6dda0..670b44a7b270f 100644
--- a/drivers/dpll/zl3073x/spi.c
+++ b/drivers/dpll/zl3073x/spi.c
@@ -22,7 +22,9 @@ static int zl3073x_spi_probe(struct spi_device *spi)
 		return dev_err_probe(dev, PTR_ERR(zldev->regmap),
 				     "Failed to initialize regmap\n");
 
-	return zl3073x_dev_probe(zldev, spi_get_device_match_data(spi));
+	/* Initialize device and use SPI chip select value as dev ID */
+	return zl3073x_dev_probe(zldev, spi_get_device_match_data(spi),
+				 spi_get_chipselect(spi, 0));
 }
 
 static const struct spi_device_id zl3073x_spi_id[] = {
-- 
2.49.0

