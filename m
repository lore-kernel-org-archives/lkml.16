Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3CC5274656
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 07:47:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746776829; cv=none; b=leTbsMkYpl5pzdReGc2uk5ipMFSEP9Cr/vtC7kR6uLeNnZLzSgaMcNIMj8bfrW9VjDPcfqxlGwf8//H/dk991IZ+S1Yo2Jr71ab4zBn/r/8aKPgoawnww6PV30L3pB3EAv/qm9WzPSCxDZcAKM0KR+GRCQrU9C0n6jrRTWnC/rA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746776829; c=relaxed/simple;
	bh=kzUATPILFe7z370u+VmpSzNBsFJlTzgs6nhAia9+alw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=jBdJRUbna5Rh0Us2oKaxkHlI1aGm4UFlgWVve6WetgkHT7RCnWcKILv6i0UyODKofp8NGFtN2Kh5l0TPv/qsIEOM2/kWLwEz6agEtKhw0laj7fWqC7RjZSxLIZW7E1aDqyUcEWhP4rQuKBtQx4KM+XBQy7USXTIbQMC6fCVFlVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--changyuanl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ekjb+IiT; arc=none smtp.client-ip=209.85.215.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--changyuanl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ekjb+IiT"
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-af8e645a1d1so1297876a12.3
        for <linux-kernel@vger.kernel.org>; Fri, 09 May 2025 00:47:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746776827; x=1747381627; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=rJPeIElnNt/I3/MaK5uh0cldn9yJJ+y5OnW6ddziJAo=;
        b=ekjb+IiTizS4BqvOLhTHAnLhFt/UtMLZCsZEsumOPOwVK7JQNKW7NnwNB/x2nDV3up
         qXYi0qzFTF5A1c74Bv6rc+7jK3/ZHwolrPAmcM2kLwS7ac0ZovmU2/38NJZRpEHlwCVO
         d1QbsmphxlzFsfFhZR0JxbSfwNpty4LbAqfsVSTTkUpFPKCM0D/FXW97gNcPF5Iq7jlb
         9TTZTzaNs9ijVb3l9jiu3HJ3HhCxIXpRBPepEDM0HVtKcsQfIPJTDwblnQCkOnLoP4Cg
         O+N62x4uMeo+hZif3zzmjUeBC/tTlS18zHdmgRewLMunPa4+LvNV6ftC6mKzo9UrnfvG
         tvFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746776827; x=1747381627;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rJPeIElnNt/I3/MaK5uh0cldn9yJJ+y5OnW6ddziJAo=;
        b=TP6adf7G73Xt7X5yk7jmZh8gQO2b+n3r8VEYF0nUSk5j6SC9qx+6ICh7cDJJDTUvHM
         ctuCHox/mdUoBlQJkMqpQJQDXFeh3PaNL+pgF7QonI9SUjjBkmO6CW/NBfqutjAwWrY3
         NiRLd+WE1z4XLCLtCRCWsBNhVLzVVSr9HvEHXn4JmRdxCh2UfibvPK++dPlSUXBhl7Iq
         RzyFEKkspXjELRvtfbcW1PLxtKngHLW78U8ikmSwS315jLbqnyybJnJlfoCT64ei4El4
         j/ootwadGGSqG8hH/3JWe/MPSPAcSvvOb5SOdrJ9JS0hoph9z7SzgO4egIZ2JXqXi6iJ
         pdQg==
X-Forwarded-Encrypted: i=1; AJvYcCUgVqa3d1/WTR7NUFQx9qxQyhw+Cqano0fk+ZUW+jaX6M865WyINb1Fj7F89gLCEaSGtsoaoZSuZOBa7p4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxDLXKBK+770kEatvLvQZ6AMZnu74klcKPUHTtz4KrCdwhTg1D8
	DHsoTjw1TASmYJFs+YxKYDUsEd5/0XU+e1IN2n0VAjR57u+O56Yre+j+5oDtLPCnyzd44MGy+Yu
	k1buiux3RQ3NRjmCzyg==
X-Google-Smtp-Source: AGHT+IEK1/WlmP38MYP4hEes8GqKaqWx3jiFruF23mNJt24+iXk5dMi5uOZdu7gymuTIRK+YGmcQLoBz9uRHRSQG
X-Received: from pga10.prod.google.com ([2002:a05:6a02:4f8a:b0:b20:c9:a993])
 (user=changyuanl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a20:1582:b0:1f5:79c4:5da0 with SMTP id adf61e73a8af0-215abc16c45mr3639959637.31.1746776826867;
 Fri, 09 May 2025 00:47:06 -0700 (PDT)
Date: Fri,  9 May 2025 00:46:25 -0700
In-Reply-To: <20250509074635.3187114-1-changyuanl@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250509074635.3187114-1-changyuanl@google.com>
X-Mailer: git-send-email 2.49.0.1015.ga840276032-goog
Message-ID: <20250509074635.3187114-8-changyuanl@google.com>
Subject: [PATCH v8 07/17] kexec: add KHO support to kexec file loads
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

Kexec has 2 modes: A user space driven mode and a kernel driven mode.
For the kernel driven mode, kernel code determines the physical
addresses of all target buffers that the payload gets copied into.

With KHO, we can only safely copy payloads into the "scratch area".
Teach the kexec file loader about it, so it only allocates for that
area. In addition, enlighten it with support to ask the KHO subsystem
for its respective payloads to copy into target memory. Also teach the
KHO subsystem how to fill the images for file loads.

Signed-off-by: Alexander Graf <graf@amazon.com>
Co-developed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
Co-developed-by: Changyuan Lyu <changyuanl@google.com>
Signed-off-by: Changyuan Lyu <changyuanl@google.com>
---
 include/linux/kexec.h   |  5 +++
 kernel/kexec_file.c     | 13 ++++++++
 kernel/kexec_handover.c | 67 +++++++++++++++++++++++++++++++++++++++++
 kernel/kexec_internal.h | 16 ++++++++++
 4 files changed, 101 insertions(+)

diff --git a/include/linux/kexec.h b/include/linux/kexec.h
index c8971861521a5..075255de81543 100644
--- a/include/linux/kexec.h
+++ b/include/linux/kexec.h
@@ -371,6 +371,11 @@ struct kimage {
 	size_t ima_buffer_size;
 #endif
 
+	struct {
+		struct kexec_segment *scratch;
+		phys_addr_t fdt;
+	} kho;
+
 	/* Core ELF header buffer */
 	void *elf_headers;
 	unsigned long elf_headers_sz;
diff --git a/kernel/kexec_file.c b/kernel/kexec_file.c
index fba686487e3b5..77758c5331229 100644
--- a/kernel/kexec_file.c
+++ b/kernel/kexec_file.c
@@ -253,6 +253,11 @@ kimage_file_prepare_segments(struct kimage *image, int kernel_fd, int initrd_fd,
 	/* IMA needs to pass the measurement list to the next kernel. */
 	ima_add_kexec_buffer(image);
 
+	/* If KHO is active, add its images to the list */
+	ret = kho_fill_kimage(image);
+	if (ret)
+		goto out;
+
 	/* Call image load handler */
 	ldata = kexec_image_load_default(image);
 
@@ -648,6 +653,14 @@ int kexec_locate_mem_hole(struct kexec_buf *kbuf)
 	if (kbuf->mem != KEXEC_BUF_MEM_UNKNOWN)
 		return 0;
 
+	/*
+	 * If KHO is active, only use KHO scratch memory. All other memory
+	 * could potentially be handed over.
+	 */
+	ret = kho_locate_mem_hole(kbuf, locate_mem_hole_callback);
+	if (ret <= 0)
+		return ret;
+
 	if (!IS_ENABLED(CONFIG_ARCH_KEEP_MEMBLOCK))
 		ret = kexec_walk_resources(kbuf, locate_mem_hole_callback);
 	else
diff --git a/kernel/kexec_handover.c b/kernel/kexec_handover.c
index 9cc818cefd151..69b953551677c 100644
--- a/kernel/kexec_handover.c
+++ b/kernel/kexec_handover.c
@@ -26,6 +26,7 @@
  * internal APIs.
  */
 #include "../mm/internal.h"
+#include "kexec_internal.h"
 
 #define KHO_FDT_COMPATIBLE "kho-v1"
 #define PROP_PRESERVED_MEMORY_MAP "preserved-memory-map"
@@ -1197,3 +1198,69 @@ void __init kho_populate(phys_addr_t fdt_phys, u64 fdt_len,
 	if (err)
 		pr_warn("disabling KHO revival: %d\n", err);
 }
+
+/* Helper functions for kexec_file_load */
+
+int kho_fill_kimage(struct kimage *image)
+{
+	ssize_t scratch_size;
+	int err = 0;
+	struct kexec_buf scratch;
+
+	if (!kho_enable)
+		return 0;
+
+	image->kho.fdt = page_to_phys(kho_out.ser.fdt);
+
+	scratch_size = sizeof(*kho_scratch) * kho_scratch_cnt;
+	scratch = (struct kexec_buf){
+		.image = image,
+		.buffer = kho_scratch,
+		.bufsz = scratch_size,
+		.mem = KEXEC_BUF_MEM_UNKNOWN,
+		.memsz = scratch_size,
+		.buf_align = SZ_64K, /* Makes it easier to map */
+		.buf_max = ULONG_MAX,
+		.top_down = true,
+	};
+	err = kexec_add_buffer(&scratch);
+	if (err)
+		return err;
+	image->kho.scratch = &image->segment[image->nr_segments - 1];
+
+	return 0;
+}
+
+static int kho_walk_scratch(struct kexec_buf *kbuf,
+			    int (*func)(struct resource *, void *))
+{
+	int ret = 0;
+	int i;
+
+	for (i = 0; i < kho_scratch_cnt; i++) {
+		struct resource res = {
+			.start = kho_scratch[i].addr,
+			.end = kho_scratch[i].addr + kho_scratch[i].size - 1,
+		};
+
+		/* Try to fit the kimage into our KHO scratch region */
+		ret = func(&res, kbuf);
+		if (ret)
+			break;
+	}
+
+	return ret;
+}
+
+int kho_locate_mem_hole(struct kexec_buf *kbuf,
+			int (*func)(struct resource *, void *))
+{
+	int ret;
+
+	if (!kho_enable || kbuf->image->type == KEXEC_TYPE_CRASH)
+		return 1;
+
+	ret = kho_walk_scratch(kbuf, func);
+
+	return ret == 1 ? 0 : -EADDRNOTAVAIL;
+}
diff --git a/kernel/kexec_internal.h b/kernel/kexec_internal.h
index d35d9792402d1..30a733a55a67b 100644
--- a/kernel/kexec_internal.h
+++ b/kernel/kexec_internal.h
@@ -39,4 +39,20 @@ extern size_t kexec_purgatory_size;
 #else /* CONFIG_KEXEC_FILE */
 static inline void kimage_file_post_load_cleanup(struct kimage *image) { }
 #endif /* CONFIG_KEXEC_FILE */
+
+struct kexec_buf;
+
+#ifdef CONFIG_KEXEC_HANDOVER
+int kho_locate_mem_hole(struct kexec_buf *kbuf,
+			int (*func)(struct resource *, void *));
+int kho_fill_kimage(struct kimage *image);
+#else
+static inline int kho_locate_mem_hole(struct kexec_buf *kbuf,
+				      int (*func)(struct resource *, void *))
+{
+	return 1;
+}
+
+static inline int kho_fill_kimage(struct kimage *image) { return 0; }
+#endif /* CONFIG_KEXEC_HANDOVER */
 #endif /* LINUX_KEXEC_INTERNAL_H */
-- 
2.49.0.1015.ga840276032-goog

