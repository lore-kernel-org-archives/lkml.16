Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57BBA2512F1
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 16:21:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747066916; cv=none; b=By2icAlHpDMeZZg9lQUjxqMqPC7n0AKyS21IEMBApMtgVIW76k3zBrkzcqI7iMSI/utGUMgVTL2yP+EfvexMt/K4K93Hdw2WoIojj39J8jBbEhOs69z08Q1aI3EXMNmCEh6JV89d66gCVHE6mltYkbEODVipERUDKESzqWItQfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747066916; c=relaxed/simple;
	bh=aJTqpTx6bsWfmRdt6o+xFOaEEnNMGOmHb4T2fWSWHmQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tzmOvfohurR861D7pE9EGEudhudxnSudFXsI93vzrev1aUlZwfTPPvTQ97MqAG+hfZJM6fRlwNgne0lN43aCNmBcku90ehAhRk6DYZNk89bKhTbC60pv1wQ9suAsnTVzU3lf7Ayec/Pe5Ikzse/spZNRh1sYulmq+8H1M3QSjIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=LmK7QMWn; arc=none smtp.client-ip=209.85.161.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="LmK7QMWn"
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-60219d9812bso1208479eaf.0
        for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 09:21:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1747066913; x=1747671713; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LfCbmkU3+1+JpMWzgtmMUQbf359Bf8sTjX9QYifoLuE=;
        b=LmK7QMWn2ihvZtP+AkX+chFCS7wDMkRvRkF9o4r7H5+6BWYo/+pYuoK6bzX4RmG+rj
         RLaBCBkOWZaLq2DMvM44i2OIq86ELMDf4W+IV1EkN30sgzcE6Pa3RBrNLfQfIgZTiZt0
         MBnzEiI4YV/z7PEzaZfwbQuTL5rcywsVNWKJXbQQVKb+Oq/5dQAdzeaPSc5SmVHZYuwm
         dipcjwgxO+h3vzPiqGxAjK7Ble6sZaVyfBg4cn6/Y2UPTJBJYpOOC94oecbSFMbDkHDM
         PRZ1u5dWKzhHDPg+O/QXqq5Gtmbi2r1rJ0QnFj+MFyYFPUDyJJEhCdcJTcW2Et8uZX9i
         TzhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747066913; x=1747671713;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LfCbmkU3+1+JpMWzgtmMUQbf359Bf8sTjX9QYifoLuE=;
        b=sNX+jodBprVTVuaG2c6oKhGrFQOChlNEJO5f/SQDJsZJd0PlPvQfgLLfNqvAAH+/yA
         CNWjK8YA4Xlk58aKhEXKRXLO7eonuju0SnG+EzYrO5vLh39X0bcb7U7tdkbKBBAVHgAN
         63H9A9q5bod9U2T87ppVAR2S9KBBnngys/i8NdpYYGECSYaD0+6uHYuAvXyMbGkiDdkx
         8/OelsNgEZWBsrMOLmy/RXYChgo7GibK/aeuZYCVPpD4pz0VdqHIkFuPVsK0f7wzOon9
         kzTaNzfXQdRJMRERzzqE02w0fgi8ibkIsoA1XpmTGXFPS/MCsSURHjiQUZS0BhDtnUKp
         veGQ==
X-Forwarded-Encrypted: i=1; AJvYcCW9nnOvmuPvb9RMSammdGtIWhN+tGWeuyKNfk0iqvwaWp78r9FhPx9/EbICggWYHvXDICuIGad6/uU79fI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxSGmXvj7Q252DHP4zgcWOjlKpjimKdll2YRk31tBnlPETtoLXC
	AxvKnMAaa/EIOJeoE6a/6e5uMAZn/qZuniyVhgIKOfbY/whwupTJnQEy592R+BbyerBnByAtqkQ
	O
X-Gm-Gg: ASbGnctOsaE0dFeMkaK2Jya8RXzx6DmpE/6rPDmfSLdRB2BvfXecn7+g9XRe+Cz6JIO
	FTUVYG+cdMah7eIIuOXXz3DuGjQECF3K2EHYI/EbpEVmS+YEBd5IULiGOOUS3+55QG4yFdkC3a7
	/jFCq3dlW9917QDnHcdoNvFaObifNQ0VIPnpL9k67NqjK9oybuPaWAVPS85caOs/yYG2rx28Dja
	sJ+KkNKthegf0WLr5vR9s5LLN7OqqOwVG45/2VQ13Cqc81ni3iBtEPOhRgMwAy336hcyw1lOnJ9
	1Ybhza849dkLfAKKntatgbgZqvy4jylqlje2/S51ZQGZVd1Dpd5Fgg36eR37TrWs1VXyNQIonI+
	DjzgBkjubKEr0G5xgyx6lKSit7XCO+eRpToJ7
X-Google-Smtp-Source: AGHT+IHO7t1VbUCTPu6DVA/SlLwYVzQqHMVMwNjRYWU53OeT2fIkETuEfRSvxBaltK+a88WEj8r0vg==
X-Received: by 2002:a05:622a:1aa0:b0:476:838c:b0ce with SMTP id d75a77b69052e-4945273c308mr238827611cf.13.1747066901870;
        Mon, 12 May 2025 09:21:41 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F.lan (pool-96-255-20-42.washdc.ftas.verizon.net. [96.255.20.42])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-49452583961sm52461791cf.58.2025.05.12.09.21.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 09:21:41 -0700 (PDT)
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
	corbet@lwn.net,
	Joshua Hahn <joshua.hahnjy@gmail.com>
Subject: [PATCH v3 00/17] CXL Boot to Bash Documentation
Date: Mon, 12 May 2025 12:21:17 -0400
Message-ID: <20250512162134.3596150-1-gourry@gourry.net>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

v3:
- Cross-links (Bagas)
- Grammar and spelling (Randy)
- added fixups to access-coordinates (Bagas)
- Drop TODO sections (use-case, memory-tiering, CDAT/UEFI, SRAT Genport)
  I unfortunately won't be able to come back around to this for
  a while, so I'd rather not let this rot.

---

This series converts CXL Boot to Bash Docs from LSFMM '25 to Linux
Kernel Docs.  In brief, this document covers (almost) everything Linux
expects from platforms to successfully bring volatile CXL memory
capacity online as a DAX device and/or SystemRAM.

It covers:

- Platform configuration data (ACPI Tables, EFI Memory Map, EFI Configs)
- Linux Build and Boot Parameters
- Linux consumption of Platform, Build, and Boot params
- Linux creation of base resources (NUMA nodes, memory tiers, etc)
- CXL Driver probe process and sysfs structure
- DAX Driver interactions between the CXL driver and memory hotplug
- Memory hotplug interactions
- Page allocator interactions (NUMA nodes, Memory Zones, Reclaim, etc).

Included are example platform configurations (ACPI tables) and cxl
decoder configurations to guide platform developers on expected
configurations (which may be more strict than the CXL spec).

Co-developed-by: Joshua Hahn <joshua.hahnjy@gmail.com>
Signed-off-by: Joshua Hahn <joshua.hahnjy@gmail.com>
Signed-off-by: Gregory Price <gourry@gourry.net>

Gregory Price (17):
  cxl: update documentation structure in prep for new docs
  cxl: docs - access-coordinates doc fixups
  cxl: docs/devices - add cxl device and protocol reference
  cxl: docs/platform/bios-and-efi documentation
  cxl: docs/platform/acpi reference documentation
  cxl: docs/platform/example-configs documentation
  cxl: docs/linux - overview
  cxl: docs/linux - early boot configuration
  cxl: docs/linux - add cxl-driver theory of operation
  cxl: docs/linux/cxl-driver - add example configurations
  cxl: docs/linux/dax-driver documentation
  cxl: docs/linux/memory-hotplug
  cxl: docs/allocation/dax
  cxl: docs/allocation/page-allocator
  cxl: docs/allocation/reclaim
  cxl: docs/allocation/hugepages
  cxl: docs - add self-referencing cross-links

 .../driver-api/cxl/allocation/dax.rst         |  60 ++
 .../driver-api/cxl/allocation/hugepages.rst   |  32 +
 .../cxl/allocation/page-allocator.rst         |  85 +++
 .../driver-api/cxl/allocation/reclaim.rst     |  51 ++
 .../driver-api/cxl/devices/device-types.rst   | 165 +++++
 Documentation/driver-api/cxl/index.rst        |  45 +-
 .../cxl/{ => linux}/access-coordinates.rst    |  35 +-
 .../driver-api/cxl/linux/cxl-driver.rst       | 630 ++++++++++++++++++
 .../driver-api/cxl/linux/dax-driver.rst       |  43 ++
 .../driver-api/cxl/linux/early-boot.rst       | 137 ++++
 .../example-configurations/hb-interleave.rst  | 314 +++++++++
 .../intra-hb-interleave.rst                   | 291 ++++++++
 .../multi-interleave.rst                      | 401 +++++++++++
 .../example-configurations/single-device.rst  | 246 +++++++
 .../driver-api/cxl/linux/memory-hotplug.rst   |  78 +++
 .../driver-api/cxl/linux/overview.rst         | 103 +++
 .../driver-api/cxl/platform/acpi.rst          |  76 +++
 .../driver-api/cxl/platform/acpi/cedt.rst     |  62 ++
 .../driver-api/cxl/platform/acpi/dsdt.rst     |  28 +
 .../driver-api/cxl/platform/acpi/hmat.rst     |  32 +
 .../driver-api/cxl/platform/acpi/slit.rst     |  21 +
 .../driver-api/cxl/platform/acpi/srat.rst     |  44 ++
 .../driver-api/cxl/platform/bios-and-efi.rst  | 262 ++++++++
 .../cxl/platform/example-configs.rst          |  13 +
 .../example-configurations/flexible.rst       | 296 ++++++++
 .../example-configurations/hb-interleave.rst  | 107 +++
 .../multi-dev-per-hb.rst                      |  90 +++
 .../example-configurations/one-dev-per-hb.rst | 136 ++++
 ...ry-devices.rst => theory-of-operation.rst} |  10 +-
 29 files changed, 3867 insertions(+), 26 deletions(-)
 create mode 100644 Documentation/driver-api/cxl/allocation/dax.rst
 create mode 100644 Documentation/driver-api/cxl/allocation/hugepages.rst
 create mode 100644 Documentation/driver-api/cxl/allocation/page-allocator.rst
 create mode 100644 Documentation/driver-api/cxl/allocation/reclaim.rst
 create mode 100644 Documentation/driver-api/cxl/devices/device-types.rst
 rename Documentation/driver-api/cxl/{ => linux}/access-coordinates.rst (84%)
 create mode 100644 Documentation/driver-api/cxl/linux/cxl-driver.rst
 create mode 100644 Documentation/driver-api/cxl/linux/dax-driver.rst
 create mode 100644 Documentation/driver-api/cxl/linux/early-boot.rst
 create mode 100644 Documentation/driver-api/cxl/linux/example-configurations/hb-interleave.rst
 create mode 100644 Documentation/driver-api/cxl/linux/example-configurations/intra-hb-interleave.rst
 create mode 100644 Documentation/driver-api/cxl/linux/example-configurations/multi-interleave.rst
 create mode 100644 Documentation/driver-api/cxl/linux/example-configurations/single-device.rst
 create mode 100644 Documentation/driver-api/cxl/linux/memory-hotplug.rst
 create mode 100644 Documentation/driver-api/cxl/linux/overview.rst
 create mode 100644 Documentation/driver-api/cxl/platform/acpi.rst
 create mode 100644 Documentation/driver-api/cxl/platform/acpi/cedt.rst
 create mode 100644 Documentation/driver-api/cxl/platform/acpi/dsdt.rst
 create mode 100644 Documentation/driver-api/cxl/platform/acpi/hmat.rst
 create mode 100644 Documentation/driver-api/cxl/platform/acpi/slit.rst
 create mode 100644 Documentation/driver-api/cxl/platform/acpi/srat.rst
 create mode 100644 Documentation/driver-api/cxl/platform/bios-and-efi.rst
 create mode 100644 Documentation/driver-api/cxl/platform/example-configs.rst
 create mode 100644 Documentation/driver-api/cxl/platform/example-configurations/flexible.rst
 create mode 100644 Documentation/driver-api/cxl/platform/example-configurations/hb-interleave.rst
 create mode 100644 Documentation/driver-api/cxl/platform/example-configurations/multi-dev-per-hb.rst
 create mode 100644 Documentation/driver-api/cxl/platform/example-configurations/one-dev-per-hb.rst
 rename Documentation/driver-api/cxl/{memory-devices.rst => theory-of-operation.rst} (98%)

-- 
2.49.0

