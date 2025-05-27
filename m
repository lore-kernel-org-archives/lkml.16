Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 106EC101FF
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 03:04:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748315073; cv=none; b=BtUk29ui/ARLAFqbkd8o2uZqrbmUK/V/BhB6tUjH2JdgEgYiyrjxCQo6uF2Eq1++puZd1GjuyFrFdd4u3K7/ZvITUUhBC+Bt37Ebirxd0eR7fGD9RzPYEdhR5OCwqUws68taqzjh9YUg3rVL4I4xLQnXDOWOgeiN51m08S7g1Mg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748315073; c=relaxed/simple;
	bh=mrmFu/XjnQS7ROhx1vC5ciEwR90UhyBUP8N+TYUVJYQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ZGktSZ/5zPzoD6GWm4rfHzyyObk/QXKFsNkQiBIXsdURmzDPUV3T17B5OBiEqCyFRwD1nqs7b3MJreJX0xdr+2Qz2hLgJPmn8hNJYCTbtRxcPPHDFesqxKFlTireY2OAyo5fvDEsUFc8ZjOY1q+aYx7Xj+s+jBe1sQT9s039A/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=V7/tn9Vk; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="V7/tn9Vk"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-742af848148so1581700b3a.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 20:04:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1748315069; x=1748919869; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mhoTuXohMe0y1UcfXiHpq9sDKMzNzKjem7Gt6sJ7UEI=;
        b=V7/tn9VkdkkNCtpEVs/kanXyWq3IbPBkySQuXVtietmcuKaLfFoa4cf0zCyJj4wFb6
         WhNPQoLq0XK3f02Q5grUpAFyPgk0UVoGKESS/uCVJN/nto2QY2puxpbJJYxdpg43XFbG
         WY2oYyAwbqJz0X8dumtRdpqHijQR7OwbmWEDzF+JMdOPXF39+io9S50KmKHf3RS3CJ5q
         I8+63CuZNWsRtYNBX6GwVjQTLpeeLKJZqgX+iKlWdeQgqASAs6TouWUlBOLMcCvhUTrP
         ntqjv/Yc6xBc7tQ59wTNuXNwUuRlxV8wyJj/YX5Tm2zOzuHEaoDlFAz6xPLgmEtRYaUx
         mxZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748315069; x=1748919869;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mhoTuXohMe0y1UcfXiHpq9sDKMzNzKjem7Gt6sJ7UEI=;
        b=wghuKYPzZCRxWz86QOMidO4LgCJl8/jyt/OI1xt1MhMjTv526VTut3SiLd+w4DFnVy
         Wi+FfItx8ecDUtjGQycCyYEXN+QDHq/JnUvEdSlQrCysxBh6xrTKNWuk23+jppqh64qf
         xeHbVqUAGSBAxRbEndnv5NfyV/Ruz15Suv+vRcSK54HwJ+WQTfmumTdjwS1y0k/IH16O
         Ls4N17c2RUJRNkMkb6azUap1Y+X+NH8dL5b/4tgUPUzW5/mHfsYXejmgoLc5tUhCCQd2
         3g7ErJNkxb8uEHSki6QWXsxL0kutYEvqXsP+s0MNbRoLZR0qujzwUyR6QhCY1uYt/Rfa
         pZfQ==
X-Forwarded-Encrypted: i=1; AJvYcCXiDfxUlWQ1UQAN7fRFI1ngcBVGM9akzBmattHCR/o/60ZmEYhbW0mTLiMrKC8FAbaEcCssaFtTEAgEgcg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzrwq44qv/XSt3hXTbdKR9G+HGV9JZG6Dg4odWDpw/xH5QB93du
	ylDEB6f2gmeQCNlBrnY/dcfkd85o7koVyXgyyzc46mdfxjo/mLmH50kfYnBh4LZht1g=
X-Gm-Gg: ASbGncv1ubUkYHhXeyOXWuXAw4rMBtwSi6+AdWtxaS7aK4YVXb80/woloK3n7VxvJJn
	FSzqi0oyqfshvjCeDim4i4Bp9dshd+8MJJHwesQ0nLGuP1KzCrTCth+imTux9H7LQiL9v0cgXso
	2mXemwUvexbBwMN7/Dy5tShWuMMRllvZgFRaGmMPOXqb3i/AiHhinE9AG5JdPbF73uN5MnEnX5N
	zPEOSvy4x213Tou2CSpjoetOmoq9wFm8wbGDwri65Yg5O65S6zySTd/r753bxyB9fSpNk+0zDAw
	0pbq8CCla7mBsEuPtP7OMjyg6lH6T1Udh6wYimBD+OXRlEZP1VhvgjpS/b4ENTu4WRZaU4h28kL
	pxCc/6fKd28A=
X-Google-Smtp-Source: AGHT+IGIxPmpGCU3g33+ttLIcANNS4fOgMwbgZTRWOf8icAGIF+GBx4LwE/HNPr6msMMXDMDjr8Zsw==
X-Received: by 2002:a05:6a00:114c:b0:740:596b:4a7f with SMTP id d2e1a72fcca58-745fe035e92mr16313897b3a.16.1748315069270;
        Mon, 26 May 2025 20:04:29 -0700 (PDT)
Received: from G9X75MXGL4.bytedance.net ([61.213.176.12])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74621ba1875sm996933b3a.80.2025.05.26.20.04.24
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 26 May 2025 20:04:28 -0700 (PDT)
From: <yangtengteng@bytedance.com>
To: edumazet@google.com,
	kuniyu@amazon.com,
	pabeni@redhat.com,
	willemb@google.com,
	davem@davemloft.net,
	kuba@kernel.org,
	horms@kernel.org,
	wuyun.abel@bytedance.com,
	shakeel.butt@linux.dev
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	zhoufeng.zf@bytedance.com,
	wangdongdong.6@bytedance.com,
	zhangrui.rod@bytedance.com,
	yangzhenze@bytedance.com,
	yangtengteng@bytedance.com
Subject: [PATCH net-next v2] Fix sock_exceed_buf_limit not being triggered in __sk_mem_raise_allocated
Date: Tue, 27 May 2025 11:04:19 +0800
Message-Id: <20250527030419.67693-1-yangtengteng@bytedance.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-145)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Tengteng Yang <yangtengteng@bytedance.com>

When a process under memory pressure is not part of any cgroup and
the charged flag is false, trace_sock_exceed_buf_limit was not called
as expected.

This regression was introduced by commit 2def8ff3fdb6 ("sock:
Code cleanup on __sk_mem_raise_allocated()"). The fix changes the
default value of charged to true while preserving existing logic.

Fixes: 2def8ff3fdb6 ("sock: Code cleanup on __sk_mem_raise_allocated()")
Signed-off-by: Abel Wu <wuyun.abel@bytedance.com>
Signed-off-by: Tengteng Yang <yangtengteng@bytedance.com>
---
v1:
- Fix compilation error caused by mismatched parentheses
---
 net/core/sock.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/net/core/sock.c b/net/core/sock.c
index 347ce75482f5..9cfed4635d81 100644
--- a/net/core/sock.c
+++ b/net/core/sock.c
@@ -3235,16 +3235,16 @@ int __sk_mem_raise_allocated(struct sock *sk, int size, int amt, int kind)
 {
 	struct mem_cgroup *memcg = mem_cgroup_sockets_enabled ? sk->sk_memcg : NULL;
 	struct proto *prot = sk->sk_prot;
-	bool charged = false;
+	bool charged = true;
 	long allocated;
 
 	sk_memory_allocated_add(sk, amt);
 	allocated = sk_memory_allocated(sk);
 
 	if (memcg) {
-		if (!mem_cgroup_charge_skmem(memcg, amt, gfp_memcg_charge()))
+		charged = mem_cgroup_charge_skmem(memcg, amt, gfp_memcg_charge());
+		if (!charged)
 			goto suppress_allocation;
-		charged = true;
 	}
 
 	/* Under limit. */
@@ -3329,7 +3329,7 @@ int __sk_mem_raise_allocated(struct sock *sk, int size, int amt, int kind)
 
 	sk_memory_allocated_sub(sk, amt);
 
-	if (charged)
+	if (memcg && charged)
 		mem_cgroup_uncharge_skmem(memcg, amt);
 
 	return 0;
-- 
2.20.1

