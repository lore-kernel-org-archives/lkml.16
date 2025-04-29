Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34C761FCFF8
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 09:48:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745920112; cv=none; b=lTPkEyYNaFD9lConmUtHXi+nWtZYKZ5gXcjEWOugJBE4Fx6tVEaaIZAtU47LkzEYKO0YqH+2h+XAncvtLGVnEIOL6xz0zCU2Zj9jX9L5JAqdzoPg17GMu/kUh6RFZXuavNunvF1ui5+AdGtL5xUzK4MkijWoZVpmWAFqecWy9rc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745920112; c=relaxed/simple;
	bh=RRvqOdmnsZW2eiUxtDi8xpnxYh0WcHRzdztNj8jT2Io=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GBw8Em7LQUpDov1NCOllOeOInAARbCmJaJw/NH3918XDVv58WsHwz5JchORAFm7PmQEWQnSZ4WRneJnX3TFI1Z+21XIFt40g91gqjvFp1fiebQrjvEPajCWsHs8B9OIiFYq5V5eJp3jWLD3svoGmcfRW7mS0+RvqpCA+YF9Tk18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EjLAppLD; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EjLAppLD"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-22d95f0dda4so84397765ad.2
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 02:48:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745920110; x=1746524910; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:reply-to:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=al7UooysWSzGBv7ZANvZoPIfufPL8+o+HcZmV8bme8A=;
        b=EjLAppLDLi3wVpq6LyDsBoL+MYLYjATluOu2V/caUaC62n+9nzzQ+n8xGpgMF7qsk/
         Jij1ZB8J6BHGZzIjVJSgJNHfvMsj5CzxpTElOmYWKeM5V9Sdw3lxntL6YWHbs9yA+kFV
         PrO32fKWzMtL1D2fZo63CwhyhKNdzeN9DAYW5lbUBOHE914WcD4Vy8APeqdHtCkMXdlN
         3dOTp9nKHzaR9zl3EcIq0VQ2otiVgZM/F46RrvsHQAvd6N+/+FFLxKEizOEwN4kdMYO3
         Mc5pK31M0rQcP9PmtpO7l0etCoDpiwZ7FsitoMFEFGaOrDb3kq0C0FPA545BeFA7UvxM
         hBog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745920110; x=1746524910;
        h=content-transfer-encoding:mime-version:reply-to:message-id:date
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=al7UooysWSzGBv7ZANvZoPIfufPL8+o+HcZmV8bme8A=;
        b=t+QW57ro3P9f4rAclQ3N4ClFa9G/VRhqjEuFeJyVl1j7zGORglRFmGeOxruIidtRyQ
         JNj1u3wHQCGSAUS26Zr9/e65OFndS4sEanmAhuNJuiKQ8KjFUVuWFz2UlUbMxCs8ekzX
         NB+ilHkFIZ23OUXSNpJYFLaLWWjm3yB3V7tSsFhvw7107O4QP+8rFfjTTU4ty9McgBxR
         kXO+gaYY2mqLjxFUQtcD8R+e8GvtdWp/RqhRI/92skbo017DO8HtYwzx9ZdTscj3g6S7
         jdUEXlZN2YDRVkz07Bz0HJAkDkuGBXyuPXwxOZpW2cym5aKf0S4zHSwToBh0ZE8PBv6l
         UAog==
X-Forwarded-Encrypted: i=1; AJvYcCXCD1kE714XEXGq+MZDzE2oHs4c1poaikg42S6qkLwTk2WU89vKzfLvLKjd2Ru/b17QieF5HOK3M2PuxYk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwHSnCTJadBJVijM8k72QDzOXX9nCSPtxlDXVRDSpC4mwcp1fDn
	AjxWsq9DcVAzEb9BvpB2SYi64WYZbfsfOjohVZQkKntIs6VLTcW/
X-Gm-Gg: ASbGncvkLvWv49oNViztAslqmVhcAxnGtfj3r5KB8Cp0qoJy+/S26behCZfOt5wmua3
	UhtVvPAd1oJEl3GO/qNVGToRa7XPg77OCeVDN7Q5wc21YFaKVTq2EuBU/8nQP7X649bQCSld0AI
	sC0Ti69y7ZoDaM+w0hoh7nk/HbiPHUfYCWFpIupRipwBbX+smGuaUA2IZwN1rel/Q275U+Y9lTb
	29eA8aEG7ZvIWM0aWK6DAej2PTKZr5qjXRZ1oA5eGwWk7J+bAk8ApSwB3sc1iOJJTdbyl0JwLuA
	N8sQEbjxXUi2heIAbVD8yHoH0C37mFw8ClFAccgVmjgSn84grJKy86skwfMA57AEDopgoDr4o9K
	aVfCpCw==
X-Google-Smtp-Source: AGHT+IHNdNB/EDtjtxtUe1la7yZrLwwve4cD0Q9+Zl3JTKWsOTEczdm3s3j9hd4Zz101WX6u+TpMMA==
X-Received: by 2002:a17:902:e5ce:b0:220:c164:6ee1 with SMTP id d9443c01a7336-22de7012487mr31503435ad.32.1745920110368;
        Tue, 29 Apr 2025 02:48:30 -0700 (PDT)
Received: from KASONG-MC4.tencent.com ([43.132.141.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db4e0cb15sm98432255ad.106.2025.04.29.02.48.28
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 29 Apr 2025 02:48:29 -0700 (PDT)
From: Kairui Song <ryncsn@gmail.com>
To: linux-mm@kvack.org
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Heiko Carstens <hca@linux.ibm.com>,
	linux-kernel@vger.kernel.org,
	Kairui Song <kasong@tencent.com>
Subject: [PATCH] mm, swap: fix false warning for large allocation with !THP_SWAP
Date: Tue, 29 Apr 2025 17:48:03 +0800
Message-ID: <20250429094803.85518-1-ryncsn@gmail.com>
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

The !CONFIG_THP_SWAP check existed before just fine because slot
cache would reject high order allocation and let the caller split
all folios and try again.

But slot cache is gone, so large allocation will directly go
to the allocator, and the allocator should just fail silently
to inform caller to do the folio split, this is totally fine
and expected.

Remove this meaning less warning.

Fixes: 0ff67f990bd4 ("mm, swap: remove swap slot cache")
Reported-by: Heiko Carstens <hca@linux.ibm.com>
Closes: https://lore.kernel.org/linux-mm/20250428135252.25453B17-hca@linux.ibm.com/
Signed-off-by: Kairui Song <kasong@tencent.com>
---
 mm/swapfile.c | 23 ++++++++++++++++-------
 1 file changed, 16 insertions(+), 7 deletions(-)

diff --git a/mm/swapfile.c b/mm/swapfile.c
index e727021b8e2c..b86637cfb17a 100644
--- a/mm/swapfile.c
+++ b/mm/swapfile.c
@@ -1272,13 +1272,22 @@ int folio_alloc_swap(struct folio *folio, gfp_t gfp)
 	VM_BUG_ON_FOLIO(!folio_test_locked(folio), folio);
 	VM_BUG_ON_FOLIO(!folio_test_uptodate(folio), folio);
 
-	/*
-	 * Should not even be attempting large allocations when huge
-	 * page swap is disabled. Warn and fail the allocation.
-	 */
-	if (order && (!IS_ENABLED(CONFIG_THP_SWAP) || size > SWAPFILE_CLUSTER)) {
-		VM_WARN_ON_ONCE(1);
-		return -EINVAL;
+	if (order) {
+		/*
+		 * Reject large allocation when THP_SWAP is disabled,
+		 * the caller should split the folio and try again.
+		 */
+		if (!IS_ENABLED(CONFIG_THP_SWAP))
+			return -EAGAIN;
+
+		/*
+		 * Allocation size should never exceed cluster size
+		 * (HPAGE_PMD_SIZE).
+		 */
+		if (size > SWAPFILE_CLUSTER) {
+			VM_WARN_ON_ONCE(1);
+			return -EINVAL;
+		}
 	}
 
 	local_lock(&percpu_swap_cluster.lock);
-- 
2.49.0

