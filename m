Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5797428C2CA
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 13:54:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749650069; cv=none; b=D18HKgGNkAfF4V21kkLw2UNOUydYieEgm1RmitrZnKQaDuodGUKBkigYjKJCdApyoywOAaQcCvhZ+ZN/qHUF7g70mPvAPBkReiebqrRLtWC+ruRh39UtjF/d0bOzHOZ9UI2Q53zQPYPEhSTXjRYVL3aFLRS50bmLMw67yC/qdFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749650069; c=relaxed/simple;
	bh=M6Hd5cfJW89cMbQiBp0pq3gj0iTZOghGN7mOhRv6024=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Q+vsr6MDJAhurcoH3Sda6bcKKaRuHCcpD7lgyQyU0IapEM69dvWJWy0oxx0UTRAU9pcnqSZkcDGiDZXAwjaVfdfpMHfSxzkJs7gzx2pBDsuZ/RI4GXQBcjimAoXwuFDOzzGzX1878ydqH7bE8yBPrkVxrzfxFOy0Pw6W3ye6B80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TYuubngR; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TYuubngR"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-7424ccbef4eso6009377b3a.2
        for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 06:54:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749650067; x=1750254867; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PzIxibGEI2FDfWCRvs8TwMUYH3iwSFSbOXZyVQqmYEo=;
        b=TYuubngRME9AHNVzEtHp88iFPgd+uhSRIsV29X38quqKECBZwRrz0y9yZENSmKHRFO
         NX+VvCCwP2KSBm13m09ehC223w5CGSernFjRoyVUu1wDka9Uj7uNA8tjfuEG9+RtjHpk
         FUUpRd55Wzv14Tc+mo90wehW5zLTFrBtfxM35sQZuAKlOd/5osFKu4hXOLXxu419ZQvX
         AJhgtsw8OHu/A8me2FIXHj1DlR+dcZGjB+2Yk+mMFAOoyBrxXdHMsyum6P39QYwxWYq9
         RXZ4ofefyYyvINhyDe+OXp6m7drlP9KmXF7Xkv87MEvNlzx8UO32s8y9D4vSmGH7LGWA
         7VFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749650067; x=1750254867;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PzIxibGEI2FDfWCRvs8TwMUYH3iwSFSbOXZyVQqmYEo=;
        b=NCJswyMSi9Tc2i55f8g7DCnqqjGiDEIbEP7ScKhyAqKg2x0WBsHWpWtC/5Lp+PVHfP
         WG793KgdWYU8RTxSh3DludltXxd2tF0qaDJ30qQzkLZwwPZ61BMmX3S5aVibtbxx5GkX
         kxEkscFX8OYVPMa6dMXSPRQCp9tOUL95GbrtN6LWoKrIC3ZxJrCiUzGrPwUQoMKOq9b3
         LXiXr0kIV0KNG6S68I49G+IxcmOuP6AtZ3y9am0Z8yUTDqF6Ps+7kDQi4GrkJKL+tFep
         Wqsj5F/VtDVA3/yFGDHpsFqGzFWks1McxBmoAcW0kgKqvqAKQ00SwCcw751L5DRRvH95
         rSxQ==
X-Gm-Message-State: AOJu0YxxIyxE2cHGB0NFW28l7TmDlrRFPZtRjEHaMRtAL4hDvYKpxmxK
	UtiKHHBlSnUNyGa9IMcou0vaM+sEgtzLeKMBws+Z/jmGXvhJT0XKpIrbrbubFcklXiE=
X-Gm-Gg: ASbGncs6FGQJ6Ua5lUfeB/dhwdMWNkWg720D2YZWRgoPVtBJnN0i1phQMF3TG4WK2hj
	qLKqUL8gTkb/ASlkdqBOgscsMkqBASW5EnyaMIsIFk4YdjGVEpTbZcvjr1Vevv5h6KvhcCHLMHC
	EsuA7OLaL/GRGZjVsytMORBw4k1gjTdkiteBISjUCO2QLXt7sDDOsusRVcq6yRZr8MzIdBySE1i
	ufpAeTInqDg2RkcIKkvTP22kPI2TkHaAzFQCeehj4te8tQKK1WHB+LprmL1lhGKVKqQ2e5lYizl
	WDqu+HGpwcwLCg3LGxyP2QlVLUblypSDoNNYTiU+r4tXWn//RRZLsr7foHxG22PxKtbTf/as5Rw
	e+zBMKWk8WJOHc4AqloRsfKcbIf1osfFLzT70budAWIbA08Bc1i46
X-Google-Smtp-Source: AGHT+IGtUrqiNTY7W5nEP+DP9ZN3+AsYH0Dq/DI53poolu4vmM+XLxWhkA5h32YQZiB/zei8K5VsJQ==
X-Received: by 2002:a05:6a21:38a:b0:1f5:889c:3cdb with SMTP id adf61e73a8af0-21f866158e2mr5678795637.8.1749650067364;
        Wed, 11 Jun 2025 06:54:27 -0700 (PDT)
Received: from eric-acer.tail151456.ts.net (36-225-84-3.dynamic-ip.hinet.net. [36.225.84.3])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7482b0ea3cdsm9247523b3a.159.2025.06.11.06.54.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 06:54:27 -0700 (PDT)
From: Cheng-Yang Chou <yphbchou0911@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: tj@kernel.org,
	void@manifault.com,
	arighi@nvidia.com,
	changwoo@igalia.com,
	jserv@ccns.ncku.edu.tw,
	yphbchou0911@gmail.com
Subject: [PATCH 2/4] sched_ext: Clean up and standardize #if/#else/#endif markers in sched/ext.h
Date: Wed, 11 Jun 2025 21:54:02 +0800
Message-ID: <20250611135404.13851-3-yphbchou0911@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250611135404.13851-1-yphbchou0911@gmail.com>
References: <20250611135404.13851-1-yphbchou0911@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Simplify the scheduler by making formerly SMP-only primitives and data
structures unconditional.

Signed-off-by: Cheng-Yang Chou <yphbchou0911@gmail.com>
---
 kernel/sched/ext.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/sched/ext.h b/kernel/sched/ext.h
index 6e5072f57771..d2f8cefae68c 100644
--- a/kernel/sched/ext.h
+++ b/kernel/sched/ext.h
@@ -65,7 +65,7 @@ static inline void init_sched_ext_class(void) {}
 
 #endif	/* CONFIG_SCHED_CLASS_EXT */
 
-#if defined(CONFIG_SCHED_CLASS_EXT) && defined(CONFIG_SMP)
+#if defined(CONFIG_SCHED_CLASS_EXT)
 void __scx_update_idle(struct rq *rq, bool idle, bool do_notify);
 
 static inline void scx_update_idle(struct rq *rq, bool idle, bool do_notify)
-- 
2.43.0

