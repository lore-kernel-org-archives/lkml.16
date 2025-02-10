Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 539B6223337;
	Mon, 10 Feb 2025 12:30:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739190654; cv=none; b=GuUxIWbRhU36Dm6luC+vhDiIMyomYUN1EP2/LbrzrzHy1/v0A8dL8rLTSfh2rSSVKIyHVymxU5rcQS5sHbQe91fBMJcRLk1N6qkz1TKr+N4Gz5xdZbi1Y677gsBF3vX7U83kOgQpavV0TfIteeuTOCgUdcFzBqVBOVFZxbpccyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739190654; c=relaxed/simple;
	bh=eCnKjjyJ2UX/D32iyn0apacG6N4sVKMOHK6cDLE6A94=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JGu3loz7q/OmWhXtMq3M0mmqgPclb6C8PeiMVdYvVc18crrsoSpAxcY2LDb4z2bbajeeSOGHy/cJKnz0t/O+MRkczdBTyN7nF16FT1PYuE+VnKt96USwWVDaYMm+5tkEgzjMSqk2aVZ0gjymYEhpoiSIfC5ybrczluxFVR6pz2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Y9fsV7no; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Y9fsV7no"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1EA56C4CEDF;
	Mon, 10 Feb 2025 12:30:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1739190653;
	bh=eCnKjjyJ2UX/D32iyn0apacG6N4sVKMOHK6cDLE6A94=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Y9fsV7noWhPjb2rWV1dBgIhwvNzFm6oS1EX9Sw00WFLx1lurYQEgkBHGJST+/eBrY
	 em9yh60FTU0313WzqDf3FDz2LKoyjWaJl0taSL3i0zKfpg64+9CDO5Abxl+5MKI7kg
	 1NBUwEUJTRW5L28v8vUgtEhT9SWLQa3HRrqVuWlg=
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
Subject: [PATCH v4 4/9] x86/microcode: move away from using a fake platform device
Date: Mon, 10 Feb 2025 13:30:28 +0100
Message-ID: <2025021027-spotting-unraveled-7cb4@gregkh>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <2025021023-sandstorm-precise-9f5d@gregkh>
References: <2025021023-sandstorm-precise-9f5d@gregkh>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2357; i=gregkh@linuxfoundation.org; h=from:subject:message-id; bh=eCnKjjyJ2UX/D32iyn0apacG6N4sVKMOHK6cDLE6A94=; b=owGbwMvMwCRo6H6F97bub03G02pJDOkrPyZvFtBzC/q1gvfDzidN1wQ0Hr1NvGl7ZGdM4daf7 BOdXZ9kdMSyMAgyMciKKbJ82cZzdH/FIUUvQ9vTMHNYmUCGMHBxCsBERJcwzE+Qe5m76JbIMe2d 027K1N56bdLvH8owP8xhqSjLuUcdb9f83LfbQt/z6I3d5gA=
X-Developer-Key: i=gregkh@linuxfoundation.org; a=openpgp; fpr=F4B60CC5BF78C2214A313DCB3147D40DDB2DFB29
Content-Transfer-Encoding: 8bit

Downloading firmware needs a device to hang off of, and so a platform
device seemed like the simplest way to do this.  Now that we have a faux
device interface, use that instead as this "microcode device" is not
anything resembling a platform device at all.

Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
v4: - api tweaked due to parent pointer added to faux_device create
      function.
v3: no change
v2: new example patch in this series
 arch/x86/kernel/cpu/microcode/core.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/x86/kernel/cpu/microcode/core.c b/arch/x86/kernel/cpu/microcode/core.c
index b3658d11e7b6..35de3db8bc60 100644
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
+	microcode_fdev = faux_device_create("microcode", NULL, NULL);
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

