Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D72E17A304
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 18:36:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744828622; cv=none; b=qd/HZZgkKCqCCd/YBENUwIEObkEyCO/76HGs+fgH4Hi9cmAzP7umJve4iWndBsDHPRubdqiA7vTh7mwImkm8bjVYkCdzVy7fkuUznwHpaRga9o1MIiLbYR5Oa2nCb6OxFLhXTPpIJuR8fSB01FfpsYnBByCcsIhvLIPDkRCjoig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744828622; c=relaxed/simple;
	bh=qqA9HMIM9rJ6Oe/6DMG/1Oi7kaEeKVFGXK6CNadZHZ4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PufuU3dHGCIXjfoQoJgkHCcCLSnylS3TZGRFDPVZii6ucBSl86VtRT651fkXUWLatiP9G3E7YKjPdrr4RZPqb1ID8I9cZPvpKDgikOKGuIui4g4qfumJyhiocIOrqgUV1zY6sSrnppFukqxmLvrBqDB2evW05+000zrkI/JT+3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=minyard.net; spf=none smtp.mailfrom=minyard.net; dkim=pass (2048-bit key) header.d=minyard-net.20230601.gappssmtp.com header.i=@minyard-net.20230601.gappssmtp.com header.b=2qeHa3yw; arc=none smtp.client-ip=209.85.160.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=minyard.net
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=minyard.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=minyard-net.20230601.gappssmtp.com header.i=@minyard-net.20230601.gappssmtp.com header.b="2qeHa3yw"
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-2c2c754af3cso3567949fac.3
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 11:36:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minyard-net.20230601.gappssmtp.com; s=20230601; t=1744828618; x=1745433418; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Anuae9oBLooGGpyQb2PYwvvmJQX8n5nabFQKUH/ZS6c=;
        b=2qeHa3ywhQKifHu/+9zaccC9Cx9whmbxGg4XK90najmHO6MpdE4InQLuX4zZ0uqyD4
         2g5tqBz2inJH3viZTDyUP2guS+vzIHJZx075ZzRcYK2xr4fCIcyF4fkrMC5UP63VpVdV
         vvQA62S81pcGcAamqGZUNNzXl5ACXWq+Q+MZRZaMNY2WkdX+jA0X1WokKIUykZA21lD+
         0ABDIDyIe9xdQ7kKPzK+ilpmvy2PsxaFstSWhiK60c9TWrIhcuMeiv1ENUGjb1fqTZ+P
         MZu95hvqC0o6l1eShPceO+IpMhnkyniBPaNSAIehg2obT0Bzdp+ZCHd6WYDP/ekk7aoV
         c14g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744828618; x=1745433418;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Anuae9oBLooGGpyQb2PYwvvmJQX8n5nabFQKUH/ZS6c=;
        b=lg2P2Ge7KI46+okFjhNfSlnhKQXvHkoUpYrGPQb3O7icKoBdddy4Dy8quLk8yySd9U
         amlIkYa6iQvUmT4PeSIBCiSYlzRYN4dx8kXF8+5e2+HXwmQs6F84YLxfuChFzgaWJzie
         vA5l651gVKD5tI6CjAQJGJCSlBFCPQiCZfpvp8g7mGTIrORLaQBB3Se6AdSm8i63Jena
         pQY/uuUXXxLOA54MZt2RA2bfqwD0QJgI+ZH4SnJVps2fgtoKj0KtfHY92/aAV9ihvdlU
         71uLeGTVCGRAj08LZ14hGoihEZEPWO3UGWYEIsSF9KmPDVFWvawhFzsjWamCi2qNEtW4
         PUaQ==
X-Gm-Message-State: AOJu0Yzn3qdc5+e0B5pmVsxhJhxUHXqP+pAK+SWND/oWzZg7vX9HgmlQ
	i6J0JTsePW2pwuevP4tsgHF391z2dap9Zyr0AJxeAycRMc0EYYQActsUa9nFMLQ1tthJojKTFaq
	a
X-Gm-Gg: ASbGncvvkYoT0TwbB/P+hUn/ltcUubF11ZYaCsRxTD6MyARYqeO4LZ1B794XhvdLoiE
	oeSLCC33a89A/iPTimSysY+RWKPi8OAwHtav716CMFbYZEcrbeN79GXxkPeNj8/PEbhKo3C8W5g
	PmloslI38VlajAEIcFXdCVqA/JWevXRrF9pCJiR9hEdy6Vtz/xWDPZjIZ5IzhUS96SFEeWi4LHO
	PWorPIXQAG66Mj8hdeD6ofFN3ombhNJ9dOuvPMXWB4OX21mwweNcRnnqmDwGtU0S86TGsMSwpKf
	wCUPkcpXzO7PQCLIQC47IM12IcHM35R12w==
X-Google-Smtp-Source: AGHT+IGZw9PejieqWg6OysS6nq7k0jSAI10a5vfbav8G0BadKBZiA+WvyioSsCiWuH6VWkYiH+yb4A==
X-Received: by 2002:a05:6871:d80a:b0:2d4:c40e:8536 with SMTP id 586e51a60fabf-2d4d29cc893mr1827523fac.7.1744828618047;
        Wed, 16 Apr 2025 11:36:58 -0700 (PDT)
Received: from localhost ([2001:470:b8f6:1b:1e17:765:833b:6e44])
        by smtp.gmail.com with UTF8SMTPSA id 586e51a60fabf-2d0968e090esm3429227fac.6.2025.04.16.11.36.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Apr 2025 11:36:56 -0700 (PDT)
From: Corey Minyard <corey@minyard.net>
To: Linux Kernel <linux-kernel@vger.kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: OpenIPMI Developers <openipmi-developer@lists.sourceforge.net>,
	Corey Minyard <corey@minyard.net>
Subject: [PATCH v2] ipmi:si: Move SI type information into an info structure
Date: Wed, 16 Apr 2025 13:36:15 -0500
Message-ID: <20250416183614.3777003-2-corey@minyard.net>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Andy reported:

Debian clang version 19.1.7 is not happy when compiled with
`make W=1` (note, CONFIG_WERROR=y is the default):

ipmi_si_platform.c:268:15: error: cast to smaller integer type 'enum si_type'
+from 'const void *' [-Werror,-Wvoid-pointer-to-enum-cast]
  268 |         io.si_type      = (enum
+si_type)device_get_match_data(&pdev->dev);

The IPMI SI type is an enum that was cast into a pointer that was
then cast into an enum again.  That's not the greatest style, so
instead create an info structure to hold the data and use that.

Reported-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Closes: https://lore.kernel.org/lkml/20250415085156.446430-1-andriy.shevchenko@linux.intel.com/
Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Corey Minyard <corey@minyard.net>
---
All of Andy's comments addressed.

 drivers/char/ipmi/ipmi_si.h          | 10 +++++-
 drivers/char/ipmi/ipmi_si_intf.c     | 34 ++++++++++--------
 drivers/char/ipmi/ipmi_si_pci.c      | 52 +++++++++++++++-------------
 drivers/char/ipmi/ipmi_si_platform.c | 27 ++++++++-------
 4 files changed, 69 insertions(+), 54 deletions(-)

diff --git a/drivers/char/ipmi/ipmi_si.h b/drivers/char/ipmi/ipmi_si.h
index a7ead2a4c753..508c3fd45877 100644
--- a/drivers/char/ipmi/ipmi_si.h
+++ b/drivers/char/ipmi/ipmi_si.h
@@ -26,6 +26,14 @@ enum si_type {
 /* Array is defined in the ipmi_si_intf.c */
 extern const char *const si_to_str[];
 
+struct ipmi_match_info {
+	enum si_type type;
+};
+
+extern const struct ipmi_match_info ipmi_kcs_si_info;
+extern const struct ipmi_match_info ipmi_smic_si_info;
+extern const struct ipmi_match_info ipmi_bt_si_info;
+
 enum ipmi_addr_space {
 	IPMI_IO_ADDR_SPACE, IPMI_MEM_ADDR_SPACE
 };
@@ -64,7 +72,7 @@ struct si_sm_io {
 	void (*irq_cleanup)(struct si_sm_io *io);
 
 	u8 slave_addr;
-	enum si_type si_type;
+	const struct ipmi_match_info *si_info;
 	struct device *dev;
 };
 
diff --git a/drivers/char/ipmi/ipmi_si_intf.c b/drivers/char/ipmi/ipmi_si_intf.c
index eea23a3b966e..062f92cace24 100644
--- a/drivers/char/ipmi/ipmi_si_intf.c
+++ b/drivers/char/ipmi/ipmi_si_intf.c
@@ -73,6 +73,10 @@ enum si_intf_state {
 /* 'invalid' to allow a firmware-specified interface to be disabled */
 const char *const si_to_str[] = { "invalid", "kcs", "smic", "bt", NULL };
 
+const struct ipmi_match_info ipmi_kcs_si_info = { .type = SI_KCS };
+const struct ipmi_match_info ipmi_smic_si_info = { .type = SI_SMIC };
+const struct ipmi_match_info ipmi_bt_si_info = { .type = SI_BT };
+
 static bool initialized;
 
 /*
@@ -692,7 +696,7 @@ static void handle_transaction_done(struct smi_info *smi_info)
 			break;
 		}
 		enables = current_global_enables(smi_info, 0, &irq_on);
-		if (smi_info->io.si_type == SI_BT)
+		if (smi_info->io.si_info->type == SI_BT)
 			/* BT has its own interrupt enable bit. */
 			check_bt_irq(smi_info, irq_on);
 		if (enables != (msg[3] & GLOBAL_ENABLES_MASK)) {
@@ -1119,7 +1123,7 @@ irqreturn_t ipmi_si_irq_handler(int irq, void *data)
 	struct smi_info *smi_info = data;
 	unsigned long   flags;
 
-	if (smi_info->io.si_type == SI_BT)
+	if (smi_info->io.si_info->type == SI_BT)
 		/* We need to clear the IRQ flag for the BT interface. */
 		smi_info->io.outputb(&smi_info->io, IPMI_BT_INTMASK_REG,
 				     IPMI_BT_INTMASK_CLEAR_IRQ_BIT
@@ -1164,7 +1168,7 @@ static int smi_start_processing(void            *send_info,
 	 * The BT interface is efficient enough to not need a thread,
 	 * and there is no need for a thread if we have interrupts.
 	 */
-	else if ((new_smi->io.si_type != SI_BT) && (!new_smi->io.irq))
+	else if (new_smi->io.si_info->type != SI_BT && !new_smi->io.irq)
 		enable = 1;
 
 	if (enable) {
@@ -1235,7 +1239,7 @@ MODULE_PARM_DESC(kipmid_max_busy_us,
 
 void ipmi_irq_finish_setup(struct si_sm_io *io)
 {
-	if (io->si_type == SI_BT)
+	if (io->si_info->type == SI_BT)
 		/* Enable the interrupt in the BT interface. */
 		io->outputb(io, IPMI_BT_INTMASK_REG,
 			    IPMI_BT_INTMASK_ENABLE_IRQ_BIT);
@@ -1243,7 +1247,7 @@ void ipmi_irq_finish_setup(struct si_sm_io *io)
 
 void ipmi_irq_start_cleanup(struct si_sm_io *io)
 {
-	if (io->si_type == SI_BT)
+	if (io->si_info->type == SI_BT)
 		/* Disable the interrupt in the BT interface. */
 		io->outputb(io, IPMI_BT_INTMASK_REG, 0);
 }
@@ -1614,7 +1618,7 @@ static ssize_t type_show(struct device *dev,
 {
 	struct smi_info *smi_info = dev_get_drvdata(dev);
 
-	return sysfs_emit(buf, "%s\n", si_to_str[smi_info->io.si_type]);
+	return sysfs_emit(buf, "%s\n", si_to_str[smi_info->io.si_info->type]);
 }
 static DEVICE_ATTR_RO(type);
 
@@ -1649,7 +1653,7 @@ static ssize_t params_show(struct device *dev,
 
 	return sysfs_emit(buf,
 			"%s,%s,0x%lx,rsp=%d,rsi=%d,rsh=%d,irq=%d,ipmb=%d\n",
-			si_to_str[smi_info->io.si_type],
+			si_to_str[smi_info->io.si_info->type],
 			addr_space_to_str[smi_info->io.addr_space],
 			smi_info->io.addr_data,
 			smi_info->io.regspacing,
@@ -1803,7 +1807,7 @@ setup_dell_poweredge_bt_xaction_handler(struct smi_info *smi_info)
 {
 	struct ipmi_device_id *id = &smi_info->device_id;
 	if (id->manufacturer_id == DELL_IANA_MFR_ID &&
-	    smi_info->io.si_type == SI_BT)
+	    smi_info->io.si_info->type == SI_BT)
 		register_xaction_notifier(&dell_poweredge_bt_xaction_notifier);
 }
 
@@ -1907,13 +1911,13 @@ int ipmi_si_add_smi(struct si_sm_io *io)
 			/* We prefer ACPI over SMBIOS. */
 			dev_info(dup->io.dev,
 				 "Removing SMBIOS-specified %s state machine in favor of ACPI\n",
-				 si_to_str[new_smi->io.si_type]);
+				 si_to_str[new_smi->io.si_info->type]);
 			cleanup_one_si(dup);
 		} else {
 			dev_info(new_smi->io.dev,
 				 "%s-specified %s state machine: duplicate\n",
 				 ipmi_addr_src_to_str(new_smi->io.addr_source),
-				 si_to_str[new_smi->io.si_type]);
+				 si_to_str[new_smi->io.si_info->type]);
 			rv = -EBUSY;
 			kfree(new_smi);
 			goto out_err;
@@ -1922,7 +1926,7 @@ int ipmi_si_add_smi(struct si_sm_io *io)
 
 	pr_info("Adding %s-specified %s state machine\n",
 		ipmi_addr_src_to_str(new_smi->io.addr_source),
-		si_to_str[new_smi->io.si_type]);
+		si_to_str[new_smi->io.si_info->type]);
 
 	list_add_tail(&new_smi->link, &smi_infos);
 
@@ -1945,12 +1949,12 @@ static int try_smi_init(struct smi_info *new_smi)
 
 	pr_info("Trying %s-specified %s state machine at %s address 0x%lx, slave address 0x%x, irq %d\n",
 		ipmi_addr_src_to_str(new_smi->io.addr_source),
-		si_to_str[new_smi->io.si_type],
+		si_to_str[new_smi->io.si_info->type],
 		addr_space_to_str[new_smi->io.addr_space],
 		new_smi->io.addr_data,
 		new_smi->io.slave_addr, new_smi->io.irq);
 
-	switch (new_smi->io.si_type) {
+	switch (new_smi->io.si_info->type) {
 	case SI_KCS:
 		new_smi->handlers = &kcs_smi_handlers;
 		break;
@@ -2073,7 +2077,7 @@ static int try_smi_init(struct smi_info *new_smi)
 	smi_num++;
 
 	dev_info(new_smi->io.dev, "IPMI %s interface initialized\n",
-		 si_to_str[new_smi->io.si_type]);
+		 si_to_str[new_smi->io.si_info->type]);
 
 	WARN_ON(new_smi->io.dev->init_name != NULL);
 
@@ -2267,7 +2271,7 @@ struct device *ipmi_si_remove_by_data(int addr_space, enum si_type si_type,
 	list_for_each_entry_safe(e, tmp_e, &smi_infos, link) {
 		if (e->io.addr_space != addr_space)
 			continue;
-		if (e->io.si_type != si_type)
+		if (e->io.si_info->type != si_type)
 			continue;
 		if (e->io.addr_data == addr) {
 			dev = get_device(e->io.dev);
diff --git a/drivers/char/ipmi/ipmi_si_pci.c b/drivers/char/ipmi/ipmi_si_pci.c
index 8c0ea637aba0..17f72763322d 100644
--- a/drivers/char/ipmi/ipmi_si_pci.c
+++ b/drivers/char/ipmi/ipmi_si_pci.c
@@ -23,30 +23,32 @@ MODULE_PARM_DESC(trypci,
 
 static int ipmi_pci_probe_regspacing(struct si_sm_io *io)
 {
-	if (io->si_type == SI_KCS) {
-		unsigned char	status;
-		int		regspacing;
-
-		io->regsize = DEFAULT_REGSIZE;
-		io->regshift = 0;
-
-		/* detect 1, 4, 16byte spacing */
-		for (regspacing = DEFAULT_REGSPACING; regspacing <= 16;) {
-			io->regspacing = regspacing;
-			if (io->io_setup(io)) {
-				dev_err(io->dev, "Could not setup I/O space\n");
-				return DEFAULT_REGSPACING;
-			}
-			/* write invalid cmd */
-			io->outputb(io, 1, 0x10);
-			/* read status back */
-			status = io->inputb(io, 1);
-			io->io_cleanup(io);
-			if (status)
-				return regspacing;
-			regspacing *= 4;
+	unsigned char status;
+	int regspacing;
+
+	if (io->si_info->type != SI_KCS)
+		return DEFAULT_REGSPACING;
+
+	io->regsize = DEFAULT_REGSIZE;
+	io->regshift = 0;
+
+	/* detect 1, 4, 16byte spacing */
+	for (regspacing = DEFAULT_REGSPACING; regspacing <= 16;) {
+		io->regspacing = regspacing;
+		if (io->io_setup(io)) {
+			dev_err(io->dev, "Could not setup I/O space\n");
+			return DEFAULT_REGSPACING;
 		}
+		/* write invalid cmd */
+		io->outputb(io, 1, 0x10);
+		/* read status back */
+		status = io->inputb(io, 1);
+		io->io_cleanup(io);
+		if (status)
+			return regspacing;
+		regspacing *= 4;
 	}
+
 	return DEFAULT_REGSPACING;
 }
 
@@ -74,15 +76,15 @@ static int ipmi_pci_probe(struct pci_dev *pdev,
 
 	switch (pdev->class) {
 	case PCI_CLASS_SERIAL_IPMI_SMIC:
-		io.si_type = SI_SMIC;
+		io.si_info = &ipmi_smic_si_info;
 		break;
 
 	case PCI_CLASS_SERIAL_IPMI_KCS:
-		io.si_type = SI_KCS;
+		io.si_info = &ipmi_kcs_si_info;
 		break;
 
 	case PCI_CLASS_SERIAL_IPMI_BT:
-		io.si_type = SI_BT;
+		io.si_info = &ipmi_bt_si_info;
 		break;
 
 	default:
diff --git a/drivers/char/ipmi/ipmi_si_platform.c b/drivers/char/ipmi/ipmi_si_platform.c
index 550cabd43ae6..fb6e359ae494 100644
--- a/drivers/char/ipmi/ipmi_si_platform.c
+++ b/drivers/char/ipmi/ipmi_si_platform.c
@@ -163,9 +163,13 @@ static int platform_ipmi_probe(struct platform_device *pdev)
 
 	switch (type) {
 	case SI_KCS:
+		io.si_info = &ipmi_kcs_si_info;
+		break;
 	case SI_SMIC:
+		io.si_info = &ipmi_smic_si_info;
+		break;
 	case SI_BT:
-		io.si_type = type;
+		io.si_info = &ipmi_bt_si_info;
 		break;
 	case SI_TYPE_INVALID: /* User disabled this in hardcode. */
 		return -ENODEV;
@@ -213,13 +217,10 @@ static int platform_ipmi_probe(struct platform_device *pdev)
 
 #ifdef CONFIG_OF
 static const struct of_device_id of_ipmi_match[] = {
-	{ .type = "ipmi", .compatible = "ipmi-kcs",
-	  .data = (void *)(unsigned long) SI_KCS },
-	{ .type = "ipmi", .compatible = "ipmi-smic",
-	  .data = (void *)(unsigned long) SI_SMIC },
-	{ .type = "ipmi", .compatible = "ipmi-bt",
-	  .data = (void *)(unsigned long) SI_BT },
-	{},
+	{ .type = "ipmi", .compatible = "ipmi-kcs", .data = &ipmi_kcs_si_info },
+	{ .type = "ipmi", .compatible = "ipmi-smic", .data = &ipmi_smic_si_info },
+	{ .type = "ipmi", .compatible = "ipmi-bt", .data = &ipmi_bt_si_info },
+	{}
 };
 MODULE_DEVICE_TABLE(of, of_ipmi_match);
 
@@ -265,7 +266,7 @@ static int of_ipmi_probe(struct platform_device *pdev)
 	}
 
 	memset(&io, 0, sizeof(io));
-	io.si_type	= (enum si_type)device_get_match_data(&pdev->dev);
+	io.si_info	= device_get_match_data(&pdev->dev);
 	io.addr_source	= SI_DEVICETREE;
 	io.irq_setup	= ipmi_std_irq_setup;
 
@@ -296,7 +297,7 @@ static int find_slave_address(struct si_sm_io *io, int slave_addr)
 {
 #ifdef CONFIG_IPMI_DMI_DECODE
 	if (!slave_addr)
-		slave_addr = ipmi_dmi_get_slave_addr(io->si_type,
+		slave_addr = ipmi_dmi_get_slave_addr(io->si_info->type,
 						     io->addr_space,
 						     io->addr_data);
 #endif
@@ -335,13 +336,13 @@ static int acpi_ipmi_probe(struct platform_device *pdev)
 
 	switch (tmp) {
 	case 1:
-		io.si_type = SI_KCS;
+		io.si_info = &ipmi_kcs_si_info;
 		break;
 	case 2:
-		io.si_type = SI_SMIC;
+		io.si_info = &ipmi_smic_si_info;
 		break;
 	case 3:
-		io.si_type = SI_BT;
+		io.si_info = &ipmi_bt_si_info;
 		break;
 	case 4: /* SSIF, just ignore */
 		return -ENODEV;
-- 
2.43.0

