Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41F8E23642C
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 08:08:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738915734; cv=none; b=ClHMwHdQ7TH98UuEdkgVHhunuB9PhupBgeK8JEqCRSPzqfp8dgQCWhtcYPmrA5h6lubnDXRLrNr885YljVK9ZDM8d0fVDL5zwsnH8Dl2Jy5skdrpw/3ADfh2Yu5MjF36+GiDEXW0/xZTWpjmdV3PB7m5eCyRW+LlNt6pG5OfRU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738915734; c=relaxed/simple;
	bh=x0p6hIaW4+aySJw17dpuvGeRp0+lJ/1YYST0D6RoFPE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=liDfZ6K86QmFVU9o3+8B2SsQqe9YwlcP2XsdBnb/ctpm0po3OQhmaZRjg9ZwAMPj+lGOjXR5NOjQkjzNSnjkT4f+9IJQ/ebNn/Iky/rnHO7xtqfbtafrkzpO9Tf2QEkm+lIA/39s04ZZOD0GzWK7TWZ5si9UyD771y3dP8d74UA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Keg42iZD; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Keg42iZD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738915731;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aL14X0leHlIaXriDDuvzj+jBkNI10p+NUwdo4iMYdVY=;
	b=Keg42iZDDx8/Xvd0pt86n8F9h83cqcWC4jZcq+KrU58lmbGcr4ewPgcqeb3uNOHbryQX7a
	a5e8wyqRN0NcZxZI5laBtcj/LXVcsXa9ciOLkX609zeUwdIvYFX6UpNtFtUTkAN8eKYwIu
	QDn5YpgfClCcvy/ZlyLj2QLlMlkyHNM=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-332-HPs2Iko0MVSPs_e8OmZtWg-1; Fri, 07 Feb 2025 03:08:49 -0500
X-MC-Unique: HPs2Iko0MVSPs_e8OmZtWg-1
X-Mimecast-MFC-AGG-ID: HPs2Iko0MVSPs_e8OmZtWg
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-2fa2e61c187so441243a91.0
        for <linux-kernel@vger.kernel.org>; Fri, 07 Feb 2025 00:08:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738915729; x=1739520529;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aL14X0leHlIaXriDDuvzj+jBkNI10p+NUwdo4iMYdVY=;
        b=OgsvUcTbmNEnIreTgwMPa7iun6qNQNtmWfw7cooPRZULgKGwv8ABblk1QdD+909eId
         6HFgR9BpRRkI6Cm/y1X2j4mlSJ46lEPMYURIqecnW+e/FLsMHiFTHVL7TWULDLgkJenm
         Yk5g6MMscQAf27vdT8pM2GMQiAv6PdrrMwDEBxGAMm366i/Zj8TL4/CIBQIz/ypmpg56
         jfFZC24LUjEspUJOLdQW26f2Suvp3NHpTGm8aCAa3N1KeVjHfNSwI/aduk2HPEpHozrL
         Tg/SUrB0IwaMU3dRFZW0JqzoLki1Rfzp3gx8Qi4qaS0VmZk9dWhAIlLKSFfhYrvw9w1H
         p/vg==
X-Forwarded-Encrypted: i=1; AJvYcCUek+GzHHlE1CdeERj+4z4OKp+eiXGIdGn9DkyEfWAtWjjeoR4VsDS3jhHFYHtzJdzozgzH5Mm8rbBvrzs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxdfdpmjAJiRTpHJ9JKoYvifZilsyqnJKQC1pqKEKldeJgo+AJA
	ivfIlRkgz6MzqpgthBPmn/b0UEidqNB056ycS+Oh7NficuNp3ApkwXXmRYD+XzsANNC/fiRQsox
	nzH+ie6jRibe6SfDWpmaeMiakTbWP118YpOGlaU9iIojuXuYts6xQsfk9XwvuZA==
X-Gm-Gg: ASbGncsrO0y8NUNDoCQqMsUC7WcsWezIgEV5p6RJUzP5w6eiiEz5NnnwVZgjzPjOeU5
	t6rU+/vKhMdXwfVjolqYUhzPWjF/aIS3teM3GjRGcrE9A+Oy+2MD2xFyzxtRggUvoEVxfNK/ycI
	opuQAnz0ii1nJiuSCFJ2MygOXFgPBVWW1QE3xddAPCusYUS+WwEA47vbfxy2h+vswIGxbFc3I7k
	T/2O3XoG+dOI5cB14VFIh5jsUPqsvvg4GVEpyvGeE/H8rr9FyYqw1uWws7Z5xJCjDinncnd
X-Received: by 2002:a17:90b:4b83:b0:2fa:3174:e344 with SMTP id 98e67ed59e1d1-2fa3174e3camr490272a91.14.1738915728702;
        Fri, 07 Feb 2025 00:08:48 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGForNSQZIeWtJV5QgUb8FCeJOL+p2N2wYN66XEWld0+A3AqNwNbyWXDtNkREAyMmDul4JNQQ==
X-Received: by 2002:a17:90b:4b83:b0:2fa:3174:e344 with SMTP id 98e67ed59e1d1-2fa3174e3camr490228a91.14.1738915728354;
        Fri, 07 Feb 2025 00:08:48 -0800 (PST)
Received: from localhost ([43.228.180.230])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f9e1d77b73sm5465432a91.12.2025.02.07.00.08.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 00:08:46 -0800 (PST)
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
	Vivek Goyal <vgoyal@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	linux-doc@vger.kernel.org (open list:DOCUMENTATION)
Subject: [PATCH v8 6/7] x86/crash: pass dm crypt keys to kdump kernel
Date: Fri,  7 Feb 2025 16:08:14 +0800
Message-ID: <20250207080818.129165-7-coxu@redhat.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250207080818.129165-1-coxu@redhat.com>
References: <20250207080818.129165-1-coxu@redhat.com>
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
---
 Documentation/admin-guide/kdump/kdump.rst |  4 ++--
 arch/x86/kernel/crash.c                   | 26 +++++++++++++++++++++--
 arch/x86/kernel/kexec-bzimage64.c         | 11 ++++++++++
 3 files changed, 37 insertions(+), 4 deletions(-)

diff --git a/Documentation/admin-guide/kdump/kdump.rst b/Documentation/admin-guide/kdump/kdump.rst
index 1283f0244614..2209caf36d79 100644
--- a/Documentation/admin-guide/kdump/kdump.rst
+++ b/Documentation/admin-guide/kdump/kdump.rst
@@ -555,8 +555,8 @@ Write the dump file to encrypted disk volume
 ============================================
 
 CONFIG_CRASH_DM_CRYPT can be enabled to support saving the dump file to an
-encrypted disk volume. User space can interact with
-/sys/kernel/config/crash_dm_crypt_keys for setup,
+encrypted disk volume (only x86_64 supported for now). User space can interact
+with /sys/kernel/config/crash_dm_crypt_keys for setup,
 
 1. Tell the first kernel what keys are needed to unlock the disk volumes,
     # Add key #1
diff --git a/arch/x86/kernel/crash.c b/arch/x86/kernel/crash.c
index 340af8155658..a525ee639b63 100644
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
index 68530fad05f7..5604a5109858 100644
--- a/arch/x86/kernel/kexec-bzimage64.c
+++ b/arch/x86/kernel/kexec-bzimage64.c
@@ -76,6 +76,10 @@ static int setup_cmdline(struct kimage *image, struct boot_params *params,
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
@@ -441,6 +445,13 @@ static void *bzImage64_load(struct kimage *image, char *kernel,
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
 	}
 #endif
 
-- 
2.48.1

