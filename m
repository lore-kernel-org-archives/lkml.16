Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBFCD2C15A6
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 10:20:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749810040; cv=none; b=tzvsRTn7DDci2SzrtWo0qFfrXrALZgBNV9wCSv/DUkMGx2H13XEqaD0SN5MvCxizC9rbaIYJ+wVe9dcBFGDO/mDr3GgjHtr0UGyYDVLn5FNR2BBA26GgKijWCeZsVHsZIqLHvnYYRxpSIQ0JKlTZf9kLHSrTqzPn/baJeko9ysU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749810040; c=relaxed/simple;
	bh=eWmogYyF6BR0pB/vtQAb/50StEIt8m85cxiJ2C0zPnw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DPKstxbzmVasRCQpIhzoWMcGmG7xzVEIQ1dRgIBdm8AUSv70DZ7Y/be+43L62zVG0xoEUCiGj+NoFMzeFC95ndobZIGsfarohV8Dy8XRmrtolAo38QZH74/+5HvixAFI1GA3G9r0pmMW+E2cqCG+kwKi6ifpNcnvrQKCbcUSSVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=AP8dYg4I; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="AP8dYg4I"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-ad89c10dfabso55079966b.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 03:20:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1749810037; x=1750414837; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WkwIwMnAdWBOffUiivU29CEqPbHaLRq/epKBsq5mAyA=;
        b=AP8dYg4Ide+TlCUz/qh0evJF9k3vuXiADWQGbLJ4bTdx7FqCdJ1JI3E1LUvgitko3N
         w7TcKaaDe7ShWm3C1AkmdNeMoVk8//jqUfIpfJ9K1jnMGN62FnyKU+/2DLiTdITxFcDZ
         RMyzhIyb8CBzSXP+aTHgp/58Mvl/lxBIC7Y7OYUqMuO4GzN7TDMtOC8UuMHuhoEj+rmP
         vbJkFguPA/W52y3OueLHSyf6EBKcMI2CYecYBQA/P7YshmH0+y0PUQc0IIjmqqy7/TIc
         zbHzyeiXPCMiEdAn8DjFCkAdcsl0XoDqIDs1BLXuHdhBizZu+RF6FzJCpOAivRG280vH
         UO4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749810037; x=1750414837;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WkwIwMnAdWBOffUiivU29CEqPbHaLRq/epKBsq5mAyA=;
        b=a6KUXB2m86rO8xeddpLcR4KC4BdPc9mdODAJil4ekhSvk8zNS/34GSFqsHW9dXM7qN
         oU5qylWh92kQVrF70KXGQHFJn/oD4nVFwuwCSXNPtxgBWcW85X2/Z4P0iNh9lapeeKCF
         DHSnKXVUTffGdHH1EPXBDx8gOHOYeCm//h3bWFt7HCEhrBwsB4uvcFV97tFBw5O53lNT
         ZxCoE3vNH3PFQjXrj24aqTMOqremFacX8OX1dJIXQqIT1owLisnfZV9W29Ta1tvi7zoq
         dKwCyyphMMA3R+I/fWzLIRHxsOebBZRhmNOwlfY48F1Yc0PoX13afrhVnzKN0Zc9EFAL
         H/5w==
X-Forwarded-Encrypted: i=1; AJvYcCVq7GkZYG2qbXBDV6VHjZ5g8Oe2Ie7GwJcD3zBRpEH3ZfRpre3fI5fy8h3fdAlwF9czqgkjZ4AfcBiHQA8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyxHIkrf9YcSWihmm2oGN9/izAmkR8j5Mxh6+Sw30i+S4AuGhIQ
	YAT5CUDJlSj6smgLX+JVR3CWNd7ULWBt7bbJecgb06xJl6DtWjbnZ8bf0i6w+/dfJ2Q=
X-Gm-Gg: ASbGnctXyqGP2JqkOS1sb3BsU1/z7sjHUcKYFOAJEAxtlheP/VUGKzMQFgTMN1aKGlL
	a2s5Kvrr7q1E4pf6U+aEZHeOFpxZKHTnQYhEuth57Y5CKeoGwB+5A+pLp6Cl8KzyaXPqtA5lnzL
	/rcPlmGdvAcdJB/IVL4MUboUsDoI1RaO7aHtT7tEi4t0LtnrFr+q132rsQpPbE5fE7r4tgduoT5
	JsVn3ZmeDyQ82q2Bt4DhqQpGkZm4CD3DlDmGUeKRKiuLutIlITNlEzmn2pGhkpVtzk41ZndmekZ
	Qiw8fem5qe4ZtgtgOlAAy1puJzvTbhRSV0QQVuyyF4WO0Y7fKKOwnEI5DHoY1X+OYToIQ6+zKLc
	g5c4iUOPuX6iFsqHswn4e8m/ZgKbCykkY+Q+Z+Nb3qgCyxCts16pD
X-Google-Smtp-Source: AGHT+IHrXTZARRY8MkGg/fQ94LWTE1yEeuw9ck2Mt1QfxwwvcPD1Lp9pKEwFLJkfrD9X8UgSnAQYAQ==
X-Received: by 2002:a17:907:7214:b0:ad8:89c7:61e2 with SMTP id a640c23a62f3a-adec555fe4fmr80510066b.8.1749810037143;
        Fri, 13 Jun 2025 03:20:37 -0700 (PDT)
Received: from localhost (dynamic-2a00-1028-83b8-1e7a-3010-3bd6-8521-caf1.ipv6.o2.cz. [2a00:1028:83b8:1e7a:3010:3bd6:8521:caf1])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-adec88ff265sm105300066b.95.2025.06.13.03.20.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jun 2025 03:20:36 -0700 (PDT)
From: Petr Tesarik <ptesarik@suse.com>
To: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Neal Cardwell <ncardwell@google.com>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	netdev@vger.kernel.org (open list:NETWORKING [TCP])
Cc: David Ahern <dsahern@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-kernel@vger.kernel.org (open list),
	Petr Tesarik <ptesarik@suse.com>
Subject: [PATCH net 1/2] tcp_metrics: set maximum cwnd from the dst entry
Date: Fri, 13 Jun 2025 12:20:11 +0200
Message-ID: <20250613102012.724405-2-ptesarik@suse.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250613102012.724405-1-ptesarik@suse.com>
References: <20250613102012.724405-1-ptesarik@suse.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Always initialize tp->snd_cwnd_clamp from the corresponding dst entry.
There are two issues with setting it from the TCP metrics:

1. If the cwnd option is changed in the routing table, the new value is not
   used as long as there is a cached TCP metric for the destination.

2. After evicting the cached TCP metric entry, the next connection will use
   the default value (i.e. no limit). Only after this connection is
   finished, a new entry is created, and this entry gets the locked value
   from the routing table.

As a result, the following shenanigan is required to set a new locked cwnd
value:

- update the route (``ip route replace ... cwnd lock $value``)
- flush any existing TCP metric entry (``ip tcp_metrics flush $dest``)
- create and finish a dummy connection to the destination to create a TCP
  metric entry with the new value
- *next* connection to this destination will use the new value

It does not seem to be intentional.

Fixes: 51c5d0c4b169 ("tcp: Maintain dynamic metrics in local cache.")
Signed-off-by: Petr Tesarik <ptesarik@suse.com>
---
 net/ipv4/tcp_metrics.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/net/ipv4/tcp_metrics.c b/net/ipv4/tcp_metrics.c
index 4251670e328c8..dd8f3457bd72e 100644
--- a/net/ipv4/tcp_metrics.c
+++ b/net/ipv4/tcp_metrics.c
@@ -477,6 +477,9 @@ void tcp_init_metrics(struct sock *sk)
 	if (!dst)
 		goto reset;
 
+	if (dst_metric_locked(dst, RTAX_CWND))
+		tp->snd_cwnd_clamp = dst_metric(dst, RTAX_CWND);
+
 	rcu_read_lock();
 	tm = tcp_get_metrics(sk, dst, false);
 	if (!tm) {
@@ -484,9 +487,6 @@ void tcp_init_metrics(struct sock *sk)
 		goto reset;
 	}
 
-	if (tcp_metric_locked(tm, TCP_METRIC_CWND))
-		tp->snd_cwnd_clamp = tcp_metric_get(tm, TCP_METRIC_CWND);
-
 	val = READ_ONCE(net->ipv4.sysctl_tcp_no_ssthresh_metrics_save) ?
 	      0 : tcp_metric_get(tm, TCP_METRIC_SSTHRESH);
 	if (val) {
-- 
2.49.0

