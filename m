Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C82B020371D
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 14:26:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743517595; cv=none; b=kiegp/UgEtkqVwKkHAkvLpNTBvS7XpH1shfP3O1cM7cpMK0ehrsB/VPlTEwlnKy45sj0F/exIOydn1M51OFspct8eaND3kHNWnmDqKxJaaEBdJ+IBnvRms5SjpmH11o+MalltgoUgzV3SeunxksNxS+6si8E+mCiqtDC5E54ZhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743517595; c=relaxed/simple;
	bh=uf46RinEUOvCiqVfx8KYzNvB+cZcorAoqYAF8yRTnyc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VOXnOVgSV+ph+6dkdJ3j2KJpfrGx1ofMt37ZM8KHyGyEaNlIwmPCSUNdnpSImbEmaKPM+CBDyN6j7jTX3PtYHkJV1zWJRuI3cslHstIQS8wZPPw2mHYSc2beZ7ua8aPyUUUTunI39AmBGjHL3Utmv7sfEHaBTVmZC9dQxOjiNiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Bt5D9Tms; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Bt5D9Tms"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-391295490c8so567517f8f.3
        for <linux-kernel@vger.kernel.org>; Tue, 01 Apr 2025 07:26:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1743517590; x=1744122390; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sdBbkebfo2scUETi30Yr9yqQ2VOcxL1KzzzL+b14/fc=;
        b=Bt5D9TmsL6pMuh4KYZ3eF0F7SA8fDndLeFOzlH+SLmhfrqygKMqatCZFsBrQecBVu9
         clYTKPEoTiHo+uqE6cB3FFnMMkE/MaUepkMSCw76Fk38STSuSTWoEkB5c7VxecmWwf88
         5PUjEvHyxQHeNh2ALY6iv/18wtxE6092Pf4/r2cOSLNHoFQzklLY44j5zyE4sCqjj1pQ
         kml0pXhv0Pm8qXN0IBP2CQTICIUOp2Y9UNlh0ZIYwdD1e6aJc5L45+ntIqe77BLMyr/W
         dmXQnccNKi4izFrwPpIQZpU7eqoFpxbnDW+E1DLTPSC/UAtug9XnKTsX4YVPK5wKMsvn
         KhNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743517590; x=1744122390;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sdBbkebfo2scUETi30Yr9yqQ2VOcxL1KzzzL+b14/fc=;
        b=ORkYWD5AfHsyULQbWkVofCDVZPuwfDpBJyClBWGLJc9/GT9nCI2v/iY4vq5k3wM90m
         VUfl0ajS7GNJdvT77HsVNITXv6FBKs6YOohrKK4V7ISRTjYPo2LLvZX2G2sD1h3o2Gak
         SQ6WWHVOaufKV1n5aWuXVq5yIcgB2yvWHjuon4uLwT0qskoFR6qjfKd6ukDeQ6v9JEHl
         ZUdwSUKIkjpgX3sKq04QQkxjA0plw9OgO4b7xrzyrsWK/M4mdBTFAuSIvd72nV+tzo2E
         yXFdDZ6UtLj8q9pfHQI+Ahrqkw0JBr0b5vE12c9LX2us+Mbpj6iOBVF4e6416FlxkBMo
         Bt0A==
X-Forwarded-Encrypted: i=1; AJvYcCW4q9pXe2ZwGKZCtlqUCPkQRMflSHjO8v5JJQQ6Rf7dId0u4cWiutxQ/2qpB5D3Hn9OzbEmvE/4Exhiq1E=@vger.kernel.org
X-Gm-Message-State: AOJu0YyCSoVbAE59Ah5AvoE2xfQB4YHmFGp16FkrdPrlz1dq9MzpwBZE
	A0W6gmeOyBN8kNHXy3t1Pj9NN0mUJd2GbOBzXiD9/0VPYlVmRC+x9wOucypEQmc=
X-Gm-Gg: ASbGncsKLAKTqdtHbnGF5sxMHnqjTxAMTvaKCNWeuffJFSUybk36mc5HSoWq159OVUM
	cFjo+GQzLUql4qBJnYdApS/w4i4w0G+wP30FcTkEBAX6yJEFe23dmO1lBwHklvR+YGKxH0Uusei
	abYHK2b5NAGgOXJuTaqd9uNQG8wvfGn1plF6FDwbKAAxZLFBHE5LqcE6lmtLQz3moIatOBpyOsU
	oXTlAUPP2UAxCpGQwIIFsmhPV9TQ+/cTU3HOkzS4dloEX4ypHTrLreXbgW6SWZRA2cYcTcAjLjt
	kUYjqEMaQqm+QyuMCnYareZrra3wObV659TIBLnA3We5NCYww0lcIXeGC9A=
X-Google-Smtp-Source: AGHT+IEBip0fAQ8K0q/EhN/rjV9v+jJJsXqcgedHUNfP+/QQ6S3358EzZfKmWOVrA7j5vKwp9TnlEg==
X-Received: by 2002:a05:6000:2287:b0:382:4e71:1a12 with SMTP id ffacd0b85a97d-39c246f092fmr878553f8f.1.1743517589953;
        Tue, 01 Apr 2025 07:26:29 -0700 (PDT)
Received: from localhost.localdomain ([202.127.77.110])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af93ba1081dsm8172922a12.65.2025.04.01.07.26.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 07:26:29 -0700 (PDT)
From: Heming Zhao <heming.zhao@suse.com>
To: joseph.qi@linux.alibaba.com
Cc: Heming Zhao <heming.zhao@suse.com>,
	ocfs2-devel@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	gautham.ananthakrishna@oracle.com
Subject: [PATCH v2] ocfs2: fixing global bitmap allocating failure for discontig type
Date: Tue,  1 Apr 2025 22:26:21 +0800
Message-ID: <20250401142623.31223-1-heming.zhao@suse.com>
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
v1 -> v2: OCFS2_AC_USE_MAIN_DISCONTIG type requires separate handling,
          with all other types proceeding as before.
---
 fs/ocfs2/suballoc.c | 10 ++++++++--
 fs/ocfs2/suballoc.h |  1 +
 2 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/fs/ocfs2/suballoc.c b/fs/ocfs2/suballoc.c
index f7b483f0de2a..fde75f2af37a 100644
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
@@ -2429,6 +2432,9 @@ int ocfs2_claim_clusters(handle_t *handle,
 {
 	unsigned int bits_wanted = ac->ac_bits_wanted - ac->ac_bits_given;
 
+	if (ac->ac_which == OCFS2_AC_USE_MAIN_DISCONTIG)
+		bits_wanted = min_clusters;
+
 	return __ocfs2_claim_clusters(handle, ac, min_clusters,
 				      bits_wanted, cluster_start, num_clusters);
 }
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

