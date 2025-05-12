Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23B722505CD
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 16:22:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747066934; cv=none; b=AEHtG51bQdPcsuFGcF7wz/2CGHpmNNbTXYcW89JBebfrt0drhuHOuk/3rkXib3X/PraPoZ5yflob1SK5NoLMiI2qtEmws4Qk1/KtIBc1xtoZu8VjERBARrOl5dxPTNI1tzl1oXYos5UYEEHe9ikTLdEkUZ8HIStcFQWWMecnVXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747066934; c=relaxed/simple;
	bh=AhTLdqyE2De1b9HJN76/C5lAERWGT4jHTFZhEoUDbtk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=a/IUSvu3eC1jt/2qt12JtrlFze9fdpppq9na3UvTYyjLiRO0l5grFUtUMqWTijTILpEmCF1w9Bg8bSqAqKhhnh9OYRj7Afgrl8zIymQzIqp02GqvkgvHLF3dTd6UmemJGzFpKHr7mwlQn9wQ1afqdczeNi1RqH3Nwk/Fh5nYSLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=naJCUgy1; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="naJCUgy1"
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-476a1acf61eso50527611cf.1
        for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 09:22:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1747066932; x=1747671732; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xF2+54Is9Y/RM3HTLl2GmOBtMHoFbKc3iQ93j5V9CWg=;
        b=naJCUgy1KWk+rmjdU4UXP/sXKVzlM6e/kOeFIw2bcTa8BKo+5adJjkIjJY3n4Z6le6
         IhK4lGAc18HZcr22dV7XR2FxKJvFlFP+8+MxpRLhX+Q4duAppB7QPy8J3AVqNTRwXpDH
         ue4kGKIsWS9bpethSs0ip7bQc9u5+XOAK6oiyuPKYQKA+WK1h60GZjHmG3UQm8GdfMSR
         XJy8dWe4ihEVMaufP1U8STA8NL6CU26cOkpivcVCOJV0XRjGxhejghidvf1ruCdB/x8d
         B76Q1bBOnMv53aAnwOfhtoJS+KwrOx1pMzevELpbqvaOhCQzPrD2uzWOhhLsZoXL0lwJ
         KDsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747066932; x=1747671732;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xF2+54Is9Y/RM3HTLl2GmOBtMHoFbKc3iQ93j5V9CWg=;
        b=hg1DOz/ullCqfQ7Z3E0uvgEtIYXS3Rowyj/19Dd+n43qtx9V/OenarEtnFlN8UQk2O
         44dLA9/pIK5Iw45vWpaiyXa9Ru0k/wH9TKqViyqE6WkpLOnu0KgXWN8kJP3MJX8/H2+V
         U+KaOXEyluH3493QwzfHTXW0Z3MtzcRYu7/e1LdcKfGsfyflkvYHKlKgtQNVoM/ZdadO
         8aSPIEpJgmV79sJtTvHryMYMdN2M+yRIGa2bhmVV5vHCdkkWXwmA6XkWXOTxRJr+Oa0a
         4A0+pnAas6OolEOKUq8nzKCjFVXZvZ6gXwwZtAAZbASWjzG0Cru1LFEQOxHA3XKjwBFA
         fn3w==
X-Forwarded-Encrypted: i=1; AJvYcCVhbcSjoS13+YGhRU3QyM3Of3YkOQ4aOsCtghARkmJHlpHa06j8xVF779visPYZYBctfjFKfJLgW5hcM1w=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7GG1Nrc9LjGvBUPxOgEeZ20lv5x2tc16NVBnQnW1+LijZV/ST
	P3NdmoalqmgvxgKfvkl4YXOXJDEEvbtbR0Ngb8GaawlkGLusidNZ0XkxkAED8luWVc4XWgNd7xS
	I
X-Gm-Gg: ASbGncuQDNLxOSSHzD3WmZ9K3wExyevpGI/qjc6oBe+zTwtfz7Yfk+mQNRy592L/F1R
	xmei4pF+AmJeQ3l+SqLjGGUOZ3u+qrMiyczzk3OQ9YSJDl/2VlmEy22o0jUqXYHU/vcONqKvaEN
	77knLz34WlS29Wu8Lsi4XKNXF21cNG3yCJcm5zpkH9idBBAc9U3ejhxfptCiCweycQhkT2LUoBw
	EDdNpDZlZLRXLlk9cO+cLVYbWtakbRRCqJ+D9htKZDG8PdAH1ko5LFbwuJdko9QSdyHan1NSNdX
	rVRXD2aMgcrBXk788PXxWscva5EwAe19eTnhZ/grgNpYxJlbnUzir3cyNNQbDjcgnsi3Wa7tjeH
	d8K9kOaB02xLiii/YmNpaN2+EHEHzddKngDyO
X-Google-Smtp-Source: AGHT+IEUvJWC96dITPrF63xDkehCwcU0FPTtDoj7fUuKu2PGS+4UNxLAuwofc+V4RoH9DNoujCSNzA==
X-Received: by 2002:a05:622a:1aa0:b0:476:838c:b0ce with SMTP id d75a77b69052e-4945273c308mr238859421cf.13.1747066920650;
        Mon, 12 May 2025 09:22:00 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F.lan (pool-96-255-20-42.washdc.ftas.verizon.net. [96.255.20.42])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-49452583961sm52461791cf.58.2025.05.12.09.21.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 09:22:00 -0700 (PDT)
From: Gregory Price <gourry@gourry.net>
To: linux-cxl@vger.kernel.org
Cc: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel-team@meta.com,
	dave@stgolabs.net,
	jonathan.cameron@huawei.com,
	dave.jiang@intel.com,
	alison.schofield@intel.com,
	vishal.l.verma@intel.com,
	ira.weiny@intel.com,
	dan.j.williams@intel.com,
	corbet@lwn.net
Subject: [PATCH v3 12/17] cxl: docs/linux/memory-hotplug
Date: Mon, 12 May 2025 12:21:29 -0400
Message-ID: <20250512162134.3596150-13-gourry@gourry.net>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250512162134.3596150-1-gourry@gourry.net>
References: <20250512162134.3596150-1-gourry@gourry.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add documentation on how the CXL driver surfaces memory through the
DAX driver and memory-hotplug.

Signed-off-by: Gregory Price <gourry@gourry.net>
---
 Documentation/driver-api/cxl/index.rst        |  1 +
 .../driver-api/cxl/linux/memory-hotplug.rst   | 78 +++++++++++++++++++
 2 files changed, 79 insertions(+)
 create mode 100644 Documentation/driver-api/cxl/linux/memory-hotplug.rst

diff --git a/Documentation/driver-api/cxl/index.rst b/Documentation/driver-api/cxl/index.rst
index f2127968ea78..35c5b0c6f95e 100644
--- a/Documentation/driver-api/cxl/index.rst
+++ b/Documentation/driver-api/cxl/index.rst
@@ -37,6 +37,7 @@ that have impacts on each other.  The docs here break up configurations steps.
    linux/early-boot
    linux/cxl-driver
    linux/dax-driver
+   linux/memory-hotplug
    linux/access-coordinates
 
 
diff --git a/Documentation/driver-api/cxl/linux/memory-hotplug.rst b/Documentation/driver-api/cxl/linux/memory-hotplug.rst
new file mode 100644
index 000000000000..af368c2bc9cf
--- /dev/null
+++ b/Documentation/driver-api/cxl/linux/memory-hotplug.rst
@@ -0,0 +1,78 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+==============
+Memory Hotplug
+==============
+The final phase of surfacing CXL memory to the kernel page allocator is for
+the `DAX` driver to surface a `Driver Managed` memory region via the
+memory-hotplug component.
+
+There are four major configurations to consider:
+
+1) Default Online Behavior (on/off and zone)
+2) Hotplug Memory Block size
+3) Memory Map Resource location
+4) Driver-Managed Memory Designation
+
+Default Online Behavior
+=======================
+The default-online behavior of hotplug memory is dictated by the following,
+in order of precedence:
+
+- :code:`CONFIG_MHP_DEFAULT_ONLINE_TYPE` Build Configuration
+- :code:`memhp_default_state` Boot parameter
+- :code:`/sys/devices/system/memory/auto_online_blocks` value
+
+These dictate whether hotplugged memory blocks arrive in one of three states:
+
+1) Offline
+2) Online in :code:`ZONE_NORMAL`
+3) Online in :code:`ZONE_MOVABLE`
+
+:code:`ZONE_NORMAL` implies this capacity may be used for almost any allocation,
+while :code:`ZONE_MOVABLE` implies this capacity should only be used for
+migratable allocations.
+
+:code:`ZONE_MOVABLE` attempts to retain the hotplug-ability of a memory block
+so that it the entire region may be hot-unplugged at a later time.  Any capacity
+onlined into :code:`ZONE_NORMAL` should be considered permanently attached to
+the page allocator.
+
+Hotplug Memory Block Size
+=========================
+By default, on most architectures, the Hotplug Memory Block Size is either
+128MB or 256MB.  On x86, the block size increases up to 2GB as total memory
+capacity exceeds 64GB.  As of v6.15, Linux does not take into account the
+size and alignment of the ACPI CEDT CFMWS regions (see Early Boot docs) when
+deciding the Hotplug Memory Block Size.
+
+Memory Map
+==========
+The location of :code:`struct folio` allocations to represent the hotplugged
+memory capacity are dictated by the following system settings:
+
+- :code:`/sys_module/memory_hotplug/parameters/memmap_on_memory`
+- :code:`/sys/bus/dax/devices/daxN.Y/memmap_on_memory`
+
+If both of these parameters are set to true, :code:`struct folio` for this
+capacity will be carved out of the memory block being onlined.  This has
+performance implications if the memory is particularly high-latency and
+its :code:`struct folio` becomes hotly contended.
+
+If either parameter is set to false, :code:`struct folio` for this capacity
+will be allocated from the local node of the processor running the hotplug
+procedure.  This capacity will be allocated from :code:`ZONE_NORMAL` on
+that node, as it is a :code:`GFP_KERNEL` allocation.
+
+Systems with extremely large amounts of :code:`ZONE_MOVABLE` memory (e.g.
+CXL memory pools) must ensure that there is sufficient local
+:code:`ZONE_NORMAL` capacity to host the memory map for the hotplugged capacity.
+
+Driver Managed Memory
+=====================
+The DAX driver surfaces this memory to memory-hotplug as "Driver Managed". This
+is not a configurable setting, but it's important to note that driver managed
+memory is explicitly excluded from use during kexec.  This is required to ensure
+any reset or out-of-band operations that the CXL device may be subject to during
+a functional system-reboot (such as a reset-on-probe) will not cause portions of
+the kexec kernel to be overwritten.
-- 
2.49.0

