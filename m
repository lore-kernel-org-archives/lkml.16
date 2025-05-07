Received: from mail-ej1-f74.google.com (mail-ej1-f74.google.com [209.85.218.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13DFD28C019
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 16:00:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746633620; cv=none; b=pXH2QJit60+OwFz5HHsrYwdNGhXkBC0voQUTsn09armyB/3M/PmcaE3lmU/nmtnw5OZrQInwjqMcDiRBxdbIQgePe0XE8wkVFOxFXfzHEv094VYedMDpIhR2TLMRt5mM1N9YtKOck5i8+v/qizBB46KlpJPvXeya1j6udwfG80M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746633620; c=relaxed/simple;
	bh=j19ZgOTTWAGBGNqHN8qTGIuidKVHeDDoRGzAO5qox9s=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=EuOofxqlOkuBapWR3Py2vVpfwRpxEaCKyepvSR8O4IiJawGU/ANLHKhC+w4sPolxAcHNZbs4EyKUZhB4KHjPT6691uHgGmW8WrEAOMJCsARYGHFSLu0rCq0Hr9ytiV5uvGXRKWJZDrDNS/DEsUmdFtGZ7oi5KuNafYVvxk/25lI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--glider.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=M06SxVFx; arc=none smtp.client-ip=209.85.218.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--glider.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="M06SxVFx"
Received: by mail-ej1-f74.google.com with SMTP id a640c23a62f3a-ac6a0443bafso351294266b.2
        for <linux-kernel@vger.kernel.org>; Wed, 07 May 2025 09:00:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746633616; x=1747238416; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=vXPWjkInimv+c0IvUnqWtZ/bOGRa5nQDErIPmKwQCf8=;
        b=M06SxVFx0ssHtmnGIgmycRgcgQoHTKUxsUUayqU6zsRjnkBuh2LzeXpEoPVLtJvcQT
         cc/c7TVonDMebBnjNx+wAyjp8F++nHepgpQ8Yguvrdu+NcX+AkPUXAlgme9EFCG7224F
         gYNs+K601eOXSnCmzKaCRq0QwzMuDgt5SCpP0JsfZu6W1rBb969xXDg1+l8Ur70YW/BX
         azjDVBJxs2yDg/rdT6/iqhYewPXhjzT+AUpJdhetCs8KNG8R/nhf8yLXnv7KoZJ6UBV/
         7Xftr2bwzM44BtoLN/1ZMKtC8MfCIqK2M1zsDWUPv/6Hd+agTtgFkq1ntdBeOSqVucTe
         P3sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746633616; x=1747238416;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vXPWjkInimv+c0IvUnqWtZ/bOGRa5nQDErIPmKwQCf8=;
        b=tHjapupkoht2HxNf+kRJIPXW7lzpAGY5QfyycGmDWZBTM9O1EEV/bbXAKBSBYnqpwK
         Xb6Xhq0oNkPEv9DuK8sNFtZyPRknPGRmpZ4FhMbHRJPR+n2RGyFVfU0i4FF6gLH6OdjR
         eEys07IM9P+WjDOcxGe9YmoEG9pBwFEzq5zcM2WtTmiDx1VZAPcBJuIgNIKItbUj96JF
         /qcduZ6m93G1ySggJs59NgzhLd3aiucL9RLPagMS+BkK1LzeL3hTioCnm+xc2GXPzMtb
         qVLWjIbp9LYK6Mayth0wET+G/zK56OePq30GOxhGH7rgtCMgo6tILOr+iQJFwFKznBme
         R8dQ==
X-Forwarded-Encrypted: i=1; AJvYcCUH1YHpayT3ILOJyI6fvkU0I5IA3R5kb/u483MIBwGA0kBnTPZf35HMSgZr6rcjdhOXcjLbYi/cUWPDEK0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxJojcMDbuJEtLjmd3c761jrc9y/JV3DF7ZDyMK3jiCud4SWSsp
	tGvWMhJlg636Av4DmdTvGFRP2HaTN2ldNdOL2g4d1NgWwFWKoRaAjaAyC1W2k/hJfR7xsXbdN+S
	DmQ==
X-Google-Smtp-Source: AGHT+IENrzQ9qW4o5ldAwmBY+EkcP4c4Get3DY+LzpSPnrl75ktPqa2dZxA5dvk1Hid+4o5rbXWTuekKFS0=
X-Received: from ejbbx20.prod.google.com ([2002:a17:906:a1d4:b0:acb:59f0:cc9e])
 (user=glider job=prod-delivery.src-stubby-dispatcher) by 2002:a17:907:8688:b0:ad1:8dd3:a4eb
 with SMTP id a640c23a62f3a-ad1e8d0d9e5mr360033666b.56.1746633616362; Wed, 07
 May 2025 09:00:16 -0700 (PDT)
Date: Wed,  7 May 2025 18:00:08 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.49.0.967.g6a0df3ecc3-goog
Message-ID: <20250507160012.3311104-1-glider@google.com>
Subject: [PATCH 1/5] kmsan: apply clang-format to files mm/kmsan/
From: Alexander Potapenko <glider@google.com>
To: glider@google.com
Cc: elver@google.com, dvyukov@google.com, bvanassche@acm.org, 
	kent.overstreet@linux.dev, iii@linux.ibm.com, akpm@linux-foundation.org, 
	linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

KMSAN source files are expected to be formatted with clang-format, fix
some nits that slipped in. No functional change.

Cc: Ilya Leoshkevich <iii@linux.ibm.com>
Signed-off-by: Alexander Potapenko <glider@google.com>
---
 mm/kmsan/core.c   | 4 ++--
 mm/kmsan/hooks.c  | 4 +---
 mm/kmsan/init.c   | 3 +--
 mm/kmsan/shadow.c | 3 +--
 4 files changed, 5 insertions(+), 9 deletions(-)

diff --git a/mm/kmsan/core.c b/mm/kmsan/core.c
index a495debf14363..a97dc90fa6a93 100644
--- a/mm/kmsan/core.c
+++ b/mm/kmsan/core.c
@@ -159,8 +159,8 @@ depot_stack_handle_t kmsan_internal_chain_origin(depot_stack_handle_t id)
 	 * Make sure we have enough spare bits in @id to hold the UAF bit and
 	 * the chain depth.
 	 */
-	BUILD_BUG_ON(
-		(1 << STACK_DEPOT_EXTRA_BITS) <= (KMSAN_MAX_ORIGIN_DEPTH << 1));
+	BUILD_BUG_ON((1 << STACK_DEPOT_EXTRA_BITS) <=
+		     (KMSAN_MAX_ORIGIN_DEPTH << 1));
 
 	extra_bits = stack_depot_get_extra_bits(id);
 	depth = kmsan_depth_from_eb(extra_bits);
diff --git a/mm/kmsan/hooks.c b/mm/kmsan/hooks.c
index 3df45c25c1f62..05f2faa540545 100644
--- a/mm/kmsan/hooks.c
+++ b/mm/kmsan/hooks.c
@@ -114,9 +114,7 @@ void kmsan_kfree_large(const void *ptr)
 	kmsan_enter_runtime();
 	page = virt_to_head_page((void *)ptr);
 	KMSAN_WARN_ON(ptr != page_address(page));
-	kmsan_internal_poison_memory((void *)ptr,
-				     page_size(page),
-				     GFP_KERNEL,
+	kmsan_internal_poison_memory((void *)ptr, page_size(page), GFP_KERNEL,
 				     KMSAN_POISON_CHECK | KMSAN_POISON_FREE);
 	kmsan_leave_runtime();
 }
diff --git a/mm/kmsan/init.c b/mm/kmsan/init.c
index 10f52c085e6cd..b14ce3417e65e 100644
--- a/mm/kmsan/init.c
+++ b/mm/kmsan/init.c
@@ -35,8 +35,7 @@ static void __init kmsan_record_future_shadow_range(void *start, void *end)
 	KMSAN_WARN_ON(future_index == NUM_FUTURE_RANGES);
 	KMSAN_WARN_ON((nstart >= nend) ||
 		      /* Virtual address 0 is valid on s390. */
-		      (!IS_ENABLED(CONFIG_S390) && !nstart) ||
-		      !nend);
+		      (!IS_ENABLED(CONFIG_S390) && !nstart) || !nend);
 	nstart = ALIGN_DOWN(nstart, PAGE_SIZE);
 	nend = ALIGN(nend, PAGE_SIZE);
 
diff --git a/mm/kmsan/shadow.c b/mm/kmsan/shadow.c
index 1bb505a08415d..6d32bfc18d6a2 100644
--- a/mm/kmsan/shadow.c
+++ b/mm/kmsan/shadow.c
@@ -207,8 +207,7 @@ void kmsan_free_page(struct page *page, unsigned int order)
 	if (!kmsan_enabled || kmsan_in_runtime())
 		return;
 	kmsan_enter_runtime();
-	kmsan_internal_poison_memory(page_address(page),
-				     page_size(page),
+	kmsan_internal_poison_memory(page_address(page), page_size(page),
 				     GFP_KERNEL,
 				     KMSAN_POISON_CHECK | KMSAN_POISON_FREE);
 	kmsan_leave_runtime();
-- 
2.49.0.967.g6a0df3ecc3-goog

