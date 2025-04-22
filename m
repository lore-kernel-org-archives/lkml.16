Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FD3A201270
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 12:48:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745326135; cv=none; b=Bq4tDywXMIrOeWXt3TtYoIMzRLcNyg41v4D/jzKSK7DTWINhdzPEkm8DxHckRzXf0Rj9GjEvheO+6XLQ0vCyYy0diTQXiP8oSmx6aYRfbGXysmyH/lskTn8wXyXzij0/ZSvUC+XHaV/OLxNDqP4Dws4ZXaizIuX508gLtWGZxPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745326135; c=relaxed/simple;
	bh=3Yt4rS+ibb/vaIW2ZU4wWv0x+LMH6StwqfP2MUgIfqA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KsSJ5IhGRhQEb9H10R5NSq4ibe32CmH2HlnJogkZdZQfakUfDNQngOSNWN460jMkmAYOfqkAYEVPX/Lgz2Cf7GiiDLkqX/COYCXgv0tfLlm2+x0W5o7+uQIJu9gRtUPaY2jMfIXdbLfF1dsOzffee/LhfbCAfKVyYP6YdmBraRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NSo7F/5F; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NSo7F/5F"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-7369ce5d323so3837644b3a.1
        for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 05:48:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745326133; x=1745930933; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8/8D/g9r6tfxT33CM0XU/LNeSLlAqiuTJZXlRjXFwX0=;
        b=NSo7F/5FX1A2FR4CrKuAAsbNVxBuXVVDcVCZspe6P5BlqPBeegL1ej0ysjcG/oIgSR
         fzXPC0+E4ZOmnjsLXocSp13r4i3HLXBqhvI+3Tr8mXMWk/j+pKSyTxILhjK5BOQYr2T/
         c22Fqsm6s5i5jD+EytGlsHwL+zvljqrwz1yI21ZpilXn+uIx+FloDNqOPj85nV6JW4ZV
         5k6o7/Kc1yjWgOTIySQlRb0yE8do2Ta4AwmtBk7rNV0cy38oB6vgWPdI2kJcbRersk+R
         AQB/PTPEa3Hnzav4nCektjLgkJjfKOxk7xjns9SRuv8cWv3Ib30i8U6qwyMTY/+rdziN
         qIbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745326133; x=1745930933;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8/8D/g9r6tfxT33CM0XU/LNeSLlAqiuTJZXlRjXFwX0=;
        b=CL4yvKAlQwI5fkQD8v8+iaLwG8jdYCF40Pkxph1xttTfJ9Se/0RClKwMMwRQkCxz3y
         7apWSzmp8QviwZsbaBx9IdilPC8XHY2u9sIeyBKMScV43uChpEWfcIf3cjjIE1Vf5kgw
         yVs/prRNl4SkJlNGC6NftfKTHrRpf6MoOA1BKThJf5kypDaHMryRZr3pIWtlA48PwbPZ
         tn3m88E90IRaG0HNq1MILNXve/ExjTzA+0bs3+l6kTooWDniAKJaadczb+V7oxogIYbp
         riCj8Qy5EAO8J9PuqdvSEA7Oyhhu80+gtQ0PfMg9Mc1zvrldqpEVa2atZv81fBx0WWQb
         gidg==
X-Forwarded-Encrypted: i=1; AJvYcCUoRfshPIxe/h9Q01DsHRTim8riVEGmpeXDQxmRIwC+3JU32pdgKqH5AF6orgJGnQ7QzFM2Fyiw/HjeAcw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzeigox6vgPCJL1qt3flVDJthfYKaf+28glSrvSPK2jXxS/zpck
	EGcRXPsz8YK06NQhfaahkHZwEWd8CF3pKlo8GoLC9nzOYAoaNMHK
X-Gm-Gg: ASbGnctOJbYRrvuf3k4I5cHrabT1TiOcSqVIWL5XKmV/5RtOGbmjwer/1QoeWIGnxKo
	981Pwu4w2Nws4b7dby3SctPL5eHUhleEOG+Z37cZ/TyGmU11FXrwOKb6h2QXcEHSBZ7Q26QTgTc
	cIdE7BoVYnMAwvXv8YpgLT5YOo3ULcp6OJhSgawRnrJpDAdxvEEQncsGgAy7DZ95nP6AI/mnee8
	9DG3EIsOZ6xGmLISfTTIng5XAkoqQ0gQjXGKIkccEQ6nt2/QmI1tIZQ+LHy1a7f8Vl7E3LH2mfT
	DAP6Y29Mkq3Kd6Gy3rDvF8a6VBATx+Iecyol99bl+QAhTYRhmp1yG6a53/nfwuURqKqiyQ==
X-Google-Smtp-Source: AGHT+IG2qQg8X7PIvQGnjsC3za+TsrbN36zuFYU6c7/f/+/BNCIkDkfcRbr1LCdZEm5wIFRYUK8ZPw==
X-Received: by 2002:a05:6a20:2d0b:b0:1f5:5ed0:4d75 with SMTP id adf61e73a8af0-203cbd213c1mr24123742637.31.1745326133362;
        Tue, 22 Apr 2025 05:48:53 -0700 (PDT)
Received: from localhost.localdomain ([121.185.186.233])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b0db13c8b1fsm7289856a12.37.2025.04.22.05.48.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 05:48:53 -0700 (PDT)
From: Jeongjun Park <aha310510@gmail.com>
To: Liam.Howlett@Oracle.com,
	akpm@linux-foundation.org
Cc: lorenzo.stoakes@oracle.com,
	willy@infradead.org,
	linux-kernel@vger.kernel.org,
	syzbot+a2b84e569d06ca3a949c@syzkaller.appspotmail.com,
	Jeongjun Park <aha310510@gmail.com>
Subject: [PATCH v2] ipc: fix to protect IPCS lookups using RCU
Date: Tue, 22 Apr 2025 21:48:43 +0900
Message-ID: <20250422124843.17188-1-aha310510@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

idr_for_each() is protected by rwsem, but this is not enough. If it is not
protected by the RCU read-critical region, when we call radix_tree_node_free()
via call_rcu() to free the struct radix_tree_node, the node will be freed
immediately, and when we read the next node in radix_tree_for_each_slot(),
we can read the already freed memory.

Therefore, we need to add code to make sure that idr_for_each() is protected
within the RCU read-critical region when we call it in shm_destroy_orphaned().

Reported-by: syzbot+a2b84e569d06ca3a949c@syzkaller.appspotmail.com
Fixes: b34a6b1da371 ("ipc: introduce shm_rmid_forced sysctl")
Cc: Matthew Wilcox <willy@infradead.org>
Signed-off-by: Jeongjun Park <aha310510@gmail.com>
---
v2: Change description and coding style
---
 ipc/shm.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/ipc/shm.c b/ipc/shm.c
index 99564c870084..492fcc699985 100644
--- a/ipc/shm.c
+++ b/ipc/shm.c
@@ -431,8 +431,11 @@ static int shm_try_destroy_orphaned(int id, void *p, void *data)
 void shm_destroy_orphaned(struct ipc_namespace *ns)
 {
 	down_write(&shm_ids(ns).rwsem);
-	if (shm_ids(ns).in_use)
+	if (shm_ids(ns).in_use) {
+		rcu_read_lock();
 		idr_for_each(&shm_ids(ns).ipcs_idr, &shm_try_destroy_orphaned, ns);
+		rcu_read_unlock();
+	}
 	up_write(&shm_ids(ns).rwsem);
 }
 
--
