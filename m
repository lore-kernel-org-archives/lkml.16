Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE7A62749CA
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 18:11:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746036683; cv=none; b=pWS8/HaZmSR7hw9VxRs27wxONUrqZkFRSaPm7DULONttTGEn5iCDUFvrCj+Ra8GjrsEER6No+6QEdsh/MIhqYmjxsTBEO2mqz9/rPt1LcnaP4mmIi+X3jsk+/0rXRgDBEktKOVpeqw3YfE/kI1wVh+vKdcMbR3N2ejY/EeMQ3lI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746036683; c=relaxed/simple;
	bh=We8Dff6Q27N+5ZEddI/zKbc2E8guH42H5LUvj7Sdpas=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MThNKVcKjvtLpVT3gdUnHGW+GHbVfO6YpSQgRxEzC1FSzmQP4M8gY4PAHuimtI+AbnVf6UTKoyKKTxNp1dd12VOYvbHqTH4S0vR1ZbPdCUzUu+b9ZUXRFx8DiR0qskZnmTqy5otjAfCTkq/8N1nMpi58Ew52ARWkC9cTw3HOfPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JkDTCbkQ; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JkDTCbkQ"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-7fd581c2bf4so127183a12.3
        for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 11:11:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746036681; x=1746641481; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=9qHFF/xTlBQeExdAl4eX04pdKCEarK6ESk+cMoKBj4E=;
        b=JkDTCbkQJgRwHu+zzA91fpv26bj7Z1q5hoo4d6q0k2z6cGSdH77MSQi4/k3ZH6dmpc
         +rtzEpPZwhTC93iDnwFuifFHi8zGyNS5BDDNflcyfqzVrEXbmipJYwfG/GXM0YDtq4Pc
         gy98cnIrIBB5CGISeLsYqKp1AKkeIgLMtw2SMjW/foSZ9IbwAAokFt7EwFIrWC/wi0VU
         7a2UMSN7jXkw6jNgdgrG9VWAJF9V7m14rrMi6D/4wVowUWy53ByFBmFOyiuWh+CTTEQ0
         cHdFRyGju4ZZS/VSDRugs2+bczYyR+zQJZDdraQqgODxviUsUbMGv7T4Jjmv7N8Yr0po
         IkgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746036681; x=1746641481;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9qHFF/xTlBQeExdAl4eX04pdKCEarK6ESk+cMoKBj4E=;
        b=eUwgjnydB14HRc6Yko0VqVmIFPfVkMd6mKfyxCffDFjDkxeEYQJgJK+J8x4a0u+qiD
         33RitCyTsaaD4Fkay5Q2k4HrvG5rzT44i4Fe/Lmt6mhqYxoM9MTE7XwKWFDODJeuD3TU
         Ef5VB2dDkH1Mb7zjLhNA11MbDWyt098+28S8LJx9zEDZvT35NgtdrhJPnDy4IUEmhALe
         yxZZGGzDnRm1/BHegVCKnZeDjfYbu6Nfa7EdmUsF6fvGiYxSm0kvZ/i0UjFrMow2VaFI
         CUejvfBt5kNBi56yT+hVhhMtE65cgl24it5ZIoHeKL9uMidaEt2vOpcd1hwqb2gr7iVH
         XJBg==
X-Forwarded-Encrypted: i=1; AJvYcCV/q+gX5ILZ1H9I6vRB5GF3nwC3JNowtdpAjsymjCcD73avM0paHs74cKVTfgYn2RrekeiQGXLVauHG4tA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzTvTcgdqOnvdVUWECqj3mIrF5RBXzpcKf2Je8jRgqJOina8XSH
	sX8jEM3hdeMDUTMpIcUxgxr8X5nO/ovKOzFF65NEZnbNgDpuJ7Hn
X-Gm-Gg: ASbGncvhTj+61BbiupdqJDVcCeY671fgvUKLcHjH4qHS0v9wF6SgdAZwF0YjuD7iyx1
	kbS2IsSbg2th5LKnuDxDEbgkdcDx6YRfVyT76aymJf8x7Y1mPMX/NX2+jm3mi3En0EDndOsynrT
	Vn9cY1OCVq19/yR1DbM0A0ok+7GTvFeo5zReEWfulUaJ6d3EBfKN0qh7cQv7aMDuK/uxSuf7ERz
	ub93sqOHmo4k0cAIMNjBqHDnTWt9+zjErZzaWFM6ckZwgFStbkkUD1UIN1rdU3Q+kzCcv7bqXiv
	V2zWeoeKRht9BAXjD997hRozr6ZZf4ncp8VdZNQrtvuqxxycILLW6IprMmUo4aJsiuOCO3Va
X-Google-Smtp-Source: AGHT+IHF5M1/PXpGFD3JmmxbamN2ef4frqiiXFLFq0XpOZjSrO3NxaTlgM0tiao5ZAJP8qQkb0DMiw==
X-Received: by 2002:a05:6a20:9f8a:b0:1f5:8da5:ffe9 with SMTP id adf61e73a8af0-20a87741099mr6125077637.12.1746036681106;
        Wed, 30 Apr 2025 11:11:21 -0700 (PDT)
Received: from KASONG-MC4.tencent.com ([106.37.122.198])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74039947976sm1983822b3a.84.2025.04.30.11.11.17
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 30 Apr 2025 11:11:20 -0700 (PDT)
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
	linux-kernel@vger.kernel.org,
	Kairui Song <kasong@tencent.com>
Subject: [PATCH v3 4/6] filemap: do not use folio_contains for swap cache folios
Date: Thu,  1 May 2025 02:10:50 +0800
Message-ID: <20250430181052.55698-5-ryncsn@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250430181052.55698-1-ryncsn@gmail.com>
References: <20250430181052.55698-1-ryncsn@gmail.com>
Reply-To: Kairui Song <kasong@tencent.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Kairui Song <kasong@tencent.com>

Currently, none of the folio_contains callers should encounter swap
cache folios.

For fs/ callers, swap cache folios are never part of their workflow.

For filemap and truncate, folio_contains is only used for sanity
checks to verify the folio index matches the expected
lookup / invalidation target.

The swap cache does not utilize filemap or truncate helpers in ways
that would trigger these checks, as it mostly implements its own
cache management.

Shmem won't trigger these sanity checks either unless thing went
wrong, as it would directly trigger a BUG because swap cache index are
unrelated and almost never matches shmem index. Shmem have to handle
mixed values of folios, shadows, and swap entries, so it has its own
way of handling the mapping.

While some filemap helpers works for swap cache space, the swap cache
is different from the page cache in many ways. So this particular helper
will unlikely to work in a helpful way for swap cache folios.

So make it explicit here that folio_contains should not be used for
swap cache folios. This helps to avoid misuse, make swap cache less
exposed and remove the folio_index usage here.

Signed-off-by: Kairui Song <kasong@tencent.com>
Acked-by: David Hildenbrand <david@redhat.com>
---
 include/linux/pagemap.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/include/linux/pagemap.h b/include/linux/pagemap.h
index af25fb640463..0c9aff5ec77f 100644
--- a/include/linux/pagemap.h
+++ b/include/linux/pagemap.h
@@ -935,14 +935,14 @@ static inline struct page *folio_file_page(struct folio *folio, pgoff_t index)
  * @folio: The folio.
  * @index: The page index within the file.
  *
- * Context: The caller should have the page locked in order to prevent
- * (eg) shmem from moving the page between the page cache and swap cache
- * and changing its index in the middle of the operation.
+ * Context: The caller should have the folio locked and ensure
+ * e.g., shmem did not move this folio to the swap cache.
  * Return: true or false.
  */
 static inline bool folio_contains(struct folio *folio, pgoff_t index)
 {
-	return index - folio_index(folio) < folio_nr_pages(folio);
+	VM_WARN_ON_FOLIO(folio_test_swapcache(folio), folio);
+	return index - folio->index < folio_nr_pages(folio);
 }
 
 unsigned filemap_get_folios(struct address_space *mapping, pgoff_t *start,
-- 
2.49.0

