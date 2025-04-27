Received: from mail-io1-f97.google.com (mail-io1-f97.google.com [209.85.166.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA13A2253BB
	for <linux-kernel@vger.kernel.org>; Sun, 27 Apr 2025 04:58:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.97
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745729897; cv=none; b=R6TzTuon2GxnjR0qoG/h8g5l1xgHqCWV8ds3yjKyVFg3iMtxs0Hsup9qG3XSGC/BNeBGW4ewxJcCLZBq9xGt+RWpKcdtTxDSlJ5/mTpq7OGALq/Wz3cfMa9WbP5FRjZRsl2N2vCRSZ6f6tMaeYf/MrKU7OnumGFn1lRpP+d/Tv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745729897; c=relaxed/simple;
	bh=oIBkaOzmzRNKwMu0Zka0IvPrQeilzVPo9yAnvSXcDVo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qqbwkOrjYXuT4Vij0WwXnCDmUT1d4uJq9J7b+FcS4wR6FAfAkF96cvAfoy1zokyjUh2QMmHH6Y+jP6uuo9x3VU3pIfk13MV0ZCauqee44TNoqTocSfL3tceS2x7uBqxNJ7KdR7Kn8iKmo6TUpOey3XmHF1qz12e/r7VMl8NdtjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=fail smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=gaVFXBzz; arc=none smtp.client-ip=209.85.166.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="gaVFXBzz"
Received: by mail-io1-f97.google.com with SMTP id ca18e2360f4ac-85eb6cd4dc6so7089939f.0
        for <linux-kernel@vger.kernel.org>; Sat, 26 Apr 2025 21:58:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1745729895; x=1746334695; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ojx7jbcUbWv7jMLWA0u2cWOta66QExx1ehN488w0QZ0=;
        b=gaVFXBzzw6eRWHTeR4Pmg/F+63ka7z+xyHfZqT/bg5ia+c/4aDBqsaZ0G5PagkaC3k
         6jgISxOnDQXTIcAAVZ85IxmC94YaRCfDqBnNWGS4u/1V16FvPuQlHJ13hmnC4upmZubH
         VBcvRkMv0AEh4uyym4bGA4xXlb/6e88b6+SU6OuQfm1GQN/YQkbXD3HoXWXHsZS7r2MO
         dYbkCAVlvqedhnbv+GJlg4aPrBCmQkzfImb3+hx0QMFA0zTOq401i2e02cAhzI8z6Bqp
         Iicfcp2CJg5Dze5OVghB4NpOigMCLqtzHPqUljVcBLNhhDnizxUr2oQeQQf4Ag1QtL+E
         WGKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745729895; x=1746334695;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ojx7jbcUbWv7jMLWA0u2cWOta66QExx1ehN488w0QZ0=;
        b=ebjREX0rTP0c45VjA4W0ovmUJXY9q9hS7pPm+gCa0LomezDlTGxZONbVf7z3+HGlcz
         W9Uo0V8biLKoR9I8lo7Ssbotw/DHUfouRmNR5b/x82AboRSprIZ7nJjp7ts6/+uXB04z
         j8xJ7yYlOSugrhONY6CIT7MzmExJOtpbu1Amcwrha8dm8rmDE0kQxfM+25A/+YB5nrVq
         tCrttfdAFE7Blc3jWvPHfkMmWl8+YPb/erxPj4VTI0hARuL/5dsAMl+hTBeGxLvCcoRO
         bgQZoT41RvPqZXjpqZmQZkFFEs8YwlhDo5IOPdev+k05j+BeKasXyfr/n9m2p5NaAzL+
         B/XA==
X-Forwarded-Encrypted: i=1; AJvYcCX7iKIv/tdxWDidCuu7Z7usNSxHg3nZDONMbh9Fdvqe+P2JszzdkAqqbwmcRAnqB/cdAnjzry40XyiUCd8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzOxOPRQHN0F4ET2rHntwpr7vchy5VdCWloU8WpRoVqkqDzSeOB
	jDrTMorPSufeC4ma+B4LU3dsuSdHbSnZP/DWIH5jIdmxdOAaCDU5vkNyNIxVfpf+q5dFiN7aBdU
	gzlwuehSKvFEr6+P62jZvXZ7PGJRpg2wX
X-Gm-Gg: ASbGncslFDPgsrWCH/pWNf3kF8qTa6bkJZhCxip9/yxXbYwVwWU5UYffnUlLE8eM470
	kk7/dc3zGZ2hY85uhFA1QbxJpZzAzW7QMWww/PZ9ULJSAdevpw0kYH47d2YLGfQNrE7zz5lJH+w
	gxwyXil0jcDoMll6crso1+p3HmwrfZhVtiFlAWGh3/UsuIdm/Srm174AzBZnjsKJS7LNmpAF89p
	JmT9OvQ7RRz/oiqCQTsY+EQVF2jiR/qVvICq9+VKCqjxz4TQNMIGmrnDhbCXGip0PTlbo1PD6qC
	KvADwEU8U1xMIxnjhywVQeByF+FV/5h1fEGDLqKTdBjX
X-Google-Smtp-Source: AGHT+IHr4dhZ0gpkBaBAMcMjWm8ybAuIo3pPId6du74z65ESO+VJ5lRn6HigPxkY/wHyOmIw19BpuIFs0xJI
X-Received: by 2002:a05:6602:29ce:b0:855:d60d:1104 with SMTP id ca18e2360f4ac-8645cca3116mr219773839f.2.1745729894985;
        Sat, 26 Apr 2025 21:58:14 -0700 (PDT)
Received: from c7-smtp-2023.dev.purestorage.com ([208.88.159.128])
        by smtp-relay.gmail.com with ESMTPS id ca18e2360f4ac-864518f02b4sm47300839f.11.2025.04.26.21.58.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Apr 2025 21:58:14 -0700 (PDT)
X-Relaying-Domain: purestorage.com
Received: from dev-csander.dev.purestorage.com (unknown [IPv6:2620:125:9007:640:ffff::418a])
	by c7-smtp-2023.dev.purestorage.com (Postfix) with ESMTP id 5A1A534042F;
	Sat, 26 Apr 2025 22:58:14 -0600 (MDT)
Received: by dev-csander.dev.purestorage.com (Postfix, from userid 1557716354)
	id 57A97E40C3E; Sat, 26 Apr 2025 22:58:14 -0600 (MDT)
From: Caleb Sander Mateos <csander@purestorage.com>
To: Ming Lei <ming.lei@redhat.com>,
	Jens Axboe <axboe@kernel.dk>
Cc: Uday Shankar <ushankar@purestorage.com>,
	linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Caleb Sander Mateos <csander@purestorage.com>
Subject: [PATCH 7/8] ublk: check UBLK_IO_FLAG_OWNED_BY_SRV in ublk_abort_queue()
Date: Sat, 26 Apr 2025 22:58:02 -0600
Message-ID: <20250427045803.772972-8-csander@purestorage.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250427045803.772972-1-csander@purestorage.com>
References: <20250427045803.772972-1-csander@purestorage.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ublk_abort_queue() currently checks whether the UBLK_IO_FLAG_ACTIVE flag
is cleared to tell whether to abort each ublk_io in the queue. But it's
possible for a ublk_io to not be ACTIVE but also not have a request in
flight, such as when no fetch request has yet been submitted for a tag
or when a fetch request is cancelled. So ublk_abort_queue() must
additionally check for an inflight request.

Simplify this code by checking for UBLK_IO_FLAG_OWNED_BY_SRV instead,
which indicates precisely whether a request is currently inflight.

Signed-off-by: Caleb Sander Mateos <csander@purestorage.com>
---
 drivers/block/ublk_drv.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/block/ublk_drv.c b/drivers/block/ublk_drv.c
index ea63cee1786e..2296fa677d0d 100644
--- a/drivers/block/ublk_drv.c
+++ b/drivers/block/ublk_drv.c
@@ -1607,20 +1607,15 @@ static void ublk_abort_queue(struct ublk_device *ub, struct ublk_queue *ubq)
 	int i;
 
 	for (i = 0; i < ubq->q_depth; i++) {
 		struct ublk_io *io = &ubq->ios[i];
 
-		if (!(io->flags & UBLK_IO_FLAG_ACTIVE)) {
+		if (io->flags & UBLK_IO_FLAG_OWNED_BY_SRV) {
 			struct request *rq;
 
-			/*
-			 * Either we fail the request or ublk_rq_task_work_cb
-			 * will do it
-			 */
 			rq = blk_mq_tag_to_rq(ub->tag_set.tags[ubq->q_id], i);
-			if (rq && blk_mq_request_started(rq))
-				__ublk_fail_req(ubq, io, rq);
+			__ublk_fail_req(ubq, io, rq);
 		}
 	}
 }
 
 /* Must be called when queue is frozen */
-- 
2.45.2

