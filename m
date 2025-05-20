Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F3A620328
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 12:26:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747743975; cv=none; b=NPhhf40pz0v46HrIA1W5S+98iYG0cdtEwQ3ItJVSSiYr+N7Zo16sOG+cINRQXqxkBUv3qbdmgkA0Le7YCpbpp0QKgwMtWPgmCs2DRjXwOr9KKWkzGKc92fUABkAqtjggX8nB6njWBqJsvHd8WdB1sLuFBvwpg7W08jK9ZN/U1C0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747743975; c=relaxed/simple;
	bh=E99b+O1AU7Ok1H7iVjTy2Cw4tgSWKFd62aJJ56SCAhA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nHLwo9VRAAsvEKSdFNRuhnTcBT6DQFHeWBBEv50WRLRQeHkhcsTurtJLWVWV2Uud9qzNqckaDEbrwfQG3GFfEvtghJEXt4g8tBd2+gQrkw4F7kkHxdfo5OAJl2jSZlJqzhhzITZ9xE5WTf/OvUF62JEuZmdNAErXyNcqHsa3Wbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aqks2Wnq; arc=none smtp.client-ip=209.85.210.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aqks2Wnq"
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-731e277a6b0so5246385a34.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 05:26:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747743972; x=1748348772; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eDPheIrp0fqErLgYkpz9GaxvmJrQjKvco7dUB64QMfw=;
        b=aqks2WnqSA2vk5KkrOn25xPF+MbwMrOhYBq4OmhNT9u5VZ8njPbUSL2sFFQTrhLWrA
         JARjZ0+NlxwO/etSAwGoeBY13HCMwibLaCNPsu85DFT7V5fpgeK1FJHzVKmuY4KpXFEG
         nic9yTwHCdXActW8oSpQJyHZFfU9uxjJcGqelTmfvJT5WmnMZp/szz9yDtpkJtITICs3
         vmx75deH3OoVLl4MolG6fuplkP0nWGZQvwnQdSynk+9e6//EzP128QieQqxD2VfHSQYp
         ziOSCzH3euGCNp3J4v8su1ojErVmxBqwJRKX2Ip7Eiy0MzzDK4b6HiQ0yuSCVUZ1c3KR
         7CBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747743972; x=1748348772;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eDPheIrp0fqErLgYkpz9GaxvmJrQjKvco7dUB64QMfw=;
        b=YZLplwR5NwVblQ+hr5UFUSphZVU6LKQDLXtm0tcVitvkhG1f/8rNhW1KEozDxgUBSD
         dFC4vB+kxssQo6/ruYx3pqdJ+WK/fSoAnpuLNgU9MDL2jIaphXpPJq11pvbhHBvgS6/K
         vdRAiNqlMWqiXYMYwCvd9jjcvkr7aa9Uk1UFSPUixhtt90pPeQ8VAUNFGCTzHfL3DDNX
         LYo9MEbbqjeciQBCf2bAiDE9zhJPtjDkInyGup0eMJf13y+8xQk266XFEOeQjsjlo8C6
         +UGTjpZcEgNOkkn6XNAwWRihWr/9scZfg40MfmYbzQltU+xgEBRQrUsemR6ekzzUpW7M
         54Sw==
X-Forwarded-Encrypted: i=1; AJvYcCWtaMr5ty2VL+zjtwmsAaqT/d0IfchN5ZkoV+KrVc546iZb8gLNBqWkBFnRR0C1PiTKi20QTDrU78f8Gcc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwkNK8nPqoIW45TlXJNyibhsvPclXPZ1Zcw1FZfzmRsdJ4WF/+q
	r+KqKEGv9jbIwGoMUwCL7Tvx1SlpFFQRdfhAXy7QuIfP0fUY9vQALsjME6CiuaFG
X-Gm-Gg: ASbGncvfbQ2RxZACoxMJNVgFOaluc03GsZYFtSFxJpY522bivBkRjgr8NArOXUag7G0
	4451RsmRyZUjDgmbyvWuTP1xQfUx39OVHdKdlVwmQG7EaxqSbXPqxH+suiF5fcWSJXhuuNGb4Gf
	yYFxPTEgap8fciYyDYVELl4h/np4nstP59oSB67RyYqYWwpwJCV4MQKXEUzVQqRfAjTmbF50rCI
	jD2ZkR5wB46M8DRWpTR/2YN6GbmuJFeaqJT/rK2gdS9onFf0hGADyFZkRRzG4YiWizQwpN6k7bt
	ToYONwfdE2IEA8/JNTjvw7XNEgb75Y0KENanRnbJdgnGE3as
X-Google-Smtp-Source: AGHT+IFUOHS9yLvKj9NZ9wKJYyBAWKUVRFOj4PSguUJ46Iyb32cjwBy2K5MN3bwdmiZOdBi4VX/MEA==
X-Received: by 2002:a05:620a:2955:b0:7c7:93c7:f35d with SMTP id af79cd13be357-7cd4673c076mr2297280785a.31.1747743962173;
        Tue, 20 May 2025 05:26:02 -0700 (PDT)
Received: from localhost ([2a03:2880:20ff:3::])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7cd467d7ee8sm731753385a.26.2025.05.20.05.26.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 05:26:01 -0700 (PDT)
From: Usama Arif <usamaarif642@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	surenb@google.com
Cc: hannes@cmpxchg.org,
	shakeel.butt@linux.dev,
	vlad.wing@gmail.com,
	linux-mm@kvack.org,
	kent.overstreet@linux.dev,
	linux-kernel@vger.kernel.org,
	kernel-team@meta.com,
	Usama Arif <usamaarif642@gmail.com>
Subject: [PATCH 1/2] mm: slub: allocate slab object extensions non-contiguously
Date: Tue, 20 May 2025 13:25:46 +0100
Message-ID: <20250520122547.1317050-1-usamaarif642@gmail.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When memory allocation profiling is running on memory bound services,
allocations greater than order 0 for slab object extensions can fail,
for e.g. zs_handle zswap slab which will be 512 objsperslab x 16 bytes
per slabobj_ext (order 1 allocation). Use kvcalloc to improve chances
of the allocation being successful.

Signed-off-by: Usama Arif <usamaarif642@gmail.com>
Reported-by: Vlad Poenaru <vlad.wing@gmail.com>
Closes: https://lore.kernel.org/all/17fab2d6-5a74-4573-bcc3-b75951508f0a@gmail.com/
---
 mm/slub.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/slub.c b/mm/slub.c
index dc9e729e1d26..bf43c403ead2 100644
--- a/mm/slub.c
+++ b/mm/slub.c
@@ -1989,7 +1989,7 @@ int alloc_slab_obj_exts(struct slab *slab, struct kmem_cache *s,
 	gfp &= ~OBJCGS_CLEAR_MASK;
 	/* Prevent recursive extension vector allocation */
 	gfp |= __GFP_NO_OBJ_EXT;
-	vec = kcalloc_node(objects, sizeof(struct slabobj_ext), gfp,
+	vec = kvcalloc_node(objects, sizeof(struct slabobj_ext), gfp,
 			   slab_nid(slab));
 	if (!vec) {
 		/* Mark vectors which failed to allocate */
-- 
2.47.1

