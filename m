Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68A4822A810
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 23:14:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744067668; cv=none; b=q4WZCclCEJ++GzYXnsLFKiQWfWdNLvLGXgzpg+9KmYN6bOF9fhfdTQOyUJ+U5yUQ7p2awK3bA95Sqs4wHwh2ozJdoX0IgJ3Zyj3GBMT5OOc3V3C87gCB+oDt0Y+oKs4btb36DZsTFJkofnXGEJQqqREtlA0UePvmKQjn5Qhu64c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744067668; c=relaxed/simple;
	bh=q6BbRqF1JUXvafK75ET1dQNG1s/fnKKhOSY4yE7quyk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=UH38nDbdMVrT7bd56Sezcu1bGxgLC0mLubv5SdW4L3I9QeK8TiWpKOZ75vnPNzU+8k4zoDK9Hd0C/hZpFNEhg1dBBWDdMA+aBy7bMlEhhjs8au3ELvauFCOFQHOWXRKB/Z/DtapW395InZ9Ggzd1QI1jDDitjYcZZqj7QtKcG6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Pw0/0Y86; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Pw0/0Y86"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5efe8d9ebdfso10168473a12.3
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 16:14:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744067663; x=1744672463; darn=vger.kernel.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mZa4eYUkmXVz1t5iRUH0F0TZZ4VY704zpniKkDZZtMI=;
        b=Pw0/0Y8605CA2kyJ+l5yQKPXweeTzCIX4cteNprJM6p31LNWaqUGIqKgnhxb5ewFHV
         LzrQis2PDW7ZE62cqpkdSV1KPa7Sg19boiILOSS1NabpIkdgbD/XLMOdjRrrgWQLF5SQ
         sI1CP3kC5k+8xfXOcLPXo8FbcZpaONIaxu7mdx8MrwHFP7mlr627LxUj9y7DU4tLKzW5
         j+TDats4Z2PljB/TWki1wC1g2x380RC25GUjx6FkW4FINlzgPx+kC3avb81Az+yhsBRy
         Itu/N32jMqQ0WCfK4rT3kDl3KOEKLNGoDgaaccUthdYQOFktRnI66g1ZNHM0Vv6TFiGI
         5/yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744067663; x=1744672463;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mZa4eYUkmXVz1t5iRUH0F0TZZ4VY704zpniKkDZZtMI=;
        b=OODDoN/IsW4New2cB0683PyHKjGgfovCOLUtKaTe+HLuibYEJWt9O2rjFvGD+9xnJ8
         bSDaQOJRXxo6ZDqeQkFbzTvZfIIySC2fD02kD8ERbVa5lfsAA883XdnHgendgVEpsD1T
         YhW/PRwApmSn2vwITj70p8O38Z1My7fl8dyJOIMDS821Wq7ejyz70vu7PhC+Hjolf44V
         HhpZXQ6QJ7MXSNUAPr05eGKeA52QIM7F/cXQP6o8AqjYxoKG0N1qXOD7bTDtAp3GW+5B
         mUZ9wBSB31f+z3350bCaZSWgH21JsK0GiCiSFay9gZIHqcPUcplofF9y4kfG8TjkQiyS
         JalQ==
X-Gm-Message-State: AOJu0Yz3a9jORuI3WCNzOGfpWjEMvf8HJ0VwrnWQ2uBBmCaZ27OWaLMU
	TzjxKqCHpAl2cWJpTP0e2iIw5qRMT3l45uXTNv4NOtdHy8TJKrTe
X-Gm-Gg: ASbGncsQhPSdxY7aqOl3rSvpI3Z9cyU0KeywamUZTkcrCt1C67mv6zTTFdt4NIsb9Xa
	n7693F/atLNYcUNw74tt/lLt6mavY5dvo7E2/vNYgvAiuSxK49ikvAbY/Ucfr7YYJEhvmp3zmd0
	82zXFqX1OZoU30Kgj0lCZW/j+PI3R+8D8gXfNFmZDh56Uyar4kxzDvYzEGBFVO2mPM8jX+Q81BF
	eJodXJGaq/npVjQpT62irtAELPRpq6hXdl/lTbUF8iQEKsM9l2lvm43aNAlWc2JXefpDPhQUNXT
	PLNerGqAS2fVzzg3iBjQzwSvVtT7koeHkMsiH14hi1a/
X-Google-Smtp-Source: AGHT+IF6NhIA4/e92YTvAGevSVPkRbieuNwH5uHI0/ToYrA7HYjc7Oo0GT4IQFd3XFfIwhzjh82sQQ==
X-Received: by 2002:a05:6402:40c9:b0:5e4:d2c9:455c with SMTP id 4fb4d7f45d1cf-5f0b3b99994mr11073779a12.10.1744067662646;
        Mon, 07 Apr 2025 16:14:22 -0700 (PDT)
Received: from localhost ([185.92.221.13])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f087715635sm7128002a12.2.2025.04.07.16.14.21
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 07 Apr 2025 16:14:21 -0700 (PDT)
From: Wei Yang <richard.weiyang@gmail.com>
To: Liam.Howlett@oracle.com,
	akpm@linux-foundation.org,
	willy@infradead.org
Cc: linux-kernel@vger.kernel.org,
	maple-tree@lists.infradead.org,
	linux-mm@kvack.org,
	Wei Yang <richard.weiyang@gmail.com>,
	"Liam R . Howlett" <Liam.Howlett@Oracle.com>
Subject: [RESEND Patch v2 3/3] maple_tree: assert retrieving new value on a tree containing just a leaf node
Date: Mon,  7 Apr 2025 23:13:54 +0000
Message-Id: <20250407231354.11771-4-richard.weiyang@gmail.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20250407231354.11771-1-richard.weiyang@gmail.com>
References: <20250407231354.11771-1-richard.weiyang@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

Original code may not get the new value after overwriting the whole
range on a maple tree containing just a leaf node. The reason is we didn't
set the only root node dead during destroy.

Add a test case to ensure the new value is returned when overwriting a
tree containing just a leaf node.

Signed-off-by: Wei Yang <richard.weiyang@gmail.com>
CC: Liam R. Howlett <Liam.Howlett@Oracle.com>

---
v2: adjust the changelog according to Liam's suggestion
---
 tools/testing/radix-tree/maple.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/tools/testing/radix-tree/maple.c b/tools/testing/radix-tree/maple.c
index bc30050227fd..1e293e4d856d 100644
--- a/tools/testing/radix-tree/maple.c
+++ b/tools/testing/radix-tree/maple.c
@@ -35256,6 +35256,30 @@ static noinline void __init check_rcu_simulated(struct maple_tree *mt)
 	MT_BUG_ON(mt, mas_prev(&mas_reader, 0) != xa_mk_value(val));
 	rcu_read_unlock();
 
+	/* Clear out tree & create one with only root node */
+	mas_lock(&mas_writer);
+	mas_set_range(&mas_writer, 0, ULONG_MAX);
+	mas_store_gfp(&mas_writer, NULL, GFP_KERNEL);
+	mas_set_range(&mas_writer, 0, 0);
+	for (i = 0; i <= 5; i++) {
+		mas_writer.index = i * 10;
+		mas_writer.last = i * 10 + 5;
+		mas_store_gfp(&mas_writer, xa_mk_value(i), GFP_KERNEL);
+	}
+	mas_unlock(&mas_writer);
+	target = 10;
+	mas_set_range(&mas_reader, target, target);
+	rcu_read_lock();
+	MT_BUG_ON(mt, mas_walk(&mas_reader) != xa_mk_value(target/10));
+
+	/* Overwrite the whole range */
+	mas_lock(&mas_writer);
+	mas_set_range(&mas_writer, 0, ULONG_MAX);
+	mas_store_gfp(&mas_writer, xa_mk_value(val), GFP_KERNEL);
+	mas_unlock(&mas_writer);
+	MT_BUG_ON(mt, mas_walk(&mas_reader) != xa_mk_value(val));
+	rcu_read_unlock();
+
 	rcu_unregister_thread();
 }
 
-- 
2.34.1

