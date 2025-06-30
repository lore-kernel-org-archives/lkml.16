Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 190D42522B9
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 09:33:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751275996; cv=none; b=Bk6hJZIMbnaS0HmBWTTcOzu405CeoODDOR4jZK3GM0A9xIMvC+2TWYTGWRduJdIDU87rg/JPyYBmA/zLGFXt9q0jZCNauUiRSV+vhmDghlg83MJkkOMKPTTMxfq448knAZuCHG5Pj0xjtZ5oL1pP0nc1vHgzXAUvq0IYwVi/HLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751275996; c=relaxed/simple;
	bh=GBfVWqY9AcXGzxSgjir3k7Qn8sge+mlEZCJ1FKiOtq0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GwFBUkE73QTGUSR05Tpdsbuf9ck4yNEE+3CTQxgB5BBCOEA7oinNZGzouP6qtn76jh5BhaKFtnLIU9IBV/S/N6ccVHB4KImm+Ox/+FAUBDMJwh95DqbFog2yQ5vxOKXQKLd+H0pP9jZF2iV25UpRXSf/6jhNq1vC2qW5woXFqqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ILTi2wpP; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ILTi2wpP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751275993;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=5Mg84blWsqeCZM1rx30Sqk9a36QNNeE3gf1Ff/rDXI4=;
	b=ILTi2wpPxzSooh66AkTLgugQ7SVkoKy/lqZIWxBp1+bd7Nv1ojhi9YAGJnXRKnrvqtu/Lx
	W8G41iR7cQ4k5GsFmALrElmnKeFyF/L3SoXbnJl5houG9uclregJoxYNqms02O46QprhEe
	KS8KuLbHx7b2dxgTVzPWFukk243dBI0=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-593-GxOb3N7jNh6OUzxnCIigSw-1; Mon, 30 Jun 2025 05:33:07 -0400
X-MC-Unique: GxOb3N7jNh6OUzxnCIigSw-1
X-Mimecast-MFC-AGG-ID: GxOb3N7jNh6OUzxnCIigSw_1751275986
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3a523ce0bb2so985248f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 02:33:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751275986; x=1751880786;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5Mg84blWsqeCZM1rx30Sqk9a36QNNeE3gf1Ff/rDXI4=;
        b=v7EKgrVmcQh2dUSxR7A0csUAbHLVC4X+wI9tsn+wqERUYDiqXGDq7Lt9rVf8dPZCxn
         +uR/SBYdT0hYNlfdd9ANNu5qdrAyzFQUBX1I3roNCXeS4U8s/m/0Sh10AUcYiuybfbMI
         cjExpT+1dgBgKshQsrlNieOkJL+a9cxHYKivbKlpBnAVnbeu7WTKEmypi3iqCK+C6ywC
         9eS3rGw1hg4Mv447oiWkKxcUAPpVBVxKYeHkcKj4ixm4Uk5H80jXDXJZKsmWfelcycrJ
         6bV1TjsDRjb6OcP8RIzRfQgEDLILmfOWkNGKzmJd7BiO5SbTkIwg9+Nrfcjyd7GB+yTx
         Qt2g==
X-Forwarded-Encrypted: i=1; AJvYcCUfmyr9/5oBIVfPRS9BD6H2gJYcTm6yZDz5z7N9vtVWs9HObZVkjCJ3V/2ST8TznmRfFM2rY7A7y3ZynEg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxjiBEnGUnj1jvziA3zmtg1yY2aHd/0qOgT12EY5Dr8lReYeYDq
	Y9vy8WfO+rWVk/5wUZME7eXhXGG/87ZeJYiMEMiRQCQ+VPReWiWVCbxzfzOm5fZ6EBPOX1gc8BW
	wEaQo+oET0Tj186kr22I6sg92zNbbkFvJbDInIWCX7Ad80Nfez7+21ZVeUDhwZVtgZw==
X-Gm-Gg: ASbGnctla9JwC6OdOMGuDEfy7PrwOlEL9wu7X3WspZhN49fvJKDVy+vW9FkiRhXOFIo
	l1/vlVuxFX6rtcUwM3X63uzv65CBUJj8ZV58ll6PqR5emktEIaYnivfLKbWKQ9tm3EVI8F7fh7e
	9rqWlZXyZPGmZXvFN4BqCbbXc6FbhxXJY+uVf3z0FaqbpORTWD75L2QlV5q86JMeYNds4g14r4G
	/1gCCePxl/Dzs2Ra3OwqODlp+E5E9a4G9BxNbz9Mkl4HRnOa3UfINmceA/iuAL/YTUpgBvEgE+N
	0BwcNsURYy92xqvUoUzboTbtEaFStsUuQY48jPXdChMrYbH/NI8ED+cwkx04onZPy48l
X-Received: by 2002:a5d:5f91:0:b0:3a4:d6ed:8e2e with SMTP id ffacd0b85a97d-3a8fe4bd067mr10177618f8f.41.1751275986013;
        Mon, 30 Jun 2025 02:33:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFvReroVfwTS0iRMtwWomfow7Nd+A4hV3iAXfcOODiDhGfovJncwF8D9o5+4L00qrBVF9IdvA==
X-Received: by 2002:a5d:5f91:0:b0:3a4:d6ed:8e2e with SMTP id ffacd0b85a97d-3a8fe4bd067mr10177586f8f.41.1751275985497;
        Mon, 30 Jun 2025 02:33:05 -0700 (PDT)
Received: from lbulwahn-thinkpadx1carbongen9.rmtde.csb ([2a02:810d:7e01:ef00:b52:2ad9:f357:f709])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a88c7e76e1sm10081204f8f.16.2025.06.30.02.33.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 02:33:04 -0700 (PDT)
From: Lukas Bulwahn <lbulwahn@redhat.com>
X-Google-Original-From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
To: Dominik Brodowski <linux@dominikbrodowski.net>
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@redhat.com>
Subject: [PATCH] pcmcia: remove PCCARD_IODYN
Date: Mon, 30 Jun 2025 11:32:56 +0200
Message-ID: <20250630093256.175212-1-lukas.bulwahn@redhat.com>
X-Mailer: git-send-email 2.50.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lukas Bulwahn <lukas.bulwahn@redhat.com>

The config PCCARD_IODYN was last used in the config option PCMCIA_M8XX with
its m8xx_pcmcia driver. This driver was removed with commit 39eb56da2b53
("pcmcia: Remove m8xx_pcmcia driver"), included in v3.17, back in 2014.
Since then, the config PCCARD_IODYN is unused. Remove the config option,
the corresponding file included with this config and the corresponding
definition in the pcmcia header file.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>
---
 drivers/pcmcia/Kconfig      |   3 -
 drivers/pcmcia/Makefile     |   1 -
 drivers/pcmcia/rsrc_iodyn.c | 168 ------------------------------------
 include/pcmcia/ss.h         |   8 +-
 4 files changed, 1 insertion(+), 179 deletions(-)
 delete mode 100644 drivers/pcmcia/rsrc_iodyn.c

diff --git a/drivers/pcmcia/Kconfig b/drivers/pcmcia/Kconfig
index dddb235dd020..660a95805524 100644
--- a/drivers/pcmcia/Kconfig
+++ b/drivers/pcmcia/Kconfig
@@ -250,7 +250,4 @@ config ELECTRA_CF
 config PCCARD_NONSTATIC
 	bool
 
-config PCCARD_IODYN
-	bool
-
 endif	# PCCARD
diff --git a/drivers/pcmcia/Makefile b/drivers/pcmcia/Makefile
index c9d51b150682..d16a0317ce43 100644
--- a/drivers/pcmcia/Makefile
+++ b/drivers/pcmcia/Makefile
@@ -12,7 +12,6 @@ obj-$(CONFIG_PCMCIA)				+= pcmcia.o
 
 pcmcia_rsrc-y					+= rsrc_mgr.o
 pcmcia_rsrc-$(CONFIG_PCCARD_NONSTATIC)		+= rsrc_nonstatic.o
-pcmcia_rsrc-$(CONFIG_PCCARD_IODYN)		+= rsrc_iodyn.o
 obj-$(CONFIG_PCCARD)				+= pcmcia_rsrc.o
 
 
diff --git a/drivers/pcmcia/rsrc_iodyn.c b/drivers/pcmcia/rsrc_iodyn.c
deleted file mode 100644
index b04b16496b0c..000000000000
--- a/drivers/pcmcia/rsrc_iodyn.c
+++ /dev/null
@@ -1,168 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- * rsrc_iodyn.c -- Resource management routines for MEM-static sockets.
- *
- * The initial developer of the original code is David A. Hinds
- * <dahinds@users.sourceforge.net>.  Portions created by David A. Hinds
- * are Copyright (C) 1999 David A. Hinds.  All Rights Reserved.
- *
- * (C) 1999		David A. Hinds
- */
-
-#include <linux/slab.h>
-#include <linux/module.h>
-#include <linux/kernel.h>
-
-#include <pcmcia/ss.h>
-#include <pcmcia/cistpl.h>
-#include "cs_internal.h"
-
-
-struct pcmcia_align_data {
-	unsigned long	mask;
-	unsigned long	offset;
-};
-
-static resource_size_t pcmcia_align(void *align_data,
-				const struct resource *res,
-				resource_size_t size, resource_size_t align)
-{
-	struct pcmcia_align_data *data = align_data;
-	resource_size_t start;
-
-	start = (res->start & ~data->mask) + data->offset;
-	if (start < res->start)
-		start += data->mask + 1;
-
-#ifdef CONFIG_X86
-	if (res->flags & IORESOURCE_IO) {
-		if (start & 0x300)
-			start = (start + 0x3ff) & ~0x3ff;
-	}
-#endif
-
-#ifdef CONFIG_M68K
-	if (res->flags & IORESOURCE_IO) {
-		if ((res->start + size - 1) >= 1024)
-			start = res->end;
-	}
-#endif
-
-	return start;
-}
-
-
-static struct resource *__iodyn_find_io_region(struct pcmcia_socket *s,
-					unsigned long base, int num,
-					unsigned long align)
-{
-	struct resource *res = pcmcia_make_resource(0, num, IORESOURCE_IO,
-						dev_name(&s->dev));
-	struct pcmcia_align_data data;
-	unsigned long min = base;
-	int ret;
-
-	data.mask = align - 1;
-	data.offset = base & data.mask;
-
-#ifdef CONFIG_PCI
-	if (s->cb_dev) {
-		ret = pci_bus_alloc_resource(s->cb_dev->bus, res, num, 1,
-					     min, 0, pcmcia_align, &data);
-	} else
-#endif
-		ret = allocate_resource(&ioport_resource, res, num, min, ~0UL,
-					1, pcmcia_align, &data);
-
-	if (ret != 0) {
-		kfree(res);
-		res = NULL;
-	}
-	return res;
-}
-
-static int iodyn_find_io(struct pcmcia_socket *s, unsigned int attr,
-			unsigned int *base, unsigned int num,
-			unsigned int align, struct resource **parent)
-{
-	int i, ret = 0;
-
-	/* Check for an already-allocated window that must conflict with
-	 * what was asked for.  It is a hack because it does not catch all
-	 * potential conflicts, just the most obvious ones.
-	 */
-	for (i = 0; i < MAX_IO_WIN; i++) {
-		if (!s->io[i].res)
-			continue;
-
-		if (!*base)
-			continue;
-
-		if ((s->io[i].res->start & (align-1)) == *base)
-			return -EBUSY;
-	}
-
-	for (i = 0; i < MAX_IO_WIN; i++) {
-		struct resource *res = s->io[i].res;
-		unsigned int try;
-
-		if (res && (res->flags & IORESOURCE_BITS) !=
-			(attr & IORESOURCE_BITS))
-			continue;
-
-		if (!res) {
-			if (align == 0)
-				align = 0x10000;
-
-			res = s->io[i].res = __iodyn_find_io_region(s, *base,
-								num, align);
-			if (!res)
-				return -EINVAL;
-
-			*base = res->start;
-			s->io[i].res->flags =
-				((res->flags & ~IORESOURCE_BITS) |
-					(attr & IORESOURCE_BITS));
-			s->io[i].InUse = num;
-			*parent = res;
-			return 0;
-		}
-
-		/* Try to extend top of window */
-		try = res->end + 1;
-		if ((*base == 0) || (*base == try)) {
-			if (adjust_resource(s->io[i].res, res->start,
-					    resource_size(res) + num))
-				continue;
-			*base = try;
-			s->io[i].InUse += num;
-			*parent = res;
-			return 0;
-		}
-
-		/* Try to extend bottom of window */
-		try = res->start - num;
-		if ((*base == 0) || (*base == try)) {
-			if (adjust_resource(s->io[i].res,
-					    res->start - num,
-					    resource_size(res) + num))
-				continue;
-			*base = try;
-			s->io[i].InUse += num;
-			*parent = res;
-			return 0;
-		}
-	}
-
-	return -EINVAL;
-}
-
-
-struct pccard_resource_ops pccard_iodyn_ops = {
-	.validate_mem = NULL,
-	.find_io = iodyn_find_io,
-	.find_mem = NULL,
-	.init = static_init,
-	.exit = NULL,
-};
-EXPORT_SYMBOL(pccard_iodyn_ops);
diff --git a/include/pcmcia/ss.h b/include/pcmcia/ss.h
index 7cf7dbbfa131..89aed99bfeae 100644
--- a/include/pcmcia/ss.h
+++ b/include/pcmcia/ss.h
@@ -227,12 +227,8 @@ struct pcmcia_socket {
 
 
 /* socket drivers must define the resource operations type they use. There
- * are three options:
+ * are two options:
  * - pccard_static_ops		iomem and ioport areas are assigned statically
- * - pccard_iodyn_ops		iomem areas is assigned statically, ioport
- *				areas dynamically
- *				If this option is selected, use
- *				"select PCCARD_IODYN" in Kconfig.
  * - pccard_nonstatic_ops	iomem and ioport areas are assigned dynamically.
  *				If this option is selected, use
  *				"select PCCARD_NONSTATIC" in Kconfig.
@@ -240,13 +236,11 @@ struct pcmcia_socket {
  */
 extern struct pccard_resource_ops pccard_static_ops;
 #if defined(CONFIG_PCMCIA) || defined(CONFIG_PCMCIA_MODULE)
-extern struct pccard_resource_ops pccard_iodyn_ops;
 extern struct pccard_resource_ops pccard_nonstatic_ops;
 #else
 /* If PCMCIA is not used, but only CARDBUS, these functions are not used
  * at all. Therefore, do not use the large (240K!) rsrc_nonstatic module
  */
-#define pccard_iodyn_ops pccard_static_ops
 #define pccard_nonstatic_ops pccard_static_ops
 #endif
 
-- 
2.50.0

