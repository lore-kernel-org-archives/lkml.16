Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03A1317A318
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 15:00:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750690826; cv=none; b=NHhr9tNOR3J9p/wbu3D4FEUH+Ecn/elqC9wrdfcdhawArRIg7N28X6pHdNbVZY0wdXlXmt7WjmxlC14yEGTf7cdmLKmRyBrFkaQ8gyUvE+PSD9XGEAkpI7BFoy0k7b90KWPVPNBnjh8r0228r/nWEAhZqD+0V1VxgJJ2nHYFmsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750690826; c=relaxed/simple;
	bh=GgJ5kuwAujTWdPeQXdF9NpyEneY/99+HBlR3VaCg5ms=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nWYax6bjc9jwLRJDNO3yVFXvm1cB85hhD+0xYqr7FMO7uR4wB3ZM9LNLGIVJCxOfoQSdqe1l5VSs+ZuPJkoLGqtQOk+s9yt+xbaVuGIN/K+nYFeUkIQC4fdz/GXoJAWoYN3lT/svhrfw61VbMY9g9V+PdL/SlTKi0PSabTUHlzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=FiADIVtw; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=1nhomz7w; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=XfZYKIYa; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=q/6dYMq5; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="FiADIVtw";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="1nhomz7w";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="XfZYKIYa";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="q/6dYMq5"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id F0BC221182;
	Mon, 23 Jun 2025 15:00:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1750690808; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SakuvdSrh15qJf2+NPBVuCwkmOu0Lr50m1E+QXgt7sQ=;
	b=FiADIVtwGqMUe0P+Xi47Fpl7eXaYk+2szOI4urofCcxds6R/V+09heXi8JKMGVAhuCgnn7
	Z2PkzXipR2+2vvV9OzH1KwqmWXl7vs8syZyQNGB3j4kInqyt43M7zzRlNw+ljzO62guXEP
	p0bf+IY27oG4uG94tvYNhaqJdBRDPtk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1750690808;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SakuvdSrh15qJf2+NPBVuCwkmOu0Lr50m1E+QXgt7sQ=;
	b=1nhomz7wb7klnP/cNZjhmG3Q2w8ut2nPlCVupztIW2zyoZg6+A1m7N3cmBgL2F78xGvI+W
	pK/bcMPQgs6iGrDw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1750690807; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SakuvdSrh15qJf2+NPBVuCwkmOu0Lr50m1E+QXgt7sQ=;
	b=XfZYKIYaqnDs20YYpUVXO12KsMRqL9E8mMmORRnMxHr0HD6DNUGnG7m9XzzDIIJtnNsz2I
	2XyU5pbhyjWwAxxgSGhWnunsllHzP8fddL91JcZGO7eCb5O86Z0vGN/Nkq1YmxcIEEyW8V
	imAeYg21FKZLfHg/S0LXMBUrQQ9ml2U=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1750690807;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SakuvdSrh15qJf2+NPBVuCwkmOu0Lr50m1E+QXgt7sQ=;
	b=q/6dYMq54I/Pe6U1B64gJvnDlwA7D2/AHyQ7JaLgaOA3psEGP43OFO0M0UFXfR7fdYVO3F
	ciIXiHghzPg/DJBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D8B1013AC9;
	Mon, 23 Jun 2025 15:00:07 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id uEKeNPdrWWi8cQAAD6G6ig
	(envelope-from <vbabka@suse.cz>); Mon, 23 Jun 2025 15:00:07 +0000
From: Vlastimil Babka <vbabka@suse.cz>
Date: Mon, 23 Jun 2025 16:59:51 +0200
Subject: [PATCH RFC 2/2] mm, madvise: move prctl_set_vma() to mm/madvise.c
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250623-anon_name_cleanup-v1-2-04c94384046f@suse.cz>
References: <20250623-anon_name_cleanup-v1-0-04c94384046f@suse.cz>
In-Reply-To: <20250623-anon_name_cleanup-v1-0-04c94384046f@suse.cz>
To: Andrew Morton <akpm@linux-foundation.org>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
 David Hildenbrand <david@redhat.com>, Jann Horn <jannh@google.com>, 
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
 Michal Hocko <mhocko@suse.com>, Colin Cross <ccross@google.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
 Vlastimil Babka <vbabka@suse.cz>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6289; i=vbabka@suse.cz;
 h=from:subject:message-id; bh=GgJ5kuwAujTWdPeQXdF9NpyEneY/99+HBlR3VaCg5ms=;
 b=owEBbQGS/pANAwAIAbvgsHXSRYiaAcsmYgBoWWv1X4uIKLtSIYHzYzzLjhrnC6u70kUE6f2g/
 lcYXseHi62JATMEAAEIAB0WIQR7u8hBFZkjSJZITfG74LB10kWImgUCaFlr9QAKCRC74LB10kWI
 mvEACACVfDRHAB8UmKGXxmGoefFUbulsxeXJ+OuGoIL5echXIcfuJ8Edpbt9B0/E0/H0TsEj8ym
 CrqxdoEtbjqf0kaGm0aeo/HUMYTta5pPqahyv8ihouVWBJGcq/Ehxrr90O1TuGJslrqGPthoDYl
 2vvVgEsaGGKVYhD4ftF+vQMyo3DHvB/ng+1FvECw3WD3E0qH9e40JlDMncR+Too20VsHsqeSL7b
 WpCdHexp2rLiCB9wLIAcqZV8t8Sqt/6txea4CaVWM0OzRBB3yTYS7B6j4HdFy5wpKRW0AuL0Kiw
 wLC/J/1VN2RlhBT4Vx+fl8Z031UiGMMGsUNXSDN3vFxi9DPq
X-Developer-Key: i=vbabka@suse.cz; a=openpgp;
 fpr=A940D434992C2E8E99103D50224FA7E7CC82A664
X-Spamd-Result: default: False [-8.30 / 50.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_HAS_DN(0.00)[];
	R_RATELIMIT(0.00)[to_ip_from(RL7wgbib1ih6q11z93xiyrfhpt)];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.cz:email,suse.cz:mid]
X-Spam-Level: 
X-Spam-Flag: NO
X-Spam-Score: -8.30

Setting anon_name is done via madvise_set_anon_name() and behaves a lot
of like other madvise operations. However, apparently because madvise()
has lacked the 4th argument and prctl() not, the userspace entry point
has been implemented via prctl(PR_SET_VMA, ...) and handled first by
prctl_set_vma().

Currently prctl_set_vma() lives in kernel/sys.c but it's mm code so move
it under mm. mm/madvise.c seems to be the most straightforward place as
that's where madvise_set_anon_name() lives, so we can stop declaring the
latter in the header and instead declare prctl_set_vma(). It's not ideal
as prctl is not madvise, but that's the reality we live in, as described
above.

Signed-off-by: Vlastimil Babka <vbabka@suse.cz>
---
 include/linux/mm.h | 13 +++++------
 kernel/sys.c       | 64 ------------------------------------------------------
 mm/madvise.c       | 59 +++++++++++++++++++++++++++++++++++++++++++++++--
 3 files changed, 63 insertions(+), 73 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index 0e0549f3d681f6c7a78e8dfa341a810e5a8f96c1..1f8c2561c8cf77e9bb695094325401c09c15f3e6 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -4059,14 +4059,13 @@ unsigned long wp_shared_mapping_range(struct address_space *mapping,
 #endif
 
 #ifdef CONFIG_ANON_VMA_NAME
-int madvise_set_anon_name(struct mm_struct *mm, unsigned long start,
-			  unsigned long len_in,
-			  struct anon_vma_name *anon_name);
+int prctl_set_vma(unsigned long opt, unsigned long start,
+		  unsigned long size, unsigned long arg);
 #else
-static inline int
-madvise_set_anon_name(struct mm_struct *mm, unsigned long start,
-		      unsigned long len_in, struct anon_vma_name *anon_name) {
-	return 0;
+static inline int prctl_set_vma(unsigned long opt, unsigned long start,
+				unsigned long size, unsigned long arg)
+{
+	return -EINVAL;
 }
 #endif
 
diff --git a/kernel/sys.c b/kernel/sys.c
index adc0de0aa364aebb23999f621717a5d32599921c..247d8925daa6fc86134504042832c2164b5d8277 100644
--- a/kernel/sys.c
+++ b/kernel/sys.c
@@ -2343,70 +2343,6 @@ int __weak arch_lock_shadow_stack_status(struct task_struct *t, unsigned long st
 
 #define PR_IO_FLUSHER (PF_MEMALLOC_NOIO | PF_LOCAL_THROTTLE)
 
-#ifdef CONFIG_ANON_VMA_NAME
-
-#define ANON_VMA_NAME_MAX_LEN		80
-#define ANON_VMA_NAME_INVALID_CHARS	"\\`$[]"
-
-static inline bool is_valid_name_char(char ch)
-{
-	/* printable ascii characters, excluding ANON_VMA_NAME_INVALID_CHARS */
-	return ch > 0x1f && ch < 0x7f &&
-		!strchr(ANON_VMA_NAME_INVALID_CHARS, ch);
-}
-
-static int prctl_set_vma(unsigned long opt, unsigned long addr,
-			 unsigned long size, unsigned long arg)
-{
-	struct mm_struct *mm = current->mm;
-	const char __user *uname;
-	struct anon_vma_name *anon_name = NULL;
-	int error;
-
-	switch (opt) {
-	case PR_SET_VMA_ANON_NAME:
-		uname = (const char __user *)arg;
-		if (uname) {
-			char *name, *pch;
-
-			name = strndup_user(uname, ANON_VMA_NAME_MAX_LEN);
-			if (IS_ERR(name))
-				return PTR_ERR(name);
-
-			for (pch = name; *pch != '\0'; pch++) {
-				if (!is_valid_name_char(*pch)) {
-					kfree(name);
-					return -EINVAL;
-				}
-			}
-			/* anon_vma has its own copy */
-			anon_name = anon_vma_name_alloc(name);
-			kfree(name);
-			if (!anon_name)
-				return -ENOMEM;
-
-		}
-
-		mmap_write_lock(mm);
-		error = madvise_set_anon_name(mm, addr, size, anon_name);
-		mmap_write_unlock(mm);
-		anon_vma_name_put(anon_name);
-		break;
-	default:
-		error = -EINVAL;
-	}
-
-	return error;
-}
-
-#else /* CONFIG_ANON_VMA_NAME */
-static int prctl_set_vma(unsigned long opt, unsigned long start,
-			 unsigned long size, unsigned long arg)
-{
-	return -EINVAL;
-}
-#endif /* CONFIG_ANON_VMA_NAME */
-
 static inline unsigned long get_current_mdwe(void)
 {
 	unsigned long ret = 0;
diff --git a/mm/madvise.c b/mm/madvise.c
index ae29395b4fc7f65a449c5772b1901a90f4195885..4a8e61e2c5025726bc2ce1f323768c5b25cef2c9 100644
--- a/mm/madvise.c
+++ b/mm/madvise.c
@@ -31,6 +31,7 @@
 #include <linux/swapops.h>
 #include <linux/shmem_fs.h>
 #include <linux/mmu_notifier.h>
+#include <linux/prctl.h>
 
 #include <asm/tlb.h>
 
@@ -134,8 +135,8 @@ static int replace_anon_vma_name(struct vm_area_struct *vma,
 	return 0;
 }
 
-int madvise_set_anon_name(struct mm_struct *mm, unsigned long start,
-			  unsigned long len_in, struct anon_vma_name *anon_name)
+static int madvise_set_anon_name(struct mm_struct *mm, unsigned long start,
+		unsigned long len_in, struct anon_vma_name *anon_name)
 {
 	unsigned long end;
 	unsigned long len;
@@ -165,6 +166,60 @@ int madvise_set_anon_name(struct mm_struct *mm, unsigned long start,
 	madv_behavior.range.end = end;
 	return madvise_walk_vmas(&madv_behavior);
 }
+
+#define ANON_VMA_NAME_MAX_LEN		80
+#define ANON_VMA_NAME_INVALID_CHARS	"\\`$[]"
+
+static inline bool is_valid_name_char(char ch)
+{
+	/* printable ascii characters, excluding ANON_VMA_NAME_INVALID_CHARS */
+	return ch > 0x1f && ch < 0x7f &&
+		!strchr(ANON_VMA_NAME_INVALID_CHARS, ch);
+}
+
+int prctl_set_vma(unsigned long opt, unsigned long addr,
+		  unsigned long size, unsigned long arg)
+{
+	struct mm_struct *mm = current->mm;
+	const char __user *uname;
+	struct anon_vma_name *anon_name = NULL;
+	int error;
+
+	switch (opt) {
+	case PR_SET_VMA_ANON_NAME:
+		uname = (const char __user *)arg;
+		if (uname) {
+			char *name, *pch;
+
+			name = strndup_user(uname, ANON_VMA_NAME_MAX_LEN);
+			if (IS_ERR(name))
+				return PTR_ERR(name);
+
+			for (pch = name; *pch != '\0'; pch++) {
+				if (!is_valid_name_char(*pch)) {
+					kfree(name);
+					return -EINVAL;
+				}
+			}
+			/* anon_vma has its own copy */
+			anon_name = anon_vma_name_alloc(name);
+			kfree(name);
+			if (!anon_name)
+				return -ENOMEM;
+
+		}
+
+		mmap_write_lock(mm);
+		error = madvise_set_anon_name(mm, addr, size, anon_name);
+		mmap_write_unlock(mm);
+		anon_vma_name_put(anon_name);
+		break;
+	default:
+		error = -EINVAL;
+	}
+
+	return error;
+}
 #else /* CONFIG_ANON_VMA_NAME */
 static int replace_anon_vma_name(struct vm_area_struct *vma,
 				 struct anon_vma_name *anon_name)

-- 
2.50.0

