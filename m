Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A57A127E7D7
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 18:11:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746036682; cv=none; b=BcvFPBnuZt8cY1iXllKd8xs5ABK/Kxkh59otiu5bhEo/xqbdLTDTT6Oqlcdo7FiGiUKPB5rH7/uqmAh5jk0FNBaLOKcfpCTF1KblNVZqU8MvJxzUOP5V/jllqzZQ1Rq2yKhS1+xVscXIbmGDyaOt1LgLW88zlSzGhPD2ORvzfa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746036682; c=relaxed/simple;
	bh=5+WGsMDzQfixwYnglIBJyZyeOTlzUu6NS9E3xL/s1ds=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=i5oJ7G4buP/b4ZL5+1mffcNpGVTboB7BPU54MMzD7Igg5mcRUFyGmG91c+GkOoj3Iv60O0ipH6zGh2N6PIBJCs7QrSdUOAf7AsL7TI1fnCXpY7k7BChajVNX+ckm7ydRUQLVCTXHVEpS/lbW5cWkitnJdJD5Rw70KmxgwmTnukc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=bfIqiZrx; arc=none smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="bfIqiZrx"
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-7c5e1b40f68so10845785a.1
        for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 11:11:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1746036677; x=1746641477; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qZSGq1S9E4b7j+VlhOUItxRA7BaImspXLYaizp94BIQ=;
        b=bfIqiZrxk4mGCeXJe4VldTZnncSdeIhQCOhPkFZquqs8Wuk5dvdQ8XGsPelqdjjczq
         NSbIgNAV1IEgkyi8RYT1OInh4cRB7zIm+3uNAq5hu8d6QTo3BpY3ilMLxHgmf7zkpaO7
         nEcpxQZsPD8pxmMiRkKsTZzOqY9d2dYisQuuTS4VggF9s9nN90+4qedo293dM4TBfkc+
         ozlUr0y9Ag1UZplD56VpYrRWH7SRppNkEEiEXFY6b5XqDOuGhpIqZV2uDHzFzBy4nX50
         Dpa9DgI/ewizSrIGjS0ZslFS2o1vRLmSkCjypJPORGzfyQCOI6Su/SZSM3XQUXWoyZUo
         gMmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746036677; x=1746641477;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qZSGq1S9E4b7j+VlhOUItxRA7BaImspXLYaizp94BIQ=;
        b=XUuw+jUj+AYMlxvPUvIBzNvXnjfp3RpehFr0mojRu2AS2YD1hzRHhph8CKRyfVmyu3
         4OMHY5OweDHH7Fl8o5bAvp9CcoanT4ExXCVxTuMELBTcCdXyKhDgx4BoyKFVlec8VaWC
         DkfD7LEGLIiAWEVbuUs/QhtjUGodzp041duMLzhUtYFaNijQ1G/THezolTPKQ3b5x5Ms
         C1VObztjut/4PZEiUDiwWGEtvICNUSTEoflgNT7qugHkq71i/G3+8J6SW/g4yCZB2ZiZ
         Ls1rT+OI5hkYyPNk8+wKvLJnb6shEa6maWFQpYTlhHMWCGs0XX9G8oHtnjMWGE8pIVG2
         gTMw==
X-Forwarded-Encrypted: i=1; AJvYcCUrlP8ml68SOQsYIeeXnBdxB9WdjONe/mn1FmBUzElRnpPyCBT7WsqOBNDff4zFS3/T+XMbxTgsjuZGqrA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1KD3Fug0rFePCuxREa5M9P4h508ZfhAS9z54vOTCtP4Km15sD
	gmvuZdADIY7CvKaSh5qW92tQr80rQC50JZbzQbz9vRXrNWI9+NhFakWMsv5XHVE=
X-Gm-Gg: ASbGncvL8OyvgwLvyeOiiEyl/KTkGP1X+kTDOV+XXT/4/0gs5nwHfhrqo6rsWL3vqX9
	qJOZAJIISsX8cVj0FhVBH9fgpLPGo8Yck8q+IRdH42sFk4vdCuF0qLUJKTc476pGNN+dW6KqsMu
	LjMnaOgmUOf05Bkfz1GChjX+czakxAgc5RA932baujpRWf5UKSbgNCmunwhWAurZcpPdwAU/dKZ
	amDwfq8u8VkLAhEOcdKahurUtf8yQs+Jwx11xPUsXibQQBEkPdnPe5CrUaTPGTStHfZJV72G8ei
	W9SAAi6oKszJOJiybzXMQspfvBYOwvaS9gjf1nAQCemy53O+zG6vf0WEvhspva8064CtwWnAZYw
	NLNsCnu+DFzNpUkgDb/5GXhD03e9N
X-Google-Smtp-Source: AGHT+IEHANnvDvH2u9pl8BjqFctHnHP3/Lhe18uJad/mRqqVJmp00Q7PEDHT6jtq9qycvYfH0LpUmQ==
X-Received: by 2002:a05:622a:420e:b0:476:9dc9:3c2a with SMTP id d75a77b69052e-489c57f8405mr54102241cf.48.1746036677513;
        Wed, 30 Apr 2025 11:11:17 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F.lan (pool-173-79-56-208.washdc.fios.verizon.net. [173.79.56.208])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-48a64fe04efsm5897421cf.19.2025.04.30.11.11.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 11:11:17 -0700 (PDT)
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
Subject: [RFC PATCH v2 11/18] cxl: docs/linux/memory-hotplug
Date: Wed, 30 Apr 2025 14:10:41 -0400
Message-ID: <20250430181048.1197475-12-gourry@gourry.net>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250430181048.1197475-1-gourry@gourry.net>
References: <20250430181048.1197475-1-gourry@gourry.net>
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
index 965f133a1c92..f68a3eb2bb5e 100644
--- a/Documentation/driver-api/cxl/index.rst
+++ b/Documentation/driver-api/cxl/index.rst
@@ -38,6 +38,7 @@ that have impacts on each other.  The docs here break up configurations steps.
    linux/early-boot
    linux/cxl-driver
    linux/dax-driver
+   linux/memory-hotplug
    linux/access-coordinates
 
 
diff --git a/Documentation/driver-api/cxl/linux/memory-hotplug.rst b/Documentation/driver-api/cxl/linux/memory-hotplug.rst
new file mode 100644
index 000000000000..a757e0e4487e
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
+There are four major configurations to consider
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
+- :code:`memhp_default_state` Boot parameters
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
+memory capacity are dicated by the following system settings:
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
+is not a configurable setting, but it's important to not that driver managed
+memory is explicitly excluded from use during kexec.  This is required to ensure
+any reset or out-of-band operations that the CXL device may be subject to during
+a functional system-reboot (such as a reset-on-probe) will not cause portions of
+the kexec kernel to be overwritten.
-- 
2.49.0

