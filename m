Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A31D625F79C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 21:07:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750280826; cv=none; b=TG5t4X8GaRAi9CD8qc6DzzYiIYyF6YUnuCzdBHZYo4Yk5WI81NVx8soMNKMOfoo7y2KUN7XmDgjPYewT3ivisOPsOE7XVbnsU6FK3ljG5pU5GNWOdIrFpjYRVe7Z2re9MLj8FQ3bYRR+aAL5X8T6dnOxi3so6wuDiIQh33nbKZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750280826; c=relaxed/simple;
	bh=mtTEjNQfo4H3pB/dyTL9Sc/tHpbjQyBMBwN7w1+SOhA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NHEKMeb4rMxqW2leeptZi2Q2HntnJ9a8yWyIqnUILIHRr/Q5q09a0loucRcKugXzeyt4tVCVoIiFJY2/JrZasg/nu9zdFGoT/BSeCa2q7Ub/rzHMXtL/Lbz0+v4gBxq3iFxXNbWqc6/QNAlvfDOTwjPHQMHKgZUVEaWQnZ5EUdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=PT2sPVrg; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="PT2sPVrg"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-ade30256175so9376466b.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 14:07:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1750280823; x=1750885623; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=63WsI+9qMeCYHuZVYA1p2sA9XxVk0bIm5fIMuWkMbB8=;
        b=PT2sPVrgvEVQmj/cD9ZPE09/e7iEMedTZNK8QMxT0P0JCwKCxF7UwPXtVDdOjsMdw6
         1NvZQID+8/ihzR5cu5u/X6iK9aIme0+yq30WNJoBnBvAF1PVet9REOvVUhS66F5eXVNe
         aodMkgqQRMNm3N8UjzcG4BLtWeCriBC9HJs/4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750280823; x=1750885623;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=63WsI+9qMeCYHuZVYA1p2sA9XxVk0bIm5fIMuWkMbB8=;
        b=fid8dp8UZx6Trw4H8fvuDIBBcpmQEa1sNuknGGakpXTHUJQ5A/6vqoNjjvKfrsfYQ3
         Zkylq2NlPPefWI5ax5W1FB8mRLPffzxfbfXYJUeBa50wGmOGzdPpPx4JIHE/q/VaCVDO
         EVawEGyOEg402lHZwohQIlpu0GqhBN8LbCPdz91bYh+NFgtWGrerI6OiVBLrepYas4h6
         KWXMa4eQ6HrT9a4+QkTSXZuwqliULmaBWfwNDSiHmCNrgvVU1vtLbEZ15GTVDJHCS5kB
         HXzPVWCMB2BS74GZ5He1kIX2F9UPkVeNvZYPLi/utZwib0dLm/rvMuslNCGoDVrYdpaw
         /uxA==
X-Forwarded-Encrypted: i=1; AJvYcCVjSFFDQVOXnBRQCs/TdOmwL+GafAsnCP7fz3rF24pxNlKVWwIjLFf559TYbgemgHrNTHt0H/OWFjePRQ8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyXQh1/SOxvNG8PsMkM0JyUgjUpetx9uA/XfnRVY/4Y92WlukqW
	hi2eWlCKEaIYYJZKYpennhS/ctM1vOOIbLt0gkBhY1WchvIQHSW0tx/LytxA8rV9ig==
X-Gm-Gg: ASbGncs7fiEWKNKkL9U0p6ruv4/TC7ahbLCV5D6kPDjo4SLgFCr6F0axdL2jP4+PZlo
	1e5wkv1J4MDBzfro7jcJ9Lgu5sMsv725lfdaLnjEmt4nbZ/cbxOyVFmtBeepFa1A6fe/YyqnkbR
	Q39vgRvJsqTwwzawOI39N669wCn0wHQeDjtxwPiDW2INtTRHDvhO1eeSW67NA9wnuQNgZTLucdI
	9DXllJR80AGyPRd9ASjOuJF//XbGl0cKMKQIqw1H/lkmk6w8hX6dJo713hhlO/62I0lR8UPVgmj
	8Mw316ElRN9ds+DeVwu3oKkuMvQ4I9JfIiC35kCxBHIy4DrPaRuoPHFLUYdmpQ4aEJmxmx2iMED
	JiVFtV3Go0IWZZpLcgjtMFaT1R8J1EilAULcUlDNJ4+Nj2XGdqQ==
X-Google-Smtp-Source: AGHT+IHzBXZs+YJ8TkWqRQI9XEsAiVcrEHmDzrWZ44dgzeswOG6ikQUy9XoxFZFgzqEWxPiLA2bgpg==
X-Received: by 2002:a17:907:7f25:b0:ade:3a1b:88a4 with SMTP id a640c23a62f3a-adfad309555mr1931868066b.17.1750280822982;
        Wed, 18 Jun 2025 14:07:02 -0700 (PDT)
Received: from jaz-virt.c.googlers.com.com (104.112.91.34.bc.googleusercontent.com. [34.91.112.104])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-adec892b216sm1112822266b.135.2025.06.18.14.07.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 14:07:02 -0700 (PDT)
From: Grzegorz Jaszczyk <jaszczyk@chromium.org>
To: tglx@linutronix.de,
	robh@kernel.org
Cc: mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	x86@kernel.org,
	hpa@zytor.com,
	saravanak@google.com,
	dmaluka@chromium.org,
	bgrzesik@google.com,
	jaszczyk@google.com,
	ilpo.jarvinen@linux.intel.com,
	usamaarif642@gmail.com,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	tnowicki@google.com,
	mazurekm@google.com,
	vineethrp@google.com,
	rppt@kernel.org,
	agordeev@linux.ibm.com,
	dyoung@redhat.com,
	myrrhperiwinkle@qtmlabs.xyz,
	guoweikang.kernel@gmail.com,
	kirill.shutemov@linux.intel.com,
	akpm@linux-foundation.org,
	joel.granados@kernel.org,
	sourabhjain@linux.ibm.com
Subject: [PATCH v3 RESEND 2/2] x86/e820: reserve corresponding to DT reserved-memory nomap region
Date: Wed, 18 Jun 2025 21:06:28 +0000
Message-ID: <20250618210628.2635891-3-jaszczyk@chromium.org>
X-Mailer: git-send-email 2.50.0.rc2.701.gf1e915cc24-goog
In-Reply-To: <20250618210628.2635891-1-jaszczyk@chromium.org>
References: <20250618210628.2635891-1-jaszczyk@chromium.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Grzegorz Jaszczyk <jaszczyk@google.com>

The reserved-memory nomap region shouldn't be mapped and registered as an
IORESOURCE_SYSTEM_RAM resource. On the x86 platform the resource tree
map is built based on e820 entries (see e820__reserve_resources).
Aligning DT reserved-memory nomap region by adding corresponding e820
reserved range will allow x86 to build appropriate resource tree.
Similar thing is done during e.g. arm64 resource tree creation (see:
arm64's request_standard_resources()).

Adding a corresponding e820 entry also allows other parts of x86 early
kernel initialization to rely on it. E.g. e820__setup_pci_gap based on
the gap in the e820 memory table picks space and passes to the PCI
subsystem.  Without adding corresponding e820 reserved entry, DT
reserved memory nomap region could conflict with such region assigned
later to PCI subsystem.

Additionally updating e820_table in this stage of the x86 setup seems
safe since it is performed before mentioned e820__reserve_resources and
e820__setup_pci_gap and there are also other functions, which updates
e820 table on the later stage of early x86 setup such as early_quirks()
and efi_arch_mem_reserve() (used by efi_esrt_init).

Signed-off-by: Grzegorz Jaszczyk <jaszczyk@google.com>
---
 arch/x86/include/asm/e820/api.h |  1 +
 arch/x86/kernel/e820.c          | 19 +++++++++++++++++++
 arch/x86/kernel/setup.c         |  2 ++
 3 files changed, 22 insertions(+)

diff --git a/arch/x86/include/asm/e820/api.h b/arch/x86/include/asm/e820/api.h
index c83645d5b2a8..a3b39ec6c3b4 100644
--- a/arch/x86/include/asm/e820/api.h
+++ b/arch/x86/include/asm/e820/api.h
@@ -28,6 +28,7 @@ extern unsigned long e820__end_of_low_ram_pfn(void);
 
 extern u64  e820__memblock_alloc_reserved(u64 size, u64 align);
 extern void e820__memblock_setup(void);
+extern void e820__reserve_nomap_region(void);
 
 extern void e820__finish_early_params(void);
 extern void e820__reserve_resources(void);
diff --git a/arch/x86/kernel/e820.c b/arch/x86/kernel/e820.c
index c3acbd26408b..4e76e0ea3823 100644
--- a/arch/x86/kernel/e820.c
+++ b/arch/x86/kernel/e820.c
@@ -1330,3 +1330,22 @@ void __init e820__memblock_setup(void)
 
 	memblock_dump_all();
 }
+
+void __init e820__reserve_nomap_region(void)
+{
+	struct memblock_region *region;
+	resource_size_t start;
+
+	for_each_mem_region(region) {
+		if (memblock_is_nomap(region)) {
+			start = __pfn_to_phys(memblock_region_reserved_base_pfn(region));
+
+			/*
+			 * Add corresponding e820 region and let
+			 * e820__update_table sanitize e820 map
+			 */
+			e820__range_add(start, region->size, E820_TYPE_RESERVED);
+			e820__update_table_print();
+		}
+	}
+}
diff --git a/arch/x86/kernel/setup.c b/arch/x86/kernel/setup.c
index 1c6fcb0bc65e..27969c529c3f 100644
--- a/arch/x86/kernel/setup.c
+++ b/arch/x86/kernel/setup.c
@@ -1071,6 +1071,8 @@ void __init setup_arch(char **cmdline_p)
 
 	x86_flattree_get_config();
 
+	e820__reserve_nomap_region();
+
 	/*
 	 * Needs to run after memblock setup because it needs the physical
 	 * memory size.
-- 
2.50.0.rc2.701.gf1e915cc24-goog

