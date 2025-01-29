Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 157781AF0D0
	for <linux-kernel@vger.kernel.org>; Wed, 29 Jan 2025 22:42:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738190545; cv=none; b=C7GUXYXE6XgbxFuf1r6v4iOS1NYMcMEZuMmqsXjmnlMkQWpT7rZHcfZVMlu3ZUaRyfs6Q17kEmKJ8g0s+/MFVM1+kTjjxTel4dyF/mMDKTPQnqZXYUJtlNVxYX0R0Zx7M4axjBeYrPICSD/uwABEt4Lsm9+hWgo9Geut3YUodFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738190545; c=relaxed/simple;
	bh=Bx7rl32jj+RwkpgVjGbMqaXqMbbBmCxfh9mV2eRZvjQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=UAQoJGJqkg1rfEs/JK4TJaW91sYelUsIPidou3tMBdCri0x59h9lCoic6vnZwEEqKNRDO636QaOKAs0TAZ3ATyPtJEx3VbyFVpGNOkYCa/e1uh6PpKODkrUfOGojF6SfCaPOSR6GnYWbcxUKXJnTpKR+RN3n/q49qXO3MQDA108=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--fvdl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=N2QhgiYG; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--fvdl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="N2QhgiYG"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-2efa74481fdso243743a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 29 Jan 2025 14:42:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738190543; x=1738795343; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=U/uGGJrSbaHhwDwSIFP9+o74IAHqfAjITEitLcS5SV0=;
        b=N2QhgiYGGQndriv3c62yi6wXoJ36KnB9MzFQGfwJAcl17Eq2Wj+9WW5juYZxWIh05J
         NlbFVEm3H42Mc0C0sMMJMMo6Q2wDNVqB3W8wqsU/+DwlZkmYPtgloiuny2dgOREXEg3v
         gv14pM39fqdko4RmeRiuE0On8Z3pTVvfOlZ/Ed2aHrJM++fU9EeO8oubrhEuUzrRxDca
         qHsVU49NLyv2buuliTxCJEqL9aNwY7ZjVHyJ+YoCbk9kzzri6Lu/jlEY17ccaQg0bAKp
         2BZ+KUp/dHag5SIcG21A3/S+drvJvLQlaJMwQ91tAaVhwp1FnGed1N2yYO7v1VR43I7W
         NQAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738190543; x=1738795343;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=U/uGGJrSbaHhwDwSIFP9+o74IAHqfAjITEitLcS5SV0=;
        b=Lo+QhqqsanuTl2DMz+Fg6Nl7Mr5TrbFzaw15r5XSgLkl+Wo71BhGlpqhkVtqUq2HnA
         rdIvRtVZ+VYl5dxFwggqq4aVbzwwi1IBnYbnXr3wME8yAhhZ7tM1KNuMkIlpoEQRd5OV
         3iAq5ZUTJJsjkNJ/uhpbi1qZzWz9u40fJfuJle+7qV/uez15KjrKZXkWZAfwzABxfC+C
         CB+mYMDk8zedMLVSowg761Nd5SeD+y4JuO9nqlMRXsckamRe4ycs4DE9HXPxKJe+WkHY
         XQuEf+7b/08vH9vmp4n6TCC9/CRqfvm5r2sChzLAeyujPNKqojaT3YLB/uLORtjVxnfV
         13Nw==
X-Forwarded-Encrypted: i=1; AJvYcCUPFNgw1slz6DY18qLKkvzOWOk9eD87evzk9n2cl4OENK5omH6bGglaDiJRxg3KgEoqEBhmBYT62eBNvvI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzAG9xVg4oDLIBml66WIla4O8alaYsQd+ewjMpF0mlwq4fWWbcO
	1GNOo+NcrFtlqhrXt3UyD2RP4xepVB9NLlEF2s9hOhMf15qkezb7pWsLyjfv6ekcBmlLBQ==
X-Google-Smtp-Source: AGHT+IH06TMw+Px25LxLv4kXiMFgHunln09KW7I6gk88clhDm/mxCvzjecCS4D0Ez1GRYeHXSw6XGkek
X-Received: from pfbbt6.prod.google.com ([2002:a05:6a00:4386:b0:72f:59c7:f942])
 (user=fvdl job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:4f8c:b0:728:927b:7de2
 with SMTP id d2e1a72fcca58-72fd0be829amr8421810b3a.8.1738190543291; Wed, 29
 Jan 2025 14:42:23 -0800 (PST)
Date: Wed, 29 Jan 2025 22:41:33 +0000
In-Reply-To: <20250129224157.2046079-1-fvdl@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250129224157.2046079-1-fvdl@google.com>
X-Mailer: git-send-email 2.48.1.262.g85cc9f2d1e-goog
Message-ID: <20250129224157.2046079-5-fvdl@google.com>
Subject: [PATCH v2 04/28] mm, hugetlb: use cma_declare_contiguous_multi
From: Frank van der Linden <fvdl@google.com>
To: akpm@linux-foundation.org, muchun.song@linux.dev, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Cc: yuzhao@google.com, usamaarif642@gmail.com, joao.m.martins@oracle.com, 
	roman.gushchin@linux.dev, Frank van der Linden <fvdl@google.com>
Content-Type: text/plain; charset="UTF-8"

hugetlb_cma is fine with using multiple CMA ranges, as long as it
can get its gigantic pages allocated from them. So, use
cma_declare_contiguous_multi to allow for multiple ranges,
increasing the chances of getting what we want on systems
with gaps in physical memory.

Signed-off-by: Frank van der Linden <fvdl@google.com>
---
 mm/hugetlb.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index 3b25b69aa94f..bc8af09a3105 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -7738,9 +7738,8 @@ void __init hugetlb_cma_reserve(int order)
 		 * may be returned to CMA allocator in the case of
 		 * huge page demotion.
 		 */
-		res = cma_declare_contiguous_nid(0, size, 0,
-					PAGE_SIZE << order,
-					HUGETLB_PAGE_ORDER, false, name,
+		res = cma_declare_contiguous_multi(size, PAGE_SIZE << order,
+					HUGETLB_PAGE_ORDER, name,
 					&hugetlb_cma[nid], nid);
 		if (res) {
 			pr_warn("hugetlb_cma: reservation failed: err %d, node %d",
-- 
2.48.1.262.g85cc9f2d1e-goog

