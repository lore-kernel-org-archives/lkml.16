Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 871A61E51D
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 13:35:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743773759; cv=none; b=LMFTM/FZdpwPSecfDEYjeTam6boCjQTQF8NxyDzteyzx/8Q9RX1uOGZaKdhWOfILCU+/AlPVw24GJxxb2icCfhraNOdjic9DblVT5kx3cfCZgXbM9nJhVGZskoWe8i0na0+sJ34U6rXp06yJ2MfhmjN7zHp4ypz4WhdjlLJEDbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743773759; c=relaxed/simple;
	bh=vx8un5jehyOJyuh6dA0nMqqZTeXs5aBjNmFHSrMfjiQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=gqDPqjAQwZzLj9rC1jAaDqk4kVScHkeZjH8AfPOrwq4pM4R8Ct+Xwj0J5qJSI1ONpbXY5s7C+FEDJZ8UxbvASIy20R0ULA22d86rkh/znEA2JWHg8+pmDGa2e28lhdUXm7BIXVTB5m9XQGEpDX/P6WLNUZCD5yOsFzh5ssZUTSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=citrix.com; spf=pass smtp.mailfrom=cloud.com; dkim=pass (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b=HkC0L8K/; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=citrix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloud.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b="HkC0L8K/"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5ed43460d6bso3364527a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Apr 2025 06:35:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1743773752; x=1744378552; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7zMVCjKwCi74UMVT2Q8AVcMCSyrZzJQzum19Wgp9Wls=;
        b=HkC0L8K/TwZbbFbPft5/u0BGGMsWAcReHtR0uO5mythnSGDb/zWVmKz14orpN3jdBQ
         Yotd5Nt/38vyh1YEgNwIn0Y4VSezS+rCQoo7IBY+jxgdPGQjjxjlV2Ds/nnXEhE5NaAe
         RFz9ByHkujqfNX5g026oclHyyBuI4WBNQxdG4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743773752; x=1744378552;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7zMVCjKwCi74UMVT2Q8AVcMCSyrZzJQzum19Wgp9Wls=;
        b=PZWY903sFgE46sMlBayo1iAzTCz6VLixMo+bN9OoHe/woiWeqzJwRNQQiIbayGlnOC
         5LyvHUpjyDZRLD8Ao9PBkP7wgl8nf3APOeUHoNjX2xzYtfv5NjyDB7wtdesdZEwPeQjG
         5VLgnjOVyYpOOopfAWefobJ0jMi1Lb3Nu4d46LO7zz9MBbzuwVAMMT/ikVLUzYdLzbim
         Gb7YBSRbFPiJVwjWOqYk3FKVW1KyRXPzWQRC1JBQMTvICuoC1RC2K1QYU9yeMaadp+UM
         YiBEcxr20FeUu/2IcnsXKUuB1MeDMQNYw226xgk+kSHaZXTh2Ba0Da2k5JaytKJpsI/N
         wfSw==
X-Forwarded-Encrypted: i=1; AJvYcCWXsteci+pvX9krM3+qoztqyEeDG68l96flprQWZGeMSAl1o/9uuCGRoqybXDmmGdIJRG6F1xD4/Xrat44=@vger.kernel.org
X-Gm-Message-State: AOJu0YygVzq7ZQ2YFGsa4NGga9JSEsBRaTVgTE642qaMPiGovHQGx8BI
	2AgP1LmPPhH8WJLXS2HqTpU4pti01UjNsqohcdv9lUX2Jp5MUbj/1GNtg0l4giI=
X-Gm-Gg: ASbGncttSey+9pwOfyDiYltkxuSSkUFjwKH7Mt3vukMqajRZ4AdV9HA+K9sPGb+x93L
	p8CQWB5l/vZld5aSoSF0XNjJGytNdZ4sPQOgpkERNWJdAKMg3U04GAuntDotab9rirwoaj1X+Pe
	XcveEKcPd8FrFvmpRyIwiW/9Yvv8nrReLhT4LUAqvdx1L7WV7HLwekHOkY8C30BePIWt/2LhM2X
	W+FFztm6ZdnI1xjBslsEhknV4YTjO/oB/U6jrqKSpkTKPn+kGWAh4kA4EGSsS6TZqlSD49BeMFr
	aLCwwRqkY3+M2XJzWfCLxHCks/I3M/vIxT41sJLPWikuNfyb/Q==
X-Google-Smtp-Source: AGHT+IFSKCngGbRbwdtl+C7MsVBdbETjJAdfQeZKdojq/dV5G705u6R+N4qeFiZ9coPdcBWaR16zzw==
X-Received: by 2002:a17:907:3d8d:b0:ac7:391a:e2d4 with SMTP id a640c23a62f3a-ac7d6e9fe27mr218999966b.59.1743773751706;
        Fri, 04 Apr 2025 06:35:51 -0700 (PDT)
Received: from localhost ([84.78.159.3])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-ac7c01c1085sm253747966b.183.2025.04.04.06.35.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Apr 2025 06:35:51 -0700 (PDT)
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
Subject: [PATCH v2] x86/xen: fix balloon target initialization for PVH dom0
Date: Fri,  4 Apr 2025 15:34:58 +0200
Message-ID: <20250404133459.16125-1-roger.pau@citrix.com>
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
Changes since v1:
 - Replace BUG_ON() with a WARN and failure to initialize the balloon
   driver.
---
 arch/x86/xen/enlighten.c |  7 +++++++
 drivers/xen/balloon.c    | 34 ++++++++++++++++++++++++----------
 2 files changed, 31 insertions(+), 10 deletions(-)

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
index 163f7f1d70f1..ee165f4f7fe6 100644
--- a/drivers/xen/balloon.c
+++ b/drivers/xen/balloon.c
@@ -675,7 +675,7 @@ void xen_free_ballooned_pages(unsigned int nr_pages, struct page **pages)
 }
 EXPORT_SYMBOL(xen_free_ballooned_pages);
 
-static void __init balloon_add_regions(void)
+static int __init balloon_add_regions(void)
 {
 	unsigned long start_pfn, pages;
 	unsigned long pfn, extra_pfn_end;
@@ -698,26 +698,38 @@ static void __init balloon_add_regions(void)
 		for (pfn = start_pfn; pfn < extra_pfn_end; pfn++)
 			balloon_append(pfn_to_page(pfn));
 
-		balloon_stats.total_pages += extra_pfn_end - start_pfn;
+		/*
+		 * Extra regions are accounted for in the physmap, but need
+		 * decreasing from current_pages to balloon down the initial
+		 * allocation, because they are already accounted for in
+		 * total_pages.
+		 */
+		if (extra_pfn_end - start_pfn >= balloon_stats.current_pages) {
+			WARN(1, "Extra pages underflow current target");
+			return -ERANGE;
+		}
+		balloon_stats.current_pages -= extra_pfn_end - start_pfn;
 	}
+
+	return 0;
 }
 
 static int __init balloon_init(void)
 {
 	struct task_struct *task;
+	int rc;
 
 	if (!xen_domain())
 		return -ENODEV;
 
 	pr_info("Initialising balloon driver\n");
 
-#ifdef CONFIG_XEN_PV
-	balloon_stats.current_pages = xen_pv_domain()
-		? min(xen_start_info->nr_pages - xen_released_pages, max_pfn)
-		: get_num_physpages();
-#else
-	balloon_stats.current_pages = get_num_physpages();
-#endif
+	if (xen_released_pages >= get_num_physpages()) {
+		WARN(1, "Released pages underflow current target");
+		return -ERANGE;
+	}
+
+	balloon_stats.current_pages = get_num_physpages() - xen_released_pages;
 	balloon_stats.target_pages  = balloon_stats.current_pages;
 	balloon_stats.balloon_low   = 0;
 	balloon_stats.balloon_high  = 0;
@@ -734,7 +746,9 @@ static int __init balloon_init(void)
 	register_sysctl_init("xen/balloon", balloon_table);
 #endif
 
-	balloon_add_regions();
+	rc = balloon_add_regions();
+	if (rc)
+		return rc;
 
 	task = kthread_run(balloon_thread, NULL, "xen-balloon");
 	if (IS_ERR(task)) {
-- 
2.48.1

