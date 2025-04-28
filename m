Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 886A022DFAD
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 17:18:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745860699; cv=none; b=M15OqmbdYSP5Qjliri9Jx7WgOd6Hn9RY5/lttvSf0HDVMKPIbEaMn6kSvqzL+UYdYAxktAYoP4qG64yBDQsL9+vHQk3ntkeGHdQvSLvvoGMDo2Kf6e0sCyjKlsi/s8U1hqpJkNPduCb38k8cCRL2DqZUwW+DdIyWB2RSIA4pFfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745860699; c=relaxed/simple;
	bh=x6dCvDwBdWMQqkN2difLApc7JovzDp4a08IlqHJzszk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YN/wyteNZhnz281sDFfoJ8thpwCKynr6Q/vE5qlWxU8B5CwEeurN5eqkJayGbmdVGXsEIdLTYezmi3e7zgvx0WDZEls+ZOOj6I7EoEva55utPw75NyIKx9xqfSFYDDBrgm4+Nbm4QqlmlFS6NaJgjQ0BPvH+yFaWHY5/FEZJsp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ayYo8egu; arc=none smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ayYo8egu"
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-476977848c4so67160771cf.1
        for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 10:18:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745860696; x=1746465496; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Lbxsh/Yif/43iY1bV6mUQP730uiCDJATgv2naYcKhtQ=;
        b=ayYo8eguGYMg3FyTjTdQC0n8mXl+pI7ozU6ipXx40CABt7gVVANvBaIGyudTGI4nYY
         RaF824P5XDXkhV2joWKwcHS87QBhj9xbsY+8h3RfDINvXDp0aYHRynfNGhHddSOpJLzB
         7tRgSh5d7OtQTk9Dxg3qvFOtuGo+hqe+buC1ZhrGhKqKboXSICHwRBrbpCvdmRtiLLPm
         acJ2Ag850nZI7c36fbPy2uTfA+IhWfBalRLmudBheHwA0Iqfnd+ufJl/zZ6xVAEtwU4s
         ZEKgroyZZfC+pD8fJqQ2IePPMCfM6PZO96651j5jNKVvO1E7DoCwlB84SA0uiqTkZWb0
         hImw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745860696; x=1746465496;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Lbxsh/Yif/43iY1bV6mUQP730uiCDJATgv2naYcKhtQ=;
        b=usSAa16KYVtq5ffOSt1Za4aO+7djJZGEj/2nZIZDR0EB+ABvd9BFux/YGLXodv3qNh
         /h3Ulv7NIS4uZUTa4SDH2PUtuJ3WBfSL4r8ws0hJ3L9B2KLIeVKkMjB7VhLhc2Vi7o0D
         smQXXgbjbJHFkW+HRgIkFRVFrjt0X7EPnrvB81HzX4z7KbmYOI9EUvZEtzU9nFc2Ub1z
         c6/m5lw95qlMPe5A5DszWeJXhXZBbqAnabGziidxFrDGYyBjJSkD5n1RTdYIZkA005c4
         vsHiq6xyxctOAGQMvCFT+cKdwJokth5QBsqQ1gIip7b0w9rQzWZwxcA9vk8MhYw7xrcB
         CNiA==
X-Forwarded-Encrypted: i=1; AJvYcCUdYZAyPK7GCEd37wcsQovMgNrZEQEDYmTA2kKayuYYCd1N26ceGEtVmF1Cwz4CfrYWx6muDzxFWEb1ug0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5XcLU6ptZGJE44DMd4dLNXL5nTkmUkE2XDmQLVZjW+DHUwTNw
	Lraoleu+TgByYVZK3TQsbADFZC9GqPLcZ2gHE3lkVjLgoPHqtAy6
X-Gm-Gg: ASbGncsBcbbYXW4UNAh7guf+Az2vU3d0jYAMGQMBFt12jtJCf323KX6t1LWYLF7UiCb
	Qzj6+E1KlramsIzG4iDdgJzCSlJoxzS6/m2de3J9MBlFLP62hRCFmlVpQfzXagpbRiZ/YrXkICe
	XdFgyM7EWqwbjvLIbkpP8KUTNA/dC2u9DjvASHqxBKMij0q2DZoKgZbKGFm4ztg8yAvADdTXL7K
	drDwkaKDuWhQEY38PIb6kYX/YGs0KUiHEUxBQGMpSI+8fLJuDN5cNprasedk+rbz9Z3HV6EZ6hH
	EUkaCNpAoSUrFA2z6KDQXieq3J/XHLD8Q/OEcfR1R5cHhc1HWbr9uIFuEg==
X-Google-Smtp-Source: AGHT+IGn+hetddh7FaUugLPfhtn1QRDpLVHqUk7O+/RfsDrYs60YQ8myoJgLo1IVs/zaNA1YTC8VxA==
X-Received: by 2002:a05:622a:98a:b0:471:b8dd:6411 with SMTP id d75a77b69052e-488167129e5mr8406271cf.47.1745860696194;
        Mon, 28 Apr 2025 10:18:16 -0700 (PDT)
Received: from localhost.localdomain ([2607:fb90:8ee2:8c9a:73d0:fe8a:86bb:e664])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f4c08ef3e7sm63443436d6.6.2025.04.28.10.18.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 10:18:15 -0700 (PDT)
From: nifan.cxl@gmail.com
To: muchun.song@linux.dev,
	willy@infradead.org
Cc: mcgrof@kernel.org,
	a.manzanares@samsung.com,
	dave@stgolabs.net,
	akpm@linux-foundation.org,
	david@redhat.com,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Fan Ni <fan.ni@samsung.com>
Subject: [PATCH v3 0/4] mm/hugetlb: Let unmap_hugepage_range() and
Date: Mon, 28 Apr 2025 10:11:43 -0700
Message-ID: <20250428171608.21111-3-nifan.cxl@gmail.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Fan Ni <fan.ni@samsung.com>

Changes compared to v2,

Patch 1: 
1) Update the commit log subject; 
2) Use &folio->page instead of folio_page(folio) in unmap_ref_private()
  when calling unmap_hugepage_range();

Patch 2:
1) Update the declaration of unmap_hugepage_range() in hugetlb.h;
2) Use &folio->page instead of folio_page(folio) in unmap_hugepage_range()
  when calling __unmap_hugepage_range();

Patch 3: 
1) Update the declaration of __unmap_hugepage_range() in hugetlb.h;
2) Rename ref_folio to folio;
3) compare folio instead of page in __unmap_hugepage_range() when folio is
  provided when calling __unmap_hugepage_range();

Patch 4:
1) Pass folio size instead of huge_page_size() when calling
  tlb_remove_page_size() by Matthew;
2) Update the processing inside __unmap_hugepage_range() when folio
  is provided as sugguested by David Hildenbrand;
3) Since there is some functional change in this patch, we do not pick up the
  tags;

v2:
https://lore.kernel.org/linux-mm/20250418170834.248318-2-nifan.cxl@gmail.com

Fan Ni (4):
  mm/hugetlb: Pass folio instead of page to unmap_ref_private()
  mm/hugetlb: Refactor unmap_hugepage_range() to take folio instead of
    page
  mm/hugetlb: Refactor __unmap_hugepage_range() to take folio instead of
    page
  mm/hugetlb: Convert use of struct page to folio in
    __unmap_hugepage_range()

 include/linux/hugetlb.h |  8 ++++----
 mm/hugetlb.c            | 39 +++++++++++++++++++++------------------
 2 files changed, 25 insertions(+), 22 deletions(-)

-- 
2.47.2

