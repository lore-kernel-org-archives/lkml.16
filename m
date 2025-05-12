Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C82552522B8
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 16:21:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747066920; cv=none; b=jAF0xrWN4FfS9AZAmhYmhXytJC8BkyQWFvCuXUh9pvOG5U4+dpdK3fjT4KZA5vD+8Iy+DsHlK1+PG03xDMqo8djLCbmQbk+uf8gpDT04t1LHrJQIHkiSj9np+ipjm2n5MrMH0XSOPUSkxAjF0KmgxNM1SZpVGQHLZwa39HiY/ow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747066920; c=relaxed/simple;
	bh=DoI5kxJikAM/qpIRAtn9fjxrQS8+dT5cbJX/H3hs68w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Y5GDUalXyXDYI/uLfY+vU6w/rHLLeqZYxKcGIId0ziywivfzpZsRKcZNUughVb1CFIt2Z0mTHa6JQb3qwy6FzU1NN2ff1WvjcFO4/XrKDcHzZQtsGVOxckykPV+KVPYX2navGmDC6LwVT3KmJUcRTog/CeE8P7If8Eb4rH8KBAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=T11VnCbF; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="T11VnCbF"
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-7caea4bc9e9so893510885a.1
        for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 09:21:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1747066916; x=1747671716; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sNILEeZYlBJQYm8rxVf5XnkRfrtj2f63uIZxnPhs6Qs=;
        b=T11VnCbFRPyHD4HaXeoavsqFfREJZpXTL/5dnngo7KylDBShtZ6689/TFf2dvDz1fD
         yih49sm2N9ze/p5IT++yOpphrutlzwkydXKBZp4bA3aAdvHDcnkyJb7RayJsS+Iwuqn7
         ivpk7lWohsG7Sa2GLFXeDD9QX7vxmPVbwCO7XcoM44PJZQK5rX0i1e/A6GyApss9TXCv
         j7HKiCCev5mtJA5Azaav1zSLKUJt4DwtKG+JnyQE2zThGsRFs7MmC+eA7fX8SwlBkgrG
         jKt23Dbpz0E49qcBvPj7bN2g5u1SCAdRbW7aaoCZNrfNiGzNEbGhdEitg3pIHCu+Qu3X
         hKtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747066916; x=1747671716;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sNILEeZYlBJQYm8rxVf5XnkRfrtj2f63uIZxnPhs6Qs=;
        b=qWIrIUjYWho/cTPExp3UZOQfg6uLXM0sacqlOlPvVYkZk6vDKXP3f4P659TAL0VWhB
         5GkNnrl1Z8pvE/0vBZew6ZapR4vguckNgGLFUUZmx12iyCVnU64Ty/mZUj2xOkW84I3W
         IuyJpPDA8ODlnmdritiVm+1Caqv7iCbTwITab6A/0lDDJptbWAAaTptDATGcItzyR+hn
         Om2pumMtOV16M6DWXatmLLmuj2nmFvvGi6wcgDGlI4kjyl5MmO1zc2gm9KjcvCcTTYwl
         deZayBgbdIofszSsdlH3fdLtA2L1YuWwjFzawDIAgvF6ZcPfG7F3qNRXumMlW2N5J0bA
         EBYw==
X-Forwarded-Encrypted: i=1; AJvYcCXhZ5rnQtq4dyGCe5SFUjFtM5XIlGIPM8zEes4lQUII9pHhcny4yI5KFFFoBSn4A0vYr1cYG8gS8s2nxrg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxo1pXQ3CsyPctVO5WtZraHc//86ffTN0M1mkOgMAtCxeE+cpvz
	Vra4naOIljDlFBLwOuiAoENfNF5fIXcj/8CAw23H6nFWYGrmk8tx9bhHyqGaEnSw12bnbsEMHUS
	t
X-Gm-Gg: ASbGncsmBygjRwRnPSE68f1gRp9bYjGTICHO+ZJk8bgUHQwKQkJZq2i4JwjWRfg2aXr
	ht/VhqZXLNi/Pfd0TEwMPEZ1TjkQ6w142XANZxW1dP+cynhn9s9fzaXHN/OVmtbreHmBs9ItAaR
	O2Wew0IKPn1WdOac75K5kwTCfI6Cwu2nDBcYRkVN4yAABwqX8H9WmwzivsS9p6f7KBeAr79rY7n
	tYADpIrLnW/cIqJBuyUDWJdC7PFbxsZRf4mT6gAmPOTo21eGBGHzN1j+BXz4ANNCLPqk6PeCTm4
	/4UDn9UUX2RBSomBUMMOLp4UBarvzaRGgqmm2eoPgh5H4x3N07GKxbsL14jCL6WA8lsLcYAlMZG
	e+nQR8lHredCFFCS1NE2gDN7R6PUt1OKN75Rj
X-Google-Smtp-Source: AGHT+IFwl36mLDo7FZkCUHoGJHyTy2zewdmXD6A4NvIgp/fn+qZTsyQP+IQVYzuIHMVoFWLDW+xitg==
X-Received: by 2002:a05:622a:1aa0:b0:476:8cad:72e0 with SMTP id d75a77b69052e-49452734c55mr177946951cf.15.1747066905232;
        Mon, 12 May 2025 09:21:45 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F.lan (pool-96-255-20-42.washdc.ftas.verizon.net. [96.255.20.42])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-49452583961sm52461791cf.58.2025.05.12.09.21.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 09:21:44 -0700 (PDT)
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
	Randy Dunlap <rdunlap@infradead.org>,
	Bagas Sanjaya <bagasdotme@gmail.com>
Subject: [PATCH v3 02/17] cxl: docs - access-coordinates doc fixups
Date: Mon, 12 May 2025 12:21:19 -0400
Message-ID: <20250512162134.3596150-3-gourry@gourry.net>
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

Place the hierarchy diagram in access-coordinates.rst in a code block.

Fix a few grammar issues.

Suggested-by: Randy Dunlap <rdunlap@infradead.org>
Suggested-by: Bagas Sanjaya <bagasdotme@gmail.com>
Signed-off-by: Gregory Price <gourry@gourry.net>
---
 .../cxl/linux/access-coordinates.rst          | 30 +++++++++----------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/Documentation/driver-api/cxl/linux/access-coordinates.rst b/Documentation/driver-api/cxl/linux/access-coordinates.rst
index b07950ea30c9..e408ecbc4038 100644
--- a/Documentation/driver-api/cxl/linux/access-coordinates.rst
+++ b/Documentation/driver-api/cxl/linux/access-coordinates.rst
@@ -26,20 +26,20 @@ There can be multiple switches under an RP. There can be multiple RPs under
 a CXL Host Bridge (HB). There can be multiple HBs under a CXL Fixed Memory
 Window Structure (CFMWS).
 
-An example hierarchy:
+An example hierarchy::
 
->                CFMWS 0
->                  |
->         _________|_________
->        |                   |
->    ACPI0017-0          ACPI0017-1
-> GP0/HB0/ACPI0016-0   GP1/HB1/ACPI0016-1
->    |          |        |           |
->   RP0        RP1      RP2         RP3
->    |          |        |           |
->  SW 0       SW 1     SW 2        SW 3
->  |   |      |   |    |   |       |   |
-> EP0 EP1    EP2 EP3  EP4  EP5    EP6 EP7
+                CFMWS 0
+                  |
+         _________|_________
+        |                   |
+    ACPI0017-0          ACPI0017-1
+ GP0/HB0/ACPI0016-0   GP1/HB1/ACPI0016-1
+    |          |        |           |
+   RP0        RP1      RP2         RP3
+    |          |        |           |
+  SW 0       SW 1     SW 2        SW 3
+  |   |      |   |    |   |       |   |
+ EP0 EP1    EP2 EP3  EP4  EP5    EP6 EP7
 
 Computation for the example hierarchy:
 
@@ -82,8 +82,8 @@ this point all the bandwidths are aggregated per each host bridge, which is
 also the index for the resulting xarray.
 
 The next step is to take the min() of the per host bridge bandwidth and the
-bandwidth from the Generic Port (GP). The bandwidths for the GP is retrieved
-via ACPI tables SRAT/HMAT. The min bandwidth are aggregated under the same
+bandwidth from the Generic Port (GP). The bandwidths for the GP are retrieved
+via ACPI tables SRAT/HMAT. The minimum bandwidth are aggregated under the same
 ACPI0017 device to form a new xarray.
 
 Finally, the cxl_region_update_bandwidth() is called and the aggregated
-- 
2.49.0

