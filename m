Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0F332EBDD9
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 20:05:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751054747; cv=none; b=jXsV5t3/3/dITySqi79yyJ3hW61rfnzYS8fApuCBu61BsYwZjk1nUV2WFLAcxdkHW+OCCskmPbtlGV8kUnIwWpgSyETEEkYebmj95hpjLElPvk/HBj9GBOm0mXPQnCOxOoAdSoAxqVinMpp/lPxSsp3aI+TEuxz577yKdTl0hR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751054747; c=relaxed/simple;
	bh=LR3FEYO4lseRQoD8fNl9kELElxWTZ4qSpuPKRqnou5E=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=BnCH2t0u2gaodWwGJ9feQ6VNvzB0HqfguwnyH0lkyaRS23ukKSrchjzyckkHutNTk7+b6i0tPEWrEo5HnbGScdZ4Kj9xid9V+gw0ir7qGXAnyy39ZIZ+WbDr3x4bQVOBAuJ6S9o2UugLqNGg+5cWoVT2WQWMU7B1X3dHcwK6hnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=TTPV8XGC; arc=none smtp.client-ip=209.85.210.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="TTPV8XGC"
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-74943a7cd9aso598119b3a.3
        for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 13:05:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1751054745; x=1751659545; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZsCnLtPUB1WW+niTlrUm0KWXpbsHYBTnip7qlkFxEqw=;
        b=TTPV8XGC5LnjKfGOB32kPx6d0GcrGWH1saQhsQ37V89C+j0aW0TypZebJwxwwSU+oG
         fEohcWwm7o2ofP/+TSLgy12+XFz38B6gygeDe4zPf1x40N3NM9Tf4ohn9qGjzlfCpEoz
         CMkusz2kBZrf+B7WGoYAMSQUpluBtD7QVZohQWenXiZVZXPufvMP26UJvwdHD8K1PewH
         RvjgIs6fyFSwBfzyjVuDlx/dQMycJAO+RKRVLQHD0EZgvLIL9IoIIKxVCe6ypvF0bMj0
         Affzq/y+kzXrMBLPKDyDiSBFdS9dUrXM5V6y+jTngfyKYev7Hptfgq5Fq96t+AYOoVpg
         eLMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751054745; x=1751659545;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZsCnLtPUB1WW+niTlrUm0KWXpbsHYBTnip7qlkFxEqw=;
        b=ZsD5IE28014+1u5Vcza+IZoxf939yb/xRNCXUgwLxuox2IH6gkulAxECR1poqD9bmh
         DuKmcZRpSAvpz/OjjCuojwSb8hombpG+LoWD0bqx54ZWbqn5+jDPG2AU45f5NKUfd0tH
         PVmFmr+5O4A6rwzFVaq+Sm9zD9E3Md1+HEIQc6DUQWupTsxVuW7b4zaex8sW+uxJ8oTy
         VCBjqBbPeFq+m5DSOSJGFiF7aLANjI/CV8cv+LW0QmqNdj7+J4NCWQFeDKImxn+minys
         bce6ldMbj2pMpyXv+dU1f+rYbIv0ugisR1WgLbr5gDQsWJ/K4wBgbnsCwAQhW3N9Cr8n
         nmaQ==
X-Forwarded-Encrypted: i=1; AJvYcCWgMIDrlmD77nFGbSmKTkmKj2fobHvBwj0nGldBuNri9d5vO6Y9LLp/clQyNujQVpOsWRx7ozvbCLXki18=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+h66KT0GXtdSzzM50zKzk3AjB0fvyOyl/wrP/DoCMWa1uYu/S
	IzAMsQWgAtkL4CwKyVVgut4uBSUlMbKpWArL0kL0+tUT0TJ84vObFR4dcTroIeuBwdZ9hFyijoj
	spPJkN1xjvlqGBiJ/2RmoVpYlkQ==
X-Google-Smtp-Source: AGHT+IG/oOX4Ds24NX7C8OYmI3C+kJZrnfuJT15/L/7jauTWcRcnnLkHUgGCREUfwknTXT4g7yRM1bwd9m2A7brqUg==
X-Received: from pgbfq27.prod.google.com ([2002:a05:6a02:299b:b0:b31:cc05:3c03])
 (user=almasrymina job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a20:c704:b0:220:63bd:2bdb with SMTP id adf61e73a8af0-220a16ca7famr7000010637.40.1751054745372;
 Fri, 27 Jun 2025 13:05:45 -0700 (PDT)
Date: Fri, 27 Jun 2025 20:04:52 +0000
In-Reply-To: <20250627200501.1712389-1-almasrymina@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250627200501.1712389-1-almasrymina@google.com>
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
Message-ID: <20250627200501.1712389-2-almasrymina@google.com>
Subject: [PATCH net-next v1 2/2] selftests: pp-bench: remove
 page_pool_put_page wrapper
From: Mina Almasry <almasrymina@google.com>
To: netdev@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Cc: Mina Almasry <almasrymina@google.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>, 
	"=?UTF-8?q?Toke=20H=C3=B8iland-J=C3=B8rgensen?=" <toke@redhat.com>, Jesper Dangaard Brouer <hawk@kernel.org>, 
	Ilias Apalodimas <ilias.apalodimas@linaro.org>, kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"

Minor cleanup: remove the pointless looking _ wrapper around
page_pool_put_page, and just do the call directly.

Signed-off-by: Mina Almasry <almasrymina@google.com>
---
 .../net/bench/page_pool/bench_page_pool_simple.c     | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/tools/testing/selftests/net/bench/page_pool/bench_page_pool_simple.c b/tools/testing/selftests/net/bench/page_pool/bench_page_pool_simple.c
index 1cd3157fb6a9..cb6468adbda4 100644
--- a/tools/testing/selftests/net/bench/page_pool/bench_page_pool_simple.c
+++ b/tools/testing/selftests/net/bench/page_pool/bench_page_pool_simple.c
@@ -16,12 +16,6 @@
 static int verbose = 1;
 #define MY_POOL_SIZE 1024
 
-static void _page_pool_put_page(struct page_pool *pool, struct page *page,
-				bool allow_direct)
-{
-	page_pool_put_page(pool, page, -1, allow_direct);
-}
-
 /* Makes tests selectable. Useful for perf-record to analyze a single test.
  * Hint: Bash shells support writing binary number like: $((2#101010)
  *
@@ -121,7 +115,7 @@ static void pp_fill_ptr_ring(struct page_pool *pp, int elems)
 	for (i = 0; i < elems; i++)
 		array[i] = page_pool_alloc_pages(pp, gfp_mask);
 	for (i = 0; i < elems; i++)
-		_page_pool_put_page(pp, array[i], false);
+		page_pool_put_page(pp, array[i], -1, false);
 
 	kfree(array);
 }
@@ -180,14 +174,14 @@ static int time_bench_page_pool(struct time_bench_record *rec, void *data,
 
 		} else if (type == type_ptr_ring) {
 			/* Normal return path */
-			_page_pool_put_page(pp, page, false);
+			page_pool_put_page(pp, page, -1, false);
 
 		} else if (type == type_page_allocator) {
 			/* Test if not pages are recycled, but instead
 			 * returned back into systems page allocator
 			 */
 			get_page(page); /* cause no-recycling */
-			_page_pool_put_page(pp, page, false);
+			page_pool_put_page(pp, page, -1, false);
 			put_page(page);
 		} else {
 			BUILD_BUG();
-- 
2.50.0.727.gbf7dc18ff4-goog

