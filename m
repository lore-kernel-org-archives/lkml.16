Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F21291A257D
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 01:13:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746148408; cv=none; b=Ruwi/GNU77L9eVK37xg4yQSgVqZAgQJRspS3/Har0SoTVygv9qbbrDBFBE8KwZUJxDCVswvjGe7pSslzB0340qhRqkFWFnsLfkqV2HcvUSqsZ2bYuMZZpfX2aOP1vC4bv4MgCxhNkmDjQ0GX5y6dJxr2o0HPj8CcAXx0iqbBlts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746148408; c=relaxed/simple;
	bh=358HTmulVlruFMpacpjHwFNBa3gAqASZ7gNoN8s6OoA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QPLuyVKmu4w28DU0AcUnZ9ybnbNDl5vJwkKk4aMy/C/kt4aQZiFHV4noGp02jWjL3wf/SGq8R1D49ghY0csb7cjWYPm3QSd4TE7dL9spcicSVerefgfvZUQWg3KktFPZGpHEGcfeqdfXQyQR865gweboqQCcI4/sIOCOYsyrBks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=h22l++I0; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="h22l++I0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746148405;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/EXCS7YZfoYbLHPYyFkucRV4RaFlxZolah51T9bD/WA=;
	b=h22l++I0BOKVDgfZZ9iqNyLdq/reU7sMwsRjjtBiKkvaLJ1uBBAANce94p6J2g+Ty2UcK9
	aBaza88vEBqxe4lE5oCKfPaJ8LUhFT/yUt3HUmigmnrs5CDgx/s4PbVGqCWTemwPt8QsJe
	d4UQRGxhSVoJSZ+IylLA52WoXypBrGU=
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-82-KjGPY1OgOyq93GbgGBMAVg-1; Thu, 01 May 2025 21:13:25 -0400
X-MC-Unique: KjGPY1OgOyq93GbgGBMAVg-1
X-Mimecast-MFC-AGG-ID: KjGPY1OgOyq93GbgGBMAVg_1746148404
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-73c205898aaso1134656b3a.2
        for <linux-kernel@vger.kernel.org>; Thu, 01 May 2025 18:13:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746148404; x=1746753204;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/EXCS7YZfoYbLHPYyFkucRV4RaFlxZolah51T9bD/WA=;
        b=uMcxj/D8pI4w3Bu5Qr33PPUUN9H45pgqLWwFdhBoiEoXsj0Fw7fc5uYpMUzC4ct7+B
         YFhLCz+csq+GADRcbauqmTRTJ87CY9nA2WHE5dl4bKRTufX8E94ZqUGD/vX9AYTPw2TF
         hXIuZKDJyDi6CAK3GMY/0saI58eTBHJDkSZ8bTzZfhF639VbDbXaYaW7MZLDXpzrplSL
         klAvQVY8d5F0DnNSPIRvZbYzRaJZwRPVsU4zIAUA9+r3u1qdbErbZet0zzhC1pT6tzAk
         v1/8hQXajdOsnBB+yzZgMiRKQo0jTKA7lA9Rh+5BTGS/+kh4rY8ACR90ky/hw5mHcdfW
         XQYg==
X-Forwarded-Encrypted: i=1; AJvYcCVmu9zJ4YM3RUNfKBJACcIfriACU31ViRd5glS+M4oVHVC/UM1vfdAfYSw1C77zDGUDYXJZzuPAfrrFg/c=@vger.kernel.org
X-Gm-Message-State: AOJu0YzdaLybRhobwVil+dNDnFK6SQhwj3/ggmDgpJhJvXMyiG9/5ZAA
	K8XHxaIr/o5BqyScPKmgWBFn/c2KUXHP4d3emzFF1K1dhzrMsP1eVXIS1mtylrGldOLbzqgcEGt
	VDQNivvDTMbBIVWuud94Vw+rn18QZZREOJVSfqa4BhxdG+1FUwQSqi74Ye1I2+w==
X-Gm-Gg: ASbGncuppbWJN+3vCh/91mEfpOHATdVrZxhV2ROtIibJYhYNWcZ7qb+rY2K2BlHOO/h
	4vJr2s8j8E7K4zAni0nxbpColRBa+VHvl43uXyPvUMaX75w1kbcp/x1NKspemw5rmQtqCyVySP3
	uleyE6HRGlZdciUx3p40OJcUJedf3l8l9hpg00p/KrRd/mrHqFxFO2gjRZ8sJ2YOk0pQVe1EaVt
	P8Pb0UNUzNGPaz5Zn7LVu7F97lGBZ7yw0M1WV1OrYQyvhAvDY4CrsyTA0tD617nHnSMaQ981qjT
	+kI=
X-Received: by 2002:a05:6a21:78c:b0:1f5:6b36:f574 with SMTP id adf61e73a8af0-20ce02e7da0mr1498446637.38.1746148403591;
        Thu, 01 May 2025 18:13:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFU0R9cOfxCknV2YN3iEnSYLPTc4nx8JnX2KM70AD+jCoO7YKr4yHDcrBlPC1IzEWkqBT/rQg==
X-Received: by 2002:a05:6a21:78c:b0:1f5:6b36:f574 with SMTP id adf61e73a8af0-20ce02e7da0mr1498402637.38.1746148403254;
        Thu, 01 May 2025 18:13:23 -0700 (PDT)
Received: from localhost ([209.132.188.88])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74058d7a3b1sm357910b3a.15.2025.05.01.18.13.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 May 2025 18:13:23 -0700 (PDT)
From: Coiby Xu <coxu@redhat.com>
To: kexec@lists.infradead.org
Cc: Ondrej Kozina <okozina@redhat.com>,
	Milan Broz <gmazyland@gmail.com>,
	Thomas Staudt <tstaudt@de.ibm.com>,
	=?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Kairui Song <ryncsn@gmail.com>,
	Pingfan Liu <kernelfans@gmail.com>,
	Baoquan He <bhe@redhat.com>,
	Dave Young <dyoung@redhat.com>,
	linux-kernel@vger.kernel.org,
	x86@kernel.org,
	Dave Hansen <dave.hansen@intel.com>,
	Vitaly Kuznetsov <vkuznets@redhat.com>,
	Arnaud Lefebvre <arnaud.lefebvre@clever-cloud.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Vivek Goyal <vgoyal@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	linux-doc@vger.kernel.org (open list:DOCUMENTATION)
Subject: [PATCH v9 7/8] x86/crash: pass dm crypt keys to kdump kernel
Date: Fri,  2 May 2025 09:12:41 +0800
Message-ID: <20250502011246.99238-8-coxu@redhat.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250502011246.99238-1-coxu@redhat.com>
References: <20250502011246.99238-1-coxu@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

1st kernel will build up the kernel command parameter dmcryptkeys as
similar to elfcorehdr to pass the memory address of the stored info of
dm crypt key to kdump kernel.

Signed-off-by: Coiby Xu <coxu@redhat.com>
Acked-by: Baoquan He <bhe@redhat.com>
---
 Documentation/admin-guide/kdump/kdump.rst |  4 ++--
 arch/x86/kernel/crash.c                   | 26 +++++++++++++++++++++--
 arch/x86/kernel/kexec-bzimage64.c         | 21 ++++++++++++++++++
 3 files changed, 47 insertions(+), 4 deletions(-)

diff --git a/Documentation/admin-guide/kdump/kdump.rst b/Documentation/admin-guide/kdump/kdump.rst
index e25edaa8e533..20fabdf6567e 100644
--- a/Documentation/admin-guide/kdump/kdump.rst
+++ b/Documentation/admin-guide/kdump/kdump.rst
@@ -551,8 +551,8 @@ Write the dump file to encrypted disk volume
 ============================================
 
 CONFIG_CRASH_DM_CRYPT can be enabled to support saving the dump file to an
-encrypted disk volume. User space can interact with
-/sys/kernel/config/crash_dm_crypt_keys for setup,
+encrypted disk volume (only x86_64 supported for now). User space can interact
+with /sys/kernel/config/crash_dm_crypt_keys for setup,
 
 1. Tell the first kernel what logon keys are needed to unlock the disk volumes,
     # Add key #1
diff --git a/arch/x86/kernel/crash.c b/arch/x86/kernel/crash.c
index 0be61c45400c..bcb534688dfe 100644
--- a/arch/x86/kernel/crash.c
+++ b/arch/x86/kernel/crash.c
@@ -278,6 +278,7 @@ static int memmap_exclude_ranges(struct kimage *image, struct crash_mem *cmem,
 				 unsigned long long mend)
 {
 	unsigned long start, end;
+	int ret;
 
 	cmem->ranges[0].start = mstart;
 	cmem->ranges[0].end = mend;
@@ -286,22 +287,43 @@ static int memmap_exclude_ranges(struct kimage *image, struct crash_mem *cmem,
 	/* Exclude elf header region */
 	start = image->elf_load_addr;
 	end = start + image->elf_headers_sz - 1;
-	return crash_exclude_mem_range(cmem, start, end);
+	ret = crash_exclude_mem_range(cmem, start, end);
+
+	if (ret)
+		return ret;
+
+	/* Exclude dm crypt keys region */
+	if (image->dm_crypt_keys_addr) {
+		start = image->dm_crypt_keys_addr;
+		end = start + image->dm_crypt_keys_sz - 1;
+		return crash_exclude_mem_range(cmem, start, end);
+	}
+
+	return ret;
 }
 
 /* Prepare memory map for crash dump kernel */
 int crash_setup_memmap_entries(struct kimage *image, struct boot_params *params)
 {
+	unsigned int nr_ranges = 0;
 	int i, ret = 0;
 	unsigned long flags;
 	struct e820_entry ei;
 	struct crash_memmap_data cmd;
 	struct crash_mem *cmem;
 
-	cmem = vzalloc(struct_size(cmem, ranges, 1));
+	/*
+	 * Using random kexec_buf for passing dm crypt keys may cause a range
+	 * split. So use two slots here.
+	 */
+	nr_ranges = 2;
+	cmem = vzalloc(struct_size(cmem, ranges, nr_ranges));
 	if (!cmem)
 		return -ENOMEM;
 
+	cmem->max_nr_ranges = nr_ranges;
+	cmem->nr_ranges = 0;
+
 	memset(&cmd, 0, sizeof(struct crash_memmap_data));
 	cmd.params = params;
 
diff --git a/arch/x86/kernel/kexec-bzimage64.c b/arch/x86/kernel/kexec-bzimage64.c
index 68530fad05f7..c71cdd8e425a 100644
--- a/arch/x86/kernel/kexec-bzimage64.c
+++ b/arch/x86/kernel/kexec-bzimage64.c
@@ -27,6 +27,8 @@
 #include <asm/kexec-bzimage64.h>
 
 #define MAX_ELFCOREHDR_STR_LEN	30	/* elfcorehdr=0x<64bit-value> */
+#define MAX_DMCRYPTKEYS_STR_LEN	31	/* dmcryptkeys=0x<64bit-value> */
+
 
 /*
  * Defines lowest physical address for various segments. Not sure where
@@ -76,6 +78,10 @@ static int setup_cmdline(struct kimage *image, struct boot_params *params,
 	if (image->type == KEXEC_TYPE_CRASH) {
 		len = sprintf(cmdline_ptr,
 			"elfcorehdr=0x%lx ", image->elf_load_addr);
+
+		if (image->dm_crypt_keys_addr != 0)
+			len += sprintf(cmdline_ptr + len,
+					"dmcryptkeys=0x%lx ", image->dm_crypt_keys_addr);
 	}
 	memcpy(cmdline_ptr + len, cmdline, cmdline_len);
 	cmdline_len += len;
@@ -441,6 +447,19 @@ static void *bzImage64_load(struct kimage *image, char *kernel,
 		ret = crash_load_segments(image);
 		if (ret)
 			return ERR_PTR(ret);
+		ret = crash_load_dm_crypt_keys(image);
+		if (ret == -ENOENT) {
+			kexec_dprintk("No dm crypt key to load\n");
+		} else if (ret) {
+			pr_err("Failed to load dm crypt keys\n");
+			return ERR_PTR(ret);
+		}
+		if (image->dm_crypt_keys_addr &&
+		    cmdline_len + MAX_ELFCOREHDR_STR_LEN + MAX_DMCRYPTKEYS_STR_LEN >
+			    header->cmdline_size) {
+			pr_err("Appending dmcryptkeys=<addr> to command line exceeds maximum allowed length\n");
+			return ERR_PTR(-EINVAL);
+		}
 	}
 #endif
 
@@ -468,6 +487,8 @@ static void *bzImage64_load(struct kimage *image, char *kernel,
 	efi_map_sz = efi_get_runtime_map_size();
 	params_cmdline_sz = sizeof(struct boot_params) + cmdline_len +
 				MAX_ELFCOREHDR_STR_LEN;
+	if (image->dm_crypt_keys_addr)
+		params_cmdline_sz += MAX_DMCRYPTKEYS_STR_LEN;
 	params_cmdline_sz = ALIGN(params_cmdline_sz, 16);
 	kbuf.bufsz = params_cmdline_sz + ALIGN(efi_map_sz, 16) +
 				sizeof(struct setup_data) +
-- 
2.49.0

