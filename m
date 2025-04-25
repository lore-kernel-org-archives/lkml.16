Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 868E622301;
	Fri, 25 Apr 2025 00:33:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745541227; cv=none; b=m9FT3ZghyylE2GTvBzdfiTEm8A4BU6QDS6SqeKhTTvNLvCfjB4NjXekZT49fZPZ2GNbFcaoRB+ZxtoLBhfrsoMP8NTscoPcwWGLyTLYkj+reKY6tUm7hRIoekdf1FMumN7kNVqaq0nN3BdXStVz/Myd7NrD1+TZueiMjqY3FkL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745541227; c=relaxed/simple;
	bh=8dKg+gxw1L61gv9qTm3DKR2v0jmhRr/YeqeNDI8CLi0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kw7Le9weSWgksi1jYK3o+ZWZK9c6Ro3EXuX3xOYtTNsM21nPLS5mwTu/Y3Vcl5LORuVg41N9TnsnkghY0zeiuVWMezcp35qALS5jaBzsT8ihoLYZgrvfeB9D6A7VS4NCvoUcf/U+q9lyIgyOujP5o/LXNBBrU5SjWX1D0d2V4Es=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G3o/hAlL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G3o/hAlL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FF47C4CEE3;
	Fri, 25 Apr 2025 00:33:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745541225;
	bh=8dKg+gxw1L61gv9qTm3DKR2v0jmhRr/YeqeNDI8CLi0=;
	h=Date:From:To:Cc:Subject:From;
	b=G3o/hAlLxPfqX3BsBk2xxAGTRsj8oHscghHg3hD4uFdErsyBILQvGDCfWmLKwXalT
	 Jj13JaYAHdDXvd+OxrZPvqsBQksAu29HtZ6uRVcDDSFQlaZSUZgOZQlQU8YksOho3e
	 iKRjKoLwt9ayNISCEBxjlkx16/QiGdmqxfHBeD/JCNLr5h+aUJLauEEMiiH1Ve4D22
	 3cJV7sHg2D3XrbBTyTeFnkmWEtV9U3hvdMteYqh/r11jNbfM6LnWpW1og3dbkli3yM
	 eDyl7OEjoyI0zdXnk4wnyEh8+dsvgrbwRnJ/KrCAy3DfHpULIRfp5bCmLvhuNhg8+V
	 zZ3WoYznD00Zg==
Date: Thu, 24 Apr 2025 17:33:42 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: llvm@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Adding __popcountsi2 and __popcountdi2
Message-ID: <20250425003342.GA795313@ax162>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Linus,

Since I ran into problems at pull request time previously, I figured I
would save myself some trouble and gauge your opinion up front. How
palatable would the diff at the end of the thread be for the kernel?
Clang would like to start emitting calls to __popcountsi2 and
__popcountdi2 [1] for certain architectures (ARM and RISC-V), which
would normally be a part of the compiler runtime but obviously the
kernel does not link against it so it breaks the build. I figured added
these may not be as bad as the wcslen() case because most architectures
generally have an optimized popcount implementation and I am not sure
compiler builtins are banned entirely from the kernel but I can
understand if it is still contentious. It sounds like GCC has previously
wanted to something similar [2] and it was somewhat brought up on the
mailing lists [3] but never persued further it seems. Since this is a
compiler runtime function, '-fno-builtin' would not work to avoid this.

Cheers,
Nathan

[1]: https://github.com/llvm/llvm-project/pull/101786
[2]: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=105253#c10
[3]: https://lore.kernel.org/YlSb5D3rDTyCWpay@tucnak/

diff --git a/lib/Makefile b/lib/Makefile
index f07b24ce1b3f..0240fa7d6b5b 100644
--- a/lib/Makefile
+++ b/lib/Makefile
@@ -52,7 +52,7 @@ obj-y	+= lockref.o
 
 obj-y += bcd.o sort.o parser.o debug_locks.o random32.o \
 	 bust_spinlocks.o kasprintf.o bitmap.o scatterlist.o \
-	 list_sort.o uuid.o iov_iter.o clz_ctz.o \
+	 list_sort.o uuid.o iov_iter.o clz_ctz.o popcount.o \
 	 bsearch.o find_bit.o llist.o lwq.o memweight.o kfifo.o \
 	 percpu-refcount.o rhashtable.o base64.o \
 	 once.o refcount.o rcuref.o usercopy.o errseq.o bucket_locks.o \
diff --git a/lib/popcount.c b/lib/popcount.c
new file mode 100644
index 000000000000..0234961cc35e
--- /dev/null
+++ b/lib/popcount.c
@@ -0,0 +1,22 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * The functions in this file aren't called directly, but may be emitted
+ * by the compiler.
+ */
+
+#include <linux/bitops.h>
+#include <linux/export.h>
+
+int __popcountsi2(unsigned int val);
+int __popcountsi2(unsigned int val)
+{
+	return __arch_hweight32(val);
+}
+EXPORT_SYMBOL(__popcountsi2);
+
+int __popcountdi2(unsigned long long val);
+int __popcountdi2(unsigned long long val)
+{
+	return __arch_hweight64(val);
+}
+EXPORT_SYMBOL(__popcountdi2);
