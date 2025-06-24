Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E116886348
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 03:26:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750735617; cv=none; b=JK/S7b55QVn7wsus0bvhjhE7ezy3AW+TEszt7af5rU2aMK2UBEtJi11gXzmceHafYXNHF2KegTf7Gk7N6c+z7Y+CzjnQJ0QtOuCcCqow99Y1N9fIqybIWC6g51MCIgIhb62xKvXa31F++yEajTC0gft+tKoq/QkNg3cN0wMH7Ns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750735617; c=relaxed/simple;
	bh=WBSqBKrbvBhLeAr+XtrdPGpusMlRBFNf9t/J0Ppge2g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fdrP5fFFqkebxAK/IpKA+HU0nKDzgfRq7a+5Y2f9CEDTx6FLlFbPPeildCeMJqSMsW2ANExJy26CUaOAcvXbYgcu0JgSzwbkUH1h31a6A3HItxN80ErT+QUUf8q7uIWlUAxwdbtkaJC76pMpDcekDO33nuXvX/IjzqpTxLKrpow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XIBeUj7H; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XIBeUj7H"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-b321bd36a41so1289660a12.2
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 20:26:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750735615; x=1751340415; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=y6zAzkUctYOg+2Au8hGXTHoJuMr5xeREM4DfgRkZ3y8=;
        b=XIBeUj7HiqpCOj+tLefN8LvHZMjKy1+Pi3zoGWpiZ5zopuECCY9GPdWw8QDdBrOR60
         pKx3kAFiawADuwjcZCkIx4oVNzrEr52OSAvQwt2ffj/VCv+ZTQrK6s3q4wB6lQNeHlMV
         f/hNX1Gp+inG1V36Pz+MIAFg4cMsAWdTqxOnB/wQn7kvmpDv2phzG9CDprcJdSHoRnjL
         7ZCvSVs/BBWzlphZOurNVhUkV6SdbOsv42GEwZNABvH6zuCR9rj3dbk7OD4tCUUjd7/l
         GweWnmrdzQqpjpls+a+9qVhaPPCGwS8Uy3nRWkMnfkuU+/3xdSlS5h19OUkSQS8uUprl
         eMbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750735615; x=1751340415;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y6zAzkUctYOg+2Au8hGXTHoJuMr5xeREM4DfgRkZ3y8=;
        b=WtC7me/uGRvOC4Rnb4OP6+nmBvc0v12+19GUNvSdhefHLKNpYRto62Hp6ot99jXSIc
         1XctroZW5VH7/7Rv3r5M3Nplmb7G/XkA7dxFZ/DroEY2m/5kgEjkPNetAP6zGlvJggh8
         lJKFKkTLhJXEF4YZ8htwx+a8XfhPMw1lqYNKhDO+wXjV5wEwl23CARmPCk7ozrKkb8Lb
         XNrfXouBBx6eA4VgOyq6vtI0So7Co6bWJQ2vZ3lVAi0L1R1mgBhsMyHveuzVi0JvjOxE
         yFy+owL65E/ZSdkRiTXK+OED5VExZKQKd/thrSR+T4rrJlm8OfaliKVV2l9aWQnh85hZ
         QQ0A==
X-Gm-Message-State: AOJu0YyMeKzFhefqr+TGpQu0HlbniVStOPBns/JErzszpeTOhRnGuSq0
	ooXGJ21eIEDWaskb+kQ0YZdoaYTvb9RU2Ro98CcRRa9kKBfjF4d1wDNy
X-Gm-Gg: ASbGncvMNKiAGr4hJORv5JemMOZLQ8B/Ch++WJ6jXozwkswh0new9GZ68Q5aK+drdKB
	fx5ppEyyHYK77hn8tRSSb7zmjRJpfRfTxE72P/4Yvpz2zlrPUkmULKmIGcy72HasdanV14WrNtx
	phOEfN9RVqCGEKVGgdH5bFzNN5wXfewy4TkmMcnLa9yx/PhVxioNzjUkyfTiBnF7zCpa5YpHXF4
	cgoVFlWAgiiIl/EWiP68CMZAqWEpEDTrs0gXfLhAZsQahMsylrGrR+Q/oN23/Z1KtozVHmKVECf
	tu5hA4KhjkpaGs4SbMWWxNDIWjcaueaAb1rSX2qObzz7mV0Xqq3S1/cOLS4f5Raam9SDb0ArT8+
	uMAv5
X-Google-Smtp-Source: AGHT+IFsxyNsJftblVLXEbiCRXhAPY2/0TIDGnHa1E1az+8QjwIny2JUcrmMji0R1JszNLxSUTbcVw==
X-Received: by 2002:a17:903:2381:b0:234:8c52:1f9b with SMTP id d9443c01a7336-237d9ab0946mr265104355ad.43.1750735615032;
        Mon, 23 Jun 2025 20:26:55 -0700 (PDT)
Received: from seokw-960QHA.lan ([210.100.209.148])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b31f119ac5bsm9173394a12.20.2025.06.23.20.26.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 20:26:54 -0700 (PDT)
From: Ryan Chung <seokwoo.chung130@gmail.com>
To: jgross@suse.com,
	sstabellini@kernel.org,
	oleksandr_tyshchenko@epam.com
Cc: linux-kernel@vger.kernel.org,
	Ryan Chung <seokwoo.chung130@gmail.com>
Subject: [PATCH] xen-pciback: Use sysfs_emit_at() in slots_show() and irq_handlers_show()
Date: Tue, 24 Jun 2025 12:26:32 +0900
Message-ID: <20250624032632.63845-1-seokwoo.chung130@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace the use of scnprintf() with sysfs_emit_at() in slots_show() and irq_handlers_show().

This change uses sysfs_emit() API usage for sysfs 'show'
functions as recommended from Documentation/filesystems/sysfs.rst. 

No functional change intended.

Signed-off-by: Ryan Chung <seokwoo.chung130@gmail.com>
---
 drivers/xen/xen-pciback/pci_stub.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/xen/xen-pciback/pci_stub.c b/drivers/xen/xen-pciback/pci_stub.c
index 5c2f829d5b0b..d0a889474a46 100644
--- a/drivers/xen/xen-pciback/pci_stub.c
+++ b/drivers/xen/xen-pciback/pci_stub.c
@@ -18,6 +18,7 @@
 #include <linux/wait.h>
 #include <linux/sched.h>
 #include <linux/atomic.h>
+#include <linux/sysfs.h>
 #include <xen/events.h>
 #include <xen/pci.h>
 #include <xen/xen.h>
@@ -30,6 +31,7 @@
 #include "conf_space.h"
 #include "conf_space_quirks.h"
 
+
 #define PCISTUB_DRIVER_NAME "pciback"
 
 static char *pci_devs_to_hide;
@@ -720,7 +722,7 @@ static void kill_domain_by_device(struct pcistub_device *psdev)
 		return;
 	}
 	/*PV AER handlers will set this flag*/
-	xenbus_printf(xbt, nodename, "aerState" , "aerfail");
+	xenbus_printf(xbt, nodename, "aerState", "aerfail");
 	err = xenbus_transaction_end(xbt, 0);
 	if (err) {
 		if (err == -EAGAIN)
@@ -1261,7 +1263,7 @@ static ssize_t slots_show(struct device_driver *drv, char *buf)
 		if (count >= PAGE_SIZE)
 			break;
 
-		count += scnprintf(buf + count, PAGE_SIZE - count,
+			count += sysfs_emit_at(buf, count,
 				   "%04x:%02x:%02x.%d\n",
 				   pci_dev_id->domain, pci_dev_id->bus,
 				   PCI_SLOT(pci_dev_id->devfn),
@@ -1290,7 +1292,7 @@ static ssize_t irq_handlers_show(struct device_driver *drv, char *buf)
 		if (!dev_data)
 			continue;
 		count +=
-		    scnprintf(buf + count, PAGE_SIZE - count,
+		    sysfs_emit_at(buf, count,
 			      "%s:%s:%sing:%ld\n",
 			      pci_name(psdev->dev),
 			      dev_data->isr_on ? "on" : "off",
-- 
2.43.0

