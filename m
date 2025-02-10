Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 024F42253BD;
	Mon, 10 Feb 2025 12:30:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739190650; cv=none; b=DB80/as/BMyy22uyTfVBLlkSLm05MpaviYM15RcvfSX+P8eri4dDPxnwKfHXT+FO+8a6xi4L4XaiA0J2M8G8cFgqE0V0SXpIGA0aDYF4pPYJMCoeXOk1k1tMHpgvp3dBSOluC3H74I6IT+bkUYfyQyNKRif4bl/woQ2SK1KvG2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739190650; c=relaxed/simple;
	bh=3oCvEgCR4l6Bk1gsFSRNv8m8Yil9jkpL1h7hxMjYzw4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fjQJehEZcdzlaGQFRENOfRShAVLx1z4a7T66puu1Zlptm9csJVCYwjIbYaFcSA/R+gWWUMyVecO4wDDZkVtT9kmF4AR8XMulS2atcsyfZaGW5g8WNq5HixjUIix+elRizVfG8FepHUTDRqPvOIB0Yvix4hyJ3MlB6T8w3vbjmBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=GZvNLg1P; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="GZvNLg1P"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D680DC4CED1;
	Mon, 10 Feb 2025 12:30:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1739190649;
	bh=3oCvEgCR4l6Bk1gsFSRNv8m8Yil9jkpL1h7hxMjYzw4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GZvNLg1P/sp2aWnSPrfnkoOSuDqEphfvvXxPJabckoJLhkFk0fZmiobQJ+Z2b8ak2
	 iFUtMl4VDYCHa43/Dy9BfxxdciV9qESTO15LNC9ZOV1AXQv1nMnpVuihxmO0fZ2GY3
	 +b9d1H4szv1RcTw0kLTaoMA8cs2HxaTQiNhr9DQA=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: linux-kernel@vger.kernel.org,
	Lyude Paul <lyude@redhat.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Alexander Lobakin <aleksander.lobakin@intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Lukas Wunner <lukas@wunner.de>,
	Mark Brown <broonie@kernel.org>,
	=?UTF-8?q?Ma=C3=ADra=20Canal?= <mairacanal@riseup.net>,
	Robin Murphy <robin.murphy@arm.com>,
	Simona Vetter <simona.vetter@ffwll.ch>,
	Zijun Hu <quic_zijuhu@quicinc.com>,
	linux-usb@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: [PATCH v4 3/9] regulator: dummy: convert to use the faux device interface
Date: Mon, 10 Feb 2025 13:30:27 +0100
Message-ID: <2025021027-outclass-stress-59dd@gregkh>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <2025021023-sandstorm-precise-9f5d@gregkh>
References: <2025021023-sandstorm-precise-9f5d@gregkh>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2940; i=gregkh@linuxfoundation.org; h=from:subject:message-id; bh=3oCvEgCR4l6Bk1gsFSRNv8m8Yil9jkpL1h7hxMjYzw4=; b=owGbwMvMwCRo6H6F97bub03G02pJDOkrPyYrb2npf89m+aPhzdFPm56aMHsf3H1o4+qcuw+dr PfPXs1c1RHLwiDIxCArpsjyZRvP0f0VhxS9DG1Pw8xhZQIZwsDFKQAT4f/NMFf8XC5D2WuTqI/q B/Nbpr5vWbeH15xhwaybVedObxf9yNJg31/qvefkT5dzVQA=
X-Developer-Key: i=gregkh@linuxfoundation.org; a=openpgp; fpr=F4B60CC5BF78C2214A313DCB3147D40DDB2DFB29
Content-Transfer-Encoding: 8bit

The dummy regulator driver does not need to create a platform device, it
only did so because it was simple to do.  Change it over to use the
faux bus instead as this is NOT a real platform device, and it makes
the code even smaller than before.

Reviewed-by: Mark Brown <broonie@kernel.org>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
v4: - api tweaked due to parent pointer added to faux_device create
      function.
v3: - no change
v2: - renamed vdev variable to fdev thanks to Mark
 drivers/regulator/dummy.c | 37 +++++++++----------------------------
 1 file changed, 9 insertions(+), 28 deletions(-)

diff --git a/drivers/regulator/dummy.c b/drivers/regulator/dummy.c
index 5b9b9e4e762d..e5197ec7234d 100644
--- a/drivers/regulator/dummy.c
+++ b/drivers/regulator/dummy.c
@@ -13,7 +13,7 @@
 
 #include <linux/err.h>
 #include <linux/export.h>
-#include <linux/platform_device.h>
+#include <linux/device/faux.h>
 #include <linux/regulator/driver.h>
 #include <linux/regulator/machine.h>
 
@@ -37,15 +37,15 @@ static const struct regulator_desc dummy_desc = {
 	.ops = &dummy_ops,
 };
 
-static int dummy_regulator_probe(struct platform_device *pdev)
+static int dummy_regulator_probe(struct faux_device *fdev)
 {
 	struct regulator_config config = { };
 	int ret;
 
-	config.dev = &pdev->dev;
+	config.dev = &fdev->dev;
 	config.init_data = &dummy_initdata;
 
-	dummy_regulator_rdev = devm_regulator_register(&pdev->dev, &dummy_desc,
+	dummy_regulator_rdev = devm_regulator_register(&fdev->dev, &dummy_desc,
 						       &config);
 	if (IS_ERR(dummy_regulator_rdev)) {
 		ret = PTR_ERR(dummy_regulator_rdev);
@@ -56,36 +56,17 @@ static int dummy_regulator_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static struct platform_driver dummy_regulator_driver = {
-	.probe		= dummy_regulator_probe,
-	.driver		= {
-		.name		= "reg-dummy",
-		.probe_type	= PROBE_PREFER_ASYNCHRONOUS,
-	},
+struct faux_device_ops dummy_regulator_driver = {
+	.probe = dummy_regulator_probe,
 };
 
-static struct platform_device *dummy_pdev;
+static struct faux_device *dummy_fdev;
 
 void __init regulator_dummy_init(void)
 {
-	int ret;
-
-	dummy_pdev = platform_device_alloc("reg-dummy", -1);
-	if (!dummy_pdev) {
+	dummy_fdev = faux_device_create("reg-dummy", NULL, &dummy_regulator_driver);
+	if (!dummy_fdev) {
 		pr_err("Failed to allocate dummy regulator device\n");
 		return;
 	}
-
-	ret = platform_device_add(dummy_pdev);
-	if (ret != 0) {
-		pr_err("Failed to register dummy regulator device: %d\n", ret);
-		platform_device_put(dummy_pdev);
-		return;
-	}
-
-	ret = platform_driver_register(&dummy_regulator_driver);
-	if (ret != 0) {
-		pr_err("Failed to register dummy regulator driver: %d\n", ret);
-		platform_device_unregister(dummy_pdev);
-	}
 }
-- 
2.48.1

