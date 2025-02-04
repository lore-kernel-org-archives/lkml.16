Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F41D620DD64;
	Tue,  4 Feb 2025 11:09:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738667396; cv=none; b=c36goRrvyGXOFxls13KCf5mODA0f91J0V0YK15UtgKwLkg5wyMF4ZV+JI1mp+/M1GI+9Aj71O/CqYiBPJQniyOrTiKYFhBBDlj+iyCgE6YuwmgK8IIMdJnvJvpiOW0llOxjZS9DCdTLiHHLHLvEO9+HtsIgqcyAiuHD+zLKghEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738667396; c=relaxed/simple;
	bh=ntgkV69b2fyGJypAfUMTQ4pQJEyhemVKS7tW1bGczT0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gR7Dekz/uT4/ahfu9TOCzaXPKK3lZjBlcR7QRXxMUPFqHoUbCBpmmDqOMwWvFphXcdaCAvSHN8fBuRdv6Vfj/XU/zsjgftJ4oagcao8vxEPGdQn9EvSGy+YnDabq32kNaX6+y//lfT+O8psbH1wplvqa33HGw2lZD7Nngesea0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=m5OpiXnJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="m5OpiXnJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6BD0C4CEE4;
	Tue,  4 Feb 2025 11:09:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1738667395;
	bh=ntgkV69b2fyGJypAfUMTQ4pQJEyhemVKS7tW1bGczT0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=m5OpiXnJL/VJ7CuaMpqzR1NQBzX6td9VU/aPCBR7oSkz6XW9uknmvfpyLyTsMTdRz
	 6qYahXaiBgKY0NDtUPaw5KAX5Ec5l+HzNy1n7a2EkEAKIFsk5eTA+HdNRhgeJ3+VVB
	 OYqQ5CpQQrmCMsVgy/571Gmx0gHW4y+hhEzY2Zew=
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
Subject: [PATCH v2 5/5] wifi: cfg80211: move away from using a fake platform device
Date: Tue,  4 Feb 2025 12:09:17 +0100
Message-ID: <2025020425-esquire-tucking-7521@gregkh>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <2025020421-poster-moisture-534b@gregkh>
References: <2025020421-poster-moisture-534b@gregkh>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4009; i=gregkh@linuxfoundation.org; h=from:subject:message-id; bh=ntgkV69b2fyGJypAfUMTQ4pQJEyhemVKS7tW1bGczT0=; b=owGbwMvMwCRo6H6F97bub03G02pJDOkLv6buK9h3oSJQduHZKc+Yck6ZbHR/xC1Y/u5H+PZ3/ z45+rxT7ohlYRBkYpAVU2T5so3n6P6KQ4pehranYeawMoEMYeDiFICJbPBgmMNxcvnN43x/N+2e K+fqFxBwYuPX06wMc6Usl2yeHdLgK7642eT1U32fZAn+aQA=
X-Developer-Key: i=gregkh@linuxfoundation.org; a=openpgp; fpr=F4B60CC5BF78C2214A313DCB3147D40DDB2DFB29
Content-Transfer-Encoding: 8bit

Downloading firmware needs a device to hang off of, and so a platform
device seemed like the simplest way to do this.  Now that we have a faux
device interface, use that instead as this "regulatory device" is not
anything resembling a platform device at all.

Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 v2: new example patch in this series

 net/wireless/reg.c | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/net/wireless/reg.c b/net/wireless/reg.c
index 2dd0533e7660..e7a7179eb14d 100644
--- a/net/wireless/reg.c
+++ b/net/wireless/reg.c
@@ -53,7 +53,7 @@
 #include <linux/list.h>
 #include <linux/ctype.h>
 #include <linux/nl80211.h>
-#include <linux/platform_device.h>
+#include <linux/device/faux.h>
 #include <linux/verification.h>
 #include <linux/moduleparam.h>
 #include <linux/firmware.h>
@@ -105,7 +105,7 @@ static struct regulatory_request __rcu *last_request =
 	(void __force __rcu *)&core_request_world;
 
 /* To trigger userspace events and load firmware */
-static struct platform_device *reg_pdev;
+static struct faux_device *reg_fdev;
 
 /*
  * Central wireless core regulatory domains, we only need two,
@@ -582,7 +582,7 @@ static int call_crda(const char *alpha2)
 	else
 		pr_debug("Calling CRDA to update world regulatory domain\n");
 
-	ret = kobject_uevent_env(&reg_pdev->dev.kobj, KOBJ_CHANGE, env);
+	ret = kobject_uevent_env(&reg_fdev->dev.kobj, KOBJ_CHANGE, env);
 	if (ret)
 		return ret;
 
@@ -778,7 +778,7 @@ static bool regdb_has_valid_signature(const u8 *data, unsigned int size)
 	const struct firmware *sig;
 	bool result;
 
-	if (request_firmware(&sig, "regulatory.db.p7s", &reg_pdev->dev))
+	if (request_firmware(&sig, "regulatory.db.p7s", &reg_fdev->dev))
 		return false;
 
 	result = verify_pkcs7_signature(data, size, sig->data, sig->size,
@@ -1060,7 +1060,7 @@ static int query_regdb_file(const char *alpha2)
 		return -ENOMEM;
 
 	err = request_firmware_nowait(THIS_MODULE, true, "regulatory.db",
-				      &reg_pdev->dev, GFP_KERNEL,
+				      &reg_fdev->dev, GFP_KERNEL,
 				      (void *)alpha2, regdb_fw_cb);
 	if (err)
 		kfree(alpha2);
@@ -1076,7 +1076,7 @@ int reg_reload_regdb(void)
 	const struct ieee80211_regdomain *current_regdomain;
 	struct regulatory_request *request;
 
-	err = request_firmware(&fw, "regulatory.db", &reg_pdev->dev);
+	err = request_firmware(&fw, "regulatory.db", &reg_fdev->dev);
 	if (err)
 		return err;
 
@@ -4297,12 +4297,12 @@ static int __init regulatory_init_db(void)
 	 * in that case, don't try to do any further work here as
 	 * it's doomed to lead to crashes.
 	 */
-	if (IS_ERR_OR_NULL(reg_pdev))
+	if (!reg_fdev)
 		return -EINVAL;
 
 	err = load_builtin_regdb_keys();
 	if (err) {
-		platform_device_unregister(reg_pdev);
+		faux_device_destroy(reg_fdev);
 		return err;
 	}
 
@@ -4310,7 +4310,7 @@ static int __init regulatory_init_db(void)
 	err = regulatory_hint_core(cfg80211_world_regdom->alpha2);
 	if (err) {
 		if (err == -ENOMEM) {
-			platform_device_unregister(reg_pdev);
+			faux_device_destroy(reg_fdev);
 			return err;
 		}
 		/*
@@ -4339,9 +4339,9 @@ late_initcall(regulatory_init_db);
 
 int __init regulatory_init(void)
 {
-	reg_pdev = platform_device_register_simple("regulatory", 0, NULL, 0);
-	if (IS_ERR(reg_pdev))
-		return PTR_ERR(reg_pdev);
+	reg_fdev = faux_device_create("regulatory", NULL);
+	if (!reg_fdev)
+		return -ENODEV;
 
 	rcu_assign_pointer(cfg80211_regdomain, cfg80211_world_regdom);
 
@@ -4369,9 +4369,9 @@ void regulatory_exit(void)
 	reset_regdomains(true, NULL);
 	rtnl_unlock();
 
-	dev_set_uevent_suppress(&reg_pdev->dev, true);
+	dev_set_uevent_suppress(&reg_fdev->dev, true);
 
-	platform_device_unregister(reg_pdev);
+	faux_device_destroy(reg_fdev);
 
 	list_for_each_entry_safe(reg_beacon, btmp, &reg_pending_beacons, list) {
 		list_del(&reg_beacon->list);
-- 
2.48.1

