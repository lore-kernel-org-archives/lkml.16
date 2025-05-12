Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76A7F253347
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 16:22:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747066924; cv=none; b=UUFQEhur7hpU+eBd43zr6JHHmeO6bKkbNJcaElh8XGgSXB1Rfuxb3PYEcLjq5o4R47XC6SOaPCkD+Gy6YarhRV9aL37HsW7X8yCqbQrY2l6DpRsueOZHof3rhSP8o3WjPOv4MZzRGWQ3L79pc0po0WcVxXtGX96cDEXe+ZDYJKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747066924; c=relaxed/simple;
	bh=BxgsIiIVKTAXyq2szFAwqx4FiL+UZIkTpCPzLKiU6Yk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KePgQRViakYgQDfx0HoM32rgi+3LMFVW7NpAlhUrzPKAespb1/pEFv4Th6IHY0hKXBjuzYxXGQl7FpKmPFcydrG+kcpa2iIyN1mkYXhw4/bBrFLXc5qdEFdiNCmtw68ujMFlYt36NcoDZI+2Cn+tnNq8SI9XfNZXcnsyRruSpnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=U+cJ7sQq; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="U+cJ7sQq"
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-7c7913bab2cso541753085a.0
        for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 09:22:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1747066919; x=1747671719; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YMLAIeu20ZZPJ1i/m+n96//lJvh/XtQZo0nMeJDEoyw=;
        b=U+cJ7sQq/KemHu+QeCECIh104kAm7aPa38hW1gsAtX6ushMG6wZaAPPwhxhV1q2P4d
         dOFwIpT72dWCAdcm7XYP1PfFYwl1gFDP0kONQrBOY0mPXRaFW5D5AXBihyrnnuNsOU+g
         4ZRfLN6/fSkj7V/CVKZeS9mx28qopawYsFDjCeb0ZitHqrOSD95l8mDrl0yiHPeiD1x/
         NIBD/TCs1RsJ6OR3dL3g/Wv4jGXFIoDG+E2rqmK+/EdBQOd+nAROpGJN0Ta3VX2nAu0U
         3GGxZiVQEhrVsChRQZuHYTxSHlcmTNegihIp2mYfXAeJSEBsi7KsqtlvANTiezuHUWY4
         8LCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747066919; x=1747671719;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YMLAIeu20ZZPJ1i/m+n96//lJvh/XtQZo0nMeJDEoyw=;
        b=cHTa+WAaW9tV52xEUr78n7lXYkJW65srn4vhZ9cXIDXkL6tJk4DbdEi0PdU7Vl442a
         kmCppMmR7QNXKVAKxYjuyHF5fVdTV1Rm9qxwPLaNPZp7mruRW0hoiPxEGgHF5AMaWbK6
         m3zGJXeWJLEVGxFSfQhTDFcnmifzrKj16UnoZAQZ691PUr40i6aa8mSWV8hmRTjrJe9h
         b/hXQwE7j5waBrrqjPqBX6fMlYfiGNZdo+0PLtA9Cz2rJHKK2O49zQ07shpAq8IQD7aL
         mc2QDSrKC/inzjkdmKzhSj5qDXNpFMq3UblZsDbqyzter8vcjft0Db4v1S2E4oaDZbuf
         /3uQ==
X-Forwarded-Encrypted: i=1; AJvYcCXTwhOP8hikUY6rAgqgYqbGPTQdLX4kR1mVV5KjLYcoL7diDf1eychav0nPC3uVcbj4axnA0Bkq1xIiRJI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyhbci2/YD0hHdgPbSWNUbyFBSkD7VW+G8RNK/w9Sk6o4LvhLUy
	5x/86C++XyzZk5we5+j/u0SP/K2FcEu8lC3EN5CjMfHILiuZ912PfHmc5eyg/JTTmtvfdGiA/QS
	P
X-Gm-Gg: ASbGncuLrgdG5btZjzTCT5NuxL0Oeuks0iAkvrorbDGqLC+vSqNZXLJXcR9GD/T00QV
	sdQBt04lKWdAwNJDLAbXZO6mSznGGXlM5tkv8SLqb4O17GOiT76kwtxVz/m5mwY0O4OuuAQWJeB
	2onZ1nmw05dLERvUKj2R5W775M6V83KBF8vDas0Ve/s15+rG/GsbkqIt0ZyJz0YRnpyTGG2VEWT
	mdNxm7aOR9aKUnBK+s/rNLs4IEXmTmEHAH57FP9nlfljcpZp6srlwIXJORyRLSOIrxb6yHVIQkh
	vB1omj5XYD6sTX5zf3uReFfqgB75aLoHFCO+Xm/LDYZxLvCLvtMFXfmGlApP1gylZiXQmqIiVk8
	/xQafwOgXjbe/VhwhxEdrMMkkOQMA0Tt3EK2l
X-Google-Smtp-Source: AGHT+IGK3lfjM4oSpvVjN4nvNUpXvpjzwqjwnlVVwpRdQ+DJ0SjErWBHozx2SdjcQ9/faPIK34NbmQ==
X-Received: by 2002:a05:620a:2586:b0:7c7:a5cb:2b65 with SMTP id af79cd13be357-7cd01101edfmr2018895985a.26.1747066919098;
        Mon, 12 May 2025 09:21:59 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F.lan (pool-96-255-20-42.washdc.ftas.verizon.net. [96.255.20.42])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-49452583961sm52461791cf.58.2025.05.12.09.21.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 09:21:58 -0700 (PDT)
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
Subject: [PATCH v3 11/17] cxl: docs/linux/dax-driver documentation
Date: Mon, 12 May 2025 12:21:28 -0400
Message-ID: <20250512162134.3596150-12-gourry@gourry.net>
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

Add documentation on how the CXL driver interacts with the DAX driver.

Signed-off-by: Gregory Price <gourry@gourry.net>
---
 Documentation/driver-api/cxl/index.rst        |   1 +
 .../driver-api/cxl/linux/cxl-driver.rst       | 115 ++++++++++++++++--
 .../driver-api/cxl/linux/dax-driver.rst       |  43 +++++++
 3 files changed, 149 insertions(+), 10 deletions(-)
 create mode 100644 Documentation/driver-api/cxl/linux/dax-driver.rst

diff --git a/Documentation/driver-api/cxl/index.rst b/Documentation/driver-api/cxl/index.rst
index df3c7763c79a..f2127968ea78 100644
--- a/Documentation/driver-api/cxl/index.rst
+++ b/Documentation/driver-api/cxl/index.rst
@@ -36,6 +36,7 @@ that have impacts on each other.  The docs here break up configurations steps.
    linux/overview
    linux/early-boot
    linux/cxl-driver
+   linux/dax-driver
    linux/access-coordinates
 
 
diff --git a/Documentation/driver-api/cxl/linux/cxl-driver.rst b/Documentation/driver-api/cxl/linux/cxl-driver.rst
index 486baf8551aa..cf6b397abdb1 100644
--- a/Documentation/driver-api/cxl/linux/cxl-driver.rst
+++ b/Documentation/driver-api/cxl/linux/cxl-driver.rst
@@ -34,6 +34,32 @@ into a single memory region. The memory region has been converted to dax. ::
     decoder1.0   decoder5.0  endpoint5   port1  region0
     decoder2.0   decoder5.1  endpoint6   port2  root0
 
+
+.. kernel-render:: DOT
+   :alt: Digraph of CXL fabric describing host-bridge interleaving
+   :caption: Diagraph of CXL fabric with a host-bridge interleave memory region
+
+   digraph foo {
+     "root0" -> "port1";
+     "root0" -> "port3";
+     "root0" -> "decoder0.0";
+     "port1" -> "endpoint5";
+     "port3" -> "endpoint6";
+     "port1" -> "decoder1.0";
+     "port3" -> "decoder3.0";
+     "endpoint5" -> "decoder5.0";
+     "endpoint6" -> "decoder6.0";
+     "decoder0.0" -> "region0";
+     "decoder0.0" -> "decoder1.0";
+     "decoder0.0" -> "decoder3.0";
+     "decoder1.0" -> "decoder5.0";
+     "decoder3.0" -> "decoder6.0";
+     "decoder5.0" -> "region0";
+     "decoder6.0" -> "region0";
+     "region0" -> "dax_region0";
+     "dax_region0" -> "dax0.0";
+   }
+
 For this section we'll explore the devices present in this configuration, but
 we'll explore more configurations in-depth in example configurations below.
 
@@ -41,7 +67,7 @@ Base Devices
 ------------
 Most devices in a CXL fabric are a `port` of some kind (because each
 device mostly routes request from one device to the next, rather than
-provide a manageable service).
+provide a direct service).
 
 Root
 ~~~~
@@ -53,6 +79,8 @@ The Root contains links to:
 
 * `Host Bridge Ports` defined by ACPI CEDT CHBS.
 
+* `Downstream Ports` typically connected to `Host Bridge Ports`.
+
 * `Root Decoders` defined by ACPI CEDT CFMWS.
 
 ::
@@ -150,6 +178,27 @@ device configuration data. ::
     driver    label_storage_size  pmem         serial
     firmware  numa_node           ram          subsystem
 
+A Memory Device is a discrete base object that is not a port.  While the
+physical device it belongs to may also host an `endpoint`, the relationship
+between an `endpoint` and a `memdev` is not captured in sysfs.
+
+Port Relationships
+~~~~~~~~~~~~~~~~~~
+In our example described above, there are four host bridges attached to the
+root, and two of the host bridges have one endpoint attached.
+
+.. kernel-render:: DOT
+   :alt: Digraph of CXL fabric describing host-bridge interleaving
+   :caption: Diagraph of CXL fabric with a host-bridge interleave memory region
+
+   digraph foo {
+     "root0"    -> "port1";
+     "root0"    -> "port2";
+     "root0"    -> "port3";
+     "root0"    -> "port4";
+     "port1" -> "endpoint5";
+     "port3" -> "endpoint6";
+   }
 
 Decoders
 --------
@@ -322,6 +371,29 @@ settings (granularity and ways must be the same).
 Endpoint decoders are created during :code:`cxl_endpoint_port_probe` in the
 :code:`cxl_port` driver, and is created based on a PCI device's DVSEC registers.
 
+Decoder Relationships
+~~~~~~~~~~~~~~~~~~~~~
+In our example described above, there is one root decoder which routes memory
+accesses over two host bridges.  Each host bridge has a decoder which routes
+access to their singular endpoint targets.  Each endpoint has a decoder which
+translates HPA to DPA and services the memory request.
+
+The driver validates relationships between ports by decoder programming, so
+we can think of decoders being related in a similarly hierarchical fashion to
+ports.
+
+.. kernel-render:: DOT
+   :alt: Digraph of hierarchical relationship between root, switch, and endpoint decoders.
+   :caption: Diagraph of CXL root, switch, and endpoint decoders.
+
+   digraph foo {
+     "root0"    -> "decoder0.0";
+     "decoder0.0" -> "decoder1.0";
+     "decoder0.0" -> "decoder3.0";
+     "decoder1.0" -> "decoder5.0";
+     "decoder3.0" -> "decoder6.0";
+   }
+
 Regions
 -------
 
@@ -348,6 +420,17 @@ The interleave settings in a `Memory Region` describe the configuration of the
 `Interleave Set` - and are what can be expected to be seen in the endpoint
 interleave settings.
 
+.. kernel-render:: DOT
+   :alt: Digraph of CXL memory region relationships between root and endpoint decoders.
+   :caption: Regions are created based on root decoder configurations. Endpoint decoders
+             must be programmed with the same interleave settings as the region.
+
+   digraph foo {
+     "root0"    -> "decoder0.0";
+     "decoder0.0" -> "region0";
+     "region0" -> "decoder5.0";
+     "region0" -> "decoder6.0";
+   }
 
 DAX Region
 ~~~~~~~~~~
@@ -360,7 +443,6 @@ for more details. ::
     dax0.0      devtype  modalias   uevent
     dax_region  driver   subsystem
 
-
 Mailbox Interfaces
 ------------------
 A mailbox command interface for each device is exposed in ::
@@ -418,17 +500,30 @@ the relationships between a decoder and it's parent.
 
 For example, in a `Cross-Link First` interleave setup with 16 endpoints
 attached to 4 host bridges, linux expects the following ways/granularity
-across the root, host bridge, and endpoints respectively. ::
+across the root, host bridge, and endpoints respectively.
+
+.. flat-table:: 4x4 cross-link first interleave settings
+
+  * - decoder
+    - ways
+    - granularity
 
-                   ways   granularity
-  root              4        256
-  host bridge       4       1024
-  endpoint         16        256
+  * - root
+    - 4
+    - 256
+
+  * - host bridge
+    - 4
+    - 1024
+
+  * - endpoint
+    - 16
+    - 256
 
 At the root, every a given access will be routed to the
 :code:`((HPA / 256) % 4)th` target host bridge. Within a host bridge, every
-:code:`((HPA / 1024) % 4)th` target endpoint.  Each endpoint will translate
-the access based on the entire 16 device interleave set.
+:code:`((HPA / 1024) % 4)th` target endpoint.  Each endpoint translates based
+on the entire 16 device interleave set.
 
 Unbalanced interleave sets are not supported - decoders at a similar point
 in the hierarchy (e.g. all host bridge decoders) must have the same ways and
@@ -467,7 +562,7 @@ In this example, the CFMWS defines two discrete non-interleaved 4GB regions
 for each host bridge, and one interleaved 8GB region that targets both. This
 would result in 3 root decoders presenting in the root. ::
 
-  # ls /sys/bus/cxl/devices/root0
+  # ls /sys/bus/cxl/devices/root0/decoder*
     decoder0.0  decoder0.1  decoder0.2
 
   # cat /sys/bus/cxl/devices/decoder0.0/target_list start size
diff --git a/Documentation/driver-api/cxl/linux/dax-driver.rst b/Documentation/driver-api/cxl/linux/dax-driver.rst
new file mode 100644
index 000000000000..10d953a2167b
--- /dev/null
+++ b/Documentation/driver-api/cxl/linux/dax-driver.rst
@@ -0,0 +1,43 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+====================
+DAX Driver Operation
+====================
+The `Direct Access Device` driver was originally designed to provide a
+memory-like access mechanism to memory-like block-devices.  It was
+extended to support CXL Memory Devices, which provide user-configured
+memory devices.
+
+The CXL subsystem depends on the DAX subsystem to either:
+
+- Generate a file-like interface to userland via :code:`/dev/daxN.Y`, or
+- Engage the memory-hotplug interface to add CXL memory to page allocator.
+
+The DAX subsystem exposes this ability through the `cxl_dax_region` driver.
+A `dax_region` provides the translation between a CXL `memory_region` and
+a `DAX Device`.
+
+DAX Device
+==========
+A `DAX Device` is a file-like interface exposed in :code:`/dev/daxN.Y`. A
+memory region exposed via dax device can be accessed via userland software
+via the :code:`mmap()` system-call.  The result is direct mappings to the
+CXL capacity in the task's page tables.
+
+Users wishing to manually handle allocation of CXL memory should use this
+interface.
+
+kmem conversion
+===============
+The :code:`dax_kmem` driver converts a `DAX Device` into a series of `hotplug
+memory blocks` managed by :code:`kernel/memory-hotplug.c`.  This capacity
+will be exposed to the kernel page allocator in the user-selected memory
+zone.
+
+The :code:`memmap_on_memory` setting (both global and DAX device local)
+dictates where the kernell will allocate the :code:`struct folio` descriptors
+for this memory will come from.  If :code:`memmap_on_memory` is set, memory
+hotplug will set aside a portion of the memory block capacity to allocate
+folios. If unset, the memory is allocated via a normal :code:`GFP_KERNEL`
+allocation - and as a result will most likely land on the local NUM node of the
+CPU executing the hotplug operation.
-- 
2.49.0

