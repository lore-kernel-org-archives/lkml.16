Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B31F17E4
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 06:22:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743056544; cv=none; b=KKdYtl01fEpqe6+XD6xAduf0mfFvhSS+szEPaQVjTzPzKiG+zf86bnn/qaCHfi574YpFBt7d2GgqSE/oIkp+4Wcsho111t5tjx+p7dAloBwrzMNDU8bA4oOenTO6M2uOL026dorDMAUF+JukxKOXHP+KdMe2KxKjJPBGjuwpAJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743056544; c=relaxed/simple;
	bh=T4o7Npfj8cfRlK+HiHE2jL+iHCod3eTKeuSvzkqtAmg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ut40bCQX+haYod1XNA1OIkQwtt4Os2XwgRiRw3cVrv1xM5Of6Nx+DX6U6AihVqxVIRvOHyRciXgZD5EwBMOo6F5fCYATUWg1isQT5Q8rRLHnCxR1UxhaN0RHBbdTQU+YGFEAvzDIRmH9/OJDrsYfcFG9jiV7+ixidYo1jssBinQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=MeGUFiky; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="MeGUFiky"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-43d64e6c83eso622275e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 26 Mar 2025 23:22:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1743056540; x=1743661340; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=r3UZwovF22qijSvqeoxOLD33tI0BeZTaoA548D9DPe0=;
        b=MeGUFikylgVYGSUqEQCml3RT7BWhnAKNB3WjcO90QqfIre4x0tOL1oXQtlBpq2Smj4
         W8elKv0Tawf0L1Mx3ELLHlA4GwYJJTULTZDjkVx9RXzUAP+ALAlxwiSIk0SoNmtxB8MG
         /Mm22zj6JKNEdcXV95/vYiQwRcqR7Nse60f99QL/Dcd6CpSU90+QOpWXlHml6A7S3Iiu
         q0WPZsQbYZnb8IkTSeJbE4aHAfToZDBWkTOywZExvAJE4TZ8Ikba0gWPDWSGSvekKf4/
         aC+6upi6Hcp7uPC75HoFxcj8p9Rr8GAsG9A2kRoKo4M+siHukJZ9eFfdXUTSDLQ9SJCX
         YceA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743056540; x=1743661340;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r3UZwovF22qijSvqeoxOLD33tI0BeZTaoA548D9DPe0=;
        b=LgsZE13iJvO9/gNZr0Gfs2QjAH5iZlg8b5yMiTiYBOtyB/pXwlI3vT5P3Jg5TXYT2r
         R9m+V6wXpVRpDZv5TFAcweX7vR/vqgjIQKbFidVIDnMzrVfJ/O/O6z0gmsSWi6bHMUXj
         rvwRkQkVmpzQfSWWXqNWCnTbiX5IgOpWL2XfFQcLEgoi7jI3xnX+cQsD5VMv2XCrMd8v
         I+OP1rhlNcqHOkEB6uA9YipYshYdoV2GlrOl1ylTVhQro1VB2UuYoTelc+8anMwLOESF
         9sufO93UXbyuspA30VhniLfPjJi83ElIaSOILxRE5wUCAWA0awituSSfBvEo14+OMMxK
         qoDA==
X-Forwarded-Encrypted: i=1; AJvYcCVFcfjyKqrudBeh69QIwX0z1kraE8YG6EO1ist0db9xjhMoN3zBTjiTBjUlKM1LSszTfmMSw538zWcxOok=@vger.kernel.org
X-Gm-Message-State: AOJu0YwMUyc/npNcmco2kkrf6Bwj0NFsV1e7mUrTZmSjv1np31k7Yqbo
	W+j5k9glIouUAG8rJipGTYBmDbMQNeLC50ChH9DkSdWDOqwo/ibCzP5ituvaon0=
X-Gm-Gg: ASbGncvzaV0fNQv37gXy7E4jfepTcCbLKvm2+jGvz1A7MfqNA9pKdzOawKvIuKwjfhJ
	ji0cANNK8L2SXHwgctv/LxqndhbMH+p+Rrb5OCvXW58HAlJ1kAOrpZMXSZsR0GAr7W+kXR+yTvT
	btlbQoO2ntO+ORvn2LA1NHWZrDcPJHxDy5lh7oMZNJNFXqciwuBEes8wlZW38gaI8TdJxu5J8iS
	AqivxCH9wBpYar/dkF0ge+9rP3bCU5UkEfKH8helA+FJjwNSIikHSkxInSnIvrvygYsvMGS7f0M
	Ub60CkTNeDnu0GkuPKpbRmNHBPidaSGssQrZazRW8LZpKg==
X-Google-Smtp-Source: AGHT+IFPV1X+WPIdzKvzEsnhwRDFRN40tBTiwfautnBLvhKsJ62Gnvc+1vpqvvIJ/NOs7QjBHrbz4Q==
X-Received: by 2002:a05:6000:1fa7:b0:38f:2224:73a1 with SMTP id ffacd0b85a97d-39ad2adbd01mr391838f8f.2.1743056540464;
        Wed, 26 Mar 2025 23:22:20 -0700 (PDT)
Received: from p15.suse.cz ([202.127.77.110])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73905fa97fdsm13418293b3a.26.2025.03.26.23.22.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Mar 2025 23:22:19 -0700 (PDT)
From: Heming Zhao <heming.zhao@suse.com>
To: joseph.qi@linux.alibaba.com
Cc: Heming Zhao <heming.zhao@suse.com>,
	ocfs2-devel@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	gautham.ananthakrishna@oracle.com
Subject: [PATCH] ocfs2: fixing global bitmap allocating failure for discontig type
Date: Thu, 27 Mar 2025 14:22:00 +0800
Message-ID: <20250327062209.19201-1-heming.zhao@suse.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The commit 4eb7b93e0310 ("ocfs2: improve write IO performance when
fragmentation is high") introduced a regression. In the discontiguous
extent allocation case, ocfs2_cluster_group_search() is comparing with
the wrong target length, which causes allocation failure.

Call stack:
ocfs2_mkdir()
 ocfs2_reserve_new_inode()
  ocfs2_reserve_suballoc_bits()
   ocfs2_block_group_alloc()
    ocfs2_block_group_alloc_discontig()
     __ocfs2_claim_clusters()
      ocfs2_claim_suballoc_bits()
       ocfs2_search_chain()
        ocfs2_cluster_group_search()

Reported-by: Gautham Ananthakrishna <gautham.ananthakrishna@oracle.com>
Fixes: 4eb7b93e0310 ("ocfs2: improve write IO performance when fragmentation is high")
Signed-off-by: Heming Zhao <heming.zhao@suse.com>
---
 fs/ocfs2/suballoc.c | 14 +++++++++++---
 fs/ocfs2/suballoc.h |  1 +
 2 files changed, 12 insertions(+), 3 deletions(-)

diff --git a/fs/ocfs2/suballoc.c b/fs/ocfs2/suballoc.c
index f7b483f0de2a..3dea082f6e91 100644
--- a/fs/ocfs2/suballoc.c
+++ b/fs/ocfs2/suballoc.c
@@ -698,10 +698,12 @@ static int ocfs2_block_group_alloc(struct ocfs2_super *osb,
 
 	bg_bh = ocfs2_block_group_alloc_contig(osb, handle, alloc_inode,
 					       ac, cl);
-	if (PTR_ERR(bg_bh) == -ENOSPC)
+	if (PTR_ERR(bg_bh) == -ENOSPC) {
+		ac->ac_which = OCFS2_AC_USE_MAIN_DISCONTIG;
 		bg_bh = ocfs2_block_group_alloc_discontig(handle,
 							  alloc_inode,
 							  ac, cl);
+	}
 	if (IS_ERR(bg_bh)) {
 		status = PTR_ERR(bg_bh);
 		bg_bh = NULL;
@@ -2365,7 +2367,8 @@ int __ocfs2_claim_clusters(handle_t *handle,
 	BUG_ON(ac->ac_bits_given >= ac->ac_bits_wanted);
 
 	BUG_ON(ac->ac_which != OCFS2_AC_USE_LOCAL
-	       && ac->ac_which != OCFS2_AC_USE_MAIN);
+	       && ac->ac_which != OCFS2_AC_USE_MAIN
+	       && ac->ac_which != OCFS2_AC_USE_MAIN_DISCONTIG);
 
 	if (ac->ac_which == OCFS2_AC_USE_LOCAL) {
 		WARN_ON(min_clusters > 1);
@@ -2427,7 +2430,12 @@ int ocfs2_claim_clusters(handle_t *handle,
 			 u32 *cluster_start,
 			 u32 *num_clusters)
 {
-	unsigned int bits_wanted = ac->ac_bits_wanted - ac->ac_bits_given;
+	unsigned int bits_wanted;
+
+	if (ac->ac_which == OCFS2_AC_USE_MAIN)
+		bits_wanted = ac->ac_bits_wanted - ac->ac_bits_given;
+	else /* ac_which == OCFS2_AC_USE_MAIN_DISCONTIG */
+		bits_wanted = min_clusters;
 
 	return __ocfs2_claim_clusters(handle, ac, min_clusters,
 				      bits_wanted, cluster_start, num_clusters);
diff --git a/fs/ocfs2/suballoc.h b/fs/ocfs2/suballoc.h
index b481b834857d..bcf2ed4a8631 100644
--- a/fs/ocfs2/suballoc.h
+++ b/fs/ocfs2/suballoc.h
@@ -29,6 +29,7 @@ struct ocfs2_alloc_context {
 #define OCFS2_AC_USE_MAIN  2
 #define OCFS2_AC_USE_INODE 3
 #define OCFS2_AC_USE_META  4
+#define OCFS2_AC_USE_MAIN_DISCONTIG  5
 	u32    ac_which;
 
 	/* these are used by the chain search */
-- 
2.43.0

