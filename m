Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F5C44315F
	for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 06:46:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748242015; cv=none; b=o/0upBAQkFi1bx/nkduSE8TY79yhI6t9oBIB2LAZJSKduZBtOKVnbuvvfbXHIheOsPRZ+r52gAfeSyX/kC8fQT3tIuU3Lo7cIeLQ7ykidW2KX+rWT8u82JrI/yO5epvdGBll5i7wVe4GfcTehh6GGgBHcr6XzT82aFNUYuSBu6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748242015; c=relaxed/simple;
	bh=zF5a6CbWQaQ1v8nXdGyp0eEQDySwSivavhf1guhcNnw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Zmh3AhNalLHvcj3QdHlMJDdjufcjUkJdWdsrvcZjLEQyWHS7VyeZiDbwLfSSd9bRbSlIWPwUZjeykbGvL37vpKLPKaWtUjvpB/kgT9Bddo5qle/CDhse+AyeyyKpO1LN1SXQgm60C/YEyMvNbzndVi9iL3RgyHunwiZpnnpWxls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=PUfSEheL; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="PUfSEheL"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2345c1246efso4522985ad.3
        for <linux-kernel@vger.kernel.org>; Sun, 25 May 2025 23:46:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1748242013; x=1748846813; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=E+feYia0z4AbJzGUj7Ynki7IIualikheA0eQ0iNGi48=;
        b=PUfSEheLhhKTPjLRimMWG0xFtWIGnBmxvz9+h/3tq647jFETx9UEQPtvnk3uXwRzM1
         WZV1Jw4NshEp77P/0xyShxEXFDwbayzJd+YwhTHLHYAjFNFDRZxhRjR2ZlpssTWN7Nd8
         uHm+19yDa5BOtfh8bvOkuOlKxCF9Hu+BKviHmlFe9NW5WDiuwOS7vaYugyueSd0T2oCp
         +tcg/42hsvCFc7/CJ42iEz96lYyomNQan4uQYy197En5U0X8DL8WNPX+MUHbfEL8z8jA
         DwbB87SEJGPrAQdH5ShHOCYmjF6rQaFi6DOSAMWIC3kKkbREbSnrq7e2OHd3DWYPbIj0
         7+Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748242013; x=1748846813;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E+feYia0z4AbJzGUj7Ynki7IIualikheA0eQ0iNGi48=;
        b=Wx65+Ke/NZJODSdwdtvdCaDIjaIP/qJ8xq5Y8oKFJpChCNLJGDZ3PYWtAiZn7y/TBp
         7M7aRM899K3RGb6ov9OsESBmJ3DruPUFHaB4TNhL5Z6ZJnLXfpyxvK/16POhJYBq9LTP
         up5xngMVbHaaftLkDXgZ/nMwGK/72QwFDWpbplI3ncZMrKvtSdvl+ITGVoaNQmOhNYHw
         AEIDTwE/VEE9XyXFuUqn4V96qjqJyrrrrED67L9e5GGIuvC/hwY8OBipq2Js+CC4mpAg
         II+hOgOZCGSd2/JU+vn0/epv6faGckadZNoZCs67NeIq8jgnbweohzvEq4IImIBScG+Y
         Zyeg==
X-Forwarded-Encrypted: i=1; AJvYcCVmY2dHREb5Cq9VWvLG77I7y7dyRsMsBTw+egTABew0h50txNueJKaAOGJyMdot3bt8/jIO5jgx5KRvGVw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyTkTr34M/EglFj2UvR8LiXCXEhw7iPPUVsSB9xhlrEXeq72l97
	1U/Le8aThGF/FF/hAPdRpBwndKeKrOHdHzPZq96KZ/H4lTe1XsyhWfiN0T0rmiEmpVw=
X-Gm-Gg: ASbGnctGOuy3Vk1QMpjXvd9trcRuM8oWpcjFalCsJ1aQLccswXMYOWsxagpDrYPKTE5
	VZkY5cHOcFqdsNm4+jb3ajr3lw7Iowxl9sUIArgSzQ9Y2jlSS6mFmqH7FooLOvX5UkokfQygkrw
	c7e7UKHUnf6xBSN42yMsXXIt7qbWYD79tSxxkB5EcHWjpa0uB5KxXKy1b28okePncy07pm/C2aY
	rOOKSWoHNq7OvXJ4IV2V0hXYz5xO2Vcoc8XvoOKkdDHMjWR3l6KWnhhTe4633LAFAPdyPDj5NGO
	OSLWIXtI+BUwHfGHPmvZOL0ezXMOEhjH7sBrXLUm8vxU3CJxCDG8UkWLQrsHGjMtNhSkCHuAezw
	gqJb5YgMcacwaFg==
X-Google-Smtp-Source: AGHT+IHnoO5tLCbaoBLiTXZayzEX2KB9z6ecdf5HOv6WlNKWWxkB7PzMeH306LsSOdDaUJvdAxKi2w==
X-Received: by 2002:a17:903:32c3:b0:234:18a:d8ce with SMTP id d9443c01a7336-23414fce6a1mr113266005ad.46.1748242012779;
        Sun, 25 May 2025 23:46:52 -0700 (PDT)
Received: from G9X75MXGL4.bytedance.net ([139.177.225.227])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2345948c2acsm13570755ad.34.2025.05.25.23.46.47
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 25 May 2025 23:46:52 -0700 (PDT)
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
Subject: [PATCH net-next] Fix sock_exceed_buf_limit not being triggered in __sk_mem_raise_allocated
Date: Mon, 26 May 2025 14:46:19 +0800
Message-Id: <20250526064619.5412-1-yangtengteng@bytedance.com>
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
 net/core/sock.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/net/core/sock.c b/net/core/sock.c
index 347ce75482f5..b817ac711bc9 100644
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
+		charged = mem_cgroup_charge_skmem(memcg, amt, gfp_memcg_charge();
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

