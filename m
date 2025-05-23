Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 988F629710B
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 16:52:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748019168; cv=none; b=MaCXuc9bfOxVXVIA1crvmUu95/dSPZ32460Xep7w2TXLIvVAu+9XYi2IWGsJuOTNIfg6Cpu73vulvXKofrjglMuIkii5tNzEsjXLq82Sh+u20GzxELZxh4iguHlAwLElDy0sa0qC392UKnU3NgDuCVX08BPBewKPuN2S7QKdZ8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748019168; c=relaxed/simple;
	bh=2fo7ThapmD/76BpPRYf8B2ESgW4zOXpH/qv5wsArI4M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LDvBXwTOSRkjzc/DEz2aqIZngshuWavTcG/HWG/T1nDkZAvbqlyW6hF8JBYuxz5FnN26ZeuipUqVipyjJ1PmsTUjj97B9jrf5oKHHXrJK1EUPg7af45UFrDaWU0VpGmzM02pRXVPgwU2UcPU0+XZWpyRdIWzx2gHhtU+Htz0zbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YAIdLVq/; arc=none smtp.client-ip=209.85.219.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YAIdLVq/"
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-6f8b9c72045so602766d6.1
        for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 09:52:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748019165; x=1748623965; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lnOScSnE/yXdZeUwx1aaQHUueDdq5UuSPkXF2iQZTL8=;
        b=YAIdLVq/Y7tk65u0iyxl71+QU+z5emXEaaGiIdOKVG56neq/1isrkIIkQ88DvKaR1g
         j5Y7QQYVHOPuC4iwHy/eAfmVPtt4wCtwE4PJ9XQM2C0eo8h6Wabf2KjmZPG6kdOmD+hN
         Q4eh7TFttjuvH2JWBFvJbV1o7nidQSkfRdt8OrM+wD7Lc7/uPzv84pvHA7WJJCzGkU96
         Way2GhlDwhUY1ZvImSKxzKnZTuE5t5LoczWs2GFAlLLJJ8v3E4m7dWElr4r0eg6wAP6M
         AIJrpsr8CRvT5D7CfJvEV84wWuPhC1LsLsS5fEdov9v/oTCFZEqqepkg0L23YS8UMbUP
         /5Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748019165; x=1748623965;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lnOScSnE/yXdZeUwx1aaQHUueDdq5UuSPkXF2iQZTL8=;
        b=BUfE5FaRqC4M3chzS59gCUTfOrbYS8rt1TT/Oj+vpiov0U7v+KuS1LM5x8cFNxc3tv
         Z0Rzw4X+ubFIgvc9elN+ImFUU99jN9lOELsSdYyOJS1bxYVrceiwwYoEh6RMy/9T5Vvh
         XloLtTmXmQKKjURp1jlrTfpgEHEEJ/bS6itIXjEvcRoZ9dihIn815coQ4MzAl0fYgTJb
         bkJrVQLNOZZNeGEh9pz8aDg6SG6j4YZUAwKwijsdiUkKmL3VRWOWjlycCWXEH00e6zpU
         aZU7p73ZcTJzNvsyi0BppVELIaMA4LINfL+b3h7pc6F8XUWitmoZGE/qbTJAYj5YocP9
         GhsQ==
X-Forwarded-Encrypted: i=1; AJvYcCWcmsLfZlk4w+vhunP4mXpd1ylH7XL7kTCl15TN2V+OyFl+FlQ2ZbjiOWPzNFWrUBifMkPY9HrQbfPe52k=@vger.kernel.org
X-Gm-Message-State: AOJu0YwmIQs2UA7euAVQsN96v23M8568MkzotwtXb/aPeK3L81DqLTSF
	9QyJv98jaxCDAi35yQnDRNNlEKC0mkJpFXgj+rNHhJ6YWmA278Q/W9PG
X-Gm-Gg: ASbGncvzV81eeK2oMp3z3Eeisej8AKleDzQWvAGSmBY0p+/ZPniFYAejbpAR+Vve4q4
	6xqVAXQBEpOJiFHWtw41KOsmLVicQMa1Iqb40NTfIc/bCAbUYfq2c0SwX3pMuFVpENmB3cxx542
	4xgZT8kNuA2AzdMIudpHq5387yWQW1gN38DVLxEOQyyZAZVszqV1Fr3qV861wn1deowkwWdKPCI
	ULIutspXwCkbWBlYColbFmP2AaFfqPcnDQ82schv+Bj5r1/hMbDEHoHzewLmV284cKb3J+HCGPo
	3mFItxSNR/EixWQRD8kQzkFBCXAB+x1lqjC3Abg1Bb4jNwyd
X-Google-Smtp-Source: AGHT+IHWry3SN2Ct3SZFespp1702g6E+CCGpeSKQhfGWaRCN/eduukpNy6BuDU6Mhmu8IL0WGc98+g==
X-Received: by 2002:a05:6214:5196:b0:6f4:f621:bc with SMTP id 6a1803df08f44-6fa9d2a28c8mr3253006d6.33.1748019165146;
        Fri, 23 May 2025 09:52:45 -0700 (PDT)
Received: from localhost ([2a03:2880:20ff:8::])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f8b0965823sm116908236d6.88.2025.05.23.09.52.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 09:52:44 -0700 (PDT)
From: Usama Arif <usamaarif642@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	surenb@google.com
Cc: hannes@cmpxchg.org,
	shakeel.butt@linux.dev,
	vlad.wing@gmail.com,
	linux-mm@kvack.org,
	kent.overstreet@linux.dev,
	cl@gentwo.org,
	rientjes@google.com,
	vbabka@suse.cz,
	roman.gushchin@linux.dev,
	harry.yoo@oracle.com,
	linux-kernel@vger.kernel.org,
	kernel-team@meta.com,
	Usama Arif <usamaarif642@gmail.com>
Subject: [PATCH v3] mm: slub: only warn once when allocating slab obj extensions fails
Date: Fri, 23 May 2025 17:52:40 +0100
Message-ID: <20250523165240.1477006-1-usamaarif642@gmail.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In memory bound systems, a large number of warnings for failing this
allocation repeatedly may mask any real issues in the system
during memory pressure being reported in dmesg. Change this to
warning only once.

Signed-off-by: Usama Arif <usamaarif642@gmail.com>
Reported-by: Vlad Poenaru <vlad.wing@gmail.com>
Closes: https://lore.kernel.org/all/17fab2d6-5a74-4573-bcc3-b75951508f0a@gmail.com/
---
v2 -> v3:
- Put warning back, but only warn once with pr_warn_once.
v1 -> v2:
- remove the warning completely. We will have a way in the
  future to indicate that the mem alloc profile is inaccurate.
---
 mm/slub.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/mm/slub.c b/mm/slub.c
index dc9e729e1d26..36d7c43a6f2a 100644
--- a/mm/slub.c
+++ b/mm/slub.c
@@ -2102,10 +2102,12 @@ prepare_slab_obj_exts_hook(struct kmem_cache *s, gfp_t flags, void *p)
 
 	slab = virt_to_slab(p);
 	if (!slab_obj_exts(slab) &&
-	    WARN(alloc_slab_obj_exts(slab, s, flags, false),
-		 "%s, %s: Failed to create slab extension vector!\n",
-		 __func__, s->name))
+	    alloc_slab_obj_exts(slab, s, flags, false)) {
+		pr_warn_once("%s, %s: Failed to create slab extension vector!\n",
+			__func__, s->name);
 		return NULL;
+	}
+
 
 	return slab_obj_exts(slab) + obj_to_index(s, slab, p);
 }
-- 
2.47.1

