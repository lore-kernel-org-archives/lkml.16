Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85B1A1E282D
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 20:47:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745873273; cv=none; b=WXax5yygMWKFYZKfASFezvpWpwzJ6f6R37XNJPrhgrjJNlPJDkZOs7qFMLflmd6as6x9K/IQakPSK/mQ8VZXJ9ix2KF9qmrC3YpaNIEGLdt9QpBKHzCkyWzvFJIpaY/+yo/uAE0Aa7Zf6ObbJDQ3+dqORNzhokPaO++F7EVWxkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745873273; c=relaxed/simple;
	bh=f0A7Pv4mUmek+mS/LEx5Ttoi2xlGO1ZlQEuhN91pDOI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RXH/wNuuH90exI0H24wcc4b6vAQUoKqEnYUG3huzg6Am5Z2T5HhpAqPpxxvyjGmJX0WpGp4tx2Pxs9hxI+P5tSIhnjkf0Xf+BU6IlGdpxxVy2c2ZakKrZMCkWFIZ2qBnJL8WsecnZcyFDzi8HSc5yc4pS/Z5jNo3CbK5qWgCeDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ionos.com; spf=pass smtp.mailfrom=ionos.com; dkim=pass (2048-bit key) header.d=ionos.com header.i=@ionos.com header.b=RytpChA5; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ionos.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ionos.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ionos.com header.i=@ionos.com header.b="RytpChA5"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-43cf257158fso30190375e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 13:47:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ionos.com; s=google; t=1745873269; x=1746478069; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yhRzZPkotlQhfGJ0VfQNAgHBp9wCgKx0I/9SO7HTcOI=;
        b=RytpChA5ZTaM3oPl+7K3SBfc1szc/xp6jtG0ABFRqON18wmi+mvb793K/mcdED/7Yh
         +SqNSVOY9qVG7ZO+HJTgUR2KU5BrDQa+Z3K/vV378YXuetJOapHLWWbxOYJtRd1jO5G6
         HUNWtRGmGJkGUdqOoV9DtGX4BBLc0bJ2GsxuGxSLHjA9+oUn7lDIKKMkINY92VVhxbp0
         K50k4fPgh/EPMRAzLbaL3KH2kV1liGlNqYGc0qgVJpl8XvzSmvX7fccvsiEb0myA/zpg
         AtzVak6v42ip0+GwDFXP315jnILtHYA+NLBB9aSLTtTsUYGGrbdW4PruZPwwPi6QgG9T
         l9GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745873269; x=1746478069;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yhRzZPkotlQhfGJ0VfQNAgHBp9wCgKx0I/9SO7HTcOI=;
        b=KtDCpTNJqadPCTQBCW6HVOoRXGCxi6rVyX9kAlyC5Mh716y2IMO8g0HCUUXEFho/1d
         3DgW5F55Qo+ee2B8NToYHmu2ZmU2KAxBFaA0M7dk5xrmsxif8h75otMyS7BtnNvqQi6C
         BBk8MW/3qFJwuPvj3lPtfa/2kYPz78eXLCh9F/VCvzzPnssCgbRlVBv7UwzCbJQ1LJrZ
         kABZklgXDul2QCYoJTSlkZT9JuF5rSQZwVqDTY9rPJOZFvWSzf3MKc67/jT7ifUa3Ll/
         B+ejVAyITZrQ6PLEDxTpnSFvbwjdHIZtxwW0symNCyYjVtjYVvkonv2nImv9w+tIhMM+
         o0Ig==
X-Forwarded-Encrypted: i=1; AJvYcCWWtFDCS9VAkpX6QKEHF5ekXeilmsqjFbbU0dpA29/3OAyhUfqprku4p8Wqf2dONNOc8GsOGKebuDfMqVI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxv5l2p4Hz8JWboUU/9ctBkngA96hCg32qIwa8OXczPDiugejK4
	p1TySO97kqXP/GGKo9wbbqHVH6aByhBgWiIvQkzktqRbydaFZpHijSCNw/CRxl8=
X-Gm-Gg: ASbGncvADgOiARYcIXLbUHOKAZdKKvgrxARRMz2keu4K0XElKg265wxMwEYxTKW4pLU
	FP26RA4c+E4z6ipRjjaSdQQNwryLkGRNXdlDZlLFMlVPooXCHuzLDIFhKF/x/i+6lW8gIzkKdd1
	aA1V6jkSHrMiSNuZnKTeosSrRhTqYm3RDeO9wJC8u+Z/ME7iESY5M7OG8o+zbFyXJopk3m9WLhI
	OSbAwnggbT8ZN0NcDMb67kLajHxb3HKfVAVCTo0Fw/5Iyp2IrWv/y9jZ4yAHvx7VGToawBf/Tji
	5JgKqFrZelviniDgvA+KtGy4fYYH5UQqWJsvW/bF4Rof0OeMZugoATC1tgb2zjUg8mUdahB+0V3
	otajRNKQDpQfRCriHiH9jPCVz39N6YkB/Ccl8S6CP
X-Google-Smtp-Source: AGHT+IGDcQ1DOtPDev5XDzOw6El4Y5dmKj6k+SP8aP+b4hCmYsuphl2n6OAtORooXHR0Cj3D9Z18yA==
X-Received: by 2002:a05:600c:4f8f:b0:43d:7588:667b with SMTP id 5b1f17b1804b1-440ab7b5f6emr96114365e9.10.1745873268779;
        Mon, 28 Apr 2025 13:47:48 -0700 (PDT)
Received: from raven.intern.cm-ag (p200300dc6f46c100023064fffe740809.dip0.t-ipconnect.de. [2003:dc:6f46:c100:230:64ff:fe74:809])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4409d29ba29sm168590675e9.7.2025.04.28.13.47.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 13:47:48 -0700 (PDT)
From: Max Kellermann <max.kellermann@ionos.com>
To: dhowells@redhat.com,
	netfs@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Max Kellermann <max.kellermann@ionos.com>
Subject: [PATCH v2 2/2] fs/netfs: remove unused flag NETFS_RREQ_BLOCKED
Date: Mon, 28 Apr 2025 22:47:39 +0200
Message-ID: <20250428204739.3405489-2-max.kellermann@ionos.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250428204739.3405489-1-max.kellermann@ionos.com>
References: <20250428204739.3405489-1-max.kellermann@ionos.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

NETFS_RREQ_BLOCKED was added by commit 016dc8516aec ("netfs: Implement
unbuffered/DIO read support") but has never been used either.  Without
NETFS_RREQ_BLOCKED, NETFS_RREQ_NONBLOCK makes no sense, and thus can
be removed as well.

Signed-off-by: Max Kellermann <max.kellermann@ionos.com>
---
v1 -> v2: split into two patches, see
  https://lore.kernel.org/netfs/88831.1745855591@warthog.procyon.org.uk/
---
 fs/netfs/direct_read.c | 3 ---
 fs/netfs/objects.c     | 2 --
 include/linux/netfs.h  | 2 --
 3 files changed, 7 deletions(-)

diff --git a/fs/netfs/direct_read.c b/fs/netfs/direct_read.c
index 5e3f0aeb51f3..f11a89f2fdd9 100644
--- a/fs/netfs/direct_read.c
+++ b/fs/netfs/direct_read.c
@@ -106,9 +106,6 @@ static int netfs_dispatch_unbuffered_reads(struct netfs_io_request *rreq)
 			netfs_wait_for_pause(rreq);
 		if (test_bit(NETFS_RREQ_FAILED, &rreq->flags))
 			break;
-		if (test_bit(NETFS_RREQ_BLOCKED, &rreq->flags) &&
-		    test_bit(NETFS_RREQ_NONBLOCK, &rreq->flags))
-			break;
 		cond_resched();
 	} while (size > 0);
 
diff --git a/fs/netfs/objects.c b/fs/netfs/objects.c
index dc6b41ef18b0..d6f8984f9f5b 100644
--- a/fs/netfs/objects.c
+++ b/fs/netfs/objects.c
@@ -64,8 +64,6 @@ struct netfs_io_request *netfs_alloc_request(struct address_space *mapping,
 	}
 
 	__set_bit(NETFS_RREQ_IN_PROGRESS, &rreq->flags);
-	if (file && file->f_flags & O_NONBLOCK)
-		__set_bit(NETFS_RREQ_NONBLOCK, &rreq->flags);
 	if (rreq->netfs_ops->init_request) {
 		ret = rreq->netfs_ops->init_request(rreq, file);
 		if (ret < 0) {
diff --git a/include/linux/netfs.h b/include/linux/netfs.h
index ab6f5e0c38c7..e0c3a63f4f86 100644
--- a/include/linux/netfs.h
+++ b/include/linux/netfs.h
@@ -272,8 +272,6 @@ struct netfs_io_request {
 #define NETFS_RREQ_IN_PROGRESS		5	/* Unlocked when the request completes */
 #define NETFS_RREQ_FOLIO_COPY_TO_CACHE	6	/* Copy current folio to cache from read */
 #define NETFS_RREQ_UPLOAD_TO_SERVER	8	/* Need to write to the server */
-#define NETFS_RREQ_NONBLOCK		9	/* Don't block if possible (O_NONBLOCK) */
-#define NETFS_RREQ_BLOCKED		10	/* We blocked */
 #define NETFS_RREQ_PAUSE		11	/* Pause subrequest generation */
 #define NETFS_RREQ_USE_IO_ITER		12	/* Use ->io_iter rather than ->i_pages */
 #define NETFS_RREQ_ALL_QUEUED		13	/* All subreqs are now queued */
-- 
2.47.2

