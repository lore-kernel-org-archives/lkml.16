Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 544CF28682
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 14:25:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747837533; cv=none; b=Os+JSve9KJ+tV8Ah+B0KqhdDrLo3hK3vRt4pB4NhpdZ5g01ml2u9P4kO620uw0diVBPEJBRMc7KkL0wEBZkkmT90tvG0/IW6rzyvDET7SHWP+TQDkhg/vUW3n6fEa6vfU97RyIEWOtWLz7lFn1VTZoWz4qQctXP4ixiMrT05wPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747837533; c=relaxed/simple;
	bh=mzjzwYXMnl0Y9sPCYNk++GhXlXikWDBHEDBD+zWzPnk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hKUIqR0gXeO19F31jyfwS3J8Xb0qDxJ3jySXkRA+iqyHyQDEq0Nel7tScAgOP3bHAfJUoJW6Ev9LyflOuhJLVSWfjZMeZUyGEkccXxo0+vEXWZhwC+ACyoq6sMvaMmUhdVHZo/iBZxsSBU31dd3GUPx2TMaY57SI59dx+mzG/q8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NDkWqCGh; arc=none smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NDkWqCGh"
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-47692b9d059so94913151cf.3
        for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 07:25:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747837531; x=1748442331; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bTV+0yNwT2AirgQziM0cVofsthdmprW68m/JVhQEzJw=;
        b=NDkWqCGhz0T64i67P9dEylwFdzcQ37Gs5KPMj6fls9fI13udygkLxucRY04gazJ0El
         TO1K1DU2luXmdkFZS5pa8z7XOXEkW/LLL8tlbyADFGcaVXHlMmNOXrwTypf0lOxt2Xt+
         jvLC5Jge8IPZzs5XE5fehlAL9g3eAv7jnfgHq8Ffsaugim4fU/M+QCqaE7zqWKX8u7B7
         G97fckrOgkxcLhNPaqI8YrZBLX+z7yBBh/rww1RgzcBmQDhkrxuQkFa+Q/jP8EgKnCM+
         Dle6wcP+U9p2wAaFKyw8Kwr2iIWx/Aqzgnk+XkzfPDunvmq6/PBcGnq1UtYQmIYOayGr
         T1eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747837531; x=1748442331;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bTV+0yNwT2AirgQziM0cVofsthdmprW68m/JVhQEzJw=;
        b=Hi2hMBqFChg11F4Ip1sdW2Ao4UEYAoFIv3HwDpAVtQqldd/yD4uZVhlt2220UV9WqY
         zfVsCIN3TYx4UMWh3XFRSLN7YfZ0Vs9/YNrm0g+ojdgrpUSlxnAmkvDDsNRPDUNCDHlc
         zLflwOGEKWnwbxvWQqZLOjAuBPgxprYW2IHX4AcKc0SjzlBJdXJzY4xv45szwUifzH7v
         0vsQxANxsa6/wr0urI53WIS17t7x6udlovLAqNiFvXeaHXcD07DCLAU7qZ/AFcjji0mi
         W55LiyWoO3bDp0T06mUqsM+WnqC9rQodO5Ar+DAWsDnDZsYhGJxcCh765wwJVhkfPuVZ
         V3iQ==
X-Forwarded-Encrypted: i=1; AJvYcCXQksmDydx+GC9bl/x+dqrLhMFbjK2LiJnXt75VnqjrIFjP/Qu2Q5hVvEh13f1qgg2vxpX9IXnZhViJT8U=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw47VOG0Q5b95xDg2Rf4ZidIY3gtH10ljJ3ukf2j0s2GUrqJ5ZQ
	s4fU5uad00LAmEVSYEriOCRcHkGNhcaU7Rm7mEzcCcR0h4idEOkrXqgD
X-Gm-Gg: ASbGncs65rXXv3Xr+hjplJjH9hex+uLzqHmarHIbSrU2iOLshECvcSjKXlFrdsi++9h
	pX6pR9b6kIitoL6ax34ydpVHma9JZs6JoKNQ0RZMe1LcLQPCn6oy3ZCbO7skboD8pWjWFmQaQLB
	OUUB8HjSrP1r1Y9hht7jRb0zQoPmaERwInFHFrrNsoqdlcKOyiG30b5b1Mmqu1av0qeiwQAX3LT
	q6LUZ/loy3Vg2xQ/p2DfKB302h5T6t5MKORRmLY/2Zhq1y0tYCW/C84nZ+7DZO40Wka18Au77WJ
	KCt8Q/0S9uqze4ZDw/KZb156PChko1/T8jjp9zLg1yZ6CUOqVaeZS4oxPbf/
X-Google-Smtp-Source: AGHT+IGJ0ff2P8PVMyFv7jR8lBEHrrx/8AzvYD2AyqGTlxL78Q+9oY84GVU7SAYIqbomBI8CnqDdLQ==
X-Received: by 2002:ac8:5ccd:0:b0:476:739a:5cf3 with SMTP id d75a77b69052e-494b074d0c6mr371222921cf.1.1747837531149;
        Wed, 21 May 2025 07:25:31 -0700 (PDT)
Received: from localhost ([2a03:2880:20ff:43::])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-494ae528f08sm84171971cf.72.2025.05.21.07.25.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 May 2025 07:25:30 -0700 (PDT)
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
Subject: [PATCH] mm: slub: do not warn when allocating slab obj extensions fails
Date: Wed, 21 May 2025 15:25:21 +0100
Message-ID: <20250521142521.3033264-1-usamaarif642@gmail.com>
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
during memory pressure being reported in dmesg. Failing this
allocation is not indicative of a bug, so remove the warning.

Signed-off-by: Usama Arif <usamaarif642@gmail.com>
Reported-by: Vlad Poenaru <vlad.wing@gmail.com>
Closes: https://lore.kernel.org/all/17fab2d6-5a74-4573-bcc3-b75951508f0a@gmail.com/
---
v1 -> v2:
- remove the warning completely. We will have a way in the
  future to indicate that the mem alloc profile is inaccurate.
---
 mm/slub.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/mm/slub.c b/mm/slub.c
index dc9e729e1d26..06ab9a558b73 100644
--- a/mm/slub.c
+++ b/mm/slub.c
@@ -2102,9 +2102,7 @@ prepare_slab_obj_exts_hook(struct kmem_cache *s, gfp_t flags, void *p)
 
 	slab = virt_to_slab(p);
 	if (!slab_obj_exts(slab) &&
-	    WARN(alloc_slab_obj_exts(slab, s, flags, false),
-		 "%s, %s: Failed to create slab extension vector!\n",
-		 __func__, s->name))
+	    alloc_slab_obj_exts(slab, s, flags, false))
 		return NULL;
 
 	return slab_obj_exts(slab) + obj_to_index(s, slab, p);
-- 
2.47.1

