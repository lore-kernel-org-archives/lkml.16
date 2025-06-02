Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCFB717B402
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 18:06:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748887564; cv=none; b=ocH7Hh2UKvzGeE1hQIiD2IxF5AFH88CeAYshsFW+C+kx4e4eR2QHFhJyuC+0BIX38jiejjX2PegiBdtvO7NQNNB/NtIBQmdOM3Ff4Sn+rK0VTaAuajJt4DBnBZpxZQTA3mGPcHYLP0eNxEXXsUBUXaP9OdAIJyXICPTDJzVVlHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748887564; c=relaxed/simple;
	bh=0cjetwOsL2ypGuYmNTagUI9TOm0lkdiSDu22lm6cOys=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=WRyvPS6MFGrvUWcMxq9BPGZQrhgAZonoH7zr3RLNeBGUhf1rI5z7TwHth9nt1u6cK1YqKqmIW7zKhSHGbRN75WzBePdfIIYrdnUgPrjEQZNi4zdBQ5vqEEBEbY6asRNVmsxF6iPvNRDd7k1Mf1CpiQXnSPek5YTI7Sqgu0sZcU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--zecheng.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=UhmW+NjS; arc=none smtp.client-ip=209.85.128.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--zecheng.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="UhmW+NjS"
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-7081121c3f7so55454777b3.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Jun 2025 11:06:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748887561; x=1749492361; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=U522+V0G8YlXfshZzb10Z1s1B/k3lv+mFTMQTUdIdTw=;
        b=UhmW+NjSASQQP5ywrGHZ9l85CJDfQiys40piRE0BagiMU3LQhugtzxKPB7Ngw/y1RE
         x6BLSzIC+uTg3WMYv+fK7bvrcmrAHFD2JTpny04rU1pLQ+USVapWAibK7cZ7ObCoPxKq
         XyfV6nkL5ba+Zvvs5RhAbzKKSPoGRrsWyaimxwCcI6wePg6rUaemX7zMXwtEdOPx22hE
         ztyF0udbc/0ix9CONpYWKvSBWDYdpVLXOJJDxuH68ClEdcDic61exHngZ3geyTmJQ7xf
         danoWiYzlOMw6uDC6+b5QyML5v4ZY+5PCFn5dS5ZNE2bPtipmAU7ihHS71MMSnvbTmG9
         v+oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748887561; x=1749492361;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=U522+V0G8YlXfshZzb10Z1s1B/k3lv+mFTMQTUdIdTw=;
        b=PeFod3E29VPPnrokFHIxbTKkJjlZzGnX7j9aNoQJIsYVkq9Aec7+0VvNf6uLU0df7x
         YaZzZFjlET/ShaeMCOp5pNZFISf9xyfh1vinDw3Cu97o6B0W/mizjLSQHGChjfc6Xyhw
         jlQwEWMO0p+OG7G2yacdVW/8lnXApaBEekQogosEaN74w6g+YQcDsefvDayDQnsxIN1W
         ydOi1wBAnkAkHrrH6aslfoKKKJHWgT5TP2iAoPpxZXBz82vEJwJvBUTtIfOKc3+Wm/R4
         xlOv6CgBDTGzrQkjWlhCszK6TKdqGGHnZE0LaNIYbxIupxpdcl10qUj4M4p2kUalrUJF
         amPA==
X-Forwarded-Encrypted: i=1; AJvYcCXb8jYE1E9arIQA5bylW04cniGgXNlS6JUz7So++7DwPEa452j+TZe6dgR/KUQDmSLu4tCUn50sSh5WoBs=@vger.kernel.org
X-Gm-Message-State: AOJu0YyS/uvvrWgmxY9jn+8vJ6XvKB2rLlugK9EjQ6S9I1j8J2uG+7dZ
	lLAj0TeDh4Geo8x/ozZO/vW4M8edQQUqbyqmfQ/0Kdue/+4zYQsgdFoA3gcqdFsYn712ZTmEjTI
	k7MlHuGP2/A==
X-Google-Smtp-Source: AGHT+IFJ0QuXh6WF1I206Yw95tOUU0UGMNhKo8CcWmMnKF1imoo/LhbVZd7U5siLim9mXuZ1gyCBrXAv5pDx
X-Received: from ywbfq17.prod.google.com ([2002:a05:690c:3511:b0:708:cde3:531f])
 (user=zecheng job=prod-delivery.src-stubby-dispatcher) by 2002:a05:690c:4a11:b0:70c:c20a:89a5
 with SMTP id 00721157ae682-710c6622b97mr6640917b3.19.1748887561724; Mon, 02
 Jun 2025 11:06:01 -0700 (PDT)
Date: Mon,  2 Jun 2025 18:05:41 +0000
In-Reply-To: <20250602180544.3626909-1-zecheng@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250602180544.3626909-1-zecheng@google.com>
X-Mailer: git-send-email 2.49.0.1204.g71687c7c1d-goog
Message-ID: <20250602180544.3626909-2-zecheng@google.com>
Subject: [RFC PATCH v2 1/3] cache: conditionally align cache groups
From: Zecheng Li <zecheng@google.com>
To: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
	Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>
Cc: Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Valentin Schneider <vschneid@redhat.com>, Xu Liu <xliuprof@google.com>, 
	Blake Jones <blakejones@google.com>, Josh Don <joshdon@google.com>, 
	Madadi Vineeth Reddy <vineethr@linux.ibm.com>, linux-kernel@vger.kernel.org, 
	Zecheng Li <zecheng@google.com>
Content-Type: text/plain; charset="UTF-8"

Introduces a pair of macros, `__cacheline_group_begin_aligned_cond` and
`__cacheline_group_end_aligned_cond`, to provide conditional cacheline
alignment for cache groups. The alignment behavior is as follows:

If the `COND` parameter is equal to `SMP_CACHE_BYTES`, the cache group
will be aligned to `SMP_CACHE_BYTES`.

If `COND` is not equal to `SMP_CACHE_BYTES`, no specific additional
cacheline alignment is enforced by using `__aligned(1)`.

This mechanism allows for more precise control over cacheline alignment,
ensuring that layout optimizations intended for one cache architecture
do not inadvertently degrade efficiency or introduce holes on systems
with different cache line sizes.

Signed-off-by: Zecheng Li <zecheng@google.com>
---
 include/linux/cache.h | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/include/linux/cache.h b/include/linux/cache.h
index e69768f50d53..8b5dadf1c487 100644
--- a/include/linux/cache.h
+++ b/include/linux/cache.h
@@ -147,6 +147,34 @@
 	struct { } __cacheline_group_pad__##GROUP		\
 	__aligned((__VA_ARGS__ + 0) ? : SMP_CACHE_BYTES)
 
+/**
+ * __cacheline_group_begin_aligned_cond - conditionally align a cache group
+ * @GROUP: name of the group
+ * @COND: a size; if it equals SMP_CACHE_BYTES, the group will be aligned
+ * to SMP_CACHE_BYTES. Otherwise, no specific cacheline alignment
+ * is enforced.
+ *
+ */
+#define __cacheline_group_begin_aligned_cond(GROUP, COND)	\
+	__cacheline_group_begin(GROUP)				\
+	__aligned(((COND) == SMP_CACHE_BYTES) ? SMP_CACHE_BYTES : 1)
+
+/**
+ * __cacheline_group_end_aligned_cond - declare a conditionally aligned group end
+ * @GROUP: name of the group
+ * @COND: condition (size); if it equals SMP_CACHE_BYTES, padding will
+ * be aligned to SMP_CACHE_BYTES. Otherwise, no alignment.
+ *
+ * This complements __cacheline_group_begin_aligned_cond.
+ * The end marker itself is aligned to sizeof(long).
+ * The final padding to avoid the next field falling into this cacheline
+ * is applied conditionally based on COND.
+ */
+#define __cacheline_group_end_aligned_cond(GROUP, COND)                 \
+        __cacheline_group_end(GROUP) __aligned(sizeof(long));           \
+        struct { } __cacheline_group_pad__##GROUP                       \
+        __aligned(((COND) == SMP_CACHE_BYTES) ? SMP_CACHE_BYTES : 1)
+
 #ifndef CACHELINE_ASSERT_GROUP_MEMBER
 #define CACHELINE_ASSERT_GROUP_MEMBER(TYPE, GROUP, MEMBER) \
 	BUILD_BUG_ON(!(offsetof(TYPE, MEMBER) >= \
-- 
2.49.0

