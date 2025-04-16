Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 582C6219A8B
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 18:06:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744826818; cv=none; b=c//LYzInZ7tnlOJGpviheYiY17/aWKnPXSuEg7vBzINQtO6Hc4VagIq6F1e60KjCSSGASEdHZ8+pKdHdJPLc6FEZMO7ycCRPTNnKOUs6MWAEpwru8cR5sFq0iA0mrxVUjkk9iwdMrwC9tN7oZi5ECNCc2bYMshUwfpxXj1pwKgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744826818; c=relaxed/simple;
	bh=hAFt1oizTf5k+/v9qVEpriM/awR6FGjPo3lNDCu5siQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fw8EPJv+kn8XciNyBhjhP4keKKJoYiIndrX0uIfcpFlhPfBTKxB8kDzfOmwGz85irhsAj8LXcMAfBpbyJH+ovb+EQ7W8eBd9AV8+344fEw81L/LtEKnPfcS2IqK9e15D1tKM67QmluoObcf2M1rVXTgX5dQbwa4L7HnB5pAkkV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cKs9goAm; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cKs9goAm"
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-7c58974ed57so660885185a.2
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 11:06:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744826816; x=1745431616; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5bBGNDXHf0wcTGsAhP/84UjjUq9vBjHxLqzgERfSJkQ=;
        b=cKs9goAmCKY49I5Mgvw43EQSYdeg/DWiunVPZVew6QZkZBHRUzm98dd7ueHO+k1qPK
         VgddACTjar/ZpPqCK8eTEFtGNOTc8gwr3HEavRZNYeBEyMqmzTHiwagE+D0oRr+86C1w
         sLYqxe/NYDwtRgs+/i1rXy3Zz9xrj9vuOtYSiAKeluEfrlxvb9gurnt4VIsmLZbWzVNG
         jBX3s/PzadYFA38l4XarsTFhPnHZhMwDh4wxh8GXB9NWZnyLqwRX1Vj8js8tJ9IElADc
         shAuG9wCHRmmdS3alYW6vdly//+QvNi+3oXSAyHfJgBYIcmyR1+Z90OE0GySqJnV9qw2
         6WrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744826816; x=1745431616;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5bBGNDXHf0wcTGsAhP/84UjjUq9vBjHxLqzgERfSJkQ=;
        b=WiglU4pGYf7OaBCiytduPS4I/thRtQCa7nVPn0jpdVungIxkrpKr2DetlfTpbZlc+T
         rkw6IxYG9tpLk3e42GhhiFzZB0xyF5og9gvj1Cb417/iOFsjMR4y9KyAw5okIrfRj970
         cO1qdmD6EET3YWogq2yt6D3Q+bqsl6rokI/Y8qlSP5MIeuaFsg6Z6UvFj3O88SOY1qO9
         mGl9BoN4wSe+KkU64cF8x7n5Uj1wpi+QMwamwQUZDWLziSJ/8JcvBTmT3NmG6JceegY+
         sAxwUx60kRbukdnRNpbvx1fZw3kiCYB1C1AgLTOMId0lXCV0z+rbMpArIR5JgYZH04Zv
         LFpQ==
X-Forwarded-Encrypted: i=1; AJvYcCW/eSL7qV96WpZy86XEHLc4IPYdEd07XgtdHouw0deOYvLHlvMBMRXw+UZr0POcNa5pghJ6vw5HgUPCkzI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/5IK3vJeMqW7Y2a0QYAOo552Tv/fzhV0NzirRQDlfc/Y5dNB4
	LH4RKI7nyepoayfY8vwlizd03BS+e0slUZazRtTkSpjuFutjYaKj
X-Gm-Gg: ASbGncvSSoJljeBSp9DcDLYHeZ4jsTcetMpAU1CQggaNXIKFf6lj/GSUJOoAphNoxMy
	rVw+npIQkuavl/cp+P/GJaCWmog4Oj2bdYs9jUJWz8caVqfm4P7xvOTPwbFSBz2iebDU0roCM34
	WHEMOmvCHXZ9J0JU7v8I6zCF7Zq0A3dndeMvR7Nhv3PXNIWtqqHyKvk3fys5ZCciUYO/U33nXaw
	RJEeQA8bvOGU8ieSLywradkrwOXouOXK0UtrmH/NjZq1iUt5W5BhBETVbV6vk4VqXqaYQaK/s5k
	vQuF6AJEF9QBh/Pku1G+p1USmiDf/tFutE6NnQ==
X-Google-Smtp-Source: AGHT+IF8GjF861ZlG5eJfPMP6n3Yo9HbzAs3F1ABqQuYTpMtFeymvRZMNgLh1ooSe/pUOJlw11fzCw==
X-Received: by 2002:a05:620a:40c8:b0:7c7:b5d0:da63 with SMTP id af79cd13be357-7c91900180emr451290585a.25.1744826816061;
        Wed, 16 Apr 2025 11:06:56 -0700 (PDT)
Received: from localhost ([2a03:2880:20ff:6::])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c7a88b6b0asm1096843585a.0.2025.04.16.11.06.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 11:06:55 -0700 (PDT)
From: Usama Arif <usamaarif642@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	surenb@google.com,
	linux-mm@kvack.org
Cc: hannes@cmpxchg.org,
	shakeel.butt@linux.dev,
	linux-kernel@vger.kernel.org,
	kernel-team@meta.com,
	Usama Arif <usamaarif642@gmail.com>
Subject: [PATCH] alloc_tag: introduce Kconfig option for default compressed profiling
Date: Wed, 16 Apr 2025 19:06:52 +0100
Message-ID: <20250416180653.3438158-1-usamaarif642@gmail.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

With this Kconfig option enabled, the kernel stores allocation tag references
in the page flags by default.

There are 2 reasons to introduce this:
- As mentioned in [1], compressed tags dont have system memory overhead
and much lower performance overhead. It would be preferrable to have this as
the default option, and to be able to switch it at compile time. Another
option is to just declare the static key as true by default?
- As compressed option is the best one, it doesn't make sense to have to
change both defconfig and command line options to enable memory
allocation profiling. Changing commandline across a large number of services
can result in signifcant work, which shouldn't be needed if the kernel
defconfig needs to be changed anyways.

[1] https://lore.kernel.org/all/20241023170759.999909-7-surenb@google.com/T/#m0da08879435f7673eaa10871a6e9d1be4f605ac8

Signed-off-by: Usama Arif <usamaarif642@gmail.com>
---
 include/linux/pgalloc_tag.h | 4 ++++
 lib/Kconfig.debug           | 5 +++++
 lib/alloc_tag.c             | 4 ++++
 3 files changed, 13 insertions(+)

diff --git a/include/linux/pgalloc_tag.h b/include/linux/pgalloc_tag.h
index c74077977830..0226059bcf00 100644
--- a/include/linux/pgalloc_tag.h
+++ b/include/linux/pgalloc_tag.h
@@ -16,7 +16,11 @@ extern unsigned long alloc_tag_ref_mask;
 extern int alloc_tag_ref_offs;
 extern struct alloc_tag_kernel_section kernel_tags;
 
+#ifdef CONFIG_MEM_ALLOC_PROFILING_COMPRESSED_ENABLED_BY_DEFAULT
+DECLARE_STATIC_KEY_TRUE(mem_profiling_compressed);
+#else
 DECLARE_STATIC_KEY_FALSE(mem_profiling_compressed);
+#endif
 
 typedef u16	pgalloc_tag_idx;
 
diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index 9fe4d8dfe578..66d8995f3514 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -1028,6 +1028,11 @@ config MEM_ALLOC_PROFILING_ENABLED_BY_DEFAULT
 	default y
 	depends on MEM_ALLOC_PROFILING
 
+config MEM_ALLOC_PROFILING_COMPRESSED_ENABLED_BY_DEFAULT
+	bool "store page allocation tag references in the page flags by default"
+	default y
+	depends on MEM_ALLOC_PROFILING
+
 config MEM_ALLOC_PROFILING_DEBUG
 	bool "Memory allocation profiler debugging"
 	default n
diff --git a/lib/alloc_tag.c b/lib/alloc_tag.c
index 25ecc1334b67..30adad5630dd 100644
--- a/lib/alloc_tag.c
+++ b/lib/alloc_tag.c
@@ -31,7 +31,11 @@ DEFINE_STATIC_KEY_MAYBE(CONFIG_MEM_ALLOC_PROFILING_ENABLED_BY_DEFAULT,
 			mem_alloc_profiling_key);
 EXPORT_SYMBOL(mem_alloc_profiling_key);
 
+#ifdef CONFIG_MEM_ALLOC_PROFILING_COMPRESSED_ENABLED_BY_DEFAULT
+DEFINE_STATIC_KEY_TRUE(mem_profiling_compressed);
+#else
 DEFINE_STATIC_KEY_FALSE(mem_profiling_compressed);
+#endif
 
 struct alloc_tag_kernel_section kernel_tags = { NULL, 0 };
 unsigned long alloc_tag_ref_mask;
-- 
2.47.1

