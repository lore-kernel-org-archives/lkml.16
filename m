Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2055525C712
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 14:39:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745851145; cv=none; b=tmJrUKAi24Iq+xMlpDQOFFVhIX588obLMX3od/+sz1O7ra0kIQart/QNjIkveQImzDhZ/vtlRr/p6bPJW7IlnC1ml2NcoLnCH+caD2NKjErfFubFwWy9hcNm/Gd1L6qVBL3o9OP0T+Xaxybw6HdqZf0gR3AYc1F+ucw1UTxBrdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745851145; c=relaxed/simple;
	bh=0NkDHACqleW6reI4Vv7RYU8PfSu6tmBLb35jFPL2ZjU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=K1NHXrLpwxJSq03xmZXiAT3sR+uYz77LDU2cJqGlwG99Auv7aFmUvvNypf+SLHq41s2FlSIT2+4GyWRzwd41y8XSP0VOVRzAEnzDOM9RWx1XBg48cWAcw/fnJB7dT+tTXaDWw7v4VH2F+ezDmoJo15JqezC/PuoOg1lo3lgi8M8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ionos.com; spf=pass smtp.mailfrom=ionos.com; dkim=pass (2048-bit key) header.d=ionos.com header.i=@ionos.com header.b=UpSobJPh; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ionos.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ionos.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ionos.com header.i=@ionos.com header.b="UpSobJPh"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43cfa7e7f54so32826385e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 07:39:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ionos.com; s=google; t=1745851141; x=1746455941; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rBCzcr8ajh54REQAx5tYqo576zUyQ0mpJURQTfjVOMk=;
        b=UpSobJPhho9ckso5BYR2GWsIAGYFXX04u9mMA+O2nf83hUzhzlOcp6mMFulEn3vJHH
         TPdYYwhEgMtKAF7GmA/MRMqJoMaGsP20DeXL+Qea6TTAtOLJEIA3ISTWOD2SEgjN76sY
         kMxmvXnYBQYik/LBCIlP3+fXjZa8WaOoIgBrU6dZwYSpOtxeb+30KHsOGftUOcwqkmV4
         fD0XkJIyvMu6YAy38azRoGJLcNeWCRJxw1YqjWnnJHyTeTPvkNbDDYlRQtGIBBkOGEU7
         vR/iWvvRPpZICyk8WX1FAaLDEQiQLOcPgWp9i6N+Ga+vJZpwfhWCgCQNMXAMfQi13ciD
         80SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745851141; x=1746455941;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rBCzcr8ajh54REQAx5tYqo576zUyQ0mpJURQTfjVOMk=;
        b=jVydNYiQl6sTzXfvfkP+WiSAgR2w1VDh9lgvQ0IHdeQJFf47R6EWdXU3gK4l8BqnD7
         VUND/Ki5TzfHctEcIFzBva8Gk2vd9ybHcwTbyX4JPX2sAFI/3Vd27WyVNLPdv6dfNIBU
         xwoTt/E+NOoS4YDRohwA1leATxgcOcoxoR7sb4vtkObfkImB1+f+2je7c6wvmHbmEBNw
         dhT9Qou+3psfM1vSAqrFxo9Deel5wZSC80+zvvMWhJp5ElY2dzHBBcBMbZWbSG9uyVhJ
         aA+AhulfTcV4VFH1PL8/OPS0KKrn341RLwD5c7TFcCc0C4oMhpXRDln2Kf2Z5u1SYZ8i
         V/Aw==
X-Forwarded-Encrypted: i=1; AJvYcCW0tGpgzsxZxZIZZOMCcNjIc+5Obaj0Ms7UZSxEHZ7aIsQN63WOw406r6dVNHvsv2RwgiXdIshyNQdvpew=@vger.kernel.org
X-Gm-Message-State: AOJu0YyN18TynT8EE+uILqUTExjY8aAVsI1Cf8dcsAOEhRyksCVhV1hc
	w0rE4WZOHjFb+UNguDg6kuVNyE55uVo8bwT0dU1GX8QEf2Xy0rRRq4R/t45Dty0=
X-Gm-Gg: ASbGncu2jhp3qsv0AxQQN+EqtqXqAQIUTpxdlnAeW5yleoEZZ+mYqUqHkCrS7BSZr2r
	p5sURmEJUjKURT1g86wdY0XhJrEdQKSTfEFjPeQme6cULmpvx1qK/blq+mtw4/AM0gEUQljmnSc
	Ds40/PefvWm/TgCG36FpXZ4q0KK//LDZFPbcw3ISsyPfgvEXdWNWUQg9sPWMbjDLInEiSv9bJVn
	OqsfaTUtuoENfdKWBj3Mh8a1zIGzxTez+8zB/fC2fRXlCEcDJCce7BLPLZiNkkQlXOEwr79ZH2o
	LEoguFLmAWFI4l62M6o1kxOs8/qw4mhDt9FJr8lyy7ysaeDr0j6F98Ik4QCbqbnpLEogyYXn2Ic
	dvjlN1aBQu1Fe1lB2PavzOIdUoLicuuHBaHgYQHCS
X-Google-Smtp-Source: AGHT+IEsI2tKNcN8RrWxjF8JifLNV7R3TyH9+atKe855qmLQ6QAhvksJgkeh136stStXy9yNo0rwmQ==
X-Received: by 2002:a05:600c:2203:b0:43c:f509:2bbf with SMTP id 5b1f17b1804b1-4409c512d58mr134362435e9.15.1745851141454;
        Mon, 28 Apr 2025 07:39:01 -0700 (PDT)
Received: from raven.intern.cm-ag (p200300dc6f46c100023064fffe740809.dip0.t-ipconnect.de. [2003:dc:6f46:c100:230:64ff:fe74:809])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a07a5ed2e0sm8793118f8f.39.2025.04.28.07.39.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 07:39:01 -0700 (PDT)
From: Max Kellermann <max.kellermann@ionos.com>
To: dhowells@redhat.com,
	netfs@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Max Kellermann <max.kellermann@ionos.com>
Subject: [PATCH] fs/netfs: remove unused flag NETFS_ICTX_WRITETHROUGH
Date: Mon, 28 Apr 2025 16:38:59 +0200
Message-ID: <20250428143859.3210257-1-max.kellermann@ionos.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This flag was added by commit 41d8e7673a77 ("netfs: Implement a
write-through caching option") but it was never used.

Signed-off-by: Max Kellermann <max.kellermann@ionos.com>
---
 fs/netfs/buffered_write.c | 3 +--
 include/linux/netfs.h     | 1 -
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/fs/netfs/buffered_write.c b/fs/netfs/buffered_write.c
index b4826360a411..26a789c8ce18 100644
--- a/fs/netfs/buffered_write.c
+++ b/fs/netfs/buffered_write.c
@@ -115,8 +115,7 @@ ssize_t netfs_perform_write(struct kiocb *iocb, struct iov_iter *iter,
 	size_t max_chunk = mapping_max_folio_size(mapping);
 	bool maybe_trouble = false;
 
-	if (unlikely(test_bit(NETFS_ICTX_WRITETHROUGH, &ctx->flags) ||
-		     iocb->ki_flags & (IOCB_DSYNC | IOCB_SYNC))
+	if (unlikely(iocb->ki_flags & (IOCB_DSYNC | IOCB_SYNC))
 	    ) {
 		wbc_attach_fdatawrite_inode(&wbc, mapping->host);
 
diff --git a/include/linux/netfs.h b/include/linux/netfs.h
index c86a11cfc4a3..e1c224d50894 100644
--- a/include/linux/netfs.h
+++ b/include/linux/netfs.h
@@ -71,7 +71,6 @@ struct netfs_inode {
 	unsigned long		flags;
 #define NETFS_ICTX_ODIRECT	0		/* The file has DIO in progress */
 #define NETFS_ICTX_UNBUFFERED	1		/* I/O should not use the pagecache */
-#define NETFS_ICTX_WRITETHROUGH	2		/* Write-through caching */
 #define NETFS_ICTX_MODIFIED_ATTR 3		/* Indicate change in mtime/ctime */
 #define NETFS_ICTX_SINGLE_NO_UPLOAD 4		/* Monolithic payload, cache but no upload */
 };
-- 
2.47.2

