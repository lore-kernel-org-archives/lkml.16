Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A14924BD1F
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 12:09:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744805364; cv=none; b=TeVnIFRNOTNp5CVfxAlC8da8UdSQp96TVVfaK7xHrDyrs6ctyziu0AJwIn1mHSCY5TOkfI292Rinp/cyuxd5vWcP/pkw0OZdY01HTISmnSewdX+qRcCnrYS3rMjZX7cH8Pzp0QvzBn01+qYe7HyohxhCtCwgreW+Ohmcx05m3ic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744805364; c=relaxed/simple;
	bh=OknMfO3aKiUjtkajySAtrg6Y0jLNpEmOZeb8MuO61D0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lcdFqWsdmE53EqG8MP99Wlay4fstwZvMBtIKu8z2FfoIrS2CytvlI1yp2lJXC8Ev6ul8+w3jZhylKXQRGwBrf4rSV3VE/ciWff83M7xnf/+Qc+kJMTPiCuNXajiAyLZYqTXqIUDHF+Rgp9MOmxRdK1P3WCjOz5hY2903n4g+HL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=minyard.net; spf=none smtp.mailfrom=minyard.net; dkim=pass (2048-bit key) header.d=minyard-net.20230601.gappssmtp.com header.i=@minyard-net.20230601.gappssmtp.com header.b=KHZHQh7t; arc=none smtp.client-ip=209.85.167.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=minyard.net
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=minyard.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=minyard-net.20230601.gappssmtp.com header.i=@minyard-net.20230601.gappssmtp.com header.b="KHZHQh7t"
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-3f8d2f8d890so3559438b6e.0
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 05:09:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minyard-net.20230601.gappssmtp.com; s=20230601; t=1744805360; x=1745410160; darn=vger.kernel.org;
        h=content-disposition:mime-version:reply-to:message-id:subject:cc:to
         :from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+yl0cAZ2AoM6yswmjaXzrQ8iZqsWJ8zVT6FZkjKDdrM=;
        b=KHZHQh7tYtHgRexNW8Eu43px6E6AsfsO/E6lNqpVkgoCnCtRKRUipbLzQtIXfvFST2
         rqgM3iUdLwTlqxS4CW+ZzZ6xt6Ej7Tbzt3sZ56JiYqNK1h+6Xp6VOk8eqErBycugoILr
         BYxWvGRTULi01CUkiDAvseUQd6ZhgJkOtIyma+/u5r8eqNNb1AR/zM+kZm5KDpFDPPqf
         VzyAD6zXX+RsZWLY25DQFop42kRE2u0NwZ6jplvPLAhLc0kYR1dTq9s4UdTP886gdRx1
         bgYS1kE0ECPbY3/5gpTS6ltE65nJes4ViiMcb8UIBZDxlwZwdRWZOkKUOveMYWzb16gs
         SNIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744805360; x=1745410160;
        h=content-disposition:mime-version:reply-to:message-id:subject:cc:to
         :from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+yl0cAZ2AoM6yswmjaXzrQ8iZqsWJ8zVT6FZkjKDdrM=;
        b=evfPcgWNJ9JUh01YyZlo6eb3kKP8M3E3j+i/c+LEFLcdw+iiaPpU367rduqxX0IyBC
         AkjJNMvjp7Ldd/JR5KHYcBb009O+M7iun46PPyCIXbgdQYBY7Y0XbUot0yKI+myIBmo9
         BEXDOFR5Y3iC2fu0v3VSlIgLHmXOkNVNWBjgHPshDIsdxb5/0BNre6dBLmhUIdCF9Cd3
         YeKnPZKe0GMhxnsUkynfYvzYv78n9M8lOyUiKlCS4/YVW6jLI2P/73OGbUNstNMT9ZtB
         MTtxlVZI9vqJHbidY7I71OADNI6OIE7jGq7Ve96LCU3EJaQGzVpcLbWJJ7Dhrli3u6FG
         O8lw==
X-Gm-Message-State: AOJu0Yx282/6SXmaopZiIFfc8RV3IN11VaSdnHhR6gJuiM6bNTmmmh+W
	ngAh3qCv3GsK27ZUFPaoSx6ca2ZgUJmCJOL6GLzAD5Vscf0Op/3vOcgUcrOeKAqbjMR9fBn4F51
	Z
X-Gm-Gg: ASbGncuQVh1dQRQh3jAEFl0Vu4tGEbrZC/sJrzSrZmDSpAjSjHK/H9R9yck3OaoTQc8
	3WGLWCYQKIjNZXVE4/CyazgUlvgOmKVG68w2swM/jQfldcqwYYIrbmkqDUfMs8gJdNmWnrL4Qbr
	lHtqeE92yAIXZ+p1LKkYiYvWWaVHpjRdA8XNvOHcyqJTfOgue2PjEw4o+mGL4Vegm1RrGgWPk3i
	0Kre9HHVHMMhZNr2kYGJGzMLp/MxNycEjtcUYUAsytR8VYRS/qsT2I41RkVOfY34odnfM2sX0pd
	Bqk4ucW5Y+osBxNoraha/3pbIu6lBzgj+d8HO2+m1+w=
X-Google-Smtp-Source: AGHT+IHnjhyXrjGAYt5UpueUXnmaVnICj1WMDNUQyBXGxLg8zivgRP+07rpiqAYou6WrjTxm7FHRCg==
X-Received: by 2002:a05:6808:bc7:b0:3fb:a7d0:3b55 with SMTP id 5614622812f47-400b044b4e2mr877553b6e.35.1744805359472;
        Wed, 16 Apr 2025 05:09:19 -0700 (PDT)
Received: from mail.minyard.net ([2001:470:b8f6:1b:1e17:765:833b:6e44])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-40076282d00sm2699761b6e.4.2025.04.16.05.09.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 05:09:18 -0700 (PDT)
Date: Wed, 16 Apr 2025 07:09:12 -0500
From: Corey Minyard <corey@minyard.net>
To: Linux Kernel <linux-kernel@vger.kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: OpenIPMI Developers <openipmi-developer@lists.sourceforge.net>
Subject: [PATCH] ipmi:si: Move SI type information into an info structure
Message-ID: <Z_-d6Pj7ZFuG9gNA@mail.minyard.net>
Reply-To: Z_6uzH9DsWIh-hIz@mail.minyard.net
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

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
Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Corey Minyard <corey@minyard.net>
---
 drivers/char/ipmi/ipmi_si.h          |  6 +++++-
 drivers/char/ipmi/ipmi_si_intf.c     | 30 ++++++++++++++--------------
 drivers/char/ipmi/ipmi_si_pci.c      |  8 ++++----
 drivers/char/ipmi/ipmi_si_platform.c | 26 +++++++++++++-----------
 4 files changed, 38 insertions(+), 32 deletions(-)

diff --git a/drivers/char/ipmi/ipmi_si.h b/drivers/char/ipmi/ipmi_si.h
index a7ead2a4c753..30b5e5f54172 100644
--- a/drivers/char/ipmi/ipmi_si.h
+++ b/drivers/char/ipmi/ipmi_si.h
@@ -23,6 +23,10 @@ enum si_type {
 	SI_TYPE_INVALID, SI_KCS, SI_SMIC, SI_BT, SI_TYPE_MAX
 };
 
+struct ipmi_match_info {
+    enum si_type type;
+};
+
 /* Array is defined in the ipmi_si_intf.c */
 extern const char *const si_to_str[];
 
@@ -64,7 +68,7 @@ struct si_sm_io {
 	void (*irq_cleanup)(struct si_sm_io *io);
 
 	u8 slave_addr;
-	enum si_type si_type;
+	struct ipmi_match_info si_info;
 	struct device *dev;
 };
 
diff --git a/drivers/char/ipmi/ipmi_si_intf.c b/drivers/char/ipmi/ipmi_si_intf.c
index 7dcf934d5902..21a2c2998a3d 100644
--- a/drivers/char/ipmi/ipmi_si_intf.c
+++ b/drivers/char/ipmi/ipmi_si_intf.c
@@ -692,7 +692,7 @@ static void handle_transaction_done(struct smi_info *smi_info)
 			break;
 		}
 		enables = current_global_enables(smi_info, 0, &irq_on);
-		if (smi_info->io.si_type == SI_BT)
+		if (smi_info->io.si_info.type == SI_BT)
 			/* BT has its own interrupt enable bit. */
 			check_bt_irq(smi_info, irq_on);
 		if (enables != (msg[3] & GLOBAL_ENABLES_MASK)) {
@@ -1119,7 +1119,7 @@ irqreturn_t ipmi_si_irq_handler(int irq, void *data)
 	struct smi_info *smi_info = data;
 	unsigned long   flags;
 
-	if (smi_info->io.si_type == SI_BT)
+	if (smi_info->io.si_info.type == SI_BT)
 		/* We need to clear the IRQ flag for the BT interface. */
 		smi_info->io.outputb(&smi_info->io, IPMI_BT_INTMASK_REG,
 				     IPMI_BT_INTMASK_CLEAR_IRQ_BIT
@@ -1164,7 +1164,7 @@ static int smi_start_processing(void            *send_info,
 	 * The BT interface is efficient enough to not need a thread,
 	 * and there is no need for a thread if we have interrupts.
 	 */
-	else if ((new_smi->io.si_type != SI_BT) && (!new_smi->io.irq))
+	else if ((new_smi->io.si_info.type != SI_BT) && (!new_smi->io.irq))
 		enable = 1;
 
 	if (enable) {
@@ -1235,7 +1235,7 @@ MODULE_PARM_DESC(kipmid_max_busy_us,
 
 void ipmi_irq_finish_setup(struct si_sm_io *io)
 {
-	if (io->si_type == SI_BT)
+	if (io->si_info.type == SI_BT)
 		/* Enable the interrupt in the BT interface. */
 		io->outputb(io, IPMI_BT_INTMASK_REG,
 			    IPMI_BT_INTMASK_ENABLE_IRQ_BIT);
@@ -1243,7 +1243,7 @@ void ipmi_irq_finish_setup(struct si_sm_io *io)
 
 void ipmi_irq_start_cleanup(struct si_sm_io *io)
 {
-	if (io->si_type == SI_BT)
+	if (io->si_info.type == SI_BT)
 		/* Disable the interrupt in the BT interface. */
 		io->outputb(io, IPMI_BT_INTMASK_REG, 0);
 }
@@ -1614,7 +1614,7 @@ static ssize_t type_show(struct device *dev,
 {
 	struct smi_info *smi_info = dev_get_drvdata(dev);
 
-	return sysfs_emit(buf, "%s\n", si_to_str[smi_info->io.si_type]);
+	return sysfs_emit(buf, "%s\n", si_to_str[smi_info->io.si_info.type]);
 }
 static DEVICE_ATTR_RO(type);
 
@@ -1649,7 +1649,7 @@ static ssize_t params_show(struct device *dev,
 
 	return sysfs_emit(buf,
 			"%s,%s,0x%lx,rsp=%d,rsi=%d,rsh=%d,irq=%d,ipmb=%d\n",
-			si_to_str[smi_info->io.si_type],
+			si_to_str[smi_info->io.si_info.type],
 			addr_space_to_str[smi_info->io.addr_space],
 			smi_info->io.addr_data,
 			smi_info->io.regspacing,
@@ -1803,7 +1803,7 @@ setup_dell_poweredge_bt_xaction_handler(struct smi_info *smi_info)
 {
 	struct ipmi_device_id *id = &smi_info->device_id;
 	if (id->manufacturer_id == DELL_IANA_MFR_ID &&
-	    smi_info->io.si_type == SI_BT)
+	    smi_info->io.si_info.type == SI_BT)
 		register_xaction_notifier(&dell_poweredge_bt_xaction_notifier);
 }
 
@@ -1907,13 +1907,13 @@ int ipmi_si_add_smi(struct si_sm_io *io)
 			/* We prefer ACPI over SMBIOS. */
 			dev_info(dup->io.dev,
 				 "Removing SMBIOS-specified %s state machine in favor of ACPI\n",
-				 si_to_str[new_smi->io.si_type]);
+				 si_to_str[new_smi->io.si_info.type]);
 			cleanup_one_si(dup);
 		} else {
 			dev_info(new_smi->io.dev,
 				 "%s-specified %s state machine: duplicate\n",
 				 ipmi_addr_src_to_str(new_smi->io.addr_source),
-				 si_to_str[new_smi->io.si_type]);
+				 si_to_str[new_smi->io.si_info.type]);
 			rv = -EBUSY;
 			kfree(new_smi);
 			goto out_err;
@@ -1922,7 +1922,7 @@ int ipmi_si_add_smi(struct si_sm_io *io)
 
 	pr_info("Adding %s-specified %s state machine\n",
 		ipmi_addr_src_to_str(new_smi->io.addr_source),
-		si_to_str[new_smi->io.si_type]);
+		si_to_str[new_smi->io.si_info.type]);
 
 	list_add_tail(&new_smi->link, &smi_infos);
 
@@ -1945,12 +1945,12 @@ static int try_smi_init(struct smi_info *new_smi)
 
 	pr_info("Trying %s-specified %s state machine at %s address 0x%lx, slave address 0x%x, irq %d\n",
 		ipmi_addr_src_to_str(new_smi->io.addr_source),
-		si_to_str[new_smi->io.si_type],
+		si_to_str[new_smi->io.si_info.type],
 		addr_space_to_str[new_smi->io.addr_space],
 		new_smi->io.addr_data,
 		new_smi->io.slave_addr, new_smi->io.irq);
 
-	switch (new_smi->io.si_type) {
+	switch (new_smi->io.si_info.type) {
 	case SI_KCS:
 		new_smi->handlers = &kcs_smi_handlers;
 		break;
@@ -2073,7 +2073,7 @@ static int try_smi_init(struct smi_info *new_smi)
 	smi_num++;
 
 	dev_info(new_smi->io.dev, "IPMI %s interface initialized\n",
-		 si_to_str[new_smi->io.si_type]);
+		 si_to_str[new_smi->io.si_info.type]);
 
 	WARN_ON(new_smi->io.dev->init_name != NULL);
 
@@ -2309,7 +2309,7 @@ struct device *ipmi_si_remove_by_data(int addr_space, enum si_type si_type,
 	list_for_each_entry_safe(e, tmp_e, &smi_infos, link) {
 		if (e->io.addr_space != addr_space)
 			continue;
-		if (e->io.si_type != si_type)
+		if (e->io.si_info.type != si_type)
 			continue;
 		if (e->io.addr_data == addr) {
 			dev = get_device(e->io.dev);
diff --git a/drivers/char/ipmi/ipmi_si_pci.c b/drivers/char/ipmi/ipmi_si_pci.c
index 8c0ea637aba0..1f4bdb3bbdd4 100644
--- a/drivers/char/ipmi/ipmi_si_pci.c
+++ b/drivers/char/ipmi/ipmi_si_pci.c
@@ -23,7 +23,7 @@ MODULE_PARM_DESC(trypci,
 
 static int ipmi_pci_probe_regspacing(struct si_sm_io *io)
 {
-	if (io->si_type == SI_KCS) {
+	if (io->si_info.type == SI_KCS) {
 		unsigned char	status;
 		int		regspacing;
 
@@ -74,15 +74,15 @@ static int ipmi_pci_probe(struct pci_dev *pdev,
 
 	switch (pdev->class) {
 	case PCI_CLASS_SERIAL_IPMI_SMIC:
-		io.si_type = SI_SMIC;
+		io.si_info.type = SI_SMIC;
 		break;
 
 	case PCI_CLASS_SERIAL_IPMI_KCS:
-		io.si_type = SI_KCS;
+		io.si_info.type = SI_KCS;
 		break;
 
 	case PCI_CLASS_SERIAL_IPMI_BT:
-		io.si_type = SI_BT;
+		io.si_info.type = SI_BT;
 		break;
 
 	default:
diff --git a/drivers/char/ipmi/ipmi_si_platform.c b/drivers/char/ipmi/ipmi_si_platform.c
index 550cabd43ae6..53066713f8e4 100644
--- a/drivers/char/ipmi/ipmi_si_platform.c
+++ b/drivers/char/ipmi/ipmi_si_platform.c
@@ -165,7 +165,7 @@ static int platform_ipmi_probe(struct platform_device *pdev)
 	case SI_KCS:
 	case SI_SMIC:
 	case SI_BT:
-		io.si_type = type;
+		io.si_info.type = type;
 		break;
 	case SI_TYPE_INVALID: /* User disabled this in hardcode. */
 		return -ENODEV;
@@ -212,13 +212,14 @@ static int platform_ipmi_probe(struct platform_device *pdev)
 }
 
 #ifdef CONFIG_OF
+static struct ipmi_match_info kcs_info = { .type = SI_KCS };
+static struct ipmi_match_info smic_info = { .type = SI_SMIC };
+static struct ipmi_match_info bt_info = { .type = SI_BT };
+
 static const struct of_device_id of_ipmi_match[] = {
-	{ .type = "ipmi", .compatible = "ipmi-kcs",
-	  .data = (void *)(unsigned long) SI_KCS },
-	{ .type = "ipmi", .compatible = "ipmi-smic",
-	  .data = (void *)(unsigned long) SI_SMIC },
-	{ .type = "ipmi", .compatible = "ipmi-bt",
-	  .data = (void *)(unsigned long) SI_BT },
+	{ .type = "ipmi", .compatible = "ipmi-kcs", .data = &kcs_info },
+	{ .type = "ipmi", .compatible = "ipmi-smic", .data = &smic_info },
+	{ .type = "ipmi", .compatible = "ipmi-bt", .data = &bt_info },
 	{},
 };
 MODULE_DEVICE_TABLE(of, of_ipmi_match);
@@ -265,7 +266,8 @@ static int of_ipmi_probe(struct platform_device *pdev)
 	}
 
 	memset(&io, 0, sizeof(io));
-	io.si_type	= (enum si_type)device_get_match_data(&pdev->dev);
+	io.si_info	= *((struct ipmi_match_info *)
+			    device_get_match_data(&pdev->dev));
 	io.addr_source	= SI_DEVICETREE;
 	io.irq_setup	= ipmi_std_irq_setup;
 
@@ -296,7 +298,7 @@ static int find_slave_address(struct si_sm_io *io, int slave_addr)
 {
 #ifdef CONFIG_IPMI_DMI_DECODE
 	if (!slave_addr)
-		slave_addr = ipmi_dmi_get_slave_addr(io->si_type,
+		slave_addr = ipmi_dmi_get_slave_addr(io->si_info.type,
 						     io->addr_space,
 						     io->addr_data);
 #endif
@@ -335,13 +337,13 @@ static int acpi_ipmi_probe(struct platform_device *pdev)
 
 	switch (tmp) {
 	case 1:
-		io.si_type = SI_KCS;
+		io.si_info.type = SI_KCS;
 		break;
 	case 2:
-		io.si_type = SI_SMIC;
+		io.si_info.type = SI_SMIC;
 		break;
 	case 3:
-		io.si_type = SI_BT;
+		io.si_info.type = SI_BT;
 		break;
 	case 4: /* SSIF, just ignore */
 		return -ENODEV;
-- 
2.43.0
