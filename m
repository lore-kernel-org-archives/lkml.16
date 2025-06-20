Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56EAE28B401
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 12:57:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750424241; cv=none; b=GzijQ+q08ZErqsjhJBoDd4C46bHd4MlGWvULKCkOCtD7VskvlcaUlINdGn7iuqhk8e8SOZGX7oHjXlUF5A20xNPFXtpS91qyt0ByLSd/cynlvivOM5DKWorEaxmG+mlZncikLGJtPzqA6M7RXhFrioL4Fn/BKuatEt/bo3tykao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750424241; c=relaxed/simple;
	bh=h1Lx9BtllgbHMXslsEDvgb+A/wH9ZFt3qOuXTsnFjY0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MZPUCIqBSB7OrUE2JIx+YeLNcmKP2kvfwjCwQaFZO/jixEDVLMjPdHQQNFzEVvewC68WesluJ/lg4SGYamVgzjJDO8ctQwTn++1Ur/BsSecB+MdDoI3Ov2ZNIEDAP/31I+iqZcAxhyoinB10ZlraMnjVi5JVBhwsc62Yw9e4qA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=WUs1BIcP; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="WUs1BIcP"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4531898b208so667715e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 05:57:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1750424237; x=1751029037; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9j/1TvZb5zWsD2raxNDSeRcAefWFoUs0heIcEmxtO4U=;
        b=WUs1BIcPRHztJ77K92WZxXgiz1uKgkVpgiUcJ12qpLkDzdLa7gqiLdwiPgP84sOtRG
         wgnvCkTr+LhdoCb9LVl2/3K9pPBOMxrt1LeCfcYVIK6LrM5Vm513cJ839pX+fw8VtnvK
         S1Mp3kUgP7UmYg3oL63p4/Hrb162+DgvQbtxSYBECYH6c+7EhEQM4bwpD5SiNAX5oyoU
         91feh4lbtrKR7yizgb1dgV4wTARJJzfo5sMkek8VsyjlkA4d5RFTxMcpQPLqNIZCF7/+
         m8YCWknLrjx7GE3xTkK1NiTjkkqgMkA3G4rrQ1nANc7Ig/udmtXG2Y+jYcVE3alAHcZl
         E0lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750424237; x=1751029037;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9j/1TvZb5zWsD2raxNDSeRcAefWFoUs0heIcEmxtO4U=;
        b=BjbQ8UIM1fBMQIm+9LFXaT5t6S+3pVpkcGhFlzMSbYtpSMBHT6kmah69Rm0eoCQ8LX
         UqvBW0W1hINVbk0NohY9S9Xv+IAqJGHhKcNBa5DzcqN/sfEHHYlNz61Lz1rVzCxrGk1d
         KoCflRm3flBD7X2z/Rq4OUs87EnudvrznD3cICp2jcB8hlTVXXhVWtCeLlk4Zib6j13r
         BT58WxhIQHKrKiuRwP8BogghDHjd1EKk1CEaOT6qHegsOmgEsDlSaIQljSH4qGQdpRiB
         RPHstQD4kiJuVXOZGvoLT60I6V1IFttM9oYmVzLmJdOrmONjLy1Ij8nyvC/ZLuzHyKpT
         t9qA==
X-Forwarded-Encrypted: i=1; AJvYcCWMw2ON2jg8lupbPPttz0wN5mzezRgysrOMTlLpsythJaogJF623pYcDrQFu2B3gKAiPdZrPpZK1DObv8w=@vger.kernel.org
X-Gm-Message-State: AOJu0YwDRFHSiIVaugUX+aXyjVzFk7b98mwoMD/1nQ9+4rSVssS8LXDC
	UkHPHAjjs8Vgmy87vTtWLgEfqqhBQCmA1C0EQV472mM039RgI7tb8f6sVoytQwTdN9s=
X-Gm-Gg: ASbGncv9WPFnuEx9n8Z/Y3us2qgMev4Tmipr5T+2sZhfyGDfaUvCAxu0AofBF+fOvRq
	lZQJtYzHMk8wunlX0NYao4aiTU5c43/nW243SKkL0DYzhwjDj4hxSrQxf14vR1qKxry0aBOIxQN
	r+WioYbq/FiALNrouMwjdCqEt9MJuV47oiCLTdlX1aGrB9sO8UqmfKgtwpMXwj9Ssh3pMWanyi2
	2h5GHIVKfDaQwGGys6mPmPP7ue2GNexIqBz97Ic6ACKsjiJ+mtiZqEahcv9UnkSR8Mlf+kjr3a5
	uJAtnIxo2FShspsPB7DvwzrcBgz0atFQcbQebKcDLrV6XaOYSDo+Mw0HnTnlY0crgZYOmrMCGyr
	ox7RdW+KqF8lGcg8tFFtr2bOcFxsme9Y/ZMgoV/ofX5N7kfKX8U9N
X-Google-Smtp-Source: AGHT+IEBq5FvdvdbQvPSalNvnURcvKh16deA+9bWDSK++yD/dZFeq/hlc8ggqHnnWpkb/xlZvvRZGA==
X-Received: by 2002:a05:600c:a317:b0:439:90f5:3919 with SMTP id 5b1f17b1804b1-453659d4960mr7324405e9.4.1750424237402;
        Fri, 20 Jun 2025 05:57:17 -0700 (PDT)
Received: from localhost (dynamic-2a00-1028-83b8-1e7a-3010-3bd6-8521-caf1.ipv6.o2.cz. [2a00:1028:83b8:1e7a:3010:3bd6:8521:caf1])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a6d1190b00sm1955829f8f.87.2025.06.20.05.57.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 05:57:16 -0700 (PDT)
From: Petr Tesarik <ptesarik@suse.com>
To: Paolo Abeni <pabeni@redhat.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Neal Cardwell <ncardwell@google.com>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	netdev@vger.kernel.org (open list:NETWORKING [TCP])
Cc: David Ahern <dsahern@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-kernel@vger.kernel.org (open list),
	Petr Tesarik <ptesarik@suse.com>
Subject: [PATCH net v2 1/2] tcp_metrics: set congestion window clamp from the dst entry
Date: Fri, 20 Jun 2025 14:56:43 +0200
Message-ID: <20250620125644.1045603-2-ptesarik@suse.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250620125644.1045603-1-ptesarik@suse.com>
References: <20250620125644.1045603-1-ptesarik@suse.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If RTAX_CWND is locked, always initialize tp->snd_cwnd_clamp from the
corresponding dst entry.

Note that an unlocked RTAX_CWND does not have any effect on the kernel.
This behavior is even documented in the manual page of ip-route(8):

    cwnd NUMBER (Linux 2.3.15+ only)
	   the clamp for congestion window. It is ignored if the lock
	   flag is not used.

An unlocked RTAX_CWND was updated by tcp_update_metrics() until v3.6. Since
then, only the newly introduced TCP metric (TCP_METRIC_CWND) has been
updated, rendering unlocked RTAX_CWND useless.

TCP metrics are updated after a TCP connection finishes. If there are no
metrics for a given destination when a new connection is created, default
values are used instead.

This means there are two issues with setting tp->snd_cwnd_clamp from the
TCP metric:

1. If the cwnd option is changed in the routing table, the new value is not
   used for new connections as long as there is a cached TCP metric for the
   destination. An existing cached metric is not updated from the routing
   table unless it has seen no update for longer than TCP_METRICS_TIMEOUT
   (1 hour).

2. After evicting the corresponding cached metric, the new value from the
   routing table is still not used for new connections until one connection
   finishes, and a new cached entry is created.

As a result, the following shenanigan is required to set a new locked cwnd
clamp:

- update the route (``ip route replace ... cwnd lock $value``)
- flush any existing TCP metric entry (``ip tcp_metrics flush $dest``)
- create and finish a dummy connection to the destination to create a TCP
  metric entry with the new value
- *next* connection to this destination will use the new value

The above does not seem to be intentional.

NB there is also an initcwnd route parameter (RTAX_INITCWND) to set the
initial size of the congestion window; this patch does not change anything
about the handling of that parameter.

Fixes: 51c5d0c4b169 ("tcp: Maintain dynamic metrics in local cache.")
Signed-off-by: Petr Tesarik <ptesarik@suse.com>
---
 net/ipv4/tcp_metrics.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/net/ipv4/tcp_metrics.c b/net/ipv4/tcp_metrics.c
index 4251670e328c..dd8f3457bd72 100644
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

