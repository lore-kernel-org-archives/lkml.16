Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB1DD19CC29
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 04:20:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749702053; cv=none; b=ohUtrC22adf7dgDct4j/SeoGAET0ktNrF3bWhLqw+jTLb8boo0qqkeLFNEKCt8Fjdn2KIAw24b9S05kHNrozeXavD5W7ULGC6Wth++XjlIYRMbbCbYcR3WthycPJRX5OJR1Ji+p1cRAjmJCIYRysOZlzqnlOIanKjt+3yeS/pb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749702053; c=relaxed/simple;
	bh=vcWyfNfH2YoMo8SESGMWv11jFk5r3IO5X5RUxiSqjBA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ScckBGL2Gt1Oy120PN735kLKlTM4Nog4Yp/VAy96y73LaWjNKY5NTwgEpY0Y5ZvPJ27NhvyGam6zIZLk3/kCBeQB3kGYrDpxUa7wUp4lZHKfgsfthfX6K1JYbhls5w4D+j7VtObK4HBWCJmzRoCkhssRT459qp/2ENKvbTvAI5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ivoNTu/t; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ivoNTu/t"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-7426c44e014so499536b3a.3
        for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 21:20:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749702051; x=1750306851; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VazEG+u3TA3RyAL39AnM0LIMtofKUCAhL1m/XwFY6KE=;
        b=ivoNTu/t/D4nt4VNNZnjSpS5MZE57PLo2KkC4O6SS6tLsVav/T29CuL5CmdQPvRomy
         mmM04CSXoFHLT9rxuZcbWFxmX8tO3MhVpVcL++nP6kvOzj2mPtV4mh2GlP5YreQSc7mF
         Nxi8DTF5Bc/NSu9fb2cyI3oocEvZMQbnHeIv/yKsjuufDk1obwBSI4JPx1FVAKJg45y/
         2BzepYbA9VkAogoDpBpJYAcStZeWn+FZWTapLmW4aA0VvUl3jPuX3r2AfUvHccnRcezn
         k6m2MfbmujpkQSIw/k403nS9vOGJxjPLpRNmZpVDVaxtNsWmnbCx8uG5Qe6FZeekVSEC
         7rmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749702051; x=1750306851;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VazEG+u3TA3RyAL39AnM0LIMtofKUCAhL1m/XwFY6KE=;
        b=QwCBNtdhWfy9eSsXsRSxKqM6t+BLI+z82jGsmL/dhXr1h6vk7h+cW8uXinl0r2bfum
         H3sFcUsASeXMTr3UjBd+atjNW5MGowTMzYqxpmELD5y7WfgNzHmRtpGOUJ/Q+/Kt2U0n
         zaEOdP2xrYA8WYJr+3FLjS6kLN2SHjyk96crKAw9c5LQUtR4CMmR/t9ugO7DMOuZE+E+
         0t06w04Hl8TSnq/bW7gnB54qXAArG2CHE0Jfqu9ORNODvSqPEi/hVe/zxKaIly4N6kIv
         V4d8SD7+N+NI0VmhfcPscnkifoI6xHVKHbkZkqBcCrYAnJ3uDPWApfcT2mPitRDj5BC4
         lemQ==
X-Forwarded-Encrypted: i=1; AJvYcCWPMVvA6J/dUzUWWXL4HoMSxeqPViQtqJzdD9rcSBEdhY7fUUGyDyh5VIV/gxByVY5WKtgoH1JmsIVUP5g=@vger.kernel.org
X-Gm-Message-State: AOJu0YywWkgu1XcEg2tOWJ0EEqiU70wvUTXaimAmcC+2OyEOeR3mufii
	mKaKPdl9URJcabGzPwVW6UOmvnMbiIfCKRxGnKrcbcV38A43WNZ1ltMi
X-Gm-Gg: ASbGncvA5c4OxliyAt+t9ysGl/mQ1n/OKHULDvtTSLl/nix5MFlKBlCsWgV3C5XsPX2
	4+jSbv7nujddzSj0L3dEtZO2AWmenFzLOsg6pOUANZeq3G9OiIrkEkVWJMJGsJRmwkw/Plq2UHK
	oG3HYsBGIl+2U3rdAKtTAGQKlDU6MrwbWjwqPisch5agB6EFyAdRUMfADTDzWi6hhx6YuMRKUHj
	uOl9SQMBxP7IIDLs8QMwa6B40+1sLEG07mdmtQCDj8GyCoY4Bfu4fhKj3K+uun70VpSALev9X+r
	RzAgmXnr6t6WUxivWa43A1qzBWvwu8uartDP63vGPXdt4zi3S/ldKJYHNm6D8EpSfQV8zLs=
X-Google-Smtp-Source: AGHT+IGz+v7XWRB8gVATbbKgN9PPbtb6679dmaW2AM5cLn42LVHX+IFr7zXjcvo9D62SeiJuaDzYhA==
X-Received: by 2002:a05:6a21:339a:b0:21b:603d:708e with SMTP id adf61e73a8af0-21f866d7123mr8102475637.22.1749702050901;
        Wed, 11 Jun 2025 21:20:50 -0700 (PDT)
Received: from EBJ9932692.tcent.cn ([103.88.46.15])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-748809d2b79sm439361b3a.92.2025.06.11.21.20.44
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 11 Jun 2025 21:20:50 -0700 (PDT)
From: Lance Yang <ioworker0@gmail.com>
X-Google-Original-From: Lance Yang <lance.yang@linux.dev>
To: akpm@linux-foundation.org
Cc: zi.li@linux.dev,
	anna.schumaker@oracle.com,
	boqun.feng@gmail.com,
	joel.granados@kernel.org,
	jstultz@google.com,
	kent.overstreet@linux.dev,
	leonylgao@tencent.com,
	linux-kernel@vger.kernel.org,
	longman@redhat.com,
	mhiramat@kernel.org,
	mingo@redhat.com,
	mingzhe.yang@ly.com,
	peterz@infradead.org,
	rostedt@goodmis.org,
	senozhatsky@chromium.org,
	tfiga@chromium.org,
	will@kernel.org,
	Lance Yang <lance.yang@linux.dev>
Subject: [PATCH RFC 2/3] locking/rwsem: clear reader-owner on unlock to reduce false positives
Date: Thu, 12 Jun 2025 12:19:25 +0800
Message-ID: <20250612042005.99602-3-lance.yang@linux.dev>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250612042005.99602-1-lance.yang@linux.dev>
References: <20250612042005.99602-1-lance.yang@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Lance Yang <lance.yang@linux.dev>

When CONFIG_DETECT_HUNG_TASK_BLOCKER is enabled, a stale owner pointer in a
reader-owned rwsem can lead to false positives in blocker tracking.

To mitigate this, let’s try to clear the owner field on unlock, as a NULL
owner is better than a stale one for diagnostics.

Signed-off-by: Lance Yang <lance.yang@linux.dev>
---
 kernel/locking/rwsem.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/kernel/locking/rwsem.c b/kernel/locking/rwsem.c
index 6cb29442d4fc..a310eb9896de 100644
--- a/kernel/locking/rwsem.c
+++ b/kernel/locking/rwsem.c
@@ -205,14 +205,12 @@ bool is_rwsem_reader_owned(struct rw_semaphore *sem)
 		return false;
 	return rwsem_test_oflags(sem, RWSEM_READER_OWNED);
 }
-#endif
 
-#ifdef CONFIG_DEBUG_RWSEMS
 /*
- * With CONFIG_DEBUG_RWSEMS configured, it will make sure that if there
- * is a task pointer in owner of a reader-owned rwsem, it will be the
- * real owner or one of the real owners. The only exception is when the
- * unlock is done by up_read_non_owner().
+ * With CONFIG_DEBUG_RWSEMS or CONFIG_DETECT_HUNG_TASK_BLOCKER configured,
+ * it will make sure that the owner field of a reader-owned rwsem either
+ * points to a real reader-owner(s) or gets cleared. The only exception is
+ * when the unlock is done by up_read_non_owner().
  */
 static inline void rwsem_clear_reader_owned(struct rw_semaphore *sem)
 {
-- 
2.49.0

