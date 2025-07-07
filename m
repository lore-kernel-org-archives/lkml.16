Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 667DF1A23BE
	for <linux-kernel@vger.kernel.org>; Mon,  7 Jul 2025 09:55:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751882161; cv=none; b=MzF9/iLbzFu/ImHCv2rEph718W9ogGTR4Ghe/z0SwQE6Y9yOE4UXHcVPhnKlnf9HlnD5aCFcl0sOkZ/ISnhUZFknTx25qhJl7zo9oIFnnPV7+3vfZTqakDfUUC6DeA8kc5x/fjyPZSMWSd1OXUTAhALfojvDo9fBYkTp7cvQJBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751882161; c=relaxed/simple;
	bh=5SmqN2hxFQFJjyo5J7rVonC5tRzyxlkIxoCjEQCw0d4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=G64AI5+6qpU6Ed0ZRR8j4IFMibklCthcOtcIGDkQzmQkmbnOqAsDXPZOOqwJn/QTgnvk6e1J0byXYY8L47ID1bUErG/Gjom6Khtmxh/NKqA3K4mA8uuLeM5O83BTROLKr4Dg8HOe+OfLnmajwWopCzzeDcJle4PliG0SBOgfVIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wmp8B9Nt; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wmp8B9Nt"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-45348bff79fso31542425e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 07 Jul 2025 02:55:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751882158; x=1752486958; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XFK9CGANpFb6qlTeThT0DwZIyre/1tnyiYdjSQY76dQ=;
        b=wmp8B9Ntb7pnKbUXz9KNAgOyskNTqJN7x5Ufjf0AXUGr5u5oAin1xNE+NAkK/6rXor
         JTQagTi5lx2/qUHO1O2I0R+1/FDAgT2ItVc5fkF3LMCbYlj/N/ibAY/z3AzSBCe1OQ5c
         CGV+wuirINbi0D+BK/eKXbiWk3llXRJZ+fXPhgt9bJ07w2kon/yTOyM6PLqfo0qsURta
         0k0HoRhi6xkDAIsbxfOCB0DsJ4WNyPigduOZsF4b1jY8TFGQumMTDXetRSV8LQp19J4G
         jZj5yqtnNP9QTEs4E6HB8dLJjWiej2u9P4hJU9KAYAJqpnd4ju+TD4nBMOyrisyy2cWb
         OF4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751882158; x=1752486958;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XFK9CGANpFb6qlTeThT0DwZIyre/1tnyiYdjSQY76dQ=;
        b=Ws17pxkJJMq7bz4RZFxuTusqChfwV7tbDG/c/Z2P/EzScWtJ+A6lAFu3LpgZcxMlWS
         n5A1taL+Ph9gJQgIEFRsFa08SrMno8fqGSMeTLZBLZTKzUxlzF2461MATEa4Ao/Y1e+h
         sQdZwTDLtOjI7lM/4j5vcm7D3KQPyj8AQdqB/Ta34qF478zsbk1/XXb3vmRNVN00rIyM
         +WyQkJMC/Ifpe/o054gtJk89kMBVg2tSBeuOUftSxRKrUAu1teqbsjkGe8b2/0fTszl+
         tY7BkW7hJQGdqkIGyX4Qd70jXwSwQk498GA1Mfv8UwlIUhcGA7f0ZmMOMqc5vevx8+iw
         2gEA==
X-Forwarded-Encrypted: i=1; AJvYcCWbqTpcM0Ka54TimJqtl557x5mpGjVq+5lvNOTU019/+on5bb2HgscTrXkHSa15B4bjCBikeaKXz6ewVOA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyxcwFbp27OcI5NwhKvhK6FrTJn/uevBnIqM4USEmlj19sofBs4
	p++kHMynX1lGj/imXrhtAUCl+9Fcg2HGGt/ZQ8piW0sBP8Xeea4kF7/f4LSodkYCI18=
X-Gm-Gg: ASbGnctobwbHIBaByEqYai7R13xgsUvRam8MtJ046aprViVSG6aVhRkDZelIJyC/UI9
	YEVp+RDsQfTB5dD4gOztwKnxmyXBEnWJ6LQNhzsQvWSz8jPL43ZLT5qVk+sdruMgQsglfztFnq1
	t7svjcKcwk6zJp3GWLLAIqyGy9WExmbuDIefIfSJJDlMsYL4qMNQ+PVz5bJ2TdZPEWXRp208aCE
	4g/4uO2pUAUmWLX9dhL8tw72DnJrqvLllXXKtIVv4jE00BP7+N8kRYyPNk/RsL9LrR2T3tAirFS
	Q1A0mxAj6OVMQAEUCXYT/sBeOWJZ5gQXbilErxz5Q/ra2WhHzWbVRaecX/HX6/vJlQ3iniw=
X-Google-Smtp-Source: AGHT+IHrp6i6CjW0J0hqro//S7APuf2A8nxf/qPiQQ/JN5ARtQAbdWL7Q7Mj0NHZUV2exYC6za6wrQ==
X-Received: by 2002:a05:600c:3b95:b0:454:ad94:4b3d with SMTP id 5b1f17b1804b1-454cb768c35mr1610785e9.1.1751882157640;
        Mon, 07 Jul 2025 02:55:57 -0700 (PDT)
Received: from ho-tower-lan.lan ([37.18.136.128])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454a9beb22asm136617625e9.36.2025.07.07.02.55.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jul 2025 02:55:57 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Mon, 07 Jul 2025 10:55:27 +0100
Subject: [PATCH] coresight: Fix missing include for FIELD_GET
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250707-james-coresight-bitfield-include-v1-1-aa0f4220ecfd@linaro.org>
X-B4-Tracking: v=1; b=H4sIAI6Za2gC/x3NywqDMBBG4VeRWXcgxhv1VUoXmvzRERslY0tBf
 PeGLr/NOScpkkCpL05K+IjKFjPKW0FuHuIEFp9N1tjGdKbjZXhB2W0JKtN88ChHEKyeJbr17cG
 m8mUdmqq9B0s5sycE+f4Xj+d1/QAcuFN9cgAAAA==
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@linaro.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Yeoreum Yun <yeoreum.yun@arm.com>, Leo Yan <leo.yan@arm.com>, 
 Naresh Kamboju <naresh.kamboju@linaro.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 Linux Kernel Functional Testing <lkft@linaro.org>, 
 James Clark <james.clark@linaro.org>
X-Mailer: b4 0.14.0

Include the header for FIELD_GET which is only sometimes transitively
included on some configs and kernel releases.

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
Closes: https://lists.linaro.org/archives/list/lkft-triage@lists.linaro.org/thread/6GKMK52PPRJVEYMEUHJP6BXF4CJAXOFL/
Fixes: a4e65842e114 ("coresight: Only check bottom two claim bits")
Signed-off-by: James Clark <james.clark@linaro.org>
---
 drivers/hwtracing/coresight/coresight-core.c        | 1 +
 drivers/hwtracing/coresight/coresight-etm4x-core.c  | 1 +
 drivers/hwtracing/coresight/coresight-etm4x-sysfs.c | 1 +
 drivers/hwtracing/coresight/ultrasoc-smb.h          | 1 +
 4 files changed, 4 insertions(+)

diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index fa758cc21827..c2db94f2ab23 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -3,6 +3,7 @@
  * Copyright (c) 2012, The Linux Foundation. All rights reserved.
  */
 
+#include <linux/bitfield.h>
 #include <linux/build_bug.h>
 #include <linux/kernel.h>
 #include <linux/init.h>
diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
index 42e5d37403ad..cbea200489c8 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
+++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
@@ -4,6 +4,7 @@
  */
 
 #include <linux/acpi.h>
+#include <linux/bitfield.h>
 #include <linux/bitops.h>
 #include <linux/kernel.h>
 #include <linux/kvm_host.h>
diff --git a/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c b/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c
index ab251865b893..e9eeea6240d5 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c
+++ b/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c
@@ -4,6 +4,7 @@
  * Author: Mathieu Poirier <mathieu.poirier@linaro.org>
  */
 
+#include <linux/bitfield.h>
 #include <linux/coresight.h>
 #include <linux/pid_namespace.h>
 #include <linux/pm_runtime.h>
diff --git a/drivers/hwtracing/coresight/ultrasoc-smb.h b/drivers/hwtracing/coresight/ultrasoc-smb.h
index c4c111275627..323f0ccb6878 100644
--- a/drivers/hwtracing/coresight/ultrasoc-smb.h
+++ b/drivers/hwtracing/coresight/ultrasoc-smb.h
@@ -7,6 +7,7 @@
 #ifndef _ULTRASOC_SMB_H
 #define _ULTRASOC_SMB_H
 
+#include <linux/bitfield.h>
 #include <linux/miscdevice.h>
 #include <linux/spinlock.h>
 

---
base-commit: 408c97c4a5e0b634dcd15bf8b8808b382e888164
change-id: 20250707-james-coresight-bitfield-include-03d14f5369f2

Best regards,
-- 
James Clark <james.clark@linaro.org>

