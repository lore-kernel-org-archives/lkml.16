Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 006A12D322B
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 11:50:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745927444; cv=none; b=MhxZm4CshcNjViLkuoBi12waBRHjsxqfpXVHOYHqXa1ImLI5sHLonjPLGTwaSsGb7ps1hWybXIFk7ljKmZGIFBDYgqw3sYfPNUnsXfoTL8U7j/onItK3jjnBo2nxU/2Lg3R8QauUEKXzglWaMZ+MO232aVETGqm0n6t4wsi1Iz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745927444; c=relaxed/simple;
	bh=5wF15lZztxkwYWXqpSOs68VJh58ZU35XJoKkkZFV3vo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Y24RWWH1RWQ9I2Iw4Vko5n8FfAHJ7tgJ++RqxqI7K5cShrefteBR8HZQ4sUhZg6nODDYT3d2Xe6FTG+GsyXuHuiJqic6BE9dwm8QG/2kaxsbuk3h/VNrDOCbMXYNPrqxyo98/tJM5j84SpSNnHGF6TEimtTu5Wq8jUYcEiDFyEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ices3CX3; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ices3CX3"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-b0b2ce7cc81so5813302a12.3
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 04:50:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745927442; x=1746532242; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=1iyyLf3WUxORZOnWOPX6x4ocgIFr1IijLbgh6GePFQ0=;
        b=ices3CX3PsghaoA706x6iR+VJIHrpHLcF9Y73lcqnSocTOtwFARiws86Duq/j/xrDx
         fyV5Aqp2IhLo2GBssPw6Q0YegV0bpWghs49KXIBcHC/BFBI6Bb4LWwSaI2sUMxTCNPk1
         bROMs4pCRi891fEeFmlSU/L0MbITEE2BNZxWJ8F2dQTbipBzZ5DwyWeWXA/V7u8BiNrv
         qWvFIYR35aimySFMddV3Ut+3Ee7Q8ftYTuxuDC5PprqWGn6DREvNmARoxH+99uj41rBR
         VSOFOkqxzlZsVhkcFN6lv3+mOtOPcIBDhzCTazfMJvGbYVfHbePylESWsX+M1MNoo1GK
         bWYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745927442; x=1746532242;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1iyyLf3WUxORZOnWOPX6x4ocgIFr1IijLbgh6GePFQ0=;
        b=gLAbD2QPjvkR/jlu1XbAA92yDtp6zv/QrYwfHK4LwdmuaPCkxNcgP2YhbRIf2WMSxn
         3IR8VnCmwFmlsCwsuhTpF10GVtxLifxRVUo94Nyd7K6s/geBqtZIN9sor/joe1eMjNOa
         P91fI58y0nOfYVGloCwtPxmtPAN+dj7FaUHGLAUBj30iLa3uAD6o+6nA5FpDoVte0Bxl
         88hZq3Dz2j1XxvprgcahxJzqYVfMgAz0Jwwh23MhIrwiJPxOktdGMZ/MUUMakDdgnzGS
         cRXzNqMvQscSRMPFLH6pVAm1T9GxHdMElE5E4VJdCJB2DyHbLRyUQK/a/HZ2EOTkJhV0
         VurQ==
X-Forwarded-Encrypted: i=1; AJvYcCXSm6/srveVxqT7ZXqXXJVFVozqLc/ud6PnwkMNxjYKvIQrq9Z4X7lYHuxyp8Olr8Yh7JaK+eT5heuASLE=@vger.kernel.org
X-Gm-Message-State: AOJu0YybYzoj+4jz6aphCcn8jFG7791aP4GKcU3QYltTK7n/fHwKbPH/
	/6PpLVTw1oy7JBgAtYaMThIGFCHxcxrrp8o2rsmQxhB5cQ2mti/G
X-Gm-Gg: ASbGncutQqVSpSXc6T1WrSBNgeSgFHyEzZaaJqf21M1dewQHoU2/FWBzXBCQ/lzLjTe
	qs4qiHjDjuVl3rDe6GHZaOGlx8T49Hsyqfbn5OMCTR+N1MhVFub1hC8NiJuMkSJNjPNrnZLR/kq
	Edr6OCijqVuZI9zGnm7kLb9nrRE6ia8HVCA0v+ya7ka0AEqZdY0Ai8hOBw5Grl7dJLJeXR+ZftO
	ngYoRDvIo5L3QmCAQNRhSFDsEosdGidz8PZLFWMsV03Ud7iF0RwmvR6xt+aTEq8icnui7ILKh/Y
	gsC5ekeVv671+uVuCDtDrSdIcLhJUxRwYTNmPLcGdgymcmi+CVnLCBVcSiexwc9T6KuHMn0=
X-Google-Smtp-Source: AGHT+IHGZrBDHK1WbkvwgRv01O0LY6RBxT8KjFbk+mC347HBJHKGCCEDSTjXjALIl+WfaCFQil4KFg==
X-Received: by 2002:a05:6a20:cd93:b0:1f5:8d91:293a with SMTP id adf61e73a8af0-2093e528fa6mr4122901637.41.1745927442169;
        Tue, 29 Apr 2025 04:50:42 -0700 (PDT)
Received: from KASONG-MC4.tencent.com ([43.132.141.24])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73e25aca62csm9661644b3a.167.2025.04.29.04.50.38
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 29 Apr 2025 04:50:41 -0700 (PDT)
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
Subject: [PATCH v2 6/6] mm, swap: remove no longer used swap mapping helper
Date: Tue, 29 Apr 2025 19:49:49 +0800
Message-ID: <20250429114949.41124-7-ryncsn@gmail.com>
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

This helper existed to fix the circular header dependency issue
but it is no longer used since commit 0d40cfe63a2f ("fs: remove
folio_file_mapping()"), remove it.

Signed-off-by: Kairui Song <kasong@tencent.com>
Reviewed-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 include/linux/pagemap.h | 1 -
 mm/swapfile.c           | 9 ---------
 2 files changed, 10 deletions(-)

diff --git a/include/linux/pagemap.h b/include/linux/pagemap.h
index 47b5746d5a65..a071cdc8f902 100644
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

