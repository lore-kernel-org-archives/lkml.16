Received: from out162-62-58-211.mail.qq.com (out162-62-58-211.mail.qq.com [162.62.58.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CCB726A1A4
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 06:38:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.58.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746772726; cv=none; b=KFzNPEgkWLgPrper+ISzFrLF3Cn0QxOaQBnR5Z38oXaE06rtw0kYtzqdLuG6OUd36QrpVKcxdqsx3RWraOkJOWM6s/IwnZ1SScqKJ74ZwMwnRyN+yM9NaqB1CNh2Iyi9DjY4xYZzdpEZznaK6JymvpEUSAIH+p6mmQ+HMMNpQhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746772726; c=relaxed/simple;
	bh=tqTfw5w3gBFE81Wq66Z4kvtHMDDPTdQBKyw53km8jyk=;
	h=Message-ID:From:To:Cc:Subject:Date:MIME-Version; b=XPajggEpGglBRcCaodqmJ8PZAfrLGSh0Eqn2NorJscBii4pC71aKRnzfuJO0mkJ2KFaZ3cbWPiKih4mimoF2Jj8UhqF3bYLxOAcCkzHwLh+tD1HopjPlzyQJCGXqzQttOUyEpeSq4oLdX3MMZUOakDld6ql4d+a9mlcHBv24DiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=QIHK+o/X; arc=none smtp.client-ip=162.62.58.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="QIHK+o/X"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1746772416; bh=zcC3iLdUhpaRZBYC6QjDTYzoo+13lttMagIm/kwnQYE=;
	h=From:To:Cc:Subject:Date;
	b=QIHK+o/XDxz8g00n9b83XpEqBZ8LFTDkoQctX6WQ9iSegG4yOXO0GH2QRvuJmGk+r
	 UvbDYW74QzxAe9zmdzH/6kwz5HbnjcGwUeHSZ2gPTsEI5WxITwECKuEkBXc4Qo1vw6
	 xrLId+9r0GrCNWygVpK35XvYFx2Pxh7KzOwFeTgo=
Received: from localhost.localdomain ([36.111.64.84])
	by newxmesmtplogicsvrsza36-0.qq.com (NewEsmtp) with SMTP
	id 8499C82E; Fri, 09 May 2025 14:33:09 +0800
X-QQ-mid: xmsmtpt1746772389tm243909u
Message-ID: <tencent_503130C3CD56569191396268CF4D12F09A06@qq.com>
X-QQ-XMAILINFO: NkHKfw09D6j8wNd9ItXDgQzl8XJUYVRbxokHX2cp8iKyEZpEuxu4VkG/bvyfZt
	 VCzGUT4QAmxXOGm2Bmnt1NIc72I969xDf8DoVyUCRvPRer8uGLVTk1rdh2dPmC++QNMh2JZ0t9eX
	 ZvS5I9uNDPE/iRMfvQGQ6mHPC7KnnSy10aoKkX/dAaKzkF6kqZkwK/TcuztpMDWAb0IMkbRP/mjf
	 McGqg+xKmBw6hOYq9l1vA9ap8QpWJ/Cl2V/T6oTllozAxM4AuqE9Uh5a42tVNNUAh6VpqM8UN+or
	 /+LibXhjGPnj25Es1eLtGYMU5EKtF+NMrldGEniuJdH6i5x++8X1Eh0ZcRTHVasU2WtZbWAksHF5
	 yjsk4LjWGtI3YjSPrvFE+v6dLd1ZHS9hEcVqks2fumM6krY9nQWA9c+iGkTKazw25JeJdFsEh6sJ
	 p6dwq1z1T9OY/4bA41Vvy/FzY3nEDaPJr928PmQ0APnCzF6GX1Avi6fLWT634bWePeLb4bTJuh+s
	 Lfut5a8E+rSvYsDcbEfMRBU7WoTSoOETxDSdnuJJgEgPNR2Zdz5T37k6Mp7B7bM9eOyHb4LDJg5k
	 yd/nr81NBRr8+HbqEl9Ggh82qXiNL8U3kHAFWgdq5wlltmDOg+JTRGij/y7ZkP7xlquAFZvJgTlv
	 XHHe0q3Mh+soFbkb26s1JHY0p4AbsLb4NYyCzYE5GnTv4qccPtSI9YWvZYbk0qs7hcv2GmJFotPN
	 s24fNMLR1Epijzrqy7dt2fyvpZQWzEI05/s0bOsHvrj4jheYpFjwdpbggfQk6gnayVVrzLuil8ie
	 nYfeEj5yCzOrljqwoOClYQTEmcnJlm7ov1C7GdhapK7Xstk+hQTbA9tKyFkTfzIt2BmbnRSDUDTC
	 04BAaPc5XhxpSq850zPBx3NhWWrbOV+1DSrPmaSnxFgrHFs1yuk2G9IcR3UByTemsJHYWnM5BaNd
	 oLVMr+MxXfG5M1CeWmsxyfAiPzYxl70VV4ARJuQh4/ugYu6w+aB/CEKYoKqXacEwz3POViI8LIm9
	 /wse2ugrJfdVTHlflDh6LnP5Wd0n0L+kkVqSRL0E3IpcNCVVN+
X-QQ-XMRINFO: MSVp+SPm3vtS1Vd6Y4Mggwc=
From: Feng Lee <379943137@qq.com>
To: david@redhat.com,
	baohua@kernel.org,
	21cnbao@gmail.com,
	akpm@linux-foundation.org,
	mingo@kernel.org,
	jgg@ziepe.ca,
	jhubbard@nvidia.com,
	peterx@redhat.com
Cc: maobibo@loongson.cn,
	trivial@kernel.org,
	linux-kernel@vger.kernel.org,
	lance.yang@linux.dev,
	anshuman.khandual@arm.com,
	Feng Lee <379943137@qq.com>
Subject: [PATCH v3] mm: remove obsolete pgd_offset_gate()
Date: Fri,  9 May 2025 14:32:30 +0800
X-OQ-MSGID: <20250509063230.1742-1-379943137@qq.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove pgd_offset_gate() completely and simply make the single
caller use pgd_offset().

It appears that the gate area resides in the kernel-mapped segment
exclusively on IA64. Therefore, removing pgd_offset_k is safe since
IA64 is now obsolete.

Signed-off-by: Feng Lee <379943137@qq.com>

---
Changes in v3:
  - adopt more precise subject descriptions
Changes in v2:
  - remove pgd_offset_gate completely
  - remove pgd_offset_k from the get_gate_page function completely
---
 include/linux/pgtable.h | 4 ----
 mm/gup.c                | 5 +----
 2 files changed, 1 insertion(+), 8 deletions(-)

diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
index b50447ef1c92..f1e890b60460 100644
--- a/include/linux/pgtable.h
+++ b/include/linux/pgtable.h
@@ -1164,10 +1164,6 @@ static inline void arch_swap_restore(swp_entry_t entry, struct folio *folio)
 }
 #endif
 
-#ifndef __HAVE_ARCH_PGD_OFFSET_GATE
-#define pgd_offset_gate(mm, addr)	pgd_offset(mm, addr)
-#endif
-
 #ifndef __HAVE_ARCH_MOVE_PTE
 #define move_pte(pte, old_addr, new_addr)	(pte)
 #endif
diff --git a/mm/gup.c b/mm/gup.c
index f32168339390..0685403fe510 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -1101,10 +1101,7 @@ static int get_gate_page(struct mm_struct *mm, unsigned long address,
 	/* user gate pages are read-only */
 	if (gup_flags & FOLL_WRITE)
 		return -EFAULT;
-	if (address > TASK_SIZE)
-		pgd = pgd_offset_k(address);
-	else
-		pgd = pgd_offset_gate(mm, address);
+	pgd = pgd_offset(mm, address);
 	if (pgd_none(*pgd))
 		return -EFAULT;
 	p4d = p4d_offset(pgd, address);
-- 
2.49.0

