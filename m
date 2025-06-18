Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com [209.85.221.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 013122E54AB
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 12:50:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750251058; cv=none; b=Xw9F9TOPV5AUPhDz3A/BwjIeuA+rDwt+nz/Rz8o+Z3kkDIxSGHlIR69uYzzUf+OHPc9kA6BLSoCY2nmnNvNrglaaEFBKzj6WLGyV/VXsQzoI9uDkkKFAw6WLapwoxgAr98rNyFncyZ5EVw2FFQplrS64ZaUb8o3TVKqfcSsyuFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750251058; c=relaxed/simple;
	bh=tYOMqDbBl4oLeXidO5nb93lks+dyLJ+aBvItgw9rtgQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=deKwBBy/4dGe2ycKxMDeD63BjQQ0iEmVcwLXlaUszwRFtIGnw7eVViCaoxuRm8/Y3+1WYtH4OK9N3KGcKwoZwGugR2Ydf8NmYuPbKVUVbyYzVcvZNk05VIIuXGUuPO4mhLlY63Og1MDKla7gyNVIiR5QP17iTlDQq1GkuCDLj18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=UPe9HjW+; arc=none smtp.client-ip=209.85.221.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="UPe9HjW+"
Received: by mail-wr1-f65.google.com with SMTP id ffacd0b85a97d-3a531fcaa05so4215330f8f.3
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 05:50:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1750251054; x=1750855854; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/NbQn0+rtk9R9UQB3ZjUl1RmfRkgy76SQGVXPRmwvTI=;
        b=UPe9HjW+MI5cyVjjpsICuwdZ2B5jBGdvbqYjo4twPlv6+X6SoV2cBale59/gdLYETv
         FnVxCS2nBlDCPMPcZGRkVhfScnQ2yynWP5pSEyOLWVQbz4Kj/Dtb2IHmswwSa+X+7ZYz
         5ImjUD0lWFXU16l/co3EqkpoDwrJDdLwEOiJ/8dVCkS2gpgQureiVNGls/WqfaNIbVHF
         Q8KblZ+uIIDKwZs0LtG1sDgnk2BzTtA6V4GF7s8vVFXqRyLEHm8+goArXxuEiSRBsxS2
         cil4qfKe+Z5kYcq2+jrhRbZotmdf/tIRUE/iYjaKfswyRUIfZ9LxNN6q1+j9cKDQB69P
         bnaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750251054; x=1750855854;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/NbQn0+rtk9R9UQB3ZjUl1RmfRkgy76SQGVXPRmwvTI=;
        b=ivG9IeK0YKDyvbj3KXDNTu3YxluSMJVtebu/CmZd9rxOfHoyUWr58ogLwYl9QuxUZj
         IJO9m7gHjsQmTAwhEQgNYXSrBDguslCPKnKDlOw24sfQagCu0Ky2HqOfTYd9UiPZH7RU
         crZqPq6D8O9tAZMd4BGufBPuc3u/eQYAF5O4fBR8xd+IFD7enZKyvrde1YEWC8xxStRT
         GBXLkss7Gf3Pfa/QaKF8lODShWJ4UkNwnI+uX48skmJdisKYiuQsKaRzIZxvSL86ZypO
         BVNZpBJTxMh9g2nm0r4RvI1vaP1GFdc+Hs38lp1zPV7f3PgH3lCAhcy4FV9sZcmBFhCQ
         vwpg==
X-Forwarded-Encrypted: i=1; AJvYcCXcDN6wdrOAYVsZUPrHGgumIJb1C2BdZ09AEqzBHpr0GbNJ5kG7KjdB7yNyjYbR0F6vKkmjizibg+VpZaY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyzSnSeb8FGuTjKeXiNaEftV46dEQIs4I7cqGxFgSAePJY7Z+2B
	LqmPp410Fis1LEzEiKO4O/Zd6M0GdL7ZFuoPE4mEIQnRo9POF/OmEf1rGKkSGTuN8VM=
X-Gm-Gg: ASbGncv+cCIy75osqALtIMDrLwMJE3OlAmTHFaSdURyQEaDP0XlRRI9pdt9BxvxjK6C
	x7SnIH8NIrjPWLavnWt3Ia2iqXwSd//DHCfpUKBG0uTMKoz7mHbLtXRDCVkzT8gXQSYKuiQrPpA
	sezSYhGe2wx0/AI3pL8tkDYCqiBdGikK1aXKIc2v6nOPqBRmusgoYSDLPMXSiJxYye84OOBU+df
	AuIm28+Q8SCUApWqjl40E+kyKJtdbbAI0YT74Mw2THoilejeeHxzI8ub3JHclAhUt7Bq3IfFD4J
	Vz0/+goTESs99r6ieP95TxGZqSNNZ0Z20usgOgcUfPCgFKEEOZyx+knK8T2pRA==
X-Google-Smtp-Source: AGHT+IFEWHAu8VwBRrGTbvGEGcd39Os4PAnx0WLvaMN2iQm+8pQRf6KkKity1k65/583ahjCju2ddw==
X-Received: by 2002:a05:6000:1a88:b0:3a5:2182:bce2 with SMTP id ffacd0b85a97d-3a5723a2928mr14371409f8f.17.1750251054051;
        Wed, 18 Jun 2025 05:50:54 -0700 (PDT)
Received: from zovi.suse.cz ([193.86.92.181])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453599c9854sm13143435e9.1.2025.06.18.05.50.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 05:50:53 -0700 (PDT)
From: Petr Pavlu <petr.pavlu@suse.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Suren Baghdasaryan <surenb@google.com>,
	Kent Overstreet <kent.overstreet@linux.dev>,
	Arnd Bergmann <arnd@arndb.de>,
	Casey Chen <cachen@purestorage.com>,
	linux-arch@vger.kernel.org,
	linux-modules@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Petr Pavlu <petr.pavlu@suse.com>
Subject: [PATCH v2] codetag: Avoid unused alloc_tags sections/symbols
Date: Wed, 18 Jun 2025 14:50:35 +0200
Message-ID: <20250618125037.53182-1-petr.pavlu@suse.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

With CONFIG_MEM_ALLOC_PROFILING=n, vmlinux and all modules unnecessarily
contain the symbols __start_alloc_tags and __stop_alloc_tags, which define
an empty range. In the case of modules, the presence of these symbols also
forces the linker to create an empty .codetag.alloc_tags section.

Update codetag.lds.h to make the data conditional on
CONFIG_MEM_ALLOC_PROFILING.

Signed-off-by: Petr Pavlu <petr.pavlu@suse.com>
Reviewed-by: Kent Overstreet <kent.overstreet@linux.dev>
Reviewed-by: Suren Baghdasaryan <surenb@google.com>
---

Changes since v1 [1]:
- Trivially rebased the patch on top of "alloc_tag: remove empty module tag
  section" [2].

[1] https://lore.kernel.org/all/20250313143002.9118-1-petr.pavlu@suse.com/
[2] https://lore.kernel.org/all/20250610162258.324645-1-cachen@purestorage.com/

 include/asm-generic/codetag.lds.h | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/include/asm-generic/codetag.lds.h b/include/asm-generic/codetag.lds.h
index a45fe3d141a1..a14f4bdafdda 100644
--- a/include/asm-generic/codetag.lds.h
+++ b/include/asm-generic/codetag.lds.h
@@ -2,6 +2,12 @@
 #ifndef __ASM_GENERIC_CODETAG_LDS_H
 #define __ASM_GENERIC_CODETAG_LDS_H
 
+#ifdef CONFIG_MEM_ALLOC_PROFILING
+#define IF_MEM_ALLOC_PROFILING(...) __VA_ARGS__
+#else
+#define IF_MEM_ALLOC_PROFILING(...)
+#endif
+
 #define SECTION_WITH_BOUNDARIES(_name)	\
 	. = ALIGN(8);			\
 	__start_##_name = .;		\
@@ -9,7 +15,7 @@
 	__stop_##_name = .;
 
 #define CODETAG_SECTIONS()		\
-	SECTION_WITH_BOUNDARIES(alloc_tags)
+	IF_MEM_ALLOC_PROFILING(SECTION_WITH_BOUNDARIES(alloc_tags))
 
 #define MOD_SEPARATE_CODETAG_SECTION(_name)	\
 	.codetag.##_name : {			\
@@ -22,6 +28,6 @@
  * unload them individually once unused.
  */
 #define MOD_SEPARATE_CODETAG_SECTIONS()		\
-	MOD_SEPARATE_CODETAG_SECTION(alloc_tags)
+	IF_MEM_ALLOC_PROFILING(MOD_SEPARATE_CODETAG_SECTION(alloc_tags))
 
 #endif /* __ASM_GENERIC_CODETAG_LDS_H */

base-commit: 52da431bf03b5506203bca27fe14a97895c80faf
prerequisite-patch-id: acb6e2f6708cd75488806308bfecf682b2367dc9
-- 
2.49.0

