Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7E9A1D7E2F
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 00:13:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745971986; cv=none; b=BOl8YG0ZmbmUd2i02qBoT5ggvgB5/ypjC3vKe46zW2n1e6gYez8CCuDEHVrI1C7FUBwIJD/DAl88bOETzGOjwRws6ouNOYGv6bBarddlRDRnwTLK1JRalQ5MWYhm8OrhJ7F4g83fWt1pxXn1EOtlkF9E6VsQyWfAjTEHMkRA+0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745971986; c=relaxed/simple;
	bh=0K2qYudSIKSpntsCjjospSQ3Faqk32cfHXFTc352FVA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aXV8IxsW5VSrL/vIipc/kVgduOj0P97S7ioDjGO8TAg8TBAUT+jFJukjpERdz7MshDGu+0pVj8LOPbFAms5LSCfLNdQ5RGmHfnzds1fX0+g4FUJc0NXSuTEePnqwy6LVrZSkRrWwYgK97BDH+syYkaJ4zN6tK7Nkr4LBJW0cq0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=qw9MN/Y7; arc=none smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="qw9MN/Y7"
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-4772f48f516so4526751cf.1
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 17:13:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1745971984; x=1746576784; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0nlYJCidbo7D6EAdzULAlI9wXCDZH50uIfMmptbRecU=;
        b=qw9MN/Y75ouhn6KECXclLkEN/G+rWANX8W0YPDtZyW0zAXvrQDMmz64vBsJf7KYGMi
         mtQT6SaUP6lz8wXAnufPQ1/mk7FG6Qp3J9weSITJRRV7lueUHf0GfqzzGtdnY8NdUSW3
         CWJvguwo9teQFX3dr3fQCAJDAGrgA1lTzcrroMMDUjHnwcsO7s/nC7qXWTyDEgmtb8uD
         R7Q1fpIFA/pUE40A1IhGn6nFZ0QAYfocm1M6L0QjGJEQPfzHqdEiIe9j1mVpQtEPuZfR
         3C+Jc4wcrYQ/lTQLc+E2abFe1nH088Khay5dRikGVEoD9Ovgq64goy1LMFu76xK4DRKY
         y64g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745971984; x=1746576784;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0nlYJCidbo7D6EAdzULAlI9wXCDZH50uIfMmptbRecU=;
        b=ac3VyOq/ExEbdfYasmdSXXmxVhpFKEuzdg2i2N+Nw3WJuDIdtSSvLisTupp5blayLH
         +gHIywzYW53o6fE9ORkp7xK3zybnrYg7jRrTLm6qSJD+y/0kY8SC3GqBu/83f8+Kvs3a
         vW8kTCWMSAEPPTRVA44/v0CQkB+81xoMrYKio9bMhroda68+reKSP6wNzZwwVZ1B8xkE
         l/eoj6G5or32kwk8lscrp210Lk4d/Kf3wrSXQkYwR/QI3787fBXmEkUBOA6EBFwPQAAl
         t1QkfQrQnyPtzJdfwE0ybj48TNMFF/+Fakh0919x61pxEahYtAuqshAiKrP6kjId6D/n
         ZLCA==
X-Forwarded-Encrypted: i=1; AJvYcCXezGGXcFwoss6rL83befMGFqW1J84OsXMyfVzV9lgLxQBhXGawsIKkrNdcema3WGclWlvX05KPUl44bb8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxkE7j0m+3C4YmzvGEubzYCU3pj2M/IJVmOXkkGIDBD2i2UqOi/
	SXcdso5FeuvhPdiuZnVMInsqj5n+6u7K0H2GxcJnZyOV6uk4hMCPUPUsQ8KgjEo=
X-Gm-Gg: ASbGncv7TbOPtjwxRaG7d3ftBNX6hp9Cdwd/cqRgWAaYhvaVb4PFzfzCjY2g3ki5H4F
	mmqTKybeMZS5gyYg4/9j6jL6XbVOYFNID12hfwNq8Cm8HRhhPycmxNwMupzok0fCBYqPbdnxK/P
	rq3H7+0LvOZai6Y49U3nAyjUO/IuoVns58f2O6ShiPm9k+BWn6nJ+U8+aFRH/wZ0cf5eNngzdPl
	LDLe/1YzLZb/Isvge/f0kGbqAMHxmfDa4wc+3mLcXjMF1AYeP6vGAOi5SJ01FcIbmes+th7VKAL
	iqmllxSWUqUZcnNJi8r5SbncOZsL2p5wMB2Bb0VAHmU9dAU+vm+o1tLU3hW983yXw0+1/xxZDkB
	MFDpnBWAP/45GgqSI7mC2RlrefJ3M
X-Google-Smtp-Source: AGHT+IHHlI+GitsjsH8YXECXSbCgG0VCNVvdhBX/jA/ObO5ilet3C+3xZmGZflAts3b1Fw2a8vwXHA==
X-Received: by 2002:a05:622a:2483:b0:477:1dd0:6d15 with SMTP id d75a77b69052e-489cb7b9eb5mr13982081cf.5.1745971984051;
        Tue, 29 Apr 2025 17:13:04 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F.lan (pool-173-79-56-208.washdc.fios.verizon.net. [173.79.56.208])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-47e9f7a820esm87634411cf.41.2025.04.29.17.13.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 17:13:03 -0700 (PDT)
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
Subject: [RFC PATCH 16/17] cxl: docs/allocation/tiering
Date: Tue, 29 Apr 2025 20:12:23 -0400
Message-ID: <20250430001224.1028656-17-gourry@gourry.net>
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

Carve out a space for folks to explain existing tiering mechanisms
and how CXL capacity interacts with it.

Signed-off-by: Gregory Price <gourry@gourry.net>
---
 .../driver-api/cxl/allocation/tiering.rst     | 30 +++++++++++++++++++
 1 file changed, 30 insertions(+)
 create mode 100644 Documentation/driver-api/cxl/allocation/tiering.rst

diff --git a/Documentation/driver-api/cxl/allocation/tiering.rst b/Documentation/driver-api/cxl/allocation/tiering.rst
new file mode 100644
index 000000000000..dde7010fff12
--- /dev/null
+++ b/Documentation/driver-api/cxl/allocation/tiering.rst
@@ -0,0 +1,30 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+Memory Tiering
+##############
+
+todo
+
+Memory Tiers
+************
+
+todo
+
+
+Transparent Page Placement
+**************************
+
+todo
+
+Data Access MONitor
+*******************
+
+to be updated
+
+References
+==========
+
+- `Self-tuned Memory Tiering RFC prototype and its evaluation <https://lore.kernel.org/all/20250320053937.57734-1-sj@kernel.org/>`_
+- `SK Hynix HMSDK Capacity Expansion <https://github.com/skhynix/hmsdk/wiki/Capacity-Expansion>`_
+- `kernel documentation <https://origin.kernel.org/doc/html/latest/mm/damon/>`_
+- `project website <https://damonitor.github.io/>`_
-- 
2.49.0

