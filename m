Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 192EA24888D
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 04:28:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749788906; cv=none; b=reSejeltN9aIv3z0k/mamk1Sz0c24QZTW8q/08UHDraArgEv3OxaaBOnkkkmyHCKaDrAUu+NLbO1QAGxcGSHT6P/jPdvIHyXakmUuFMnFH0WQfGGlZMpN0DkrNw24Oq/tVLqhpKpFkoGycrbLcOWID7OvwrKyOKN/4dLvmPujHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749788906; c=relaxed/simple;
	bh=cLMFRytwCAbUcsumEZy3rbgGn6MqQQrWrO6EyWB53GY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=n/ZMdUMLSk1CqujCW1zfCme4zPeYpPf2RQPMx1ZbP1sZWY7LFyjyBkWUEsNmqjDZlMhsNQ9rMsft4qAB8cmcKRqYQc9vgEzlVecrwoyESaeKzTU4GomLPvUHs6Ef3SX+7r7IdsPIPutZL39XTU3ahXznRghZtHDsn+Qw53GDmDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=o2xHEDUG; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="o2xHEDUG"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-23228c09e14so22109065ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 21:28:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749788904; x=1750393704; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Xq0DQz/GmNzjKY9rWVYo4cPfcNQII7suJKVz4zh1h04=;
        b=o2xHEDUGMCumw91n8paMImOVbTfnYreertLkKnleDbr5+y9UDSoGfUgMfLpbd1Rh5N
         1KjqnFqaIdoY99PbrYEPLEK0vqVNAlBf4U7Ca963kyLC0YloS7nXGJv+YJIRY2uCHXl/
         RYzo41LXjeeCGQaiRf8NdviVdkgO2jnrQdqYzno5oa/y1BYyYD6WW1Ii1ZStETozN+A7
         Y++Dy0H3I9xCF2WecLfoo8hC2fQBoBmdtFOBDTB0IHLFGJSKfcXjh1qpNOI5O3vo14nR
         qlIa7F3lRBiCRS3eTFLGLoQkBY6jEyD1OSkGcuwC8vKGP4RX869jjxqeyN0mjvlqtmKx
         nfRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749788904; x=1750393704;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Xq0DQz/GmNzjKY9rWVYo4cPfcNQII7suJKVz4zh1h04=;
        b=PfWjtKQVrKSEH1RKbZQNJI08MZuT4s9LgJvgOUKOGvpODSTJsLRW8ro2nGVWybhBdW
         EKuLrDFSVuLKTxYGQgsboYXkuxLuImCjEbym/m06kr0QUbP8YmUABkK58QbOm/lDlesL
         QdJy1xfK/J6jggTvv2sH5yJhDNWkOApPxrAVhwzLTvKglJ1TS86lIjtRia+dlcUgOA7m
         6XasCqrNzmVgX5iQWKLydR+caTR+TRqWpMOQW/7vGKTrohZp6Ru1mqBh2sp/vTOaWZCF
         6xxLdJAkx8UA6MJcbDNkTlLIkYXxve8ep6UmqJcxKPJuombSseqgUdQ/f7ZLnKAjXjSX
         zFgg==
X-Forwarded-Encrypted: i=1; AJvYcCXfq+8IvmHnSsPY5vSKUspxDOCoE+D/XWaxS3HPDHGFUU6PbsvJmmSxdHj5mjrTNt76ANo8gYfav3dhXjc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyCfGZAfT+TDWJkU6kHCzvkau4eHZ8ZY74h+ZYoY50xJNLR9DCp
	TOoDn8WRLdj7zfWBuQe8tdHJ6/jCMgF0TNX70q76IHW0BpTl4zpTaPph7GBFPUfzGQc23F5mI8U
	A7y+iStN9nakD1mRSKBGHjLxIQA==
X-Google-Smtp-Source: AGHT+IFaqKu15tKP0UOvmvj4nCuAG9FBRJl5t2EPwtoFoYDsrTb/txjDVkvyhDwsAv5xUUWvtptEIssgdy6Mhndrug==
X-Received: from plqt6.prod.google.com ([2002:a17:902:a5c6:b0:234:cfe1:44a3])
 (user=almasrymina job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:903:2a88:b0:234:8ec1:4ad3 with SMTP id d9443c01a7336-2365dd3e4a3mr25251795ad.40.1749788904428;
 Thu, 12 Jun 2025 21:28:24 -0700 (PDT)
Date: Fri, 13 Jun 2025 04:28:02 +0000
In-Reply-To: <20250613042804.3259045-1-almasrymina@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250613042804.3259045-1-almasrymina@google.com>
X-Mailer: git-send-email 2.50.0.rc1.591.g9c95f17f64-goog
Message-ID: <20250613042804.3259045-2-almasrymina@google.com>
Subject: [PATCH net-next v1 2/4] netmem: fix netmem comments
From: Mina Almasry <almasrymina@google.com>
To: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Cc: Mina Almasry <almasrymina@google.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>, Shuah Khan <shuah@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Trivial fix to a couple of outdated netmem comments. No code changes,
just more accurately describing current code.

Signed-off-by: Mina Almasry <almasrymina@google.com>
---
 include/net/netmem.h | 21 ++++++++++++++++-----
 1 file changed, 16 insertions(+), 5 deletions(-)

diff --git a/include/net/netmem.h b/include/net/netmem.h
index 386164fb9c18..28ca931dc860 100644
--- a/include/net/netmem.h
+++ b/include/net/netmem.h
@@ -89,8 +89,7 @@ static inline unsigned int net_iov_idx(const struct net_iov *niov)
  * typedef netmem_ref - a nonexistent type marking a reference to generic
  * network memory.
  *
- * A netmem_ref currently is always a reference to a struct page. This
- * abstraction is introduced so support for new memory types can be added.
+ * A netmem_ref can be a struct page* or a struct net_iov* underneath.
  *
  * Use the supplied helpers to obtain the underlying memory pointer and fields.
  */
@@ -117,9 +116,6 @@ static inline struct page *__netmem_to_page(netmem_ref netmem)
 	return (__force struct page *)netmem;
 }
 
-/* This conversion fails (returns NULL) if the netmem_ref is not struct page
- * backed.
- */
 static inline struct page *netmem_to_page(netmem_ref netmem)
 {
 	if (WARN_ON_ONCE(netmem_is_net_iov(netmem)))
@@ -178,6 +174,21 @@ static inline unsigned long netmem_pfn_trace(netmem_ref netmem)
 	return page_to_pfn(netmem_to_page(netmem));
 }
 
+/* __netmem_clear_lsb - clear the lsb of &netmem and return it as
+ * a net_iov*.
+ * @netmem: netmem reference to extract as net_iov.
+ *
+ * All the sub types of netmem_ref (page, net_iov) have the same pp, pp_magic,
+ * dma_addr, and pp_ref_count fields at the same offsets. Thus, we can access
+ * these fields without a type check to make sure that the underlying mem is
+ * net_iov or page.
+ *
+ * The resulting value of this function can only be used to access the fields
+ * that are NET_IOV_ASSERT_OFFSET'd. Accessing any other fields will result in
+ * undefined behavior.
+ *
+ * Return: the netmem_ref cast to net_iov* regardless of its underlying type.
+ */
 static inline struct net_iov *__netmem_clear_lsb(netmem_ref netmem)
 {
 	return (struct net_iov *)((__force unsigned long)netmem & ~NET_IOV);
-- 
2.50.0.rc1.591.g9c95f17f64-goog

