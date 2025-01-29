Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C1031F0E5B
	for <linux-kernel@vger.kernel.org>; Wed, 29 Jan 2025 22:42:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738190569; cv=none; b=tJo0wJ9SylK77AN6QGD9P/TFowDowZsq3jhZK3AVX4sFfDhx/4PK00wDozuLTmti9eII35fZ9g0LEkAOKPlFSbuw3VWovfGDr2QFME4AxRQwtS0c0tndOH8wU0G3b2Qwx54eagZthwjNGjnOdfdRVjTiN9P2trGh1weq6Ly4IzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738190569; c=relaxed/simple;
	bh=LJFPDBtGOdNbq7T310/ViXNMs77gIYUubuHhRJOJFWo=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=rBTeq/MDQuron1qibLiepRwzqsRfNMZUvrVlUXtIwbsqNGh39wqW31PsU7pxp1RhonzDvhMrEAl5InDpvCjIW2bJcsyo4Lbqo3izQvyKe7St3Uvf5C2UUGHs6k2yQTRWtQ598xyCGtWjeUbjlZFt5wp51fXZ1hUUe4ShC4pLDQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--fvdl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=DRkL03lW; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--fvdl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="DRkL03lW"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-2f5538a2356so221322a91.2
        for <linux-kernel@vger.kernel.org>; Wed, 29 Jan 2025 14:42:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738190567; x=1738795367; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=X7mcGCY9R/2wAfvNybb5kTke1CSbZ/pNKwqh3Rdbh4M=;
        b=DRkL03lWMx/G7V3yrmVHa6BEu4lf7PsOkSMBlCV5Mlf+OpKo992j7U3xVWkAnTOo1c
         q7sQhRbcAZROlhE5jhGb+52Wt2ekeLZYLTiEnOfGpgTTMO9uPmXepNOd8VSyTX5oXbku
         84wcAooMMBq6+asLAfKAB4xjbB97CyfzZUb906FdhOfh/RJsDQfwUMetnz0aImaQ4+mE
         +z6p4dhqjbUjJZVbIkHj2oGsDQz706kkPe9F6iWLpwvagyzq298T6wYJQcxHOq4iw70N
         QlwuF54u5lSu6sq4BkN2kuexO8LijLvj/LhKdWhQ1lYNBBdYPE72Gb0/Dv+xnC/+5Oqi
         VYUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738190567; x=1738795367;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=X7mcGCY9R/2wAfvNybb5kTke1CSbZ/pNKwqh3Rdbh4M=;
        b=qZiBDceTeF1m42ZdFOM+GyfZpHL23M4sXXcRjVZLt9f3SfWn6MyxvhyiEo/UQGoOay
         v+3KpfrALhSGMQ3QPDDtWCBRwPRI+uQ5W6iaJPZvSRvrCP3tqI/omoTzd5TdzEdqFqmx
         uFnqqsypxeinug5HEOsq2P/o0EuVvmU6fuVpLzwjoQAwkQ8+AuILgGZbJJRbRwTwZxPv
         31OEqfXez9WdMSg6py0e08SskJkf+uSueheiY9S6EY3EAcB3VfX5WfylDlRVKAWrkMwK
         qAPrJhZu2dxTYgDR0sS0oc72u5p5SjJeRDqfMyfhJ+fnIKJsJztSPFdY+w4Q2mI9GOyg
         xJWw==
X-Forwarded-Encrypted: i=1; AJvYcCVa6y9ZfkKZ4ZmTAYkdKQOtRKB0jum59p3/c6HGrwWhectR+HtR1rYhw05dydZ7zeiC6EhLJZPih5FBogs=@vger.kernel.org
X-Gm-Message-State: AOJu0YzztmAK/GHHd7DKaa/RRJ6ic70kpngSk5EdeZscL0ua1DxW6LAv
	FY+3D70m975deVVAQ5/Y0nhY4HM/tS6wTX/PvVJKEe84cMTbg421HdcW4A0sS7kVDp5dBg==
X-Google-Smtp-Source: AGHT+IGG+kPFiJE3B/odsMz1ETLGa3V2S5NMwNDqcw7c4uCRCsh1XEHgPCNnT2AiKU+A8bBdmV2pW4ZW
X-Received: from pfbcp23.prod.google.com ([2002:a05:6a00:3497:b0:725:f14a:b57c])
 (user=fvdl job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:3924:b0:728:e2cc:bfd6
 with SMTP id d2e1a72fcca58-72fd0c679b4mr6370617b3a.18.1738190566976; Wed, 29
 Jan 2025 14:42:46 -0800 (PST)
Date: Wed, 29 Jan 2025 22:41:48 +0000
In-Reply-To: <20250129224157.2046079-1-fvdl@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250129224157.2046079-1-fvdl@google.com>
X-Mailer: git-send-email 2.48.1.262.g85cc9f2d1e-goog
Message-ID: <20250129224157.2046079-20-fvdl@google.com>
Subject: [PATCH v2 19/28] mm/hugetlb_vmemmap: fix hugetlb_vmemmap_restore_folios
 definition
From: Frank van der Linden <fvdl@google.com>
To: akpm@linux-foundation.org, muchun.song@linux.dev, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Cc: yuzhao@google.com, usamaarif642@gmail.com, joao.m.martins@oracle.com, 
	roman.gushchin@linux.dev, Frank van der Linden <fvdl@google.com>
Content-Type: text/plain; charset="UTF-8"

Make the hugetlb_vmemmap_restore_folios definition inline for
the !CONFIG_HUGETLB_PAGE_OPTIMIZE_VMEMMAP case, so that including
this file in files other than hugetlb_vmemmap.c will work.

Fixes: cfb8c75099db ("hugetlb: perform vmemmap restoration on a list of pages")
Signed-off-by: Frank van der Linden <fvdl@google.com>
---
 mm/hugetlb_vmemmap.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/hugetlb_vmemmap.h b/mm/hugetlb_vmemmap.h
index a6354a27e63f..926b8b27b5cb 100644
--- a/mm/hugetlb_vmemmap.h
+++ b/mm/hugetlb_vmemmap.h
@@ -50,7 +50,7 @@ static inline int hugetlb_vmemmap_restore_folio(const struct hstate *h, struct f
 	return 0;
 }
 
-static long hugetlb_vmemmap_restore_folios(const struct hstate *h,
+static inline long hugetlb_vmemmap_restore_folios(const struct hstate *h,
 					struct list_head *folio_list,
 					struct list_head *non_hvo_folios)
 {
-- 
2.48.1.262.g85cc9f2d1e-goog

