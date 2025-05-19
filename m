Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A60FF1DE8BE
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 02:35:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747622126; cv=none; b=em92W1NWMupn3uz4lFEQEV5dT4YA0LruBQ6w9O4ezysTlzK8fZRWNIL+x1cSh3j++W90C0bWZ18TI/q1Tdj6w2Kp2cHgsVvJQhn6IV7qBM+LAXr9Z9VF1wxiOHQohT4bd8M9PZSMsepYC/dAlVAHG9+bxf+iTDBnJAdDGuLy65E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747622126; c=relaxed/simple;
	bh=fjMbYp1OUTPpUA+isQhdpqYICCd17AJcekK61Bn+4TY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=amWt/TAHcCL8YKvbjJLB2IUS9fZ9LaHRLRTQ0+tDKRXIhnLVTWZNMr44pvIlVGA3CVz7KRM5gDOch8R4wZTm1so6MQg/1p7jVNXqeXaKFKgxRXQrxnDhI/BNqMGyvY58YPM7yjmWCQfu0aByW9UioD1ACke31VmjuMUaEWfB634=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=hsuqJtWr; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="hsuqJtWr"
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-b2371b50cabso4313714a12.0
        for <linux-kernel@vger.kernel.org>; Sun, 18 May 2025 19:35:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747622123; x=1748226923; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=SiIOWkaYu6Q5NvtHbuVewPLdOWvzkt5VSs00BXd1iZA=;
        b=hsuqJtWrT+r7rFyfp6q4p2B076jErBiTumcXh3MiCUuWfOuYO8x5iTG87RScJ8I69t
         wfqPlxOB2cDPd6Bkd1qmlXaC2VPzbw40DTGdVId9SUGGbiSkdyaG9XE7MdMUzfZB9hRY
         CCQyORXj1nX57kyW7dto4nEjLu8Tu3vUyixU+CH28gbqM/RPwk8MrdZKvDrrjUkwgVnG
         rO44nAzRTLK3zVohbdArjYyTJ7NNxL0zP+EX/BlgcF/CskcEXaFVXO0iy0dcCNjmdGdi
         yjIz3DGjHZXN8owG+n4y7Z+wFs35znaUnnNIV9v4UPnHsiaWd7I1jX+OiVMkYTsrs42c
         aGkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747622123; x=1748226923;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SiIOWkaYu6Q5NvtHbuVewPLdOWvzkt5VSs00BXd1iZA=;
        b=RsItKyi3CCPEgNHONzZwNukoUxaIxIqWHXjcW5SbB+U5W/fI1uqT/L3BLDZpyXqj97
         0CxEtzrJnr+WtBvziYYXWpW+LFRo9AynMkPeporxTQGQ3kJNRRkQddghdFz8uxX3VJNe
         6urQPtevmqWxnKicClMc5uYPyux6H+yyrs2ikcMLclpEhxuv4uTeLyRE0WOFyQjivX7F
         IkYLVa4/rW2lUNGu3IcwJUaJinwlDBDdDuVs32v3EGUWZ1UtE+UFX/4jsvtYQAmle15q
         KQJSNob/EJAaiSMIu+uTn1efmdt9XmuM1irVhTl+mKEN8OyndTIbEkecRaFKrSXZtyiE
         i22g==
X-Forwarded-Encrypted: i=1; AJvYcCV9+Oh8JKWg/Zid7Mm0JO9mybRyFACfjwlrPIEEETOXIdZ/n4D82jPhaNBBmkqwL3YFuh7o/A39Yi1UYnk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyEcv0mLB/0PP53aDPDZgv7OReAY6jFvmV8pDo3AsCCR3hwgr/X
	2nQ/DNYqpVfeulaZ57Z7UM1JnkOyRgkHCrfhKYR44CL8bNA8VnEwXL1UPUL5WQD3ItyODHT2rl2
	IzF3IdOEqwuPDfDV49ucJ2jaPlg==
X-Google-Smtp-Source: AGHT+IHBrwI4b9TNUkLaMgynwA2HQL/MTtdwhOuI/X1LYMxFchY6tJBRsHHTzW22QGPcgrBPKF64HUiyRaUkCYyEgQ==
X-Received: from pgmp18.prod.google.com ([2002:a63:1e52:0:b0:b0b:301e:8e96])
 (user=almasrymina job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a21:3385:b0:1fa:9819:b064 with SMTP id adf61e73a8af0-2170cb407f7mr14894249637.18.1747622122885;
 Sun, 18 May 2025 19:35:22 -0700 (PDT)
Date: Mon, 19 May 2025 02:35:10 +0000
In-Reply-To: <20250519023517.4062941-1-almasrymina@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250519023517.4062941-1-almasrymina@google.com>
X-Mailer: git-send-email 2.49.0.1101.gccaa498523-goog
Message-ID: <20250519023517.4062941-3-almasrymina@google.com>
Subject: [PATCH net-next v1 2/9] page_pool: fix ugly page_pool formatting
From: Mina Almasry <almasrymina@google.com>
To: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Cc: Mina Almasry <almasrymina@google.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, Jesper Dangaard Brouer <hawk@kernel.org>, 
	Ilias Apalodimas <ilias.apalodimas@linaro.org>, Neal Cardwell <ncardwell@google.com>, 
	Kuniyuki Iwashima <kuniyu@amazon.com>, David Ahern <dsahern@kernel.org>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, Shuah Khan <shuah@kernel.org>, sdf@fomichev.me, 
	ap420073@gmail.com, praan@google.com, shivajikant@google.com
Content-Type: text/plain; charset="UTF-8"

Minor cleanup; this line is badly formatted.

Signed-off-by: Mina Almasry <almasrymina@google.com>

---
 net/core/page_pool.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/net/core/page_pool.c b/net/core/page_pool.c
index 974f3eef2efa..4011eb305cee 100644
--- a/net/core/page_pool.c
+++ b/net/core/page_pool.c
@@ -867,8 +867,8 @@ void page_pool_put_unrefed_netmem(struct page_pool *pool, netmem_ref netmem,
 	if (!allow_direct)
 		allow_direct = page_pool_napi_local(pool);
 
-	netmem =
-		__page_pool_put_page(pool, netmem, dma_sync_size, allow_direct);
+	netmem = __page_pool_put_page(pool, netmem, dma_sync_size,
+				      allow_direct);
 	if (netmem && !page_pool_recycle_in_ring(pool, netmem)) {
 		/* Cache full, fallback to free pages */
 		recycle_stat_inc(pool, ring_full);
-- 
2.49.0.1101.gccaa498523-goog

