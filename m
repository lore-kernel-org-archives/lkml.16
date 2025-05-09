Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B72DA27587B
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 07:47:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746776841; cv=none; b=hjrGoHATRE92oadwBhVu1F9GjyNgBjox8fJVFbmMBpx939SIAzNocuz23ycWjnYiZGP7AIgs4COyU/9L2sMM+JDDeJFNB5i0pGHDvYtwxnFtmtKWmI2VBmJYOmF0HX4DPFYAwOPKjUo3M3VpOz17OG1cZqnV/Uix6O0fwP5shgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746776841; c=relaxed/simple;
	bh=VNknyeUt8cJ6f4wd2Ppf5nWXa2ZCYQ1F//Zjgt2ZeTo=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=OKyUillUQIVGUElGK3VSX3Zxo6AZbflrxvSjM1MqoTZ/Xx29LirfMOumH572Veqr+7Fl4OehraUiW5lp9AR8KYSFeXxn9btrtsxyJEvrVsE/pxogiE8YqiGt2jEcj+hG92DqHA7Js10fsBQd6d75Y4JraAdMNNRFzQhIKC/HFyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--changyuanl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=lG9ge3Ej; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--changyuanl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="lG9ge3Ej"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-22c31b55ac6so25324125ad.0
        for <linux-kernel@vger.kernel.org>; Fri, 09 May 2025 00:47:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746776839; x=1747381639; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=/uG6GiCi+k4QeVIeYPGdrcHOaMWapGzdHMs1nMnrsrc=;
        b=lG9ge3Ej+9pkz+rV4yVQ4cnVhgvbElRBoPEq0B2NEqG5AOF7ZCwqMxSe4iVYcdOAyI
         9FTkc1LO0Q9nwVfmz046EnSa5VdhL2j3Tc1AfCwzQ3tW0YX7C1SXtJPMHUTtpsbClUrX
         ydyWRyGw1ShtjBjG2HVIdXQFvKBOgXYR4/MHt1gRd18gGZcLRNmDzrFHGNl1o1yD8PWM
         6yt89zNXV2NjiV2OZYFMsT4fauj5/4cDGWty9OJz9my/BrExD6/MGEx5N1UzYklWQjH0
         BBFJvKkyle6V1HUslxK37f/ObCG+J//NMqxqZ870ag5WXgVVLsDyTUQJfFAPrtgY5vbT
         mlog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746776839; x=1747381639;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/uG6GiCi+k4QeVIeYPGdrcHOaMWapGzdHMs1nMnrsrc=;
        b=Fck4vES7gbB7B5fughThtV+B1m839IlvVFRqNhAZdSCOdalkzKzq/NiLkVh4/y2NDN
         lPUzr0HbZuloOX9u/fSva7O4YLnQsqRkIhWwD7wttjmVgJY9ciZbaFFdI7EXteeAbcGA
         /6rcBZMtSz5C+E+1fYGRiu4WCXeNOFliSSEgjhyD+kq1ukCXRGBBzzohpk8G1k4lAPs4
         W1UHI5ckR+rroH75m2z/knWnEM+ZWmpJwZlCIft6b38JuZH4zr/E5S9DxTKD1hdbxMcY
         gQFGoXq7IVuBHN64S1/0f3Nsfkbr/4zUsUU/MVKC3mBxVk0x09AEDZkIFV210sLzWsAV
         K9Ww==
X-Forwarded-Encrypted: i=1; AJvYcCVTwAS54WfDip5SZWTAJpz6x1kR8SUf2gWmcJuNcAU6MBjrOzClhUdC3bO43qD0Wiz2M+ShRbridd+cIIs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyo/0rGiWs7tMQe2W0vldnIwidhD4641LlKjl0W9zRqRmLuevcD
	C/BGxhFf6Tm3f2Is8NmKWbRIr/jX5bx83sGkITXw41Mshtu+RwqjNuF417ixfJmp+JYx/IU68Wz
	+uo0567zw57jxBCgfmA==
X-Google-Smtp-Source: AGHT+IEtYvgMQD/fc6wFPgnt6KgYb8JeNInbNpZgGejD3McBZNxXkmne49Y8Hn9OW1r//Ao+vz75n4rLQVAMCRw5
X-Received: from plnr4.prod.google.com ([2002:a17:903:1904:b0:22e:4a61:5545])
 (user=changyuanl job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:903:3ba7:b0:224:c76:5e57 with SMTP id d9443c01a7336-22fc8e99d3fmr26734465ad.39.1746776839015;
 Fri, 09 May 2025 00:47:19 -0700 (PDT)
Date: Fri,  9 May 2025 00:46:31 -0700
In-Reply-To: <20250509074635.3187114-1-changyuanl@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250509074635.3187114-1-changyuanl@google.com>
X-Mailer: git-send-email 2.49.0.1015.ga840276032-goog
Message-ID: <20250509074635.3187114-14-changyuanl@google.com>
Subject: [PATCH v8 13/17] x86/boot: make sure KASLR does not step over KHO
 preserved memory
From: Changyuan Lyu <changyuanl@google.com>
To: akpm@linux-foundation.org, linux-kernel@vger.kernel.org
Cc: anthony.yznaga@oracle.com, arnd@arndb.de, ashish.kalra@amd.com, 
	benh@kernel.crashing.org, bp@alien8.de, catalin.marinas@arm.com, 
	corbet@lwn.net, dave.hansen@linux.intel.com, devicetree@vger.kernel.org, 
	dwmw2@infradead.org, ebiederm@xmission.com, graf@amazon.com, hpa@zytor.com, 
	jgowans@amazon.com, kexec@lists.infradead.org, krzk@kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
	linux-mm@kvack.org, luto@kernel.org, mark.rutland@arm.com, mingo@redhat.com, 
	pasha.tatashin@soleen.com, pbonzini@redhat.com, peterz@infradead.org, 
	ptyadav@amazon.de, robh@kernel.org, rostedt@goodmis.org, rppt@kernel.org, 
	saravanak@google.com, skinsburskii@linux.microsoft.com, tglx@linutronix.de, 
	thomas.lendacky@amd.com, will@kernel.org, x86@kernel.org, 
	Changyuan Lyu <changyuanl@google.com>
Content-Type: text/plain; charset="UTF-8"

From: Alexander Graf <graf@amazon.com>

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
 arch/x86/boot/compressed/kaslr.c | 50 +++++++++++++++++++++++++++++++-
 1 file changed, 49 insertions(+), 1 deletion(-)

diff --git a/arch/x86/boot/compressed/kaslr.c b/arch/x86/boot/compressed/kaslr.c
index f03d59ea6e40f..3b0948ad449f9 100644
--- a/arch/x86/boot/compressed/kaslr.c
+++ b/arch/x86/boot/compressed/kaslr.c
@@ -760,6 +760,49 @@ static void process_e820_entries(unsigned long minimum,
 	}
 }
 
+/*
+ * If KHO is active, only process its scratch areas to ensure we are not
+ * stepping onto preserved memory.
+ */
+static bool process_kho_entries(unsigned long minimum, unsigned long image_size)
+{
+	struct kho_scratch *kho_scratch;
+	struct setup_data *ptr;
+	struct kho_data *kho;
+	int i, nr_areas = 0;
+
+	if (!IS_ENABLED(CONFIG_KEXEC_HANDOVER))
+		return false;
+
+	ptr = (struct setup_data *)(unsigned long)boot_params_ptr->hdr.setup_data;
+	while (ptr) {
+		if (ptr->type == SETUP_KEXEC_KHO) {
+			kho = (struct kho_data *)(unsigned long)ptr->data;
+			kho_scratch = (void *)(unsigned long)kho->scratch_addr;
+			nr_areas = kho->scratch_size / sizeof(*kho_scratch);
+			break;
+		}
+
+		ptr = (struct setup_data *)(unsigned long)ptr->next;
+	}
+
+	if (!nr_areas)
+		return false;
+
+	for (i = 0; i < nr_areas; i++) {
+		struct kho_scratch *area = &kho_scratch[i];
+		struct mem_vector region = {
+			.start = area->addr,
+			.size = area->size,
+		};
+
+		if (process_mem_region(&region, minimum, image_size))
+			break;
+	}
+
+	return true;
+}
+
 static unsigned long find_random_phys_addr(unsigned long minimum,
 					   unsigned long image_size)
 {
@@ -775,7 +818,12 @@ static unsigned long find_random_phys_addr(unsigned long minimum,
 		return 0;
 	}
 
-	if (!process_efi_entries(minimum, image_size))
+	/*
+	 * During kexec handover only process KHO scratch areas that are known
+	 * not to contain any data that must be preserved.
+	 */
+	if (!process_kho_entries(minimum, image_size) &&
+	    !process_efi_entries(minimum, image_size))
 		process_e820_entries(minimum, image_size);
 
 	phys_addr = slots_fetch_random();
-- 
2.49.0.1015.ga840276032-goog

