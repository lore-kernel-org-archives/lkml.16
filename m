Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32B904A01
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 17:37:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748972271; cv=none; b=PZD3sASLqF4IHKvqxx3s9kjdgzyYiqRZi1EJtRghf5YS36bDtZq9pkcN6VVKTg44sAHE8+e58jJEgVtcrTMcq6hUf6H2s0m79pDsSqe8aYRx19HwQGD0I6ollXTqAsGPKZxvNtKiNxNxjYx6f3Osy5Z4I47ENYakU+xGIBaMDxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748972271; c=relaxed/simple;
	bh=BXwCulW3NF4eqIAJ79GAFvUJVwK96lKpH/HnjTO3pxc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LJDvNJnvLDFrac32va3CaJbXiiV4isRpRRcYuacoWW2+pyX6RpImJ878RJpYyEIpFFaUnVyURUF2Ju4yjTZBH1miLEQysb29z3IK0P7N3fxGGklU7lMKoFpXABn6AMFXpDnsVIPRhMoy2P0GVI8ksRrrXL0uSF+CYUx6gbBuo+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BKtU2Q2Q; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BKtU2Q2Q"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3114c943367so6501144a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Jun 2025 10:37:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748972269; x=1749577069; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qmZbeZgnsejj51mBQflzEWz+C8FHTnGO31W7ha2CzVU=;
        b=BKtU2Q2QeIP1ce5pf02r+/m88xqRU7D5e2hBtGMd5e+uqHW12psTktNxB+2aCMOGX+
         CalzI1L1gVqL5tba5O0mK8jof8qdq2Pa89M2cQtIsLhFkuC0JtJA49jbs3ESyqep17/T
         PkJREG7PvkapTSC+phvp07BVUunJnSTui/966B80GgnWabge1kxSWDkqX27OcbTClS9u
         ltg5jqR5XFZdTZVtECd4ZCgA/lIoIkRiPKraWlpA1tCUUAEljl950TdJGE2OVmuZyEWp
         mTnDLiLrUFcEbGkLOXn55KBjIR0WLtI2uF4Le36l7m7siJtrHnAxXXwWcMTyQXylsbQZ
         izuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748972269; x=1749577069;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qmZbeZgnsejj51mBQflzEWz+C8FHTnGO31W7ha2CzVU=;
        b=XB4WwF0ttQb252iXStjA8U+bvM4sO0X/7JXOHOxkPqU4cyAnIqy5JXivpH/7X3aAL7
         ttENe+i5Sphk6nariAoXTEchfWhaJ5YIjcrHUL6dXCh3ZgYOrDgCEMzbyEk7MUU8tvnT
         xFxP4yxIuU6IotkEVWOa2m9Ap0steEZaLTXAIHNNclu066kWin/aHWnPclErCD4QPcgD
         B1x1hxiTTy2N6ZMifYusma698g7o1rCoPkdq8TMHPU9R1DJ7FlNESqVa5JT5O4DcJn7N
         O/8Svu4xErpAk+eTXSjTZLfGg7vqFxJb4500R4NjjZpk+WEOtf6T+pfipIBISCzTqE/G
         svpw==
X-Gm-Message-State: AOJu0Yw6Qeg7H9AkldOdMkxvcltmG8OH4EGGu3eJ8drEjRiJ6wSaVoMw
	Q7QmGeTdZ+DZlj+QReYZkscSpiqNjrxZDFvfGuWezcj+VgrDUMWDM38MS8AkTw==
X-Gm-Gg: ASbGncvfHOGNTSpxxBQjjGtZewJWNM4KxxVs5HklnZE+BLDg8eBHcG/l9/3E7t/kWeZ
	SqwwQoySBYJtnXisHBRsFisv7mh7ednd30V/fwiizp73WdKW/0OXFkyoObZD55a4zNAKeYgy3/C
	yYz2eLbBRXtMlx7ZjLygeQyAhamldoEfOq/2sGwnzaISIShjbaFXUXMhQxnE8CgltIDrVt3NRNl
	S5d0NkG9ZLld6DF5WD7qmN3VurcMHMmyXEEO1dfCgd8fz8jKkSHB3RlIWQj0RXPF6UCmHZZbyEZ
	fPTR2YZzL3HoEoxh/gWfWlYl4zL/jPq7FOOo4zeB22UP1KJ6EjIQREenKqk7A5g1AcTi5jn3Vx6
	Fxc0yd9k2LLgsY4/riNWxw1fHs22i2R32fo3ic8Xj8/s=
X-Google-Smtp-Source: AGHT+IELgcwm5ycuQ7TBp9o3qO5sV84L5QfSoz36MtjwBB7F3vQBLsvxOsRDFg65VRNp8qlO364Y8A==
X-Received: by 2002:a17:90b:530d:b0:311:f2bd:dc25 with SMTP id 98e67ed59e1d1-31250405591mr29739222a91.16.1748972269088;
        Tue, 03 Jun 2025 10:37:49 -0700 (PDT)
Received: from daehojeong-desktop.mtv.corp.google.com ([2a00:79e0:2e14:7:f466:948b:ebb2:d370])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3124e3d2999sm7531826a91.46.2025.06.03.10.37.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jun 2025 10:37:48 -0700 (PDT)
From: Daeho Jeong <daeho43@gmail.com>
To: linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net,
	kernel-team@android.com
Cc: Daeho Jeong <daehojeong@google.com>
Subject: [PATCH] f2fs: turn off one_time when forcibly set to foreground GC
Date: Tue,  3 Jun 2025 10:37:39 -0700
Message-ID: <20250603173739.2483532-1-daeho43@gmail.com>
X-Mailer: git-send-email 2.49.0.1204.g71687c7c1d-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Daeho Jeong <daehojeong@google.com>

one_time mode is only for background GC. So, we need to set it back to
false when foreground GC is enforced.

Signed-off-by: Daeho Jeong <daehojeong@google.com>
Fixes: 9748c2ddea4a ("f2fs: do FG_GC when GC boosting is required for zoned devices")
---
 fs/f2fs/gc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index 2b8f9239bede..f752dec71e45 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -1893,6 +1893,7 @@ int f2fs_gc(struct f2fs_sb_info *sbi, struct f2fs_gc_control *gc_control)
 	/* Let's run FG_GC, if we don't have enough space. */
 	if (has_not_enough_free_secs(sbi, 0, 0)) {
 		gc_type = FG_GC;
+		gc_control->one_time = false;
 
 		/*
 		 * For example, if there are many prefree_segments below given
-- 
2.49.0.1204.g71687c7c1d-goog

