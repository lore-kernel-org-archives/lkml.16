Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC81D1E25F2
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 10:39:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743417564; cv=none; b=U19d4kkyN47Z+UgBtqLXProoF1fSCSrEm/C1PeBSP6lxqN5/Li/Z2ESIX67e9PzX0MRzjoVSxJnqsmQcISQdYW6QDk23nlDthM0s8/NaDNRFU7w+7lAMLcsHRn9YBjVilufwUcUsdaVGfHhJWWwamcmMIgrwmHlhjhPQLNNsjSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743417564; c=relaxed/simple;
	bh=qNUkPEAOFr9s3u9+1N+R65n8ZIruRlp2N14UPTd/oTk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=U4nMCDRFKAHfmE4ncR7nOogcSSljm1CgPcGM/y/QxCV/WMIKJLB30Svkjy9E43oNeKHANcS9UIwHUtzkKp+QP/r6wzmKtfOTCVPbYjd6gzrCVJfzRiaSf1JLveBhF9bKEO0WbaJHsc5sk+TsihVEQs2UFqABiLNqKfiFJGhiniM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gUn4Iw6g; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gUn4Iw6g"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743417561;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VLNaodPChg0Hvto5PGR4xI34k649VIS6rrR+H3wA3Bw=;
	b=gUn4Iw6g7TSGv8C3Mnab6CfnPzPLIFvkwxrfBiwjP77w+H0S4jzaogQLPshrFlEj3P6YQ0
	EPRr9Xxr7NtHIlhfWVqfdE4uRsovK8val3gYECjiYhklXe27TVetHrdS5qSX4UMU3f2wsg
	Yyv9dxkeeZfprQBNTp0KwIvCbMouv9c=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-52-ctKu4Uo_Otu3CHwDeTazwA-1; Mon, 31 Mar 2025 06:39:20 -0400
X-MC-Unique: ctKu4Uo_Otu3CHwDeTazwA-1
X-Mimecast-MFC-AGG-ID: ctKu4Uo_Otu3CHwDeTazwA_1743417559
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-43941ad86d4so21866875e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 03:39:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743417559; x=1744022359;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VLNaodPChg0Hvto5PGR4xI34k649VIS6rrR+H3wA3Bw=;
        b=D94cUr6M7iKDrQETROZpQU+f+YA1dhMC0e9tYD+RkJCxOFWB4+V/ghmAvOQVdLuo2+
         vO9egZQ4IUS+tbSIj4xpPmEj9TD8sT0ZYBXV/0j8DR8vqTR1ec9IF9HXlALbGkeouZN1
         eWDw/9rqy0DN25uRNXWEav+flPCgLtttIwmj6c6sScZO4yqnpRfKLFS/nLkC6GxPYnSw
         GwXK+XGI7LS4Z+iXaAZjCKocd/zFI8uPYRfQRPHulvQ37SLVQ1fodvLXl91ex3hOyq8X
         diB6w0MgYec70VUC7p4pVc/TA/uEsc3givFLJ4EbrdQ84EjyLFtVU1rBbqlvJa8GtHTe
         Ok3Q==
X-Gm-Message-State: AOJu0Yy10TEzawuMlhDoe36NQ/olmCH9RbAwvMOlILJdqBRtYNZ4xb15
	U2wVtBb+/Yb5hVTaBrHspuVUcnPJtRasIIOWYIBFa3eWL2Y88pfOu3DRdP1pUVw0JTIlGyM4+na
	ldgR/WRuaujljH57XYWt5ee4gY342/qTDtPinHOsoPZf4sR1IdgnLknJUIjbSLg==
X-Gm-Gg: ASbGncvsrgpXpTmz4c7W4oeIa4E1wlsZDibmnosNbg93vp0pY0Ga3XZLZj+xnVeR9jw
	PTds7vZB312mZQ7JhezG16aLHmtdM3f5E4juvHfiBM/gckvGnWANrhS784bqXZqv36s3ZXY+XrG
	0Ny5ufOUylUus39VHCfw4oqs3WgRZi8Eygai0XcOKjm3LJg8KVMgCAeCu0vO8a9TCB7E33UO4w7
	tyg03f1bqWKqVPxF6Dc+st0kmKWoW0++j3FW+ZN9AzB3xgkrPTTLFsAdipaszvgyAx/SjHb2Rtm
	E7KWt173i0tvnBDifFNP2eNcHgS71tSOtm/WDlUqXe/jTghPXdpGIfZVCV55Fl0a7Q==
X-Received: by 2002:a05:600c:310c:b0:43c:f0ae:da7 with SMTP id 5b1f17b1804b1-43db6220338mr59426665e9.7.1743417559204;
        Mon, 31 Mar 2025 03:39:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF+WzP2dz1EIJQGOldj+zQL43EnPVTY9MCareNEo3aP+vhWVaYm2IxGbFuiRK4ytEpi7g7kLg==
X-Received: by 2002:a05:600c:310c:b0:43c:f0ae:da7 with SMTP id 5b1f17b1804b1-43db6220338mr59426235e9.7.1743417558576;
        Mon, 31 Mar 2025 03:39:18 -0700 (PDT)
Received: from stex1.redhat.com (host-87-12-25-55.business.telecomitalia.it. [87.12.25.55])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d82e6adf6sm159151665e9.15.2025.03.31.03.39.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Mar 2025 03:39:17 -0700 (PDT)
From: Stefano Garzarella <sgarzare@redhat.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	Jason Gunthorpe <jgg@ziepe.ca>,
	James Bottomley <James.Bottomley@HansenPartnership.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Borislav Petkov <bp@alien8.de>,
	linux-integrity@vger.kernel.org,
	Peter Huewe <peterhuewe@gmx.de>,
	Ingo Molnar <mingo@redhat.com>,
	linux-coco@lists.linux.dev,
	Dov Murik <dovmurik@linux.ibm.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Joerg Roedel <jroedel@suse.de>,
	x86@kernel.org,
	Dionna Glaze <dionnaglaze@google.com>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	Claudio Carvalho <cclaudio@linux.ibm.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Stefano Garzarella <sgarzare@redhat.com>
Subject: [PATCH v5 3/4] tpm: add SNP SVSM vTPM driver
Date: Mon, 31 Mar 2025 12:38:56 +0200
Message-ID: <20250331103900.92701-4-sgarzare@redhat.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250331103900.92701-1-sgarzare@redhat.com>
References: <20250331103900.92701-1-sgarzare@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Garzarella <sgarzare@redhat.com>

Add driver for the vTPM defined by the AMD SVSM spec [1].

The specification defines a protocol that a SEV-SNP guest OS can use to
discover and talk to a vTPM emulated by the Secure VM Service Module (SVSM)
in the guest context, but at a more privileged level (VMPL0).

The new tpm-svsm platform driver uses two functions exposed by x86/sev
to verify that the device is actually emulated by the platform and to
send commands and receive responses.

The device cannot be hot-plugged/unplugged as it is emulated by the
platform, so we can use module_platform_driver_probe(). The probe
function will only check whether in the current runtime configuration,
SVSM is present and provides a vTPM.

This device does not support interrupts and sends responses to commands
synchronously. In order to have .recv() called just after .send() in
tpm_try_transmit(), the .status() callback returns 0, and both
.req_complete_mask and .req_complete_val are set to 0.

[1] "Secure VM Service Module for SEV-SNP Guests"
    Publication # 58019 Revision: 1.00

Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
---
v5:
- removed cancel/status/req_* ops after rebase on master that cotains
  commit 980a573621ea ("tpm: Make chip->{status,cancel,req_canceled} opt")
v4:
- moved "asm" includes after the "linux" includes [Tom]
- allocated buffer separately [Tom/Jarkko/Jason]
v3:
- removed send_recv() ops and followed the ftpm driver implementing .status,
  .req_complete_mask, .req_complete_val, etc. [Jarkko]
- removed link to the spec because those URLs are unstable [Borislav]
---
 drivers/char/tpm/tpm_svsm.c | 135 ++++++++++++++++++++++++++++++++++++
 drivers/char/tpm/Kconfig    |  10 +++
 drivers/char/tpm/Makefile   |   1 +
 3 files changed, 146 insertions(+)
 create mode 100644 drivers/char/tpm/tpm_svsm.c

diff --git a/drivers/char/tpm/tpm_svsm.c b/drivers/char/tpm/tpm_svsm.c
new file mode 100644
index 000000000000..04c532421ff2
--- /dev/null
+++ b/drivers/char/tpm/tpm_svsm.c
@@ -0,0 +1,135 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2025 Red Hat, Inc. All Rights Reserved.
+ *
+ * Driver for the vTPM defined by the AMD SVSM spec [1].
+ *
+ * The specification defines a protocol that a SEV-SNP guest OS can use to
+ * discover and talk to a vTPM emulated by the Secure VM Service Module (SVSM)
+ * in the guest context, but at a more privileged level (usually VMPL0).
+ *
+ * [1] "Secure VM Service Module for SEV-SNP Guests"
+ *     Publication # 58019 Revision: 1.00
+ */
+
+#include <linux/module.h>
+#include <linux/kernel.h>
+#include <linux/platform_device.h>
+#include <linux/tpm_svsm.h>
+
+#include <asm/sev.h>
+
+#include "tpm.h"
+
+struct tpm_svsm_priv {
+	void *buffer;
+	u8 locality;
+};
+
+static int tpm_svsm_send(struct tpm_chip *chip, u8 *buf, size_t len)
+{
+	struct tpm_svsm_priv *priv = dev_get_drvdata(&chip->dev);
+	int ret;
+
+	ret = svsm_vtpm_cmd_request_fill(priv->buffer, priv->locality, buf, len);
+	if (ret)
+		return ret;
+
+	/*
+	 * The SVSM call uses the same buffer for the command and for the
+	 * response, so after this call, the buffer will contain the response
+	 * that can be used by .recv() op.
+	 */
+	return snp_svsm_vtpm_send_command(priv->buffer);
+}
+
+static int tpm_svsm_recv(struct tpm_chip *chip, u8 *buf, size_t len)
+{
+	struct tpm_svsm_priv *priv = dev_get_drvdata(&chip->dev);
+
+	/*
+	 * The internal buffer contains the response after we send the command
+	 * to SVSM.
+	 */
+	return svsm_vtpm_cmd_response_parse(priv->buffer, buf, len);
+}
+
+static struct tpm_class_ops tpm_chip_ops = {
+	.flags = TPM_OPS_AUTO_STARTUP,
+	.recv = tpm_svsm_recv,
+	.send = tpm_svsm_send,
+};
+
+static int __init tpm_svsm_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct tpm_svsm_priv *priv;
+	struct tpm_chip *chip;
+	int err;
+
+	if (!snp_svsm_vtpm_probe())
+		return -ENODEV;
+
+	priv = devm_kmalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	/*
+	 * The maximum buffer supported is one page (see SVSM_VTPM_MAX_BUFFER
+	 * in tpm_svsm.h).
+	 */
+	priv->buffer = (void *)devm_get_free_pages(dev, GFP_KERNEL, 0);
+	if (!priv->buffer)
+		return -ENOMEM;
+
+	/*
+	 * FIXME: before implementing locality we need to agree what it means
+	 * for the SNP SVSM vTPM
+	 */
+	priv->locality = 0;
+
+	chip = tpmm_chip_alloc(dev, &tpm_chip_ops);
+	if (IS_ERR(chip))
+		return PTR_ERR(chip);
+
+	dev_set_drvdata(&chip->dev, priv);
+
+	err = tpm2_probe(chip);
+	if (err)
+		return err;
+
+	err = tpm_chip_register(chip);
+	if (err)
+		return err;
+
+	dev_info(dev, "SNP SVSM vTPM %s device\n",
+		 (chip->flags & TPM_CHIP_FLAG_TPM2) ? "2.0" : "1.2");
+
+	return 0;
+}
+
+static void __exit tpm_svsm_remove(struct platform_device *pdev)
+{
+	struct tpm_chip *chip = platform_get_drvdata(pdev);
+
+	tpm_chip_unregister(chip);
+}
+
+/*
+ * tpm_svsm_remove() lives in .exit.text. For drivers registered via
+ * module_platform_driver_probe() this is ok because they cannot get unbound
+ * at runtime. So mark the driver struct with __refdata to prevent modpost
+ * triggering a section mismatch warning.
+ */
+static struct platform_driver tpm_svsm_driver __refdata = {
+	.remove = __exit_p(tpm_svsm_remove),
+	.driver = {
+		.name = "tpm-svsm",
+	},
+};
+
+module_platform_driver_probe(tpm_svsm_driver, tpm_svsm_probe);
+
+MODULE_DESCRIPTION("SNP SVSM vTPM Driver");
+MODULE_LICENSE("GPL");
+MODULE_ALIAS("platform:tpm-svsm");
diff --git a/drivers/char/tpm/Kconfig b/drivers/char/tpm/Kconfig
index fe4f3a609934..dddd702b2454 100644
--- a/drivers/char/tpm/Kconfig
+++ b/drivers/char/tpm/Kconfig
@@ -234,5 +234,15 @@ config TCG_FTPM_TEE
 	help
 	  This driver proxies for firmware TPM running in TEE.
 
+config TCG_SVSM
+	tristate "SNP SVSM vTPM interface"
+	depends on AMD_MEM_ENCRYPT
+	help
+	  This is a driver for the AMD SVSM vTPM protocol that a SEV-SNP guest
+	  OS can use to discover and talk to a vTPM emulated by the Secure VM
+	  Service Module (SVSM) in the guest context, but at a more privileged
+	  level (usually VMPL0).  To compile this driver as a module, choose M
+	  here; the module will be called tpm_svsm.
+
 source "drivers/char/tpm/st33zp24/Kconfig"
 endif # TCG_TPM
diff --git a/drivers/char/tpm/Makefile b/drivers/char/tpm/Makefile
index 2b004df8c04b..9de1b3ea34a9 100644
--- a/drivers/char/tpm/Makefile
+++ b/drivers/char/tpm/Makefile
@@ -45,3 +45,4 @@ obj-$(CONFIG_TCG_CRB) += tpm_crb.o
 obj-$(CONFIG_TCG_ARM_CRB_FFA) += tpm_crb_ffa.o
 obj-$(CONFIG_TCG_VTPM_PROXY) += tpm_vtpm_proxy.o
 obj-$(CONFIG_TCG_FTPM_TEE) += tpm_ftpm_tee.o
+obj-$(CONFIG_TCG_SVSM) += tpm_svsm.o
-- 
2.49.0

