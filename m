Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AF7F277C80
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 07:03:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750230220; cv=none; b=cRo93MDLzuxOnd/gGq11wOXZu6eDo7GvNQqDOPGWTjoQ0JIAXcOPU1joCxGA9UtrCd6CnGa8suER1+tOeMh2Kp7fUGavX6SrZoKA4Vp43c/ACfa5gkNzBdupT6HhsbqobgRczukQ7dIre/lQdvED9+cn7bLQj+d/r/MgkjSBIDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750230220; c=relaxed/simple;
	bh=7F0aC32xrLTREwGvqLh4svFQyDqWN0YZmZ+sdhHXoQ0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=pzoKHPc9R88Y6tz7SbvO0Kv09L8zm2xawJedV7GIY0kW4PxtnyyhIl+1WnCIcwx3VnqQNFRQEbzIjUYJxNZsgbWJE9NyC+mXwg2Mv5idWGxsLTJPMHS0aUZUcyHN4rOkZpbMSm0kSMXZx7O/NvNCHhbeRQ6ZIPT+XfmQ7X/TYkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=XCRAuA2M; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="XCRAuA2M"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-313a188174fso358657a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 00:03:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1750230217; x=1750835017; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uG8xsZ+H9Uc7SQoPGGBdFgpzo+4wm51Bu3+zxETd9+U=;
        b=XCRAuA2MvKuG67apoYuleqyus4PwXAsmxI+Kb8oG4t38wJ+51HyjQtypiYJt4L84dP
         cQtReldTZpjpYgK9ApymTpCC78iJdVkZ50ChX1cy7s3P3GzdBSnTCoME4afy67Un/dX/
         myapCT2acHOz/PzllW7RdDUI7TCaYmJNomPNrYk0nj6GIZgyae9gIVHnzuRGzgjmaiTv
         ZUCp2VVrLlMvtT7gQR0PO554TVYqGD7sjq7+k4kWHeMfFhYY+Vv98svbNTj3LcubJI7j
         EqKlqMzyHiW923aZtMyIIMAr+uKBB9sHxZoTBdAEyZRMCoqXP+f6RuEYWzv4CAzfxMmj
         jxrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750230217; x=1750835017;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uG8xsZ+H9Uc7SQoPGGBdFgpzo+4wm51Bu3+zxETd9+U=;
        b=So8xR1cymZMsCvF7Ea+2yYg9LEIEP0Q9cJwtzMIBE4oPY2rllkFfA6k+AAs9zJ+KNs
         sDb5K/DC2Mqz0+aVKfdI3IAPCWDIcluAHEadDRNmTBH3cVF9R05PKutdoCLhlJCphgYP
         3PtAd+2P5bkdkPGmravdVnGZP4uJPoc7FYhc9k9yZ5GXX026AavBVx9OKMMCIzQwjjyK
         hR8Tk+mdI0MXgOzDrSStDHUyqPnDNooCMfu94JxWVsQz82XgMS16SGUbM1WAdMan8qtV
         rgMeqFxPVuwzD+4zaQ0KDHDYecKtoqKI3lc37sawJ74q8BS+eIigjK16N5ANkEXomgAs
         Rbsw==
X-Forwarded-Encrypted: i=1; AJvYcCUYzBIjoi5CS8dMeVE8hXDzEon36K5UkBKGuOAqXixN4jQo1aNSEf05mQFmC8nY3duY0ETqMJb+DcpptE8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0+cwOAynHrnwmwydd/LiKVc0qN3CIrxh33Dz2I0U2rwlQWJSM
	OSN82PKLtyS5g7LE2aAh5zVLdTSZ3R0emKpR8yf34QgvxaF7rhmPWLFMGqHQLmKJAHs=
X-Gm-Gg: ASbGnctfW89MJL5sNE3MadB+WhBh62VnTVcpWY8fgM1dwSiYYaTFsKI1IoficyMe2yu
	mAUbwjpI7rPfMA4ygHFiMEdjNmqW+6EWCwH7Wd5l12tN2ygGhcWRDPikDbwNXdDldPfr7OFM3qx
	TLZ6kpchyisd+L3kInbvpSzMKfSwiz8YvwAAyqoYTR3gOy0p+QdKYuEMbXuRb0x39WStCH0xJqX
	kD0HeRzKblwDgGNMObZ7mrYvjSrWhRjJO/TrUkycPIO53y3kA0UVtjsQ1Q3HM0NA+MlHXj2hq+K
	nMe2zoJY6rFNCVPanwRAHPn9owMOjPDaIVsGCICQIRpFEWmRwJkNR209OSbwFFb5BQq/liwAZLL
	v/ggCqq12BOs=
X-Google-Smtp-Source: AGHT+IEia4oaMaFBaQctANxpaCc0PHtuF2nnE4zjAiyUURSumP489zVqZFiRFyiBJKlP9CCUFtwuxA==
X-Received: by 2002:a17:90a:ec8d:b0:311:83d3:fd9c with SMTP id 98e67ed59e1d1-3157bee54a1mr2219843a91.0.1750230217484;
        Wed, 18 Jun 2025 00:03:37 -0700 (PDT)
Received: from n37-069-081.byted.org ([115.190.40.13])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-313c1c4e4cbsm11899869a91.27.2025.06.18.00.03.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 00:03:36 -0700 (PDT)
From: Zhongkun He <hezhongkun.hzk@bytedance.com>
To: akpm@linux-foundation.org,
	mhocko@suse.com
Cc: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Zhongkun He <hezhongkun.hzk@bytedance.com>
Subject: [PATCH] mm: rename the oldflags and parameter in memalloc_flags_*()
Date: Wed, 18 Jun 2025 15:03:28 +0800
Message-Id: <20250618070328.2192849-1-hezhongkun.hzk@bytedance.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The variable name oldflags can indeed be misleading, because
it does not store the complete original value of flags.
Instead, it records which flags from the given set are not
currently set. So rename it.

Signed-off-by: Zhongkun He <hezhongkun.hzk@bytedance.com>
---
 include/linux/sched/mm.h | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/include/linux/sched/mm.h b/include/linux/sched/mm.h
index b13474825130..6b4b54e8db92 100644
--- a/include/linux/sched/mm.h
+++ b/include/linux/sched/mm.h
@@ -322,21 +322,21 @@ static inline void might_alloc(gfp_t gfp_mask)
 }
 
 /**
- * memalloc_flags_save - Add a PF_* flag to current->flags, save old value
+ * memalloc_flags_save - Add a PF_* flag to current->flags, return saved flags mask
  *
  * This allows PF_* flags to be conveniently added, irrespective of current
  * value, and then the old version restored with memalloc_flags_restore().
  */
-static inline unsigned memalloc_flags_save(unsigned flags)
+static inline unsigned int memalloc_flags_save(unsigned int flags_mask)
 {
-	unsigned oldflags = ~current->flags & flags;
-	current->flags |= flags;
-	return oldflags;
+	unsigned int saved_flags_mask = ~current->flags & flags_mask;
+
+	current->flags |= flags_mask;
+	return saved_flags_mask;
 }
 
-static inline void memalloc_flags_restore(unsigned flags)
+static inline void memalloc_flags_restore(unsigned int flags_mask)
 {
-	current->flags &= ~flags;
+	current->flags &= ~flags_mask;
 }
 
 /**
-- 
2.39.5

