Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DACE2D29D7
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 11:50:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745927437; cv=none; b=jaW1je4WtKOMr+WJTt2Oj1DVx6if2OIWr6yxJ6LCthHpaQbzdt6QTMMwbqy3YS0ExZhBRFicKqc1YtWiCvAvDf322NFGKAUz7smFr1nSKOIR4u94gmkwg39lfcHvhU54NrvBWh7Y5ik3Pc6mQVxKgAnbNiKyRQoUbCc6CThDZMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745927437; c=relaxed/simple;
	bh=DVWZ7jM5skF8VIGzNHi/bgGgMg59s/fzzLxz1VGfhkk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=R4IAyBhZxdU/hhWBv2BRUDXg/3q3EF/4NJ8AQVpqs5BXIFjjw9zqQtUnA5CdARQinDbF6B80XWRnY1gplJPx1yfQuu4U3PUyh0W+YoTf9AeBTSnx03hzom3odZUNoSorXKiPyX9cGTbiZtVi46+n1YZCaHfB98sXzq5FtXEj7kM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eV25OSA6; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eV25OSA6"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-7370a2d1981so4698404b3a.2
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 04:50:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745927435; x=1746532235; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Dgq83EGL/QD5wjuy65QG87e6Pc1gzfmOWc21Ho8xkpg=;
        b=eV25OSA64DByd7nhrY/67Q6JVFm387aJQ9P4XmKVyoUv+KTxhyL3MZ50JFnJHaNlzs
         Iu/YKd7LshCC+Zxb6GBY8XDgheetT6Ly5M8e3krflhA08JUAr6BYJzjPf1j95K9DYPZj
         ZoIR17lWADJ8Ptv7i2mh2rmsIsRYHMss30Fw5hA0OIJZ6EhxTROHX/TxsAmflzU3jvlL
         5J8Zf/8zIpWMyP+TtgFrj4VC2l7AP8tjWnmpZCSmUtp9Fl4GZxhfTx7C6pEKAScw4ixS
         AFomvPRrn8LRr5mgjKgXyggUFzyVbRh+CmmFU7KRRM9NbdHrvCF/C0LS8NhhbO15Mhfr
         Y1NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745927435; x=1746532235;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Dgq83EGL/QD5wjuy65QG87e6Pc1gzfmOWc21Ho8xkpg=;
        b=qdToimoFT+cgeefMwb4Ld6WeRDMfUPD9DOH41rkGImlbH00sZ2Pn/cEdhMuBcFyMZX
         +qJK9w4im7TVYxa9As4xHldN6gZrwAdoi2khGhfqPDKr+N6W6pYJaY30CwqwAnQNJoyG
         jkNJcDPDvnsa0uPiHtBwj8itqCXK0pU3KG+bSMyqBP0Lu1f8TcfjgD0LSTwaRZyZKIru
         AKDyyrCyOVlq6iXyUljvYM2ijbAurCUU3TfN6/xE1/nbJGh1nZzvwU+MJ3GL5Ce98ji/
         f00Nf+z6QEsFREMEjEpTfoco9E5W8bkHIwvQLDwj4Kwor0OcleJX2lu6AWneXzh/ngmW
         2SBQ==
X-Forwarded-Encrypted: i=1; AJvYcCUU9BiB6drBpGG/flCbbDYYQdgBfGma0gCAaR967Vi6nkoAOM4tIeqf+r3Y4hAC4SlzkS4EiIoom8v7qvk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxqbmZk7iN5LMS8xAGWhsiMTKIjTgOeyv9J9KyamMlsJeGE5FKL
	VE+DJPRXVObkiwCQ+1WSBZj8aCPHy7HW01s/w7aA9vd4Ph8zPWHu
X-Gm-Gg: ASbGncuPRc1sJiKabiTi+bJKR5yAejfQIKXjFK4F4C6pZFxiGRW3fJtSekd7TABUn4v
	/GXMpYdQ5sAGDaUMBL+uDyjk+nJw2BZ+UQdM67cbUwnvlSDyhiDBX5vWIvMOHmmYUdDe6Lwsmcw
	CJ+YR0Gsx64afP+GwTqhCZvOnZZBOhnasVeVqAm32KOQIZfZxvAfmGTaUZmyK7jVImcUvresH6O
	ntdyJ/Mzc/zYrLOhSeE4TLBHRD5lgD3XyMLbUsijKA/LdEhuZZYLfhJsJn2cAM9rc7Rxbx6xcwx
	76cm0ONrgS1t2MC5dWEn1isZKJ3LySOnxsLZD7Ih0GVcaiftfs18BaU8f0ukkr3evZWHRoA=
X-Google-Smtp-Source: AGHT+IHGZhZY/3nMBx8I+Rv77oPScvGIRbeEGosfvczsqDw+cy+3eOjBSzpIR0MnqGfEbpansUl/vQ==
X-Received: by 2002:a05:6a00:3a12:b0:73e:2dc8:94f3 with SMTP id d2e1a72fcca58-73ff725247amr15262051b3a.1.1745927434739;
        Tue, 29 Apr 2025 04:50:34 -0700 (PDT)
Received: from KASONG-MC4.tencent.com ([43.132.141.24])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73e25aca62csm9661644b3a.167.2025.04.29.04.50.31
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 29 Apr 2025 04:50:34 -0700 (PDT)
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
Subject: [PATCH v2 4/6] filemap: do not use folio_contains for swap cache folios
Date: Tue, 29 Apr 2025 19:49:47 +0800
Message-ID: <20250429114949.41124-5-ryncsn@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250429114949.41124-1-ryncsn@gmail.com>
References: <20250429114949.41124-1-ryncsn@gmail.com>
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
---
 include/linux/pagemap.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/include/linux/pagemap.h b/include/linux/pagemap.h
index af25fb640463..1dc3416a9c0d 100644
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
+ * (e.g.) shmem did not move this folio to swap cache.
  * Return: true or false.
  */
 static inline bool folio_contains(struct folio *folio, pgoff_t index)
 {
-	return index - folio_index(folio) < folio_nr_pages(folio);
+	VM_BUG_ON_FOLIO(folio_test_swapcache(folio), folio);
+	return index - folio->index < folio_nr_pages(folio);
 }
 
 unsigned filemap_get_folios(struct address_space *mapping, pgoff_t *start,
-- 
2.49.0

