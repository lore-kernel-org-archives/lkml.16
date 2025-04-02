Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54789205502
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 07:41:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743579682; cv=none; b=EbMzL3vbOG1Dl2Ap6bs/CJgzlVzG/B/qKsbRS9MlbnlK59rSewmGI+a3UH+K4h0EDxWcnC79J4vLC0YscrRmTc7AJQLrC+9RqdEvkUFcyp2CGZYfKmHT0yn8EYYHr1NBcaWbpZaPZFZOi3G+B4iUP1asBYNsFUBXtxcT7+crZAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743579682; c=relaxed/simple;
	bh=cbjW4XvTseA70wn+Uo1fUUwawm85B+R26v8UyoKvA0Q=;
	h=Mime-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=Lle9v0VOVOQ/A8jgNnrEgig/5C4WHjXZQsRsS9q6fJQj+wA4eprTgUQeZ72uIj7CpCNjSMVrpQT48xnk1VqLqcnUpp6VMcAhMrHBZo3KgzkAeP7Xmpw3OsSGBUZfcJvgpscUa6FfMyJOvn77duT6sNV4r5fKzsA6Cjukoyl2xRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=NhDBYqSx; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="NhDBYqSx"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3054ef26da3so3854456a91.3
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 00:41:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1743579677; x=1744184477; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=4i96T5V9k3vmZpu844wwAM9EtCVL0KJkJhUh5REbcPQ=;
        b=NhDBYqSx4aO6JZsua8Qxbm88YzvDII7mrRkinWtKEnzOyeoi6ZruKkcEyaJ3bkgJlH
         ZUOPkPhAMM8MhogAl9l9WtXMfNotUztI+UkaINd0l9vuHu9r5pBJxS/FF8pGhEr5qjK+
         //R73Rtkj1/OBQ7qBjGS6EQSLjt8RRXBW/745OqlGfaqGTs+df1djYWrSjnZM3D7ZqIj
         8rAZvfPYu/yRDn3GAEeqkDprNtirxvhDyyvbiq1xveGbyzszEjHD77E11xAj8rNckvlC
         i7QPueEcVzoBZ1u5ceveq6bnOrnRqFoE0/qsyuL35Mo9yAi4q+gI2XdJhP6Pz10U7c6n
         34kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743579677; x=1744184477;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4i96T5V9k3vmZpu844wwAM9EtCVL0KJkJhUh5REbcPQ=;
        b=dMb1vmSn4o/VFwazGqF0hOAj+nOkkCmANBqshEpAJYk3e7xA1DV0YhirhGYGuG4CiI
         eowQOXmzoaI8pr7iSQ74OChx9EyoK6iLfpKaUDb3RLrA60E9YNNczN5eZmlOzveERJK4
         AFStiIppLFfMg3lHp4//6yxLpBq0l/NlJ9DyOXElO2ndmIn7+d5BNgO1f3YtZLZtYnMj
         lcg/lND7btucdCftyON1/iCFyHxnWdzodrO7vn3Kjtmn0QBPNDX6MCIFbhU1AUFkMpyu
         w4r1NyQ6UhVhr48oRoOw8qGbkhbqfRxmCV0oFbrz9eFO+gnJ8P77yOg0hwhvWV3a0V0h
         bu5A==
X-Forwarded-Encrypted: i=1; AJvYcCUV4SrmY3Kd2vmgNt4cdHdXdPck0ChHsSHcqOecGh42rPNVx7A+q8pDO/bDwDCkQlr6EWN+hDv7vrMuRvE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyb0RDO+OhPC/qS1I/YywHUqoM5oS39xwu1ksPSEuI+Z0oK99ID
	M4BivNcw+04SZnAPd5BOxO9sdU84gSVUCunYKK/vEjZwilT3rlOHLcKQkLSf5dVot0yP9txSu6f
	feH5I2llUdkzOggtxD1VvLkbrf6+6kTkToJlLeQ==
X-Gm-Gg: ASbGncsGTwof4oFXzA/iyTqj9qmifmpE6ZNqkKCjn1gmxnDXagq6KnGDXwJJYa4FYwB
	Ksyh1Sqa5+RkauAqELtCthORbmIZqA9Vj8cTL4iZFkaEGgdzFWr84ZqpNXP4QP7MMjOVSgxef0D
	OEzphlF/pXo7/xtBuYQOqzAdImrXeN
X-Google-Smtp-Source: AGHT+IGm9Y961h45rVaXB5V314Bn0z+G+3R2yIWCaHEVb/7THBOWkoIKipQJc2UaOxlfeUkCHApw8UKveBTn3FEuvh0=
X-Received: by 2002:a17:90b:51c3:b0:2fe:8a84:e033 with SMTP id
 98e67ed59e1d1-3056085c01cmr9342886a91.2.1743579677410; Wed, 02 Apr 2025
 00:41:17 -0700 (PDT)
Received: from 44278815321 named unknown by gmailapi.google.com with HTTPREST;
 Wed, 2 Apr 2025 03:41:16 -0400
Received: from 44278815321 named unknown by gmailapi.google.com with HTTPREST;
 Wed, 2 Apr 2025 03:41:16 -0400
X-Original-From: Songtang Liu <liusongtang@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.20.1
From: Songtang Liu <liusongtang@bytedance.com>
Date: Wed, 2 Apr 2025 03:41:16 -0400
X-Gm-Features: AQ5f1Jpq9pj52as74KFEAbnUi6bgkoodsPYmo63WpbfX_F6JJmM_VLu1PGhAMM0
Message-ID: <CAA=HWd1kn01ym8YuVFuAqK2Ggq3itEGkqX8T6eCXs_C7tiv-Jw@mail.gmail.com>
Subject: [PATCH] mm: page_alloc: Remove redundant READ_ONCE
To: akpm@linux-foundation.org, ying.huang@linux.alibaba.com
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	zhengqi.arch@bytedance.com, songmuchun@bytedance.com, 
	Songtang Liu <liusongtang@bytedance.com>
Content-Type: text/plain; charset="UTF-8"

In the current code, batch is a local variable, and it cannot be
concurrently modified. It's unnecessary to use READ_ONCE here,
so remove it.

Fixes: 51a755c56dc0 ("mm: tune PCP high automatically")
Signed-off-by: Songtang Liu <liusongtang@bytedance.com>
---
 mm/page_alloc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index e3ea5bf5c459..6edc6e57d4f8 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -2661,7 +2661,7 @@ static void free_frozen_page_commit(struct zone *zone,
 		free_high = (pcp->free_count >= batch &&
 			     (pcp->flags & PCPF_PREV_FREE_HIGH_ORDER) &&
 			     (!(pcp->flags & PCPF_FREE_HIGH_BATCH) ||
-			      pcp->count >= READ_ONCE(batch)));
+			      pcp->count >= batch));
 		pcp->flags |= PCPF_PREV_FREE_HIGH_ORDER;
 	} else if (pcp->flags & PCPF_PREV_FREE_HIGH_ORDER) {
 		pcp->flags &= ~PCPF_PREV_FREE_HIGH_ORDER;
-- 
2.20.1
