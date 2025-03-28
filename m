Received: from mail-qv1-f100.google.com (mail-qv1-f100.google.com [209.85.219.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FC80DDC5
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 18:04:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743185091; cv=none; b=GaAY5FF9MBnkX4Oeg2muDRm2WLBTU05B0ufr02JWAmN0ZOAKeOnNtRYayIlZOvwQ0Cl+Va5AWUd8yb9aobI9y0xWi5h6t/r7I1cDtmB3QRiXbN2fliZq0HTQ7z6xAO0xeODK9HJ8gEddyB1vgPc5+DwO/Jr/zpP6K+WV35YA/NM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743185091; c=relaxed/simple;
	bh=gcB0C5YqFqmhQQqyd62UolXkBK1cwcSf4o9DizoUDeM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rhs9Mn6EuNtWtPs/rzj3qG9VdRwHRpcxXfNhtSjuoCZo7NWLitCjQe54oRSHg8CJBfK08A2lF+bdFjDefchlWWNNh8UoVEds04oYBDndDPx3gCwHbcvUiZoPtnz6KljzyPU+sdtGwZ64UPttm5I3i9Sjio+lm9KczphAtl76Iss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=fail smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=bpkw35Jp; arc=none smtp.client-ip=209.85.219.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="bpkw35Jp"
Received: by mail-qv1-f100.google.com with SMTP id 6a1803df08f44-6eb2819468dso3370996d6.0
        for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 11:04:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1743185087; x=1743789887; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w+QsHISAznmPuIeI6H2v/o6YzereVbQ7k5Q0Zm28d6I=;
        b=bpkw35JpI2ah3kX5nEIKvoQ9O9FIOQ76lvHlNCp5k1HWNyhUpI9g1dNQaIo2tMNoNd
         x6yuSmkYOaMKLaDdNYcrYgIygSyWr27fiwW8F9L/LI6lNU+LRpL8JPqMSU0AhdIivsO1
         Ot6Blz7lis5T6FvClgksstfNCON3pmzrRZhOCWTnA3DmutbAee0avs915fBuQhaevwxE
         eQQgpvP2HxR7Oljz0NaQhI1oEaoQ8O9CdjpPta8JFjQhUypI/Fh+UR5Ua5vVXnmcn+4r
         1uaWRR4mHhTwvD7XGCwhNWWL4eixRuaLOiIgzWEMyaHcvli1fp9R6bdnNqdPuI96f0SS
         KuKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743185087; x=1743789887;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w+QsHISAznmPuIeI6H2v/o6YzereVbQ7k5Q0Zm28d6I=;
        b=ZND3tfy5Z+CQMZukuBAwdLOGzADxUmLAnihWNLiROuzLGQmlOyNZ2F/EEA/slNm1Qm
         DATYNydslzoBZ14/x6o2zP20ksHO4B4wZn1WvsAJdng++g6PAwwfoJkaRyyfvntLHgN4
         iJTE31KDa3dnP0v6kcbqBxc+28ZarokYddOyxDRXEON7UgD6yBeLCwwZLiN6p6Inibvs
         851AN9ekP7YK4PRECtkL6/RV2W6VRdojVIWHMZ8OEgG/UZ63zyTDH1bZD7UcOITh+6jo
         6hXg95t96u9UCjGKpPghprLH5dwP7oPqtVssvs3uu+XRtphS66dRkEBFBcka9hMUovvr
         fwYA==
X-Forwarded-Encrypted: i=1; AJvYcCXfBonu+yR7bSJqNz8tHi0mSjnE5E+gwxykPMVBbH8MkT/zf7Lwg93Mc7IN/XgxOuLwMpCu+JOR75vZ510=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5Vfvjaguymz+R+Zf4ziueQqt4FmUjRDYT2tTvnt7vzxAqmo+O
	7KdJeU0amieVh4Zr2rmxJC76xVui6ESWM48fpwDHHRIcoVnEDuHQ6jQfk7w8fcY4TsJeded5N4R
	fPKku8USgRfXZbu9Fz+oE3rCjxEpcU7sx+FaW6ShS+FZdtgT2
X-Gm-Gg: ASbGncs7dMjSrHtPoyAojncHl+fOMIPIqkBgtvomiQ74T2qTi140NDMoC757bT9jYtj
	0P2HkboP4MwUTZR1OeXiEuEot5vX/Z34i1GKLj9uBhye4N1RSMhTmYzzTcytRkcwAA/GQ0wdap4
	l1eqEW+ZZX8GdYJJ3JB9vc7kaeUDywXX1YyryaHgh9jtRheKgdgoA9l7Lf6M2jaYQM2eMbf/AjY
	k+OVICChzzidR0sR1evsIvsjoESpQyZlH3ampQk+CEGnI9ZvdQXe6eqjqoitcAV59fcy2djMqGw
	V9skx6JBUWkKJ9jmrf/SJP2BwNjdlRIpEA==
X-Google-Smtp-Source: AGHT+IGOaSWLBAClwcBn1yitLGGVmefsbpho4O3wbV/JCh+TajmhlWtEu3LwJSrjmgGjceg3yAOfQ85VCQdK
X-Received: by 2002:a05:620a:17a6:b0:7c0:bd67:7dd9 with SMTP id af79cd13be357-7c5eeafa472mr383002585a.11.1743185087021;
        Fri, 28 Mar 2025 11:04:47 -0700 (PDT)
Received: from c7-smtp-2023.dev.purestorage.com ([2620:125:9017:12:36:3:5:0])
        by smtp-relay.gmail.com with ESMTPS id af79cd13be357-7c5f777eac7sm17958185a.3.2025.03.28.11.04.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Mar 2025 11:04:47 -0700 (PDT)
X-Relaying-Domain: purestorage.com
Received: from dev-csander.dev.purestorage.com (dev-csander.dev.purestorage.com [10.7.70.37])
	by c7-smtp-2023.dev.purestorage.com (Postfix) with ESMTP id D13233403C5;
	Fri, 28 Mar 2025 12:04:45 -0600 (MDT)
Received: by dev-csander.dev.purestorage.com (Postfix, from userid 1557716354)
	id CB90DE412FD; Fri, 28 Mar 2025 12:04:45 -0600 (MDT)
From: Caleb Sander Mateos <csander@purestorage.com>
To: Ming Lei <ming.lei@redhat.com>,
	Jens Axboe <axboe@kernel.dk>
Cc: linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Caleb Sander Mateos <csander@purestorage.com>
Subject: [PATCH 2/5] ublk: skip 1 NULL check in ublk_cmd_list_tw_cb() loop
Date: Fri, 28 Mar 2025 12:04:08 -0600
Message-ID: <20250328180411.2696494-3-csander@purestorage.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250328180411.2696494-1-csander@purestorage.com>
References: <20250328180411.2696494-1-csander@purestorage.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ublk_cmd_list_tw_cb() is always performed on a non-empty request list.
So don't check whether rq is NULL on the first iteration of the loop,
just on subsequent iterations.

Signed-off-by: Caleb Sander Mateos <csander@purestorage.com>
---
 drivers/block/ublk_drv.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/block/ublk_drv.c b/drivers/block/ublk_drv.c
index 39efe443e235..8b9780c0feab 100644
--- a/drivers/block/ublk_drv.c
+++ b/drivers/block/ublk_drv.c
@@ -1288,16 +1288,16 @@ static void ublk_cmd_list_tw_cb(struct io_uring_cmd *cmd,
 	struct ublk_uring_cmd_pdu *pdu = ublk_get_uring_cmd_pdu(cmd);
 	struct request *rq = pdu->req_list;
 	struct ublk_queue *ubq = rq->mq_hctx->driver_data;
 	struct request *next;
 
-	while (rq) {
+	do {
 		next = rq->rq_next;
 		rq->rq_next = NULL;
 		ublk_dispatch_req(ubq, rq, issue_flags);
 		rq = next;
-	}
+	} while (rq);
 }
 
 static void ublk_queue_cmd_list(struct ublk_queue *ubq, struct rq_list *l)
 {
 	struct request *rq = rq_list_peek(l);
-- 
2.45.2

