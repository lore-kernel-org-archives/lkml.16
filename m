Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD1F62D8DDF
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 20:02:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749758563; cv=none; b=IWP0q4cnfdm3PAPFZ9/B8WULBd7q++d6Z5vVNULINOfNth2Ffes1ueMWgb9mhQIZFt6EJxlbZiMBJ3Lptr7qddXzntuRjKPRnyTkOpr5mHLvcxtktR3wjtkTGX+egvlkHs3KVJD87RqqLRnfFCFiN18DC5p74Kw02q67+Cu1/J8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749758563; c=relaxed/simple;
	bh=4KUzpSMWG3g9IuCPuhaljwtDZbmm+RMgcvIPQFtfMUw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BsSV9Woi0dg0GFkneLah3KNji0v7cJxTpDQFVKRNYvXL0G96v+KsHMglHYnxVaAodvepHbYPTKiDkKPIFTPulZi+fpD9RBmwLkxaRtBEmA0Fy4fXRf4GfbH427TfrEOUyqQ+h7Ogjvu7dVSG4PAQ3YtD6AE5wXXmHLiLa/EAXM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=CJnAVksV; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="CJnAVksV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749758560;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EMnYd1npq1nHTWpIVvhBB0Ev585m/kdvaOzQpI3Jbqs=;
	b=CJnAVksVNr87FE5oxm4iWMiAAyWfwS/diK6mNXciAjFfSeZ0qiV5TsUhIBICB6zrf9ZMmh
	iQQrrgTs2MVNPyKV4hm7LttVfwxL1CVakQIqiJbWm+2VYjEq8y20RonrBr1M43iaFQ4OXQ
	CSh1ZU8ui2InCFPs+COOGXAyrvhQXZY=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-570-Yi7klrZAMYCsDs51u6Ga2w-1; Thu,
 12 Jun 2025 16:02:36 -0400
X-MC-Unique: Yi7klrZAMYCsDs51u6Ga2w-1
X-Mimecast-MFC-AGG-ID: Yi7klrZAMYCsDs51u6Ga2w_1749758553
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 54914180136B;
	Thu, 12 Jun 2025 20:02:32 +0000 (UTC)
Received: from p16v.redhat.com (unknown [10.45.224.169])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id BBFA7180045B;
	Thu, 12 Jun 2025 20:02:25 +0000 (UTC)
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
Subject: [PATCH net-next v9 05/14] dpll: zl3073x: Protect operations requiring multiple register accesses
Date: Thu, 12 Jun 2025 22:01:36 +0200
Message-ID: <20250612200145.774195-6-ivecera@redhat.com>
In-Reply-To: <20250612200145.774195-1-ivecera@redhat.com>
References: <20250612200145.774195-1-ivecera@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

Registers located on page 10 and above are called mailbox-type
registers. Each page represents a mailbox and is used to read from
and write to configuration of a specific object (DPLL, output,
reference or synth).

Each mailbox page contains a mask register, which selects an index of
the target object to interact with and a semaphore register, which
indicates the requested operation.

The remaining registers within the page are latch registers, which are
populated by the firmware during read operations or by the driver prior
to write operations.

Operations with these registers requires multiple register reads, writes
and polls and all of them need to be done atomically.

So add multiop_lock mutex to protect such operations and check the mutex
is held by the caller when it's accessing registers from page 10 and
above.

Signed-off-by: Ivan Vecera <ivecera@redhat.com>
---
 drivers/dpll/zl3073x/core.c | 14 ++++++++++++++
 drivers/dpll/zl3073x/core.h |  3 +++
 2 files changed, 17 insertions(+)

diff --git a/drivers/dpll/zl3073x/core.c b/drivers/dpll/zl3073x/core.c
index 3269cea8b4073..60344761545d8 100644
--- a/drivers/dpll/zl3073x/core.c
+++ b/drivers/dpll/zl3073x/core.c
@@ -122,6 +122,12 @@ EXPORT_SYMBOL_NS_GPL(zl3073x_regmap_config, "ZL3073X");
 static bool
 zl3073x_check_reg(struct zl3073x_dev *zldev, unsigned int reg, size_t size)
 {
+	/* Check that multiop lock is held when accessing registers
+	 * from page 10 and above.
+	 */
+	if (ZL_REG_PAGE(reg) >= 10)
+		lockdep_assert_held(&zldev->multiop_lock);
+
 	/* Check the index is in valid range for indexed register */
 	if (ZL_REG_OFFSET(reg) > ZL_REG_MAX_OFFSET(reg)) {
 		dev_err(zldev->dev, "Index out of range for reg 0x%04lx\n",
@@ -537,6 +543,14 @@ int zl3073x_dev_probe(struct zl3073x_dev *zldev,
 		FIELD_GET(GENMASK(15, 8), cfg_ver),
 		FIELD_GET(GENMASK(7, 0), cfg_ver));
 
+	/* Initialize mutex for operations where multiple reads, writes
+	 * and/or polls are required to be done atomically.
+	 */
+	rc = devm_mutex_init(zldev->dev, &zldev->multiop_lock);
+	if (rc)
+		return dev_err_probe(zldev->dev, rc,
+				     "Failed to initialize mutex\n");
+
 	/* Register the device as devlink device */
 	devlink = priv_to_devlink(zldev);
 	devlink_register(devlink);
diff --git a/drivers/dpll/zl3073x/core.h b/drivers/dpll/zl3073x/core.h
index 75f68bc9a52ee..1a77a69f85a26 100644
--- a/drivers/dpll/zl3073x/core.h
+++ b/drivers/dpll/zl3073x/core.h
@@ -3,6 +3,7 @@
 #ifndef _ZL3073X_H
 #define _ZL3073X_H
 
+#include <linux/mutex.h>
 #include <linux/types.h>
 
 struct device;
@@ -12,10 +13,12 @@ struct regmap;
  * struct zl3073x_dev - zl3073x device
  * @dev: pointer to device
  * @regmap: regmap to access device registers
+ * @multiop_lock: to serialize multiple register operations
  */
 struct zl3073x_dev {
 	struct device		*dev;
 	struct regmap		*regmap;
+	struct mutex		multiop_lock;
 };
 
 enum zl3073x_chip_type {
-- 
2.49.0

