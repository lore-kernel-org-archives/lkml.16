Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70A8E23815C
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 11:37:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743593836; cv=none; b=fhRsmfpFrSR2Ogz7/Tuyi8tMzjP/gnqY/lcNHWui5MQZPjqzMDBTPk+MJ/RZHeLszOqzjgUKiO0KC1caKCqeIOSQdKvMxw4C1/Wyw2CadmVw5+a3bUl1vZiMfMLhzF/Sj9Flcnl9owbMITiqBVLBCSWDW3QFWD8HRhXLxmLgtEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743593836; c=relaxed/simple;
	bh=eOno1GwLtcwM5WfwpE7dbbRdRp8qnky5lPeH2QEM0BU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=DTPUZlIb1FKGVKPIbCRbjFPx9EDFte6MrIkC4lYGFFV8G84AlUl98b/qP7Jq2bMVH/FdDBJljE6W87W81doqKWzmLz8w7ohYELL4+d6CWHHPYJleQJLqXub0mVpF+A9dn3cKWuSdbRqD1UHg6JYn93Ig1Y7cRJNZ2jxFRGrCaLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=citrix.com; spf=pass smtp.mailfrom=cloud.com; dkim=pass (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b=qdIKkSPc; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=citrix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloud.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b="qdIKkSPc"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-73712952e1cso16586b3a.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 04:37:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1743593833; x=1744198633; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ixU0oqK5jbY2nPR4JZGgt/nTg2jny4RurPx7i/XkUWw=;
        b=qdIKkSPcOi+TUYwxfQa7Bso8m0vUlwy//AmVqnF1Afdmtpq4BZ646AbmYr5lgHZHlT
         JBquYFMHcPTwYtrdgaToRf0AsDY68FTHrVjmdbgZFoRqXuKOBPOEY6a/85rtR2UsdS0P
         l3qYsmul9uaGJllhgNStWNg2s89hDEpi6OHvA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743593833; x=1744198633;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ixU0oqK5jbY2nPR4JZGgt/nTg2jny4RurPx7i/XkUWw=;
        b=NRx7voNNA77kndR4fMuRmPQk23TlfcF3ttlI/LG/MU+2mx2Tp5Ba024b03gq2zoIYq
         HNKozGmT76v0IEuzVCjtMeGJR+GN95ALeulEL5meZNxv5uaADnUQ/LPnXD+HoYMbzxeY
         uWmFMX/7f0rlbfTBnI8KiJoLhZ1HBcpNf+5hLAngqJgombRlAF3drG6o+m8AynUM8Je4
         hbP+EunVm/SilQc15loHA0un736tZdLNUCdahpxwWyMolV4emMIt0GeWMClf4QLsA8Mr
         vRIAshOjvRilRJIrlDBypr8BVdfH4Fa981nMPN71+wrfgjle2U+WL2KSShac2nY02SGJ
         cTjA==
X-Forwarded-Encrypted: i=1; AJvYcCU0cHCxFd1pkeVBga/48OD4uCeZZKyV8U7mvhUwiaNfD0i2VDOHOGLUq4olZAd8QBrnHGmEDSMVYf4zazQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzw71PANLOT2v5Z6Py/7hTEEyCv7mV6l3fU5PkRfdL18va1/0sC
	DqZYpxPnEG0XLq5hwURGrNdX72tYuriomhZuUQ/Hm4JENuATMLv6SKzErA8jROM=
X-Gm-Gg: ASbGncuJzJIJI0uiVnmx0cgYxlGer7ucEYe83J03UF6QYli2ET1yoLOFLlR6aiNZAMY
	zXl2SE5Jam/dzU+Sdju7STpyS24ckPs/5gUSwAsuMpzCxcwRbw8KBlm2v2V8KS7wV3IgJM0ljgA
	nmNPcL/s77XFfG0jzeGU0mX8ShNAS+rSGe6fyjVGuzoh9I+vFSZNe1wfTvtj8affVFnPqT+DRPQ
	OiMiUCvzaK8HHljRpBNFn3GCAjm++GVCQnXH6vDfEKJK8fmc95jSrCraB5G7jwl38qbqzPhFYUr
	sBgmERQUg7iRsCZRVqIFxlqRKyzVpzwp8xqW7rCM8sJjm0cG1USCuRGa/4YO
X-Google-Smtp-Source: AGHT+IGIDNqLOf2aBjmE23vtRj3zY193A54lzODujE/OYAP6rZ4Xy3aIyLk/gK9APCDfp4CLMHy1Ow==
X-Received: by 2002:a05:6a20:9f99:b0:1f0:e42e:fb1d with SMTP id adf61e73a8af0-2009f79c23amr28543288637.36.1743593833636;
        Wed, 02 Apr 2025 04:37:13 -0700 (PDT)
Received: from localhost ([84.78.159.3])
        by smtp.gmail.com with UTF8SMTPSA id 41be03b00d2f7-af93b6d6f77sm8173978a12.36.2025.04.02.04.37.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 04:37:13 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: Juergen Gross <jgross@suse.com>,
	Roger Pau Monne <roger.pau@citrix.com>,
	xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Subject: [PATCH] x86/xen: fix balloon target initialization for PVH dom0
Date: Wed,  2 Apr 2025 13:36:55 +0200
Message-ID: <20250402113656.84673-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

PVH dom0 re-uses logic from PV dom0, in which RAM ranges not assigned to
dom0 are re-used as scratch memory to map foreign and grant pages.  Such
logic relies on reporting those unpopulated ranges as RAM to Linux, and
mark them as reserved.  This way Linux creates the underlying page
structures required for metadata management.

Such approach works fine on PV because the initial balloon target is
calculated using specific Xen data, that doesn't take into account the
memory type changes described above.  However on HVM and PVH the initial
balloon target is calculated using get_num_physpages(), and that function
does take into account the unpopulated RAM regions used as scratch space
for remote domain mappings.

This leads to PVH dom0 having an incorrect initial balloon target, which
causes malfunction (excessive memory freeing) of the balloon driver if the
dom0 memory target is later adjusted from the toolstack.

Fix this by using xen_released_pages to account for any pages that are part
of the memory map, but are already unpopulated when the balloon driver is
initialized.  This accounts for any regions used for scratch remote
mappings.

Take the opportunity to unify PV with PVH/HVM guests regarding the usage of
get_num_physpages(), as that avoids having to add different logic for PV vs
PVH in both balloon_add_regions() and arch_xen_unpopulated_init().

Much like a6aa4eb994ee, the code in this changeset should have been part of
38620fc4e893.

Fixes: a6aa4eb994ee ('xen/x86: add extra pages to unpopulated-alloc if available')
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
I think it's easier to unify the PV and PVH/HVM paths here regarding the
usage of get_num_physpages(), as otherwise the fix needs to add further PV
vs HVM divergences in both balloon_add_regions() and
arch_xen_unpopulated_init(), but it also has a higher risk of breaking PV
in subtle ways.
---
 arch/x86/xen/enlighten.c |  7 +++++++
 drivers/xen/balloon.c    | 19 +++++++++++--------
 2 files changed, 18 insertions(+), 8 deletions(-)

diff --git a/arch/x86/xen/enlighten.c b/arch/x86/xen/enlighten.c
index 43dcd8c7badc..651bb206434c 100644
--- a/arch/x86/xen/enlighten.c
+++ b/arch/x86/xen/enlighten.c
@@ -466,6 +466,13 @@ int __init arch_xen_unpopulated_init(struct resource **res)
 			xen_free_unpopulated_pages(1, &pg);
 		}
 
+		/*
+		 * Account for the region being in the physmap but unpopulated.
+		 * The value in xen_released_pages is used by the balloon
+		 * driver to know how much of the physmap is unpopulated and
+		 * set an accurate initial memory target.
+		 */
+		xen_released_pages += xen_extra_mem[i].n_pfns;
 		/* Zero so region is not also added to the balloon driver. */
 		xen_extra_mem[i].n_pfns = 0;
 	}
diff --git a/drivers/xen/balloon.c b/drivers/xen/balloon.c
index 163f7f1d70f1..085d418ee6da 100644
--- a/drivers/xen/balloon.c
+++ b/drivers/xen/balloon.c
@@ -698,7 +698,15 @@ static void __init balloon_add_regions(void)
 		for (pfn = start_pfn; pfn < extra_pfn_end; pfn++)
 			balloon_append(pfn_to_page(pfn));
 
-		balloon_stats.total_pages += extra_pfn_end - start_pfn;
+		/*
+		 * Extra regions are accounted for in the physmap, but need
+		 * decreasing from current_pages to balloon down the initial
+		 * allocation, because they are already accounted for in
+		 * total_pages.
+		 */
+		BUG_ON(extra_pfn_end - start_pfn >=
+		       balloon_stats.current_pages);
+		balloon_stats.current_pages -= extra_pfn_end - start_pfn;
 	}
 }
 
@@ -711,13 +719,8 @@ static int __init balloon_init(void)
 
 	pr_info("Initialising balloon driver\n");
 
-#ifdef CONFIG_XEN_PV
-	balloon_stats.current_pages = xen_pv_domain()
-		? min(xen_start_info->nr_pages - xen_released_pages, max_pfn)
-		: get_num_physpages();
-#else
-	balloon_stats.current_pages = get_num_physpages();
-#endif
+	BUG_ON(xen_released_pages >= get_num_physpages());
+	balloon_stats.current_pages = get_num_physpages() - xen_released_pages;
 	balloon_stats.target_pages  = balloon_stats.current_pages;
 	balloon_stats.balloon_low   = 0;
 	balloon_stats.balloon_high  = 0;
-- 
2.48.1

