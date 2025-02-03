Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82CC120A5F4;
	Mon,  3 Feb 2025 14:25:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738592745; cv=none; b=KhmO9Bb5cGVFHfYye3GdBCBcdSiMGCc2RrPMGZu32eE8BMB6GnlguV14ge/8LsYlCayVneX4Ohot5/WuPPO8LJw+X2eVYVgByT172FgKyUnXBtk3yOO3IoKRJN0KoFdqLAWTyPRez/EHySOE+B9CvjUpnKnpXGPr5BlUGM44yYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738592745; c=relaxed/simple;
	bh=Jy/UuLrplKIVI/tO54ZXYvBNQ40sp50epS29rpK8sEE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gxxAhalfdcOO0TTBbDYjkd8RlulFSQ30YRVhG9T8vJc0jhQH9yD/WFEHPVHcOvXuo1psisFSev2XM3KuExj5XItRereZ5ipvsQe0wSjxgjtWWdrT8aBiuZ87PZ/PWy0qotdmwwJA8P45uFFpKmvuEswDyt40kRERNlMnVXSKF+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=T2bSoA65; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="T2bSoA65"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 715FCC4CEE0;
	Mon,  3 Feb 2025 14:25:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1738592744;
	bh=Jy/UuLrplKIVI/tO54ZXYvBNQ40sp50epS29rpK8sEE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=T2bSoA65FoY1SNYZgmMn3vU659519CflEgMJWMBgINVFI9KgPca8eKZAaFiB0Lx12
	 YuW40gDOd6ClrVgojFVSmuuW/AmdMY/PzYOeJspIgZcyppi0IrJNo3ufT85np0gha7
	 EawC8cOMcHPZ45TnGmQlACAM3gIEfL4ckGSg4Ny4=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Lyude Paul <lyude@redhat.com>
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
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: [PATCH 2/3] regulator: dummy: convert to use the faux bus
Date: Mon,  3 Feb 2025 15:25:18 +0100
Message-ID: <2025020326-applicant-unwomanly-13df@gregkh>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <2025020324-thermal-quilt-1bae@gregkh>
References: <2025020324-thermal-quilt-1bae@gregkh>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2672; i=gregkh@linuxfoundation.org; h=from:subject:message-id; bh=Jy/UuLrplKIVI/tO54ZXYvBNQ40sp50epS29rpK8sEE=; b=owGbwMvMwCRo6H6F97bub03G02pJDOkLLl6f2/CjVNMsYZnaUk9RKTmLPeF+M0/Hi185NNVQc r+QY/6fjlgWBkEmBlkxRZYv23iO7q84pOhlaHsaZg4rE8gQBi5OAZgI8yOGBTt9C/sP7ny7oDa6 +FmF9Abz9QV5TAzzTFLy1bNc/S/tTTv6bla9SqmgtPlrAA==
X-Developer-Key: i=gregkh@linuxfoundation.org; a=openpgp; fpr=F4B60CC5BF78C2214A313DCB3147D40DDB2DFB29
Content-Transfer-Encoding: 8bit

The dummy regulator driver does not need to create a platform device, it
only did so because it was simple to do.  Change it over to use the
faux bus instead as this is NOT a real platform device, and it makes
the code even smaller than before.

Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/regulator/dummy.c | 37 +++++++++----------------------------
 1 file changed, 9 insertions(+), 28 deletions(-)

diff --git a/drivers/regulator/dummy.c b/drivers/regulator/dummy.c
index 5b9b9e4e762d..163b47e25291 100644
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
+static int dummy_regulator_probe(struct faux_device *vdev)
 {
 	struct regulator_config config = { };
 	int ret;
 
-	config.dev = &pdev->dev;
+	config.dev = &vdev->dev;
 	config.init_data = &dummy_initdata;
 
-	dummy_regulator_rdev = devm_regulator_register(&pdev->dev, &dummy_desc,
+	dummy_regulator_rdev = devm_regulator_register(&vdev->dev, &dummy_desc,
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
+struct faux_driver_ops dummy_regulator_driver = {
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
+	dummy_fdev = faux_device_create("reg-dummy", &dummy_regulator_driver);
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

