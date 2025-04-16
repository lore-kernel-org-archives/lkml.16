Received: from mail-il1-f225.google.com (mail-il1-f225.google.com [209.85.166.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABDBD209F49
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 17:19:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.225
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744823985; cv=none; b=hpPQZGyO/ezF2HHOR7RCMG78Zcri7p6YuM2TFMMahkO6H2d4pBSpK0xX7y73SbAsv/7kJwRvjppVjTShmzseDkzWstasMJk8q0cRmPUYdUG+e1+4uBWzxb3tDidEyPeBcM+vT6C+an6rpJFUphQPmSdZCnQ7zqbmj+OUysTG+WI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744823985; c=relaxed/simple;
	bh=Jdul7mIi0SI39rHbQcZeGKUIsPeQp07xNs933AKZvxo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=vGZaXke6EbPn2y5iFSYrj/iEpIIjIbKSrTInjtxIzlf3OjBknd39n1UEDeHdxrXT0XT5mNLBAaK6wC5tNO32lumCWZoT0L5DwweL46f02mlbxbleFVTjyt1wFSgVKNuNvQVycI2TxSkRpA13nB+WRfabP0xfFEn8Qy8xtF3g4iw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=fail smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=fvK+ADV9; arc=none smtp.client-ip=209.85.166.225
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="fvK+ADV9"
Received: by mail-il1-f225.google.com with SMTP id e9e14a558f8ab-3d4369dbc68so2618225ab.1
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 10:19:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1744823982; x=1745428782; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=s6YM1XU/Q3lMIPjN1HiMhhADYbdrromAw/vpklmGoXI=;
        b=fvK+ADV9+S40LOWUlvnOjOlRr86+Q7Sxl2/jiKbkdDEmGmpHuhn9mRZWB10BSkZ1Yz
         Wazu5OH4AQekIGDE8vsmcugArnCBSkvao2fu1K8+l2YQ8sD6jNKcqalewTRlFFY/6Qxk
         h+xXUm7jMW3moOB9DQUPvRZZvI2Bt5b5ppCa/yEMB+tOA5U+BdqlRR2UQwABBa8eR+t1
         cVg8yhcY+arOuhMXrnra0qipr3eYDWWv/FZcZD+ksR5wypicTLGYSsizbawfSwEHXNUp
         0UwiJ4U8qqODFmRW+uNKFmPGjyY6sx7C2bTpcSshStl1jsDs0OJDxB/3cm/Nr52Uqi7v
         OHag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744823982; x=1745428782;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s6YM1XU/Q3lMIPjN1HiMhhADYbdrromAw/vpklmGoXI=;
        b=w5lW7d00BpVURkFbjdXUggZ5HbsePicqzVjLELnhtg3p+1/99joTlhBECkYxtU0Ro9
         kI/OfdxIqUz8jRKjgwoHjiqXSoZjkftmznZdhJInNBa6w6frwyhmw5IkbqDYyhk7YTHZ
         iYoqjkuYQClmmqznUuwTPqT5fgBEuE8LDuXCUMnYr7qyNJMgzg6GKnODf8cmneDZENQZ
         GHFkRFSdQo1OdQ79QZd90oLh+AANH4D02tSk30gEXTPASCQcsVRufobmBuUY4DwMfdMP
         +fLzAoLqXCerSVOUPJjyVGC+eDGXjZBaY+rnUMKX/4WCtKesil3D49zi+2CmxcxrxiA/
         /qgQ==
X-Forwarded-Encrypted: i=1; AJvYcCUjwL9rI7AHRy9W3ILCpgwzaU2x+emjbfCZ98kdotIvMiaqZGGTa3Fdq24+w04V8PcI4oO9dfoQbolbLso=@vger.kernel.org
X-Gm-Message-State: AOJu0YxAL+GCcTHePQBc1vLxpt6ipWQ392SjtJwZR9VnQw4cvlqWJOb+
	mq3qsz0e1oyFcmd9mPU6BcMrVnNGJ0fdNJCOMzkm91oQNrZSPshk80uq4BP5xhHPPq6myiSkJ2o
	jpsT5frQE6Mnzgi5kY0jczGCGqSpD/0CB81GoYS8OD7ELUmk4
X-Gm-Gg: ASbGncuzSqGETOAvWgy2MVHPW7/vRmgzNsdi8W3RqknjvdnhwOxjjioU2ZL4NScym/R
	HwXwskiw74JqdUgry8H1LNQVUczbkZNhXNwa5Vi3ypkKDFwLc+pD9iLFuK85pBNltU94nBivP1Q
	TXqH2qJuAT3B7fMVNazPxTsVv1wukQ/809TntHMAq0Ym/X8g5CPke8odItZ4vqrxNA89zI0EHB6
	XjE7jN1AFH2J2p61iz+6YHUlhfo4HCEgBStBry+zP5CRvtksZZQgUohHmXjITSPAd2/FCuQ2gxn
	01Tm36p4UMSQq1tAFeN0fQtbQoBKYQ==
X-Google-Smtp-Source: AGHT+IHPsZFqzWspQw0JA+axjRxjJ5W5xe56ezwcPUl62MNyenUcWO76po9QsilciCFSPlTsDUDfxjM+K0bq
X-Received: by 2002:a05:6e02:3091:b0:3d4:cd:2a08 with SMTP id e9e14a558f8ab-3d81a3c4194mr1859855ab.4.1744823981699;
        Wed, 16 Apr 2025 10:19:41 -0700 (PDT)
Received: from c7-smtp-2023.dev.purestorage.com ([2620:125:9017:12:36:3:5:0])
        by smtp-relay.gmail.com with ESMTPS id 8926c6da1cb9f-4f505d41cc9sm769431173.41.2025.04.16.10.19.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 10:19:41 -0700 (PDT)
X-Relaying-Domain: purestorage.com
Received: from dev-csander.dev.purestorage.com (dev-csander.dev.purestorage.com [10.7.70.37])
	by c7-smtp-2023.dev.purestorage.com (Postfix) with ESMTP id 1CFA334035E;
	Wed, 16 Apr 2025 11:19:41 -0600 (MDT)
Received: by dev-csander.dev.purestorage.com (Postfix, from userid 1557716354)
	id 15ACBE417E7; Wed, 16 Apr 2025 11:19:41 -0600 (MDT)
From: Caleb Sander Mateos <csander@purestorage.com>
To: Ming Lei <ming.lei@redhat.com>,
	Jens Axboe <axboe@kernel.dk>
Cc: Caleb Sander Mateos <csander@purestorage.com>,
	linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ublk: pass ubq, req, and io to ublk_commit_completion()
Date: Wed, 16 Apr 2025 11:19:33 -0600
Message-ID: <20250416171934.3632673-1-csander@purestorage.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

__ublk_ch_uring_cmd() already computes struct ublk_queue *ubq,
struct request *req, and struct ublk_io *io. Pass them to
ublk_commit_completion() to avoid repeating the lookups.

Signed-off-by: Caleb Sander Mateos <csander@purestorage.com>
---
 drivers/block/ublk_drv.c | 16 ++++------------
 1 file changed, 4 insertions(+), 12 deletions(-)

diff --git a/drivers/block/ublk_drv.c b/drivers/block/ublk_drv.c
index bc86231f5e27..10bfa13aa140 100644
--- a/drivers/block/ublk_drv.c
+++ b/drivers/block/ublk_drv.c
@@ -1525,27 +1525,19 @@ static int ublk_ch_mmap(struct file *filp, struct vm_area_struct *vma)
 
 	pfn = virt_to_phys(ublk_queue_cmd_buf(ub, q_id)) >> PAGE_SHIFT;
 	return remap_pfn_range(vma, vma->vm_start, pfn, sz, vma->vm_page_prot);
 }
 
-static void ublk_commit_completion(struct ublk_device *ub,
+static void ublk_commit_completion(struct ublk_queue *ubq,
+		struct request *req, struct ublk_io *io,
 		const struct ublksrv_io_cmd *ub_cmd)
 {
-	u32 qid = ub_cmd->q_id, tag = ub_cmd->tag;
-	struct ublk_queue *ubq = ublk_get_queue(ub, qid);
-	struct ublk_io *io = &ubq->ios[tag];
-	struct request *req;
-
 	/* now this cmd slot is owned by nbd driver */
 	io->flags &= ~UBLK_IO_FLAG_OWNED_BY_SRV;
 	io->res = ub_cmd->result;
 
-	/* find the io request and complete */
-	req = blk_mq_tag_to_rq(ub->tag_set.tags[qid], tag);
-	if (WARN_ON_ONCE(unlikely(!req)))
-		return;
-
+	/* complete the io request */
 	if (req_op(req) == REQ_OP_ZONE_APPEND)
 		req->__sector = ub_cmd->zone_append_lba;
 
 	if (likely(!blk_should_fake_timeout(req->q)))
 		ublk_put_req_ref(ubq, req);
@@ -2032,11 +2024,11 @@ static int __ublk_ch_uring_cmd(struct io_uring_cmd *cmd,
 			ret = -EINVAL;
 			goto out;
 		}
 
 		ublk_fill_io_cmd(io, cmd, ub_cmd->addr);
-		ublk_commit_completion(ub, ub_cmd);
+		ublk_commit_completion(ubq, req, io, ub_cmd);
 		break;
 	case UBLK_IO_NEED_GET_DATA:
 		if (!(io->flags & UBLK_IO_FLAG_OWNED_BY_SRV))
 			goto out;
 		ublk_fill_io_cmd(io, cmd, ub_cmd->addr);
-- 
2.45.2

