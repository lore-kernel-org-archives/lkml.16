Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC570217679
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 23:05:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748041534; cv=none; b=jTCS4t3E2sukebqmLb+Mc+H5vx+TpNu6twvFjadXTktZV7YMfzIt71WCM8emh/dHAF8MeknTxsg5CChnApRhMCnjuHPyFitOJ4fPnvdSuEkuY1nn+sOSNp+5Pt5vz9J0LxlK+4Dd8q3bYR3kOd4bHx8RDoFITH+3gF7eXJlgeTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748041534; c=relaxed/simple;
	bh=XtpGf08mk62B/n49TMdckE7eT2mByGhUn/6TICm/3tc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Oic9fwnMhDuOVPxQg4Q3GALyeuhccJbM4/6EMWu44G9XcE3t83pBUqfMfN3nd+lpL8qNVxYOqEDpaTrHk2SIhASwOmeOCfgAb+3v382GoqcKjjV1QFTuBo8TVMpjWdR0Ecxccm3ilq3fNTQ+9dKLoihzvy4v9QpNCp5Z7mufN0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=S1237oP2; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="S1237oP2"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-23415056f5bso3559605ad.3
        for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 16:05:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748041532; x=1748646332; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=jo8oX10ObykGsTsR/s0quAt1NvrEp0Zt6nav8gqqDes=;
        b=S1237oP2fGB8BGwvycGvidqRwF7caLEZhno4g/sGIAzWEhERoOrwkywBkX/aVjo9go
         CR0aSPy8LbxaNs/AAVJkfVqTLLhl4LJHpAvo9lY13tXTjmVfSBpTSXflmka2EZvT3l0+
         8ylq4qoJyNMZq9K32QqwcVSukaewJuklLv1k8AAunfhZ+iJZlvk/CHRa3TgHf7yeme1j
         VZ3GMLqbjqSLmDtIobg2XjdQWVNuWNTuOp1UTCVaMemgOurEwwCsx0ORI4bd2APkZDCe
         +x5+IHhp/tgnmeQXCXhLp89mYcx2JKz86+baKlvK9fEUdWUFN475C9yBFF04zIL1RdIR
         ORzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748041532; x=1748646332;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jo8oX10ObykGsTsR/s0quAt1NvrEp0Zt6nav8gqqDes=;
        b=r30TX4kGDQtc1isBNhpUix/O7h6NcSfOCtmJzv99dOHfkjVxEy5mJHP3hxq0fzoi6k
         NXDC5Fkd96ihayt3y/WTL0noxsWi4a9A+41LfVXLECyBbE8WQblDu585bOVL0vQw085m
         D3hS2UL/AnjYHN0T8ibbgaxSjBRuQgxl/5a2sBV/u7SiBhZdbwHECoWPK/kk2dYS8T1u
         gMEUo8S6WjPCuibKMN5FBd23EV02CGkbh/Vh+4+ZmWlbTyRolQIl78M8PySbpgBetg3O
         D2Lgz/FKN3NXS96e1/d9KLNDegAiavGhoIlMejlfEgUBPMyAPXWvTKOMl0kKad94GZG9
         SnQg==
X-Forwarded-Encrypted: i=1; AJvYcCX7Mu9pPNQ1NPQn5msqjVLzrwJaWXCpJKT6HWgx3mcFMXQM9e3B/eoy/PirkfE4gE/4sxS213T3VYSy9lY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx79NcUWTRxyd1Z/sN7KvhfN9YTfIE4jvJB8JR+JwfVMtJSreLz
	GBRObN5s5CF/TPIIsvSahIRBNHnQSSSjaIDIaLfr+ScS0XWmGuqPq3iiR+Zq5DOMTDXENkXlZq+
	npEmLKeeFnvBUMyXabMvJVOy39Q==
X-Google-Smtp-Source: AGHT+IFoBkGFwgLLGT5f3w3RDig2i1nIBH1FsoeWWmCb4h+IXnB8/EK5ds7LLf2qaCyDmHPMD3Aak1+RlQqHMg3FlQ==
X-Received: from pliy11.prod.google.com ([2002:a17:903:3d0b:b0:232:4eb:e2c6])
 (user=almasrymina job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:902:f609:b0:223:f408:c3e2 with SMTP id d9443c01a7336-23414f4b44fmr16343555ad.14.1748041532044;
 Fri, 23 May 2025 16:05:32 -0700 (PDT)
Date: Fri, 23 May 2025 23:05:18 +0000
In-Reply-To: <20250523230524.1107879-1-almasrymina@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250523230524.1107879-1-almasrymina@google.com>
X-Mailer: git-send-email 2.49.0.1151.ga128411c76-goog
Message-ID: <20250523230524.1107879-3-almasrymina@google.com>
Subject: [PATCH net-next v2 2/8] page_pool: fix ugly page_pool formatting
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
2.49.0.1151.ga128411c76-goog

