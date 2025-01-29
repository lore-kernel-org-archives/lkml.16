Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40B001E25F7
	for <linux-kernel@vger.kernel.org>; Wed, 29 Jan 2025 22:42:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738190543; cv=none; b=goRW6U/8QP9/wQQt+GqplCdzEiFED1zXFRcm8DAZ5810JvSGAyJwrX7n4/knAtt9gUyh+5sbTDVJE6bzDjVqK9arqDZQG4UOSPz8Cnwuc6E3HmyLYJvWR9IHqV+z0VIwD5j1yoCPqvLMtW4TEal/4KtK+od2GifM8j1WFGNbFXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738190543; c=relaxed/simple;
	bh=iIVz0iaFnVdC85TvJU7bWEbfgairNIkAhFvDjYIxMbk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Ghq+fQq3/z5KKck7y6GUJ2gYw59GZuVWFSXEJ6FSrUUl3+PFdMEL3Aabg5r7uwEDEssGmEcStTe+pTERR5eFnUQT5UOytw/wXG9wfO0MAgmwETCdHX+rOqntcV+jJQzMvPnFc6/JIrSAIPh+zIBjSfd2t6fb/N8iKPG1t63ud24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--fvdl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=YCSzIOXF; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--fvdl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="YCSzIOXF"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-21640607349so3640055ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 29 Jan 2025 14:42:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738190541; x=1738795341; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=dXf4/6vVFsOQWOL4yP6AMC2Up5+2J9mezQuBbeYawcA=;
        b=YCSzIOXFRoaBiOzY+2vIaH5dWYPiSjSR3lSnv3lA3Ta7S0HWdS/L7YOAIePQWW9vC9
         1NDZBJmTUoF/dvWhELPNc7YQvA6koCxHb55SvtR64dGDOFqBRbKjw+1v8qqq9VnhL3QB
         dGmHaaGdyWNjzuozM2ocawrP+tz2luG4fGwmSBXPYYi4xRTC0I+Y8CmMhHo5/g9/oBKL
         sG+PpJSWUqqCTu8q5J8RBs70ewDdVoMFxudqYRu4HENNyYOwD2ZabOZfh+8NjKhexALS
         BvMuYsXMFW6k+e6cmD1kZkImjE4jDGZNtIhH5P2/ZiPIpN0s+yKNqAkFOt0inX2SECYF
         e+Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738190541; x=1738795341;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dXf4/6vVFsOQWOL4yP6AMC2Up5+2J9mezQuBbeYawcA=;
        b=wCUyWNUmAqwVWSSzGTeUl7+KUUOQQWMGpZfiFkQtQ0hJwidrgOuRj2mcsKh1Wbarsx
         hGaFKI4ITJd+vfa5l5PWuxxcpbMygxiva6B2rhj799tnTlkmk9jQtCMw7fIDy6FSk6dw
         xVXWAWCTylp3uD8l+HEoUheKZLencs6/leK7jChrqoxyN6g4zjqSai298ao00QZI6eQ5
         Bg8P+78XVC4H9ZGGn84HdelXq+BKhap1kWaBT+LBx2x5xftLOX2HOXGB9MRzhN283azw
         P370uNEuUXsh8Di/ELHX6/Ssa6HcFOYkL9qf1gcvJU//X21VCtkJ0y9EhUuvtK0F2NRk
         Wp8g==
X-Forwarded-Encrypted: i=1; AJvYcCXKhfSCYibW0XoVPLOWaO0MfGT4kMO9xIiezNHVL0XH3Ss0+nAMN45pxnivDDGfIUXfBdDzPIpkFOnIIMo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1uV7WGZStlcfP5dkEpKIVlud/spBwBxhbk51q3q6b4xa+agLP
	UVU2TgzynS7o/YYNVD4NaCeAjabUH4XHDyWqWEO8yYAOPSiZN6UnPEvJqipGYoGTEvba0g==
X-Google-Smtp-Source: AGHT+IFtjyy0fiL5jPCk8tJl4v0XKuHY7KQNCKtXfPi9xeiKgYj5YSOrbzBr7gtJ/uGT4M5R65Qgn0uu
X-Received: from pfwy16.prod.google.com ([2002:a05:6a00:1c90:b0:725:e46a:4fdd])
 (user=fvdl job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:458a:b0:1e4:8fdd:8c77
 with SMTP id adf61e73a8af0-1ed7a479222mr8328798637.8.1738190541605; Wed, 29
 Jan 2025 14:42:21 -0800 (PST)
Date: Wed, 29 Jan 2025 22:41:32 +0000
In-Reply-To: <20250129224157.2046079-1-fvdl@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250129224157.2046079-1-fvdl@google.com>
X-Mailer: git-send-email 2.48.1.262.g85cc9f2d1e-goog
Message-ID: <20250129224157.2046079-4-fvdl@google.com>
Subject: [PATCH v2 03/28] mm/cma: introduce cma_intersects function
From: Frank van der Linden <fvdl@google.com>
To: akpm@linux-foundation.org, muchun.song@linux.dev, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Cc: yuzhao@google.com, usamaarif642@gmail.com, joao.m.martins@oracle.com, 
	roman.gushchin@linux.dev, Frank van der Linden <fvdl@google.com>, 
	Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, linux-s390@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Now that CMA areas can have multiple physical ranges,
code can't assume a CMA struct represents a base_pfn
plus a size, as returned from cma_get_base.

Most cases are ok though, since they all explicitly
refer to CMA areas that were created using existing
interfaces (cma_declare_contiguous_nid or
cma_init_reserved_mem), which guarantees they have just
one physical range.

An exception is the s390 code, which walks all CMA
ranges to see if they intersect with a range of memory
that is about to be hotremoved. So, in the future,
it might run in to multi-range areas. To keep this check
working, define a cma_intersects function. This just checks
if a physaddr range intersects any of the ranges.
Use it in the s390 check.

Cc: Heiko Carstens <hca@linux.ibm.com>
Cc: Vasily Gorbik <gor@linux.ibm.com>
Cc: Alexander Gordeev <agordeev@linux.ibm.com>
Cc: linux-s390@vger.kernel.org
Signed-off-by: Frank van der Linden <fvdl@google.com>
---
 arch/s390/mm/init.c | 13 +++++--------
 include/linux/cma.h |  1 +
 mm/cma.c            | 21 +++++++++++++++++++++
 3 files changed, 27 insertions(+), 8 deletions(-)

diff --git a/arch/s390/mm/init.c b/arch/s390/mm/init.c
index f2298f7a3f21..d88cb1c13f7d 100644
--- a/arch/s390/mm/init.c
+++ b/arch/s390/mm/init.c
@@ -239,16 +239,13 @@ struct s390_cma_mem_data {
 static int s390_cma_check_range(struct cma *cma, void *data)
 {
 	struct s390_cma_mem_data *mem_data;
-	unsigned long start, end;
 
 	mem_data = data;
-	start = cma_get_base(cma);
-	end = start + cma_get_size(cma);
-	if (end < mem_data->start)
-		return 0;
-	if (start >= mem_data->end)
-		return 0;
-	return -EBUSY;
+
+	if (cma_intersects(cma, mem_data->start, mem_data->end))
+		return -EBUSY;
+
+	return 0;
 }
 
 static int s390_cma_mem_notifier(struct notifier_block *nb,
diff --git a/include/linux/cma.h b/include/linux/cma.h
index 863427c27dc2..03d85c100dcc 100644
--- a/include/linux/cma.h
+++ b/include/linux/cma.h
@@ -53,6 +53,7 @@ extern bool cma_pages_valid(struct cma *cma, const struct page *pages, unsigned
 extern bool cma_release(struct cma *cma, const struct page *pages, unsigned long count);
 
 extern int cma_for_each_area(int (*it)(struct cma *cma, void *data), void *data);
+extern bool cma_intersects(struct cma *cma, unsigned long start, unsigned long end);
 
 extern void cma_reserve_pages_on_error(struct cma *cma);
 
diff --git a/mm/cma.c b/mm/cma.c
index c20255161642..1704d5be6a07 100644
--- a/mm/cma.c
+++ b/mm/cma.c
@@ -988,3 +988,24 @@ int cma_for_each_area(int (*it)(struct cma *cma, void *data), void *data)
 
 	return 0;
 }
+
+bool cma_intersects(struct cma *cma, unsigned long start, unsigned long end)
+{
+	int r;
+	struct cma_memrange *cmr;
+	unsigned long rstart, rend;
+
+	for (r = 0; r < cma->nranges; r++) {
+		cmr = &cma->ranges[r];
+
+		rstart = PFN_PHYS(cmr->base_pfn);
+		rend = PFN_PHYS(cmr->base_pfn + cmr->count);
+		if (end < rstart)
+			continue;
+		if (start >= rend)
+			continue;
+		return true;
+	}
+
+	return false;
+}
-- 
2.48.1.262.g85cc9f2d1e-goog

