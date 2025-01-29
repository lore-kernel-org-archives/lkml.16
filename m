Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5530B1E7C18
	for <linux-kernel@vger.kernel.org>; Wed, 29 Jan 2025 22:42:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738190548; cv=none; b=swYTI6yO03umo45k3D7F+ykmgB7Hzhau7/ypp8SSYEDZfYdZuvVIZF0sPZXv1jFNC4TJsl1CQQSBGGCh7d4qM+t/LQsRX5N7VUIR1KBbBrdG/OiCvQE323ojQsoxSWf5Uy1B0OnZ+SbK6BB9Wc9CTEXOmkWn5FVoCda51uSlacw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738190548; c=relaxed/simple;
	bh=QTHPlD8DBqsUzmejBD606RhshqtkZC/oNgf+Sxeez8k=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=DytXg46C/9MupA+us754lVafqIBQdljJuMQQ+lU6el+Ki0Yk/StoGZw+tz8kllOjAL1rs+rBo3MBL0hqdhIPDnZXvBzU9scRwUj9QDC+SbUfrBOxw8b2s74y7RarYQlZeHmhaAvX79YZQ3oZM1NXteFeAxnxe5UwDkOqpD+iETc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--fvdl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=kBujwiMl; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--fvdl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="kBujwiMl"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-21648c8601cso2323415ad.2
        for <linux-kernel@vger.kernel.org>; Wed, 29 Jan 2025 14:42:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738190546; x=1738795346; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=HdRvrkoUQwVvcsaszF053Gf7pOvYwH0DkTGUOoJ3gDo=;
        b=kBujwiMlk4DLw0fuvu43TignSypcqn+lvgialRfD2v9stTQ4M/kTMEszQVsRLmQGh/
         Ox7iNJev+6Bnl9/Y/HnyzFqwqdTJP9X7YvLZpz+9JtPP2bXFUwKZNBXOx2awav6NB+o1
         XxTobjDR09LIxjG9+LfXz+W25/GgRfmHODNe9ZYBN56MuH5Vn4husEFP8nJ7hc8SnohG
         BKAiCe/2d1UJRAbflEt+59Pn7VCbFxcbW5DB7kDNY18wv1iXzm8fELwDsCtl/rj1IIiO
         9NzlKvEhlF/wII1Tdq9T7LaNrlDeZY9UnNZOmK4rpuwwM9Mr9GkaIck84ueAfo2qvSOy
         7dAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738190546; x=1738795346;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HdRvrkoUQwVvcsaszF053Gf7pOvYwH0DkTGUOoJ3gDo=;
        b=NhZyUU+/SZRWoUQia4vUShR3dUF2Zo4syBelnX7hSYOyudPA50bcU4ALlc6/ndyHiZ
         VqwEJwuZKahqzipQuiVqLLGVEsrCbOehz18QsUQVQx6oytQSB8oqCpQPFi1wKGUKu9bF
         Wmj9xM5bEB+Sby8Xmo+rqgEayiLDeT85ZRiiYAa78SRuJi7hzeD1S8os7jcJ2TxlMsiL
         QER0gm/ledifcKF4uq6TebyI7z2JKzqjdaJtUH58PpCysqWxUtMDkEduGMAYFCTxYUZw
         nqccc7H9Cdp4BS+zUwzd5iMMP/CdOEbTmS7Twab6ngyLwC8YaOK0AFWi1m+Nmv46cj5q
         DRIg==
X-Forwarded-Encrypted: i=1; AJvYcCVQUpmyBUyZERdbdCvE407lvKypDpqcYl8yIF5Qw98+DwjEiQSeqPKUIkxmLGcgfxv19jm531FeikQ//J4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyNX9/MesPk4sriq97owNJ29qFQwKJCUsf5M5rQgdscInBmeIZc
	cxPYUgHgvmvouzlojnhwNoUZxiALZk28CclTygWPWN5auH+MjM5zhAboFCqJo783YSH+Ug==
X-Google-Smtp-Source: AGHT+IFRGE8bafbhkN5A9bi7pt5tKOVuNMtgjq5HbfI2cYsNenspZDtaK1fZTtPkQMrimOxYLTsrX/5U
X-Received: from pfbcq13.prod.google.com ([2002:a05:6a00:330d:b0:727:2d74:d385])
 (user=fvdl job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:4d05:b0:1eb:22e5:bb76
 with SMTP id adf61e73a8af0-1ed7a648dfamr7753541637.42.1738190546527; Wed, 29
 Jan 2025 14:42:26 -0800 (PST)
Date: Wed, 29 Jan 2025 22:41:35 +0000
In-Reply-To: <20250129224157.2046079-1-fvdl@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250129224157.2046079-1-fvdl@google.com>
X-Mailer: git-send-email 2.48.1.262.g85cc9f2d1e-goog
Message-ID: <20250129224157.2046079-7-fvdl@google.com>
Subject: [PATCH v2 06/28] mm/hugetlb: remove redundant __ClearPageReserved
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
index 18d308d5df6d..196359254cfb 100644
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
2.48.1.262.g85cc9f2d1e-goog

