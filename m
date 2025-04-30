Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35DF617A2F5
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 00:12:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745971964; cv=none; b=QBYqwLwur0WTs7BpeeL6KIykGwVUqmuMk9MellLMfMSIaWP9SwbyuW8qg3PgFx8OcsAb+8hW22Fy332uNNTgDNagvprO9iBwVefGxzNMwoZsa/T4d/bZwqjw/A3cUdfuRoMhlHz4ydzRnOuoE5beHKiBT70Tm+LbgDKypY9jGPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745971964; c=relaxed/simple;
	bh=6LnVPk4ddfSWsWM6rob3ta1q1te+xa2ccs2iHDmWUN8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=T9g5N43yr5tmisHYF/ApS6lU6SVzdZGV7ZHOjHjdjTDf1qd1K6Cer71JZoi8XSi0sZ3fcL0t72ckW2b+4SKTKU+Yx9wj/sZQTWA5L4TZXWRdueVLsICle5DGsQckZ1GBhoOweesf1G1cxStdx3stmRQAAtffITNwiVSvuz8VZIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=Zy0aXy+P; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="Zy0aXy+P"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-47686580529so78870191cf.2
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 17:12:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1745971960; x=1746576760; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eLzbAedNoVAFhTOnIuAY3V9RiD91bMliZ7SgGl61EFo=;
        b=Zy0aXy+PVSKcAZR17oSVchucSzQOUgDDcFADsIMZa/7T265cmLfuP9qzX/1VMkIGaw
         dGJmd91/oaNEfA3/NHMjPnhD7PPKKT8VtVGqi0e+OgVEprdr5JTm1e9y+2MnrcuDTqFv
         Jzb8xN28seTJ7//KvH+PiX0zC390MEpUeRppn6J3iPpn+mD977vY35jZ7GjNzLvMhw3a
         6gZuR74kIhXz14FxVQz4kY62GxNcis2sa9GgbRi8Hx5vDSBZFik5BiwducN03UWDiYMF
         6z87ej7G0wxbxKwydnCTkH8wETGK5xbcGgtfdcuMxCWeoDUA9JcAht+wgmx3iQoyHPCG
         /xjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745971960; x=1746576760;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eLzbAedNoVAFhTOnIuAY3V9RiD91bMliZ7SgGl61EFo=;
        b=n7TzPcYNEjGBZHpgvUr+76Z/MozUwK5sM9QUOsjKND/XvI5tAbHIltKvImfBWp7RXr
         Ss+uOjbNrYGaHIYkmRb1ToU0aAown76A7Kh6qGAakahRwkRRikfczA6IKfqWO+AlX79L
         7CkODloR4h3dULk/h1eY2Pf5vjvQlGelcycwD3ZhbMOX0oMlIDZPCSuHAwyeSJKQQr7F
         i84lrscgF+ccUmrjwLdnCyKsO+exzTHZkVgaw81c6Ov1og75FPKxoWPaMoFJJtLb0ZaI
         J4aboA4PTLLk60VqboFUM1C745uN17AEcewAishgW5ezZRDi6iVIjZwCUj0+1WdnDinP
         6IZQ==
X-Forwarded-Encrypted: i=1; AJvYcCUVcRd70x6Auzklcf6/nLVvSzNcmLXeHJ6ywkazgdoQQoBJ8oD3zNefxryLWfU6I3xwxNhNxNBzdbwVVcM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxBGSg3pfzCBiWvBaRAq2VEh8CaXR9k3r73/Zu+b1/w/HLDihjX
	Y3hPD1EEIq6Z/FlwjycolFz2rQD4HvCutNtdckUiCCRUm9WRqLSFVFePzqP7zRE=
X-Gm-Gg: ASbGnct/5eINZDNB5hF9CvMKj30XhsQOXk9GD6Bq5f6ZFIQmHvYrWRFGXNKpf4mMU7X
	wqIuxodNL0wt7w8+9Wb8oxllVDK66RAFYqeSUQElUBsZOo4ZQk5MN8JBTEC3+ZCSVc5ziIUuySc
	GByVhTeX0RlaUphQlYpxPA8IHakb0Z3YHKc1eFe6LPpBjAlV4InJ0L4qXOQuce7iPT9M6wWY1GQ
	LEr+RhnuRdwmlNc8bhgnk+QoxcRIuJm+e5LYt7DjXTD34f6d5rxCmennxyJEQ8Kn3EYR8xtRQ80
	D1ATNZ3CGOKInNI6+YMiEHckGdF81XvphqfWxvN/PR4/lIdZu7m0h84DpOOvWysMpQpyQNQSfvG
	nXNlfcAhhWea0HvOgf/TDW8OoW/7H
X-Google-Smtp-Source: AGHT+IEJX7CKaTXcTN4ER3TV27+/lxml9Rphd1ejhWw2h1O2jcm/w02x8Uf3U7CSZBTwWLfpegVv1w==
X-Received: by 2002:a05:622a:1243:b0:478:f03c:b3dc with SMTP id d75a77b69052e-489c5212c9cmr18879541cf.41.1745971960048;
        Tue, 29 Apr 2025 17:12:40 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F.lan (pool-173-79-56-208.washdc.fios.verizon.net. [173.79.56.208])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-47e9f7a820esm87634411cf.41.2025.04.29.17.12.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 17:12:39 -0700 (PDT)
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
Subject: [RFC PATCH 04/17] cxl: docs/platform/acpi reference documentation
Date: Tue, 29 Apr 2025 20:12:11 -0400
Message-ID: <20250430001224.1028656-5-gourry@gourry.net>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250430001224.1028656-1-gourry@gourry.net>
References: <20250430001224.1028656-1-gourry@gourry.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add basic ACPI table information needed to understand the CXL
driver probe process.

Signed-off-by: Gregory Price <gourry@gourry.net>
---
 Documentation/driver-api/cxl/index.rst        |  1 +
 .../driver-api/cxl/platform/acpi.rst          | 83 +++++++++++++++++++
 .../driver-api/cxl/platform/acpi/cedt.rst     | 52 ++++++++++++
 .../driver-api/cxl/platform/acpi/dsdt.rst     | 27 ++++++
 .../driver-api/cxl/platform/acpi/hmat.rst     | 28 +++++++
 .../driver-api/cxl/platform/acpi/slit.rst     | 17 ++++
 .../driver-api/cxl/platform/acpi/srat.rst     | 37 +++++++++
 7 files changed, 245 insertions(+)
 create mode 100644 Documentation/driver-api/cxl/platform/acpi.rst
 create mode 100644 Documentation/driver-api/cxl/platform/acpi/cedt.rst
 create mode 100644 Documentation/driver-api/cxl/platform/acpi/dsdt.rst
 create mode 100644 Documentation/driver-api/cxl/platform/acpi/hmat.rst
 create mode 100644 Documentation/driver-api/cxl/platform/acpi/slit.rst
 create mode 100644 Documentation/driver-api/cxl/platform/acpi/srat.rst

diff --git a/Documentation/driver-api/cxl/index.rst b/Documentation/driver-api/cxl/index.rst
index 7f4055503a43..e47671e268b2 100644
--- a/Documentation/driver-api/cxl/index.rst
+++ b/Documentation/driver-api/cxl/index.rst
@@ -28,6 +28,7 @@ that have impacts on each other.  The docs here break up configurations steps.
    :caption: Platform Configuration
 
    platform/bios-and-efi
+   platform/acpi
 
 .. toctree::
    :maxdepth: 1
diff --git a/Documentation/driver-api/cxl/platform/acpi.rst b/Documentation/driver-api/cxl/platform/acpi.rst
new file mode 100644
index 000000000000..9d1dfc4f2b8e
--- /dev/null
+++ b/Documentation/driver-api/cxl/platform/acpi.rst
@@ -0,0 +1,83 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+ACPI Tables
+###########
+
+ACPI is the "Advanced Configuration and Power Interface", which is a standard
+that defines how platforms and OS manage power and configure computer hardware.
+For the purpose of this theory of operation, when referring to "ACPI" we will
+usually refer to "ACPI Tables" - which are the way a platform (BIOS/EFI)
+communicates static configuration information to the operation system.
+
+The Following ACPI tables contain *static* configuration and performance data about CXL devices.
+
+.. toctree::
+   :maxdepth: 1
+
+   acpi/cedt.rst
+   acpi/srat.rst
+   acpi/hmat.rst
+   acpi/slit.rst
+   acpi/dsdt.rst
+
+The SRAT table may also contain generic port/initiator content that is intended to describe the generic port, but not information about the rest of the path to the endpoint.
+
+Linux uses these tables to configure kernel resources for statically configured (by BIOS/EFI) CXL devices, such as:
+
+- NUMA nodes
+- Memory Tiers
+- NUMA Abstract Distances
+- SystemRAM Memory Regions
+- Weighted Interleave Node Weights
+
+ACPI Debugging
+**************
+
+The :code:`acpidump -b` command dumps the ACPI tables into binary format.
+
+The :code:`iasl -d` command disassembles the files into human readable format.
+
+Example :code:`acpidump -b && iasl -d cedt.dat` ::
+
+  /*
+   * Intel ACPI Component Architecture
+   * AML/ASL+ Disassembler version 20210604 (64-bit version)
+   * Copyright (c) 2000 - 2021 Intel Corporation
+   *
+   * Disassembly of cedt.dat, Fri Apr 11 07:47:31 2025
+   *
+   * ACPI Data Table [CEDT]
+   *
+   * Format: [HexOffset DecimalOffset ByteLength]  FieldName : FieldValue
+   */
+   [000h 0000   4]   Signature : "CEDT"    [CXL Early Discovery Table]
+   ...
+
+Common Issues
+=============
+Most failures described here result in a failure of the driver to surface
+memory as a DAX device and/or kmem.
+
+* CEDT CFMWS targets list UIDs do not match CEDT CHBS UIDs.
+* CEDT CFMWS targets list UIDs do not match DSDT CXL Host Bridge UIDs.
+* CEDT CFMWS Restriction Bits are not correct.
+* CEDT CFMWS Memory regions are poorly aligned.
+* CEDT CFMWS Memory regions spans a platform memory hole.
+* CEDT CHBS UIDs do not match DSDT CXL Host Bridge UIDs.
+* CEDT CHBS Specification version is incorrect.
+* SRAT is missing regions described in CEDT CFMWS.
+
+  * Result: failure to create a NUMA node for the region, or
+    region is placed in wrong node.
+
+* HMAT is missing data for regions described in CEDT CFMWS.
+
+  * Result: NUMA node being placed in the wrong memory tier.
+
+* SLIT has bad data.
+
+  * Result: Lots of performance mechanisms in the kernel will be very unhappy.
+
+All of these issues will appear to users as if the driver is failing to
+support CXL - when in reality they are all the failure of a platform to
+configure the ACPI tables correctly.
diff --git a/Documentation/driver-api/cxl/platform/acpi/cedt.rst b/Documentation/driver-api/cxl/platform/acpi/cedt.rst
new file mode 100644
index 000000000000..1636131e218b
--- /dev/null
+++ b/Documentation/driver-api/cxl/platform/acpi/cedt.rst
@@ -0,0 +1,52 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+CEDT - CXL Early Discovery Table
+================================
+
+The CXL Early Discovery Table is generated by BIOS to describe the CXL memory regions configured at boot by the BIOS.
+
+CHBS
+----
+The CXL Host Bridge Structure describes CXL host bridges.  Other than describing device register information, it reports the specific host bridge UID for this host bridge.  These host bridge ID's will be referenced in other tables.
+
+Example ::
+
+          Subtable Type : 00 [CXL Host Bridge Structure]
+               Reserved : 00
+                 Length : 0020
+ Associated host bridge : 00000007    <- Host bridge _UID
+  Specification version : 00000001
+               Reserved : 00000000
+          Register base : 0000010370400000
+        Register length : 0000000000010000
+
+CFMWS
+-----
+The CXL Fixed Memory Window structure describes a memory region associated with one or more CXL host bridges (as described by the CHBS).  It additionally describes any inter-host-bridge interleave configuration that may have been programmed by BIOS.
+
+Example ::
+
+            Subtable Type : 01 [CXL Fixed Memory Window Structure]
+                 Reserved : 00
+                   Length : 002C
+                 Reserved : 00000000
+      Window base address : 000000C050000000   <- Memory Region
+              Window size : 0000003CA0000000
+ Interleave Members (2^n) : 01                 <- Interleave configuration
+    Interleave Arithmetic : 00
+                 Reserved : 0000
+              Granularity : 00000000
+             Restrictions : 0006
+                    QtgId : 0001
+             First Target : 00000007           <- Host Bridge _UID
+              Next Target : 00000006           <- Host Bridge _UID
+
+The restriction field dictates what this SPA range may be used for (memory type, voltile vs persistent, etc). One or more bits may be set. ::
+
+  Bit[0]: CXL Type 2 Memory
+  Bit[1]: CXL Type 3 Memory
+  Bit[2]: Volatile Memory
+  Bit[3]: Persistent Memory
+  Bit[4]: Fixed Config (HPA cannot be re-used)
+
+INTRA-host-bridge interleave (multiple devices on one host bridge) is NOT reported in this structure, and is solely defined via CXL device decoder programming (host bridge and endpoint decoders).
diff --git a/Documentation/driver-api/cxl/platform/acpi/dsdt.rst b/Documentation/driver-api/cxl/platform/acpi/dsdt.rst
new file mode 100644
index 000000000000..7e10bfab98d6
--- /dev/null
+++ b/Documentation/driver-api/cxl/platform/acpi/dsdt.rst
@@ -0,0 +1,27 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+DSDT - Differentiated system Description Table
+==============================================
+
+This table describes what peripherals a machine has.
+
+This table's UIDs for CXL devices - specifically host bridges, must be
+consistent with the contents of the CEDT, otherwise the CXL driver will
+fail to probe correctly.
+
+Example Compute Express Link Host Bridge ::
+
+    Scope (_SB)
+    {
+        Device (S0D0)
+        {
+            Name (_HID, "ACPI0016" /* Compute Express Link Host Bridge */)  // _HID: Hardware ID
+            Name (_CID, Package (0x02)  // _CID: Compatible ID
+            {
+                EisaId ("PNP0A08") /* PCI Express Bus */,
+                EisaId ("PNP0A03") /* PCI Bus */
+            })
+            ...
+            Name (_UID, 0x05)  // _UID: Unique ID
+            ...
+      }
diff --git a/Documentation/driver-api/cxl/platform/acpi/hmat.rst b/Documentation/driver-api/cxl/platform/acpi/hmat.rst
new file mode 100644
index 000000000000..d604c5123440
--- /dev/null
+++ b/Documentation/driver-api/cxl/platform/acpi/hmat.rst
@@ -0,0 +1,28 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+HMAT - Heterogeneous Memory Attribute Table
+===========================================
+
+The Heterogeneous Memory Attributes Table contains information such as cache attributes and bandwidth and latency details for memory proximity domains.  For the purpose of this document, we will only discuss the SSLIB entry.
+
+SLLBI
+-----
+The System Locality Latency and Bandwidth Information records latency and bandwidth information for proximity domains.
+
+This table is used by Linux to configure interleave weights and memory tiers.
+
+Example (Heavily truncated for brevity) ::
+
+               Structure Type : 0001 [SLLBI]
+                    Data Type : 00         <- Latency
+ Target Proximity Domain List : 00000000
+ Target Proximity Domain List : 00000001
+                        Entry : 0080       <- DRAM LTC
+                        Entry : 0100       <- CXL LTC
+
+               Structure Type : 0001 [SLLBI]
+                    Data Type : 03         <- Bandwidth
+ Target Proximity Domain List : 00000000
+ Target Proximity Domain List : 00000001
+                        Entry : 1200       <- DRAM BW
+                        Entry : 0200       <- CXL BW
diff --git a/Documentation/driver-api/cxl/platform/acpi/slit.rst b/Documentation/driver-api/cxl/platform/acpi/slit.rst
new file mode 100644
index 000000000000..56126f7ca250
--- /dev/null
+++ b/Documentation/driver-api/cxl/platform/acpi/slit.rst
@@ -0,0 +1,17 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+SLIT - System Locality Information Table
+========================================
+
+The system locality information table provides "abstract distances" between accessor and memory nodes.  Node without initiators (cpus) are infinitely (FF) distance away from all other nodes.
+
+The abstract distance described in this table does not describe any real latency of bandwidth information.
+
+Example ::
+
+    Signature : "SLIT"    [System Locality Information Table]
+   Localities : 0000000000000004
+ Locality   0 : 10 20 20 30
+ Locality   1 : 20 10 30 20
+ Locality   2 : FF FF 0A FF
+ Locality   3 : FF FF FF 0A
diff --git a/Documentation/driver-api/cxl/platform/acpi/srat.rst b/Documentation/driver-api/cxl/platform/acpi/srat.rst
new file mode 100644
index 000000000000..7dce043346c3
--- /dev/null
+++ b/Documentation/driver-api/cxl/platform/acpi/srat.rst
@@ -0,0 +1,37 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+SRAT - Static Resource Affinity Table
+=====================================
+
+The System/Static Resource Affinity Table describes resource (CPU, Memory) affinity to "Proximity Domains". This table is technically optional, but for performance information (see "HMAT") to be enumerated by linux it must be present.
+
+There is a careful dance between the CEDT and SRAT tables and how NUMA nodes are created.  If things don't look quite the way you expect - check the SRAT Memory Affinity entries and CEDT CFMWS to determine what your platform actually supports in terms of flexible topologies.
+
+The SRAT may statically assign portions of a CFMWS SPA range to a specific proximity domains.  See linux numa creation for more information about how this presents in the NUMA topology.
+
+Proximity Domain
+----------------
+A proximity domain is ROUGHLY equivalent to "NUMA Node" - though a 1-to-1 mapping is not guaranteed.  There are scenarios where "Proximity Domain 4" may map to "NUMA Node 3", for example.  (See "NUMA Node Creation")
+
+Memory Affinity
+---------------
+Generally speaking, if a host does any amount of CXL fabric (decoder) programming in BIOS - an SRAT entry for that memory needs to be present.
+
+Example ::
+
+         Subtable Type : 01 [Memory Affinity]
+                Length : 28
+      Proximity Domain : 00000001          <- NUMA Node 1
+             Reserved1 : 0000
+          Base Address : 000000C050000000  <- Physical Memory Region
+        Address Length : 0000003CA0000000
+             Reserved2 : 00000000
+ Flags (decoded below) : 0000000B
+              Enabled : 1
+        Hot Pluggable : 1
+         Non-Volatile : 0
+
+Generic Initiator / Port
+------------------------
+
+todo
-- 
2.49.0

