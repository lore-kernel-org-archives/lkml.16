Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68AF01E7660
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 00:13:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745971989; cv=none; b=YxCZ7w12psos2e+5HG6vcFuiHL6zVbn08XKhhUQCINLxMvykYg9ZuMbpIaXnC+86pB+rc3oGZG4vqVBtGCC41Z9g3W/3fOxXAOE2LrJmGktvj1i6wnrnLBFFsUKSTICKeoJzWNTy+H2XnBfd/btubEtKFQFF+s4hCsxuYmnuK7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745971989; c=relaxed/simple;
	bh=BzfFAM5BhwnMp75QAL22bKF9ElQQxGopTB6tLuSsWJI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lgVROkcor3GTDHKwM/8yMjmKAkD56npFP+IjHm4gBICf1FD9GHRrEvm/kKId8omUMspHrdjdqnnvrJqxSm27ThZXFsrnlnIrHeXy0OBtUkVjHk0y+gc601QuOZSnTFdwY6FiUEon5xC4liV3fgXKVkrX/W8SRR4bGy2OKC5Cib8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=EQAEqXJe; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="EQAEqXJe"
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-4767e969b94so149603971cf.2
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 17:13:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1745971986; x=1746576786; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U3Yyi9y+v5P6bmpZgdp45DsIU9acCM/HjEvTDZbsG00=;
        b=EQAEqXJe6sjJzQYrxPBEe5xRaSbx+ib/+GvuPxwq9/h8jM4I/R8CJANbkbgTnXMO99
         9khpcaeCCb6B8eqL+/FHyYCdnX6N0wvKeXz2KXZQpQnLuyiVfIjPl7tEWtHemHq8uEID
         7wKYwjCmV8WSr7YRNcAcCZXbVhHu9Qi0mhg8YOyUayGEvTtKOJJA5C3wniEH+aIQg4q7
         mVtPixyORl006jKHhnAbv+1QojHQ7Swjdgoa+ql0IAr9UPdVPykxjDafZ8AJGaAhzC+u
         zKNCcW8P/cinfLvZuOrO6L24T6JV/sEZ/QgVYJHMm0kLWNzS+Z0+MslQumaV37KC1S/G
         i0Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745971986; x=1746576786;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U3Yyi9y+v5P6bmpZgdp45DsIU9acCM/HjEvTDZbsG00=;
        b=fIy3X/gyQ75sK2cTeoTt0z30o8JoTD0+U7KBe0nD8BVpFm0obvkG+D85UqDqM2y1zJ
         zOoBbrSFtN5mnNJJ4DlXtanZrSwYuB5TvXLI70HSnn4+aNhtdyN15jPG1+nyFZ6iP4Aq
         A+XTvhtToDdlv7vOTrd23JMkGOovEj5nUVxy31BCNi5H+g4h0twZk9ZsRTRCCs4a6df5
         4apOuXCfnE6ieIIxxmTeR682EnB91IHPMk10ZyVhuZOTuMkVm8W6DmNh7ZD2TnPXARl4
         +cYzgF3CaVL1I3hsUdoq/p4o+p32sjK645zwpg0XcFceai1DWXDsFnVQzfBoR9qA9TXE
         VrSA==
X-Forwarded-Encrypted: i=1; AJvYcCUVT8cekkwnNfE2TBu+rmbkLEwKNU9aBzGxv0S2K0qn+VeLULr+ei5ajMqWZS8JWwYpGScm65mkKWxY7n8=@vger.kernel.org
X-Gm-Message-State: AOJu0YziN6VCDX6BmBhmlymZtLxYaO45NKpRkRYpiNmLay3/r/x+KSN2
	FwNzDbaZGL6fJWOarda+53h5Bsmk7KfFP1ls0eVXXrDQnsynGOgolil9T8eNli0=
X-Gm-Gg: ASbGnctH2iZyEC81VpZJwPxAg0i30mhXH9wZFeW1rVEdRdfakeEzOwxIHZcf1zGWYJ5
	3+Xa3O1bDRDT0n2q9MIVSmZhLlliH0fFOw57HDuP7HOdZkj0AgnP80N5J8w2+NAUjOqVQLrQgJ2
	q7n75mJqHHKHic58AQCdZzixo+XPMgeCF4SECz9QUGlO9vOyYpPJjdUe5k3FAPSLRj4o1Rjum0D
	lwa56zwhrG+X85QgutCbSL6dglEXu4KuR7K92bJdTGRXFy79W2WknoUzARE6YPgs4XRHnst71Gj
	m8kvGlbRqL0DLgiebdQSXJA9s8rN3Zfr1HsQwIaHoGJZEIqHue9CienmjQTWZPemzoPQQ3t/IjD
	dJ/K/yYofoY7APA0sVBHL3S+OohWg9eV5z7+TtHs=
X-Google-Smtp-Source: AGHT+IHDh8J8wln5z2S1SJ1zWQwlLw93RU9T3YfEZpUHWnDL1YaDIdRHES8teoNW5qqZZtojkjVFlQ==
X-Received: by 2002:a05:622a:17cc:b0:476:bb72:f429 with SMTP id d75a77b69052e-489e63d8bbamr9206451cf.42.1745971986365;
        Tue, 29 Apr 2025 17:13:06 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F.lan (pool-173-79-56-208.washdc.fios.verizon.net. [173.79.56.208])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-47e9f7a820esm87634411cf.41.2025.04.29.17.13.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 17:13:06 -0700 (PDT)
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
Subject: [RFC PATCH 17/17] cxl: docs/use-cases
Date: Tue, 29 Apr 2025 20:12:24 -0400
Message-ID: <20250430001224.1028656-18-gourry@gourry.net>
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

Add carve-outs for use-case documentation.  Complete open as to
what (if anything) we should explain here, and/or what the structure
should be.

Signed-off-by: Gregory Price <gourry@gourry.net>
---
 Documentation/driver-api/cxl/index.rst        | 10 ++++++++++
 .../cxl/use-case/dynamic-capacity.rst         | 19 +++++++++++++++++++
 .../cxl/use-case/memory-expansion.rst         | 14 ++++++++++++++
 .../driver-api/cxl/use-case/shared-memory.rst | 14 ++++++++++++++
 .../cxl/use-case/virtual-machines.rst         | 18 ++++++++++++++++++
 5 files changed, 75 insertions(+)
 create mode 100644 Documentation/driver-api/cxl/use-case/dynamic-capacity.rst
 create mode 100644 Documentation/driver-api/cxl/use-case/memory-expansion.rst
 create mode 100644 Documentation/driver-api/cxl/use-case/shared-memory.rst
 create mode 100644 Documentation/driver-api/cxl/use-case/virtual-machines.rst

diff --git a/Documentation/driver-api/cxl/index.rst b/Documentation/driver-api/cxl/index.rst
index 51dd0392883b..e0a86f68b6f8 100644
--- a/Documentation/driver-api/cxl/index.rst
+++ b/Documentation/driver-api/cxl/index.rst
@@ -50,5 +50,15 @@ that have impacts on each other.  The docs here break up configurations steps.
    allocation/page-allocator
    allocation/reclaim
    allocation/hugepages.rst
+   allocation/tiering.rst
+
+.. toctree::
+   :maxdepth: 1
+   :caption: Use Cases
+
+   use-case/memory-expansion.rst
+   use-case/dynamic-capacity.rst
+   use-case/virtual-machines.rst
+   use-case/shared-memory.rst
 
 .. only::  subproject and html
diff --git a/Documentation/driver-api/cxl/use-case/dynamic-capacity.rst b/Documentation/driver-api/cxl/use-case/dynamic-capacity.rst
new file mode 100644
index 000000000000..93a24aa1edc5
--- /dev/null
+++ b/Documentation/driver-api/cxl/use-case/dynamic-capacity.rst
@@ -0,0 +1,19 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+Dynamic Capacity
+################
+todo
+
+For Virtual Machines
+********************
+todo
+
+For Workload Orchestration
+**************************
+todo
+
+For Shared Memory
+*****************
+todo
+
+
diff --git a/Documentation/driver-api/cxl/use-case/memory-expansion.rst b/Documentation/driver-api/cxl/use-case/memory-expansion.rst
new file mode 100644
index 000000000000..d1d25e0e4498
--- /dev/null
+++ b/Documentation/driver-api/cxl/use-case/memory-expansion.rst
@@ -0,0 +1,14 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+Memory Expansion
+################
+
+todo
+
+As Page Cache
+*************
+todo
+
+As DAX Device
+*************
+todo
diff --git a/Documentation/driver-api/cxl/use-case/shared-memory.rst b/Documentation/driver-api/cxl/use-case/shared-memory.rst
new file mode 100644
index 000000000000..dfdc2c419ea2
--- /dev/null
+++ b/Documentation/driver-api/cxl/use-case/shared-memory.rst
@@ -0,0 +1,14 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+Shared Memory
+#############
+todo
+
+Coherence
+*********
+todo
+
+Fabric Attached Memory FileSystem (FAMFS)
+*****************************************
+
+todo
diff --git a/Documentation/driver-api/cxl/use-case/virtual-machines.rst b/Documentation/driver-api/cxl/use-case/virtual-machines.rst
new file mode 100644
index 000000000000..0411d37092ce
--- /dev/null
+++ b/Documentation/driver-api/cxl/use-case/virtual-machines.rst
@@ -0,0 +1,18 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+Virtual Machines
+################
+
+todo
+
+NUMA Passthrough
+****************
+todo
+
+Flexible Shapes
+***************
+todo
+
+Datacenter Efficiency
+*********************
+todo
-- 
2.49.0

