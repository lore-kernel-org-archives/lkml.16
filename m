Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EC1E29A5
	for <linux-kernel@vger.kernel.org>; Sun,  4 May 2025 11:07:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746356826; cv=none; b=YhsPkPiQrRkKyofTMxK/+tnUbjRvWGpG9cNjJUgQGln+zKFAyNE+3Y6cOcqXlC72xdqJGbEQA/PBtxlR47yfMgXRtuV76tP7m5XrbfUaOLmp1QWT+ANZgt7EwZg1i7uLgwrWLOCniQR80+2gARsDd7S2CQN9q645UNN24iRw90w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746356826; c=relaxed/simple;
	bh=0VERiJMgiwI6jFZ9ISp9whJpzgJBTRB3apkw4FkBNmk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BAd/xcLfwhw9GWVHBE39NWdOcMbjCycF5nzytfEhKIg6rLDH8VwZSN4vc3wsdyFmcBirFiUCOo2xczaDsIiFOCh4xHEMmEX6q854YVHo2vURElCAXHng3lZUebtOsj7l3hj+jqVHUs/q/vr4lhcTp/OGQ68s3d89ByPix5dphcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=W6PIrqvJ; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="W6PIrqvJ"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-309fac646adso4169926a91.1
        for <linux-kernel@vger.kernel.org>; Sun, 04 May 2025 04:07:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1746356824; x=1746961624; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/pI9Obv7HIXjCZcC433R6qPEf3axp+1OaRirOCKBrC0=;
        b=W6PIrqvJdZxZzEbP/hFZ3QwQ58Vq8C96zq8P7+p0gBjGVizDfXh4L2jVb57LpHw0II
         j9pB6tyzGiW88NTYirw4vQo9fuufjSCToPunJdhCVP7ih855vVAnYLMUi1ninQYvGtvS
         QIzSfoXJr4rLHxf4DPhEL2hvn3P82bFEQUMDU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746356824; x=1746961624;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/pI9Obv7HIXjCZcC433R6qPEf3axp+1OaRirOCKBrC0=;
        b=VUhqE3Ng/EfRRCI07eLBA0oY1cioT1XGCQ1l3AjGv+TYxviKxdZKr3/+xSAAjU/y6k
         AeIZSxR4OLGrKOEqzWZqglmQnw1seDNbx1Cv9uBh71SLGWZkDLNp6KPFZn3oN8aU5Cbd
         GaKxeLSv7dUW6Jy8v7LCL0L9w9ryU2CmH3UEBbbOBXqbb6qPcIGIgwFgYAgFufND91Wr
         idgh3pQvjbz0sK4tH55NLzmHQE88IC5IA7dGPiTXEqhv6NPGIPOCCCG6Oh9Hav2Sc7Cq
         849o3ii+8rwdeoxph1XATxUg6nmMrREi6nwGBISQyB0IfDO+FbC/rd+Dg3tRVFtIG57a
         i3mw==
X-Forwarded-Encrypted: i=1; AJvYcCUmaoxOhohLWIv3hl9MmX/0CrJH+vx4w7VYYFqI85XRptV0dY1DBdcfV0p4F1JwNym7VQ9333xs8GuJDIk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxLTU9c462xfOOWTBOLRlaCcQUrGg0cV8/E+xWbZfnmylFO9/rH
	9xKadYGPEGyHcb/l9sstbAX3zeN5IeJT0jjWH9p1IAhebjfcO/NV5QZ68Pgnyw==
X-Gm-Gg: ASbGnctjKEAM5hXJDHofOkd5BQH/366KOxXTfqq2zc6Rd1iYWHbyxcE4EgYJUw/6Yq1
	zBwvV7N7jQGLpl6DnvaE/bwgNG0MVfWZXLS0S45G/FMpLmKF6Hfki9S9DA0I2SfJhUC3IKc6X4X
	TT7SBztvy4D15//WFUdhiLHUNcgcjqFYzwcVdyi8xux+kYKRWY2ARp8IyGFYIQLiCvONwjxU2AX
	K+ID1yt1rwTMMUoQz+bwYdUwqKSX0b/F7IzRdSxyeyz5jtqN2c24fzlH0pdPkOWJZBr9TK5VNah
	eir01eump7JvqbwFp6+msnN49vXL9FtMJLj7QcXUEeITVl1V3Aw8JVukItu5UjH41I8=
X-Google-Smtp-Source: AGHT+IFlS4+lefR+0LAoamLgv5CoWQCVZEeaRDI30l0lwLe1UVce2xjnxOQ2Kr4rtaaHpkdhR34kEw==
X-Received: by 2002:a17:90b:5247:b0:30a:204e:fe47 with SMTP id 98e67ed59e1d1-30a4e238283mr13971701a91.16.1746356823799;
        Sun, 04 May 2025 04:07:03 -0700 (PDT)
Received: from tigerii.tok.corp.google.com ([2401:fa00:8f:203:c979:b45c:9e0c:bf77])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30a3480e9d4sm9273491a91.36.2025.05.04.04.07.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 May 2025 04:07:03 -0700 (PDT)
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Minchan Kim <minchan@kernel.org>,
	Yosry Ahmed <yosry.ahmed@linux.dev>,
	Vitaly Wool <vitaly.wool@konsulko.se>,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Igor Belousov <igor.b@beldev.am>,
	stable@vger.kernel.org
Subject: [PATCH] zsmalloc: don't underflow size calculation in zs_obj_write()
Date: Sun,  4 May 2025 20:00:22 +0900
Message-ID: <20250504110650.2783619-1-senozhatsky@chromium.org>
X-Mailer: git-send-email 2.49.0.906.g1f30a19c02-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Do not mix class->size and object size during offsets/sizes
calculation in zs_obj_write().  Size classes can merge into
clusters, based on objects-per-zspage and pages-per-zspage
characteristics, so some size classes can store objects
smaller than class->size.  This becomes problematic when
object size is much smaller than class->size - we can determine
that object spans two physical pages, because we use a larger
class->size for this, while the actual object is much smaller
and fits one physical page, so there is nothing to write to
the second page and memcpy() size calculation underflows.

We always know the exact size in bytes of the object
that we are about to write (store), so use it instead of
class->size.

Reported-by: Igor Belousov <igor.b@beldev.am>
Cc: <stable@vger.kernel.org>
Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
---
 mm/zsmalloc.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/mm/zsmalloc.c b/mm/zsmalloc.c
index 70406ac94bbd..999b513c7fdf 100644
--- a/mm/zsmalloc.c
+++ b/mm/zsmalloc.c
@@ -1233,19 +1233,19 @@ void zs_obj_write(struct zs_pool *pool, unsigned long handle,
 	class = zspage_class(pool, zspage);
 	off = offset_in_page(class->size * obj_idx);
 
-	if (off + class->size <= PAGE_SIZE) {
+	if (!ZsHugePage(zspage))
+		off += ZS_HANDLE_SIZE;
+
+	if (off + mem_len <= PAGE_SIZE) {
 		/* this object is contained entirely within a page */
 		void *dst = kmap_local_zpdesc(zpdesc);
 
-		if (!ZsHugePage(zspage))
-			off += ZS_HANDLE_SIZE;
 		memcpy(dst + off, handle_mem, mem_len);
 		kunmap_local(dst);
 	} else {
 		/* this object spans two pages */
 		size_t sizes[2];
 
-		off += ZS_HANDLE_SIZE;
 		sizes[0] = PAGE_SIZE - off;
 		sizes[1] = mem_len - sizes[0];
 
-- 
2.49.0.906.g1f30a19c02-goog

