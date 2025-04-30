Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2C142882BD
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 18:11:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746036691; cv=none; b=RUCH+ZG1HVG38XW6Hnj9FIqiCYjniOCT8QoX5yXKnTOAhtGTkJbR9JD+HotzS7aKCIvwy8N0gMKH5QI3T9aIGwsqQC5kTLvNbzcKUKdWj6iBzsc7BztdHVqQ/tU+zYu4yBvdTP7Ibcm/2IlXn/W61iJ++NJQMFU4lZPJ5RdoyiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746036691; c=relaxed/simple;
	bh=j4nly31GVjWEhbgTSOnyZr5LFHdDhJ/vcbZlEmbkTs8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ut44zsUctlYkEgIziDBEmD71A+WdSPFAPFdZnOYcKPH2jcVc79isZ2xX2sYBVOtPFdqR/yei7+NDcxfes1ps9wc0v/leFSlcLKD1wdaOw+CJ1KVVg3YJwUIas+HXdC47FgIDeu+mQ5Ik98GwMGrdj9EDBN36BXtF7/9mFinAiIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WjHvu0/A; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WjHvu0/A"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-736c3e7b390so241512b3a.2
        for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 11:11:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746036689; x=1746641489; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=YPYU8xo1mzMVuKzjJlWPb2a6nMmELwwkYyTRspWFm2c=;
        b=WjHvu0/AFF1rH0k3CnD3JPsA4kwk6gkQY0IvAyuOe66KEKXJjwQO1AWsO1eRbUbfGJ
         2T6hBs355pux7+6pHurfDhhbRMo0rmFUtU3p2iBMmN/vWU/5VlN/fNkFcDNfjfdxOxti
         GXRW3nNXTShIVDxPR9tJ9CgBa/B30/NsIWOimjEvnzJJ+kAPkeNw0mV4AxUWb4gnCcT/
         G1NOKgP0B82BnE/ZZiQNCpxaJlpij2ZSVf45vqu9Z6zW3G8JpO311yVA+jV9XiRa069O
         F2N73IYjWEt1Wfrkfgi/LxPO9vICScqZaOyIZdSFlTHkEgduilg5bR01Zsxw70+UOWxp
         anCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746036689; x=1746641489;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YPYU8xo1mzMVuKzjJlWPb2a6nMmELwwkYyTRspWFm2c=;
        b=voW4TtPdOuomkarLHmD1vTIpJZBxArWynSKxtOFKjL02h18Xx2I5SFObVrqCrb3HC6
         HpRxwtfL3TwT3Nh1qQ4i74b6KBgNIK2jbMLP5qom3bVE3xjALoU869cZw2RAC4Bgzjhq
         ZjnoE+QZ1OuDD9TvtmyOF9R/m+ABEoLcLa19QlaPS8gifYhVq8Y/n7Ggt66Xes+D6aaE
         w1zLOu2r2ORpKBicK2S5RRbeG1AxZ/zsQIy9B8/STTV8ERvhO4RyklWiQ7WUyIsfftXy
         U33aLeS1NFDNFix/L4J8TvsMaE2GTZMHjUavY6WSzcfW7gFjqUibQxROydfcT30xTKKX
         C7Eg==
X-Forwarded-Encrypted: i=1; AJvYcCVKlAqFQUXxlPkIYANh6m+gEfAr/B1IIeYbHLfABOx+JrtXGlaNnZzmW3622Fko7FmJ2uyvRm1aLNgB2fI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxhqG4mhqoogc5J+tgF+xw9pIiS3T7fb8g4algIYInCOL0Ej07y
	0KZfsD9pHsqUI1oiD7YYDKjXzUmAMJtDhitE8PfCUrc/0TIQ/2mi
X-Gm-Gg: ASbGncvKiddWnK0wHHHiT09OhL9Rc5LSkz/jt4SACTekrsin0zIvtiAcIG+WCdbpPXh
	JE6fRXSXKcOinKZrI1oyg6SbClvK7WyiqvFcsUJpMuVfHwqjyv32RWg2lDld8aJjYHCnzEv4cI3
	yrJBe/eQSHZBzqoRWZ0+XHvWLt83vVrzw6yQRFYykWxebaCfwfymfS/crU41ZSrEKmXzdeCcY5a
	KmYJjejMFGnwdbek5u2nx8MLiafYKTOIZWcJhlhG/yi0JseZF+L8LW053k+WBOnOvgEcHck55Gx
	y3XOqsQG7FKvay9/LQZtcTkz6QB+rf3aeqJdgdf41DoPxMGI7reYF+8e9wmLwA==
X-Google-Smtp-Source: AGHT+IEizwJh83fKA4GblxYQufq8IOSE9ngbKGJYIoIhX0XYft1sNuqLkCRCPDpZGvKkBh5oDGgu7w==
X-Received: by 2002:a05:6a00:18a6:b0:736:d297:164 with SMTP id d2e1a72fcca58-7403897a50dmr5522387b3a.1.1746036689082;
        Wed, 30 Apr 2025 11:11:29 -0700 (PDT)
Received: from KASONG-MC4.tencent.com ([106.37.122.198])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74039947976sm1983822b3a.84.2025.04.30.11.11.25
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 30 Apr 2025 11:11:28 -0700 (PDT)
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
Subject: [PATCH v3 6/6] mm, swap: remove no longer used swap mapping helper
Date: Thu,  1 May 2025 02:10:52 +0800
Message-ID: <20250430181052.55698-7-ryncsn@gmail.com>
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

This helper existed to fix the circular header dependency issue
but it is no longer used since commit 0d40cfe63a2f ("fs: remove
folio_file_mapping()"), remove it.

Signed-off-by: Kairui Song <kasong@tencent.com>
Reviewed-by: Matthew Wilcox (Oracle) <willy@infradead.org>
Acked-by: David Hildenbrand <david@redhat.com>
---
 include/linux/pagemap.h | 1 -
 mm/swapfile.c           | 9 ---------
 2 files changed, 10 deletions(-)

diff --git a/include/linux/pagemap.h b/include/linux/pagemap.h
index 627cb0338e5d..8c6894d0ac27 100644
--- a/include/linux/pagemap.h
+++ b/include/linux/pagemap.h
@@ -533,7 +533,6 @@ static inline void filemap_nr_thps_dec(struct address_space *mapping)
 }
 
 struct address_space *folio_mapping(struct folio *);
-struct address_space *swapcache_mapping(struct folio *);
 
 /**
  * folio_flush_mapping - Find the file mapping this folio belongs to.
diff --git a/mm/swapfile.c b/mm/swapfile.c
index 9fe58284079d..026090bf3efe 100644
--- a/mm/swapfile.c
+++ b/mm/swapfile.c
@@ -3662,15 +3662,6 @@ struct swap_info_struct *swp_swap_info(swp_entry_t entry)
 	return swap_type_to_swap_info(swp_type(entry));
 }
 
-/*
- * out-of-line methods to avoid include hell.
- */
-struct address_space *swapcache_mapping(struct folio *folio)
-{
-	return swp_swap_info(folio->swap)->swap_file->f_mapping;
-}
-EXPORT_SYMBOL_GPL(swapcache_mapping);
-
 /*
  * add_swap_count_continuation - called when a swap count is duplicated
  * beyond SWAP_MAP_MAX, it allocates a new page and links that to the entry's
-- 
2.49.0

