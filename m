Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A241625E459
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 18:11:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746036665; cv=none; b=NRuqmjE0jo7P/wmZALACLXbbkynhRIn5uriImVobz3bqCfgN91MX9GvMo3PQBR/RKfqssiRz3US+i3tGEexUFHuScighYxppMMnH3ATuvvweLMM/Oj2Ctwvgv0n1/cCaB8I01xDHcFgPDWqaZPbU9FoP2sbJu6GZ8M11qsJMXNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746036665; c=relaxed/simple;
	bh=tOQlNTP1RqbOsNTRy4G8zcVvFccJipJHU0Bp1l+fieo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cgwPvgXw1VITOveiVkPxsl3Ko1UX0z1J7XhAzrzsJbaeyO3x9Higl9q0ut03n0EC7VpUHy2UJS5wvl2sX75bGT0PCT94HNRr7OAbn7grkJkUmzhw//pzZ1lCaCOgpLA/emKxy+vN+LRsWa9PryKrvxG7v7rITgtf6e1lz6+/P1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PVnKCqxz; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PVnKCqxz"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-736c277331eso1328943b3a.1
        for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 11:11:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746036663; x=1746641463; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:reply-to:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BFR7AoJacqW7HaZwiZ98V1thSCcTnJzoeJlhOpgrdoc=;
        b=PVnKCqxzIfG/dWwUZYih25S3PHWQKtw8BZsSRMBv26nxhx0/injVKD7dZu3S/1m0IJ
         K6pjXaEKW8Tzo7gOgQzrm4xDy2QupfpH27Wjtv11ouMqTKwm5QTxr6pO/6knrDu4oEG1
         RxuL7cowLUIWBR5F1Wi6XT5d+4VsM9m/jzXJ32jp/12vFxW/rOLBF7uet6uuP92Hmuap
         TB+KKEB5xjwK0lBJm2FauR+wrxz8iZ80MqKDomlTq3BGVjFHsYFSN54vZZsc8uF7KiMr
         PqXLz0DJlKzGm0y0IGxmo4SKBoHxIygLp2onbWbozHoMXJCLWApPS9ds42HeHox5t/vt
         JMOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746036663; x=1746641463;
        h=content-transfer-encoding:mime-version:reply-to:message-id:date
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BFR7AoJacqW7HaZwiZ98V1thSCcTnJzoeJlhOpgrdoc=;
        b=i8xn/6VsoFAqlIzbUuYYNqvgCOkDrGi9IXOTNZEXo6kNC7xJWVAXQFYOSlBIbyAMn5
         m+rFvNHFKh34kNDQxHhU5V8nifbl8Kz2Chm6qfNIha6VIeQRP+vTo4Gzyrdb2dYHWJBv
         0ZQ9/zBH4+J/G6mwQQ3cgxrm6UrcL94McOxcy/CvqGa/93+1K+XjUiifns1q/StOMUaP
         DxWFRFGwh6XmmHCn39IM4oIghjxsVKWVKOBqulTjQMFUqumJ2+KTn0RkjwNzUhn30gTx
         cN4db2r44PXPkmG8KxmhKqUTUV+V+34DiUFvSNs24PzMB1ifvMWlUWfUKsIeDTJKQQIu
         owcQ==
X-Forwarded-Encrypted: i=1; AJvYcCXAZBtYNx4Z211dNLuXr53YFvxk03e3S2wqcT5z1MMD1MW4fhTBrAZMImmwOaAmXm2vQ0YFIMXlXlM7vgw=@vger.kernel.org
X-Gm-Message-State: AOJu0YypIeikWYKqzDF9Jy7t8ziXyfMXW9uvYEFdIorWOquOn9/paZ7K
	F4Lj73HZ32p6ppbIojNCKGBoYsnn+6MtEZqJuiceHQ5VrzEER3ba
X-Gm-Gg: ASbGncs0GuiPZoiPH/Ez3lzvXVjefGpKeKLq4GpeMpCgl9lDP2o74OL2K0S9Ry0mmg0
	sZKmewASiWf5Mb7QpbfIg/6BEUfoPI8lpXYhbVxMEfxJqMI/Yr5AQYwrsD1F92K6O9ShPF9KiKf
	9m05+Cdd1Vtj0YD/kRiXiMaQUAU+8U5FLAd5UPnLrfbjYIS/Elp36LhikwIiI3uBNZ5/HweA9D6
	iHY0b44OjSv4x85FXMsx31sYihGu2Yyv7tAhvwCl6zFlgTPLZwmPyoWs0djwSfkJubGbCo+pQk7
	mQWXVPIfbiMlKTWggzOcqxkoSn54IWyJb3dWNU7oNHAo3D1jjCE4luEJ3n4K4g==
X-Google-Smtp-Source: AGHT+IGNWoQRjjYwV+5Fgmq5l0irQkbd37wxK1tufot32watwCeXNfCMZBa34D0poHbU92Yq+iX/3g==
X-Received: by 2002:a05:6a21:6da5:b0:1f3:3864:bbe0 with SMTP id adf61e73a8af0-20b9734f2d1mr559643637.8.1746036662637;
        Wed, 30 Apr 2025 11:11:02 -0700 (PDT)
Received: from KASONG-MC4.tencent.com ([106.37.122.198])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74039947976sm1983822b3a.84.2025.04.30.11.10.58
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 30 Apr 2025 11:11:02 -0700 (PDT)
From: Kairui Song <ryncsn@gmail.com>
To: linux-mm@kvack.org
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Matthew Wilcox <willy@infradead.org>,
	Hugh Dickins <hughd@google.com>,
	Chris Li <chrisl@kernel.org>,
	David Hildenbrand <david@redhat.com>,
	Yosry Ahmed <yosryahmed@google.com>,
	"Huang, Ying" <ying.huang@linux.alibaba.com>,
	Nhat Pham <nphamcs@gmail.com>,
	Johannes Weiner <hannes@cmpxchg.org>,
	linux-kernel@vger.kernel.org,
	Kairui Song <kasong@tencent.com>
Subject: [PATCH v3 0/6] mm, swap: clean up swap cache mapping helper
Date: Thu,  1 May 2025 02:10:46 +0800
Message-ID: <20250430181052.55698-1-ryncsn@gmail.com>
X-Mailer: git-send-email 2.49.0
Reply-To: Kairui Song <kasong@tencent.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Kairui Song <kasong@tencent.com>

This series removes usage of folio_index usage in fs/, and remove swap
cache checking in folio_contains.

Currently, the swap cache is already no longer directly exposed to fs,
and swap cache will be more different from page cache. Clean up the
helpers first to simplify the code and eliminate the helpers used for
resolving circular header dependency issue between filemap and swap
headers, and prepare for further changes.

---

V1: https://lore.kernel.org/linux-mm/20250427185908.90450-1-ryncsn@gmail.com/
Changes:
- Collect Reviewed-by.
- Fix a build bot error.
- Slightly update commit messages to cover a few review concerns.

V2: https://lore.kernel.org/linux-mm/20250429114949.41124-1-ryncsn@gmail.com/
Changes:
- Collect Acked-by.
- VM_BUG_ON to VM_WARN_ON and minor code style update.

Kairui Song (6):
  fuse: drop usage of folio_index
  btrfs: drop usage of folio_index
  f2fs: drop usage of folio_index
  filemap: do not use folio_contains for swap cache folios
  mm: move folio_index to mm/swap.h and remove no longer needed helper
  mm, swap: remove no longer used swap mapping helper

 fs/btrfs/extent_io.c    |  2 +-
 fs/f2fs/data.c          |  4 ++--
 fs/f2fs/inline.c        |  4 ++--
 fs/f2fs/super.c         |  2 +-
 fs/fuse/file.c          |  4 ++--
 include/linux/pagemap.h | 29 ++++-------------------------
 mm/gup.c                |  1 +
 mm/memfd.c              |  1 +
 mm/migrate.c            |  1 +
 mm/page-writeback.c     |  1 +
 mm/swap.h               | 18 ++++++++++++++++++
 mm/swapfile.c           | 15 ---------------
 12 files changed, 34 insertions(+), 48 deletions(-)

-- 
2.49.0

