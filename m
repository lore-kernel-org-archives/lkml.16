Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8F781EA6F
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 00:13:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749600810; cv=none; b=uS2+74yuMjT5zQ8qMBHp0jKUMguoAlXLTs29SpDA79UGos2FLFk144SfVX8qfy96h4nkm2kQE6zrdJYwz0kTP7yO/woEY7xGlWCI/n0PA+efV4ozYhoTzVOcPOTY4wtI1xLxcNp3NNLVNeBsFboYT+oZRsciBUrkUpwKodnBIgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749600810; c=relaxed/simple;
	bh=Tk59bj12fvUycun5eL5ZOvoI4KgbJQNjrO0owh/QZQY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BZwSb0NEUpG2Nd3zxfPIrGRor2Te+Oms2QLWdmCLe3YPC9GzvGo3D3Q08CORRUi9FH8bekWoooBo2ZWgRr6wYfc2hxqzYTRW28MWvYq1SJlGD6XRgSmA1ecE6Ve/4ZTcl/h+0r/yYnTXvyHp5i5CFXGdQoCX019WXpSbFgrBCPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b4Dv6RJ9; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b4Dv6RJ9"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-234f17910d8so58911995ad.3
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 17:13:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749600808; x=1750205608; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VX97V5WXBlpRMsHKR0FvbYTfWMju4JMBW7YXcZZ9+1g=;
        b=b4Dv6RJ9e72Qu8jgGrd4DicMRkFmKcSm8j6xBEYsnjLHzpa47P2oaP/mv9pPrlL52x
         xcTM9utB+etpD27a0gC15efVCImeloJOdPxaS+Oe5HEuENBikITAWDgOBFpkhKN+fb3F
         21QwoThAxVB7BjlT0t3J1QdLFcpkXmCzZoKayyy5vYI6tmQC6fLNDjiyCewY0jYu+J+N
         H7IXs3pSOqmnmZFhr16mXM/l6qMu6OQN4/jYQLHOrq2TQf/6BUfemhiwemacRNqI44wN
         elLAwZ3K7b8O61wzDvZ0lv3YUCEQ4xivYV2yDOEuOXNBV71LX0ACHGf1ZvJY/9cYROBj
         /YeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749600808; x=1750205608;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VX97V5WXBlpRMsHKR0FvbYTfWMju4JMBW7YXcZZ9+1g=;
        b=fbFp9p80bjR5w1fmNIdz9i6aH7xYEy7EpbN9XfKIAsnqYEay93BpRzrr0Vge2b8X4e
         n+ILZx0TzjcHyjlvw9+rAGZOAGSYA0MEnkO3Qg/bVKNN04wPYfuPTIPhFl0MLK20Aeh3
         PDF/4HDOfBkIj0vPMQAOWImLHNHEPG1IrgW/yPn14Ku41dgh/kQeuinsQi0cVbhK2vjL
         NTzztFvYue80rzcPipst7/FmnlDuriDcXOaQv/Yvgq8rioaVtzx79oTRCykv+LC8uCrK
         +J1T4EEM+oTuV9wkaxcf6PGyJTmYM/R1UgbUvKsC/VoIwV1oz75ZFpq6mpt+1TMq9wlx
         kVxA==
X-Forwarded-Encrypted: i=1; AJvYcCX+e4XZBWJGy485Ctk+gsjSt2v3QuF3W71rZc6GGyb+4fzQnUJ2vyDdsOZco1pMj+BubadkEgt+5Gl02IA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwIXzmK8nGxDl3KsewFvBKlmFS8EGZfLEcAe/dp+LHVh4+ZgenU
	jrnCKlaHDLwMXa71p89pqgf7f/zD0W3Z/Ck3GP1K6hw4ih+mxk0klpuCut2/j91A
X-Gm-Gg: ASbGncutgOocSjYh7XN6RaXH0Qy5Xx9hv3FAwY/ZzO1Hm/9W7ZSj80irC2TTt1dptC7
	seXTqrWpoRZ3YA+yI2sz5i2yQnaU4wRsumpW8ninTloKkyx73wyyc/2QCcOMR+D/OkfYRBLn4EN
	GAok73+DA2KjPnlqSDqztTSLREc9yNbVeCCsey0gu89UP+H8ksh/T3I5J3spekCgHCwUia99mqJ
	+cyAIhMspK7ZPhis9RGxK3eKYAZPZJPwTVtSZdO4us+Sodu1TAdZZQ7mAtml/1Vfjy5Dbi6saqI
	/tekAxWN2PXv0W3qw2Ihka9j2pc8cnHjbzF581U6Y5j7arUDWXc8uAwoR9kKOMpZG+NbiEOso3Q
	a+m2fOrzhdk9mlASoUPSS
X-Google-Smtp-Source: AGHT+IFxydpYDFIY1qglfk1WxXOf2v7Y+C0/riV5WM3uO8rPBNEhREzF/OowZ0R+dvwLCexdOMD+Tw==
X-Received: by 2002:a17:903:11cc:b0:235:2e0:aa9 with SMTP id d9443c01a7336-2364261fa0emr9590815ad.14.1749600807959;
        Tue, 10 Jun 2025 17:13:27 -0700 (PDT)
Received: from fedora.. (c-67-164-59-41.hsd1.ca.comcast.net. [67.164.59.41])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-313b2137b77sm161367a91.34.2025.06.10.17.13.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 17:13:27 -0700 (PDT)
From: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org,
	linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	"Vishal Moola (Oracle)" <vishal.moola@gmail.com>
Subject: [PATCH 4/4] m68k: mm: Convert pointer table macros to use ptdescs
Date: Tue, 10 Jun 2025 17:12:55 -0700
Message-ID: <20250611001255.527952-5-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250611001255.527952-1-vishal.moola@gmail.com>
References: <20250611001255.527952-1-vishal.moola@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Motorola uses its pointer tables for page tables, so its macros should be
using struct ptdesc, not struct page. This removes a user of page->lru.

Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
---
 arch/m68k/mm/motorola.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/arch/m68k/mm/motorola.c b/arch/m68k/mm/motorola.c
index 9bd79f42abd5..492e34dc45e6 100644
--- a/arch/m68k/mm/motorola.c
+++ b/arch/m68k/mm/motorola.c
@@ -92,7 +92,7 @@ void mmu_page_dtor(void *page)
 }
 
 /* ++andreas: {get,free}_pointer_table rewritten to use unused fields from
-   struct page instead of separately kmalloced struct.  Stolen from
+   struct ptdesc instead of separately kmalloced struct.  Stolen from
    arch/sparc/mm/srmmu.c ... */
 
 typedef struct list_head ptable_desc;
@@ -103,8 +103,7 @@ static struct list_head ptable_list[3] = {
 	LIST_HEAD_INIT(ptable_list[2]),
 };
 
-#define PD_PTABLE(page) ((ptable_desc *)&(virt_to_page((void *)(page))->lru))
-#define PD_PAGE(ptable) (list_entry(ptable, struct page, lru))
+#define PD_PTABLE(ptdesc) ((ptable_desc *)&(virt_to_ptdesc((void *)(ptdesc))->pt_list))
 #define PD_PTDESC(ptable) (list_entry(ptable, struct ptdesc, pt_list))
 #define PD_MARKBITS(dp) (*(unsigned int *)&PD_PTDESC(dp)->pt_index)
 
-- 
2.49.0

