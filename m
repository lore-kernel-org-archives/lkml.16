Received: from mail-ej1-f73.google.com (mail-ej1-f73.google.com [209.85.218.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D7E51D8DE0
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 11:11:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743765100; cv=none; b=iLn2jUoIogDMmAMe6cCBKsLXbUV+kbaEH+uk8M8eZeQoDT00M1Es12o7D2IpNfsfJVGSo4yN/gJJjNXNXhBU7Fv/UoJLaTDx+IyrLdim1v1xdrf5OeDfsO1fOos9I/ZXF7NPGh32BDQFgIhj7H6Ar/mqnDvvPbpkROV0pxHLdmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743765100; c=relaxed/simple;
	bh=fIOgEfDC1VfXM5pKlMw6H+0V/aq1M2HiUi5OYVVfXQE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=LEG1F/MrswZzlO9gcAk28FfbiOBOuxLiRaUKjRdPYwHkwP6hGx9HKnoHQOec91CCOhJ9pFYoG60fLJqwcKdg9JJ42arvQ2E7A+068rv5z0k6GBj0Abw/PLMGKV2uHZeJ/fmTDFOZuhkI9z99qFzpUF/3h4X6fqx9+ZBAH1C+QSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--mclapinski.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=UMgq1/UJ; arc=none smtp.client-ip=209.85.218.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--mclapinski.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="UMgq1/UJ"
Received: by mail-ej1-f73.google.com with SMTP id a640c23a62f3a-ac6b047c0dcso172029866b.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Apr 2025 04:11:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743765097; x=1744369897; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=O3m+WmTCQqVjynILz7/6uCrd0X6i/R+AMAhm/ZBopf4=;
        b=UMgq1/UJmPEjWOj7bVrbIkuMppMEFUtQ/sKe3Hq9z6BhvtBJVAHtembAfGssnDizU+
         Z2xWiRtdNO20nq+asp4d1G9Ym3a4JGca3fqhyPTFg+cHs14tNqs/qMW4bN04cG8E1AnV
         LAr1K/2SE/fPXNkDXovKHba9ITMzIT3VstNQCNdSW5xON/gLgRekwOllYkY135Y2VXQy
         Vji2jh0a5di9mcwbZ0HFnmYr7XQmC4mUOX4QsMIUzvLXQq/4nZXUIzjMG3Nt1mvh3mFY
         uZky+rzlb7VXWzO2ibkBXzyve2IUVZ4v68UkrwIdctot7H5rQjbAw5zzev3zjzaOkdpE
         38xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743765097; x=1744369897;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=O3m+WmTCQqVjynILz7/6uCrd0X6i/R+AMAhm/ZBopf4=;
        b=h6KQp3ceVGnVRsnawBDk1gLkC34Xaw38Rulo6JOBu8EZZwvwnJf1LjyLWCA+fG9BY5
         r+jM0lDmKC4b1aDarpK8zryIZqPk3edgZprX6aBE1lXpI9yfXwUv5IVBmt3lNA+sO6re
         nX6n0IkUUCCxwEDcrGyebW0o1ZQ4FXgF1Vi8RApQOOYttIp47kULjkJItRwNmXfwAhmk
         ttrVV6MFXKhJx46dy7EAel9f+oSpvxw1fuQ8mEYjPVqzDJtj79E6jjcwQ9SQv+one/DH
         iuHmwBsz0RYEb0OHMizKC5M/6kZB83JO3T91ScS6wILp8vo3XljGdO/87lasDjvKNlHT
         Dw/A==
X-Forwarded-Encrypted: i=1; AJvYcCW3iEPZabiI9IVBCtsjvgl/Q3ei1bQ5l3er9MbRDm6rz9VkMLRT4NiyI1dIxoutkUWRwNA6KnyacE146Rw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxUrdtbnV7o5ieykHQdRHgAwdx0hUvPvIuM4O60Kc4axSct3LM3
	YOeIdd41UEocpPAlS2QdskCIlfi41yAxM5MErIgrdRGsbiZv6/CiMcnd9S9778SnIlW6lx7Uxvz
	A4eTWqBQ5v6A6ShBupA==
X-Google-Smtp-Source: AGHT+IGRCGm5SwBZezCEZlk2BcrDdHGxGuTaFAmDbFz42cXfolqybCHXvcnZcqvx1PkktVJ9luf+cLCY0XPEx4fA
X-Received: from ejon12.prod.google.com ([2002:a17:906:7b4c:b0:ac3:dbd1:7008])
 (user=mclapinski job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:980f:b0:ac7:391b:e685 with SMTP id a640c23a62f3a-ac7d19fe8b9mr276270066b.59.1743765096893;
 Fri, 04 Apr 2025 04:11:36 -0700 (PDT)
Date: Fri,  4 Apr 2025 13:11:03 +0200
In-Reply-To: <20250404111103.1994507-1-mclapinski@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250404111103.1994507-1-mclapinski@google.com>
X-Mailer: git-send-email 2.49.0.504.g3bcea36a83-goog
Message-ID: <20250404111103.1994507-3-mclapinski@google.com>
Subject: [PATCH v4 2/2] mm/compaction: reduce the difference between low and
 high watermarks
From: Michal Clapinski <mclapinski@google.com>
To: Andrew Morton <akpm@linux-foundation.org>, Vlastimil Babka <vbabka@suse.cz>, 
	Pasha Tatashin <tatashin@google.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	Michal Clapinski <mclapinski@google.com>
Content-Type: text/plain; charset="UTF-8"

Reduce the diff between low and high watermarks when compaction
proactiveness is set to high. This allows users who set the
proactiveness really high to have more stable fragmentation score over
time.

Signed-off-by: Michal Clapinski <mclapinski@google.com>
---
 Documentation/admin-guide/sysctl/vm.rst | 6 ++++++
 mm/compaction.c                         | 5 +++--
 2 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/Documentation/admin-guide/sysctl/vm.rst b/Documentation/admin-guide/sysctl/vm.rst
index f48eaa98d22d2..d716ff1f37b57 100644
--- a/Documentation/admin-guide/sysctl/vm.rst
+++ b/Documentation/admin-guide/sysctl/vm.rst
@@ -130,6 +130,12 @@ to latency spikes in unsuspecting applications. The kernel employs
 various heuristics to avoid wasting CPU cycles if it detects that
 proactive compaction is not being effective.
 
+Setting the value above 80 will, in addition to lowering the acceptable level
+of fragmentation, make the compaction code more sensitive to increases in
+fragmentation, i.e. compaction will trigger more often, but reduce
+fragmentation by a smaller amount.
+This makes the fragmentation level more stable over time.
+
 Be careful when setting it to extreme values like 100, as that may
 cause excessive background compaction activity.
 
diff --git a/mm/compaction.c b/mm/compaction.c
index 4ff6b6e1db2da..f29a09def4515 100644
--- a/mm/compaction.c
+++ b/mm/compaction.c
@@ -2249,10 +2249,11 @@ static unsigned int fragmentation_score_node(pg_data_t *pgdat)
 
 static unsigned int fragmentation_score_wmark(bool low)
 {
-	unsigned int wmark_low;
+	unsigned int wmark_low, leeway;
 
 	wmark_low = 100U - sysctl_compaction_proactiveness;
-	return low ? wmark_low : min(wmark_low + 10, 100U);
+	leeway = min(10U, wmark_low / 2);
+	return low ? wmark_low : min(wmark_low + leeway, 100U);
 }
 
 static bool should_proactive_compact_node(pg_data_t *pgdat)
-- 
2.49.0.504.g3bcea36a83-goog

