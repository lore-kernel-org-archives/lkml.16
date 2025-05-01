Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1C2527C84E
	for <linux-kernel@vger.kernel.org>; Thu,  1 May 2025 22:55:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746140139; cv=none; b=FFMGqO0PbadbJXMgWyz3jskK+xQBTFIUoswFMgOUMXZ5Go+HCnmpAkZUoO/ldDHwPLm41+R2P1kLoN7TphwfAjmasRUKYIxtAaBBDspy8zy7pVrUVuf9bqRql+DePQsGa3wO/uveB9XaS2WZPVhRQy4VM72hWnWWSmIOOoNfln8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746140139; c=relaxed/simple;
	bh=r0t8dbEcMqv1w/C59nenzPGusmjzB82b0L1GSAI+Lbo=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=jnJ8K3IcOSYvgi2XhPh44smNQRfWpFv6gusV8HUSomdf9lpt4UDwIjkiqqPeJ93WrlU2umRVL8epeXZKwJzqAO8SH1uii2mWPi5tajLW5yOjAjMMoQorzOlQX2Jg2BURO0fxNaXmXAox7DGKjk0ZM1wxanZEE271yq8vWrlYXsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--changyuanl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Kkqmp5kz; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--changyuanl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Kkqmp5kz"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-2240a960f9cso14493015ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 01 May 2025 15:55:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746140137; x=1746744937; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=QfJbN5pyiZqNm6v1VamUb2ZbseG+vyr/qmtYL/UOqAw=;
        b=Kkqmp5kzwIkTckP4DgfS9rdNx/nYdC/+twpBHoUoDV95Xgs6mcBFq+0oWROdvhuaCU
         NvEbEWqx5KFCCsGxdyaPXhjv9375UOpyunTL0q0XIukN8VfCxc7uc2MMmH1wMaPOIH6n
         YLpy8mxyJRM4V4wXYrIDigFL64nvhSW7ZXrONePxxUCPpCG5H6mT1nh5HaWzvYUbCTrc
         mfFyHz/lMG2iDeSfa4y+YKM1Trp6woUWiQyP8McbTld8K6gePagVejRSTY4vzeh1+6cQ
         Uqs5b0meB2fIBt71vwt6uP+8TsSTW7w/grGzC74hIhQ6KSw5kF6603l7r+zMW2uPMEQ/
         bjHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746140137; x=1746744937;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QfJbN5pyiZqNm6v1VamUb2ZbseG+vyr/qmtYL/UOqAw=;
        b=M5HyLmvvDcBV4WcNFYOcXyKxT0g0Z2Hf0lx4T+OWimBGInKtJFkos86+/CF1RSngi6
         /Pi5qGpB/9q923KJtnhI5yyQ4ySvJnWm2ctZmGfKq/Lna7MZ2RPAJ8GrZhAjNY6BHC2b
         GLLkwdte/pVdOvZtbFT7iLOrLFmcTeTY68O4wLKFkDOLviK+LE/A8Dl9UYIl0AG0FCQ+
         kXKQVEotgwEWaK8XQM2swIORBSPGpFI+Qk7UjtZm3dgNOMaOL65rqsDIWiEDCPt8F9l9
         2PQfy45N1opXzt3i48sruuzMuivCm2utk9T7NqyP9OvRyNSe4w1mmp3DgvuSYBAOsRoc
         dcdQ==
X-Gm-Message-State: AOJu0Yw64P4hXHfeZtTF9eLMxlB2MiRlxgs1bvuycMN3qTUU+va551nf
	3D5vtizFVNvtINvYIf19heiK71lCP9h/tqPYh6v8OJSzItL34gjH/n1XCXDjLDhNwmO9jkOEaof
	YSZLO5k5xFdPpSC4BlczWXO2VkLwiyBXQzrdZAV2iAlH5j7CTMeLES6urTtwujXfvuIkPRiYwm/
	SkiYvFOuqRPLOWUaU2Un96N5M8FAwWx91RJbbWRqg32qoVeuu41chBf9KQngbFfQ==
X-Google-Smtp-Source: AGHT+IEti7Jl7kPZOBgR2farF6AzrUQ71NZAgms5bozMIxOrugD7cn53XbT5cnCVAQHZeRCBz32iqnLauoNpF8Ul
X-Received: from plac4.prod.google.com ([2002:a17:902:c2c4:b0:224:2ae9:b271])
 (user=changyuanl job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:903:22d0:b0:22d:e458:96a5 with SMTP id d9443c01a7336-22e103d0471mr10540035ad.38.1746140136868;
 Thu, 01 May 2025 15:55:36 -0700 (PDT)
Date: Thu,  1 May 2025 15:54:21 -0700
In-Reply-To: <20250501225425.635167-1-changyuanl@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250501225425.635167-1-changyuanl@google.com>
X-Mailer: git-send-email 2.49.0.906.g1f30a19c02-goog
Message-ID: <20250501225425.635167-15-changyuanl@google.com>
Subject: [PATCH v7 14/18] x86/boot: make sure KASLR does not step over KHO
 preserved memory
From: Changyuan Lyu <changyuanl@google.com>
To: linux-kernel@vger.kernel.org
Cc: changyuanl@google.com, akpm@linux-foundation.org, 
	anthony.yznaga@oracle.com, arnd@arndb.de, ashish.kalra@amd.com, 
	benh@kernel.crashing.org, bp@alien8.de, catalin.marinas@arm.com, 
	corbet@lwn.net, dave.hansen@linux.intel.com, devicetree@vger.kernel.org, 
	dwmw2@infradead.org, ebiederm@xmission.com, graf@amazon.com, hpa@zytor.com, 
	jgowans@amazon.com, kexec@lists.infradead.org, krzk@kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
	linux-mm@kvack.org, luto@kernel.org, mark.rutland@arm.com, mingo@redhat.com, 
	pasha.tatashin@soleen.com, pbonzini@redhat.com, peterz@infradead.org, 
	ptyadav@amazon.de, robh@kernel.org, rostedt@goodmis.org, rppt@kernel.org, 
	saravanak@google.com, skinsburskii@linux.microsoft.com, tglx@linutronix.de, 
	thomas.lendacky@amd.com, will@kernel.org, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"

From: Alexander Graf <graf@amazon.com>

KHO uses "scratch regions" to bootstrap a kexec'ed kernel. These regions are
guaranteed to not have any memory that KHO would preserve.

Teach KASLR in decompression code to only consider these scratch regions
when KHO is enabled to make sure preserved memory won't get overwritten.

Signed-off-by: Alexander Graf <graf@amazon.com>
Co-developed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
Co-developed-by: Changyuan Lyu <changyuanl@google.com>
Signed-off-by: Changyuan Lyu <changyuanl@google.com>
---
 arch/x86/boot/compressed/kaslr.c | 52 +++++++++++++++++++++++++++++++-
 1 file changed, 51 insertions(+), 1 deletion(-)

diff --git a/arch/x86/boot/compressed/kaslr.c b/arch/x86/boot/compressed/kaslr.c
index f03d59ea6e40f..25de8c3e17cdb 100644
--- a/arch/x86/boot/compressed/kaslr.c
+++ b/arch/x86/boot/compressed/kaslr.c
@@ -760,6 +760,55 @@ static void process_e820_entries(unsigned long minimum,
 	}
 }
 
+/*
+ * If KHO is active, only process its scratch areas to ensure we are not
+ * stepping onto preserved memory.
+ */
+#ifdef CONFIG_KEXEC_HANDOVER
+static bool process_kho_entries(unsigned long minimum, unsigned long image_size)
+{
+	struct kho_scratch *kho_scratch;
+	struct setup_data *ptr;
+	int i, nr_areas = 0;
+
+	ptr = (struct setup_data *)boot_params_ptr->hdr.setup_data;
+	while (ptr) {
+		if (ptr->type == SETUP_KEXEC_KHO) {
+			struct kho_data *kho = (struct kho_data *)ptr->data;
+
+			kho_scratch = (void *)kho->scratch_addr;
+			nr_areas = kho->scratch_size / sizeof(*kho_scratch);
+
+			break;
+		}
+
+		ptr = (struct setup_data *)ptr->next;
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
+#else
+static inline bool process_kho_entries(unsigned long minimum,
+				       unsigned long image_size)
+{
+	return false;
+}
+#endif
+
 static unsigned long find_random_phys_addr(unsigned long minimum,
 					   unsigned long image_size)
 {
@@ -775,7 +824,8 @@ static unsigned long find_random_phys_addr(unsigned long minimum,
 		return 0;
 	}
 
-	if (!process_efi_entries(minimum, image_size))
+	if (!process_kho_entries(minimum, image_size) &&
+	    !process_efi_entries(minimum, image_size))
 		process_e820_entries(minimum, image_size);
 
 	phys_addr = slots_fetch_random();
-- 
2.49.0.906.g1f30a19c02-goog

