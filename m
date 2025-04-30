Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B024283FC1
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 18:11:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746036689; cv=none; b=mdAEsJhaOMLAo4ACQ8vHoNUVM2JoGfJ7vd9gxZPINJDCkshOBemnoHTHLPYu8vyRtCDZLQSmogvKsmLPoQCS0RvI02ia472CrFDKyGyeNZUP4KEBA9nzjNlWHrU1mrw3veo794a4nMQTFzro51lpF1PYf8zCglZszafnqmNOMjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746036689; c=relaxed/simple;
	bh=fSoRlnSmuQfl7ZxHPvsaxZElUPVqtO8ei3VkyP+sGlc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DKm3tiSIttZ1I9p7b4oxgsp/KQHBEhZKwBmdjP5MPKeQoq56hS/W23mUcrePYWX5YCuK7qMsEODE9wGGf7cv4rn9Nxg0Rc1IWNDUQaozM8ok+8yjuGW5uJNf1aECBoCwMec7kFRm5JWgqqP9lXfO+WYzEvz292jF8vJUOuE50Rs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=fZzCLFlR; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="fZzCLFlR"
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-47692b9d059so2516621cf.3
        for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 11:11:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1746036685; x=1746641485; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tbt8tCPdtGfAIVOyjjS42F8T26gzOQDX+9RCN/0lBgM=;
        b=fZzCLFlRj67Mt2er8z5Aw5Q5JVrmDB6JZFA5ZARFksGaSjqrWzcbdj+0fcCv/911dj
         3FmVCqmjQlO89nzAdJ42VgFaUquyGe7bYwKpK+r0mq2hSjU6ximELepfgKqSUazxZpGW
         nAA9rRG54GkpIjMlXfv6OHU0PEPcoiUWD5V4CIIP/o0Bnka8L1jK2ryHUHDh+qgE7GAd
         0Ey7W68nTyJ6BC3CZX6wP2pVvM5Xrfh0lX7HxI8apFpolJ0c8S56J/qGBNQTSeObiOID
         xXVvI285iWYu75z9hc7sUCxMIP30aZvrYupW3GoHfa/o0d1aDuBy3D9nYkLWjakvQac7
         CxMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746036685; x=1746641485;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Tbt8tCPdtGfAIVOyjjS42F8T26gzOQDX+9RCN/0lBgM=;
        b=C9IzWK55irhaMoHaiuhPEt6nbgwMq39d0+gAMFiQzN3aSOHK52lmdE98h8wJcivC6C
         HOMZkRgJzKY+Gjp5eFTyPUwP+7gAys/TidNXWZzKzfDNNO39BcaTx60PWRTa0yDnF6L1
         d+JBbdehSgpmXPzuIaIdKqi0+ZK/MKqYs4VVnIa7U3YYuNqf52AZcxvcqEpJSwX+u2QP
         2j917GdeITqV2bew7s/lRn27cqGyXl4XSmhICfY7oSlw+zZfDuD5LqwdpH+6UDi/kIaB
         zzzFVvxf0X/g0mK5qylXUSNJ3Y8ZdA/CfoAaHBecZl2neh01RBDrzZZeCP4c5hZlTsRQ
         7Nrw==
X-Forwarded-Encrypted: i=1; AJvYcCVMmJnuf7ixsPXsWtFoMw1/54D0+rqSQVFeneIIb6o77W6Vddn2CVi0mEBvjsHKoYQxBSu595RG1mq/uWQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxpCTWxe4yd+QdSSqq6XM0udJYuy9hKZJbalkC+SXdjzBevNvb8
	O9OKAZas0ZGm0IjWK8q/53oTKmIbW9Ko1BxW6qeJmnNfnOSa3NpU8i2Eq2jD93A=
X-Gm-Gg: ASbGnctHHt9SoLIs+jzd4UgXCqaVeSVBo7ZcpyOna+E5FHB4V1l3Kj+HakzCATHE6MV
	StpvfwMfn4kuWNeX+esxYTpU8UXnGw6IVziEbnqsOZswgbe+fFGus1uVirZ8w6vNKwHG2+nvikm
	m+9WlTTXhZR2JRKBnlhCiYnoiuvFe0My9IBeiYs90V/6Co59rYM7tXBmpEb4RKMAufFYqrz7T8k
	NJ/B7RCCtD5WuzfWywnR2SDFDKucLIQmlTF6H992lSzWDURrP/dYqkwE6Ts/DkVYV9Ng855s+jA
	qY2rFoRy89imvIeZQdvfEjjI6EsuiB53w96aWFqs3ldnXgKTqxPMy1DbRfzDQAxKNTheZk+9rmT
	s7DnMJUVCEhJmrU1ImmMI3h11C672
X-Google-Smtp-Source: AGHT+IF7lGDo2V4OWxe67pw6pes0roVjPL60qV8ZkhzEjnVw85shlE47W9reKIhwnUyuTehJMjsREw==
X-Received: by 2002:a05:622a:4c87:b0:476:739a:5cf3 with SMTP id d75a77b69052e-489e46a4769mr63495651cf.1.1746036685174;
        Wed, 30 Apr 2025 11:11:25 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F.lan (pool-173-79-56-208.washdc.fios.verizon.net. [173.79.56.208])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-48a64fe04efsm5897421cf.19.2025.04.30.11.11.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 11:11:24 -0700 (PDT)
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
Subject: [RFC PATCH v2 14/18] cxl: docs/allocation/reclaim
Date: Wed, 30 Apr 2025 14:10:44 -0400
Message-ID: <20250430181048.1197475-15-gourry@gourry.net>
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

Document a bit about how reclaim interacts with various CXL
configurations.

Signed-off-by: Gregory Price <gourry@gourry.net>
---
 .../driver-api/cxl/allocation/reclaim.rst     | 51 +++++++++++++++++++
 Documentation/driver-api/cxl/index.rst        |  1 +
 2 files changed, 52 insertions(+)
 create mode 100644 Documentation/driver-api/cxl/allocation/reclaim.rst

diff --git a/Documentation/driver-api/cxl/allocation/reclaim.rst b/Documentation/driver-api/cxl/allocation/reclaim.rst
new file mode 100644
index 000000000000..f37c8b1cc3bd
--- /dev/null
+++ b/Documentation/driver-api/cxl/allocation/reclaim.rst
@@ -0,0 +1,51 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+=======
+Reclaim
+=======
+Another way CXL memory can be utilized *indirectly* is via the reclaim system
+in :code:`mm/vmscan.c`.  Reclaim is engaged when memory capacity on the system
+becomes pressured based on global and cgroup-local `watermark` settings.
+
+In this section we won't discuss the `watermark` configurations, just how CXL
+memory can be consumed by various pieces of reclaim system.
+
+Demotion
+========
+By default, the reclaim system will prefer swap (or zswap) when reclaiming
+memory.  Enabling :code:`kernel/mm/numa/demotion_enabled` will cause vmscan
+to opportunistically prefer distant NUMA nodes to swap or zswap, if capacity
+is available.
+
+Demotion engages the :code:`mm/memory_tier.c` component to determine the
+next demotion node.  The next demotion node is based on the :code:`HMAT`
+or :code:`CDAT` performance data.
+
+cpusets.mems_allowed quirk
+--------------------------
+In Linux v6.15 and below, demotion does not respect :code:`cpusets.mems_allowed`
+when migrating pages.  As a result, if demotion is enabled, vmscan cannot
+guarantee isolation of a container's memory from nodes not set in mems_allowed.
+
+In Linux v6.XX and up, demotion does attempt to respect
+:code:`cpusets.mems_allowed`; however, certain classes of shared memory
+originally instantiated by another cgroup (such as common libraries - e.g.
+libc) may still be demoted.  As a result, the mems_allowed interface still
+cannot provide perfect isolation from the remote nodes.
+
+ZSwap and Node Preference
+=========================
+In Linux v6.15 and below, ZSwap allocates memory from the local node of the
+processor for the new pages being compressed.  Since pages being compressed
+are typically cold, the result is a cold page becomes promoted - only to
+be later demoted as it ages off the LRU.
+
+In Linux v6.XX, ZSwap tries to prefer the node of the page being compressed
+as the allocation target for the compression page.  This helps prevernt
+thrashing.
+
+Demotion with ZSwap
+===================
+When enabling both Demotion and ZSwap, you create a situation where ZSwap
+will prefer the slowest form of CXL memory by default until that tier of
+memory is exausted.
diff --git a/Documentation/driver-api/cxl/index.rst b/Documentation/driver-api/cxl/index.rst
index 2be2855e5870..a768144698e9 100644
--- a/Documentation/driver-api/cxl/index.rst
+++ b/Documentation/driver-api/cxl/index.rst
@@ -47,5 +47,6 @@ that have impacts on each other.  The docs here break up configurations steps.
 
    allocation/dax
    allocation/page-allocator
+   allocation/reclaim
 
 .. only::  subproject and html
-- 
2.49.0

