Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 659FC258CC8
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 03:05:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747364751; cv=none; b=mwfzt1CAcCf+9rJi58aXNhOJdW8iBLcDAXiC+KN7V8Dpy8VWVAHFJ5ZJDPVMGJCXpu79DdADMptmLbqdp98GP4MHdbor0X3KrbOYJbEvciCDyAoi7A8hILw19xwsa8lPOMMnaid5davf0jqTg6F1Htpn6MVLilu/hUmRQI8iBdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747364751; c=relaxed/simple;
	bh=h+vHAUoPGBj9ueEF40vasfKWJtbIhR4WDJYtsgSQiqY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=M8hznk1ePD2N3f68eP7bOvXTk7aS3xCa8y0VeW206REsgh8uitmXsWW+/8fVk5qmOU45xiXvOL7QSRIbt7YWyXB5aEmu0JGq5Nt742WyI2/J6O2GhCQ8Y+Kv5aUOkU41fE0a9j3z9SdDn0ko15wioJFOvC0clZS4EozGBaH4xLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=X7gjPZxy; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="X7gjPZxy"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-22e661313a3so19179205ad.3
        for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 20:05:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1747364748; x=1747969548; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1Vt4avVN1JMW1dLLTypBf6HyDWimdmGBTky31Gipgqs=;
        b=X7gjPZxyyCQ+yRA5oqIBW3ZPquHs70u2sNboe6ZEY8wR+zRA0KPjVVGPsGXSThQDdf
         csh18ypslWjUNxZT0x3RaHYgIzIDTLEZEfXqbgXpWDfB2EiA1IHR081S7EqK5Ek2fCH6
         GP1UW7mdrFErlYhRvkffVL7hMcs/YXXR6nyg/PSLEiU+XHMZKWWwzsjfXvwBXf4RTNCQ
         Rt71KERftFCX8SoaaAOCyzMfXp3OCoEA7XhhlU/ld7Sc2vHzz2SpXyj3uipSfgfAzqMj
         LElmNPmroYct7RXMTpNU2OR0P2MbZ/Va3dmK4Vwhm07oW2SRAxtZS6BaLRfYQbKzMVCS
         XoaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747364748; x=1747969548;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1Vt4avVN1JMW1dLLTypBf6HyDWimdmGBTky31Gipgqs=;
        b=hoR+s7ihyDLygv/Z6avqXvs8DRt0MJiutNqeNbmAXhZN2EcZFbo8juy4YXhELZqjgG
         8Glh2OC05sHRD4pzwhjJRIab3ybASCR8PTOA+I75z5WM0fJIoixBe66zCv0m6iFBqUHd
         /ZXMIJZyJV9wBOHuQzcWdbhh8rzk6J1xhI1qczBqnpJH270jRbFgtrMj5bB00670PpKs
         BRA82NT0R6PDep2Qifk6LiMLrXgDZv0XczMyfnc+T329d+th3C62uiSRMINsbQvuLoL6
         UeaaBtsxDhiIqUEKgpnwnIO+FlTD7b1CX+Ejn6NZPxM3LrOGeaY2cskGpVXAiWzP6pr8
         1+/g==
X-Forwarded-Encrypted: i=1; AJvYcCXmxEVhmwYyBvw0fnIBj448B/vliQWqbexBC2V9+pBl+qTMdNWlCiWU+d7Jk3dS/0aD3m2dSPWiJvlCKBs=@vger.kernel.org
X-Gm-Message-State: AOJu0YwE7xfLWHLNA0+yNz5KNdqW2aFZuDAFt1TT/e3OGMz88LEoJzv9
	aLUmRCjobD1XoBEUrFPrb+7BvFfDOhC6NYirPhwV+5JjS4soo+0gLERtj18mA2T4SD0=
X-Gm-Gg: ASbGncuhY1OkZaOieFwaOiiq9D4nO4lBZKz2CDUgQ+d3RebXiYj3OeyFPDn0jYvkzIU
	nX1zmEbDg4u7wOXLGzeveHWg1rN4qxRtv+tsd9YjowwWYgqks6SPvXIrK8aT4tyOZncl98WEk/G
	Afnd9SVTHW3s+UA7s/NZ4yaS8/QmH9sbgGu4XnRWJyXumjQWWhcjo/ndSyvMFlEJYJUE3FuSfR6
	d2GYWj7DGf/SjNR6Vr5YCcXdhe/SflnJHGIY6M+iokYoiwt/Wcdvf7f3sQXrqMOP9Z5Tzqj1es9
	XXVFtNc+19sXTfzx9FoYyk8WTcUPx0bl8uxLJHsCNj8e0sP9U2gYMZvL2mIiOsmvSOZmIBBUlYd
	7UUrKOh+hLihKfC4IqTuYug==
X-Google-Smtp-Source: AGHT+IFrDHDI6jFyMdlNAcCJx/pSir2AtLkYuzD7zLd9+Mx8cd+OY5EwjsAwoSuuGlRkVPdDwKz98Q==
X-Received: by 2002:a17:903:32ce:b0:21f:6fb9:9299 with SMTP id d9443c01a7336-231de375e8cmr9043405ad.27.1747364748415;
        Thu, 15 May 2025 20:05:48 -0700 (PDT)
Received: from cyan-mbp.internal.sifive.com ([136.226.240.168])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4ebb084sm4804405ad.201.2025.05.15.20.05.45
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 15 May 2025 20:05:47 -0700 (PDT)
From: Cyan Yang <cyan.yang@sifive.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	corbet@lwn.net,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	samuel.holland@sifive.com
Cc: linux-doc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Cyan Yang <cyan.yang@sifive.com>
Subject: [PATCH v2 04/12] riscv: hwprobe: Add SiFive vendor extension support and probe for xsfqmaccdod and xsfqmaccqoq
Date: Fri, 16 May 2025 11:03:02 +0800
Message-Id: <20250516030310.16950-5-cyan.yang@sifive.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20250516030310.16950-1-cyan.yang@sifive.com>
References: <20250516030310.16950-1-cyan.yang@sifive.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a new hwprobe key "RISCV_HWPROBE_KEY_VENDOR_EXT_SIFIVE_0" which allows
userspace to probe for the new vendor extensions from SiFive. Also, add
new hwprobe for SiFive "xsfvqmaccdod" and "xsfvqmaccqoq" vendor
extensions.

Signed-off-by: Cyan Yang <cyan.yang@sifive.com>
---
 arch/riscv/include/asm/hwprobe.h              |  1 +
 .../asm/vendor_extensions/sifive_hwprobe.h    | 19 ++++++++++++++++++
 arch/riscv/include/uapi/asm/vendor/sifive.h   |  4 ++++
 arch/riscv/kernel/sys_hwprobe.c               |  5 +++++
 arch/riscv/kernel/vendor_extensions/Makefile  |  1 +
 .../kernel/vendor_extensions/sifive_hwprobe.c | 20 +++++++++++++++++++
 6 files changed, 50 insertions(+)
 create mode 100644 arch/riscv/include/asm/vendor_extensions/sifive_hwprobe.h
 create mode 100644 arch/riscv/include/uapi/asm/vendor/sifive.h
 create mode 100644 arch/riscv/kernel/vendor_extensions/sifive_hwprobe.c

diff --git a/arch/riscv/include/asm/hwprobe.h b/arch/riscv/include/asm/hwprobe.h
index 1c6977305776..7fe0a379474a 100644
--- a/arch/riscv/include/asm/hwprobe.h
+++ b/arch/riscv/include/asm/hwprobe.h
@@ -22,6 +22,7 @@ static inline bool hwprobe_key_is_bitmask(__s64 key)
 	case RISCV_HWPROBE_KEY_IMA_EXT_0:
 	case RISCV_HWPROBE_KEY_CPUPERF_0:
 	case RISCV_HWPROBE_KEY_VENDOR_EXT_THEAD_0:
+	case RISCV_HWPROBE_KEY_VENDOR_EXT_SIFIVE_0:
 		return true;
 	}
 
diff --git a/arch/riscv/include/asm/vendor_extensions/sifive_hwprobe.h b/arch/riscv/include/asm/vendor_extensions/sifive_hwprobe.h
new file mode 100644
index 000000000000..90a61abd033c
--- /dev/null
+++ b/arch/riscv/include/asm/vendor_extensions/sifive_hwprobe.h
@@ -0,0 +1,19 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _ASM_RISCV_VENDOR_EXTENSIONS_SIFIVE_HWPROBE_H
+#define _ASM_RISCV_VENDOR_EXTENSIONS_SIFIVE_HWPROBE_H
+
+#include <linux/cpumask.h>
+
+#include <uapi/asm/hwprobe.h>
+
+#ifdef CONFIG_RISCV_ISA_VENDOR_EXT_SIFIVE
+void hwprobe_isa_vendor_ext_sifive_0(struct riscv_hwprobe *pair, const struct cpumask *cpus);
+#else
+static inline void hwprobe_isa_vendor_ext_sifive_0(struct riscv_hwprobe *pair,
+						   const struct cpumask *cpus)
+{
+	pair->value = 0;
+}
+#endif
+
+#endif
diff --git a/arch/riscv/include/uapi/asm/vendor/sifive.h b/arch/riscv/include/uapi/asm/vendor/sifive.h
new file mode 100644
index 000000000000..f25d8cf110d1
--- /dev/null
+++ b/arch/riscv/include/uapi/asm/vendor/sifive.h
@@ -0,0 +1,4 @@
+/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
+
+#define	RISCV_HWPROBE_VENDOR_EXT_XSFVQMACCDOD		(1 << 0)
+#define	RISCV_HWPROBE_VENDOR_EXT_XSFVQMACCQOQ		(1 << 1)
diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwprobe.c
index 249aec8594a9..138e74f05de7 100644
--- a/arch/riscv/kernel/sys_hwprobe.c
+++ b/arch/riscv/kernel/sys_hwprobe.c
@@ -15,6 +15,7 @@
 #include <asm/uaccess.h>
 #include <asm/unistd.h>
 #include <asm/vector.h>
+#include <asm/vendor_extensions/sifive_hwprobe.h>
 #include <asm/vendor_extensions/thead_hwprobe.h>
 #include <vdso/vsyscall.h>
 
@@ -300,6 +301,10 @@ static void hwprobe_one_pair(struct riscv_hwprobe *pair,
 		pair->value = riscv_timebase;
 		break;
 
+	case RISCV_HWPROBE_KEY_VENDOR_EXT_SIFIVE_0:
+		hwprobe_isa_vendor_ext_sifive_0(pair, cpus);
+		break;
+
 	case RISCV_HWPROBE_KEY_VENDOR_EXT_THEAD_0:
 		hwprobe_isa_vendor_ext_thead_0(pair, cpus);
 		break;
diff --git a/arch/riscv/kernel/vendor_extensions/Makefile b/arch/riscv/kernel/vendor_extensions/Makefile
index d5fdde0e863b..a4eca96d1c8a 100644
--- a/arch/riscv/kernel/vendor_extensions/Makefile
+++ b/arch/riscv/kernel/vendor_extensions/Makefile
@@ -2,5 +2,6 @@
 
 obj-$(CONFIG_RISCV_ISA_VENDOR_EXT_ANDES)	+= andes.o
 obj-$(CONFIG_RISCV_ISA_VENDOR_EXT_SIFIVE)	+= sifive.o
+obj-$(CONFIG_RISCV_ISA_VENDOR_EXT_SIFIVE)	+= sifive_hwprobe.o
 obj-$(CONFIG_RISCV_ISA_VENDOR_EXT_THEAD)	+= thead.o
 obj-$(CONFIG_RISCV_ISA_VENDOR_EXT_THEAD)	+= thead_hwprobe.o
diff --git a/arch/riscv/kernel/vendor_extensions/sifive_hwprobe.c b/arch/riscv/kernel/vendor_extensions/sifive_hwprobe.c
new file mode 100644
index 000000000000..461ce0f305ce
--- /dev/null
+++ b/arch/riscv/kernel/vendor_extensions/sifive_hwprobe.c
@@ -0,0 +1,20 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+#include <asm/vendor_extensions/sifive.h>
+#include <asm/vendor_extensions/sifive_hwprobe.h>
+#include <asm/vendor_extensions/vendor_hwprobe.h>
+
+#include <linux/cpumask.h>
+#include <linux/types.h>
+
+#include <uapi/asm/hwprobe.h>
+#include <uapi/asm/vendor/sifive.h>
+
+void hwprobe_isa_vendor_ext_sifive_0(struct riscv_hwprobe *pair, const struct cpumask *cpus)
+{
+	VENDOR_EXTENSION_SUPPORTED(pair, cpus,
+				   riscv_isa_vendor_ext_list_sifive.per_hart_isa_bitmap, {
+		VENDOR_EXT_KEY(XSFVQMACCDOD);
+		VENDOR_EXT_KEY(XSFVQMACCQOQ);
+	});
+}
-- 
2.39.5 (Apple Git-154)

