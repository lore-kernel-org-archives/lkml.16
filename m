Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA71620D514;
	Tue,  4 Feb 2025 11:09:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738667393; cv=none; b=u2P1+Iil5xgiZJ81AAPaDnjMuTPHdRgZxCeApYyVvHButM8qrebLRSJsI0Gi8GU/MSf3U1VXkgiCzmlk49jABHTG0q0JO0IKPat7wVnt3gsl2oEfyOi74V/+qEr2HWeAruWsloFYw+Jcz7It+kXeJGedcAIgnRw7HGiRxEBOYN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738667393; c=relaxed/simple;
	bh=LdW0uVQlr+ae304Zc3rLEEKoqyXxDQFCwoGTQbR2z/Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=liTE13hySbb58TbkftpFRN8U5+fQ+0Ev7qVT9W47L1xfkAa3CFm9zrhikf3Z2+ofUO6OgKbiqEqPw1QLE5vkYoldOY+xCzIuqlqfSEVzcvD8VA+54g5QM0SVmRENG3GJ2mHEcriwkz65PyYuGYEyzFZ8WmEXSotQ+6QFGTS2jBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=CmMUIrIP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="CmMUIrIP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C835AC4CEE2;
	Tue,  4 Feb 2025 11:09:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1738667392;
	bh=LdW0uVQlr+ae304Zc3rLEEKoqyXxDQFCwoGTQbR2z/Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CmMUIrIPH1RbtuN6Kd0eHH7037I/7f/31Zbg4YZmbd3APqSUpMia0i9zQa3Uzd92Y
	 dlU1bLN04TZPjyYHH93exJjPYdGMNPeni1jw6wzuKx4P5Hncu0yhA8dGPfgH6dBYzm
	 DVTRm5w9JAkIkTdauMLeMGnkUjvOkW00YJp7r33g=
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
Subject: [PATCH v2 4/5] x86/microcode: move away from using a fake platform device
Date: Tue,  4 Feb 2025 12:09:16 +0100
Message-ID: <2025020425-try-clicker-2267@gregkh>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <2025020421-poster-moisture-534b@gregkh>
References: <2025020421-poster-moisture-534b@gregkh>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2253; i=gregkh@linuxfoundation.org; h=from:subject:message-id; bh=LdW0uVQlr+ae304Zc3rLEEKoqyXxDQFCwoGTQbR2z/Y=; b=owGbwMvMwCRo6H6F97bub03G02pJDOkLv6b+41bedtA0K3rpbp+Zeo4v5nw/+D72v3feZ7ufW e2sK/fc64hlYRBkYpAVU2T5so3n6P6KQ4pehranYeawMoEMYeDiFICJRKUyzOE9uIq/sF7X5XUK w8UiNVMxhRvv6hkWzN8pnR14piOx4GHrn/xV9l28XP8NAQ==
X-Developer-Key: i=gregkh@linuxfoundation.org; a=openpgp; fpr=F4B60CC5BF78C2214A313DCB3147D40DDB2DFB29
Content-Transfer-Encoding: 8bit

Downloading firmware needs a device to hang off of, and so a platform
device seemed like the simplest way to do this.  Now that we have a faux
device interface, use that instead as this "microcode device" is not
anything resembling a platform device at all.

Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 v2: new example patch in this series

 arch/x86/kernel/cpu/microcode/core.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/x86/kernel/cpu/microcode/core.c b/arch/x86/kernel/cpu/microcode/core.c
index b3658d11e7b6..f42e0d1b2baa 100644
--- a/arch/x86/kernel/cpu/microcode/core.c
+++ b/arch/x86/kernel/cpu/microcode/core.c
@@ -17,8 +17,8 @@
 
 #define pr_fmt(fmt) "microcode: " fmt
 
-#include <linux/platform_device.h>
 #include <linux/stop_machine.h>
+#include <linux/device/faux.h>
 #include <linux/syscore_ops.h>
 #include <linux/miscdevice.h>
 #include <linux/capability.h>
@@ -238,7 +238,7 @@ static void reload_early_microcode(unsigned int cpu)
 }
 
 /* fake device for request_firmware */
-static struct platform_device	*microcode_pdev;
+static struct faux_device *microcode_fdev;
 
 #ifdef CONFIG_MICROCODE_LATE_LOADING
 /*
@@ -679,7 +679,7 @@ static int load_late_locked(void)
 	if (!setup_cpus())
 		return -EBUSY;
 
-	switch (microcode_ops->request_microcode_fw(0, &microcode_pdev->dev)) {
+	switch (microcode_ops->request_microcode_fw(0, &microcode_fdev->dev)) {
 	case UCODE_NEW:
 		return load_late_stop_cpus(false);
 	case UCODE_NEW_SAFE:
@@ -828,9 +828,9 @@ static int __init microcode_init(void)
 	if (early_data.new_rev)
 		pr_info_once("Updated early from: 0x%08x\n", early_data.old_rev);
 
-	microcode_pdev = platform_device_register_simple("microcode", -1, NULL, 0);
-	if (IS_ERR(microcode_pdev))
-		return PTR_ERR(microcode_pdev);
+	microcode_fdev = faux_device_create("microcode", NULL);
+	if (!microcode_fdev)
+		return -ENODEV;
 
 	dev_root = bus_get_dev_root(&cpu_subsys);
 	if (dev_root) {
@@ -849,7 +849,7 @@ static int __init microcode_init(void)
 	return 0;
 
  out_pdev:
-	platform_device_unregister(microcode_pdev);
+	faux_device_destroy(microcode_fdev);
 	return error;
 
 }
-- 
2.48.1

