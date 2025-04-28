Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BFA61A7262
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 20:14:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745871264; cv=none; b=s6gWRpNMt5Q5Ifxp8YFC5q+D9em4P1O8LHQsWUBDrtwEvYKr/hYadWfdeRQSq+ZoQKzyu1DDeyLae4e0VtgQwvcuIVR+DE5DC4Pj2wV/o7okV/f9dBOS/fG9ZSqkSBQ405EQ7e73DvX8xif1RO7mS+/VgcmFCE6KCKGGXd8y1H4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745871264; c=relaxed/simple;
	bh=6fuUKI6vERqeYl4gGAs1yZ40TMpaWWzE8ORIWqb2Cm0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=HXzfjsJvJ9wJjeAki7lVAYkLhdpk7K0c6l93MVZOWL9SS5/XHyy4xs0Pl5gyK2/I4r+hhSzEin+BbI5sXJTFegEOElsvmoqmDIZiq5sI30igDrzh9Bk3w5h5aRjgCocdonl815b8bthAvgdS1x9H9GHxy3582/IiS/bA0U2Q2Kg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jPss/bxW; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jPss/bxW"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3015001f862so4464346a91.3
        for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 13:14:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745871262; x=1746476062; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VjRx14M376vveCfDp7swIOPOpjkV7HG315M3zraoU/o=;
        b=jPss/bxWNZUUt0dYllrbvC/tKDFtFc6Uvk1xOOHyMTiJxA7fXUC8sqqzdOP+EWsAeo
         i8UZyboc1zfCgLLLlzvn9UypRAERqigzKc6pMyuGlaFccl1cmABYDkdy1CmzIe/YT0AL
         jVwBJTSxNU5jKqTvlKMg4k7z4Xi0A3qvLgQLbRkGIB9jpJaI2vQjDzjTkkbzWE277vWG
         AOt43FflduSQ1mIY0IE+mKOy0Ivser70fj2h56jhOWjno11z1U0mkj6kkBJvb8lzOfet
         toahqSEYc4MjoIl0Jldx00+7Z/Hr4fQ4eyCJgmx9Iwgk0N6gCFCby5JSST0/Fr93eupY
         8/iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745871262; x=1746476062;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VjRx14M376vveCfDp7swIOPOpjkV7HG315M3zraoU/o=;
        b=AoQwHlKpyRAQ/qrKPT1adqBJXwZ6cnXR6j2ADw/4NjBklZ0lnuZ8WmNTfpWy6nzhr+
         bnn1fx4bx1sj9IDyQcsAm9X+a5mnC/0codYbkCR4L6BK/Vl+vpFEQs9FnTyPXc+mtn0W
         t8dprl+1z0Xqwaz1CWhIPEz1W5+LA4C4DPKBJHE83cpUpI2oqR/LZpyWgPOApuIjT1fr
         P25qUN0Ch86SPofxhodgWsdS3KaLbNPohryHL0IZsTWxDXCRxlbvt7G2GX+IET5/kEUk
         KC3UC6GeNYxQ7it4WbCReuLridxP28Yj5Z4Z5llskdfsCEqZ9bmeUbL7zj/rJkLv3FG7
         cpzw==
X-Forwarded-Encrypted: i=1; AJvYcCX2r8o1AtpQ0t+AHICCsxflis+5qmKOM9rbozPlOp2R6ERCBHgfsSmoya3Y23FIjJlM7ykHYy/Mm2G7crM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyOkE48/Y+Om5H2i8xwdTC5N15NXxAV3Mf6wwTcaxynujOTXwVc
	z+F8yWWbWncbpqafpdOSpHoD7kPRKMdICGSkFEXeduc4NwRF42IyM2zVyQ==
X-Gm-Gg: ASbGncvtYeb97g4E0pSBBYGtcUuVbqsByYLTCBm8XeDBHWyGqEzz9kvthICYXSBE2MK
	X3opngtKcfOxMBTxLCAobi8Vp3hzqlucCiA4i22hc2EE+6BOcC6210oenuKlfTVI03EvNhsuBGb
	Ur84+lZ0xOhMGFg7a2iEu+1KgldIFCKL1AKOj1kTspOY/4rwFO2nAQKMV+RjNef2dwyqlkmkTlT
	o/UWrvEiIj7NnoINy45vjY/jgRu2pFpsxBqWmKVXOqAJnq9vGbrPtHYp2CZcNz+NT77lBL9VdZM
	w+eNvxpv9Bb8CEEc4yk8gh76WPewtmN0BbEQyFbMjyW+JW7w+3q+
X-Google-Smtp-Source: AGHT+IFi7B64GIpsWh6rdxcl1/w6Sn4mPZtkk2x3r6n4OytOFOdG5Up3hqix5X4IZn4b7fZAjQ+86w==
X-Received: by 2002:a17:90b:5242:b0:2ee:8430:b831 with SMTP id 98e67ed59e1d1-30a23dc1bc9mr224240a91.2.1745871262070;
        Mon, 28 Apr 2025 13:14:22 -0700 (PDT)
Received: from pop-os.. ([177.21.143.178])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-309f785225esm7601136a91.49.2025.04.28.13.14.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 13:14:21 -0700 (PDT)
From: Guilherme Giacomo Simoes <trintaeoitogc@gmail.com>
To: akpm@linux-foundation.org,
	pasha.tatashin@soleen.com,
	surenb@google.com
Cc: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Guilherme Giacomo Simoes <trintaeoitogc@gmail.com>,
	Andrey Konovalov <andreyknvl@gmail.com>
Subject: [PATCH V3] mm: page-flags-layout.h: change the KASAN_TAG_WIDTH for HW_TAGS
Date: Mon, 28 Apr 2025 17:14:09 -0300
Message-Id: <20250428201409.5482-1-trintaeoitogc@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

the KASAN_TAG_WIDTH is 8 bits for both (HW_TAGS and SW_TAGS), but for
HW_TAGS the KASAN_TAG_WIDTH can be 4 bits bits because due to the design
of the MTE the memory words for storing metadata only need 4 bits.
Change the preprocessor define KASAN_TAG_WIDTH for check if SW_TAGS is
define, so KASAN_TAG_WIDTH should be 8 bits, but if HW_TAGS is define,
so KASAN_TAG_WIDTH should be 4 bits to save a few flags bits.

Suggested-by: Andrey Konovalov <andreyknvl@gmail.com>
Signed-off-by: Guilherme Giacomo Simoes <trintaeoitogc@gmail.com>
---
V3 changes
	- improve commit title 
---
 include/linux/page-flags-layout.h | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/include/linux/page-flags-layout.h b/include/linux/page-flags-layout.h
index 4f5c9e979bb9..760006b1c480 100644
--- a/include/linux/page-flags-layout.h
+++ b/include/linux/page-flags-layout.h
@@ -72,8 +72,10 @@
 #define NODE_NOT_IN_PAGE_FLAGS	1
 #endif
 
-#if defined(CONFIG_KASAN_SW_TAGS) || defined(CONFIG_KASAN_HW_TAGS)
+#if defined(CONFIG_KASAN_SW_TAGS)
 #define KASAN_TAG_WIDTH 8
+#elif defined(CONFIG_KASAN_HW_TAGS)
+#define KASAN_TAG_WIDTH 4
 #else
 #define KASAN_TAG_WIDTH 0
 #endif
-- 
2.34.1

