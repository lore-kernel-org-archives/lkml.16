Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F093A1A2C0B
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 18:51:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738867888; cv=none; b=WFV4KN4RiHDclPe8Y9/v5mAmdCDbWZt+X6owsUryS+Y0XNy+KLEBONClhJVIfUABwlC4e7vVT82UsgeVKyCmDNH+QqwCfPvfCi65OT0rEkjg5JFo5HlRjLt9xmQp/XO2nrg2tQSOPUTUOWlP1tqFDptc8DamnStd0WrWgvKbvKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738867888; c=relaxed/simple;
	bh=+L2iUrkIOG2McHgwXf/cmLt73VvME9sfxcwyqOSO+z0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=X7daIFvG/86YBbJPkXGe2iroYkuR67meeC2aDw0tIsGLgWgUni5B8eqes9m9gl4wFomiLjucAQ2mvIYxUXZ2kaK70kwy2FW9GdphxeUL78L8e6pj62D+ng56EwXCDdRJ1OLl1z3Zs9tt6nBjMwyzXjUwEEM/HovyfXJP2aVWoOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--fvdl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=1xpBNuJ6; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--fvdl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="1xpBNuJ6"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-2fa228b4143so147781a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 06 Feb 2025 10:51:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738867886; x=1739472686; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=3krrgaxsXaFa4uf9iEDSe21apCBKUA0Oh8FsqZLKWjo=;
        b=1xpBNuJ6slJNDEtm7amz1rKxPtgnUA7K1Yq6TW9i6hho8ysFHdG63v2sWO+S45avle
         RqOQ5D0izI6xwN5Hz3h6PwG1jVBXCPTYVeorNqVAnVwoDoLpfmB9F3ShjfrD6dyYvXXY
         JTzgIuRgbD5YHmXiWR34PCglhd5uIHe3J7MR5akmahwTZeSOEtSLRHkPIaYGy6tTviEV
         mfOED4LtnoZ7MGYgjDUGD5JpduzXfIJc6+ycsf1u7nuOJ/bKe2HsnL/L1Ea1XKcptRZ4
         Ku0nMxBwRlrqW65IZeohnXvCNVgNIkXm2uEkZKfZTmYtzbBNDTtLdY7P12odtf0mlaiI
         GZvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738867886; x=1739472686;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3krrgaxsXaFa4uf9iEDSe21apCBKUA0Oh8FsqZLKWjo=;
        b=C4tcPWw4xdSOH41aMK2iF3LJLQttA2pu4GCM1P55k3vDgy5yO7aEGsHtfvCUZ8mgOr
         0TjWoDd+2pZMdOOb8XiKG28IMprxmpnrvdB9cr8y3QZpEnZHU0UheoqERd09b8ozYxQk
         bcJZRgRyoUbVJu7z6b6+UABvaoAtI52D9nD4nz2Bk9nadiNw+3x0yfzA8fdhTZlDHTqk
         KeDvAd6tZBFkOEqbx0h7vRS3U/mhPpXXLFeczxqiA67NKopRBvJjqQ3tZ4rIRf1YM6Me
         pMcEgqxj7aQQvBSe5Bt7VS2kFkcLuyptdsED2GthAtr0D+2siGBne7rA1FdFp3vXD9Hz
         JPeA==
X-Forwarded-Encrypted: i=1; AJvYcCU0Wpffnw8l2EuBImKUk2r4EPb2r89rgqqW7sJWxN72W8vE/I5fr0I2XEcQzuHZLAhMYMLJ5g2q3SUaFwo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0Hq36YnOmAPI0rL5+bJNEFwcMnqm5XYYxuoYbqE0FpD6mN/bd
	mHgg9pRjZfYvyKz94EYGqY5WjtTpvsmBLeXs5nFctIsSraEaYCbq29PrxGfVwh5D2aI0Og==
X-Google-Smtp-Source: AGHT+IHdn9ARX0BKU2aoxnDMJSfDfQ2JxdDOMx8aC4l0xtpEE2SmhHzHCIxuEt3YV/CF1/5TaCD9NFnV
X-Received: from pjbst7.prod.google.com ([2002:a17:90b:1fc7:b0:2ef:95f4:4619])
 (user=fvdl job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:5282:b0:2fa:9c9:20a3
 with SMTP id 98e67ed59e1d1-2fa24700cbfmr107801a91.0.1738867886262; Thu, 06
 Feb 2025 10:51:26 -0800 (PST)
Date: Thu,  6 Feb 2025 18:50:46 +0000
In-Reply-To: <20250206185109.1210657-1-fvdl@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250206185109.1210657-1-fvdl@google.com>
X-Mailer: git-send-email 2.48.1.502.g6dc24dfdaf-goog
Message-ID: <20250206185109.1210657-7-fvdl@google.com>
Subject: [PATCH v3 06/28] mm/hugetlb: remove redundant __ClearPageReserved
From: Frank van der Linden <fvdl@google.com>
To: akpm@linux-foundation.org, muchun.song@linux.dev, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Cc: yuzhao@google.com, usamaarif642@gmail.com, joao.m.martins@oracle.com, 
	roman.gushchin@linux.dev, Frank van der Linden <fvdl@google.com>
Content-Type: text/plain; charset="UTF-8"

In hugetlb_folio_init_tail_vmemmap, the reserved flag is cleared for
the tail page just before it is zeroed out, which is redundant.
Remove the __ClearPageReserved call.

Signed-off-by: Frank van der Linden <fvdl@google.com>
---
 mm/hugetlb.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index 1d8ec21dc2c2..0836e3231774 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -3202,7 +3202,6 @@ static void __init hugetlb_folio_init_tail_vmemmap(struct folio *folio,
 	for (pfn = head_pfn + start_page_number; pfn < end_pfn; pfn++) {
 		struct page *page = pfn_to_page(pfn);
 
-		__ClearPageReserved(folio_page(folio, pfn - head_pfn));
 		__init_single_page(page, pfn, zone, nid);
 		prep_compound_tail((struct page *)folio, pfn - head_pfn);
 		ret = page_ref_freeze(page, 1);
-- 
2.48.1.502.g6dc24dfdaf-goog

