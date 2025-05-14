Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 062F529827A
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 20:19:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747253980; cv=none; b=aXjf75zwMVkoC+IbObWHmv0aaP50k1kglAFhxJNXfSh2ybW3LKEOC5FRsIpNlqrFfai7rof3oilA21NlwsF9XzTwePU8Vcf6l9vGrmQnHnYMf2IkJHMFiZMXxzn0uj+aQTv5EuwIuH2ML8H2JvdWHZ1US5UvXynfPsisf2du4Ts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747253980; c=relaxed/simple;
	bh=g+1jY4JQtidJcaTAImsT0t1pCHOxs6b24whD2ZiSzfA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ql7BUMGDfFmY7WraBpvIE9XIhfnKu3ttWJWZaunJsCx2AB35qNtTa57fhRiOEmoMc/z+4hYsqM6wz+l13vdoZnf1SEl2eH7TJG8FPeop22liEEVhskHsXVGfDEqRsYllPca/tSpmtMQt8CrNexWMgmQbqxJtdFSP26GMUlcXwms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NXwuV7XU; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NXwuV7XU"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-30ab344a1d8so279976a91.3
        for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 13:19:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747253978; x=1747858778; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=m/tKAWQg/dKBRoqSNJTqNYIKEPlXdDROP0NJrD1IvN8=;
        b=NXwuV7XU3o/UTSSn+F6B8C/jggWtxvdmPdDjnj5wEB9bM2Z2+L0e9eHL3WFtRfaWDD
         iDSzg1y5INyTuo+hzU86foK1K5pPwT4IsCXmxjhf+bpF8pQhfeW18ZXTvm1c3ZzL9ytX
         AgeCmrfDqLGiiESuvZRpxau3ynAfRb1r1fTHVV15KtE3esI92beM4cmochX2oRC7okvp
         wjGzwfpnck1lRuuXGO/IBKcDpu72OSH6pR0XRWCB0Qiu2PDP8LHh/luMUXEV4OL2ZQGH
         CCcGuGpZpffq7Yee0HAM2WivNJElDXfEXmztbphIvRLb46oMOjk7rGuxd2DC0EXktu3R
         xFGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747253978; x=1747858778;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=m/tKAWQg/dKBRoqSNJTqNYIKEPlXdDROP0NJrD1IvN8=;
        b=Jj3zRfVQ5jtgdiIc77BgssMEuT7nm59HghU02qBb4pwGk3DelpIBqZ4naW9AuQy+o+
         LDiR1H3AtFA/FeCqT67N0pCgCS8p15B15F4clOsEdZn1G1OqHu8NL2K5o8vgcbumjYjo
         HF41w+zbFlGwdbalbsd3dHFHBYfBfNELJ0eu37RcdEZtK+knuta8nqEe80hQ2f0qE3TX
         54OBYhIln312HKTibxgjLk/dl44cjSlv6XYVA059MatGnDtUDMWyuR9gb33xCzks4gLX
         JAhzyZDSm1Ss4r1O5phuoZAFVKHH02Vo+RVQNYpF5RskuoXF0idfaQWafT0Jd/J00/li
         r5KQ==
X-Forwarded-Encrypted: i=1; AJvYcCWHEc8wKl+eM6B1SJWF3ykh7NbNWmv+o90kue+hkZ5y+1I/mZ6AtouNifSYXs2NfGoOP9QFKLLeFZjnFz4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yya2xbppVJ3gbHsJY07aTiUu2Ccd52EdUiYarrEA7GvQwHStln6
	t+dvXY/fdfpM9sElW+wvyqSHhu8AwE1HkmxxAC7VZ7lYTVN8o3Fu
X-Gm-Gg: ASbGnctMgtqqp4fibZPG1iFhShBaYfF7eIJlPuUDsq4LdPODUT3kqNomY5QpXGghgGg
	MgeLQBjlG2Ao7b3oGYL1V80W1fOWLt+6cKk46tqOKejWNTvFBfK4on7R86PjSeNhQCYOHRtFGWV
	USqAtRkXeiw6SPAgfhy8u3Qzm0oPCoJlAGA2/T6yyYrYvU8bY1ORkqeCmdlegvyId78QEPsfj6U
	dgMsLOnhTSuQlDc2qE8DeVf5Rszpzf7+6RhlXMkhj+lcQqjYtj2LjsCIt1kZLUdbG+EsJKqCJrH
	4VXepueRGRjFcawOGgpryYnXk7uvD3uQChH1jYT+p7AEILflRhNSMotp4ear7FwVdNhcKYLcLpA
	vZaklOJs=
X-Google-Smtp-Source: AGHT+IG5lNgQcqNb+IiMkrtSM4av6IuLMumXdGBLwYB3DyizguwyfvVk3iJ+oU+OFH2+AD7NZkOOwQ==
X-Received: by 2002:a17:90b:2742:b0:301:98fc:9b2f with SMTP id 98e67ed59e1d1-30e2e583da8mr6754772a91.1.1747253978100;
        Wed, 14 May 2025 13:19:38 -0700 (PDT)
Received: from KASONG-MC4.tencent.com ([101.32.222.185])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30e33401934sm2003692a91.9.2025.05.14.13.19.33
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 14 May 2025 13:19:37 -0700 (PDT)
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
Subject: [PATCH 23/28] mm, swap: remove no longer needed _swap_info_get
Date: Thu, 15 May 2025 04:17:23 +0800
Message-ID: <20250514201729.48420-24-ryncsn@gmail.com>
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

There is now only two users of _swap_info_get after consolidating these
callers, folio_try_reclaim_swap and swp_swapcount.

folio_try_reclaim_swap holds the folio lock and the folio is in swap
cache, _swap_info_get is redundant.

For swp_swapcount, _swap_info_get is insufficient as the swap entry is
no pinned so the device could be swapped off anytime, it should use
get_swap_device instead.

And after these change, _swap_info_get is no longer used, we can safely
remove it.

Signed-off-by: Kairui Song <kasong@tencent.com>
---
 mm/swapfile.c | 63 +++++++++++++--------------------------------------
 1 file changed, 16 insertions(+), 47 deletions(-)

diff --git a/mm/swapfile.c b/mm/swapfile.c
index c2154f19c21b..28bb0a74e4a6 100644
--- a/mm/swapfile.c
+++ b/mm/swapfile.c
@@ -1364,35 +1364,6 @@ void folio_free_swap_cache(struct folio *folio)
 	folio_ref_sub(folio, folio_nr_pages(folio));
 }
 
-static struct swap_info_struct *_swap_info_get(swp_entry_t entry)
-{
-	struct swap_info_struct *si;
-	unsigned long offset;
-
-	if (!entry.val)
-		goto out;
-	si = swp_get_info(entry);
-	if (!si)
-		goto bad_nofile;
-	if (data_race(!(si->flags & SWP_USED)))
-		goto bad_device;
-	offset = swp_offset(entry);
-	if (offset >= si->max)
-		goto bad_offset;
-	return si;
-
-bad_offset:
-	pr_err("%s: %s%08lx\n", __func__, Bad_offset, entry.val);
-	goto out;
-bad_device:
-	pr_err("%s: %s%08lx\n", __func__, Unused_file, entry.val);
-	goto out;
-bad_nofile:
-	pr_err("%s: %s%08lx\n", __func__, Bad_file, entry.val);
-out:
-	return NULL;
-}
-
 static unsigned char swap_put_entry_locked(struct swap_info_struct *si,
 					   struct swap_cluster_info *ci,
 					   swp_entry_t entry)
@@ -1549,7 +1520,7 @@ int swp_swapcount(swp_entry_t entry)
 	pgoff_t offset;
 	unsigned char *map;
 
-	si = _swap_info_get(entry);
+	si = get_swap_device(entry);
 	if (!si)
 		return 0;
 
@@ -1579,6 +1550,7 @@ int swp_swapcount(swp_entry_t entry)
 	} while (tmp_count & COUNT_CONTINUED);
 out:
 	swap_unlock_cluster(ci);
+	put_swap_device(si);
 	return count;
 }
 
@@ -1610,26 +1582,10 @@ static bool swap_page_trans_huge_swapped(struct swap_info_struct *si,
 	return ret;
 }
 
-static bool folio_swapped(struct folio *folio)
-{
-	swp_entry_t entry = folio->swap;
-	struct swap_info_struct *si = _swap_info_get(entry);
-
-	if (!si)
-		return false;
-
-	if (!IS_ENABLED(CONFIG_THP_SWAP) || likely(!folio_test_large(folio)))
-		return swap_entry_swapped(si, entry);
-
-	return swap_page_trans_huge_swapped(si, entry, folio_order(folio));
-}
-
 static bool folio_swapcache_freeable(struct folio *folio)
 {
 	VM_BUG_ON_FOLIO(!folio_test_locked(folio), folio);
 
-	if (!folio_test_swapcache(folio))
-		return false;
 	if (folio_test_writeback(folio))
 		return false;
 
@@ -1665,9 +1621,22 @@ static bool folio_swapcache_freeable(struct folio *folio)
  */
 bool folio_free_swap(struct folio *folio)
 {
+	bool swapped;
+	struct swap_info_struct *si;
+	swp_entry_t entry = folio->swap;
+
+	if (!folio_test_swapcache(folio))
+		return false;
 	if (!folio_swapcache_freeable(folio))
 		return false;
-	if (folio_swapped(folio))
+
+	si = swp_info(entry);
+	if (!IS_ENABLED(CONFIG_THP_SWAP) || !folio_test_large(folio))
+		swapped = swap_entry_swapped(si, entry);
+	else
+		swapped = swap_page_trans_huge_swapped(si, entry,
+						       folio_order(folio));
+	if (swapped)
 		return false;
 
 	folio_free_swap_cache(folio);
-- 
2.49.0

