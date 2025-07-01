Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70ADA51022
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 10:54:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751367266; cv=none; b=oTCaaZ1KI0+R9rXmVWWjOg8s4VFXuHIA8IpP/08diMtOvQQZ0/sIkxGXOJ/eY1OJH29LcxMQrTn3JanU0EWhzh6ylk7QIqglVW2xRJB0fWeq8A9xGTAPBE1Q+KJJv6EE/pxtDbE/6ACcyk6mgpbHlNnlOuqbr7Ry/LvIh3o5o8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751367266; c=relaxed/simple;
	bh=Iy5KudkkfMC3VwgAnDQaDikBuBnSajHd89CSgYTrzgc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CWcRedzSKJs83nZbWikXhVm5TfFjaC+K2hXUqxMLUdX5XR1Advo9+UGHybD3Jw40MIMySWxkr7OrJ1iMCitWfaZDaG0LsLwd1srCOuc/BqaXyF6PwSYjgXHGbO2MYuoBY7veOfwFXqm/rAVta3xInD0kzGXnNTKa/z99HqIS3Ys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=fEhZNrrE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="fEhZNrrE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80D38C4CEEB;
	Tue,  1 Jul 2025 10:54:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1751367266;
	bh=Iy5KudkkfMC3VwgAnDQaDikBuBnSajHd89CSgYTrzgc=;
	h=From:To:Cc:Subject:Date:From;
	b=fEhZNrrE8JtR1skHpmMOHtT47yQahDH/+3+wek8y9mv8Xh0Cp21yID1dVh8rtn8tm
	 9l47F/ayh0K1EpDmfw5x4A9TFvQnixKdreRLSmFCofFcs6nrjJVJp7mYbSmX5O/KK+
	 E4nx0DaaW/CHBK4Lq8+reKVzItUvnraUDeuxrVuY=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: linux-kernel@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Borislav Petkov <bp@alien8.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: [PATCH v5] x86/microcode: move away from using a fake platform device
Date: Tue,  1 Jul 2025 12:54:22 +0200
Message-ID: <2025070121-omission-small-9308@gregkh>
X-Mailer: git-send-email 2.50.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2676; i=gregkh@linuxfoundation.org; h=from:subject:message-id; bh=Iy5KudkkfMC3VwgAnDQaDikBuBnSajHd89CSgYTrzgc=; b=owGbwMvMwCRo6H6F97bub03G02pJDBnJ++JOl50WF2x1PbvqSRP7duM9CRtyXl/2PTU7yS/pb /uKbvGbHbEsDIJMDLJiiixftvEc3V9xSNHL0PY0zBxWJpAhDFycAjCRu7kM86y+LupQLgxWjgzq mPSKp1rr1s2nCxnmmXJN+rN/iVqJ1/1Ha/YX5bJwSISfAwA=
X-Developer-Key: i=gregkh@linuxfoundation.org; a=openpgp; fpr=F4B60CC5BF78C2214A313DCB3147D40DDB2DFB29
Content-Transfer-Encoding: 8bit

Downloading firmware needs a device to hang off of, and so a platform
device seemed like the simplest way to do this.  Now that we have a faux
device interface, use that instead as this "microcode device" is not
anything resembling a platform device at all.

Cc: Borislav Petkov <bp@alien8.de>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Dave Hansen <dave.hansen@linux.intel.com>
Cc: <x86@kernel.org>
Cc: "H. Peter Anvin" <hpa@zytor.com>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
v5: - rebase against 6.16-rc4 and actually cc: the relevant maintainers
      this time, doh!
v4: - api tweaked due to parent pointer added to faux_device create
      function.
v3: - no change
v2: - new patch in a larger series

 arch/x86/kernel/cpu/microcode/core.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/x86/kernel/cpu/microcode/core.c b/arch/x86/kernel/cpu/microcode/core.c
index fe50eb5b7c4a..b92e09a87c69 100644
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
@@ -249,7 +249,7 @@ static void reload_early_microcode(unsigned int cpu)
 }
 
 /* fake device for request_firmware */
-static struct platform_device	*microcode_pdev;
+static struct faux_device *microcode_fdev;
 
 #ifdef CONFIG_MICROCODE_LATE_LOADING
 /*
@@ -690,7 +690,7 @@ static int load_late_locked(void)
 	if (!setup_cpus())
 		return -EBUSY;
 
-	switch (microcode_ops->request_microcode_fw(0, &microcode_pdev->dev)) {
+	switch (microcode_ops->request_microcode_fw(0, &microcode_fdev->dev)) {
 	case UCODE_NEW:
 		return load_late_stop_cpus(false);
 	case UCODE_NEW_SAFE:
@@ -841,9 +841,9 @@ static int __init microcode_init(void)
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
@@ -862,7 +862,7 @@ static int __init microcode_init(void)
 	return 0;
 
  out_pdev:
-	platform_device_unregister(microcode_pdev);
+	faux_device_destroy(microcode_fdev);
 	return error;
 
 }
-- 
2.50.0

