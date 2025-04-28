Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B581E3C30
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 11:00:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745838041; cv=none; b=UtbqwFt7A+OZygN3KLj+XbhlMz5/W/pUmt+pkRn3/42kBjd4/Dq/JUYbrQElxaFGjrm2OsXd7rvUXYyGRQBPop43+xQ8n4NVtNGRPklxMfhFz1jLAuYnr7zkB8EWI6kIGUwNG9auRua/tbN7srFcZNOf2p/d6IPqXmTbZvVJoVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745838041; c=relaxed/simple;
	bh=j3B0MYbzZAEc+qERpU/zMdFMbU0C+dVtzxS7jampYX8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=QFuyEoJrHjQnWYPzJN4/JCdcqKqpHb1VxlAlqKOl49pjIIsUAxscWsBqSVB30/TIDczXzn6dUlC6hnaUjLI+O3o38TE5WMe3meCCuvS4UIFkwkTxDhc3ahxqWKOOjxYkp3ZfV1XcTRX9R0IVR9TQEbwdKQzFl3xT5x1oPPd8cRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Yx0M8ts6; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Yx0M8ts6"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-afc857702d1so4401202a12.3
        for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 04:00:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745838039; x=1746442839; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=am2ZiWN4Bm2VEil0bDLg8crNXPUQ3a/h6BNlq/5lx48=;
        b=Yx0M8ts6Fx8U2+h8pzmQgMA1XdYLFbQGX4lkhhfF5o4zJKHNJSXk1R8AHzn6aT7bqC
         RFQNCqZnMC0wevN3W86R0jNB1pZl1xyEqZbiw+oP4GrLUv22Pje5Nu8mEqAyDYCUIB83
         lHFTZSdPHCwvwOmYNvbEIOBXRHm0h6s2yz4vutkklx6aqwO3nWGO2KJB3gkqhgX5vpV7
         ku9GsVYrD+KNQiHH90oAZQZMrOom1XZ6ALIkG8DeEA5rncTDzwVuFpqGJA6kvqa3SrOZ
         GTYAl8+517Ki8bdUQMWXfOT5G6hTadR+zEgtZL53A7CpaYoJSXnK/HuzVHmPZ80BOMfD
         3a6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745838039; x=1746442839;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=am2ZiWN4Bm2VEil0bDLg8crNXPUQ3a/h6BNlq/5lx48=;
        b=loDW8YeRUbNETPrS8Etpir5OdaWScDuSzPHneUhseR+g6beoiJbTc082pX9bXlhPrF
         OCkmmh8Jiiq/Dp3RBo1vl+2cA/8qvEdIzMd4Cf3cxMSZK2SjWtpKSwV0XfVpVTDEb9pl
         AOWA/Va+zDBNWGD3xfxao1SzTBcQBDCTCgzD9rehCrdZIlgAJr+fcUU3+4/DCttx3Flf
         Q2GP2nKkd7IgSN6wG+rK5dA1LjFfp4a/GqQeb75lVeFsQgg5X+QavJlm4xLVaVIsN7Jn
         n8RpgchfIizIbGnKq9WbzgDDjHndJZFavxcXQ/DqQJLgrB4P38uQFcA7h4n8Rn6dbc47
         oR6g==
X-Forwarded-Encrypted: i=1; AJvYcCWnBzWfCS3VlAu6ujaF34fpFX9z95GmRo+ez6hzwAC8EEx5k3wIYrjROwmxh8F524UwiHfqQcSL1frhYt0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0IjxEBdLEoND1n+t7fl2F3k9C/8IzuQC3RMrIuj2eSy8jLg+F
	MSN2XmkbpUBkTncRctFTEYhmL2CA0XAwcIJ10EfYEo7Qn7OvcMTo
X-Gm-Gg: ASbGnctQPytHH9piTZou733VacmdwMpp683hbpJaqnoIED7M3vNaQ6t9/7vlE7du4qJ
	UzyfCjvQ/tMlmNzFWB+qZVguvhrB1Ah9gacRQISE85CJGQbw6MHiohd6ghSgfkJMyT13VgMNcqm
	T1SaWRGBAoowNMz3E97m8ASg1Vlh3sP5rplB2Cjn21WMBDULc3rdPvtG4BFdtyMzKyTKRVaUYQk
	vOeuGze02/W9FR/jEklhE31gd0hdZfWtDrJ8AxFxD0sgXPwksdHRWwWJJ4dd1fTsJ2QVeOGG9fu
	eWS9lJLU5ocoTd4mx5081jzmdoHqPjts+nHC4XdD4A==
X-Google-Smtp-Source: AGHT+IFJqXgn1Lk/mpz8TwqUNNfo4yHGH898evwV/gPcGp0VABpecVKLg2DwNecHjoVY1skOlB86FA==
X-Received: by 2002:a17:90b:1f89:b0:2fe:b174:31fe with SMTP id 98e67ed59e1d1-309f7da6db1mr17020009a91.2.1745838038943;
        Mon, 28 Apr 2025 04:00:38 -0700 (PDT)
Received: from pop-os.. ([177.21.143.178])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-309f77370b2sm6810067a91.8.2025.04.28.04.00.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 04:00:38 -0700 (PDT)
From: Guilherme Giacomo Simoes <trintaeoitogc@gmail.com>
To: akpm@linux-foundation.org,
	pasha.tatashin@soleen.com,
	surenb@google.com
Cc: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Guilherme Giacomo Simoes <trintaeoitogc@gmail.com>,
	Andrey Konovalov <andreyknvl@gmail.com>
Subject: [PATCH V2] mm: alloc_tag: change the KASAN_TAG_WIDTH for HW_TAGS
Date: Mon, 28 Apr 2025 08:00:30 -0300
Message-Id: <20250428110030.151265-1-trintaeoitogc@gmail.com>
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

V2 changes:
- Improve commit message

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

