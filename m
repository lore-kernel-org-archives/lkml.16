Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CAA7257433
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 16:22:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747066928; cv=none; b=EYn8N6vS63OyopWk/YozWATLlFQU81iPfwtHqcu1pwr1Rp9S4AhZgNE4sQPBIhYmrggZ2y0nkWF8Q323Oye2XJ3NHaPoAl7EIAxZUjNrMQJfiyrfWMi5uWNLclpcbj6hqzp7byEipZBgLGuHATlY4fbQXUxQP/dxzgpdCOHo840=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747066928; c=relaxed/simple;
	bh=alRL+BnN7pA7RLLcp2eJAsPEVuznl19NxFJaEka+9wo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IAF+ZVDuY2ZsRBL1Jjfi724GGa4pqXapK1G3JQd3f7LPc3DxcBPQaQJgInxBaX3kuYpMITG48J/ZdwR0d8TGic6RAG17b3jK3kqFGAroXoEX1Ml4dz5M2BGyrANLt+1oEuWBtL+R+CXhxBjnnW+MXkf9GFEondx6bGvCxCahnbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=ByeXreV3; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="ByeXreV3"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-4774d68c670so78564271cf.0
        for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 09:22:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1747066924; x=1747671724; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8mmNdRpdNT2e5CioCKqjI7jQZuOdPNFPwu/aBvzKK6c=;
        b=ByeXreV3D7rxuAuI62OkxgSg/zHGh1SWk/Ir8lSJG+Y7G9h6NvZNeKGf3UAQSLg+E3
         DjUxOPsbH+hhFqly6ZLnfiDXxdB6EjnbpakrYSTJrjStmR9RandwYPh6pZsfX7qg8Esi
         Ccg5cYlr6pmTu0J3w9B51h3Niv4QfbXhogsL52xM6sBwdNJ7e3e7MjQiLsTlH1wzleUc
         /dIV2n3HQfIrDr1AooXQrP8S1/JDaLrExWpN5b3fwOuAX8aefDNIUuaAdpbHKdoELc2f
         WTajCCuzAflMCFfv6YRMLF68EnGGiz006DzHS0D2IgOBj8qCh+9IJkkahOUrhFGipbti
         9MHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747066924; x=1747671724;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8mmNdRpdNT2e5CioCKqjI7jQZuOdPNFPwu/aBvzKK6c=;
        b=su3IsKXnJbMh2NPJ1zSz4XudM2JhDggPPXc5vRwPQ2lzTGrUM19NiHWJgJ5BPoBsgG
         W5uucIlfooVBn5dUGOyvNB25be3vN/4GK/dEuntGnxPowwZwE2YEZ/Q203p260ovhMNR
         D5GJLPxy5CX5MB8G7HPx1QJ0zLHkTCWi+MstKrZYISbcfSoxPQonPKXdkNPmBdWptpwR
         j/nbZyQS/Y2s0oktKBzHjoQhFPhg+Ln6xBvlyOoJqsXXiaBFX8WyXaWX+0++TCubj3UU
         Q+O01YvK7SSYBOGat9ZRV8xzm3BX/nszkfOlXSH4BHt0SaolnFSYW5MHYyG6lYIrgux8
         hIvQ==
X-Forwarded-Encrypted: i=1; AJvYcCVux9rR23LULD/2AzZ7hgsVNSjjfXEqZQnHnAkUdHwIjAjsfaWtWQmU/fbOkFvLHPlJaAqBKl9C1YifBFE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxDWOsp+cBMtU97q+UmDx8y240rQX5Vcbqb+/2ZwOLVlSUNeQZj
	tlDsim8/B3lrvLL+2ih/wHVKFsNv9JqCCsXUSK8Im/7z3NeD+PlS1mcVbt2ztp4=
X-Gm-Gg: ASbGncss5sqmxaC0SHPHcNhA6a+kRi2NLjziFq7LHEjsOQQl3ZqTpZeLZFbN6s8Plck
	Beyv0wWuFdXxhIVgPxDj4dzhF6uThUyySd0cEEe+Ab4AW4tZ+a+BGIVIcS4iCcM0sn+q1IS099R
	CNAO5gnAtHVqhV/pcu13gipaJSg+DKXDxePvv2Gy3RsZJR2mumscDXOHFQvkJpHXFx4lenN1YlJ
	IBNJVB4kBBTJP+rp0KzQLa+433h2PQHtuiBkbuClLyzjDdDzWndxMhWT8++rnlL20gxI1AAWdfr
	0QKn2Ywy3im5BTKVUVYFLmo7WRD/1aNhqs2AmhZepmF4b8OvH6jFJRhCyy4vKwAJTmpYVgZIwXg
	Q/uGUD9ZViPmf9C21jWCV/RZkW/kOGxVIuDz5
X-Google-Smtp-Source: AGHT+IGWTZBftJjnQ8DcvuqUwpD3a6TCMt8kbFUpNWIl3gGiOiMusJaygR3wQdoazycEU1zccxqVUA==
X-Received: by 2002:ac8:57d3:0:b0:476:87f6:3ce4 with SMTP id d75a77b69052e-494527b8112mr197827301cf.39.1747066923532;
        Mon, 12 May 2025 09:22:03 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F.lan (pool-96-255-20-42.washdc.ftas.verizon.net. [96.255.20.42])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-49452583961sm52461791cf.58.2025.05.12.09.22.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 09:22:03 -0700 (PDT)
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
Subject: [PATCH v3 14/17] cxl: docs/allocation/page-allocator
Date: Mon, 12 May 2025 12:21:31 -0400
Message-ID: <20250512162134.3596150-15-gourry@gourry.net>
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

Document some interesting interactions that occur when exposing CXL
memory capacity to page allocator.

Signed-off-by: Gregory Price <gourry@gourry.net>
---
 .../cxl/allocation/page-allocator.rst         | 85 +++++++++++++++++++
 Documentation/driver-api/cxl/index.rst        |  1 +
 2 files changed, 86 insertions(+)
 create mode 100644 Documentation/driver-api/cxl/allocation/page-allocator.rst

diff --git a/Documentation/driver-api/cxl/allocation/page-allocator.rst b/Documentation/driver-api/cxl/allocation/page-allocator.rst
new file mode 100644
index 000000000000..7b8fe1b8d5bb
--- /dev/null
+++ b/Documentation/driver-api/cxl/allocation/page-allocator.rst
@@ -0,0 +1,85 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+==================
+The Page Allocator
+==================
+
+The kernel page allocator services all general page allocation requests, such
+as :code:`kmalloc`.  CXL configuration steps affect the behavior of the page
+allocator based on the selected `Memory Zone` and `NUMA node` the capacity is
+placed in.
+
+This section mostly focuses on how these configurations affect the page
+allocator (as of Linux v6.15) rather than the overall page allocator behavior.
+
+NUMA nodes and mempolicy
+========================
+Unless a task explicitly registers a mempolicy, the default memory policy
+of the linux kernel is to allocate memory from the `local NUMA node` first,
+and fall back to other nodes only if the local node is pressured.
+
+Generally, we expect to see local DRAM and CXL memory on separate NUMA nodes,
+with the CXL memory being non-local.  Technically, however, it is possible
+for a compute node to have no local DRAM, and for CXL memory to be the
+`local` capacity for that compute node.
+
+
+Memory Zones
+============
+CXL capacity may be onlined in :code:`ZONE_NORMAL` or :code:`ZONE_MOVABLE`.
+
+As of v6.15, the page allocator attempts to allocate from the highest
+available and compatible ZONE for an allocation from the local node first.
+
+An example of a `zone incompatibility` is attempting to service an allocation
+marked :code:`GFP_KERNEL` from :code:`ZONE_MOVABLE`.  Kernel allocations are
+typically not migratable, and as a result can only be serviced from
+:code:`ZONE_NORMAL` or lower.
+
+To simplify this, the page allocator will prefer :code:`ZONE_MOVABLE` over
+:code:`ZONE_NORMAL` by default, but if :code:`ZONE_MOVABLE` is depleted, it
+will fallback to allocate from :code:`ZONE_NORMAL`.
+
+
+Zone and Node Quirks
+====================
+Let's consider a configuration where the local DRAM capacity is largely onlined
+into :code:`ZONE_NORMAL`, with no :code:`ZONE_MOVABLE` capacity present. The
+CXL capacity has the opposite configuration - all onlined in
+:code:`ZONE_MOVABLE`.
+
+Under the default allocation policy, the page allocator will completely skip
+:code:`ZONE_MOVABLE` as a valid allocation target.  This is because, as of
+Linux v6.15, the page allocator does (approximately) the following: ::
+
+  for (each zone in local_node):
+
+    for (each node in fallback_order):
+
+      attempt_allocation(gfp_flags);
+
+Because the local node does not have :code:`ZONE_MOVABLE`, the CXL node is
+functionally unreachable for direct allocation.  As a result, the only way
+for CXL capacity to be used is via `demotion` in the reclaim path.
+
+This configuration also means that if the DRAM ndoe has :code:`ZONE_MOVABLE`
+capacity - when that capacity is depleted, the page allocator will actually
+prefer CXL :code:`ZONE_MOVABLE` pages over DRAM :code:`ZONE_NORMAL` pages.
+
+We may wish to invert this priority in future Linux versions.
+
+If `demotion` and `swap` are disabled, Linux will begin to cause OOM crashes
+when the DRAM nodes are depleted. See the reclaim section for more details.
+
+
+CGroups and CPUSets
+===================
+Finally, assuming CXL memory is reachable via the page allocation (i.e. onlined
+in :code:`ZONE_NORMAL`), the :code:`cpusets.mems_allowed` may be used by
+containers to limit the accessibility of certain NUMA nodes for tasks in that
+container.  Users may wish to utilize this in multi-tenant systems where some
+tasks prefer not to use slower memory.
+
+In the reclaim section we'll discuss some limitations of this interface to
+prevent demotions of shared data to CXL memory (if demotions are enabled).
+
diff --git a/Documentation/driver-api/cxl/index.rst b/Documentation/driver-api/cxl/index.rst
index 6e7497f4811a..7acab7e7df96 100644
--- a/Documentation/driver-api/cxl/index.rst
+++ b/Documentation/driver-api/cxl/index.rst
@@ -45,5 +45,6 @@ that have impacts on each other.  The docs here break up configurations steps.
    :caption: Memory Allocation
 
    allocation/dax
+   allocation/page-allocator
 
 .. only::  subproject and html
-- 
2.49.0

