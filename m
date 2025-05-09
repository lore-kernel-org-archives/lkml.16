Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E92CD27510D
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 07:47:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746776837; cv=none; b=DzeWWeKyESv+mKPG6AD+bw994cQkmhxCUxBfGy1uynCX14icMIPhY15Zx9uEqrWlc9rLiyv9tI07lA9yISv+caAvhOVPctz7O5LMKupVKXDJz2J6sZLJ9U4eZOArASH5LX5/hXzMsesF7D+pDJgANpvo3SJ3ui8Oe9PmY3UPBiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746776837; c=relaxed/simple;
	bh=Vc+c5XF0rLg0KBWZ3xVDH7fuFrHjljJEBqq2sVyqDh8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=j886J/t4XTsJfwkgDv6RfPBSz/gppFkj5z9RTLWgWaQbORiAGIaVnk8sL4NEChTccwEbcMbB0XhzGlwetNxKk0mmx5uD1l3EHE2t7ntj+Yen6e/vYClwU5G/w/e39Sde/0qZlisPn78kCN2VWPY2asLG/FcZCGWpT/Mfpwp1tJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--changyuanl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ief5S2pt; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--changyuanl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ief5S2pt"
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-739525d4d7bso1718343b3a.2
        for <linux-kernel@vger.kernel.org>; Fri, 09 May 2025 00:47:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746776835; x=1747381635; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=GFvYLK+ZL/SoGleIeevbdmFWcNzesKKgCsD+i6+wQu0=;
        b=ief5S2ptZ7MKF+nxBzgy89G+JFSqMLUjjjtIGoERdMPi6Urs//laxc0lr/rnnG/7TI
         GgXMgRCc8eXCGf6Nurg7eTFLORTGEmoycMvtR0Mt1ux7w3d8bpis8oVbRo3RTO86R0m+
         tDy+TZFQW6V2BRIeOy7/lqshinpFeaUw+ORS0r4XfW6BgBC7jdzuFZbprn5jexct73Av
         ptgRMzr35W608XS3hF1tmiY+s9rWbIjTwIsOHTrcKI5awHeZPQPIHn5SEiMr31XdvNad
         AURfl7Pih+RutE0DVP6SQovibqATgF+xH6WsseHfeDTF+3c+EFgd9rMb4vfN9QRk1rUR
         wo3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746776835; x=1747381635;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GFvYLK+ZL/SoGleIeevbdmFWcNzesKKgCsD+i6+wQu0=;
        b=m6bKJ/8vrzecLxTL9VRkZRtQS2cMDBxIzL9QByQv/pfEch2qI5ZAX9+8m9yVLbcowE
         j4+pkOX7Oc32ws8Or/zfA8slqvFLCLbPRg+42GydUOc6vOhFKN7JIGMHvJbEbopSC540
         LCYQW91GvqIA6Br0fHIHHBuSHY6uzLUZCPTfLxwp/6uBbVVuczIACyI9l6hG1+P1EfEV
         fxTUyhBBy4SwZAmWZZNpCT3nbKkD3u2q26LciFx2tAtsnuSWufv3KeYo8EFQ+41wvQCu
         6C1Kv2uJa8J2tm72+BAusV4NfLQPYdnuLF3ccFZaFgXyiWKxLHQcGIG5HzoREFxMxXKI
         rq0g==
X-Forwarded-Encrypted: i=1; AJvYcCXP2cNeCx2TRfK5odc6RWCOGj9elQKHV6rSX/1Ffa7cz2Pz1y+njXKio5J2ciZfaMxxqM8cuHJWd5yqCRU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzdeQT/L1sJW5wVbgP37mgLFoPtelNEb+kpaVhQO2sTJ6F3Mtj0
	ocMQhicRGRSPnSCxNxF7hDw/IaCnN4FwylLnsb30bjxZg+tE+O8fJP6PIiVjfHxPbulQ6MO/EAX
	C7cWW7hnzmD4zI/InSw==
X-Google-Smtp-Source: AGHT+IHoXD/iPEv9R0ck8JE0X2BEO15ZWlihBiuBxq/VD+tog9vvDo/xTXjQN1YF2y2CswQzZ14kMxX0B0iv6xJy
X-Received: from pgbcs12.prod.google.com ([2002:a05:6a02:418c:b0:b14:9718:f939])
 (user=changyuanl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a20:a11e:b0:1f5:5903:edd3 with SMTP id adf61e73a8af0-215abafb67fmr2914671637.11.1746776835249;
 Fri, 09 May 2025 00:47:15 -0700 (PDT)
Date: Fri,  9 May 2025 00:46:29 -0700
In-Reply-To: <20250509074635.3187114-1-changyuanl@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250509074635.3187114-1-changyuanl@google.com>
X-Mailer: git-send-email 2.49.0.1015.ga840276032-goog
Message-ID: <20250509074635.3187114-12-changyuanl@google.com>
Subject: [PATCH v8 11/17] x86/kexec: add support for passing kexec handover
 (KHO) data
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

kexec handover (KHO) creates a metadata that the kernels pass between each
other during kexec. This metadata is stored in memory and kexec image
contains a (physical) pointer to that memory.

In addition, KHO keeps "scratch regions" available for kexec: physically
contiguous memory regions that are guaranteed to not have any memory that
KHO would preserve. The new kernel bootstraps itself using the scratch
regions and sets all handed over memory as in use. When subsystems that
support KHO initialize, they introspect the KHO metadata, restore preserved
memory regions, and retrieve their state stored in the preserved memory.

Enlighten x86 kexec-file and boot path about the KHO metadata and make sure
it gets passed along to the next kernel.

Signed-off-by: Alexander Graf <graf@amazon.com>
Co-developed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
Co-developed-by: Changyuan Lyu <changyuanl@google.com>
Signed-off-by: Changyuan Lyu <changyuanl@google.com>
Acked-by: Dave Hansen <dave.hansen@linux.intel.com>
---
 arch/x86/include/asm/setup.h           |  2 ++
 arch/x86/include/uapi/asm/setup_data.h | 13 ++++++++-
 arch/x86/kernel/kexec-bzimage64.c      | 37 ++++++++++++++++++++++++++
 arch/x86/kernel/setup.c                | 26 ++++++++++++++++++
 4 files changed, 77 insertions(+), 1 deletion(-)

diff --git a/arch/x86/include/asm/setup.h b/arch/x86/include/asm/setup.h
index ad9212df0ec0c..3b37571911f4c 100644
--- a/arch/x86/include/asm/setup.h
+++ b/arch/x86/include/asm/setup.h
@@ -67,6 +67,8 @@ extern void x86_ce4100_early_setup(void);
 static inline void x86_ce4100_early_setup(void) { }
 #endif
 
+#include <linux/kexec_handover.h>
+
 #ifndef _SETUP
 
 #include <asm/espfix.h>
diff --git a/arch/x86/include/uapi/asm/setup_data.h b/arch/x86/include/uapi/asm/setup_data.h
index 50c45ead4e7c9..2671c4e1b3a0b 100644
--- a/arch/x86/include/uapi/asm/setup_data.h
+++ b/arch/x86/include/uapi/asm/setup_data.h
@@ -13,7 +13,8 @@
 #define SETUP_CC_BLOB			7
 #define SETUP_IMA			8
 #define SETUP_RNG_SEED			9
-#define SETUP_ENUM_MAX			SETUP_RNG_SEED
+#define SETUP_KEXEC_KHO			10
+#define SETUP_ENUM_MAX			SETUP_KEXEC_KHO
 
 #define SETUP_INDIRECT			(1<<31)
 #define SETUP_TYPE_MAX			(SETUP_ENUM_MAX | SETUP_INDIRECT)
@@ -78,6 +79,16 @@ struct ima_setup_data {
 	__u64 size;
 } __attribute__((packed));
 
+/*
+ * Locations of kexec handover metadata
+ */
+struct kho_data {
+	__u64 fdt_addr;
+	__u64 fdt_size;
+	__u64 scratch_addr;
+	__u64 scratch_size;
+} __attribute__((packed));
+
 #endif /* __ASSEMBLER__ */
 
 #endif /* _UAPI_ASM_X86_SETUP_DATA_H */
diff --git a/arch/x86/kernel/kexec-bzimage64.c b/arch/x86/kernel/kexec-bzimage64.c
index 68530fad05f74..dad174e3bed0d 100644
--- a/arch/x86/kernel/kexec-bzimage64.c
+++ b/arch/x86/kernel/kexec-bzimage64.c
@@ -233,6 +233,32 @@ setup_ima_state(const struct kimage *image, struct boot_params *params,
 #endif /* CONFIG_IMA_KEXEC */
 }
 
+static void setup_kho(const struct kimage *image, struct boot_params *params,
+		      unsigned long params_load_addr,
+		      unsigned int setup_data_offset)
+{
+	struct setup_data *sd = (void *)params + setup_data_offset;
+	struct kho_data *kho = (void *)sd + sizeof(*sd);
+
+	if (!IS_ENABLED(CONFIG_KEXEC_HANDOVER))
+		return;
+
+	sd->type = SETUP_KEXEC_KHO;
+	sd->len = sizeof(struct kho_data);
+
+	/* Only add if we have all KHO images in place */
+	if (!image->kho.fdt || !image->kho.scratch)
+		return;
+
+	/* Add setup data */
+	kho->fdt_addr = image->kho.fdt;
+	kho->fdt_size = PAGE_SIZE;
+	kho->scratch_addr = image->kho.scratch->mem;
+	kho->scratch_size = image->kho.scratch->bufsz;
+	sd->next = params->hdr.setup_data;
+	params->hdr.setup_data = params_load_addr + setup_data_offset;
+}
+
 static int
 setup_boot_parameters(struct kimage *image, struct boot_params *params,
 		      unsigned long params_load_addr,
@@ -312,6 +338,13 @@ setup_boot_parameters(struct kimage *image, struct boot_params *params,
 				     sizeof(struct ima_setup_data);
 	}
 
+	if (IS_ENABLED(CONFIG_KEXEC_HANDOVER)) {
+		/* Setup space to store preservation metadata */
+		setup_kho(image, params, params_load_addr, setup_data_offset);
+		setup_data_offset += sizeof(struct setup_data) +
+				     sizeof(struct kho_data);
+	}
+
 	/* Setup RNG seed */
 	setup_rng_seed(params, params_load_addr, setup_data_offset);
 
@@ -479,6 +512,10 @@ static void *bzImage64_load(struct kimage *image, char *kernel,
 		kbuf.bufsz += sizeof(struct setup_data) +
 			      sizeof(struct ima_setup_data);
 
+	if (IS_ENABLED(CONFIG_KEXEC_HANDOVER))
+		kbuf.bufsz += sizeof(struct setup_data) +
+			      sizeof(struct kho_data);
+
 	params = kzalloc(kbuf.bufsz, GFP_KERNEL);
 	if (!params)
 		return ERR_PTR(-ENOMEM);
diff --git a/arch/x86/kernel/setup.c b/arch/x86/kernel/setup.c
index 766176c4f5ee8..664cd21b85329 100644
--- a/arch/x86/kernel/setup.c
+++ b/arch/x86/kernel/setup.c
@@ -451,6 +451,29 @@ int __init ima_get_kexec_buffer(void **addr, size_t *size)
 }
 #endif
 
+static void __init add_kho(u64 phys_addr, u32 data_len)
+{
+	struct kho_data *kho;
+	u64 addr = phys_addr + sizeof(struct setup_data);
+	u64 size = data_len - sizeof(struct setup_data);
+
+	if (!IS_ENABLED(CONFIG_KEXEC_HANDOVER)) {
+		pr_warn("Passed KHO data, but CONFIG_KEXEC_HANDOVER not set. Ignoring.\n");
+		return;
+	}
+
+	kho = early_memremap(addr, size);
+	if (!kho) {
+		pr_warn("setup: failed to memremap kho data (0x%llx, 0x%llx)\n",
+			addr, size);
+		return;
+	}
+
+	kho_populate(kho->fdt_addr, kho->fdt_size, kho->scratch_addr, kho->scratch_size);
+
+	early_memunmap(kho, size);
+}
+
 static void __init parse_setup_data(void)
 {
 	struct setup_data *data;
@@ -479,6 +502,9 @@ static void __init parse_setup_data(void)
 		case SETUP_IMA:
 			add_early_ima_buffer(pa_data);
 			break;
+		case SETUP_KEXEC_KHO:
+			add_kho(pa_data, data_len);
+			break;
 		case SETUP_RNG_SEED:
 			data = early_memremap(pa_data, data_len);
 			add_bootloader_randomness(data->data, data->len);
-- 
2.49.0.1015.ga840276032-goog

