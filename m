Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BD5078F5D
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 15:25:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751642743; cv=none; b=gCa6v569vOUybeij264izqZM5TKkKVzZk+N3SrG1iKuAlBlG08KSRCu6Cr1zZPdEzMqnV1ecbC7wTch6ig4M/134KfOY2qQJYj9kl8k/D6eaatbP/mc3P0c20Nu7edrx0lZ2RDIiL+VSfsu7+QWMXs/jkGDxGZdgaXnm28hxL0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751642743; c=relaxed/simple;
	bh=vVn/Hp4/IQZ8McWBavORM0Lve3vej0D8t4I3uI74Do4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=l6hx6YakMdgvnrolyQKX39KqO0Ws1R1rrdp2w65h3wAfGZLUDYGmJMWTcwBrm1gXZglw8tAgoxN2Kqv1vx1A5ZrUhpN513YuEb/1BsSlXrIDTD73I9Xh0yUwJmtUfzi/+lQ/+iLOezVr3JPMjnvSQU+mIbOnHipNCkwlzz4F/wk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R2B0S6EX; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R2B0S6EX"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-553dceb342fso1104985e87.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Jul 2025 08:25:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751642739; x=1752247539; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nNzVkgal/hud1TevC2XxHRKgzRdyc1tLSbBrI5duNP4=;
        b=R2B0S6EXRz4HVJJYhS61sbMY7Alzyvk7MPYToegVg5ugAY71MEbByPG0DIjI1d3mgA
         f0Va32i3hnbGNJSCnlFAqeesC4OB4DmXyZg+2H0PKyw4oI+DalFFZF2/OytifdynHlCk
         IoWD9ym+xfqoyCJUgiWLD+MY5Hy9l1HjVoHtVwclP7n3FSpD6GmyZia6VnbZuNAC+Kb6
         JoTGiyxgbegLG5Y+4Wrkvg5c0rfoy6CEVqJoeBlXX5+do8q8ZkI3IccMzqt0fpb+5xkB
         CKc8GKW84yzm4kXNIkuNlhIpC6x7xZ+QsKWArCMib4Hk1dliS4y+WbCu+6YMbxmNuXZr
         L7hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751642739; x=1752247539;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nNzVkgal/hud1TevC2XxHRKgzRdyc1tLSbBrI5duNP4=;
        b=lEMc/tc4kPipg1Xcbx5+aJqWV4AtNcejRB1xNAhjpw34rP7kHV3qyOEfX0sOtrDGP6
         0eNaOqoBy2uOoMlDfVoWwQtS/yWa1I0/7mw8mUiCRMiqYCRYaaLyUzLUh8jBfKWWuDMV
         FqcrIOtDuBFtUw4z060vhlF4v1tbJ7KC30/7APdzHDhLbVWdX5tkhsvOhwE1uHDHqmHM
         yuYkk2640uDBcerevM/kq9O9mAS/I0kmeztG+MetBaWagqYjqYXZOgPDWAasc7jp5S93
         19M4G7922NognGvfWw8+/9TvNrKY7W2RiOHSryXPLHq3fFYn2PZSMXLdZfBTwBCuX2DF
         1fxA==
X-Forwarded-Encrypted: i=1; AJvYcCXfdXZ1S/VhoGohSIWSXZBl71UuY9KBXcFLK1gGlZxIubNxO2lpZwi4nP5m7ELipzYmQjhJgNLibSac8Yk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxU6cMO9LGg0qYSJwFiw2XZWlMlbT7FWCNrZvGqVeEB6GaurXyl
	4R5Lz6R/7dTIZOJFwbJeU2XAGmr0wasn16OvdV868I1aVXTFvvblHbOt
X-Gm-Gg: ASbGnctb+E4ATs9eGTCGyAaRwLxaPO1kbjD2e1d9Jd0i9ILTY5tNx7PRQhqW+LByeoq
	4E/An+005APN8qSnEO8GpRwYvncBPDf4pjXNRPZnntUvW6nED+KxbFNBaknSMVYvg4r55OquLGK
	soedVeGYTAk8gEHqV3vDVDsZ6ii6/DSDzjkJuzV/F1qW3BBg3Q4Z8U7oG1KLjon8G8cxLrUikC+
	NOABlyu69osRNljaWTkCv4MXaySMF4qu932BkRLyOlG55B93h23eyKJ85FlrMvAVSACs88odmeL
	5/OwYXW7Itp+s1tRcFTMdZCyxCbfeInI5bJrg7y/CCOxxtAWbqmU3FLMUsUwsDAoyMBX
X-Google-Smtp-Source: AGHT+IFyqlS3XwUEofns+iepD0qC/f9e1YeFjK5MoXU0+BuUCc1OyJ8GdeEVZi1FkBvldruB0hcJiA==
X-Received: by 2002:a05:6512:3094:b0:553:ad9b:cfb1 with SMTP id 2adb3069b0e04-556dc26557amr1051332e87.9.1751642739158;
        Fri, 04 Jul 2025 08:25:39 -0700 (PDT)
Received: from pc638.lan ([2001:9b1:d5a0:a500:2d8:61ff:fec9:d743])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-556383bb113sm281028e87.11.2025.07.04.08.25.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 08:25:38 -0700 (PDT)
From: "Uladzislau Rezki (Sony)" <urezki@gmail.com>
To: linux-mm@kvack.org,
	Andrew Morton <akpm@linux-foundation.org>
Cc: Michal Hocko <mhocko@kernel.org>,
	LKML <linux-kernel@vger.kernel.org>,
	Baoquan He <bhe@redhat.com>,
	Uladzislau Rezki <urezki@gmail.com>
Subject: [RFC 0/7] vmallloc and non-blocking GFPs
Date: Fri,  4 Jul 2025 17:25:30 +0200
Message-Id: <20250704152537.55724-1-urezki@gmail.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is a small series tends to support non-blocking GFP flags
such as GFP_ATOMIC or GFP_NOWAIT. This is a draft version and
it should be improved or changed.

For example there are still hard-coded GFP flags in the:
    kmsan_vmap_pages_range_noflush(addr, end, prot, pages, page_shift);

if the kernel is build with KMSAN support. There are other parts which
should be fixed. But i tested this series with a fresh non-block-alloc
test together with CONFIG_DEBUG_ATOMIC_SLEEP=y to track sleep in atomic
issues.

Based on:

VERSION = 6
PATCHLEVEL = 16
SUBLEVEL = 0
EXTRAVERSION = -rc1

Uladzislau Rezki (Sony) (7):
  lib/test_vmalloc: Add non-block-alloc-test case
  mm/vmalloc: Support non-blocking GFP flags in alloc_vmap_area()
  mm/vmalloc: Avoid cond_resched() when blocking is not permitted
  mm/kasan, mm/vmalloc: Respect GFP flags in kasan_populate_vmalloc()
  mm/vmalloc: Defer freeing partly initialized vm_struct
  mm/vmalloc: Support non-blocking GFP flags in __vmalloc_area_node()
  mm: Drop __GFP_DIRECT_RECLAIM flag if PF_MEMALLOC is set

 include/linux/kasan.h    |  6 +--
 include/linux/sched/mm.h |  7 ++-
 lib/test_vmalloc.c       | 27 ++++++++++++
 mm/kasan/shadow.c        | 22 +++++++---
 mm/vmalloc.c             | 93 +++++++++++++++++++++++++++++++++-------
 5 files changed, 129 insertions(+), 26 deletions(-)

-- 
2.39.5

