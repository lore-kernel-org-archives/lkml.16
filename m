Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 452302D238C
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 10:20:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749810042; cv=none; b=jgrnv27bGG02G93prrjzDD1ggMSrQfoOe9mNcK62Cbtk96yAq4coPPqhbYpYHA5FL0EPGQAtDQyw+9730CeP529jZJcwUpZXIkGdy420+mTzxmxBY0sE5NOkRH2Aw/P1ffSH8IMA80DTU2Wtfps+nQCxkfQqj5h2eNoBvph6vao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749810042; c=relaxed/simple;
	bh=QTrczzzIADGGhXZs1RyepLDlSuNI1nJRFJX9yYFYx0g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=K4oDYz8GDknXwB8D1k5/n4t+RsQAsMhRPVQnONCAXm+nj77Fa9ySg8xWaQSl8UjKPSeSxs64EmX2JYKerekBo4IXaCiESZMs45udxYt9dHgq+tYahf6QuEHMBvk9UomnycqzEjLL+mhgQUx8Xw0ybpHdKeGVDvN7AEvwKw0DMF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Gw8DpVy7; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Gw8DpVy7"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-ad56886dd60so22273466b.2
        for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 03:20:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1749810038; x=1750414838; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BHGVmva+Xy6qyuinlqeBQ2q+u47g3zQhlkKKsvoN8Oc=;
        b=Gw8DpVy7AJ3xj9SIl+7sRZ99a0LBwxMTFMWKAKMQVR087HW71COYOBWfRZbobNTTTM
         26xafrddQGfQO+TMjI72k4HW7AdL1dZtm7z4GKdlWP3AJhCJEB9brJskb7zgO4VBSr7Q
         0lTNexjG+LRxMHmeBCsGIDBCcaLXtudpGaH8DRIBmPab9o/34Fyl2CdV1fod/vo9o/x1
         9ykZGvsfOosa7MXwTkd3RP5IZvlQMMOkArZcOUmNC3GHmR1wBxD4XZ9K1ofJ6pce3Qwh
         Q81gcJVufQW2Su/jcyRCPwsATVnMM4D1ZGZGIwhZgeV+pV9CDCWneV+aP0wcz/qBnuoN
         0GnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749810038; x=1750414838;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BHGVmva+Xy6qyuinlqeBQ2q+u47g3zQhlkKKsvoN8Oc=;
        b=K0XnQnCM8NMlIjAD+gilppkCpyZaOmNkE6dQ3naUePVhTCQR75AavtnrzTeX3utqE6
         CDV427EpzR3RLx+Z6PMgw4A5zh2c2W2PKLaLBcvcL+Z8vSua6lxK1WaNP1Y1SZaAsLDs
         QH+MNbIpUscgwlHJcNsj2mo9TujnEQ8dq0arseavmNxuKSphiUVhWgyw7onYyvyv36Z6
         gGkAIYwiRf8gpf/3M74E4Pv0cgVOBC/HWVDdoM9q577fzQlnXXCEDQPcVjGVEkyyamag
         8KK9borEDhq+6nkjBqrv4tOlzGYg1vsMmuB4dLuT6OLZKoM9RWNwLEC2Z6iaAxhVM9vG
         kBFA==
X-Forwarded-Encrypted: i=1; AJvYcCU/d1mQHgoBzix0LEq/9kus6VXSreX3d5trVmkHM8xt4uUQSJkv7/h//JzMkfn1bItzo7qQmb2/HufT6sM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyw4RWeAsnXnkfiMV6fHjk1KeU/gdo6EY9mDhNVDMlWjWwRn/MA
	l1YC/eFLvv3rPdKp2W4yv8Q62R3iIHoiu/H0k6J4Tj46917FphetoK69I6juDr8sG7YsuBWNXPM
	SIU3088w=
X-Gm-Gg: ASbGncsQV5DA8QNmXR7oI1KzlEq4e4L0dA6CMZeZPx8X8LzrSA6akrCOR4ergFLaMu3
	6Bvd/WbbmlZqi4PeOCCZuieqO5ECYdgy7wHq+zh3mZL1V1MCQSY3MKJV+TOPfxdS660bXlJX6QL
	MU/k/Dohrc1cKS+h0p4BISgcrtDkee7/atyqUSuyo45JTACq38o2CHsoapfhMNPTs6yZzacBkkB
	BzEqtKmHHH0Qpr3I8eSEemq15Etj0RoDrCq9nnSpsNcCOy/5wQw2u/ZTld0LH+4Tr/1XkydFTyG
	O35CTQZsmRBDsvsoGF08wSV1HWCgZsSwcL3oJDNWCVZ/xexF2xHjd6r6xCbDl+mIB55vM2uHNNq
	LsK2aOjSTI+Ulxq91SRPqyyDoWYpcUznoxFRhYpGNBJOUoHRRF88r
X-Google-Smtp-Source: AGHT+IHERf48fkRQ7vR8j9BzlqUyFKtoSyqYNQsQlUq5+9EMSNWiLqNvIUxQG1VGlqq6lCv6XDF1iQ==
X-Received: by 2002:a17:907:2d14:b0:ad8:a07d:1729 with SMTP id a640c23a62f3a-adec55407fdmr89023366b.7.1749810038441;
        Fri, 13 Jun 2025 03:20:38 -0700 (PDT)
Received: from localhost (dynamic-2a00-1028-83b8-1e7a-3010-3bd6-8521-caf1.ipv6.o2.cz. [2a00:1028:83b8:1e7a:3010:3bd6:8521:caf1])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-adec88ff61csm104205366b.78.2025.06.13.03.20.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jun 2025 03:20:37 -0700 (PDT)
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
Subject: [PATCH net 2/2] tcp_metrics: use ssthresh value from dst if there is no metrics
Date: Fri, 13 Jun 2025 12:20:12 +0200
Message-ID: <20250613102012.724405-3-ptesarik@suse.com>
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

If there is no cached TCP metrics entry for a connection, initialize
tp->snd_ssthresh from the corresponding dst entry. Also move the check
against tp->snd_cwnd_clamp to the common path to ensure that the ssthresh
value is never greater than maximum cwnd, regardless where it came from.

Fixes: 51c5d0c4b169 ("tcp: Maintain dynamic metrics in local cache.")
Signed-off-by: Petr Tesarik <ptesarik@suse.com>
---
 net/ipv4/tcp_metrics.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/net/ipv4/tcp_metrics.c b/net/ipv4/tcp_metrics.c
index dd8f3457bd72e..b08920abec0e6 100644
--- a/net/ipv4/tcp_metrics.c
+++ b/net/ipv4/tcp_metrics.c
@@ -479,6 +479,9 @@ void tcp_init_metrics(struct sock *sk)
 
 	if (dst_metric_locked(dst, RTAX_CWND))
 		tp->snd_cwnd_clamp = dst_metric(dst, RTAX_CWND);
+	val = dst_metric(dst, RTAX_SSTHRESH);
+	if (val)
+		tp->snd_ssthresh = val;
 
 	rcu_read_lock();
 	tm = tcp_get_metrics(sk, dst, false);
@@ -489,11 +492,8 @@ void tcp_init_metrics(struct sock *sk)
 
 	val = READ_ONCE(net->ipv4.sysctl_tcp_no_ssthresh_metrics_save) ?
 	      0 : tcp_metric_get(tm, TCP_METRIC_SSTHRESH);
-	if (val) {
+	if (val)
 		tp->snd_ssthresh = val;
-		if (tp->snd_ssthresh > tp->snd_cwnd_clamp)
-			tp->snd_ssthresh = tp->snd_cwnd_clamp;
-	}
 	val = tcp_metric_get(tm, TCP_METRIC_REORDERING);
 	if (val && tp->reordering != val)
 		tp->reordering = val;
@@ -537,6 +537,9 @@ void tcp_init_metrics(struct sock *sk)
 
 		inet_csk(sk)->icsk_rto = TCP_TIMEOUT_FALLBACK;
 	}
+
+	if (tp->snd_ssthresh > tp->snd_cwnd_clamp)
+		tp->snd_ssthresh = tp->snd_cwnd_clamp;
 }
 
 bool tcp_peer_is_proven(struct request_sock *req, struct dst_entry *dst)
-- 
2.49.0

