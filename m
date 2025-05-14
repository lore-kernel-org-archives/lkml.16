Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3B76297A59
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 20:18:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747253939; cv=none; b=VPGsozVqVQCDZfvQZT7NtU86ehNVhGzV3dYHTGpyN6rCqnT15q2xPhZ7Ts/WXOu6f1hf4PX3dpHqwtlsT4XU1jEHQvJ2TUdtkRx2lPOvD8D71ZaH5dv9ttrnDsurwZQhz34NGnojz86lPKs6pXEagRH+KH2CjZuTv1CkbjL62eo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747253939; c=relaxed/simple;
	bh=Ltq6wHZ6CYwAHMRp6GZ7cEvINC6iE5s/IjKCvsa3Nc8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=izFWJXKSLKtIF7exIto2xTbR9mWHZR7pfH3HFhUo1nTzeT7M3uXYxCHo4O/4cReqaA/1z0b2p1p1wBqM2StLAEGz2pZ1DWgr/JUu9gdZFBgknBZne44Vh1xcM0dP0cft6kVyCS6VA02shrjn6LOfDRsOvmvrpQIaof+CtV8dilM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RMnNfG8P; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RMnNfG8P"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-7fd581c2bf4so101851a12.3
        for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 13:18:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747253937; x=1747858737; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=VCzh8XoJ7iR5UkQvB2yPd5bD+zJe0a5vs+xtyvTlef8=;
        b=RMnNfG8PoQHMSFebqoUllRW6JH8n1qLW8UL0Cb8+DcpKo+HfSayjgppt4IaTFPaXSk
         oFnE2TFOfM/A27YY5HuYgmAIH9AktukTJdSEkReJLGKkLNPBE0KNLF8PgjlHNIF0/vU8
         jCk9NGyxgf9yJrkPTztKQAOK/5q21AjniNNXMV8+8vyBkcmA/e+43GKtCzl2KvcxxmAv
         eN8bVBcVzZteMkbBAN8nzYgkqTHS1AOR/t2tfauyzZdNtN9qjxky4vD5SYN3uY3fMhFJ
         CjwHcqeCBmAxE1hBvDmPSMSICVF8cZ4tVZ64Ly7yvV4Bf/KD0HdruD1aeWUIrSWmv8Xf
         wo4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747253937; x=1747858737;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VCzh8XoJ7iR5UkQvB2yPd5bD+zJe0a5vs+xtyvTlef8=;
        b=Nsy/K4P+UvL5leB1RbTTLh/TndCpMs2eLLwU03zBckM16NJ+x6ee82IqwZcIngweul
         9mOFqv0pfuOMuIjWhf814ZJJAp89o9SSkBtcbnFuYE+9/Apmjz+5QLl81RQ1YTOWhaVu
         q5NC3Pxyq7jGd1JCTPU4Cigp2TTGeZwSQR3A7WdTV7ZQCE9mUADV139HTSz+wNVjmbiY
         HutUxOK/r0bOIqC8sG0NyBLfgqmA05XRbARoHGCBrlX11tD5jY8+wp6J2IiMdimPW46o
         9+xdEO8wXXc3rqA+rSrEZFdLQwt1F253Ywvl8QQme9nH+JCT0guM+b1JxGoY5u9kGfey
         kqXQ==
X-Forwarded-Encrypted: i=1; AJvYcCXb9HfCoDU1NWmF0e+1P4wkN4vW8ipcxfW/IWmIBBxX9J97Hv+VUWkZ7TNyicvDZuAX6/ea1ra5tH7xMuI=@vger.kernel.org
X-Gm-Message-State: AOJu0YztRT5JLoBJOIQ4jlgW8xGy+OytTxDl/wUSBTzOPPeusXVduzW+
	RxngNyHvBFyntA3tItTehtqq49RHe4AlMLShvNmGKWB7Cn2zZxh6
X-Gm-Gg: ASbGncti2l+zk2VLG3yj3SDx6OZQpB8A0Q9IvT0ddD4iGw0nTtkVtoBAFzeBqgbOglM
	9i4KySu4Wjowmi3oOOWE4PVujAHkSffYG6CtFq4JvrXMNfFG4Cfr53jla/FsT6a2aqKkskob4u4
	Mz+jYkb+QY0c+3Tvrt97wI87uFbq9Ba8DfMkuCeBrhhNrECgJ4zjlw67vER2tQEDyIbssSdT1L3
	qdY+iuQ476paS7owR6+/+1REuKsffJWP1FVHnXdlp5SbSGOtLEKgMx3PbYG+u67DfRyHV1GYnT0
	1ddWD1OEDKP5NWwIkvLFIxqtcpSCItQIBDeD+wZR9OhV+HXhmlMSumZiBiha+1G56G6QCShI
X-Google-Smtp-Source: AGHT+IExSI2hqmk+VRchAK7hScUkYCrqQ3rfWhy/546iawiMwyTTJHzv2uq/p3d+jT15aiafAXDj5A==
X-Received: by 2002:a17:90b:2811:b0:2ee:f076:20f1 with SMTP id 98e67ed59e1d1-30e2e413597mr9029910a91.0.1747253936923;
        Wed, 14 May 2025 13:18:56 -0700 (PDT)
Received: from KASONG-MC4.tencent.com ([101.32.222.185])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30e33401934sm2003692a91.9.2025.05.14.13.18.52
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 14 May 2025 13:18:56 -0700 (PDT)
From: Kairui Song <ryncsn@gmail.com>
To: linux-mm@kvack.org
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Matthew Wilcox <willy@infradead.org>,
	Hugh Dickins <hughd@google.com>,
	Chris Li <chrisl@kernel.org>,
	David Hildenbrand <david@redhat.com>,
	Yosry Ahmed <yosryahmed@google.com>,
	"Huang, Ying" <ying.huang@linux.alibaba.com>,
	Nhat Pham <nphamcs@gmail.com>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Baoquan He <bhe@redhat.com>,
	Barry Song <baohua@kernel.org>,
	Kalesh Singh <kaleshsingh@google.com>,
	Kemeng Shi <shikemeng@huaweicloud.com>,
	Tim Chen <tim.c.chen@linux.intel.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	linux-kernel@vger.kernel.org,
	Kairui Song <kasong@tencent.com>
Subject: [PATCH 15/28] mm, swap: split locked entry freeing into a standalone helper
Date: Thu, 15 May 2025 04:17:15 +0800
Message-ID: <20250514201729.48420-16-ryncsn@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250514201729.48420-1-ryncsn@gmail.com>
References: <20250514201729.48420-1-ryncsn@gmail.com>
Reply-To: Kairui Song <kasong@tencent.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Kairui Song <kasong@tencent.com>

No feature change, split the common logic into a stand alone helper to
be reused later.

Signed-off-by: Kairui Song <kasong@tencent.com>
---
 mm/swapfile.c | 61 +++++++++++++++++++++++++++------------------------
 1 file changed, 32 insertions(+), 29 deletions(-)

diff --git a/mm/swapfile.c b/mm/swapfile.c
index d3abd2149f8e..d01dc0646db9 100644
--- a/mm/swapfile.c
+++ b/mm/swapfile.c
@@ -3492,26 +3492,14 @@ void si_swapinfo(struct sysinfo *val)
  * - swap-cache reference is requested but the entry is not used. -> ENOENT
  * - swap-mapped reference requested but needs continued swap count. -> ENOMEM
  */
-static int __swap_duplicate(swp_entry_t entry, unsigned char usage, int nr)
+static int swap_dup_entries(struct swap_info_struct *si,
+			    struct swap_cluster_info *ci,
+			    unsigned long offset,
+			    unsigned char usage, int nr)
 {
-	struct swap_info_struct *si;
-	struct swap_cluster_info *ci;
-	unsigned long offset;
-	unsigned char count;
-	unsigned char has_cache;
-	int err, i;
-
-	si = swp_get_info(entry);
-	if (WARN_ON_ONCE(!si)) {
-		pr_err("%s%08lx\n", Bad_file, entry.val);
-		return -EINVAL;
-	}
-
-	offset = swp_offset(entry);
-	VM_WARN_ON(nr > SWAPFILE_CLUSTER - offset % SWAPFILE_CLUSTER);
-	ci = swap_lock_cluster(si, offset);
+	int i;
+	unsigned char count, has_cache;
 
-	err = 0;
 	for (i = 0; i < nr; i++) {
 		count = si->swap_map[offset + i];
 
@@ -3520,24 +3508,20 @@ static int __swap_duplicate(swp_entry_t entry, unsigned char usage, int nr)
 		 * swap entry could be SWAP_MAP_BAD. Check here with lock held.
 		 */
 		if (unlikely(swap_count(count) == SWAP_MAP_BAD)) {
-			err = -ENOENT;
-			goto unlock_out;
+			return -ENOENT;
 		}
 
 		has_cache = count & SWAP_HAS_CACHE;
 		count &= ~SWAP_HAS_CACHE;
 
 		if (!count && !has_cache) {
-			err = -ENOENT;
+			return -ENOENT;
 		} else if (usage == SWAP_HAS_CACHE) {
 			if (has_cache)
-				err = -EEXIST;
+				return -EEXIST;
 		} else if ((count & ~COUNT_CONTINUED) > SWAP_MAP_MAX) {
-			err = -EINVAL;
+			return -EINVAL;
 		}
-
-		if (err)
-			goto unlock_out;
 	}
 
 	for (i = 0; i < nr; i++) {
@@ -3556,15 +3540,34 @@ static int __swap_duplicate(swp_entry_t entry, unsigned char usage, int nr)
 			 * Don't need to rollback changes, because if
 			 * usage == 1, there must be nr == 1.
 			 */
-			err = -ENOMEM;
-			goto unlock_out;
+			return -ENOMEM;
 		}
 
 		WRITE_ONCE(si->swap_map[offset + i], count | has_cache);
 	}
 
-unlock_out:
+	return 0;
+}
+
+static int __swap_duplicate(swp_entry_t entry, unsigned char usage, int nr)
+{
+	struct swap_info_struct *si;
+	struct swap_cluster_info *ci;
+	unsigned long offset;
+	int err;
+
+	si = swp_get_info(entry);
+	if (WARN_ON_ONCE(!si)) {
+		pr_err("%s%08lx\n", Bad_file, entry.val);
+		return -EINVAL;
+	}
+
+	offset = swp_offset(entry);
+	VM_WARN_ON(nr > SWAPFILE_CLUSTER - offset % SWAPFILE_CLUSTER);
+	ci = swap_lock_cluster(si, offset);
+	err = swap_dup_entries(si, ci, offset, usage, nr);
 	swap_unlock_cluster(ci);
+
 	return err;
 }
 
-- 
2.49.0

