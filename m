Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00B4A18B495;
	Thu,  6 Feb 2025 17:38:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738863528; cv=none; b=NuHyc7Ml06wpDkS3LLnmkhEYNxpnqWb4ulymCr3aq8oz6bbV0U90xEksKGJ2L82AuSIlDgmSAXQTtvVMVsQhIx2iiumSuXbqJ65zdbyVaeOEcVbUUiRqRKiz+7f3z/xe3OQd5Q1MSrf+wPIBorMEN6oUHGXTRJL4uo93GcT95VE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738863528; c=relaxed/simple;
	bh=x/i7HqcmmGO7AfmigYoxB9WwFMZPo7dI4JfYsd4nJOA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZiBYTsE05efSJ4zesfyKjr3eskPRc23DPQF7Em0/eecI4J0usYPe6UWfUi2CLf+U0rdma3Nib7dNUkYYjkqPlOJ03MjjfGJ7sYJR2jYVtNB7FhmrpImrg+hKocEQrSmJdruIxpgvJCrjau5DQXVCIvvnSjyPfc35qYjF7ShEuHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=kTpkIEi4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="kTpkIEi4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5254AC4CEDD;
	Thu,  6 Feb 2025 17:38:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1738863527;
	bh=x/i7HqcmmGO7AfmigYoxB9WwFMZPo7dI4JfYsd4nJOA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kTpkIEi4ESqRssdn82hL9A+u83gR3e0r2SCNUpQf4KjZ0jtgSIdo0jRBoLScEA+Kv
	 qjc0y26A7M65N5QjjW8QNzCC78rKHN0ao8kH5zfrJlTLl/gRYkWzNfMsA9aJsaUepA
	 9xcMeYSba7LywiTvl8pkjcOLysML11rgahxVBgqo=
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
Subject: [PATCH v3 3/8] x86/microcode: move away from using a fake platform device
Date: Thu,  6 Feb 2025 18:38:17 +0100
Message-ID: <2025020624-crinkle-refusal-eb28@gregkh>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <2025020620-skedaddle-olympics-1735@gregkh>
References: <2025020620-skedaddle-olympics-1735@gregkh>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2265; i=gregkh@linuxfoundation.org; h=from:subject:message-id; bh=x/i7HqcmmGO7AfmigYoxB9WwFMZPo7dI4JfYsd4nJOA=; b=owGbwMvMwCRo6H6F97bub03G02pJDOlLPk/gkXHW0PWrPJZmLPf+fMW+K1P38a0+3xy8687f/ 8e/Bofod8SyMAgyMciKKbJ82cZzdH/FIUUvQ9vTMHNYmUCGMHBxCsBEjrcxzNN6aPplnVlFWp2Q g8st9s9f2C1OvGVYcNQzOMqQa8aPmnebj11TuM6y0tR6OwA=
X-Developer-Key: i=gregkh@linuxfoundation.org; a=openpgp; fpr=F4B60CC5BF78C2214A313DCB3147D40DDB2DFB29
Content-Transfer-Encoding: 8bit

Downloading firmware needs a device to hang off of, and so a platform
device seemed like the simplest way to do this.  Now that we have a faux
device interface, use that instead as this "microcode device" is not
anything resembling a platform device at all.

Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
v3: no change
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

