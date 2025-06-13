Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8BE514D2B7
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 13:41:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749822080; cv=none; b=atGWjLpP6PPzgYqO7hb8usmNd7LidspY+F6C3WpsgwH+BKRUiDPULPr54e1g6xqNdus2PFBSVUwRq4fc9l0GnvFzZ3wEm6Wfz6FmYA8QIB8lJ/sh5FkRDSGFKVaPTxMSdTi7k2W/Fa/y3NjJq4/uupWBYx6DVh420sypAJnT2gs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749822080; c=relaxed/simple;
	bh=H46jNRRysgI7C7Yo+blkL5OHIRXgGO6SIOJfPsWTea4=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=hXFH3/a7d9OFyKzwmbOqT+XPqEUp6M+KZvqUYupJZmmzUN8mdinPREjnW8PvFDlDfqNlveWE2OQdDtlLETKumwK9Wp9ibrtTqqT5ZCFbUjZM7pPvosilEMHzTMoGOPgDdSqFcaQIDAfNGvpXoI2f+5KGX+z1FIgK5gCBrCPF/b4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=QLzq40J8; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="QLzq40J8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749822077;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=8+Xheo22yfi8+4Y8JwQZygk+6DcGkUs/7vPXcz1EW7o=;
	b=QLzq40J8E0qbkCdXBmOqWKZOjdP4l9IWVJKyAYT+7nVQ89uz3ew4xjkDvzbPWSd8kjTLyo
	7lSIZQW5LsDLn8rbnM5AItnY9OTl8DJI73YPQEKGP6NZFhv8Pu4xsVZMgbqBRMSvTDH2Ak
	HJxytgMglGRCo2pSEQH0r1DhLFa+dts=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-58-DhdauXHmNMW5DzsIOPXJmQ-1; Fri, 13 Jun 2025 09:41:16 -0400
X-MC-Unique: DhdauXHmNMW5DzsIOPXJmQ-1
X-Mimecast-MFC-AGG-ID: DhdauXHmNMW5DzsIOPXJmQ_1749822076
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c790dc38b4so373191985a.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 06:41:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749822075; x=1750426875;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8+Xheo22yfi8+4Y8JwQZygk+6DcGkUs/7vPXcz1EW7o=;
        b=Iffa9yxVoeynxQBSmIy/WsVtbmxfpx0A9cARpY1j5TTmWW20zTrFT9le6WI92Y8xDU
         /6VyMjSnPT5CVv/Y0T635XO+3ZgnWVCQhIu+zNcb7HcaWbuO+3Gh+XKDvtB/E7mzuwu5
         kFfAnHzXzvY1S9XscNsAeyBB552kHLwUyCdv6LZP1lt1mbsTfVdgioxZwbx4vjbztRuv
         mprB6jAhDXRSJOg+jIMALjEQlzBkO4+PlPV1lppchm1o0lGYXI0vdyPWiVNxnRD1NbWc
         U6nepK/sKkcVz6XfOldHIkkyTIPkf/nBJv8Rd1IzSEDnWIMgtWHtA2QHjDWaUb6tKVjO
         badw==
X-Gm-Message-State: AOJu0YzYfyg3KifNIHTIZT9gwqfSBFRuzJxkxeQwjFaP1WePXXp+unON
	BHpZEXyxH7hRbO995Jmnn9zqRhaNCmNo44anCmDjwjvo1VdiKqvyM+XcxLKWa/z9DrjKj7et0ai
	m3h7Nxmx429JMNF3pZgeuJIIGsBa5bjY/Y1XYxn4B9G6SnrsGDauSOC+bpCSoBMTJecFzaP38KN
	sCBYuZNb9Wujd6HB0waagQ0g2XI+Hgpx0hC+YSgxVgOL1sg44=
X-Gm-Gg: ASbGncuumHzPfEB930bP/dHWpLpZYuCFUJxIBC7D6mKuWBqkgi7ZGlfVrEOo216fIYT
	nBqPoCAtAEzsyQX81M3j+41+qpk9IZdefDIzPjqR8Hsi8YUSzYSIGvw5FaIlsiJrcfSgK3TLd08
	dJWqJqWMlt//RSE3dOhecGmsBgbCynRglsElouSA2Q8Dh4pBhI2Os6aZDMObxXmpcH7um8kG60Q
	vzxjz4StE/kr8R7CuMvsnjLF0aXBRdfdHKcKb+mQEUqBfipSsbzlaYbQRU2IMfRN9Wyf4CaU5I6
	ejI3SLoRhLY=
X-Received: by 2002:a05:620a:2621:b0:7d3:9032:2b85 with SMTP id af79cd13be357-7d3c5360840mr136459585a.13.1749822075459;
        Fri, 13 Jun 2025 06:41:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFe+TnRdtM1gxQu/6gMVaNFM0qTZrkCayfL/mj3FQ53jOkq/dZA5fcnFQB8Hiozqkhq54Zhsw==
X-Received: by 2002:a05:620a:2621:b0:7d3:9032:2b85 with SMTP id af79cd13be357-7d3c5360840mr136454585a.13.1749822075007;
        Fri, 13 Jun 2025 06:41:15 -0700 (PDT)
Received: from x1.com ([85.131.185.92])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d3b8ee3f72sm171519285a.94.2025.06.13.06.41.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jun 2025 06:41:13 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	kvm@vger.kernel.org
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Alex Williamson <alex.williamson@redhat.com>,
	Zi Yan <ziy@nvidia.com>,
	Jason Gunthorpe <jgg@nvidia.com>,
	Alex Mastro <amastro@fb.com>,
	David Hildenbrand <david@redhat.com>,
	Nico Pache <npache@redhat.com>,
	peterx@redhat.com
Subject: [PATCH 0/5] mm/vfio: huge pfnmaps with !MAP_FIXED mappings
Date: Fri, 13 Jun 2025 09:41:06 -0400
Message-ID: <20250613134111.469884-1-peterx@redhat.com>
X-Mailer: git-send-email 2.49.0
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

[based on latest akpm/mm-new as of June 12th 2025, commit 19d47edf9]

This series enables !MAP_FIXED huge pfnmaps for vfio-pci.

Before this series, an userapp in most cases need to be modified to benefit
from huge mappings to provide huge size aligned VA using MAP_FIXED.  After
this series, the userapp can benefit from huge pfnmap automatically after
the kernel upgrades, with no userspace modifications.

It's still best-effort, because the auto-alignment will require a larger VA
range to be allocated via the per-arch allocator, hence if the huge-mapping
aligned VA cannot be allocated then it'll still fallback to small mappings
like before.  However that's really from theory POV: in reality I don't yet
know when it'll fail on any 64bits system due to it.

So far, only vfio-pci is supported.  But the logic should be applicable to
all the drivers that support or will support huge pfnmaps.

Kudos goes to Jason on the suggestion:

  https://lore.kernel.org/r/20250530131050.GA233377@nvidia.com

Though instead of refactoring shmem, I found we already have a function we
can directly reuse for THP calculations.

The idea is fairly simple too, which is to make sure whatever virtual
address got returned from an mmap() request of the MMIO BAR regions to be
huge-size-aligned with the physical address of the corresponding BARs.

It contains minimum mm changes, in reality only to rename and export the
THP function that can be reused.  That is patch 3.

Patch 1 & 2 are trivial small cleanups that I found while I'm looking at
this problem.  They can even be posted separately if anyone would like me
to.

Patch 4 is a tunneling needed to wire vfio-pci over to the mmap()
operations of vfio_device.  Then, patch 5 is the real meat.

For testing: besides checkpatch and my daily cross-build harness, unit
tests working all fine from either myself [1] (based on another Alex's test
program) or Alex, checking the alignments look all sane with
mmap(!MAP_FIXED), and huge mappings properly installed.

Alex Mastro: please feel free to try this out with your internal tests. The
hope is that after this series applied your app should get huge pfnmaps
without any changes (with any pgoff specified).  Logically there should be
minimal dependency on stable branches whenever huge pfnmap is available.

Comments welcomed, thanks.

[1] https://github.com/xzpeter/clibs/blob/master/misc/vfio-pci-nofix.c
[2] https://github.com/awilliam/tests/blob/vfio-pci-device-map-alignment/vfio-pci-device-map-alignment.c

Peter Xu (5):
  mm: Deduplicate mm_get_unmapped_area()
  mm/hugetlb: Remove prepare_hugepage_range()
  mm: Rename __thp_get_unmapped_area to mm_get_unmapped_area_aligned
  vfio: Introduce vfio_device_ops.get_unmapped_area hook
  vfio-pci: Best-effort huge pfnmaps with !MAP_FIXED mappings

 arch/loongarch/include/asm/hugetlb.h | 14 ------
 arch/mips/include/asm/hugetlb.h      | 14 ------
 drivers/vfio/pci/vfio_pci.c          |  3 ++
 drivers/vfio/pci/vfio_pci_core.c     | 65 ++++++++++++++++++++++++++++
 drivers/vfio/vfio_main.c             | 18 ++++++++
 fs/hugetlbfs/inode.c                 |  8 +---
 include/asm-generic/hugetlb.h        |  8 ----
 include/linux/huge_mm.h              | 14 +++++-
 include/linux/hugetlb.h              |  6 ---
 include/linux/vfio.h                 |  7 +++
 include/linux/vfio_pci_core.h        |  6 +++
 mm/huge_memory.c                     |  6 ++-
 mm/mmap.c                            |  5 +--
 13 files changed, 120 insertions(+), 54 deletions(-)

-- 
2.49.0

