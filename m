Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B313B20C00E;
	Tue,  4 Feb 2025 11:09:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738667386; cv=none; b=NuQZIWLTXsBZ8x3dyhhq/yTaAdIPTCYii5R2ilOYm6gYAGYdDD4By73ZolxZPaNpL6qPL2m8AjxwSxKuW+xUSZkGFxFvP+NmUewpqhB0eKR7yodku6ccRNZwP9ozAGvNj8il2R2FTXF464njM/CQpU69uPao6bvFJVe3JRdaiv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738667386; c=relaxed/simple;
	bh=2oLZPp+3xuQLLYWTD0IeW4wqB4YveRahPZ5fYZybOIM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XVspDVY5fHL/cG6EVZwbZ1WQQEq4/VFry4oW4O0YCgUBTGxKu5ZrRJ9ZXNniIsrmJd2J045KPqKfzXDQt7DJqEkoVMkE/bjJlZKUQBw4FfNediYC3bKwWRia51+nSiZ21uM2tqVjlj1KrztMZ14DiCMjOHvGgH30CrYAF5cnoZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=sX6cxsEG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="sX6cxsEG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74D25C4CEDF;
	Tue,  4 Feb 2025 11:09:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1738667385;
	bh=2oLZPp+3xuQLLYWTD0IeW4wqB4YveRahPZ5fYZybOIM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=sX6cxsEGDxun7fzpRPcmC0dCNoCQAR2NCKCYzQl6DU8MFZWQdPYs98V0xYjCgUwBR
	 WiqF/4rm2dggRqFWF5p5Zb204LxvjJTyKC4b5R7bkf3TAw7eb5ant6SE/T90PbhQZV
	 Umul3AcZCu9UbVyImabPcMiBsS4nGxmFPCe1xTwI=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: linux-kernel@vger.kernel.org,
	"Rafael J. Wysocki" <rafael@kernel.org>,
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
	linux-usb@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: [PATCH v2 2/5] regulator: dummy: convert to use the faux bus
Date: Tue,  4 Feb 2025 12:09:14 +0100
Message-ID: <2025020424-shuffle-facedown-973f@gregkh>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <2025020421-poster-moisture-534b@gregkh>
References: <2025020421-poster-moisture-534b@gregkh>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2727; i=gregkh@linuxfoundation.org; h=from:subject:message-id; bh=2oLZPp+3xuQLLYWTD0IeW4wqB4YveRahPZ5fYZybOIM=; b=owGbwMvMwCRo6H6F97bub03G02pJDOkLv6a8tjzI1pXwe6V4068H/Fv9/4VEe3WGOxRs6Ht2a ncj2wPujlgWBkEmBlkxRZYv23iO7q84pOhlaHsaZg4rE8gQBi5OAZiIuRDDfP83AVV5ix7cnMVt H/Xdrqw5MCpRm2F+7cxbU48o2Vz/Gxak8375u9uHTFwbAQ==
X-Developer-Key: i=gregkh@linuxfoundation.org; a=openpgp; fpr=F4B60CC5BF78C2214A313DCB3147D40DDB2DFB29
Content-Transfer-Encoding: 8bit

The dummy regulator driver does not need to create a platform device, it
only did so because it was simple to do.  Change it over to use the
faux bus instead as this is NOT a real platform device, and it makes
the code even smaller than before.

Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 v2: - renamed vdev variable to fdev thanks to Mark

 drivers/regulator/dummy.c | 37 +++++++++----------------------------
 1 file changed, 9 insertions(+), 28 deletions(-)

diff --git a/drivers/regulator/dummy.c b/drivers/regulator/dummy.c
index 5b9b9e4e762d..4dfff27d5b03 100644
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

