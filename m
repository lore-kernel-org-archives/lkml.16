Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1202A3C2F
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 07:26:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749108388; cv=none; b=XyUyRF2Qrw+hGxwviJ7ziKBJUIRub8SwZPduJ8uaKN1YsWKB3DlymnA2/DQiA+qFXRhBX339byNbojRKJfA3RamxAPYF5D6xHMERpgE5/VE1TP52QoJktdgaAYGpH06mIh7BLSSsUii4CAp2MwcTMzqa6uRcJwy3N7Lo5D38EiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749108388; c=relaxed/simple;
	bh=9xrvICrpDcIHWeVdrgFrK4+xQS0l45GY74pTEXSgF64=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=TyBc/sWmoLPbjfMZoU+LDLatUc1XaMuWLDC+vxgWldZBVXfOzYl9SO6ZdpIepYEUFm0S3FasjxF6bG6nj0W0g55mym9+aC2nk/azD9XhEJFz23tTnUDfV2FJ5VxcisY3tjQi5IH+K3l1Ofw9RklZNKFXjT8v2jKurtDp4b+Te4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--richardycc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=BTzzxrCH; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--richardycc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="BTzzxrCH"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-311f4f2e6baso791427a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Jun 2025 00:26:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749108386; x=1749713186; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=2MokvGMwL09D0OLQ/6NaZYaKMAEKNW/33zg2UVKOKGo=;
        b=BTzzxrCHNdQaik4M3cWLyyPE83a92uu5VvhCT9A5+zn5wxnr48/rfM/JVkrLtTRmEp
         XKKNYCaDt6fHgW5hci4oAdrtdVICiXfMunMAN12JXPsP8QHDQ3m2yuaJcilQe5ANLi71
         O8kx3pMFwEgzx5I47kawRFj+3CEm7JUJS9Zvgw/NRLluODIGY08DIkKMcG/AsEBrLv53
         njeZwU86quVP0UvGRGvf0Ct2OE5rT5DqcmNWL76uJg7t6HDVV/X2H3tbiMEHB4Z/9HxG
         IQbYyzFf9624FStNolSBEwUjqR4XS93q+quihN6c4GlfLpHjivr8+SfjrfD5TMeC3NWy
         8V9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749108386; x=1749713186;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2MokvGMwL09D0OLQ/6NaZYaKMAEKNW/33zg2UVKOKGo=;
        b=gy8GGZR2oC9jFEtjM+eb5AtMInOSvodm91inLlx8cbhfqvv+QZUgZz58bnNIzD70FT
         mrDlpVS82CcR62fW5C6Z6xbF2Y/wr8S92TsBOSEbzW396YkhbhcAbnJD1CFPADAS5mtg
         8rHO7DusNcl44ECBrC7FTwwYIMVwvfMKgBjOQ6vdEHs+4C3aJZa0Ndrv35VqJwsuEWz4
         hiyMLG3HsN2oMi8gBQIuGHTcxwPB9maKow6zEjOQ8IwKKIyD6N3ZbYv5cTQe0P+NLcrk
         QkSu4nu3ArYgxe27X7pAnqiju4cNsY7qLOklLgBkJC/6OtOnHyJl9WjZOAg60PSKXouz
         RUCg==
X-Forwarded-Encrypted: i=1; AJvYcCUjsij/DGUjbDLZCnWj7raw2dNRl+kwocroy6LO3vhP61oJFstJL6MPPjvFFLszjoYFuCGwLplkj3q6qyQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1e2g87xSaB3Sos0qzOP8B2kBaHWaP8KTU8A6SQJqvNlC0cAKN
	cYoExsObnCC1QXh8MWJzuMGe3N6k6oieArO4AE63ypfDGvzbnqvlWYBVwCygm3TsLP52cZCT8NJ
	WY/4OJRQBCT3D/FAZKcbl
X-Google-Smtp-Source: AGHT+IF2n0LbFZQXSjnvyZophImJUxlZUuR9yUDzkXjumT0nr3vwiMVMLFdVGoc+QYTRS/ncdwqUf4qaLGjxkmAI
X-Received: from pjbnw10.prod.google.com ([2002:a17:90b:254a:b0:311:ff32:a85d])
 (user=richardycc job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:2fc6:b0:311:f2bd:dc23 with SMTP id 98e67ed59e1d1-3130cd2c617mr9320607a91.15.1749108386231;
 Thu, 05 Jun 2025 00:26:26 -0700 (PDT)
Date: Thu,  5 Jun 2025 07:25:32 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.50.0.rc0.604.gd4ff7b7c86-goog
Message-ID: <20250605072532.972081-1-richardycc@google.com>
Subject: [PATCH] mm/cma: pairing the trace_cma_alloc_start/finish
From: Richard Chang <richardycc@google.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Martin Liu <liumartin@google.com>, Minchan Kim <minchan@kernel.org>, 
	Kalesh Singh <kaleshsingh@google.com>, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	Richard Chang <richardycc@google.com>
Content-Type: text/plain; charset="UTF-8"

In the bad input validation cases, there is no
trace_cma_alloc_finish to match the trace_cma_alloc_start.
Move the trace_cma_alloc_start event after the validations.

Signed-off-by: Richard Chang <richardycc@google.com>
---
 mm/cma.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/mm/cma.c b/mm/cma.c
index 397567883a10..bd3772773736 100644
--- a/mm/cma.c
+++ b/mm/cma.c
@@ -854,8 +854,6 @@ static struct page *__cma_alloc(struct cma *cma, unsigned long count,
 	unsigned long i;
 	const char *name = cma ? cma->name : NULL;
 
-	trace_cma_alloc_start(name, count, align);
-
 	if (!cma || !cma->count)
 		return page;
 
@@ -865,6 +863,8 @@ static struct page *__cma_alloc(struct cma *cma, unsigned long count,
 	if (!count)
 		return page;
 
+	trace_cma_alloc_start(name, count, align);
+
 	for (r = 0; r < cma->nranges; r++) {
 		page = NULL;
 
-- 
2.50.0.rc0.604.gd4ff7b7c86-goog

