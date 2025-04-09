Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AFED210186
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 19:30:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744227025; cv=none; b=E/F6en5jzw5/Tp7quL3I8Zun6aW+Yf9oiDzJ6TE4S8MD01BvUtuwSlOTzYLiX/EJGjJ+Hg535Rk60nG526MWQW8FjAQYI5a7oamxeGlTfPbZsE8J8OjeL9OdfcDONEqa1x56xJRO9Jq8pAIudpJ4ey6LRgFtp7SEx+HF6uV/mPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744227025; c=relaxed/simple;
	bh=fIOAmCXCIObRTblswnuQHoX5XKmUj8sZ884SzKJE6A0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=S5rH7zqZnLowqByclZ4zROUfNk2zWcSXf7bId60XGWYkoGAD3b4OY3JpVHkz6/AcUgAHUU/cZP/dZj9spdaPzJ84kNS9EIKfqjaIQ0B1A6qivNAIEKw7JHrBY7WC7/9LUterlKkmu2+ibkPHuKENnrGQNawi/Ziguaidi1NXQF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tJOEJU4Q; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tJOEJU4Q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 019B6C4CEE9;
	Wed,  9 Apr 2025 19:30:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744227024;
	bh=fIOAmCXCIObRTblswnuQHoX5XKmUj8sZ884SzKJE6A0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tJOEJU4Qofo7ZSFojkkp7iReQAnWLr3IRPcGUpydqBt8K8lt0fjSassjE9a+/LGY7
	 JrlIiv7puzMBUetMAJ5wO57iM68bw1Pq1kVEBDBOrHFyTgD2h+xrNIt3ZYc0ieFt9p
	 sqh/MHO2Si9lBbB4njqQsADUd8l4G6rop/gcExDITZYUbirjMdEnoXz3Je4leC8V2T
	 XURXs614tJ/mY/gbWjklXxJZj/+xMVoheOXn6mSpsfvVUGXoypFH51KhWXOGf9JKas
	 6hm5k3hU4qRi+a7UrSslnPAve8QpwJOGBikYQ0Lwb0gUe/umqEK6VnIR/PvN/DdZZa
	 kIvS9jif3y4tg==
From: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Song Shuai <songshuaishuai@tinylab.org>,
	linux-riscv@lists.infradead.org
Cc: Nick Kossifidis <mick@ics.forth.gr>,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>
Subject: [PATCH v3 2/2] riscv: kexec_file: Support loading Image binary file
Date: Wed,  9 Apr 2025 21:29:59 +0200
Message-ID: <20250409193004.643839-3-bjorn@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250409193004.643839-1-bjorn@kernel.org>
References: <20250409193004.643839-1-bjorn@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Song Shuai <songshuaishuai@tinylab.org>

This patch creates image_kexec_ops to load Image binary file
for kexec_file_load() syscall.

Signed-off-by: Song Shuai <songshuaishuai@tinylab.org>
Signed-off-by: Björn Töpel <bjorn@rivosinc.com>
---
 arch/riscv/include/asm/image.h         |  2 +
 arch/riscv/include/asm/kexec.h         |  1 +
 arch/riscv/kernel/Makefile             |  2 +-
 arch/riscv/kernel/kexec_image.c        | 96 ++++++++++++++++++++++++++
 arch/riscv/kernel/machine_kexec_file.c |  1 +
 5 files changed, 101 insertions(+), 1 deletion(-)
 create mode 100644 arch/riscv/kernel/kexec_image.c

diff --git a/arch/riscv/include/asm/image.h b/arch/riscv/include/asm/image.h
index e0b319af3681..8927a6ea1127 100644
--- a/arch/riscv/include/asm/image.h
+++ b/arch/riscv/include/asm/image.h
@@ -30,6 +30,8 @@
 			      RISCV_HEADER_VERSION_MINOR)
 
 #ifndef __ASSEMBLY__
+#define riscv_image_flag_field(flags, field)\
+			       (((flags) >> field##_SHIFT) & field##_MASK)
 /**
  * struct riscv_image_header - riscv kernel image header
  * @code0:		Executable code
diff --git a/arch/riscv/include/asm/kexec.h b/arch/riscv/include/asm/kexec.h
index 518825fe4160..b9ee8346cc8c 100644
--- a/arch/riscv/include/asm/kexec.h
+++ b/arch/riscv/include/asm/kexec.h
@@ -56,6 +56,7 @@ extern riscv_kexec_method riscv_kexec_norelocate;
 
 #ifdef CONFIG_KEXEC_FILE
 extern const struct kexec_file_ops elf_kexec_ops;
+extern const struct kexec_file_ops image_kexec_ops;
 
 struct purgatory_info;
 int arch_kexec_apply_relocations_add(struct purgatory_info *pi,
diff --git a/arch/riscv/kernel/Makefile b/arch/riscv/kernel/Makefile
index d56305c8e631..0ead29826419 100644
--- a/arch/riscv/kernel/Makefile
+++ b/arch/riscv/kernel/Makefile
@@ -107,7 +107,7 @@ obj-$(CONFIG_HOTPLUG_CPU)	+= cpu-hotplug.o
 obj-$(CONFIG_PARAVIRT)		+= paravirt.o
 obj-$(CONFIG_KGDB)		+= kgdb.o
 obj-$(CONFIG_KEXEC_CORE)	+= kexec_relocate.o crash_save_regs.o machine_kexec.o
-obj-$(CONFIG_KEXEC_FILE)	+= kexec_elf.o machine_kexec_file.o
+obj-$(CONFIG_KEXEC_FILE)	+= kexec_elf.o kexec_image.o machine_kexec_file.o
 obj-$(CONFIG_CRASH_DUMP)	+= crash_dump.o
 obj-$(CONFIG_VMCORE_INFO)	+= vmcore_info.o
 
diff --git a/arch/riscv/kernel/kexec_image.c b/arch/riscv/kernel/kexec_image.c
new file mode 100644
index 000000000000..26a81774a78a
--- /dev/null
+++ b/arch/riscv/kernel/kexec_image.c
@@ -0,0 +1,96 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * RISC-V Kexec image loader
+ *
+ */
+
+#define pr_fmt(fmt)	"kexec_file(Image): " fmt
+
+#include <linux/err.h>
+#include <linux/errno.h>
+#include <linux/kernel.h>
+#include <linux/kexec.h>
+#include <linux/pe.h>
+#include <linux/string.h>
+#include <asm/byteorder.h>
+#include <asm/image.h>
+
+static int image_probe(const char *kernel_buf, unsigned long kernel_len)
+{
+	const struct riscv_image_header *h = (const struct riscv_image_header *)kernel_buf;
+
+	if (!h || kernel_len < sizeof(*h))
+		return -EINVAL;
+
+	/* According to Documentation/riscv/boot-image-header.rst,
+	 * use "magic2" field to check when version >= 0.2.
+	 */
+
+	if (h->version >= RISCV_HEADER_VERSION &&
+	    memcmp(&h->magic2, RISCV_IMAGE_MAGIC2, sizeof(h->magic2)))
+		return -EINVAL;
+
+	return 0;
+}
+
+static void *image_load(struct kimage *image,
+			char *kernel, unsigned long kernel_len,
+			char *initrd, unsigned long initrd_len,
+			char *cmdline, unsigned long cmdline_len)
+{
+	struct riscv_image_header *h;
+	u64 flags;
+	bool be_image, be_kernel;
+	struct kexec_buf kbuf;
+	int ret;
+
+	/* Check Image header */
+	h = (struct riscv_image_header *)kernel;
+	if (!h->image_size) {
+		ret = -EINVAL;
+		goto out;
+	}
+
+	/* Check endianness */
+	flags = le64_to_cpu(h->flags);
+	be_image = riscv_image_flag_field(flags, RISCV_IMAGE_FLAG_BE);
+	be_kernel = IS_ENABLED(CONFIG_CPU_BIG_ENDIAN);
+	if (be_image != be_kernel) {
+		ret = -EINVAL;
+		goto out;
+	}
+
+	/* Load the kernel image */
+	kbuf.image = image;
+	kbuf.buf_min = 0;
+	kbuf.buf_max = ULONG_MAX;
+	kbuf.top_down = false;
+
+	kbuf.buffer = kernel;
+	kbuf.bufsz = kernel_len;
+	kbuf.mem = KEXEC_BUF_MEM_UNKNOWN;
+	kbuf.memsz = le64_to_cpu(h->image_size);
+	kbuf.buf_align = le64_to_cpu(h->text_offset);
+
+	ret = kexec_add_buffer(&kbuf);
+	if (ret) {
+		pr_err("Error add kernel image ret=%d\n", ret);
+		goto out;
+	}
+
+	image->start = kbuf.mem;
+
+	pr_info("Loaded kernel at 0x%lx bufsz=0x%lx memsz=0x%lx\n",
+		kbuf.mem, kbuf.bufsz, kbuf.memsz);
+
+	ret = load_extra_segments(image, kbuf.mem, kbuf.memsz,
+				  initrd, initrd_len, cmdline, cmdline_len);
+
+out:
+	return ret ? ERR_PTR(ret) : NULL;
+}
+
+const struct kexec_file_ops image_kexec_ops = {
+	.probe = image_probe,
+	.load = image_load,
+};
diff --git a/arch/riscv/kernel/machine_kexec_file.c b/arch/riscv/kernel/machine_kexec_file.c
index 99bd5a5f4234..e36104af2e24 100644
--- a/arch/riscv/kernel/machine_kexec_file.c
+++ b/arch/riscv/kernel/machine_kexec_file.c
@@ -18,6 +18,7 @@
 
 const struct kexec_file_ops * const kexec_file_loaders[] = {
 	&elf_kexec_ops,
+	&image_kexec_ops,
 	NULL
 };
 
-- 
2.45.2

