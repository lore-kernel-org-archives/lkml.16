Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD4A019E7F9
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 15:56:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745510189; cv=none; b=mL/aKVkLieGqYxVMfWdNp2jTifKdbKP8o+VnKQQBdZczF7wl1vxVlI7aIVlstZMCAwaoALQqCfNP9rN2hT3SPPDfpPR8SZGApVfUxfgaOxv7fouz10gdL0W0AeYSx56qR9t/ydpJcFZrbHlUROBVE7JG5ouXJy3AMYv4b5Ef+l4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745510189; c=relaxed/simple;
	bh=oIM+ogSNgF6+bXV/fYjgfMeq5DOr8873BJuP/FT9saY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dXKatAh+QHQy6s/JD/ojtyS72Zk44CHzCOwIV8VQ7uJTp1dgnfTYt6KD8MMpSz79dq9tD5W0mig+POf4eITFhk/F+pPUO2kv21jYNYUZyB+DZ4+jD/ugflTNAmLZXicw2lfwXmZf05qIzhv0flQLChWX3fsjQzHoPXkhkRRdNm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kXCxZzOH; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kXCxZzOH"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-22435603572so14656365ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 08:56:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745510187; x=1746114987; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=D+990TcBUFhtTTgKom6UuFD++adz/Rg+B7elTs/xmlw=;
        b=kXCxZzOHW2O92uv7Iqxx6S4467VNmQkppja34txSK4AB5fgo2GQMh3Jk3F4mgsxgE6
         LmC6P6m/CvK+cLZvp/ieAOKZWgzHYNTkYX1hiMrcE+6Kf+l3cuQL9CvhCI5F/4zuiB5z
         eQl6LomHbfYRpVtaEAejAHskagFIe414+sTzCDBu3b6tptCD1xa+P6EO2HRSLdL3I4oU
         p970WKN+1ZjB9MGfIz18LTWwpcllxIJkfu8dOueQ5LpRDF2aRnPZzkQFNhxWXOwks/f8
         Sl1CDV5sbYIi4AHdL5qdXGzPmUl8NmwRb292QOUY2LS4q8Id5xue9ngEGpArh1Q/yNt9
         CEbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745510187; x=1746114987;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D+990TcBUFhtTTgKom6UuFD++adz/Rg+B7elTs/xmlw=;
        b=KYhr6MopkgxrgnI2h+J54p5TmWUNK+gEufzhcAosCpVMs7/nyf1Nf120IGzTYrO1TP
         1gvThWA6H91ELXksCaLt8IwyctaHodA6yY4MgC9kA+K+3V+kz6PCy2VMNzA6s91XQ47o
         6uIzLvq109Qf+VmDXT+q8cw4XwPdZ1I5eaxehzwathoXi6U6UhrdAbjR76woXMW47tVn
         2gaNsMWdbncS7yc5AchOfnlNpgblSWlByOupgLAF9XECdqHCeErt49i4S9GsK4vygK1o
         sC/8fgUG3rjw4TbGv/dnlMJbALSbjp3arl0zBDxAbaSaXAhF4WYbwAxSFltPx4ob9Soe
         Ra8g==
X-Forwarded-Encrypted: i=1; AJvYcCWLMwvwORgoSmVzREOzQx7sN6I9E/gkxEA5CD7BFsY0YIO69JBno1ADgFPO4SbRyVLcjUQJ6u4Skgk44/E=@vger.kernel.org
X-Gm-Message-State: AOJu0YxEP8DHupJRFO1mxp2SUb7fuRGL24MtXTghE7onxpbVD2OrJhy0
	INdoDdg3BYiAtC0UvSHXBC2dU26YIMm+KZwIj5wtE0kJunIn2ROG
X-Gm-Gg: ASbGncuPywVz2XE+ikMvnf2bfOLSpRRtcs9KlzPr9KEY2ScMjqwj2s3ycNt/BimdOLa
	2yL2aK66dnbTrTmF+7ZoAUBVZIhdCbOBqKdbMsKMquh/P8sL2J66TXgqGVz2hMzpLMcBWglHqrF
	ckClcPUyBeYoJuFSq7Vr1Jspr+AmDSJh5A3LCD8LDnYVRuUYMikgLf7UxXMWySB8MN9LQMyCo+L
	8o3q4NbgaDkplk7DbopyvBkCXBuwXTkql3UmLOoyAqCrRutislyj9oPPNVMPYunPcRL5HOoXqrG
	oyP3QStiN0Udo6453pIM8OMXRT8ZXUpKr8J2m5sgxXX5EUFpdP0e
X-Google-Smtp-Source: AGHT+IHokjhN3alNq7Wfj0FxT/nwbc0QoFDiP1nT0BXfFxf8IUIktiByl37EfV5cp3+21OPOjeHn2w==
X-Received: by 2002:a17:903:2a8e:b0:220:df73:b639 with SMTP id d9443c01a7336-22db3d7b0e3mr49535955ad.36.1745510186794;
        Thu, 24 Apr 2025 08:56:26 -0700 (PDT)
Received: from localhost.localdomain ([124.156.216.125])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db4d76fc0sm15218905ad.27.2025.04.24.08.56.23
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 24 Apr 2025 08:56:26 -0700 (PDT)
From: Lance Yang <ioworker0@gmail.com>
X-Google-Original-From: Lance Yang <lance.yang@linux.dev>
To: akpm@linux-foundation.org
Cc: mingzhe.yang@ly.com,
	david@redhat.com,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Lance Yang <lance.yang@linux.dev>
Subject: [PATCH v3 1/1] mm/rmap: inline folio_test_large_maybe_mapped_shared() into callers
Date: Thu, 24 Apr 2025 23:56:06 +0800
Message-ID: <20250424155606.57488-1-lance.yang@linux.dev>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lance Yang <lance.yang@linux.dev>

To prevent the function from being used when CONFIG_MM_ID is disabled, we
intend to inline it into its few callers, which also would help maintain
the expected code placement.

Suggested-by: David Hildenbrand <david@redhat.com>
Signed-off-by: Lance Yang <lance.yang@linux.dev>
---
v2 -> v3:
 * Inline the function, suggested by David
 * https://lore.kernel.org/all/20250418152228.20545-1-lance.yang@linux.dev

v1 -> v2:
 * Update the changelog, suggested by Andrew and David
 * https://lore.kernel.org/linux-mm/20250417124908.58543-1-ioworker0@gmail.com

 include/linux/mm.h         | 2 +-
 include/linux/page-flags.h | 4 ----
 include/linux/rmap.h       | 2 +-
 mm/memory.c                | 4 ++--
 4 files changed, 4 insertions(+), 8 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index bf55206935c4..67e3b4f9cdc8 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -2303,7 +2303,7 @@ static inline bool folio_maybe_mapped_shared(struct folio *folio)
 	 */
 	if (mapcount <= 1)
 		return false;
-	return folio_test_large_maybe_mapped_shared(folio);
+	return test_bit(FOLIO_MM_IDS_SHARED_BITNUM, &folio->_mm_ids);
 }
 
 #ifndef HAVE_ARCH_MAKE_FOLIO_ACCESSIBLE
diff --git a/include/linux/page-flags.h b/include/linux/page-flags.h
index e6a21b62dcce..8107c2ea43c4 100644
--- a/include/linux/page-flags.h
+++ b/include/linux/page-flags.h
@@ -1230,10 +1230,6 @@ static inline int folio_has_private(const struct folio *folio)
 	return !!(folio->flags & PAGE_FLAGS_PRIVATE);
 }
 
-static inline bool folio_test_large_maybe_mapped_shared(const struct folio *folio)
-{
-	return test_bit(FOLIO_MM_IDS_SHARED_BITNUM, &folio->_mm_ids);
-}
 #undef PF_ANY
 #undef PF_HEAD
 #undef PF_NO_TAIL
diff --git a/include/linux/rmap.h b/include/linux/rmap.h
index 6b82b618846e..c4f4903b1088 100644
--- a/include/linux/rmap.h
+++ b/include/linux/rmap.h
@@ -223,7 +223,7 @@ static inline void __folio_large_mapcount_sanity_checks(const struct folio *foli
 	VM_WARN_ON_ONCE(folio_mm_id(folio, 1) != MM_ID_DUMMY &&
 			folio->_mm_id_mapcount[1] < 0);
 	VM_WARN_ON_ONCE(!folio_mapped(folio) &&
-			folio_test_large_maybe_mapped_shared(folio));
+			test_bit(FOLIO_MM_IDS_SHARED_BITNUM, &folio->_mm_ids));
 }
 
 static __always_inline void folio_set_large_mapcount(struct folio *folio,
diff --git a/mm/memory.c b/mm/memory.c
index ba3ea0a82f7f..5e033adf67b1 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -3730,7 +3730,7 @@ static bool __wp_can_reuse_large_anon_folio(struct folio *folio,
 	 * If all folio references are from mappings, and all mappings are in
 	 * the page tables of this MM, then this folio is exclusive to this MM.
 	 */
-	if (folio_test_large_maybe_mapped_shared(folio))
+	if (test_bit(FOLIO_MM_IDS_SHARED_BITNUM, &folio->_mm_ids))
 		return false;
 
 	VM_WARN_ON_ONCE(folio_test_ksm(folio));
@@ -3753,7 +3753,7 @@ static bool __wp_can_reuse_large_anon_folio(struct folio *folio,
 	folio_lock_large_mapcount(folio);
 	VM_WARN_ON_ONCE(folio_large_mapcount(folio) < folio_ref_count(folio));
 
-	if (folio_test_large_maybe_mapped_shared(folio))
+	if (test_bit(FOLIO_MM_IDS_SHARED_BITNUM, &folio->_mm_ids))
 		goto unlock;
 	if (folio_large_mapcount(folio) != folio_ref_count(folio))
 		goto unlock;
-- 
2.49.0

