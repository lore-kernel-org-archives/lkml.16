Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F666246784
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 11:14:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751368495; cv=none; b=clk/LPvq+HBoy08SNUL7qJZuOv56vrmAHv1V1Cq0svrumDrA5Odi00b6uFmLPIjtKSqYIxSP6QO/W5cMrGVeUE3yHhXqpd4JTlk3cXoD70amMTb6Hb1iuI2Itqvc1TKvG7nn2vCvQMvENu0co/XwHCv5tOP7RyqbW9ONSfoikQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751368495; c=relaxed/simple;
	bh=jyI04bOTNCJGvthTNBpaMWus3XFWb8oj70r4Ft+22ys=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bO112fnsWtFsxYO1UebZSzkVgl6X1d0ILWResqhDPFhk0AbCvSDkz4MOt8dixHJrqsZJRrg9HXfEyYcaUjymsfUyH3Kxa7mTt+azDFpDp9HMyTXOB8Z0G/mWz97cBnKHFz+pDqmMQrNhlK+5xafH0+9ugRpbchuibjIkFrvtYas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=bagG4cM1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="bagG4cM1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25F68C4CEEB;
	Tue,  1 Jul 2025 11:14:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1751368494;
	bh=jyI04bOTNCJGvthTNBpaMWus3XFWb8oj70r4Ft+22ys=;
	h=From:To:Cc:Subject:Date:From;
	b=bagG4cM1l1i9lMNX942NwAKbr6HT5MwIII3ndsr8TYgGL0yf4zWMynf5bthVs6zKc
	 HIbzjmvjCS0cAMr40GnkJrwiKDgBdwc3rQtmoyZudNNvAmCTOLW275czZg0OQBCuMB
	 H2pUjl++j/dkdwz57U65UunjTuEMedWm/GSpNv3c=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: linux-kernel@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Nipun Gupta <nipun.gupta@amd.com>,
	Nikhil Agarwal <nikhil.agarwal@amd.com>
Subject: [PATCH] cdx: make cdx_bus_type constant
Date: Tue,  1 Jul 2025 13:14:51 +0200
Message-ID: <2025070150-resize-ninetieth-31f1@gregkh>
X-Mailer: git-send-email 2.50.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1711; i=gregkh@linuxfoundation.org; h=from:subject:message-id; bh=jyI04bOTNCJGvthTNBpaMWus3XFWb8oj70r4Ft+22ys=; b=owGbwMvMwCRo6H6F97bub03G02pJDBnJh7VuS2b3zklcejthyt+2S0XxxSUGk27l+dw3dvjxb t709gVbOmJZGASZGGTFFFm+bOM5ur/ikKKXoe1pmDmsTCBDGLg4BWAiy58yzBW2U8pL4fd1/XbQ ZCfj+xDOVrW5hxjmGfue5J4Vdy134ZWWmP3MuVpHE3ruAgA=
X-Developer-Key: i=gregkh@linuxfoundation.org; a=openpgp; fpr=F4B60CC5BF78C2214A313DCB3147D40DDB2DFB29
Content-Transfer-Encoding: 8bit

Now that the driver core can properly handle constant struct bus_type,
move the cdx_bus_type variable to be a constant structure as well,
placing it into read-only memory which can not be modified at runtime.

Cc: Nipun Gupta <nipun.gupta@amd.com>
Cc: Nikhil Agarwal <nikhil.agarwal@amd.com>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/cdx/cdx.c           | 4 ++--
 include/linux/cdx/cdx_bus.h | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/cdx/cdx.c b/drivers/cdx/cdx.c
index 092306ca2541..26f296b4a489 100644
--- a/drivers/cdx/cdx.c
+++ b/drivers/cdx/cdx.c
@@ -170,7 +170,7 @@ static int cdx_unregister_device(struct device *dev,
 	return 0;
 }
 
-static void cdx_unregister_devices(struct bus_type *bus)
+static void cdx_unregister_devices(const struct bus_type *bus)
 {
 	/* Reset all the devices attached to cdx bus */
 	bus_for_each_dev(bus, NULL, NULL, cdx_unregister_device);
@@ -651,7 +651,7 @@ static struct attribute *cdx_bus_attrs[] = {
 };
 ATTRIBUTE_GROUPS(cdx_bus);
 
-struct bus_type cdx_bus_type = {
+const struct bus_type cdx_bus_type = {
 	.name		= "cdx",
 	.match		= cdx_bus_match,
 	.probe		= cdx_probe,
diff --git a/include/linux/cdx/cdx_bus.h b/include/linux/cdx/cdx_bus.h
index 79bb80e56790..b1ba97f6c9ad 100644
--- a/include/linux/cdx/cdx_bus.h
+++ b/include/linux/cdx/cdx_bus.h
@@ -234,7 +234,7 @@ int __must_check __cdx_driver_register(struct cdx_driver *cdx_driver,
  */
 void cdx_driver_unregister(struct cdx_driver *cdx_driver);
 
-extern struct bus_type cdx_bus_type;
+extern const struct bus_type cdx_bus_type;
 
 /**
  * cdx_dev_reset - Reset CDX device
-- 
2.50.0

