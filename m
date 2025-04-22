Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DBA427BF99
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 11:32:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745321536; cv=none; b=hjL3UdtxhMJhcuhP1xaEzminOtLg69k9zwFsRKSZXcL8wRRwtwNfgM0v5QXa/66aoTKG4AlInsv6lBCY6vkopGhmSXWwOP2HuPBW1YVteNPta3pebwrxjBlnVPTTQic+wNLrcP8Z3h7o3shf11txP779jfxGaQylASy+fDhfzho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745321536; c=relaxed/simple;
	bh=97uK62zmD2sWyzkTZ44MvQTZD69HqLC6hR2+rP9VfTk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NW+LtiTk6JCfChfAOB2Eb6bRJIcefKs6X7CEdL/21aVlFXQXxdFFbdtd5AQcLzXoBasNAVdz4+zeqJ43UAQfBp9p9SgNb8q2Rkr7nzRQ7RaMYnAfMLrVZAp88oPGKUAJAiartT7+LH4aeMyC53x/fiC3IhG4U76ongKbpVLIO4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NTEcpbuz; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NTEcpbuz"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-39141ffa9fcso2324434f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 04:32:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745321532; x=1745926332; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SCwux+a4Q8sCXgF1emBYGhkcA+99fK1/4YdDu/kkdcA=;
        b=NTEcpbuz6UtTebR0zP9xWoG3jP3pcZP1zE0vJtRD9dL1MztRe/nOx0ZWlkxW41mxHx
         NbvBnzxLg6U5JH+4RLH3HQJZi39pdY/l4KFJ2bXbsm3Iq3lcIuYhwA1LMo5DQAgQnUsf
         jWgjUQvJBUO1HTElL6QSJ/3VZm9/+hUT9UJcGUis8IGPx+gity9TYuzcUzo5Em9MpuxR
         5cwHpd/h4MS0h+WruCQtfpfdnqK5r/FX5GCOQMBHsdkXy5G4cH7x53a8XRUxpmS2B6GP
         ooui4sSAHbzhN8Yq/5+TAHn5QegMD9Q/WDonPSWRSmC/LiIJ/GYiIdW4JAFPCDMBgpXi
         kEOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745321532; x=1745926332;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SCwux+a4Q8sCXgF1emBYGhkcA+99fK1/4YdDu/kkdcA=;
        b=opBvGLTMdRdZz6pbhepx5d2mnl2GKz862b/vRrJSQxduYj1y+UeW4VIR4s2WG7OqCz
         VwSr6sP5UhT2g0uYonN9HMIKVUqF6lmyigO2J53cVTwk2wTq5kAcTqZTqVU2a+yPJjqf
         vv47G9qH4x6RG9oPKO9XEB/JnPxMJjAvUnhv/+5Gj7ngEyykWnfWa3AMtzv1e+5n6EFK
         xsYCVf1IDGQCmON2h2GFUTwOP47tVUkPYyOygIXSP1A5cJH8TfgbSK6mdu+UBYG+C6aD
         Aw58m51lr5fUgNho56E2ajrZoGlu+Ro/rn0WLnUziN+rz23uhyDSrl4D3eveN8ktAUXU
         MSfQ==
X-Gm-Message-State: AOJu0YyW9jPzMm5OYqhvzxkGU9E1Xew01jSx2/orWcfWgAUS9ttaYlsO
	btVSLCZWXokAYfCCvQerNmri9wCuCPViL9AeUGrSxOLASoCgryXNMK2ShXVw70iu/JdMStlf5uV
	P
X-Gm-Gg: ASbGncvcL/xhNypYMO96oAVLOGwUxP2lHNHJBSawE2ZKAHyUE4akBTOY7bC0Kf02UsX
	EhH/15RH+a4m+VOHfiP4Fg82pBkRdcCRIgFl4KT18042grmRRNFHjPB5cxs8js8fZCkCCqykeub
	745ccO7ZqeXI9lxIAO+41dQktrm7WuCVp7zwPeZfmqneIGrjb8lOJB65dHGoVtq+fYiWeJdbxrI
	KSrY6HGCzuYkhecdxGe/fv2WJiKqlCrrqPNMl8pSqAoj58iJV+K2YpRuEjlabIWi68wG7AzwhQ2
	E9GxEdQpboEq4H8STfdSm+BAEc/3ePI9NJPtBFW1l6DMXklZEloyTao87Vb6Oiw=
X-Google-Smtp-Source: AGHT+IGMfuXrs6yBJwUzUPD9ezVigzRz4yUbqmU88PCa4ZD+NBPSxQaWYDkLyhCxy4qvd1m4zcFnzQ==
X-Received: by 2002:a05:6000:1862:b0:38d:d0ca:fbad with SMTP id ffacd0b85a97d-39efba3c803mr11877512f8f.14.1745321532510;
        Tue, 22 Apr 2025 04:32:12 -0700 (PDT)
Received: from eugen-station.. ([2a02:2f0a:131e:0:1820:da87:73b1:d80c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa49312fsm14907887f8f.70.2025.04.22.04.32.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 04:32:12 -0700 (PDT)
From: Eugen Hristev <eugen.hristev@linaro.org>
To: linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	andersson@kernel.org
Cc: linux-doc@vger.kernel.org,
	corbet@lwn.net,
	tglx@linutronix.de,
	mingo@redhat.com,
	rostedt@goodmis.org,
	john.ogness@linutronix.de,
	senozhatsky@chromium.org,
	pmladek@suse.com,
	peterz@infradead.org,
	mojha@qti.qualcomm.com,
	linux-arm-kernel@lists.infradead.org,
	vincent.guittot@linaro.org,
	konradybcio@kernel.org,
	dietmar.eggemann@arm.com,
	juri.lelli@redhat.com,
	eugen.hristev@linaro.org
Subject: [RFC][PATCH 02/14] kmemdump: introduce kmemdump
Date: Tue, 22 Apr 2025 14:31:44 +0300
Message-ID: <20250422113156.575971-3-eugen.hristev@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250422113156.575971-1-eugen.hristev@linaro.org>
References: <20250422113156.575971-1-eugen.hristev@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Kmemdump mechanism allows any driver to mark a specific memory area
for later dumping purpose, depending on the functionality
of the attached backend. The backend would interface any hardware
mechanism that will allow dumping to complete regardless of the
state of the kernel (running, frozen, crashed, or any particular
state).

Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
---
 drivers/Kconfig          |   2 +
 drivers/Makefile         |   2 +
 drivers/debug/Kconfig    |  16 ++++
 drivers/debug/Makefile   |   3 +
 drivers/debug/kmemdump.c | 185 +++++++++++++++++++++++++++++++++++++++
 include/linux/kmemdump.h |  52 +++++++++++
 6 files changed, 260 insertions(+)
 create mode 100644 drivers/debug/Kconfig
 create mode 100644 drivers/debug/Makefile
 create mode 100644 drivers/debug/kmemdump.c
 create mode 100644 include/linux/kmemdump.h

diff --git a/drivers/Kconfig b/drivers/Kconfig
index 7bdad836fc62..ef56588f559e 100644
--- a/drivers/Kconfig
+++ b/drivers/Kconfig
@@ -245,4 +245,6 @@ source "drivers/cdx/Kconfig"
 
 source "drivers/dpll/Kconfig"
 
+source "drivers/debug/Kconfig"
+
 endmenu
diff --git a/drivers/Makefile b/drivers/Makefile
index 45d1c3e630f7..cf544a405007 100644
--- a/drivers/Makefile
+++ b/drivers/Makefile
@@ -195,3 +195,5 @@ obj-$(CONFIG_CDX_BUS)		+= cdx/
 obj-$(CONFIG_DPLL)		+= dpll/
 
 obj-$(CONFIG_S390)		+= s390/
+
+obj-y				+= debug/
diff --git a/drivers/debug/Kconfig b/drivers/debug/Kconfig
new file mode 100644
index 000000000000..22348608d187
--- /dev/null
+++ b/drivers/debug/Kconfig
@@ -0,0 +1,16 @@
+# SPDX-License-Identifier: GPL-2.0
+menu "Generic Driver Debug Options"
+
+config DRIVER_KMEMDUMP
+	bool "Allow drivers to register memory for dumping"
+	help
+	  Kmemdump mechanism allows any driver to mark a specific memory area
+	  for later dumping purpose, depending on the functionality
+	  of the attached backend. The backend would interface any hardware
+	  mechanism that will allow dumping to complete regardless of the
+	  state of the kernel (running, frozen, crashed, or any particular
+	  state).
+
+	  Note that modules using this feature must be rebuilt if option
+	  changes.
+endmenu
diff --git a/drivers/debug/Makefile b/drivers/debug/Makefile
new file mode 100644
index 000000000000..cc14dea250e3
--- /dev/null
+++ b/drivers/debug/Makefile
@@ -0,0 +1,3 @@
+# SPDX-License-Identifier: GPL-2.0
+
+obj-$(CONFIG_DRIVER_KMEMDUMP) += kmemdump.o
diff --git a/drivers/debug/kmemdump.c b/drivers/debug/kmemdump.c
new file mode 100644
index 000000000000..a685c0863e25
--- /dev/null
+++ b/drivers/debug/kmemdump.c
@@ -0,0 +1,185 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <linux/device.h>
+#include <linux/errno.h>
+#include <linux/module.h>
+#include <linux/kmemdump.h>
+#include <linux/idr.h>
+
+#define MAX_ZONES 512
+
+static struct kmemdump_backend *backend;
+static DEFINE_IDR(kmemdump_idr);
+static DEFINE_MUTEX(kmemdump_lock);
+static LIST_HEAD(kmemdump_list);
+
+/**
+ * kmemdump_register() - Register region into kmemdump.
+ * @handle: string of maximum 8 chars that identifies this region
+ * @zone: pointer to the zone of memory
+ * @size: region size
+ *
+ * Return: On success, it returns an allocated unique id that can be used
+ *	at a later point to identify the region. On failure, it returns
+ *	negative error value.
+ */
+int kmemdump_register(char *handle, void *zone, size_t size)
+{
+	struct kmemdump_zone *z = kzalloc(sizeof(*z), GFP_KERNEL);
+	int id;
+
+	if (!z)
+		return -ENOMEM;
+
+	mutex_lock(&kmemdump_lock);
+
+	id = idr_alloc_cyclic(&kmemdump_idr, z, 0, MAX_ZONES, GFP_KERNEL);
+	if (id < 0) {
+		mutex_unlock(&kmemdump_lock);
+		return id;
+	}
+
+	if (!backend)
+		pr_debug("kmemdump backend not available yet, waiting...\n");
+
+	z->zone = zone;
+	z->size = size;
+	z->id = id;
+
+	if (handle)
+		strscpy(z->handle, handle, 8);
+
+	if (backend) {
+		int ret;
+
+		ret = backend->register_region(id, handle, zone, size);
+		if (ret) {
+			mutex_unlock(&kmemdump_lock);
+			return ret;
+		}
+		z->registered = true;
+	}
+
+	mutex_unlock(&kmemdump_lock);
+	return id;
+}
+EXPORT_SYMBOL_GPL(kmemdump_register);
+
+/**
+ * kmemdump_unregister() - Unregister region from kmemdump.
+ * @id: unique id that was returned when this region was successfully
+ *	registered initially.
+ *
+ * Return: None
+ */
+void kmemdump_unregister(int id)
+{
+	struct kmemdump_zone *z;
+
+	mutex_lock(&kmemdump_lock);
+
+	z = idr_find(&kmemdump_idr, id);
+	if (!z)
+		return;
+	if (z->registered && backend)
+		backend->unregister_region(z->id);
+
+	idr_remove(&kmemdump_idr, id);
+	kfree(z);
+
+	mutex_unlock(&kmemdump_lock);
+}
+EXPORT_SYMBOL_GPL(kmemdump_unregister);
+
+static int kmemdump_register_fn(int id, void *p, void *data)
+{
+	struct kmemdump_zone *z = p;
+	int ret;
+
+	if (z->registered)
+		return 0;
+
+	ret = backend->register_region(z->id, z->handle, z->zone, z->size);
+	if (ret)
+		return ret;
+	z->registered = true;
+
+	return 0;
+}
+
+/**
+ * kmemdump_register_backend() - Register a backend into kmemdump.
+ * Only one backend is supported at a time.
+ * @be: Pointer to a driver allocated backend. This backend must have
+ *	two callbacks for registering and deregistering a zone from the
+ *	backend.
+ *
+ * Return: On success, it returns 0, negative error value otherwise.
+ */
+int kmemdump_register_backend(struct kmemdump_backend *be)
+{
+	mutex_lock(&kmemdump_lock);
+
+	if (backend)
+		return -EALREADY;
+
+	if (!be || !be->register_region || !be->unregister_region)
+		return -EINVAL;
+
+	backend = be;
+	pr_info("kmemdump backend %s registered successfully.\n",
+		backend->name);
+
+	/* Try to call the backend for all previously requested zones */
+	idr_for_each(&kmemdump_idr, kmemdump_register_fn, NULL);
+
+	mutex_unlock(&kmemdump_lock);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(kmemdump_register_backend);
+
+static int kmemdump_unregister_fn(int id, void *p, void *data)
+{
+	int ret;
+	struct kmemdump_zone *z = p;
+
+	if (!z->registered)
+		return 0;
+
+	ret = backend->unregister_region(z->id);
+	if (ret)
+		return ret;
+	z->registered = false;
+
+	return 0;
+}
+
+/**
+ * kmemdump_register_backend() - Unregister the backend from kmemdump.
+ * Only one backend is supported at a time.
+ * Before deregistering, this will call the backend to unregister all the
+ * previously registered zones.
+ * @be: Pointer to a driver allocated backend. This backend must match
+ *	the initially registered backend.
+ *
+ * Return: None
+ */
+void kmemdump_unregister_backend(struct kmemdump_backend *be)
+{
+	mutex_lock(&kmemdump_lock);
+
+	if (backend != be) {
+		mutex_unlock(&kmemdump_lock);
+		return;
+	}
+
+	/* Try to call the backend for all previously requested zones */
+	idr_for_each(&kmemdump_idr, kmemdump_unregister_fn, NULL);
+
+	backend = NULL;
+	pr_info("kmemdump backend %s removed successfully.\n", be->name);
+
+	mutex_unlock(&kmemdump_lock);
+}
+EXPORT_SYMBOL_GPL(kmemdump_unregister_backend);
diff --git a/include/linux/kmemdump.h b/include/linux/kmemdump.h
new file mode 100644
index 000000000000..b55b15c295ac
--- /dev/null
+++ b/include/linux/kmemdump.h
@@ -0,0 +1,52 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef _KMEMDUMP_H
+#define _KMEMDUMP_H
+
+#define KMEMDUMP_ZONE_MAX_HANDLE 8
+/**
+ * struct kmemdump_zone - region mark zone information
+ * @id: unique id for this zone
+ * @zone: pointer to the memory area for this zone
+ * @size: size of the memory area of this zone
+ * @registered: bool indicating whether this zone is registered into the
+ *	backend or not.
+ * @handle: a string representing this region
+ */
+struct kmemdump_zone {
+	int id;
+	void *zone;
+	size_t size;
+	bool registered;
+	char handle[KMEMDUMP_ZONE_MAX_HANDLE];
+};
+
+#define KMEMDUMP_BACKEND_MAX_NAME 128
+/**
+ * struct kmemdump_backend - region mark backend information
+ * @name: the name of the backend
+ * @register_region: callback to register region in the backend
+ * @unregister_region: callback to unregister region in the backend
+ */
+struct kmemdump_backend {
+	char name[KMEMDUMP_BACKEND_MAX_NAME];
+	int (*register_region)(unsigned int id, char *, void *, size_t);
+	int (*unregister_region)(unsigned int id);
+};
+
+#ifdef CONFIG_DRIVER_KMEMDUMP
+int kmemdump_register(char *handle, void *zone, size_t size);
+void kmemdump_unregister(int id);
+#else
+static inline int kmemdump_register(char *handle, void *area, size_t size)
+{
+	return 0;
+}
+
+static inline void kmemdump_unregister(int id)
+{
+}
+#endif
+
+int kmemdump_register_backend(struct kmemdump_backend *backend);
+void kmemdump_unregister_backend(struct kmemdump_backend *backend);
+#endif
-- 
2.43.0

