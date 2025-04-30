Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ABFA1E32C3
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 00:13:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745971986; cv=none; b=RBnlP1GHe8VHaYK16+FLawNmlgFekIDF2v5NGogktSO6fEJ+MM4CrLMh37R9eYpdXj90a6z/kish0F1G3OmssRxH/IvnKE3yVXwnqHKY93VdOn4R2/JyEYZQHufNCcnIP53cyICpbOz8SWEAESZ1By/6jxeANsLX5Vp8gWZNmNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745971986; c=relaxed/simple;
	bh=lNJCo6vZDGuxpwKTO4RG3PWfxMqBn8sro5yfGkfy9yM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Trt2SoaHGg+ermxDNi3XJh3uneSrCZgCf2y+EMdcTKXiJCrZdU7WDmGbTUkB5hNRf1lyTCiKc1cma0IWYK9AXSqF/NAusZSx62PLQ7lO9NcZCFbXZhs6ly+VsFEu6BdNqYroC54duXFjzxvEXSjR8YIQWkai4yCgMp1eYq8V+do=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=sW4f88bK; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="sW4f88bK"
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-4774193fdffso122586891cf.1
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 17:13:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1745971982; x=1746576782; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uawVL9waclaUXznPQCp2ioRqecofoABS91U/9dY2U1M=;
        b=sW4f88bKjbS5qYVqSKwCfepo4FuyiyZ/49rqhAUZxKdF0y0XDgQgFvqVcEcPEPyWQ+
         WBL8WejFJB2+RqaJcXnrpdKHA6XXIqQK6TXM/8KnguLeLHfshHoqpBQArw7VW7d89g2e
         1P6/6MtgITfh+U/AQ/zrORlBl7Xdpyw+dO8BUNM7e0FJZxwQKmvDXx6KVqX6fZIbOpsa
         yL7vVQcxmb/JNlNK4UcFGz1TXx4fSDJX8PTFu1x9CZRIXQRrUs+Nk1egjwhVyYluV3u9
         ldiX8wkkf5pEGc5qjeV3OVHwtEP5S4OInPGibdOdYpK2E4KLtCKw4rM5dBddASd4KcG4
         1QhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745971982; x=1746576782;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uawVL9waclaUXznPQCp2ioRqecofoABS91U/9dY2U1M=;
        b=Nb7EOpZ2Vc0DFMiowuOfmvYnF2uIvFHOmB5H1lhKF8YPg264S+YhNlWUmyA9aB5yZ/
         pQrr4peZNbtQKZ/EfCK7rc98y50EPQfLCEUrgXqMcEgwyaj9jonizpXCK9VCIxtyEQqn
         q8awaeSIKfSsvdhCBKT6gHB/HF7EQkqOjSBSNHAicMufix30jIzC/FTg97W6LaydalEn
         P2kz0acEba6y3XKVdXu5thO5gkw1Vc4zaOCIUFes0J5ps482YSQJqVYqw1z5znOjQ+Cx
         MVQC3bjn7JcxPuYhJYOpJEiQF4MGsOX6qxcaZ/459whpUxUayAAdr+fKclBth76Jm8ZQ
         fZJA==
X-Forwarded-Encrypted: i=1; AJvYcCWoBLEhgmHDCG+4wMNgf+SY2QOqbIb5Hj5IATSfSXv+x7mFoDYFSvGMf/EcZkqdweccm+y2C9PIHs7qZ2s=@vger.kernel.org
X-Gm-Message-State: AOJu0YxnG260yHW4Kznxs9TyePsJEFf3y2HnktqIuAdBA3zvFqw1YEvZ
	X0jvYyNkrLm0Gc074yt/9VwlB0U6rQ8SdE6b9Bm1v/EgYxkkhegAwaDcAvC+Owgu2WZB6SlVeNH
	O
X-Gm-Gg: ASbGnctpUCIezWWdmjo9lJgNdVbD77hQgMIPv4CC3c5jHguLtqXBo011AaFTD0Xeo01
	veMul3WTcRRLQE20oEYtNG4fLZ1vT6Wo+bBbL7fTMBGoBBWYiY0RUciWr0J2xi3xentbYgJsEJc
	N5QlaaBwG63Iaomm1+9qLm1r+qdBxC8TJ5CnZps7y2R0LFkiMo29OTOfxRH+qSS5Eir18rX/CKv
	pftVyncUHqQFGFf7deUW+fkjMOJPqTFPviz6J7uvf47H0MdLHulNtCNDjlhskH0rgwsXm4oo02j
	RzHyJnGMQYfcsU9MfroOUjg2IWQQDIzlz8/VpDhNKRY9Qr/ZPZJciLRqPfNc3ABeulXIlkdrN/I
	0X1NqcLmDs8GEjoAyyXJ+Tqu0C9cKECkCxVRjUPk=
X-Google-Smtp-Source: AGHT+IG2vOhCtzXNYKwtzwLvK9oR0zRMiZj20a0FOQ1aA2EP6QhhElNLMZmA7y1EAW5PIcBKuXgyGg==
X-Received: by 2002:a05:622a:1f8d:b0:477:4df:9a58 with SMTP id d75a77b69052e-489e4a8d38fmr11575931cf.18.1745971982177;
        Tue, 29 Apr 2025 17:13:02 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F.lan (pool-173-79-56-208.washdc.fios.verizon.net. [173.79.56.208])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-47e9f7a820esm87634411cf.41.2025.04.29.17.13.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 17:13:01 -0700 (PDT)
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
Subject: [RFC PATCH 15/17] cxl: docs/allocation/hugepages
Date: Tue, 29 Apr 2025 20:12:22 -0400
Message-ID: <20250430001224.1028656-16-gourry@gourry.net>
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

Add docs on how CXL capacity interacts with CMA and HugeTLB allocation
interfaces.

Signed-off-by: Gregory Price <gourry@gourry.net>
---
 .../driver-api/cxl/allocation/hugepages.rst   | 30 +++++++++++++++++++
 Documentation/driver-api/cxl/index.rst        |  1 +
 2 files changed, 31 insertions(+)
 create mode 100644 Documentation/driver-api/cxl/allocation/hugepages.rst

diff --git a/Documentation/driver-api/cxl/allocation/hugepages.rst b/Documentation/driver-api/cxl/allocation/hugepages.rst
new file mode 100644
index 000000000000..195cdb0d64ee
--- /dev/null
+++ b/Documentation/driver-api/cxl/allocation/hugepages.rst
@@ -0,0 +1,30 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+Huge Pages
+##########
+
+Contiguous Memory Allocator
+***************************
+CXL Memory onlined as SystemRAM during early boot is eligible for use by CMA,
+as the NUMA node hosting that capacity will be `Online` at the time CMA
+carves out contiguous capacity.
+
+CXL Memory deferred to the CXL Driver for configuration cannot have its
+capacity allocated by CMA - as the NUMA node hosting the capacity is `Offline`
+at :code:`__init` time - which CMA carves out contiguous capacity.
+
+HugeTLB
+*******
+
+2MB Huge Pages
+==============
+All CXL capacity regardless of configuration time or memory zone is eligible
+for use as 2MB huge pages.
+
+1GB Huge Pages
+==============
+CXL capacity onlined in :code:`ZONE_NORMAL` is eligible for 1GB Gigantic Page
+allocation.
+
+CXL capacity onlined in :code:`ZONE_MOVABLE` is not eligible for 1GB Gigantic
+Page allocation.
diff --git a/Documentation/driver-api/cxl/index.rst b/Documentation/driver-api/cxl/index.rst
index e20defe9c20e..51dd0392883b 100644
--- a/Documentation/driver-api/cxl/index.rst
+++ b/Documentation/driver-api/cxl/index.rst
@@ -49,5 +49,6 @@ that have impacts on each other.  The docs here break up configurations steps.
    allocation/dax
    allocation/page-allocator
    allocation/reclaim
+   allocation/hugepages.rst
 
 .. only::  subproject and html
-- 
2.49.0

