Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA0CA8BE7
	for <linux-kernel@vger.kernel.org>; Sun, 27 Apr 2025 19:00:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745780407; cv=none; b=GW4sQaUpgM1WkayMBBIttfpkMwytkjmYAynb3BWGaIeOabiFZNiAm2DxcOaPwTEklpmOULnBiNkQvfIMAUqjuQwu6edgwI3Tn6cZ4SCP4+zU9Sn0jCi276hTCvQ6z6zSVg8MvZDQcZNKh1QlYzu1L1LaD8Oml22eaeJHTSYOEtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745780407; c=relaxed/simple;
	bh=ixvYuFJuseyum5PIjHLWa5Aem2oMjNngxfqF7ZjUJQU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jjTXP2Chy/qqTlhJ+zIcI9huGJO2t009xpc5NW4PvHTVcOgEADaIZ9YtqvihFa2NzBhvrg8ojqf0JF26EQPwsQvzdNuZy37mZPq+SRCVFPJkPsurgU5/X6e7klkypI9qgaDRwICBbCnZ0BZ5Bd+JV2vlinv2PHqiHqE0B9Q/k/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BTsMHrhP; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BTsMHrhP"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-739b3fe7ce8so3638246b3a.0
        for <linux-kernel@vger.kernel.org>; Sun, 27 Apr 2025 12:00:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745780405; x=1746385205; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:reply-to:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sO/c2dpuYXlj/3UwW0oZEDPegJbr9P58GhOxx31Nlqk=;
        b=BTsMHrhP044zI6JAxHepnktYAqPse17k4U3KvsxcKgLRNrwyYx2M+v03UJdcXaJWZB
         h6sdp9vqe3EnOxcGBKLviGI4/NMbsN5rze/BJzEHXfh92zTvETLfQs0EmIJ2j0Lmai81
         InnruE/CRRp6a+mezIZVe4NVzDa7vYFMF0pVQZTptHo/CFluIKU8LICpu0Tfm/Ca0wSF
         Pv7OxCZvQ5v1HXw6GbnTneuHq7LUUuL2eavVcanhSleCyfwiTtewnMAlvkvvlYJ+wUZN
         Q5wDpkQuJjBAQGTEYrt5+u44W7/efrsgFRKgDFRc6z2aHp5RNucqfCaAVfRdQauNn4bd
         JaRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745780405; x=1746385205;
        h=content-transfer-encoding:mime-version:reply-to:message-id:date
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sO/c2dpuYXlj/3UwW0oZEDPegJbr9P58GhOxx31Nlqk=;
        b=wy1O3LsJC++fUDGaP1fILy8GZq1IxcxEJZYhifaGwYXd0dhgQv+eHFKVJT/o54hUsS
         J7b9+RK5n3Jj3eeYmTSkJAKxsblGxCjd0BgnN4brPC1/9+/G9UvfP4Bhdhts0yux1QJi
         vKETORPeaHKJkmZvixVweXZguj/VxJVVwRtXJE8+oW/fa/OVtJqS8Mhw6gjjYz2GNlFl
         5pDU8lbqDV8xkw29P1kr931ijwIY8Tbd5ITcOzx6Qirs07QlIJiT62IubQiZtaM7lS2b
         zAM7kEAywi7XtKhZlknTtp9fiIo5TAUcJsSX6L8kJgcmgWXgp4DI9GtIFfixsBp4rywq
         7JGQ==
X-Forwarded-Encrypted: i=1; AJvYcCWCiUDx2V+9AyERdISHvVNPq3Cu9vXnvlStF8O1BQ3h8by7H1NmIQbWgqGNSt6MpsSkyXJTiRckdoYLfK8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyHfhJUqO8ip6OwFz2Mm0i/TNapDaebNoulGeS9jAkIRJhj1nPY
	T3b+y2/vZejoLACmTwXmfYL3qE4geCDfITJecMO9KDjoTSZ3J3d6
X-Gm-Gg: ASbGncsppoMz4jdBZNx4hV748eSbGwl7nWlRvG5wgcZtKM0Pw5rEctuTf/9RLtIk9BR
	se+6r1sMbsjjq0C7UrX2Lya3faZ1Ckipb96UA8YXNQqo4e/i0XqjgYAuzoN1HHkNG93yvzVAUw5
	h4Qct+23cH+6GyhaIXN1z7CeyPxuIlHftd7OnDRRbZM5CiW1ygSx8XSckUy1fk+gmRLVB+C7T8w
	fZ2SBckrdwk3+zORVRqww0I0RNvJ3Z4vBltRA4/FT4/aQolO6vaWQCVp6OKeo2CFqz4yUtfYfl6
	CyTm8JzM1SocoHGm2yH6qFSQRMZM+NZiJxpjiQXbnbYWL331x8GTjFXUSt5W5Q==
X-Google-Smtp-Source: AGHT+IGXWzLtd7Q6aFXRVQqw8fg82v52sNI1bDi2oitAPTpDGkPrOkonErwMgQKoZ+TYTT8AfED1/w==
X-Received: by 2002:a05:6a21:6704:b0:1f5:7ea8:a791 with SMTP id adf61e73a8af0-2045b6f78dfmr13438841637.10.1745780405063;
        Sun, 27 Apr 2025 12:00:05 -0700 (PDT)
Received: from KASONG-MC4.tencent.com ([115.171.40.102])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b15faded554sm5862153a12.72.2025.04.27.12.00.01
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 27 Apr 2025 12:00:04 -0700 (PDT)
From: Kairui Song <ryncsn@gmail.com>
To: linux-mm@kvack.org
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Matthew Wilcox <willy@infradead.org>,
	David Hildenbrand <david@redhat.com>,
	Hugh Dickins <hughd@google.com>,
	Chris Li <chrisl@kernel.org>,
	Yosry Ahmed <yosryahmed@google.com>,
	"Huang, Ying" <ying.huang@linux.alibaba.com>,
	Nhat Pham <nphamcs@gmail.com>,
	Johannes Weiner <hannes@cmpxchg.org>,
	linux-kernel@vger.kernel.org,
	Kairui Song <kasong@tencent.com>
Subject: [PATCH 0/6] mm, swap: clean up swap cache mapping helper
Date: Mon, 28 Apr 2025 02:59:02 +0800
Message-ID: <20250427185908.90450-1-ryncsn@gmail.com>
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
headers.

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
 mm/swap.h               | 18 ++++++++++++++++++
 mm/swapfile.c           | 15 ---------------
 10 files changed, 32 insertions(+), 48 deletions(-)

-- 
2.49.0

