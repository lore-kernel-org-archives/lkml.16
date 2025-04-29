Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B507253F1E
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 11:50:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745927420; cv=none; b=BMc5+UeEjYWkHPUvx98K337sCzu8lfXW2jFYf+hVAhwS3mk7vVNb1vL7R+D5FH/mt4D7Wrwa/+KOuNUHmmLYDgw3bXsKP2TiFwPjimdemuA4kHK84egbyEKReIXCoBDdRmdeTW7MaRFmsoq145PGoTt2OdK3lVa7a/Rb9Qii+KM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745927420; c=relaxed/simple;
	bh=ISe9TdA9m5ZNvh5twr2wdgdyDRBPU7CqO9oIP1Hfejk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=q3W3Mwig6NdUEWfmDIhjmc9RxwU+7qwv5P7rnikgZq/hQNSgTkk6VBQUSB2o5lbku6ReJ/BaMyZbRXrU4iytXv2Si/dGPET4hEKBW5c0BpbU2I2YdHzRc1q4kbDvlTqoFnXI2Xg+2+wzMW5CoY3v/GZ4hSs1cXpE9hN0IHQddKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R1TOm7nS; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R1TOm7nS"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-7369ce5d323so4863631b3a.1
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 04:50:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745927419; x=1746532219; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:reply-to:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Wsj4hi9619RQ9t5bKRVTi+rGBF68ko75f647eC3ZpB0=;
        b=R1TOm7nSdJVUB+4xGRaAGQTlhfTfUcB3baXesmOpvUkRBF5Iv248UitzMf5lOoRfV2
         i4GtjKVrLiXC7K+y866BuVHUpMlBj7iqiXLIgtlbtishSJDgTeVfpZJ0o8LTffXUFyyS
         uanK4Ya094I0twF+s2c1ggVln/yw0BN6VAWJJws7l1FVx4IbPXg0AGS837qL0UHMpiHX
         kyNKtZNhR0A7EYFU3OSud1IyXWc3eDvo08OZ3SWo1eBa2lVHplU7KhNGFuXkk6eZntaO
         PBLXnXHPK3bOn2BamHRzfrSVEP68SUNO+iJnAuMD3RPU0+P+M/COZhLLWd7tGAgDmLGc
         okqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745927419; x=1746532219;
        h=content-transfer-encoding:mime-version:reply-to:message-id:date
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wsj4hi9619RQ9t5bKRVTi+rGBF68ko75f647eC3ZpB0=;
        b=VF+PfhW1a+TMdBYVqfMcqw0wqU3yJjeSBOXVwTJ23Cj1fseZUyFKt6xpqIH215+thN
         NdneoZYTOMcPq8c0cyfUjq574B79vu3g3/sQXTpiV95qTw4n0l+EUjh9nfiPNxoyMxhX
         bYpbrCL/jMUdKYrdjQAqCObGK7WN7BzNIL47+n3At56MeXVrELgg+AwDua+Fkip3ri9U
         aEZ+pujqa5vH0+gnwhY2zaCJE86jV/ffNW0q8V0H4DwkRgcDKyqsB9PD6djcwlgbnduE
         M3gE4eZCe045PPFwg8W0V+/huqCXXQvisTnMpo0pENy6zAmpq7WgCbHYW8wa8GvkGm06
         7AiQ==
X-Forwarded-Encrypted: i=1; AJvYcCVlzfvN3JDeBgNUDq0ZQJfgGDa+HyRYvNqhOn27s1rVzBeyq6o619cswW+ephv4kztLXzt6Y78YK0JBbEY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwwHpbcXnyAErVyPmRwP0vNzzY73bfRHtK3Wt+sf1P4GngqxsbR
	bYAD2uFCTB+R9LDAVl8S5WBeI5n/4GguYAWFQ8vnvYFXo5cD8c85J/dN7Zfi
X-Gm-Gg: ASbGnctd9JMp1zntqsr21Byd136ztViyTYXPk89lcM4uARa5QKfDQS2TcX5mDvYzaaC
	pL/K35SGMmpS8ufdSGcEQ+MhHyhJN7sx9fBghfZYgCVL0W5FFxFrNHtZlgM4ZHbbSxV4GQEEtX6
	vNOPD/bKDAatUT4zNXvG3F5QnFnNuTjd13HbyvOXA5ZxpVhUMw0Wy3U9i+xLy1OakxQSm6oOSBm
	K6EwFN2YXFZDoJ6HZeYRlHXYjSzHqXQGLlwz9Q6ZWPWNkBbj2rUOS0Tmp836ldWCzwS6HAMmjdb
	89rEydMrxgBOHo7eWuwVqBNfavzq0z1ydwqEgFjUPmhLA5Zlo3HqlaqfMuwcYO+yaoQe3XTyopV
	d6MGH9A==
X-Google-Smtp-Source: AGHT+IEBKGzjRAgyYhqZHkS8VGKf2bda+UTUCImpQQEPYMOmURnLEikBc5EZGu29niEcrPvQ8QZgfQ==
X-Received: by 2002:a05:6a20:d49b:b0:1f5:884a:7549 with SMTP id adf61e73a8af0-2093e623fecmr4516897637.41.1745927417938;
        Tue, 29 Apr 2025 04:50:17 -0700 (PDT)
Received: from KASONG-MC4.tencent.com ([43.132.141.24])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73e25aca62csm9661644b3a.167.2025.04.29.04.50.14
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 29 Apr 2025 04:50:17 -0700 (PDT)
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
Subject: [PATCH v2 0/6] mm, swap: clean up swap cache mapping helper
Date: Tue, 29 Apr 2025 19:49:43 +0800
Message-ID: <20250429114949.41124-1-ryncsn@gmail.com>
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

V1: https://lore.kernel.org/linux-mm/20250427185908.90450-1-ryncsn@gmail.com/
Changes:
- Collect Review-by.
- Fix a build bot error.
- Slightly update commit messages to cover a few review concerns.

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
 mm/memfd.c              |  1 +
 mm/migrate.c            |  1 +
 mm/swap.h               | 23 +++++++++++++++++++++++
 mm/swapfile.c           | 15 ---------------
 10 files changed, 37 insertions(+), 48 deletions(-)

-- 
2.49.0

