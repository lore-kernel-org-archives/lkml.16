Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 611C029B217
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 15:38:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749742698; cv=none; b=n5SibxUTUlShMOpJQUXq2fpZtUbKa5aFLKHy39W4d0tlEVAdhcUt2DjkM8Ih4dLOKw9IzkkOMaghsHcAO8gTcscivxnTQfTVScW1uM6ZvlYx3JZXLKTNvPEix0V9j00uZLQjX2hHumHSRg8IFOl0lK5VY0D/pqFTR7+wEOI4SbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749742698; c=relaxed/simple;
	bh=V/KXZQvn72uFeeoa6IasivvIy46FqL7ppaS0T08g54c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dyzsfMtjLEKhZwfBAbBVqxgprFuQ5F6wlqydFCTeVntGCPYcNbGtyC0tSZNBE5SDdlLLPKm6ZrVJNgngLAKQ2YPy9JsxU/PbqRkP8oPxUbA5KcpOGzTZE2bJF+xtX85XkgDFQ4ZTrZ5hAGhDt+dvSpHG6RJfJw2RdHTm4JB8xzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X2ghaKKj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X2ghaKKj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44410C4CEEA;
	Thu, 12 Jun 2025 15:38:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749742695;
	bh=V/KXZQvn72uFeeoa6IasivvIy46FqL7ppaS0T08g54c=;
	h=Date:From:To:Cc:Subject:From;
	b=X2ghaKKj01Gfj9wpIdjCTx1VOwqY496Z8LXOLfhYePS0U/TjoNI7bgorHZsbJd8ie
	 KTB7xlQy17Oj9kMSsiE31eXef3Zi2aFZBEt7JsRDE0l2giKdRuLv8MFDt/8GgkS7cV
	 d8/rDJwLFAEfcQ31+HxlgPvsLKWPUFdxPggzwlsdilGNRgsb676IWWISAOPssoMs4P
	 M09bbgs2AA8isgCmeZ4+kZRQMUDvaNPkAlbt9MFmv/DnEime4Yt4Cdnzdfy2OmRaXa
	 0GKwr4cJeoWnr8x/RfEY59SmY0W7jTjwDgj672Xvl4+q+Q+CrwcQFAkRvXAbIeWiO+
	 vxPnU7a5Lebag==
Date: Thu, 12 Jun 2025 12:38:12 -0300
From: Arnaldo Carvalho de Melo <acme@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Adrian Hunter <adrian.hunter@intel.com>,
	Ian Rogers <irogers@google.com>,
	James Clark <james.clark@linaro.org>, Jiri Olsa <jolsa@kernel.org>,
	Kan Liang <kan.liang@linux.intel.com>,
	Lucas De Marchi <lucas.demarchi@intel.com>,
	Namhyung Kim <namhyung@kernel.org>,
	Vincent Mailhol <mailhol.vincent@wanadoo.fr>,
	Yury Norov <yury.norov@gmail.com>
Subject: [PATCH 1/1 fyi] tools headers: Synchronize linux/bits.h with the
 kernel sources
Message-ID: <aEr0ZJ60EbshEy6p@x1>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tldr; Just FYI, I'm carrying this on the perf tools tree.

Full explanation:

There used to be no copies, with tools/ code using kernel headers
directly. From time to time tools/perf/ broke due to legitimate kernel
hacking. At some point Linus complained about such direct usage. Then we
adopted the current model.

See further details at:

 https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/tools/include/uapi/README

To pick up the changes in this cset:

  5b572e8a9f3dcd6e ("bits: introduce fixed-type BIT_U*()")
  19408200c094858d ("bits: introduce fixed-type GENMASK_U*()")
  31299a5e02112411 ("bits: add comments and newlines to #if, #else and #endif directives")

This addresses these perf build warnings:

  Warning: Kernel ABI header differences:
    diff -u tools/include/linux/bits.h include/linux/bits.h

Please see tools/include/uapi/README for further details.

Cc: Adrian Hunter <adrian.hunter@intel.com>
Cc: Ian Rogers <irogers@google.com>
Cc: James Clark <james.clark@linaro.org>
Cc: Jiri Olsa <jolsa@kernel.org>
Cc: Kan Liang <kan.liang@linux.intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Namhyung Kim <namhyung@kernel.org>
Cc: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
Cc: Yury Norov <yury.norov@gmail.com>
Link: https://lore.kernel.org/r/
Signed-off-by: Arnaldo Carvalho de Melo <acme@redhat.com>
---
 tools/include/linux/bits.h | 57 ++++++++++++++++++++++++++++++++++++--
 1 file changed, 55 insertions(+), 2 deletions(-)

diff --git a/tools/include/linux/bits.h b/tools/include/linux/bits.h
index 14fd0ca9a6cd1733..7ad0562191153471 100644
--- a/tools/include/linux/bits.h
+++ b/tools/include/linux/bits.h
@@ -12,6 +12,7 @@
 #define BIT_ULL_MASK(nr)	(ULL(1) << ((nr) % BITS_PER_LONG_LONG))
 #define BIT_ULL_WORD(nr)	((nr) / BITS_PER_LONG_LONG)
 #define BITS_PER_BYTE		8
+#define BITS_PER_TYPE(type)	(sizeof(type) * BITS_PER_BYTE)
 
 /*
  * Create a contiguous bitmask starting at bit position @l and ending at
@@ -19,16 +20,68 @@
  * GENMASK_ULL(39, 21) gives us the 64bit vector 0x000000ffffe00000.
  */
 #if !defined(__ASSEMBLY__)
+
+/*
+ * Missing asm support
+ *
+ * GENMASK_U*() and BIT_U*() depend on BITS_PER_TYPE() which relies on sizeof(),
+ * something not available in asm. Nevertheless, fixed width integers is a C
+ * concept. Assembly code can rely on the long and long long versions instead.
+ */
+
 #include <linux/build_bug.h>
 #include <linux/compiler.h>
+#include <linux/overflow.h>
+
 #define GENMASK_INPUT_CHECK(h, l) BUILD_BUG_ON_ZERO(const_true((l) > (h)))
-#else
+
+/*
+ * Generate a mask for the specified type @t. Additional checks are made to
+ * guarantee the value returned fits in that type, relying on
+ * -Wshift-count-overflow compiler check to detect incompatible arguments.
+ * For example, all these create build errors or warnings:
+ *
+ * - GENMASK(15, 20): wrong argument order
+ * - GENMASK(72, 15): doesn't fit unsigned long
+ * - GENMASK_U32(33, 15): doesn't fit in a u32
+ */
+#define GENMASK_TYPE(t, h, l)					\
+	((t)(GENMASK_INPUT_CHECK(h, l) +			\
+	     (type_max(t) << (l) &				\
+	      type_max(t) >> (BITS_PER_TYPE(t) - 1 - (h)))))
+
+#define GENMASK_U8(h, l)	GENMASK_TYPE(u8, h, l)
+#define GENMASK_U16(h, l)	GENMASK_TYPE(u16, h, l)
+#define GENMASK_U32(h, l)	GENMASK_TYPE(u32, h, l)
+#define GENMASK_U64(h, l)	GENMASK_TYPE(u64, h, l)
+
+/*
+ * Fixed-type variants of BIT(), with additional checks like GENMASK_TYPE(). The
+ * following examples generate compiler warnings due to -Wshift-count-overflow:
+ *
+ * - BIT_U8(8)
+ * - BIT_U32(-1)
+ * - BIT_U32(40)
+ */
+#define BIT_INPUT_CHECK(type, nr) \
+	BUILD_BUG_ON_ZERO(const_true((nr) >= BITS_PER_TYPE(type)))
+
+#define BIT_TYPE(type, nr) ((type)(BIT_INPUT_CHECK(type, nr) + BIT_ULL(nr)))
+
+#define BIT_U8(nr)	BIT_TYPE(u8, nr)
+#define BIT_U16(nr)	BIT_TYPE(u16, nr)
+#define BIT_U32(nr)	BIT_TYPE(u32, nr)
+#define BIT_U64(nr)	BIT_TYPE(u64, nr)
+
+#else /* defined(__ASSEMBLY__) */
+
 /*
  * BUILD_BUG_ON_ZERO is not available in h files included from asm files,
  * disable the input check if that is the case.
  */
 #define GENMASK_INPUT_CHECK(h, l) 0
-#endif
+
+#endif /* !defined(__ASSEMBLY__) */
 
 #define GENMASK(h, l) \
 	(GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
-- 
2.49.0

