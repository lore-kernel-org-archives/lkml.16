Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE99D33E1
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 01:32:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748914326; cv=none; b=dMTkq6YnomTuAo3/qFgcIjm6lmJ9k8WTWcGAHvJlmbGfZcMrBMBcnh0+rjQzPJSppv18ndeQRF2lIPUQbmB4bHUzJreUmPGJCo3+9Xznywm4/dWHtt6TI5Q1HurUC/FpCRzKU/1YXY3irq/8i/+7wJk/khwyehtzN2FhfyvVONY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748914326; c=relaxed/simple;
	bh=vx5ERXTpWormRCzThtuojCvOJ1dhjcAtXpSbb6TVG4A=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=unulcdPB6AQ9pISTx67BMYmOVMyCsFqFaG8u7YfR4gXQWs/wcDb/5poWLB/k+EbpzBsbxE5xfJUHuhTiFa2yKLede/VZe70iyO30MVld9J46PDr3luaD/nHJ5hRlOBBUPsZyUKbCD9Fb6Ue+W3gC+9eqRlvkmSZWo2udZGWGbIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HB2QxOFh; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HB2QxOFh"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-7376dd56f8fso5823593b3a.2
        for <linux-kernel@vger.kernel.org>; Mon, 02 Jun 2025 18:32:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748914324; x=1749519124; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4Bojv3M+4ciWgsmcsFZ9XbWm7Qt7ckhMnQSLXNPu4AE=;
        b=HB2QxOFhy7wxpfb7xZLuzEvNA0rbZlvBkIusmKRp+DzVnLgd3RPZJE754N+kvKjA+g
         hFwm4DQCo4CRSLhHA4eLWuifxJWkInViIZMiVhEnxiz87ocezhbbfucvWAFyFmWDXUKu
         ROpfIpDgQolo4bQyXt9lSfM3dfZdKLzhN3J0Xgyj4hD4Yz0S5kb5tFCSxZiBWbWOL8+w
         UEWL58Y3//KowfhSFnbhVQXmtOt0m2oxoPhIZwIdg0g9tkTvilwnCplUMEAu0mLcc0oi
         szD7UNVyi8e8zUIILxqyAY/HALtD1psopd51mE2bTc+iZVVtTSKxacy5sxmQ9Xj5Jp4z
         AxWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748914324; x=1749519124;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4Bojv3M+4ciWgsmcsFZ9XbWm7Qt7ckhMnQSLXNPu4AE=;
        b=pUvsW6bandDIwCqz+r3dOFZQS0dtZWRYi2mDTKwD+Vkc4wmxWI2SNNaW874uGsbFTj
         9dIzE/qOd51Dm6ZDBsfxgzdXxacOFRHXlytSSIzMjOqHg5W6bzFJsBTdVON8feJqOCeD
         xIPg6ZNFxQTZDaue1ut78t0uX8mFvy4EmMSuJE+Y2YfTL4Zri84uhBe+EXI2Uc4jGx9r
         9TUPBsVPJ5VLAVlhLZf40u3kpGOQoeeA968fUJfc9TYoaTCFPi+H35x6STAmNIobbhkl
         4mAWuiO8rvnCoj62DwXuZ4zx9coRxrfEUpBL5YV90iHyzDYMNfJRzj6/r1p+r/OBm8+B
         Zmyw==
X-Gm-Message-State: AOJu0Yxo4rgfYANl25rJUDj75hbrIc9I6ERYi6xBln5vy0dOhSyV+RL9
	x0JCPO+ssUfG/Sh9myqYeWdr9YN4e8A0p615ov0CDmdanLV62tF9X89cwnMkUQ==
X-Gm-Gg: ASbGnct8rMULboXu4utJdZtFbs0httAbew1iC/+lsoqTsArqyIN6BJuLO8GkK6Gdw/U
	2y6q6PkFBi+R3yCD0WIqlNdAO0vFPYDj4qQ3RZ13uowUzG0NJDex/5gW9Ln9LlfNa0OwLrbmC3G
	RlE4lVHauFPwxa7y6fXgFoKksC1UJR/QxZmIvKDTVlepzpzz9RaCjjCP/D8yjK+slmTlbaRgbvY
	P+bAC5IBJemL8jULmJmhE/hZ8ujDxoaFevAUkz1MRRrS+Taah7Kw/NzFGIm9NcTSStVAwYTv8kJ
	x7FrrxaXvhiNW/FC7DMWlOELHX5+nrz9tymbtq4nR7z0836enKnbSZzPavDoDAeJZ8Zt55jTZne
	ibqk=
X-Google-Smtp-Source: AGHT+IEBvCo+zKvd7j7mdsU9DQLa79UighTNoRN94FnbTa2xsd5YbzSKsqrLSptrGQDaJf+xCO0s5A==
X-Received: by 2002:a05:6a00:2e86:b0:746:2ce5:a491 with SMTP id d2e1a72fcca58-747bd96b90dmr20446518b3a.10.1748914323756;
        Mon, 02 Jun 2025 18:32:03 -0700 (PDT)
Received: from Barrys-MBP.hub ([118.92.145.159])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-747afed33casm8265907b3a.73.2025.06.02.18.31.59
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 02 Jun 2025 18:32:03 -0700 (PDT)
From: Barry Song <21cnbao@gmail.com>
To: akpm@linux-foundation.org,
	linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org,
	Barry Song <v-songbaohua@oppo.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	David Hildenbrand <david@redhat.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Jann Horn <jannh@google.com>,
	Suren Baghdasaryan <surenb@google.com>,
	Lokesh Gidra <lokeshgidra@google.com>,
	Tangquan Zheng <zhengtangquan@oppo.com>
Subject: [PATCH RFC] mm: madvise: use walk_page_range_vma() for madvise_free_single_vma()
Date: Tue,  3 Jun 2025 13:31:54 +1200
Message-Id: <20250603013154.5905-1-21cnbao@gmail.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Barry Song <v-songbaohua@oppo.com>

We've already found the VMA before calling madvise_free_single_vma(),
so calling walk_page_range() and doing find_vma() again seems
unnecessary. It also prevents potential optimizations for MADV_FREE
to use a per-VMA lock.

Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>
Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: David Hildenbrand <david@redhat.com>
Cc: Vlastimil Babka <vbabka@suse.cz>
Cc: Jann Horn <jannh@google.com>
Cc: Suren Baghdasaryan <surenb@google.com>
Cc: Lokesh Gidra <lokeshgidra@google.com>
Cc: Tangquan Zheng <zhengtangquan@oppo.com>
Signed-off-by: Barry Song <v-songbaohua@oppo.com>
---
 mm/madvise.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/madvise.c b/mm/madvise.c
index d408ffa404b3..c6a28a2d3ff8 100644
--- a/mm/madvise.c
+++ b/mm/madvise.c
@@ -826,7 +826,7 @@ static int madvise_free_single_vma(struct madvise_behavior *madv_behavior,
 
 	mmu_notifier_invalidate_range_start(&range);
 	tlb_start_vma(tlb, vma);
-	walk_page_range(vma->vm_mm, range.start, range.end,
+	walk_page_range_vma(vma, range.start, range.end,
 			&madvise_free_walk_ops, tlb);
 	tlb_end_vma(tlb, vma);
 	mmu_notifier_invalidate_range_end(&range);
-- 
2.39.3 (Apple Git-146)

