Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75DD917993
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 12:49:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744894164; cv=none; b=FnI87wf7ljgXrkZW2rYYQ4kfzhA0YKL+nGc866UEMzUvaSh/NA68qiMTmxT2YAwgLxArIulY2jMr2SJ9d6fk1fpRxdmkP0OieGKqNSYmiERJEAifDK9YPDIxHnVBaDmBFxGpgAd0TXHNLckz/d6S2EIrEWO43Nn49oPdXo5AhOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744894164; c=relaxed/simple;
	bh=+HXeqZgtzYzWCtXZ1TgKj/++VtpjZjSe0b6GVPrhRWg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PqYbW1pWIsiSeD8774Gu1v80LoIFgyU5zfe8LG0smOb/9/WeDcvONhkvctfgcph0bC1OAwT48BZoT+f2rwY0kahrj82ssgC6Fs+KdY0TfA52Oo11yjOcsKvCytVz7h9GDtd9q/xIwyM2enw3OOMcx40+UXZQOuybMXKhSaQ5th8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EqvJFal1; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EqvJFal1"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-301e05b90caso622314a91.2
        for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 05:49:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744894163; x=1745498963; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=d8kk0nVKUMf/OdtBEnWp0PEvIohAyGuTJWgasrqfltw=;
        b=EqvJFal1c616yQf6g2CVw6/KsVla6P7qYiDJtxKRDzDTkbj+PlFRvK8ANXDujIy7Um
         P1e9Ocki0Kc95bc6KI8IX2drTYz3ZDua2z7klwG+onUkUAxdhqE+uOFmqEHhtpd/xWIq
         JfDu5e1hRPbx/EZl/GiVjc22lVps1RRGJdUsBjcUfLm0wRkvVmxldM4ARpVyKD8hWmoJ
         GKygRTboU/90PU8bVTWggruON4lXHSDHHZgFnZWIz7cfWooNEZE1Hjw5MNhjlNp9fZ04
         StjCBPthWoYVAaSmN5CilSduH5gGhR0j+Tw0/uGrNU3lQn3oDZXIa5KJY6VBhFsSyR9E
         +s4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744894163; x=1745498963;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d8kk0nVKUMf/OdtBEnWp0PEvIohAyGuTJWgasrqfltw=;
        b=Ug+JWznXI6ZNGHr2CCTIaRxJNot19eBaai9kFRi25a0zo8E3yBkQDDPKVE0xucHBTI
         TGcWJxbZdjWK1EunsSfPjZ2CEqoevBqiu5ppfK4jFCCiD+8mmpj3k6iJyMInvgOsBey4
         1Wv8JgFg1iiP5Xl3JkjtGiAuY4SHZQm3wt/mSI1MAWg6IlesE9ekYz+ab8RgLJhH6/5d
         8xgOibrK4e20Ss2+e96PLLsp43NmNnKtwxsjQi3vcCPpzrftK4tk2/EYCP9eErW8RrqY
         pmTYVrOeChUUSDCIWspQ71xeFOVKZNtqg6zPBbuTa6rWnI4hA3qeMUh44PHW8GU6QfJj
         KbTQ==
X-Forwarded-Encrypted: i=1; AJvYcCUZQG9UCtomVSlbOFlJ/c+tmPEGzsPxSPw0/B/ymm0q3qWnNiH+izKRsYLyUq8hXGq1PhPkv6dXgiYWG/Q=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8/rxxXSARY539InXc0yOB+j4n0Nl09PimzHYq2Z9rYWErbuGx
	1JqsowbOAtBuqaINiOhSpRPBpkGWZ2w0CHoehPmRl4FyFtklatKN
X-Gm-Gg: ASbGncv8oB8kUtAr5BQXDFYD+MV0/MN0f6ydbx3aJN9Z+9/12ZnyGZMor5Xekii8jEp
	OqhGKh+WRkwttmyTxq97SD6fGXsMlsfRPWrsJDjg+ZFL1IyYwYxRjnwI2Ti6hWIPlW7S7ZHUxTi
	/crXfOS+7CnFF+pUl7R7rbHNCuP5CVTMeJ32GyzfIF6vkBQlyj2IHzgcZetYlOnkjESNk+Ao9Rq
	7tbWidzwiI/ep4ajBi2Oamc1g51IgJHx4pM2h9P/GutXFECn+XRiLSNHD6rg81ADj/5LotTmUX6
	mu8jZXviqGJx6T5E9HXK0Cq8IJDYVpUUoLt5CqRBXYAsY2Lz
X-Google-Smtp-Source: AGHT+IETkytabvdQ2inUW/wBroQ6pMG4SfR1s1xBDBO13XlHhB0u2/Mrc41iiG+kLTFS+1gqFdB+8g==
X-Received: by 2002:a17:90b:3d50:b0:305:2d68:8d57 with SMTP id 98e67ed59e1d1-30863d237a6mr7590014a91.5.1744894162662;
        Thu, 17 Apr 2025 05:49:22 -0700 (PDT)
Received: from EBJ9932692.tcent.cn ([43.134.20.116])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-308613b2fe8sm3533170a91.35.2025.04.17.05.49.19
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 17 Apr 2025 05:49:22 -0700 (PDT)
From: Lance Yang <ioworker0@gmail.com>
To: akpm@linux-foundation.org
Cc: david@redhat.com,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Lance Yang <ioworker0@gmail.com>,
	Mingzhe Yang <mingzhe.yang@ly.com>
Subject: [PATCH 1/1] mm/rmap: add CONFIG_MM_ID guard for folio_test_large_maybe_mapped_shared()
Date: Thu, 17 Apr 2025 20:49:08 +0800
Message-ID: <20250417124908.58543-1-ioworker0@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a compile-time check to make sure folio_test_large_maybe_mapped_shared()
is only used with CONFIG_MM_ID enabled, as it directly accesses the _mm_ids
field that only works under CONFIG_MM_ID.

Suggested-by: David Hildenbrand <david@redhat.com>
Signed-off-by: Mingzhe Yang <mingzhe.yang@ly.com>
Signed-off-by: Lance Yang <ioworker0@gmail.com>
---
 include/linux/page-flags.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/linux/page-flags.h b/include/linux/page-flags.h
index d3909cb1e576..6bd9b9043976 100644
--- a/include/linux/page-flags.h
+++ b/include/linux/page-flags.h
@@ -1232,6 +1232,8 @@ static inline int folio_has_private(const struct folio *folio)
 
 static inline bool folio_test_large_maybe_mapped_shared(const struct folio *folio)
 {
+	/* This function should never be called without CONFIG_MM_ID enabled. */
+	BUILD_BUG_ON(!IS_ENABLED(CONFIG_MM_ID));
 	return test_bit(FOLIO_MM_IDS_SHARED_BITNUM, &folio->_mm_ids);
 }
 #undef PF_ANY
-- 
2.49.0

