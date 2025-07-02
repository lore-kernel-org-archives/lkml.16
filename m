Received: from mail-qv1-f73.google.com (mail-qv1-f73.google.com [209.85.219.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD9912D0C65
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 16:07:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751472469; cv=none; b=muJypofQXPxOHB3cMBqdztkVGZ0nZIwKbnVIFXkyMSj5Y4w8U0hYrxSeYb7mJ5D0A+FOXqXH9SZwzt9ssFRDbh8bXnlRrS7phEynn/sGTnxcUHJUVfTl/r9hxNvKms0FBBj026QFmH0y6uNwQqwGAJ8RZc7fcdKRjSDwv9rdyLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751472469; c=relaxed/simple;
	bh=O6by9/0kauJYWEkgSglvXw/V8coiyjeIzxGi9vuHvLY=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=uCs/JfsDSn0MlxNhne8NBR8kV5/l3bk+c9g5JREehKFkNJWvrPRaCqC4HUfmia0lHXZntYuoIX4xc97n5ohBp9C+9qLeRQybHKqdMO5A1GrUCF1yKMKksOaKCBdgb+NwDmZyPxVkU6mEAGhO/Hhi48UFQHI1Q7Q9jmSQSeZ5B94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--gfengyuan.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=fipUxRVm; arc=none smtp.client-ip=209.85.219.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--gfengyuan.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="fipUxRVm"
Received: by mail-qv1-f73.google.com with SMTP id 6a1803df08f44-6fd5e0bc378so128915596d6.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Jul 2025 09:07:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1751472467; x=1752077267; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=SpkubWRCAgA3n9kTQKYoyEm6Wf3b95Ji8UJpkdBVSfE=;
        b=fipUxRVmy6wVOCKuvi82XMq93LABnoVVGyqkqJALogfYlsso3sQLDZlLzyYT+Z/B2s
         fEHhucflZPzO+gUKjBzv63h3Scb5a5MAx1ORmKjoF9CL81HNbgpX6QyS7ej3yu2jAMom
         Pipn7mRimJ2OEGNL1X68JH8EF84CfrdIhhyfFuvISEjbM84K2E9szCwKvFz4V1R/voVD
         dRgxQ2wnRpTcrHvE0x/mWWbT93J53vqwRUh6nGV0kVaUyICSWvgMywJudf3EJ1QE7GlQ
         NGCYS89J68EcgZuOUwkfuFpqdKbRsghFA0S70GFsGV0tXUY223gjyt4lTfNrciLKSCAg
         Kwrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751472467; x=1752077267;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SpkubWRCAgA3n9kTQKYoyEm6Wf3b95Ji8UJpkdBVSfE=;
        b=osT4wKCWY6osMVCbTBvDmDc4M6bWOVx5MD8RDQljd0UprQm0/dwWGlz1SAQysnlBbL
         RPPUePT0gc8QeaVdN5P20A8s8uj8sFS2PDcPLV+0gOu0iCSj5/tlwxd/ptVXAH+e+gXr
         Kt+fpBLD5naKo+Y8hZ/ReEVZn7WJyoBDNy7OSQj0X4Qa+BRQxqGfY7rbHFHJ31+faTBi
         ET4biImUvASp7OmXYYwZMYy8ajIMsvNsaU43cIF4+4LBuE7OfIR+Huy8Kg86Y46nE/43
         ZNcyrzlYf/uUatYCe0ctN0eckYe81tJNmwBfMlsfMlqzu2nZJJVo/NFaV+FVp2Rsfjg7
         RdJg==
X-Forwarded-Encrypted: i=1; AJvYcCUjzRu3HAD2ztegTdJj975L7f/Kzkkd0hIlWXVTgQI5BCHqQf/mBCxVouSNc3MIJXIaQsS8DE1fz03est4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyPYPQ8VJqLMrZUzsRaH8qsvrAteCbxqsaPJA2GRyMEkm1MaLLK
	lbx4ya32qHhcwRX2CWF2CjTDKR/Ib91kOwRfATcy9J1bBh7wtm1vy8vh5nrY51w+TZOdeu4NGBr
	nY8p8ylm0EdsmQNxIuA==
X-Google-Smtp-Source: AGHT+IHGNihSVZdYeWYYvtq4JoWLcrdHbmonFDlPgo0zGbDWddFZcCsax7mf8uhd5h7l7WG3jcryV6vZXPJM6UE=
X-Received: from qvbpj1.prod.google.com ([2002:a05:6214:4b01:b0:6fd:50bd:be0a])
 (user=gfengyuan job=prod-delivery.src-stubby-dispatcher) by
 2002:ad4:5e8a:0:b0:6fb:25f:ac8c with SMTP id 6a1803df08f44-702b1b71361mr56520516d6.31.1751472466382;
 Wed, 02 Jul 2025 09:07:46 -0700 (PDT)
Date: Wed,  2 Jul 2025 16:07:41 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
Message-ID: <20250702160741.1204919-1-gfengyuan@google.com>
Subject: [PATCH net-next] net: account for encap headers in qdisc pkt len
From: Fengyuan Gong <gfengyuan@google.com>
To: Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	toke@toke.dk, edumazet@google.com, "David S . Miller" <davem@davemloft.net>
Cc: Jamal Hadi Salim <jhs@mojatatu.com>, Cong Wang <xiyou.wangcong@gmail.com>, 
	Jiri Pirko <jiri@resnulli.us>, Stanislav Fomichev <sdf@fomichev.me>, 
	Kuniyuki Iwashima <kuniyu@google.com>, Ahmed Zaki <ahmed.zaki@intel.com>, 
	Alexander Lobakin <aleksander.lobakin@intel.com>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, cake@lists.bufferbloat.net, willemb@google.com, 
	Fengyuan Gong <gfengyuan@google.com>
Content-Type: text/plain; charset="UTF-8"

Refine qdisc_pkt_len_init to include headers up through
the inner transport header when computing header size
for encapsulations. Also refine net/sched/sch_cake.c
borrowed from qdisc_pkt_len_init().

Signed-off-by: Fengyuan Gong <gfengyuan@google.com>
---
 net/core/dev.c       | 5 ++++-
 net/sched/sch_cake.c | 5 ++++-
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/net/core/dev.c b/net/core/dev.c
index 11da1e272ec20..dfec541f68e3a 100644
--- a/net/core/dev.c
+++ b/net/core/dev.c
@@ -3944,7 +3944,10 @@ static void qdisc_pkt_len_init(struct sk_buff *skb)
 		unsigned int hdr_len;
 
 		/* mac layer + network layer */
-		hdr_len = skb_transport_offset(skb);
+		if (!skb->encapsulation)
+			hdr_len = skb_transport_offset(skb);
+		else
+			hdr_len = skb_inner_transport_offset(skb);
 
 		/* + transport layer */
 		if (likely(shinfo->gso_type & (SKB_GSO_TCPV4 | SKB_GSO_TCPV6))) {
diff --git a/net/sched/sch_cake.c b/net/sched/sch_cake.c
index 48dd8c88903fe..dbcfb948c8670 100644
--- a/net/sched/sch_cake.c
+++ b/net/sched/sch_cake.c
@@ -1407,7 +1407,10 @@ static u32 cake_overhead(struct cake_sched_data *q, const struct sk_buff *skb)
 		return cake_calc_overhead(q, len, off);
 
 	/* borrowed from qdisc_pkt_len_init() */
-	hdr_len = skb_transport_offset(skb);
+	if (!skb->encapsulation)
+		hdr_len = skb_transport_offset(skb);
+	else
+		hdr_len = skb_inner_transport_offset(skb);
 
 	/* + transport layer */
 	if (likely(shinfo->gso_type & (SKB_GSO_TCPV4 |
-- 
2.50.0.727.gbf7dc18ff4-goog

