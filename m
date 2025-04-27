Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15C411DED7C
	for <linux-kernel@vger.kernel.org>; Sun, 27 Apr 2025 19:00:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745780430; cv=none; b=d2ispNYZAgfjRpG+9KXqYhFRCKZqnOktUXkfqucv7LV10MS0dn9gxYg3L6hzhanUIV8rVrV9x6Z9cwNu4iAjzs3RySaHBUlHbsLzvwpJE/NXwTA0PjAr7IuVlR39YOGqmL8Tnw7JubwUlqC2YT0VFxSmaoBbvBTQ4jLeewA56QA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745780430; c=relaxed/simple;
	bh=6tQrn9+xTH3Ch7ph4D4tcGbekDLbNeUvvmLN+sNTBZA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=H+m7o9ZF/jiGIg34O66lzjl8lHBb31o2YStg1pEgnZVxsVFHDi5falqnoZbz+7JcfnmF5ZOl8OLsQBnzpbey5gSJG/aJ/aZtyBfPrjR02QfTlWkyWCmgXfxtAtelqWaEwyy+mBpj75mEelcrNx5XwLd26z31iNre1v7AnJ/oN28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NWeIh340; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NWeIh340"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-736a7e126c7so3716932b3a.3
        for <linux-kernel@vger.kernel.org>; Sun, 27 Apr 2025 12:00:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745780428; x=1746385228; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=f4lipydBuOubJubR5kmo9nNBPLmCY7qckq6Qt0Bh+qw=;
        b=NWeIh340zRY5E01So6fXRCaAamZ5u9BtILmD1ih+8PpNNji2OJ/4NCX6jK/iqDa60G
         xMLKFZwuFjyKyXujPXuupWmRYfGlR/7ugBDvGw+Wykp4HIILDX2bRLmCg041JeRbliEe
         uAa4/CyA+/OUPOscLH9FDsWnKuNuisVAQ6G7qksIElCxIR9TZJv9WBIVSvpBxn6L8Ut4
         LXZPZpbATsyPn6657Dk0QpD+/IQDRCGZj2Wp9APprfbzRF6XJJ2FeKkaG1M7wBd0hHAZ
         rKh6Np5b6AjZMsM78OnNI8VFtTgyRyE7p82xNCWBTen41S7xtWcJLgsOEpGoxtIzoKsM
         DNXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745780428; x=1746385228;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=f4lipydBuOubJubR5kmo9nNBPLmCY7qckq6Qt0Bh+qw=;
        b=a9XUkrgz5vyM6ME05s23TJRuXPltJc1g2mbw3oCHxv1xUqL47VcebwnFS4JCSzZ5kn
         TU3r2JeVpyVnmxBmUkNVs18CzOSzsYVc5Wq+faZGdkD/xYKHGipMqvBGa/8elO+OKP0V
         oS5JRKRkY9Aafn5LzYIs8DrlfzMYRMJJfZXQ8f6zY/4q/sjKUzI26DRD55w3Fhv+VX6z
         nQ2YHfDLP/AhmxoU+g97Xymhrior1ySZc5kWTW+2Jm8CaZjAbJyAX/wVjo8anP1Giz8d
         kMnd5JrRR46G1pbKv1jTzuZ6pmLiUVkAHFlOOdV6e/PYX29XXBxWc8t6RVByHx1xExRy
         xnWg==
X-Forwarded-Encrypted: i=1; AJvYcCVEMEY07Zyoa7qSUwQYnVywdW+GO/RZ7VLA1GNF6KFA7QskPezBMpYNXL7W7I8pyXWawWH132CWfhpgkfM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yylr+rmgD5FF9uDFTcc154W6oSuXIVEQWMc7FfApN3Eye4b/oHC
	r+DKAqII6qTrxdHRmoF82i4vNMGvtWuItBqSZugRUuMT5MIskhx2R3aGgjRKoz8=
X-Gm-Gg: ASbGncuf2bZpM4zEH757/ZMvP77uiP77Lumi8LoTUHriIEXjhqfNQjTRY2K5kbp7eDd
	4KiRYdVquMC2CNBl1M6J0+yjt5MBOxODg79oODYKxLMAM8ejzxwOfJ8AbWyVe55zgpDi3AiRdWz
	zKSffpce4YOjzSaiUlULq7crVaXIaaHh12pNG+iEh3My3wBK+tZOBR7HQ/8ioDyDLeTpmjcQhK4
	Li3fCRJum/q0OomLws7TW7GfWljIAKIVuzV2HVpKv7AVLJaNTuX9+OeLpAnqBgOFAkMKecbXjPI
	mKbRo/sDEceRD9OQBofIstbRYQSu7Ei+QKlX2fZz6TfUpm/EQyw3USh66/KrHIXOPfF0qV9n
X-Google-Smtp-Source: AGHT+IEojAV7wyacxqGiE1y25FLFORF046WjhVqXTWNSq4957oQpkciYstlz2WCGKQpwjcRVUqRcnw==
X-Received: by 2002:a05:6a20:9d93:b0:1f5:8221:d68c with SMTP id adf61e73a8af0-2046a3eef47mr7803932637.3.1745780428327;
        Sun, 27 Apr 2025 12:00:28 -0700 (PDT)
Received: from KASONG-MC4.tencent.com ([115.171.40.102])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b15faded554sm5862153a12.72.2025.04.27.12.00.25
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 27 Apr 2025 12:00:27 -0700 (PDT)
From: Kairui Song <ryncsn@gmail.com>
To: linux-mm@kvack.org
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Matthew Wilcox <willy@infradead.org>,
	David Hildenbrand <david@redhat.com>,
	Hugh Dickins <hughd@google.com>,
	Chris Li <chrisl@kernel.org>,
	Yosry Ahmed <yosryahmed@google.com>,
	"Huang, Ying" <ying.huang@linux.alibaba.com>,
	Nhat Pham <nphamcs@gmail.com>,
	Johannes Weiner <hannes@cmpxchg.org>,
	linux-kernel@vger.kernel.org,
	Kairui Song <kasong@tencent.com>
Subject: [PATCH 6/6] mm, swap: remove no longer used swap mapping helper
Date: Mon, 28 Apr 2025 02:59:08 +0800
Message-ID: <20250427185908.90450-7-ryncsn@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250427185908.90450-1-ryncsn@gmail.com>
References: <20250427185908.90450-1-ryncsn@gmail.com>
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
but it is no longer used, so remove it.

Signed-off-by: Kairui Song <kasong@tencent.com>
---
 include/linux/pagemap.h | 1 -
 mm/swapfile.c           | 9 ---------
 2 files changed, 10 deletions(-)

diff --git a/include/linux/pagemap.h b/include/linux/pagemap.h
index f61fdb8e165d..b27e369d8bd7 100644
--- a/include/linux/pagemap.h
+++ b/include/linux/pagemap.h
@@ -533,7 +533,6 @@ static inline void filemap_nr_thps_dec(struct address_space *mapping)
 }
 
 struct address_space *folio_mapping(struct folio *);
-struct address_space *swapcache_mapping(struct folio *);
 
 /**
  * folio_flush_mapping - Find the file mapping this folio belongs to.
diff --git a/mm/swapfile.c b/mm/swapfile.c
index bf6c98009909..1a36e1f4f198 100644
--- a/mm/swapfile.c
+++ b/mm/swapfile.c
@@ -3653,15 +3653,6 @@ struct swap_info_struct *swp_swap_info(swp_entry_t entry)
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

