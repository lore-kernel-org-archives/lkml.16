Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C19401624D4;
	Thu,  6 Feb 2025 13:29:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738848556; cv=none; b=nqsCOrNieuirNSRAk6sx+9KU5z25N4s5Uh1/ORmRmWPrjzLCQj8UlCMiOmcXwDI0xz7TfVmlU+3T6AASwj4sCwDrhEqfmDbh4WY3HUPOjpqzouSKR5Kk19FvoHJIeI00B34s1bq3MKynYII/1PXCv4QZDO7GFpSQkb9+9+aRasE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738848556; c=relaxed/simple;
	bh=SA91Fj5qgInsouyzMgIZTm/AqTY6Uhs6HmphlAhMyfc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Lb2GN2BZpL5bVf39AwqxG27zPfhRAUj3/TgYbbnyYDolCCMm5u3J2W+oGckIjPMp3CATczFbA36IyXTbkLmDGR4wHsXEfIluYeOLSSF9yB5TWY0i04YMVd+oN8gwT+P1Jaacsp8iTbKo0AViMmqOlOQqNAzIWMKM0BbcOUsd/iw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hrsbmPUP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hrsbmPUP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB770C4CEE2;
	Thu,  6 Feb 2025 13:29:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738848555;
	bh=SA91Fj5qgInsouyzMgIZTm/AqTY6Uhs6HmphlAhMyfc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hrsbmPUP/jQmIDpCQWb7ZVFdD6V3M6xwSxP5LmMRwYVJmfZEvBF8s0HqGvp6Pn98+
	 yT32m17rXidrXqfDAMYUYU5k+KHZ8OSDawwoFighWF4jZyJJBSn6Yjk1M44Ke3f1lH
	 CxbPw1x49PyrAi2rJykASo1U6yJUvr8g21FD4tG6rqJP2EftVZC+J/7WHMJe2UJMQT
	 WOTXp2l+mVPqJUsfjH/uPsk7iBDfflHWWB6RBscNyEdfkA/0RGq3ExTrmnEycsR8y9
	 v1C9vgcx9BRy4e1VjhK/GA1OsAAMypaygKx1LA9cv7iuRnym59qSPk7+g9LQ35vh+D
	 X57gti5NrFeUw==
From: Mike Rapoport <rppt@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Alexander Graf <graf@amazon.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Andy Lutomirski <luto@kernel.org>,
	Anthony Yznaga <anthony.yznaga@oracle.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Ashish Kalra <ashish.kalra@amd.com>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	Borislav Petkov <bp@alien8.de>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Eric Biederman <ebiederm@xmission.com>,
	Ingo Molnar <mingo@redhat.com>,
	James Gowans <jgowans@amazon.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Mike Rapoport <rppt@kernel.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Pratyush Yadav <ptyadav@amazon.de>,
	Rob Herring <robh+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Stanislav Kinsburskii <skinsburskii@linux.microsoft.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	Usama Arif <usama.arif@bytedance.com>,
	Will Deacon <will@kernel.org>,
	devicetree@vger.kernel.org,
	kexec@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org,
	linux-mm@kvack.org,
	x86@kernel.org
Subject: [PATCH v4 07/14] kexec: Add KHO support to kexec file loads
Date: Thu,  6 Feb 2025 15:27:47 +0200
Message-ID: <20250206132754.2596694-8-rppt@kernel.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250206132754.2596694-1-rppt@kernel.org>
References: <20250206132754.2596694-1-rppt@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

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
---
 include/linux/kexec.h   |  7 ++++
 kernel/kexec_file.c     | 19 +++++++++
 kernel/kexec_handover.c | 92 +++++++++++++++++++++++++++++++++++++++++
 kernel/kexec_internal.h | 16 +++++++
 4 files changed, 134 insertions(+)

diff --git a/include/linux/kexec.h b/include/linux/kexec.h
index 4fdf5ee27144..c5e851717089 100644
--- a/include/linux/kexec.h
+++ b/include/linux/kexec.h
@@ -364,6 +364,13 @@ struct kimage {
 	size_t ima_buffer_size;
 #endif
 
+#ifdef CONFIG_KEXEC_HANDOVER
+	struct {
+		struct kexec_buf dt;
+		struct kexec_buf scratch;
+	} kho;
+#endif
+
 	/* Core ELF header buffer */
 	void *elf_headers;
 	unsigned long elf_headers_sz;
diff --git a/kernel/kexec_file.c b/kernel/kexec_file.c
index 3eedb8c226ad..d28d23bc1cf4 100644
--- a/kernel/kexec_file.c
+++ b/kernel/kexec_file.c
@@ -113,6 +113,12 @@ void kimage_file_post_load_cleanup(struct kimage *image)
 	image->ima_buffer = NULL;
 #endif /* CONFIG_IMA_KEXEC */
 
+#ifdef CONFIG_KEXEC_HANDOVER
+	kvfree(image->kho.dt.buffer);
+	image->kho.dt = (struct kexec_buf) {};
+	image->kho.scratch = (struct kexec_buf) {};
+#endif
+
 	/* See if architecture has anything to cleanup post load */
 	arch_kimage_file_post_load_cleanup(image);
 
@@ -253,6 +259,11 @@ kimage_file_prepare_segments(struct kimage *image, int kernel_fd, int initrd_fd,
 	/* IMA needs to pass the measurement list to the next kernel. */
 	ima_add_kexec_buffer(image);
 
+	/* If KHO is active, add its images to the list */
+	ret = kho_fill_kimage(image);
+	if (ret)
+		goto out;
+
 	/* Call image load handler */
 	ldata = kexec_image_load_default(image);
 
@@ -636,6 +647,14 @@ int kexec_locate_mem_hole(struct kexec_buf *kbuf)
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
index 3b360e3a6057..c26753d613cb 100644
--- a/kernel/kexec_handover.c
+++ b/kernel/kexec_handover.c
@@ -16,6 +16,8 @@
 #include <linux/kexec_handover.h>
 #include <linux/page-isolation.h>
 
+#include "kexec_internal.h"
+
 static bool kho_enable __ro_after_init;
 
 static int __init kho_parse_enable(char *p)
@@ -155,6 +157,96 @@ void *kho_claim_mem(const struct kho_mem *mem)
 }
 EXPORT_SYMBOL_GPL(kho_claim_mem);
 
+int kho_fill_kimage(struct kimage *image)
+{
+	ssize_t scratch_size;
+	int err = 0;
+	void *dt;
+
+	mutex_lock(&kho_out.lock);
+
+	if (!kho_out.active)
+		goto out;
+
+	/*
+	 * Create a kexec copy of the DT here. We need this because lifetime may
+	 * be different between kho.dt and the kimage
+	 */
+	dt = kvmemdup(kho_out.dt, kho_out.dt_len, GFP_KERNEL);
+	if (!dt) {
+		err = -ENOMEM;
+		goto out;
+	}
+
+	/* Allocate target memory for kho dt */
+	image->kho.dt = (struct kexec_buf) {
+		.image = image,
+		.buffer = dt,
+		.bufsz = kho_out.dt_len,
+		.mem = KEXEC_BUF_MEM_UNKNOWN,
+		.memsz = kho_out.dt_len,
+		.buf_align = SZ_64K, /* Makes it easier to map */
+		.buf_max = ULONG_MAX,
+		.top_down = true,
+	};
+	err = kexec_add_buffer(&image->kho.dt);
+	if (err) {
+		pr_info("===> %s: kexec_add_buffer\n", __func__);
+		goto out;
+	}
+
+	scratch_size = sizeof(*kho_scratch) * kho_scratch_cnt;
+	image->kho.scratch = (struct kexec_buf) {
+		.image = image,
+		.buffer = kho_scratch,
+		.bufsz = scratch_size,
+		.mem = KEXEC_BUF_MEM_UNKNOWN,
+		.memsz = scratch_size,
+		.buf_align = SZ_64K, /* Makes it easier to map */
+		.buf_max = ULONG_MAX,
+		.top_down = true,
+	};
+	err = kexec_add_buffer(&image->kho.scratch);
+
+out:
+	mutex_unlock(&kho_out.lock);
+	return err;
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
+	if (!kho_out.active || kbuf->image->type == KEXEC_TYPE_CRASH)
+		return 1;
+
+	ret = kho_walk_scratch(kbuf, func);
+
+	return ret == 1 ? 0 : -EADDRNOTAVAIL;
+}
+
 static ssize_t dt_read(struct file *file, struct kobject *kobj,
 		       struct bin_attribute *attr, char *buf,
 		       loff_t pos, size_t count)
diff --git a/kernel/kexec_internal.h b/kernel/kexec_internal.h
index d35d9792402d..c535dbd3b5bd 100644
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
+	return 0;
+}
+
+static inline int kho_fill_kimage(struct kimage *image) { return 0; }
+#endif
 #endif /* LINUX_KEXEC_INTERNAL_H */
-- 
2.47.2

