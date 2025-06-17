Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87BA2220F34
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 04:18:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750133940; cv=none; b=ePZm0pmdNGYyfrp2GVkwuR2FXd3gCJDWz6PETEdmI2DaNuPJNRvblJvyKytGCE3kFXvaCE8zrB5czp6xmlVyFJRvAJfVDmB7ZVKky0lWP/VzGj5PheS9SsNiktJJG9/PA74m2/PnAs7a+IxI4PYPYU0UnASs4MdeOyfRnlNNJi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750133940; c=relaxed/simple;
	bh=H1CADXj3QfLh4ujbp1T9SA8yJlYktXA0W6UdRqEgSoc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WOXVQQHrRjwoXqBqZR2pMlaONMkNk5ILrPnkuYl1B2R4ffRt646bUXF91okLjTMxlxnnZsPn7Z6aJ2KwwqrR09eXEfEdE6vy2fINzkZ6j/zcBt9vZvQNi1F03PLSf+DSdEw8ynJJ8DO050/o7lSbD9SNdLUhKJ8zt97E5arXOrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=cxmUiqBG; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="cxmUiqBG"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-236377f00a1so45232545ad.3
        for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 21:18:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1750133938; x=1750738738; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w56CkoZmOBP7eVY7ps5X3d048z5btToxOlcYqOG+Pe4=;
        b=cxmUiqBG/Od/ZGKoO8Rqlnn0FUp4lbZh2eGFovNfs+b44u8aZ34wdChcxsn7WuQETQ
         KzsJL2SGFn9D1YD0NYiL3K884tbWiMXfxawotMY+Nscf9CbIreGeU9lUjd+X4z6Bff+l
         vSI7AzdSI+kEaqgoius3bXk/YMnIlCkws/02UsoxvKoFbwTtEaeKRdWSr2QkItcyXTCo
         Pi85vVOqoPA9bIGPH2f8ykGaqDnBG/PW8VpNgPctGfsEC7u4lZFaB0Q8f2CJhyIQRscm
         jNTo7IBzjSDyhTNiyt+SHiM1O2CErOxdCmBQr311UHE0qofBM9905fJ44AOADRmofX1W
         TcBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750133938; x=1750738738;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w56CkoZmOBP7eVY7ps5X3d048z5btToxOlcYqOG+Pe4=;
        b=tjlksV9pvN1VCfLLo9HHw2EFOdNTwzobpavI9QoULk0v9TIcAr98FGdBMznTHY122r
         auO6pDLqtOL5eEDB2piglbvCJJdlvHrJybHbCOEr26jNe2el79mGj06r9649iBYaJ+aH
         e6Up7n0rFI8jn0DCUuQXnWDr4zUguU0wkHreOmjiCEHka9M+a+O+ppBUDoo5/pW4gG/c
         70a/2nCZa0RUXkiey0lA5rpjFpyBDhXCqo7HyLHCDkCRn2dJfPjsvzyuGyQ7kA9JuX/E
         bWOKvN+GnJSMKhLOTqGz4QJScIy9dEgcMcWZ62LgS670RmY+jrIu7a0EA/XC507JqRDa
         VKcQ==
X-Forwarded-Encrypted: i=1; AJvYcCUWgW6N1jyTW1jg4Zgj0xgEn74iceSmmu3Unw6wvZirPqNjOwtrx2aXRW8TaLbPZ8giGdhI8gttnQlUpBg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxy5poaQZoruigpOJrNb+cf7wGPLbraIZTPJehhpmg9jR4s8QnS
	e26RMWQxOVkjFL61vimz7Inj44rdJFmlCS21zJA8r2YsEpukoZ3SkollhkTGW0Hdd6E=
X-Gm-Gg: ASbGnctLWdMjC1oZYQZBcAkjqsTYYgetEQqs2PZFNHj5O7kcNtRkec3R7bK04u5IvQ2
	CAxTsGgZHFTcN11xwd1s/QDIJx9wNhUw6ULTiK2Qi9zUFf8mZkeq9YgnbvmkCDAVAaEtviLbdfQ
	mn3Zptc2zE8ks259NDlffVrLaGisVabtzmxBSNMb+hN9W1dx5kI2FnkmdYC7gsmTtYZ0sMuw5Ij
	LEG1QuBCUPYHwYaW6M12QIEPu+kf5Ve/vCjqlbStuPKZVj3aRBxBlH5Q7zzn1ag/UDQH2fcnd8p
	F54Yk4rAwJMUNWXnkLMxxC0pF0zfCY+MnrBJpebV75qMRS/Xdv1QiSKOHqgBdsMphjoVXrtGVm5
	NsaH7mbRrfpVrOw==
X-Google-Smtp-Source: AGHT+IG96Kfj3jnMCouOQtJaFnWQzQIm60pETT4IyUybRMTMZVSaQLyo4ZaTsJAfjEoT+giwIio3Nw==
X-Received: by 2002:a17:903:24f:b0:234:bca7:292e with SMTP id d9443c01a7336-2366afe6223mr187956125ad.14.1750133937768;
        Mon, 16 Jun 2025 21:18:57 -0700 (PDT)
Received: from localhost.localdomain ([203.208.189.10])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2365d88c029sm69798345ad.26.2025.06.16.21.18.54
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 16 Jun 2025 21:18:57 -0700 (PDT)
From: lizhe.67@bytedance.com
To: alex.williamson@redhat.com,
	akpm@linux-foundation.org,
	david@redhat.com,
	peterx@redhat.com
Cc: kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	lizhe.67@bytedance.com
Subject: [PATCH v4 2/3] gup: introduce unpin_user_folio_dirty_locked()
Date: Tue, 17 Jun 2025 12:18:20 +0800
Message-ID: <20250617041821.85555-3-lizhe.67@bytedance.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250617041821.85555-1-lizhe.67@bytedance.com>
References: <20250617041821.85555-1-lizhe.67@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Li Zhe <lizhe.67@bytedance.com>

Introduce a new interface, unpin_user_folio_dirty_locked(). This
interface is similar to unpin_user_folio(), but it adds the
capability to conditionally mark a folio as dirty. VFIO will utilize
this interface to accelerate the VFIO DMA unmap process.

Suggested-by: David Hildenbrand <david@redhat.com>
Signed-off-by: Li Zhe <lizhe.67@bytedance.com>
---
 include/linux/mm.h |  2 ++
 mm/gup.c           | 27 +++++++++++++++++++++------
 2 files changed, 23 insertions(+), 6 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index fdda6b16263b..242b05671502 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -1689,6 +1689,8 @@ void unpin_user_page_range_dirty_lock(struct page *page, unsigned long npages,
 				      bool make_dirty);
 void unpin_user_pages(struct page **pages, unsigned long npages);
 void unpin_user_folio(struct folio *folio, unsigned long npages);
+void unpin_user_folio_dirty_locked(struct folio *folio,
+		unsigned long npins, bool make_dirty);
 void unpin_folios(struct folio **folios, unsigned long nfolios);
 
 static inline bool is_cow_mapping(vm_flags_t flags)
diff --git a/mm/gup.c b/mm/gup.c
index 84461d384ae2..15debead5f5b 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -360,12 +360,7 @@ void unpin_user_page_range_dirty_lock(struct page *page, unsigned long npages,
 
 	for (i = 0; i < npages; i += nr) {
 		folio = gup_folio_range_next(page, npages, i, &nr);
-		if (make_dirty && !folio_test_dirty(folio)) {
-			folio_lock(folio);
-			folio_mark_dirty(folio);
-			folio_unlock(folio);
-		}
-		gup_put_folio(folio, nr, FOLL_PIN);
+		unpin_user_folio_dirty_locked(folio, nr, make_dirty);
 	}
 }
 EXPORT_SYMBOL(unpin_user_page_range_dirty_lock);
@@ -435,6 +430,26 @@ void unpin_user_folio(struct folio *folio, unsigned long npages)
 }
 EXPORT_SYMBOL(unpin_user_folio);
 
+/**
+ * unpin_user_folio_dirty_locked() - conditionally mark a folio
+ * dirty and unpin it
+ *
+ * @folio:  pointer to folio to be released
+ * @npins:  number of pins
+ * @make_dirty: whether to mark the folio dirty
+ *
+ * Mark the folio as being modified if @make_dirty is true. Then
+ * release npins of the folio.
+ */
+void unpin_user_folio_dirty_locked(struct folio *folio,
+		unsigned long npins, bool make_dirty)
+{
+	if (make_dirty && !folio_test_dirty(folio))
+		folio_mark_dirty_lock(folio);
+	gup_put_folio(folio, npins, FOLL_PIN);
+}
+EXPORT_SYMBOL_GPL(unpin_user_folio_dirty_locked);
+
 /**
  * unpin_folios() - release an array of gup-pinned folios.
  * @folios:  array of folios to be marked dirty and released.
-- 
2.20.1

