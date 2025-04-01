Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A40F3202962
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 11:57:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743508671; cv=none; b=KKsLKHIUcibTF4pV2yrLU+DWUkQnZjLpYdmz5RZQ1oinkAv5v1CuumlBb7Tq76WdFFNjYmofPLTVqTYq7REbTj2yrDY3yUUUHsoGvt2wwjDxoeCYiXqmClwwV8o8ELUARrdPovEn7ZZzr5Ttm0qVFFani+3+d0w9Wv2NRvMj3QY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743508671; c=relaxed/simple;
	bh=VK+fAhdQMlQ7VgF66YAdeZfWP2MQ7T6BVegVmMM36Xg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Yh6yNt5j+Ef1oyy8Gna9t2Mtmm3Z6kh881XWpQOv0LFjFOexOJ0k4JQjnyHbw4t7de41Y+ukpv9mOS6gVc5CHh3AGOmfUPx+1PQSCys9WLA1rBXEQGGZ+YHG788xA7JjE4WRKeiL+UayKsW4HIoLGJBkX60FmuJvGsMq2h+x7FY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Flqb95Wh; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Flqb95Wh"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43ce70f9afbso56716285e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Apr 2025 04:57:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1743508668; x=1744113468; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7JL5RckWDUXDVUtbygqah1s+l5iawSiiKQxqaHFxngI=;
        b=Flqb95Whxarxx1y2zVRSDYwRML1hN7aXeN35K4bl8fDUlJqo/VG3VJ4g5+Pmm34uDQ
         IzJbI0zMYE7CP1btv9zVFz9E2UquF9+C3vhtnGEdshBfOq7jupORYeZ3YrKvakx+0iPA
         dIq3XWbINFY4RWuJPRvmAIHVBWfP1bmr0jKp7vfDcsv1PWLIaF2wDvb4XFGYBbpTOQLB
         W1Dv7r10XCjb2IyazhBtL04RFQJNlheJNdyNZ6ZiAvqCpcc6+ebT6/qhqm2npQwqwW2u
         cVuxru68SXS7cQVDncdlwPM4K+tN7hO1V7kr4w5OMkzp4JWw/4y1lAYZ/MpwTdNAR9PR
         3e2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743508668; x=1744113468;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7JL5RckWDUXDVUtbygqah1s+l5iawSiiKQxqaHFxngI=;
        b=lx3zZtnvVlcHnwm9jQgL4rOX5KkIeF+aK/pH/vvVf8Gn2IR1aAeb3bzy8p8L6J3t7f
         Q8LG4Vcru6IfH2ioYldpzqM4BCRZVHv5z1Z/kataHQHibTL13ygIoN9rKWnKLyWoOGXY
         X1C0r3mUjLeD1EEaYZvrskCHnVZ9ixyegfuelD+9W25+QvG4/77Uv1NeuhZI56lBarLN
         rFp6DHwQclZetvMgPkkE7E3Gg3Rna1sGPQ7VZ7ckCNbMSfcK4RvjvwloNiTjCPPw7Bxl
         hnr41r5sGTcZLrWlUykQg342vOvSEyQyb0Xl9hSCs9254OeraA2K8SBRW9FQxk9tXphh
         2Veg==
X-Forwarded-Encrypted: i=1; AJvYcCUgYlhI8tuX6EwmVnhvqYPu6IEyMZ/2CuKQAztfFslD8LATwvL8OD1CpZNdLFymiezKeUvAUzVUCW1xMKU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzspwLwcbQ392v1sxSywmhhjsusQpCnz5FPscI++LSw6BmTRF3c
	cwouvoqaqexO5kGDS4dZFsDHsjBh0kAM8pPS9vRsVqXeSvm9E/koEgkb7dlmv60=
X-Gm-Gg: ASbGncvi/gFqsUld8KMS4bjB//c6TkrNXULz+yxoRBble0SEeH1P73jgCk7pLlA/wN3
	Ouky9Q4kyHwwLbr15BnOyDXq+aDrj7D57RJxlPTgJRrB9ZGVlwcWtpC+owOlta0BMEVP2NT/Ydy
	wQnGF7mNk/U9HwQxHI+csVlObI4M5W0ZqEW0nNEAsigSgm2kiM69BZ2l0zPluOtxblmMdE1+mpe
	lDtTa6DBsRp+0Dpy3Cv2TFchMqLA2HqDrM/7BDIfvo+RXBKBKsutFOvcDCbe5TiK2n606UiBjas
	ZSALaUmElWW1U3HKb+jADDnHJZ3gzRkTh9fbsOhmL3/5Rzw=
X-Google-Smtp-Source: AGHT+IFLfOc6mWYMvUI2usLmBhWmFn3VeupA7JlTfwgrP5x7X9un5A68VjtyMV5CDIEoULbCkYWxhg==
X-Received: by 2002:a05:6000:4282:b0:391:1652:f0bf with SMTP id ffacd0b85a97d-39c120f741amr10153656f8f.33.1743508667931;
        Tue, 01 Apr 2025 04:57:47 -0700 (PDT)
Received: from blackdock.suse.cz ([193.86.92.181])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c0b7a42a3sm14130150f8f.91.2025.04.01.04.57.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 04:57:47 -0700 (PDT)
From: =?UTF-8?q?Michal=20Koutn=C3=BD?= <mkoutny@suse.com>
To: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	netfilter-devel@vger.kernel.org,
	coreteam@netfilter.org
Cc: =?UTF-8?q?Michal=20Koutn=C3=BD?= <mkoutny@suse.com>,
	"David S. Miller" <davem@davemloft.net>,
	David Ahern <dsahern@kernel.org>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Pablo Neira Ayuso <pablo@netfilter.org>,
	Jozsef Kadlecsik <kadlec@netfilter.org>
Subject: [PATCH v3 2/3] cgroup: Guard users of sock_cgroup_classid()
Date: Tue,  1 Apr 2025 13:57:31 +0200
Message-ID: <20250401115736.1046942-3-mkoutny@suse.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250401115736.1046942-1-mkoutny@suse.com>
References: <20250401115736.1046942-1-mkoutny@suse.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Exclude code that relies on sock_cgroup_classid() as preparation of
removal of the function.

Signed-off-by: Michal Koutný <mkoutny@suse.com>
---
 net/ipv4/inet_diag.c      | 2 +-
 net/netfilter/xt_cgroup.c | 9 +++++++++
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/net/ipv4/inet_diag.c b/net/ipv4/inet_diag.c
index 321acc8abf17e..886dbe65ed9e8 100644
--- a/net/ipv4/inet_diag.c
+++ b/net/ipv4/inet_diag.c
@@ -160,7 +160,7 @@ int inet_diag_msg_attrs_fill(struct sock *sk, struct sk_buff *skb,
 	    ext & (1 << (INET_DIAG_TCLASS - 1))) {
 		u32 classid = 0;
 
-#ifdef CONFIG_SOCK_CGROUP_DATA
+#ifdef CONFIG_CGROUP_NET_CLASSID
 		classid = sock_cgroup_classid(&sk->sk_cgrp_data);
 #endif
 		/* Fallback to socket priority if class id isn't set.
diff --git a/net/netfilter/xt_cgroup.c b/net/netfilter/xt_cgroup.c
index 66915bf0d89ad..c437fbd59ec13 100644
--- a/net/netfilter/xt_cgroup.c
+++ b/net/netfilter/xt_cgroup.c
@@ -117,6 +117,7 @@ static int cgroup_mt_check_v2(const struct xt_mtchk_param *par)
 static bool
 cgroup_mt_v0(const struct sk_buff *skb, struct xt_action_param *par)
 {
+#ifdef CONFIG_CGROUP_NET_CLASSID
 	const struct xt_cgroup_info_v0 *info = par->matchinfo;
 	struct sock *sk = skb->sk;
 
@@ -125,6 +126,8 @@ cgroup_mt_v0(const struct sk_buff *skb, struct xt_action_param *par)
 
 	return (info->id == sock_cgroup_classid(&skb->sk->sk_cgrp_data)) ^
 		info->invert;
+#endif
+	return false;
 }
 
 static bool cgroup_mt_v1(const struct sk_buff *skb, struct xt_action_param *par)
@@ -140,9 +143,12 @@ static bool cgroup_mt_v1(const struct sk_buff *skb, struct xt_action_param *par)
 	if (ancestor)
 		return cgroup_is_descendant(sock_cgroup_ptr(skcd), ancestor) ^
 			info->invert_path;
+#ifdef CONFIG_CGROUP_NET_CLASSID
 	else
 		return (info->classid == sock_cgroup_classid(skcd)) ^
 			info->invert_classid;
+#endif
+	return false;
 }
 
 static bool cgroup_mt_v2(const struct sk_buff *skb, struct xt_action_param *par)
@@ -158,9 +164,12 @@ static bool cgroup_mt_v2(const struct sk_buff *skb, struct xt_action_param *par)
 	if (ancestor)
 		return cgroup_is_descendant(sock_cgroup_ptr(skcd), ancestor) ^
 			info->invert_path;
+#ifdef CONFIG_CGROUP_NET_CLASSID
 	else
 		return (info->classid == sock_cgroup_classid(skcd)) ^
 			info->invert_classid;
+#endif
+	return false;
 }
 
 static void cgroup_mt_destroy_v1(const struct xt_mtdtor_param *par)
-- 
2.48.1

