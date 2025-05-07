Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF9651F463E
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 07:35:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746603347; cv=none; b=DClCIrJ0blUBo/l8ORC40WB3GoXyzDCBmKoN1aIrRB0mE1/Yz7bguMRnFVSbmloNOSdCKIOwcdH1uv+PH+4HmqmwVvkM33sWFe4wSvnYbePZTuud5JQM2dfCxa/U4yYgWp9f95sGiLS+2RVNMFW8s6qxLyFtyLHbTOcDHtZjvSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746603347; c=relaxed/simple;
	bh=HNIvix4xStzYLoL0TuIkRiiOxHy1GEOQQFZRwLv6y4Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UmILOjE1xjn4wUqtJptpTetqlrc8pSAC0ifAezIIhJAPredt6Zs8AfcqcanPzN+knMzbNYmsjY7dFRp+cak4meRQD/oE5oUCNjGRLlCb7szO/0IoyVq420SWuuSeubg1cJ50OpgErOROm7rgiFYcXKqKHLp3GDNi/MjY/UXHRso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZXP+GOQZ; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZXP+GOQZ"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-306bf444ba2so5810989a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 07 May 2025 00:35:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746603345; x=1747208145; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Mqt8m2kJroPbVma9aagVvCiuJwN64U08TVLGSry535w=;
        b=ZXP+GOQZNpmCOWX1XUugamEKH42GK0c2e+7aomKAENADK9HaTvTG+Vb92sdrKPzzLj
         njs9C0RVYgbI7Y6OpZLIs7cl65UyCuDOnVJSmIumlJhtwAIFVjnKXnxOU65mnzG5rQob
         yYeo+RE3cEz5Wx0mSuzR5Tx+R9KKH/Xz4J8cvcZp9TH23HVm0VYvLXMj6M8Z6iod5+wq
         maqIcXUI6mb4kQp1kAEB+TVUu9loI5UXEm/wlvuOw4emklMyEIApK7Mnky+XH29NExC2
         R5aiBwz+1rlst88oO9hX7MLdUFhGPWtiDIm6q2rlXtnkihxtTO9o9Kxvtker+DDXnCD2
         ZdJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746603345; x=1747208145;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Mqt8m2kJroPbVma9aagVvCiuJwN64U08TVLGSry535w=;
        b=AYfiEAZWkkSbwsg5TaGoFfuXLFjSePLamfp217Hjhme1aXf3s/fyhA/rBqt6oJu/FP
         nF37vkWSGBB5BF1/z9cF92uo8H7faEpmE0c/ex1Vqq9nen3lGnkngL8z4B8xlFsfWNvx
         eaO7QPU7A7LXMi/iq+QvsOIVZGBgepGnWUK3YlPh+6iTWyEMcIrhwpR+w1zOHkGuGn5j
         CtM7yducSmrn6FfRqAeT7q925xlMGc5SdHS4Kb+oNVaESkTZAu5omC3jMe5KZl2N2UP3
         V+2Zj8qgd1AM6UwgejIneyoauu61EuZlm0tYuSjDadREV2psNwDNTHLdVIDA8+16JBls
         cz/Q==
X-Forwarded-Encrypted: i=1; AJvYcCX/HQHnvBWTyTnHwbIuOCSiGtkhXOoydbIvp+lhso1U94xTHKQAy/zlXCsQKw7vqfu2C8/JebyXLM5BgoU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy07uZpUb/yw9dgN6EQKmntc1db3Wktgo+DIcp3f1NFRkWkoKTP
	+OHmg19lnOfdviIwa2+w3jdQGueSIl/3DNLwGtyWf/2hWE/CcWqbXSQg2g==
X-Gm-Gg: ASbGncu/cN4uoOpNGkUJKH1U0vceVr+UTjQMeRipb7y4RFQBZQZqyMMdXT0zFzAVAMn
	ReogaE22souXS31IiNML/eyqeStlJwGz54Jhry5kQ7FuvhntxuwVvK3X9u4urRFgXRZtWgym0Fb
	Abl53hh+Z6dfwnvDkQxj/P0LikrOiGsK/VH8IuOrIVKNXA7far984HuWgIV1+tOqPN+SEGcrazW
	REsnDwBQJJgSIGC4jy8f3gWz7IKaQYqnjgLneKL68hWDFT++IMVskWmwyYn0j6b3MsEaFistL2r
	Cl+pbti5l1WUyoiJmnNZMraJVn3hMzlNsLoopaX4
X-Google-Smtp-Source: AGHT+IF5SkuwNh5Pvq8XoV5uRbjMgFpuwRPDs5T7c0MrKjfmo0LcxyKCRt7K+S6IUfprDMNp8Z28wg==
X-Received: by 2002:a17:90b:5105:b0:309:f67c:aa8a with SMTP id 98e67ed59e1d1-30aac15328dmr3191770a91.5.1746603344906;
        Wed, 07 May 2025 00:35:44 -0700 (PDT)
Received: from nillco.localdomain ([2600:3c01::f03c:93ff:fe96:ad75])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e1521fe34sm87270135ad.155.2025.05.07.00.35.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 00:35:44 -0700 (PDT)
From: Rong Zhang <ulin0208@gmail.com>
To: almaz.alexandrovich@paragon-software.com
Cc: ntfs3@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Rong Zhang <ulin0208@gmail.com>
Subject: [PATCH 2/2] ntfs3: correctly create symlink for relative path
Date: Wed,  7 May 2025 15:35:34 +0800
Message-ID: <20250507073534.11693-1-ulin0208@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

After applying this patch, could correctly create symlink:

ln -s "relative/path/to/file" symlink

Signed-off-by: Rong Zhang <ulin0208@gmail.com>
---
 fs/ntfs3/inode.c | 31 ++++++++++++++++++-------------
 1 file changed, 18 insertions(+), 13 deletions(-)

diff --git a/fs/ntfs3/inode.c b/fs/ntfs3/inode.c
index 2641738d2934..7c79c2c7eff6 100644
--- a/fs/ntfs3/inode.c
+++ b/fs/ntfs3/inode.c
@@ -1098,10 +1098,10 @@ int inode_read_data(struct inode *inode, void *data, size_t bytes)
  * Number of bytes for REPARSE_DATA_BUFFER(IO_REPARSE_TAG_SYMLINK)
  * for unicode string of @uni_len length.
  */
-static inline u32 ntfs_reparse_bytes(u32 uni_len)
+static inline u32 ntfs_reparse_bytes(u32 uni_len, bool is_absolute)
 {
 	/* Header + unicode string + decorated unicode string. */
-	return sizeof(short) * (2 * uni_len + 4) +
+	return sizeof(short) * (2 * uni_len + (is_absolute ? 4 : 0)) +
 	       offsetof(struct REPARSE_DATA_BUFFER,
 			SymbolicLinkReparseBuffer.PathBuffer);
 }
@@ -1114,8 +1114,11 @@ ntfs_create_reparse_buffer(struct ntfs_sb_info *sbi, const char *symname,
 	struct REPARSE_DATA_BUFFER *rp;
 	__le16 *rp_name;
 	typeof(rp->SymbolicLinkReparseBuffer) *rs;
+	bool is_absolute;
 
-	rp = kzalloc(ntfs_reparse_bytes(2 * size + 2), GFP_NOFS);
+	is_absolute = (strlen(symname) > 1 && symname[1] == ':');
+
+	rp = kzalloc(ntfs_reparse_bytes(2 * size + 2, is_absolute), GFP_NOFS);
 	if (!rp)
 		return ERR_PTR(-ENOMEM);
 
@@ -1130,7 +1133,7 @@ ntfs_create_reparse_buffer(struct ntfs_sb_info *sbi, const char *symname,
 		goto out;
 
 	/* err = the length of unicode name of symlink. */
-	*nsize = ntfs_reparse_bytes(err);
+	*nsize = ntfs_reparse_bytes(err, is_absolute);
 
 	if (*nsize > sbi->reparse.max_size) {
 		err = -EFBIG;
@@ -1150,7 +1153,7 @@ ntfs_create_reparse_buffer(struct ntfs_sb_info *sbi, const char *symname,
 
 	/* PrintName + SubstituteName. */
 	rs->SubstituteNameOffset = cpu_to_le16(sizeof(short) * err);
-	rs->SubstituteNameLength = cpu_to_le16(sizeof(short) * err + 8);
+	rs->SubstituteNameLength = cpu_to_le16(sizeof(short) * err + (is_absolute ? 8 : 0));
 	rs->PrintNameLength = rs->SubstituteNameOffset;
 
 	/*
@@ -1158,16 +1161,18 @@ ntfs_create_reparse_buffer(struct ntfs_sb_info *sbi, const char *symname,
 	 * parse this path.
 	 * 0-absolute path 1- relative path (SYMLINK_FLAG_RELATIVE).
 	 */
-	rs->Flags = 0;
+	rs->Flags = is_absolute ? 0 : SYMLINK_FLAG_RELATIVE;
 
-	memmove(rp_name + err + 4, rp_name, sizeof(short) * err);
+	memmove(rp_name + err + (is_absolute ? 4 : 0), rp_name, sizeof(short) * err);
 
-	/* Decorate SubstituteName. */
-	rp_name += err;
-	rp_name[0] = cpu_to_le16('\\');
-	rp_name[1] = cpu_to_le16('?');
-	rp_name[2] = cpu_to_le16('?');
-	rp_name[3] = cpu_to_le16('\\');
+	if (is_absolute) {
+		/* Decorate SubstituteName. */
+		rp_name += err;
+		rp_name[0] = cpu_to_le16('\\');
+		rp_name[1] = cpu_to_le16('?');
+		rp_name[2] = cpu_to_le16('?');
+		rp_name[3] = cpu_to_le16('\\');
+	}
 
 	return rp;
 out:
-- 
2.49.0

