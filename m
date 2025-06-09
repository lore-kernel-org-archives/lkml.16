Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com [209.85.217.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCB4218DB34
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 17:50:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749491421; cv=none; b=mKUflGUIDf3nUF6s8Isbp8Vsa5F18NhD6m10VM+vHuPbAOF86Cie7GKgm+Kl1W+bxH3QRVh+V+udfUS9JCiteuwGAi2IHYd/5MpphBv/SPmeyZkTwi9fjN9prUCt8WCbxHv1uWOA8wDxo1NlvS4IlPq48mdvg3rcZWZABLNztig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749491421; c=relaxed/simple;
	bh=Qm2FMbTMlu8a44VbpLGTWPNEVrhTNnqPGI6wvTOVGk4=;
	h=From:Date:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oW+amQ/7eyceHtj2yWr+rhdYeMw6w41NTkA4MH7aO30WYzRHvnGli5kWQ3OZnZ8FmH27Sr8NWhh1tMbiSrrJo+CTwOiK5R9bsfRsjFboQX5WsrE+N5AVIFs4W+g+Y86xN0FbqfVLv0Ye3zkMa/P0hMbdeuz+GUFAKNfvkjBl9TA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gtSZMA+r; arc=none smtp.client-ip=209.85.217.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gtSZMA+r"
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-4e45ece38cdso3788178137.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Jun 2025 10:50:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749491418; x=1750096218; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:date:from
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZPh/zTAUptD4lhiq3HEZlLuyfAcXNYfHo1LNClJb28U=;
        b=gtSZMA+rDVSDPSw7C1vovIgkuUY2vq/KxKRMhxjDXuNEPYwMz8smWsh6WoPQw+1G/o
         hGJwRuIgNbxQdey8/qfl+gLaPIgSMDCwej3TdYXgv/OkkN/zvS/WMAeIRN3M+Sfe7MN5
         Sozb3XJvgLsLRBQ2i/CLvRTxnqMDoBlm2/BZI9u4mQJcc6HErU0xRdqBVmpil5jjTK39
         wkmTNcyEztcOHZ24UaB8YvngDCFoeU/XgJuyu28zBrxFoJFIBR9Zvqf/qJnj311ZcSB7
         TwDsQZELLbsRGF3haJY4rghppOfdJBxxXc1F+a7niqWWvI+GYfegBByQXgI+O3iRfrgZ
         Tubg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749491418; x=1750096218;
        h=content-disposition:mime-version:message-id:subject:cc:to:date:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZPh/zTAUptD4lhiq3HEZlLuyfAcXNYfHo1LNClJb28U=;
        b=g5XwV8EUUKloicvhwgbb/DVozrsqi39FJlKCPyWA+ocdJbDku7BETASWtyIQzRL4Ud
         eWsMm1Or144eI2vUUN6jiHmDFGcYwgSgtxVKTdopc5OdWLoN3NBdJaPM9/mQVUJCijNd
         9qflIeLXTMMrkFdD8xhQ3t3RrpzCccb07Wjqkm0MXvxEykAA531Q4YKcThclLb8SO2RS
         HpLTqla5v+Ig4dDiMP357ynG8PlxRe6h6U+L5bH5w3vZQ6CXPHEoUrNPEIaFOik0FFgZ
         h9soF8LhmChnX2bTpg3j+5plG8nRDdTZBUdSJugtzZEKuDB6pxWe2xSuabAw+4x1glCK
         nuUw==
X-Gm-Message-State: AOJu0Yz6I5+Yb6YHlVEGhG1RdPbzugMqGKRfwh1SJ9IYGxtdSndcXLMx
	4104auNAPiWZ15FZB/GKSHDw/cKus8mgJPxnh9xRBAfa6KLuDtr0eYa0d1i8rLPP9a8=
X-Gm-Gg: ASbGncvmRPOPwzODJhFqmEGRE3wWC0GJgORB3+hIKMpUOEKI/kJiVDQrewPxF2CG1vY
	agKmng79sTDDRPZcWF/ABwYQczj1hXjHHZhbDZKPzdZQziS7slo4kEVSAOuY/RsoKpAQtkPxLEa
	L3YYZk/Wn1hoxir1seaCPaXGq/y1X289+nas8cl1G132Jev9clLF+R/y6g1JXsRlaFgiYGoIWW1
	lP6qmqliRbmxB/oKu/WC3VXOEmNKWPKgI+KKKdYgXLrVl3nN/Cu8gwKjrbEolsWE/G0jdquaaNb
	j1vsZAFVNPgCMsOhMp5sSDjKFqsdIbbHPqFVx6uebg1nROQ7kBdF//eD/Xo0r70=
X-Google-Smtp-Source: AGHT+IEg54iD2AlcFNr953MlCul0IWYmGYqdfBvGBtl0L4UeLk8DkKnkVgEsPpZksieoUBPtLyVx6g==
X-Received: by 2002:a05:6102:dc7:b0:4e5:8d09:7b12 with SMTP id ada2fe7eead31-4e7a5d8ed98mr600150137.7.1749491417937;
        Mon, 09 Jun 2025 10:50:17 -0700 (PDT)
Received: from localhost ([187.19.172.173])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4e790dcf2c4sm2393065137.13.2025.06.09.10.50.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 10:50:17 -0700 (PDT)
From: arnaldo.melo@gmail.com
X-Google-Original-From: Arnaldo Carvalho de Melo <acme@kernel.org>, Arnaldo Carvalho de Melo <acme@redhat.com>
Date: Mon, 9 Jun 2025 14:50:14 -0300
To: linux-kernel@vger.kernel.org
Cc: Andrei Vagin <avagin@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Andrii Nakryiko <andrii@kernel.org>,
	"Darrick J. Wong" <djwong@kernel.org>,
	Eric Biggers <ebiggers@google.com>, Ian Rogers <irogers@google.com>,
	James Clark <james.clark@linaro.org>, Jiri Olsa <jolsa@kernel.org>,
	John Garry <john.g.garry@oracle.com>,
	Kan Liang <kan.liang@linux.intel.com>,
	"Liam R. Howlett" <liam.howlett@oracle.com>,
	Namhyung Kim <namhyung@kernel.org>, sources@x1,
	Adrian Hunter <adrian.hunter@intel.com>
Subject: [PATCH 1/1 FYI] tools headers: Update the fs headers with the kernel
Message-ID: <aEce1keWdO-vGeqe@x1>
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

---

To pick up changes from:

  5d894321c49e6137 ("fs: add atomic write unit max opt to statx")
  a516403787e08119 ("fs/proc: extend the PAGEMAP_SCAN ioctl to report guard regions")
  c07d3aede2b26830 ("fscrypt: add support for hardware-wrapped keys")

These are used to beautify fs syscall arguments, albeit the changes in
this update are not affecting those beautifiers.

This addresses these tools/ build warnings:

  Warning: Kernel ABI header differences:
  diff -u tools/include/uapi/linux/stat.h include/uapi/linux/stat.h
  diff -u tools/perf/trace/beauty/include/uapi/linux/fs.h include/uapi/linux/fs.h
  diff -u tools/perf/trace/beauty/include/uapi/linux/mount.h include/uapi/linux/mount.h
  diff -u tools/perf/trace/beauty/include/uapi/linux/stat.h include/uapi/linux/stat.h

Please see tools/include/uapi/README for details (it's in the first patch
of this series).

Cc: Adrian Hunter <adrian.hunter@intel.com>
Cc: Andrei Vagin <avagin@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Andrii Nakryiko <andrii@kernel.org>
Cc: Darrick J. Wong <djwong@kernel.org>
Cc: Eric Biggers <ebiggers@google.com>
Cc: Ian Rogers <irogers@google.com>
Cc: James Clark <james.clark@linaro.org>
Cc: Jiri Olsa <jolsa@kernel.org>
Cc: John Garry <john.g.garry@oracle.com>
Cc: Kan Liang <kan.liang@linux.intel.com>
Cc: Liam R. Howlett <liam.howlett@oracle.com>
Cc: Namhyung Kim <namhyung@kernel.org>
Signed-off-by: Arnaldo Carvalho de Melo <acme@redhat.com>
---
 tools/include/uapi/linux/fscrypt.h                | 6 ++++--
 tools/include/uapi/linux/stat.h                   | 8 ++++++--
 tools/perf/trace/beauty/include/uapi/linux/fs.h   | 1 +
 tools/perf/trace/beauty/include/uapi/linux/stat.h | 8 ++++++--
 4 files changed, 17 insertions(+), 6 deletions(-)

diff --git a/tools/include/uapi/linux/fscrypt.h b/tools/include/uapi/linux/fscrypt.h
index 7a8f4c2901873f25..3aff99f2696a05cb 100644
--- a/tools/include/uapi/linux/fscrypt.h
+++ b/tools/include/uapi/linux/fscrypt.h
@@ -119,7 +119,7 @@ struct fscrypt_key_specifier {
  */
 struct fscrypt_provisioning_key_payload {
 	__u32 type;
-	__u32 __reserved;
+	__u32 flags;
 	__u8 raw[];
 };
 
@@ -128,7 +128,9 @@ struct fscrypt_add_key_arg {
 	struct fscrypt_key_specifier key_spec;
 	__u32 raw_size;
 	__u32 key_id;
-	__u32 __reserved[8];
+#define FSCRYPT_ADD_KEY_FLAG_HW_WRAPPED	0x00000001
+	__u32 flags;
+	__u32 __reserved[7];
 	__u8 raw[];
 };
 
diff --git a/tools/include/uapi/linux/stat.h b/tools/include/uapi/linux/stat.h
index f78ee3670dd5d7c8..1686861aae20a6e4 100644
--- a/tools/include/uapi/linux/stat.h
+++ b/tools/include/uapi/linux/stat.h
@@ -182,8 +182,12 @@ struct statx {
 	/* File offset alignment for direct I/O reads */
 	__u32	stx_dio_read_offset_align;
 
-	/* 0xb8 */
-	__u64	__spare3[9];	/* Spare space for future expansion */
+	/* Optimised max atomic write unit in bytes */
+	__u32	stx_atomic_write_unit_max_opt;
+	__u32	__spare2[1];
+
+	/* 0xc0 */
+	__u64	__spare3[8];	/* Spare space for future expansion */
 
 	/* 0x100 */
 };
diff --git a/tools/perf/trace/beauty/include/uapi/linux/fs.h b/tools/perf/trace/beauty/include/uapi/linux/fs.h
index e762e1af650c4bf0..0098b0ce8ccb1f19 100644
--- a/tools/perf/trace/beauty/include/uapi/linux/fs.h
+++ b/tools/perf/trace/beauty/include/uapi/linux/fs.h
@@ -361,6 +361,7 @@ typedef int __bitwise __kernel_rwf_t;
 #define PAGE_IS_PFNZERO		(1 << 5)
 #define PAGE_IS_HUGE		(1 << 6)
 #define PAGE_IS_SOFT_DIRTY	(1 << 7)
+#define PAGE_IS_GUARD		(1 << 8)
 
 /*
  * struct page_region - Page region with flags
diff --git a/tools/perf/trace/beauty/include/uapi/linux/stat.h b/tools/perf/trace/beauty/include/uapi/linux/stat.h
index f78ee3670dd5d7c8..1686861aae20a6e4 100644
--- a/tools/perf/trace/beauty/include/uapi/linux/stat.h
+++ b/tools/perf/trace/beauty/include/uapi/linux/stat.h
@@ -182,8 +182,12 @@ struct statx {
 	/* File offset alignment for direct I/O reads */
 	__u32	stx_dio_read_offset_align;
 
-	/* 0xb8 */
-	__u64	__spare3[9];	/* Spare space for future expansion */
+	/* Optimised max atomic write unit in bytes */
+	__u32	stx_atomic_write_unit_max_opt;
+	__u32	__spare2[1];
+
+	/* 0xc0 */
+	__u64	__spare3[8];	/* Spare space for future expansion */
 
 	/* 0x100 */
 };
-- 
2.49.0

