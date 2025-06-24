Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F315F257435
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 13:03:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750770241; cv=none; b=hlqZiyAsIF2vX0s6U+yOgw5lmi6v0MNMhdO6408Eg3tdQ+hgb5tWn6wDg0VKs9CXvOCu4VR3jj2maSy6rZNoWfDjJHuvk2Vj78thAZ4bHofMW4BXxHTnAcD/egDNiy4yjCTSYPfYdRpYa5ACWSzebufIQkEH2cuJOs4C5Ts7/Bg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750770241; c=relaxed/simple;
	bh=3h/ph20k++I5dPz3kaymEl6QE8gDSqptCfqr2WJUnXg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CU2JHpw+whBRhkseWEBV8GXGp5XNcFUC/JNBE3+1KM/ego90ysRmR5rLOV4rpQIXA37Ng/dfp0la9WgsQ2RT/W0HvJxsd4aswgXWcH5eCKjxU1qU7yCOS+2hNRw2wWiqQGgthK8WFp18NWOv050wV0Mh1WyWIkJLMHm0g6FtxVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=nhpnuEHx; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=9kqWb2+i; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=nhpnuEHx; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=9kqWb2+i; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="nhpnuEHx";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="9kqWb2+i";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="nhpnuEHx";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="9kqWb2+i"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 25DB5211D1;
	Tue, 24 Jun 2025 13:03:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1750770238; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FEinpjmKZWAP/U2IPt3FFLFbmlK4f2nRzBeCNHX9Ky4=;
	b=nhpnuEHxg5cJiWEgo0GhyS45mUaHc9glYnA/jwTQ+hisFN9ezVD3OJgD20RQwe/agfmMLe
	CHXGW5qbtJm5HqhpEJFddPIPRtS1zkOYupy1aquCsc/jBDFCrJgxOAuScl0E93RlkMq42h
	663sejndkicbqEsy3xiOF4QBYZ4XrOs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1750770238;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FEinpjmKZWAP/U2IPt3FFLFbmlK4f2nRzBeCNHX9Ky4=;
	b=9kqWb2+iT+0y0FrxScaSnragr9ORw1piHtsw5SvkWpye0OCBZI0FAK9SSOKYOSqlg+559n
	boumZYHyQ5bzYyAw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1750770238; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FEinpjmKZWAP/U2IPt3FFLFbmlK4f2nRzBeCNHX9Ky4=;
	b=nhpnuEHxg5cJiWEgo0GhyS45mUaHc9glYnA/jwTQ+hisFN9ezVD3OJgD20RQwe/agfmMLe
	CHXGW5qbtJm5HqhpEJFddPIPRtS1zkOYupy1aquCsc/jBDFCrJgxOAuScl0E93RlkMq42h
	663sejndkicbqEsy3xiOF4QBYZ4XrOs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1750770238;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FEinpjmKZWAP/U2IPt3FFLFbmlK4f2nRzBeCNHX9Ky4=;
	b=9kqWb2+iT+0y0FrxScaSnragr9ORw1piHtsw5SvkWpye0OCBZI0FAK9SSOKYOSqlg+559n
	boumZYHyQ5bzYyAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 0DAF213A9C;
	Tue, 24 Jun 2025 13:03:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 6K4QAz6iWmjqYQAAD6G6ig
	(envelope-from <vbabka@suse.cz>); Tue, 24 Jun 2025 13:03:58 +0000
From: Vlastimil Babka <vbabka@suse.cz>
Date: Tue, 24 Jun 2025 15:03:46 +0200
Subject: [PATCH v2 2/4] mm, madvise: extract mm code from prctl_set_vma()
 to mm/madvise.c
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250624-anon_name_cleanup-v2-2-600075462a11@suse.cz>
References: <20250624-anon_name_cleanup-v2-0-600075462a11@suse.cz>
In-Reply-To: <20250624-anon_name_cleanup-v2-0-600075462a11@suse.cz>
To: Andrew Morton <akpm@linux-foundation.org>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
 David Hildenbrand <david@redhat.com>, Jann Horn <jannh@google.com>, 
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
 Michal Hocko <mhocko@suse.com>, Colin Cross <ccross@google.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
 Vlastimil Babka <vbabka@suse.cz>
X-Mailer: b4 0.14.2
X-Spam-Flag: NO
X-Spam-Score: -8.30
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.cz:mid,suse.cz:email]
X-Spam-Level: 

Setting anon_name is done via madvise_set_anon_name() and behaves a lot
of like other madvise operations. However, apparently because madvise()
has lacked the 4th argument and prctl() not, the userspace entry point
has been implemented via prctl(PR_SET_VMA, ...) and handled first by
prctl_set_vma().

Currently prctl_set_vma() lives in kernel/sys.c but setting the
vma->anon_name is mm-specific code so extract it to a new
set_anon_vma_name() function under mm. mm/madvise.c seems to be the most
straightforward place as that's where madvise_set_anon_name() lives.
Stop declaring the latter in mm.h and instead declare
set_anon_vma_name().

Signed-off-by: Vlastimil Babka <vbabka@suse.cz>
---
 include/linux/mm.h | 14 +++++++-------
 kernel/sys.c       | 50 +-------------------------------------------------
 mm/madvise.c       | 52 ++++++++++++++++++++++++++++++++++++++++++++++++++--
 3 files changed, 58 insertions(+), 58 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index 0e0549f3d681f6c7a78e8dfa341a810e5a8f96c1..ef40f68c1183d4c95016575a4ee0171e12df9ba4 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -4059,14 +4059,14 @@ unsigned long wp_shared_mapping_range(struct address_space *mapping,
 #endif
 
 #ifdef CONFIG_ANON_VMA_NAME
-int madvise_set_anon_name(struct mm_struct *mm, unsigned long start,
-			  unsigned long len_in,
-			  struct anon_vma_name *anon_name);
+int set_anon_vma_name(unsigned long addr, unsigned long size,
+		      const char __user *uname);
 #else
-static inline int
-madvise_set_anon_name(struct mm_struct *mm, unsigned long start,
-		      unsigned long len_in, struct anon_vma_name *anon_name) {
-	return 0;
+static inline
+int set_anon_vma_name(unsigned long addr, unsigned long size,
+		      const char __user *uname)
+{
+	return -EINVAL;
 }
 #endif
 
diff --git a/kernel/sys.c b/kernel/sys.c
index adc0de0aa364aebb23999f621717a5d32599921c..b153fb345ada28ea1a33386a32bcce9cb1b23475 100644
--- a/kernel/sys.c
+++ b/kernel/sys.c
@@ -2343,54 +2343,14 @@ int __weak arch_lock_shadow_stack_status(struct task_struct *t, unsigned long st
 
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
 static int prctl_set_vma(unsigned long opt, unsigned long addr,
 			 unsigned long size, unsigned long arg)
 {
-	struct mm_struct *mm = current->mm;
-	const char __user *uname;
-	struct anon_vma_name *anon_name = NULL;
 	int error;
 
 	switch (opt) {
 	case PR_SET_VMA_ANON_NAME:
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
+		error = set_anon_vma_name(addr, size, (const char __user *)arg);
 		break;
 	default:
 		error = -EINVAL;
@@ -2399,14 +2359,6 @@ static int prctl_set_vma(unsigned long opt, unsigned long addr,
 	return error;
 }
 
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
index fca0e9b3e844ad766e83ac04cc0d7f4099c74005..7e8819b5e9a0f183213ffe19d7e52bd5fda5f49d 100644
--- a/mm/madvise.c
+++ b/mm/madvise.c
@@ -134,8 +134,8 @@ static int replace_anon_vma_name(struct vm_area_struct *vma,
 	return 0;
 }
 
-int madvise_set_anon_name(struct mm_struct *mm, unsigned long start,
-			  unsigned long len_in, struct anon_vma_name *anon_name)
+static int madvise_set_anon_name(struct mm_struct *mm, unsigned long start,
+		unsigned long len_in, struct anon_vma_name *anon_name)
 {
 	unsigned long end;
 	unsigned long len;
@@ -2096,3 +2096,51 @@ SYSCALL_DEFINE5(process_madvise, int, pidfd, const struct iovec __user *, vec,
 out:
 	return ret;
 }
+
+#ifdef CONFIG_ANON_VMA_NAME
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
+int set_anon_vma_name(unsigned long addr, unsigned long size,
+		      const char __user *uname)
+{
+	struct anon_vma_name *anon_name = NULL;
+	struct mm_struct *mm = current->mm;
+	int error;
+
+	if (uname) {
+		char *name, *pch;
+
+		name = strndup_user(uname, ANON_VMA_NAME_MAX_LEN);
+		if (IS_ERR(name))
+			return PTR_ERR(name);
+
+		for (pch = name; *pch != '\0'; pch++) {
+			if (!is_valid_name_char(*pch)) {
+				kfree(name);
+				return -EINVAL;
+			}
+		}
+		/* anon_vma has its own copy */
+		anon_name = anon_vma_name_alloc(name);
+		kfree(name);
+		if (!anon_name)
+			return -ENOMEM;
+	}
+
+	mmap_write_lock(mm);
+	error = madvise_set_anon_name(mm, addr, size, anon_name);
+	mmap_write_unlock(mm);
+	anon_vma_name_put(anon_name);
+
+	return error;
+}
+#endif

-- 
2.50.0

