Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 912A71D9A48
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 18:51:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738867909; cv=none; b=qnUq12uS/jQwRqYsX82rAFKUKonMwSCk6qMc1ANA2yOy7nmZAImWKkPJjeAZwTuvSfMXP8JPgxc7zFxW8KgPiSQka8LrqG8w0avimD4D9ehhd+3AMBqJeT3d4OzVrEr6zVI6Jl25axNloyH/5rVSxWyrmFpOlz7LssViblHLlis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738867909; c=relaxed/simple;
	bh=8Xr0dTsGa6vkJL7Cp0xU4nqS4A3Iel4yNhuGBUZVeug=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=HVoME+zbuLh9EuQ0OkIcAycjzF13Fu9J7OW/TD6p3ZOyhWyxy9UZ0oDUf9tXX6bQe70WPnVxVzw+u2Gvw3KPli5CEl/jngBQh5q97PYqVYdEAvaRoF2nu/Vy33sgFY7PKJsCdflfRQPcuVSB8E+U1xoYUHCxcuyWdFMkjwBKxOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--fvdl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=eZo2QnSP; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--fvdl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="eZo2QnSP"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-2f9fbe02121so2523163a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 06 Feb 2025 10:51:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738867907; x=1739472707; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=PNNc4e9k2qfZPyKSSlBoWZ8VBSivbX9t64nIb//yCrE=;
        b=eZo2QnSP+zTLh7o/6LI3meTCqWatF/+qWxcxjaH84Pn/OEUosK7IofE+lRySROVRY8
         bmtkeV7EKYFGovgblMPln6KOgDDuXz6bwUcB68ZXS9P/cGpypgbI4HXw8cgoNq16CEUP
         37nSAGFhv5ZEMVMkNeDSRRIaC28W9F2nhS9Ilv0BHqk8IkpfuALwZPXd5SV3AnsN+gmy
         vGHiT0V22bHshHKB7ydW/3rmhPUDh4y23ZjUtIzcL3cDIUsTbojtD9jwAMJr3WN5q6mM
         pg27qjoe9/V2y5RTh/5PU14uyccWwgdIGkj0Gqn6bUdUZ2GWhoE2qQ3YqBMTz7XcPUX1
         dMCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738867907; x=1739472707;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PNNc4e9k2qfZPyKSSlBoWZ8VBSivbX9t64nIb//yCrE=;
        b=e+BB5GiSZen5eGzBMIrlv8TQN9kolDUQ43bRMrXeCFFJHlS5PadbbvdC3bUy5+wW99
         q9PJxvEFWOqkisOyIDr9zZJR/CqxoIZg/TjR4dw9x856NO2dBcgCzKwdJdKdV25XrRPc
         Nr4/wuMQBq7FyGaBVQ81IXXEUX38iBnVnxdBxylWU5sOt7meSRXMmT5p+KjzzdzWyVT7
         dA52EB6VR7N4R99XrcgxPBVM2Q+mgtPYmMg8rZyAwEKvY+t2N1bYM7Vw8+RJPF1AGhhM
         1wa2uV1hM3DlQNQST1y4VFkoAWZWs1HEApq/46OP9fZnu5/svk7LaoWX5tGWFg9XXEGg
         0uZg==
X-Forwarded-Encrypted: i=1; AJvYcCXm3KWzP+R6WpEwlR7paJSz50QIlpp+90lxY/TPhNzqf40i/EBQJDNbuTohKl8si9O0Y2WQD2BGsKB8NoE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxmN58NIrEMw/y433m9vC5WnOJyayHENusGDNLcKXCciEtnvC0n
	pUG68mIzbjzC9pmgd0TKtw7qJAUFJDd1J3Yfx0IhrUNmlL2Gyz0/C/IQX3dAmYUVWDTP1A==
X-Google-Smtp-Source: AGHT+IHGGdqW8NvChqfMo/KsvB7iHoprf/cZ/BIgo0+z0Q3eFlECPhwcrH/qX3NKeNb05ShwfwU55FNn
X-Received: from pfbdh8.prod.google.com ([2002:a05:6a00:4788:b0:730:4c72:3583])
 (user=fvdl job=prod-delivery.src-stubby-dispatcher) by 2002:aa7:88cb:0:b0:72f:d7ce:500f
 with SMTP id d2e1a72fcca58-7305d525eb4mr475558b3a.21.1738867906868; Thu, 06
 Feb 2025 10:51:46 -0800 (PST)
Date: Thu,  6 Feb 2025 18:50:59 +0000
In-Reply-To: <20250206185109.1210657-1-fvdl@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250206185109.1210657-1-fvdl@google.com>
X-Mailer: git-send-email 2.48.1.502.g6dc24dfdaf-goog
Message-ID: <20250206185109.1210657-20-fvdl@google.com>
Subject: [PATCH v3 19/28] mm/hugetlb_vmemmap: fix hugetlb_vmemmap_restore_folios
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
2.48.1.502.g6dc24dfdaf-goog

