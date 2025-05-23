Received: from mail-io1-f44.google.com (mail-io1-f44.google.com [209.85.166.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08803295DB9
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 19:13:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748027597; cv=none; b=OY1I0Ka//IyhyluFEljGXkWqeayU+sX7kyw2qyHC2Mk/pm0ZFHAjJIvW2Yl9qdF3L51zNe49kA+R4EWv2aKSY7zWl0DzK7dYygykxBq1B6S7CC+CqkaphRjgEnQyyWHyl1rynu2RKGgPKgO1Kn8Hg45sI5Kh3zXEia2LU6v++2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748027597; c=relaxed/simple;
	bh=IL7FDug6XL6HuPLkCJPtf6amI7AxYU4yP71Xy1KxJoQ=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=PRv8bFzQ8D+WES2hXMCjwdW3KqpqBK/LsBdzahOUsVp6TJggQmL8aK3LbJbjWiWT26yB5NW4n0vNdrpoSmCAsSIp/y3h+ud/P1H7yRQ+JfYB4HB16kZiVaN9vBRbGdrmUWblTKIObn3F5lU7EgLrcBGKYYI76Pt/9sZL0gn+i8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=Kn/n4fa/; arc=none smtp.client-ip=209.85.166.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="Kn/n4fa/"
Received: by mail-io1-f44.google.com with SMTP id ca18e2360f4ac-85b41281b50so6753039f.3
        for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 12:13:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1748027593; x=1748632393; darn=vger.kernel.org;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vZWysYIK5NbuczsDqNwQhanOOfZdNcWc12ZpPWYqab8=;
        b=Kn/n4fa/6VR7NgrU4xlRgoapImdaJ4gu9fs7zE69rwytHVpyla5CCVFVN6OcUvNcnR
         /ZFUXAEoSi/mWHfPji0bbCHaksOZuG1+U/R6CmQCU23RLjSTV9nBoZyIWDvWCZyRoO1J
         07F4YA8c8N7GO6kvkHHDxAlxWaP+JDSJJ4H2bPVv/bfndDMdQKsFX1JZLbh/mezWTZx7
         jE5MAdhj7E4oaJeMPKj3NT69N1btXXxab6X47eIQZsECVCRPpjy+lQf+vRulTwHm6RQE
         86Kn17uvEY/bM70dR3GJc6uLLU8rWxbbKUlSzf3tyaXsfGp8HwUjBoZsf3hQr1LZgQ6e
         JO7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748027593; x=1748632393;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vZWysYIK5NbuczsDqNwQhanOOfZdNcWc12ZpPWYqab8=;
        b=BIQsPbEp+0f6TQSKQaTq79McvMwBIaiYk2/RzEzy7cUEkbEfZCp6PW60NC2Z6uCdlL
         9bc/ExXc2iIHmdt5hNIVc4zt6QDFvMiyKhmugUxRPQpkadKOb0FKNKMSmrJDc3cutCJv
         I2BNSZJkbPxT4l3EnAhgB6aGgQPn9jdpkt/3AR0eLyp74/rm/qlBLL+NmopBM7wt0Bmr
         lbKIjCJ33NZQpmWSKEuKMU/0EVCO02MeZeGCHYL7LsDuVhlGBskWTFit/Co2tUxnvZ24
         6g4AJaWztJ89IUBhIgAlV4mrBT7/TihLUoA7phyjxIwqe9NvPZenwVg6y31r4HR7nAqg
         L3og==
X-Forwarded-Encrypted: i=1; AJvYcCUccJHx7HxpEoswYclHYU05XJ3iDtxUdABkbe7Q8sEJbMpxJL5ozSXAm+jA+nN0zMitVYUwuqk/793jBDM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwOjvOPSG5GPRSYVnlqcYf4fViqPFyxZdXYf2PBq2U93RfIyTjK
	Xw+msLQ0iJdssEkbDVEl0cPnMsrlI+DhNtZ8TOGw3JB6r7IzgR+O6BfG6dUE9f9qZfYOdGRoEtH
	CCQUJ
X-Gm-Gg: ASbGncvP7VfSiFQPBIOjzRBfuEnz+4FVJ9qId7AJzkZGX54/FqW80+qzQRDzxKhuROG
	pFpT1NuVGjQpEo7F4X9ieO5droVUjvUgouVsSOJXtyGvXxvp4xNu+6D5dAxF5AXn6OkCyyJpSD9
	jk4miIDOkIW9rbYrwSXTRJom3DCEu1RT0ldKeWXBFwTRT1tQg1rkv44pumzBVfXYdt5l4cPnLNM
	K9sDaVdksEJg7upWIx2ZHQjUI2bDIUaT3wlbMGV7aq+KGvKIXYTosxA3lu9aMafzdUncN/qBMPs
	muwvuhOqFShHIpE3j+uUm12jt8V7ynsvrgMxCue84tgiINvM
X-Google-Smtp-Source: AGHT+IHkaiq3z6V4XK/MP4bDZvxNIQ0NdeJzdMHHP0khVF9nqXrNO5OsX4lKLZST8nhOpcLszkPhVA==
X-Received: by 2002:a05:6602:379b:b0:85b:4ad1:70e with SMTP id ca18e2360f4ac-86cbb8706c1mr80472739f.6.1748027592785;
        Fri, 23 May 2025 12:13:12 -0700 (PDT)
Received: from [192.168.1.150] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-86a235e148csm347459939f.12.2025.05.23.12.13.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 May 2025 12:13:12 -0700 (PDT)
Message-ID: <f1d104c6-7ac8-457a-a53d-6bb741421b2f@kernel.dk>
Date: Fri, 23 May 2025 13:13:11 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Andrew Morton <akpm@linux-foundation.org>,
 LKML <linux-kernel@vger.kernel.org>
From: Jens Axboe <axboe@kernel.dk>
Subject: [PATCH] llist: make llist_add_batch() a static inline
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

The function is small enough that it should be, and it's a (very) hot
path for io_uring. Doing this actually reduces my vmlinux text size
for my standard build/test box.

Before:
axboe@r7625 ~/g/linux (test)> size vmlinux
   text	   data	    bss	    dec	    hex		filename
19892174 5938310 2470432 28300916 1afd674	vmlinux

After:
axboe@r7625 ~/g/linux (test)> size vmlinux
   text	   data	    bss	    dec	    hex		filename
19891878 5938310 2470436 28300624 1afd550	vmlinux

Signed-off-by: Jens Axboe <axboe@kernel.dk>

-- 

diff --git a/include/linux/llist.h b/include/linux/llist.h
index 2c982ff7475a..27b17f64bcee 100644
--- a/include/linux/llist.h
+++ b/include/linux/llist.h
@@ -223,9 +223,26 @@ static inline struct llist_node *llist_next(struct llist_node *node)
 	return node->next;
 }
 
-extern bool llist_add_batch(struct llist_node *new_first,
-			    struct llist_node *new_last,
-			    struct llist_head *head);
+/**
+ * llist_add_batch - add several linked entries in batch
+ * @new_first:	first entry in batch to be added
+ * @new_last:	last entry in batch to be added
+ * @head:	the head for your lock-less list
+ *
+ * Return whether list is empty before adding.
+ */
+static inline bool llist_add_batch(struct llist_node *new_first,
+				   struct llist_node *new_last,
+				   struct llist_head *head)
+{
+	struct llist_node *first = READ_ONCE(head->first);
+
+	do {
+		new_last->next = first;
+	} while (!try_cmpxchg(&head->first, &first, new_first));
+
+	return !first;
+}
 
 static inline bool __llist_add_batch(struct llist_node *new_first,
 				     struct llist_node *new_last,
diff --git a/lib/llist.c b/lib/llist.c
index f21d0cfbbaaa..f574c17a238e 100644
--- a/lib/llist.c
+++ b/lib/llist.c
@@ -14,28 +14,6 @@
 #include <linux/export.h>
 #include <linux/llist.h>
 
-
-/**
- * llist_add_batch - add several linked entries in batch
- * @new_first:	first entry in batch to be added
- * @new_last:	last entry in batch to be added
- * @head:	the head for your lock-less list
- *
- * Return whether list is empty before adding.
- */
-bool llist_add_batch(struct llist_node *new_first, struct llist_node *new_last,
-		     struct llist_head *head)
-{
-	struct llist_node *first = READ_ONCE(head->first);
-
-	do {
-		new_last->next = first;
-	} while (!try_cmpxchg(&head->first, &first, new_first));
-
-	return !first;
-}
-EXPORT_SYMBOL_GPL(llist_add_batch);
-
 /**
  * llist_del_first - delete the first entry of lock-less list
  * @head:	the head for your lock-less list

-- 
Jens Axboe

