Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03A972882C1
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 18:11:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746036689; cv=none; b=DTzCDtHeRlzX+rbs3vbMG8h+zCszmhLccjRteYAjy9vqav0fDJFmJhYeNoWOzVTeSE6+8TOPwM96ZTFCalQ7MUAtBbCAzQUbds6DdEEaevyXXhXlntuu7B9TFi/14UVTf28SAHE7MPUmhAY3o+zEninrAKUAvHDTCgKnH289UVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746036689; c=relaxed/simple;
	bh=X5+Ukdg7rvV7208banBi4yu0UKjpHItJx+R1YJoxna4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ds0sOaEbhgFqzm+npAooLtrLC2ZYerEYCqxR6NIX+37HiMb0u4sYMxtfolMiz7IXEkLkGQP/V9OEaNYkW/CBLn55Qfm/NEcsCBpr3+7iyTm4nNtc9e/CC/F9loR0p9PEBTPVOLVqPBcX+aMbUOHPiOb3t4/KUZSenqbnjpj+8Os=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=jYWcxVEs; arc=none smtp.client-ip=209.85.219.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="jYWcxVEs"
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-6e900a7ce55so2816136d6.3
        for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 11:11:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1746036687; x=1746641487; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kEWVWC2naWxysqXPj2rk0b5ktFtoGcxHBqlN3kboVV0=;
        b=jYWcxVEsbDJBnoS5QJ51o+vShg3KBRbOkrQYPMwN3yu+TPIk43b650NfEecd16qZ0c
         knq6XPHLYzGzGDFy3/bDI76jJDPgJtatt2aQ4GMKb8I0yPYQCLGJQVxOimmjO8Wt9lx0
         IPbRwtYDTnI7RD0SpXEEU0QxOdl1zyI41ywrUsZryxS7DXeGBqUWJp+8/wpHEOAEv01S
         hYtHErphWa6cn8urLprX2ZKFkPXrZs0wyRvcxXgQWWVX4Spfo/Ojs8cVQNNfv3V/Fj0A
         MF0TbsPWLNiOk4GwLCkjnXVnIgSsni43LrrxIughxbj/MEqhJvFnqHQ5rl1XBTbua7Ad
         72Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746036687; x=1746641487;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kEWVWC2naWxysqXPj2rk0b5ktFtoGcxHBqlN3kboVV0=;
        b=sBjvAOSK3+xwL5+kyaGh5YU4Q6e2RA/8CmunAKTN2vZ3fbbK8D6mxfUlQHPfu+iDoj
         Mu3UdS4V5j5p/C3D4aZfi3uirNTLGeoEeNhkc3qPTAtzAGJQfgDPiRk7vzUdO4X+uTyG
         2k7nHu8Iu4urR6JxUpwezfiN6CeeWW+iUlOR9E1cpQYwjUR7x8yZwijcMK4UkJubfLJ+
         tDUmqN6ffRkdGNp6ZIaOeGNPnqf3E7WMVr2wbG+6qqU4KD8XeCLqlEf9pSnYpNl8TTLm
         q6JCCUXBTy7CwuPDlYDCVfN8o90EyY9+myp6QnzImnYhAJDgsc4DRiIvgnxmuiiAOydA
         QcXA==
X-Forwarded-Encrypted: i=1; AJvYcCUpYs449MEwBazUvsELs7crgZHZ8J3qqBoq+9KeQb1pYT98b9xMufkouVUJXRjFzQF49LfeSPk8r1QFzQA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxKui46P9xZmH/yqrMEzkJsXqCX7BAnfKuM0JjaiZHL+oiAgtcV
	dfUErYfSQ8gJdfyUmfflhSHBhqcOog0umS5QP+NPICzjxAk6CFs+Eg5ao68Udgo=
X-Gm-Gg: ASbGncv8ocukz2f2UpSfgevbdCwYLUBz3ljR5ai/chNh5VFJis3+0RfYS49ndvULtLM
	sxoqqUDYK3Z4B/dcnGcZF1iioPyjYCBgrPLbEv1w/hViy7YAgiAklUGodlXLeMQwpJgRsd0uwbk
	8d59T99p/vzXBoOMuCc2DWyYnHXcYol4IZ4HpehCQaDxzSnBPOb+sKBOW0sxwlOnVdzJu4kwNSq
	rW+TtA5N4JU/wB/fwnkOmArCnSADYP1YANOkSSJv+A6hcMVDlXO466Mm4U0CYzcStVcGY1f3MKz
	Z49nPfnz6+OzqnzesJslIbJennVSjtHgexHV4Ooor576j4rpQpiHF9dYTbJ67TZc46qNagWY4ns
	KoTfQLqdrM7k4z0gMGwEdICJMESF6
X-Google-Smtp-Source: AGHT+IG3vL7CDX13v14KAJlzknmgSXzqC6Sf41KMMOAFk0Ub1O74GkEtzw6Jz1Yr0ZgIjWvJ/mA6mA==
X-Received: by 2002:a05:6214:d88:b0:6e8:fa72:be4c with SMTP id 6a1803df08f44-6f5090dad94mr4412706d6.1.1746036686871;
        Wed, 30 Apr 2025 11:11:26 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F.lan (pool-173-79-56-208.washdc.fios.verizon.net. [173.79.56.208])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-48a64fe04efsm5897421cf.19.2025.04.30.11.11.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 11:11:26 -0700 (PDT)
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
Subject: [RFC PATCH v2 15/18] cxl: docs/allocation/hugepages
Date: Wed, 30 Apr 2025 14:10:45 -0400
Message-ID: <20250430181048.1197475-16-gourry@gourry.net>
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

Add docs on how CXL capacity interacts with CMA and HugeTLB allocation
interfaces.

Signed-off-by: Gregory Price <gourry@gourry.net>
---
 .../driver-api/cxl/allocation/hugepages.rst   | 34 +++++++++++++++++++
 Documentation/driver-api/cxl/index.rst        |  1 +
 2 files changed, 35 insertions(+)
 create mode 100644 Documentation/driver-api/cxl/allocation/hugepages.rst

diff --git a/Documentation/driver-api/cxl/allocation/hugepages.rst b/Documentation/driver-api/cxl/allocation/hugepages.rst
new file mode 100644
index 000000000000..279970d73a28
--- /dev/null
+++ b/Documentation/driver-api/cxl/allocation/hugepages.rst
@@ -0,0 +1,34 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+==========
+Huge Pages
+==========
+
+Contiguous Memory Allocator
+===========================
+CXL Memory onlined as SystemRAM during early boot is eligible for use by CMA,
+as the NUMA node hosting that capacity will be `Online` at the time CMA
+carves out contiguous capacity.
+
+CXL Memory deferred to the CXL Driver for configuration cannot have its
+capacity allocated by CMA - as the NUMA node hosting the capacity is `Offline`
+at :code:`__init` time - which CMA carves out contiguous capacity.
+
+HugeTLB
+=======
+HugeTLB capacity is reserved from the page allocator. Only CXL memory onlined
+as SystemRAM during :code:`__init` and via memory-hotplug can be used via
+HugeTLB.
+
+2MB Huge Pages
+--------------
+All CXL capacity regardless of configuration time or memory zone is eligible
+for use as 2MB huge pages.
+
+1GB Huge Pages
+--------------
+CXL capacity onlined in :code:`ZONE_NORMAL` is eligible for 1GB Gigantic Page
+allocation.
+
+CXL capacity onlined in :code:`ZONE_MOVABLE` is not eligible for 1GB Gigantic
+Page allocation.
diff --git a/Documentation/driver-api/cxl/index.rst b/Documentation/driver-api/cxl/index.rst
index a768144698e9..e58d057a16e3 100644
--- a/Documentation/driver-api/cxl/index.rst
+++ b/Documentation/driver-api/cxl/index.rst
@@ -48,5 +48,6 @@ that have impacts on each other.  The docs here break up configurations steps.
    allocation/dax
    allocation/page-allocator
    allocation/reclaim
+   allocation/hugepages.rst
 
 .. only::  subproject and html
-- 
2.49.0

