Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FF85204840
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 20:08:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746475716; cv=none; b=eLGdzfYHRAILNUk/FJMylFI3+gZP9z5diwYfJg/7jDIejhyHzGyqZ2heLKbxOHTqxBy71lnmV9T+7O4PQaDde9zz9EiggKD9d3CwrMz0FaXvJWm5wVQpGvsyultEl8YAXVXVDUqwchwpWrk5L7aO8yz+0uUBm0eUF2hfYykNgI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746475716; c=relaxed/simple;
	bh=1KzQAdzt6kozgctVLqMUI+0YIdwgkoZ9QgFaIIjRSbE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=M+letH0dSkqhZgaNUgbLoUa88jI4/QBvYDtDW7493B8u78EMFwrGsN5qNbi3wqi4RYudVKx5Rebq0MH25wriNjCoh+fPOw0Zl7yqDXGAl4bvkIJ5+P/zeJcCDgcloCgum3LtMB4d9UxCNPoZ2neXt4zUmK47EX9BPEHK/HWQRPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--changyuanl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=oZiZeZng; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--changyuanl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="oZiZeZng"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-224364f2492so44482615ad.3
        for <linux-kernel@vger.kernel.org>; Mon, 05 May 2025 13:08:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746475713; x=1747080513; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=oOuRgIeoWvJ+xJkqB+IUVGx6fHLCdoleXxRua1kYdv4=;
        b=oZiZeZng1O6abYgkRBb2yDSOBu1crc8JUScQpT+ThWyZC+xSEeYZG1bskcHh4L7cdO
         bVU6B1Aidy2gg0hwUhe57cYD5CP4pQ3bc2Gl7Il8mXNdQ/j+f5ffURb3+28znr1nARgA
         7gXJM35dd3l7cB7QwthjC8IJuVmq1e3b9eW435xK6GFuSXK9etjRso1n3+PYq1YNZ+j4
         3sEi1AJGBNEDV5PMElsxSQ6WM/SoEvfhnpKjuRdDcNvyNzc92p3L6PbINvU49VG20jdc
         4mvbwu3ZnfKEmB1O0FDPXUJR2lze2adoHwy52xEqFhCYfOQiLZxvxalIn2t50R/We8nA
         cL3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746475713; x=1747080513;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oOuRgIeoWvJ+xJkqB+IUVGx6fHLCdoleXxRua1kYdv4=;
        b=Kfx+uK5vjRoJZPpQbP0xBmmvulgGp3nN35kWD3kjeiHZUv/G6j6sc98N+F+yLJCdMH
         YEnq1dyyHxyF9fpLND2hdy/uEm3z5Npslw5Wy7y7hyAesJ2DdovrUdf25FsiQZAPyxyE
         ZtvvyfE6md2CmBGoWFaEnLt/GKoPTb//FL9d3K1SRCzIZM4kV++aJvYeYDipF1YNvwtE
         jTv/EuF62IN2xdTPxiEYSsoFkV2IGjgkEMyRzY9sWXD1n7UOl6LQAryOTIBAFCa+VLL3
         pZ18/I6VO6HsuGmXKy4j4aef6cBvlsa6I/pnNHlWYbCxpYAbGTSb9UsdsLrEa+ZOeDT2
         G2Rg==
X-Forwarded-Encrypted: i=1; AJvYcCXieW/Bn150LczoMLakwDbHMuB0BrteJGicjDLoeszz4Zetz9FZFvGI7EksLYA2oOqrCO9k8JxSwmyMe3g=@vger.kernel.org
X-Gm-Message-State: AOJu0YwqKJVWYevRX0ErCLwH3LuIN3ECjkipYprAxFJLCF7XOdG3zeV8
	rAkgYcv2OUECVl8h0sbJ4j4Q7c7tcAsxRX5VaGmgsFxmhHVRe9fVgt5ehmlPJJamvsx1z4SEAv+
	sTRG56DHZ4nOjfceb+A==
X-Google-Smtp-Source: AGHT+IGAxfh3fReuw49sEBnCIqEgZnEB4d1Kz9/LHzQ3CYJt6UkvcZ+t0jrC2mykwUxbQTB6d5Dqd6LW9byg1ZNs
X-Received: from plkp1.prod.google.com ([2002:a17:902:6b81:b0:220:ea57:34e3])
 (user=changyuanl job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:902:f648:b0:224:93e:b5d7 with SMTP id d9443c01a7336-22e32eff19bmr9877065ad.34.1746475713621;
 Mon, 05 May 2025 13:08:33 -0700 (PDT)
Date: Mon,  5 May 2025 13:07:45 -0700
In-Reply-To: <20250501225425.635167-15-changyuanl@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250501225425.635167-15-changyuanl@google.com>
X-Mailer: git-send-email 2.49.0.967.g6a0df3ecc3-goog
Message-ID: <20250505200745.1975264-1-changyuanl@google.com>
Subject: Re: [PATCH v7 14/18] x86/boot: make sure KASLR does not step over KHO
 preserved memory
From: Changyuan Lyu <changyuanl@google.com>
To: changyuanl@google.com
Cc: akpm@linux-foundation.org, anthony.yznaga@oracle.com, arnd@arndb.de, 
	ashish.kalra@amd.com, benh@kernel.crashing.org, bp@alien8.de, 
	catalin.marinas@arm.com, corbet@lwn.net, dave.hansen@linux.intel.com, 
	devicetree@vger.kernel.org, dwmw2@infradead.org, ebiederm@xmission.com, 
	graf@amazon.com, hpa@zytor.com, jgowans@amazon.com, kexec@lists.infradead.org, 
	krzk@kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	luto@kernel.org, mark.rutland@arm.com, mingo@redhat.com, 
	pasha.tatashin@soleen.com, pbonzini@redhat.com, peterz@infradead.org, 
	ptyadav@amazon.de, robh@kernel.org, rostedt@goodmis.org, rppt@kernel.org, 
	saravanak@google.com, skinsburskii@linux.microsoft.com, tglx@linutronix.de, 
	thomas.lendacky@amd.com, will@kernel.org, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Andrew,

Based on Dave's feedback above, could you please take the following
fix and squash it with "x86/boot: make sure KASLR does not step over
KHO preserved memory" with the updated commit message in mm-unstable?

Thank you very much!

Best,
Changyuan

---- 8< ----

From 464b5750c55f978b47da242f50ec7dbcbac1948c Mon Sep 17 00:00:00 2001
From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Date: Mon, 5 May 2025 11:29:23 -0700
Subject: [PATCH] fixup! x86/boot: make sure KASLR does not step over KHO
 preserved memory

During kexec handover (KHO) memory contains data that should be
preserved and this data would be consumed by kexec'ed kernel.

To make sure that the preserved memory is not overwritten, KHO uses
"scratch regions" to bootstrap kexec'ed kernel. These regions are
guaranteed to not have any memory that KHO would preserve and are used as
the only memory the kernel sees during the early boot.

The scratch regions are passed in the setup_data by the first kernel with
other KHO parameters. If the setup_data contains the KHO parameters, limit
randomization to scratch areas only to make sure preserved memory won't get
overwritten.

Since all the pointers in setup_data are represented by u64, they require
double casting (first to unsigned long and then to the actual pointer type)
to compile on 32-bits. This looks goofy out of context, but it is
unfortunately the way that this is handled across the tree. There are at
least a dozen instances of casting like this.

Signed-off-by: Alexander Graf <graf@amazon.com>
Co-developed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
Co-developed-by: Changyuan Lyu <changyuanl@google.com>
Signed-off-by: Changyuan Lyu <changyuanl@google.com>
---
 arch/x86/boot/compressed/kaslr.c | 26 ++++++++++++--------------
 1 file changed, 12 insertions(+), 14 deletions(-)

diff --git a/arch/x86/boot/compressed/kaslr.c b/arch/x86/boot/compressed/kaslr.c
index 25de8c3e17cdb..3b0948ad449f9 100644
--- a/arch/x86/boot/compressed/kaslr.c
+++ b/arch/x86/boot/compressed/kaslr.c
@@ -764,25 +764,26 @@ static void process_e820_entries(unsigned long minimum,
  * If KHO is active, only process its scratch areas to ensure we are not
  * stepping onto preserved memory.
  */
-#ifdef CONFIG_KEXEC_HANDOVER
 static bool process_kho_entries(unsigned long minimum, unsigned long image_size)
 {
 	struct kho_scratch *kho_scratch;
 	struct setup_data *ptr;
+	struct kho_data *kho;
 	int i, nr_areas = 0;

-	ptr = (struct setup_data *)boot_params_ptr->hdr.setup_data;
+	if (!IS_ENABLED(CONFIG_KEXEC_HANDOVER))
+		return false;
+
+	ptr = (struct setup_data *)(unsigned long)boot_params_ptr->hdr.setup_data;
 	while (ptr) {
 		if (ptr->type == SETUP_KEXEC_KHO) {
-			struct kho_data *kho = (struct kho_data *)ptr->data;
-
-			kho_scratch = (void *)kho->scratch_addr;
+			kho = (struct kho_data *)(unsigned long)ptr->data;
+			kho_scratch = (void *)(unsigned long)kho->scratch_addr;
 			nr_areas = kho->scratch_size / sizeof(*kho_scratch);
-
 			break;
 		}

-		ptr = (struct setup_data *)ptr->next;
+		ptr = (struct setup_data *)(unsigned long)ptr->next;
 	}

 	if (!nr_areas)
@@ -801,13 +802,6 @@ static bool process_kho_entries(unsigned long minimum, unsigned long image_size)

 	return true;
 }
-#else
-static inline bool process_kho_entries(unsigned long minimum,
-				       unsigned long image_size)
-{
-	return false;
-}
-#endif

 static unsigned long find_random_phys_addr(unsigned long minimum,
 					   unsigned long image_size)
@@ -824,6 +818,10 @@ static unsigned long find_random_phys_addr(unsigned long minimum,
 		return 0;
 	}

+	/*
+	 * During kexec handover only process KHO scratch areas that are known
+	 * not to contain any data that must be preserved.
+	 */
 	if (!process_kho_entries(minimum, image_size) &&
 	    !process_efi_entries(minimum, image_size))
 		process_e820_entries(minimum, image_size);
--
2.49.0.967.g6a0df3ecc3-goog
