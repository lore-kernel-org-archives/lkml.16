Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB040188733
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 15:42:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744731780; cv=none; b=LqOuXphh2FkHobAMcntt3cz49PNFAu3taEWW3Nixr9muiLIN8ERHhIqXblBLyetkj+xQjbB32IDTXzOGrdgWk1nmIryiwi9VkF08ZtBVtlh602aYqD6XLA5hV19wGb62r3aUHcJ+QAxNvFI7Vbf2mx1OFUY+jHymHSRnHmuwxEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744731780; c=relaxed/simple;
	bh=hdBiJaccaYOIRaLvt47IgT9gmHvSkfABEplLtUyBsMA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rgSNtBINOvdZSD8rCR+sGGjie4ESV25pifrb33VEhk7R4xEnFXD7cVyCOdNVcnfeaiZD1X5iLF3f6MGApLA6PuZJrYvElRNFKIFFpZjZvQZwLpg0ykIzn6P5RW8uTu9kxqrP/mbV14Np9kXGmWTulsTZRePTuhyg465ChJSyljU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QkLGuzWY; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QkLGuzWY"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-227aaa82fafso46949415ad.2
        for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 08:42:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744731778; x=1745336578; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K/qd57sZOVSdn02+r+Cx/B5uhPMrarE+XUYS56nIpso=;
        b=QkLGuzWYbGGSpdhCoh03p7LrP6pvQ7R6m4zxLqkx8CiTW1GMGSuzWHjgubtkEsq45f
         8OSp9qdzGS7W/Yzs9ZaL69CTWCG//A3pgFnSLvGbZLpoaJQamCF4AbGrtxSY5QQoaghi
         eYU8IhQ9DdxS+6msjYwZVqKWPdKO195nN9/Q5U5a4M75QcFrwPs5cVnnwHFbM7CZdNgn
         3/cYVVe778Tie6hAOOI0jB8ZItCaZ/WSRBr9oyXSoW+5Bfo2EnbHe03kmwx+LXwaSJ4Z
         YY1Ba6LIX2MhXVDRz+pvQmBkz6o4nwxIutuKOnXJd7vzmiuNzgUgUtnppQy8OE2XBIO+
         jCPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744731778; x=1745336578;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K/qd57sZOVSdn02+r+Cx/B5uhPMrarE+XUYS56nIpso=;
        b=RUCc3ACbozlAGg/kHP2it+LLZKB6gB9ChDCvHNTU+Cnbzk9mw2in+yfawt4gtccVBg
         wMUEUQm2c2N0f+6rAaYQM6D5VtQfV2U2+MG0ltACOvt95p+nUQ5WMBbz3Nsb978zH/P1
         4dlqTmzpvDpxiMbPDRPa+PRT5mXoTKqGmX0Li1VVMVpsuB2D/KoI9U5Z+j4eyXZ4QnUa
         o7W4S2VrP8HPD3jZdKONWyVn8PbnBIZQVh+uaNTW/bJpI0YdNgiyv9L8X7Nx2LxRa3Ue
         Xhx2LKUr6ZtpqsPm1ogALMUBR5Ucxw9ArA2dFiZDp28L72HpmsW/8MUmuIYRC7F1FvgT
         H/7A==
X-Gm-Message-State: AOJu0Yxzmh7DEGP2buykHqtfkR1Kjm7u1tHEMcke2jOFuyHsUzkNH0pc
	t4eUT5PUbCQoxYuYFHnmroyJ+lX4uclaMUJzCUPPYdVHLN1EnKR9gMZpQXu6
X-Gm-Gg: ASbGncveWH1mbr3AMghKCU/cbOTXjQBMfKO3E9AxM3R/4B9alleICEzf325QZ/uiBBM
	VAzMzAOUUgxkYlD99KU5idE6WlZ6VUuDWnqLmEQM2W6hpqCpNU1cqB3kYzz/IuXxy78RhLUSBIB
	pm5G06HotiJZ7c8QdAFuESzSBKfozIa2tpoSxJa5tsWiohKN6YbWbAckFyVmJHTd/lzrzyDBw3N
	M3vAE/y3UdKT+k77Bec/bp19OkoRJhQUg1mPpTdamBB9NLsss9dKJB9euepLpSrMdkAQNOHBz1t
	ltZ9tkMLwDYOEM7XdyMsjLYL5rwjmoG/rBI4sORvtEQLX+xWWR8WgHpEf2ByzifYvJVCpA==
X-Google-Smtp-Source: AGHT+IEApd7BikVvZnVU5OGCOQoNndqrysi3zDfGkwnxK8aBG2lBG4ZZj/KSqwJlVfJu5cQ7b79UPQ==
X-Received: by 2002:a17:902:c952:b0:224:912:153 with SMTP id d9443c01a7336-22bea49590cmr262311775ad.5.1744731778035;
        Tue, 15 Apr 2025 08:42:58 -0700 (PDT)
Received: from localhost.localdomain ([121.185.186.233])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7b8b14dsm119318455ad.64.2025.04.15.08.42.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 08:42:57 -0700 (PDT)
From: Jeongjun Park <aha310510@gmail.com>
To: syzbot+d472c32c5dd4cd2fb5c5@syzkaller.appspotmail.com
Cc: linux-kernel@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [udf?] possible deadlock in udf_free_blocks
Date: Wed, 16 Apr 2025 00:42:54 +0900
Message-ID: <20250415154254.15330-1-aha310510@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <67290b04.050a0220.2edce.14f8.GAE@google.com>
References: <67290b04.050a0220.2edce.14f8.GAE@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

#syz test git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master

---
 fs/udf/balloc.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/fs/udf/balloc.c b/fs/udf/balloc.c
index 807c493ed0cd..f70d13eaedce 100644
--- a/fs/udf/balloc.c
+++ b/fs/udf/balloc.c
@@ -657,8 +657,10 @@ void udf_free_blocks(struct super_block *sb, struct inode *inode,
 		     uint32_t count)
 {
 	uint16_t partition = bloc->partitionReferenceNum;
-	struct udf_part_map *map = &UDF_SB(sb)->s_partmaps[partition];
+	struct udf_sb_info *sbi = UDF_SB(sb);
+	struct udf_part_map *map = &sbi->s_partmaps[partition];
 	uint32_t blk;
+	bool islocked = false;
 
 	if (check_add_overflow(bloc->logicalBlockNum, offset, &blk) ||
 	    check_add_overflow(blk, count, &blk) ||
@@ -670,6 +672,11 @@ void udf_free_blocks(struct super_block *sb, struct inode *inode,
 		return;
 	}
 
+	islocked = mutex_is_locked(&sbi->s_alloc_mutex);
+
+	if (islocked)
+		mutex_unlock(&sbi->s_alloc_mutex);
+
 	if (map->s_partition_flags & UDF_PART_FLAG_UNALLOC_BITMAP) {
 		udf_bitmap_free_blocks(sb, map->s_uspace.s_bitmap,
 				       bloc, offset, count);
@@ -678,6 +685,9 @@ void udf_free_blocks(struct super_block *sb, struct inode *inode,
 				      bloc, offset, count);
 	}
 
+	if (islocked)
+		mutex_lock(&sbi->s_alloc_mutex);
+
 	if (inode) {
 		inode_sub_bytes(inode,
 				((sector_t)count) << sb->s_blocksize_bits);
--
