Received: from 009.lax.mailroute.net (009.lax.mailroute.net [199.89.1.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 002D01CBE8C
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 17:52:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=199.89.1.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738864375; cv=none; b=hzuE4XazgdhDEaJW0NSKeTY5XfI4NIQ95sKFzEn3nHvt9YTqHlQJ+WHlstzm9XOiMh0IihArYbEYY4WUPp7Rxdh0Qo5Dy2q4fAuqSLI6QD4QyuJoHTJm6OvrOQkNf0JKOA/ai1Pf/HkQEOaHARLsSJW7wWlsMXFlCKLnl8dC/Ws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738864375; c=relaxed/simple;
	bh=RQFkE9tsT1RjoSvKdlIkVfNS6rk/2fskLrlIFgTVzcY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eca1kgm9JBoMxJd3eR06jO5Bz3OBLsqoFmmk3JfETY3P2kh1smhT2DAr3h3Fscl8X7HJK7bCiF8L3i8vihje1Zyq0WBY7u+XmfO4w9rGBK8myk+NJnUe41HgV+il5njfb4i1FYAU0gDcByqKebJ8JB13sP6/o8xYIE7meVbTPwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org; spf=pass smtp.mailfrom=acm.org; dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b=sYm6zvOl; arc=none smtp.client-ip=199.89.1.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=acm.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b="sYm6zvOl"
Received: from localhost (localhost [127.0.0.1])
	by 009.lax.mailroute.net (Postfix) with ESMTP id 4Ypl7T5SVszlgTy2;
	Thu,  6 Feb 2025 17:52:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:mime-version:references:in-reply-to
	:x-mailer:message-id:date:date:subject:subject:from:from
	:received:received; s=mr01; t=1738864368; x=1741456369; bh=CFa3N
	iEsRmN1lNODADwduqGdvfuA+LJY0YbXnfYbzIc=; b=sYm6zvOlH4BBhj/SEpPR3
	3VrOVYZewvKFICnO2ZzaW4ohakgGgD5bzmS0CIzIoi3C0cTgmLgSHPTZWBMt5flT
	92nqmyOgieYFG0NhyyYl/qvCHsYTLMGmaLSaS70blddxvNSIpAlGvhHg6EXLJXw6
	m8tBA0hXP5VhcpJIrqaZp6ahsYhYMj9MW5awTF3aB9gPX4O/4I0o+cuDOxfSY2bU
	l+YOnI3rvugbfO3YxRVFb758/1qhb4w4SThCGzKdkRoPaVAGFRQ/IC+YINEsPckU
	YSE14vOm+eMQX+FI7IoQe+KMXCpp0OTO1bzklFvh7l+01TAbhaBkN0rfe1fTXmlV
	A==
X-Virus-Scanned: by MailRoute
Received: from 009.lax.mailroute.net ([127.0.0.1])
 by localhost (009.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id haCPP6mzLRWo; Thu,  6 Feb 2025 17:52:48 +0000 (UTC)
Received: from bvanassche.mtv.corp.google.com (unknown [104.135.204.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 009.lax.mailroute.net (Postfix) with ESMTPSA id 4Ypl7L2SJnzlgTxg;
	Thu,  6 Feb 2025 17:52:46 +0000 (UTC)
From: Bart Van Assche <bvanassche@acm.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Will Deacon <will@kernel.org>,
	Christoph Hellwig <hch@lst.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Marco Elver <elver@google.com>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Jann Horn <jannh@google.com>,
	linux-kernel@vger.kernel.org,
	Bart Van Assche <bvanassche@acm.org>
Subject: [PATCH RFC 31/33] md/raid*: Fix raid*_set_queue_limits()
Date: Thu,  6 Feb 2025 09:51:12 -0800
Message-ID: <20250206175114.1974171-32-bvanassche@acm.org>
X-Mailer: git-send-email 2.48.1.502.g6dc24dfdaf-goog
In-Reply-To: <20250206175114.1974171-1-bvanassche@acm.org>
References: <20250206175114.1974171-1-bvanassche@acm.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

queue_limits_cancel_update() must only be called if
queue_limits_start_update() is called first. Remove the
queue_limits_cancel_update() calls from the raid*_set_limits() functions
because there is no corresponding queue_limits_start_update() call.

Cc: Christoph Hellwig <hch@lst.de>
Fixes: c6e56cf6b2e7 ("block: move integrity information into queue_limits=
")
Signed-off-by: Bart Van Assche <bvanassche@acm.org>
---
 drivers/md/raid0.c  | 4 +---
 drivers/md/raid1.c  | 4 +---
 drivers/md/raid10.c | 4 +---
 3 files changed, 3 insertions(+), 9 deletions(-)

diff --git a/drivers/md/raid0.c b/drivers/md/raid0.c
index 8fc9339b00c7..70bcc3cdf2cd 100644
--- a/drivers/md/raid0.c
+++ b/drivers/md/raid0.c
@@ -386,10 +386,8 @@ static int raid0_set_limits(struct mddev *mddev)
 	lim.io_opt =3D lim.io_min * mddev->raid_disks;
 	lim.features |=3D BLK_FEAT_ATOMIC_WRITES;
 	err =3D mddev_stack_rdev_limits(mddev, &lim, MDDEV_STACK_INTEGRITY);
-	if (err) {
-		queue_limits_cancel_update(mddev->gendisk->queue);
+	if (err)
 		return err;
-	}
 	return queue_limits_set(mddev->gendisk->queue, &lim);
 }
=20
diff --git a/drivers/md/raid1.c b/drivers/md/raid1.c
index 9d57a88dbd26..10ea3af40991 100644
--- a/drivers/md/raid1.c
+++ b/drivers/md/raid1.c
@@ -3219,10 +3219,8 @@ static int raid1_set_limits(struct mddev *mddev)
 	lim.max_write_zeroes_sectors =3D 0;
 	lim.features |=3D BLK_FEAT_ATOMIC_WRITES;
 	err =3D mddev_stack_rdev_limits(mddev, &lim, MDDEV_STACK_INTEGRITY);
-	if (err) {
-		queue_limits_cancel_update(mddev->gendisk->queue);
+	if (err)
 		return err;
-	}
 	return queue_limits_set(mddev->gendisk->queue, &lim);
 }
=20
diff --git a/drivers/md/raid10.c b/drivers/md/raid10.c
index efe93b979167..15b9ae5bf84d 100644
--- a/drivers/md/raid10.c
+++ b/drivers/md/raid10.c
@@ -4020,10 +4020,8 @@ static int raid10_set_queue_limits(struct mddev *m=
ddev)
 	lim.io_opt =3D lim.io_min * raid10_nr_stripes(conf);
 	lim.features |=3D BLK_FEAT_ATOMIC_WRITES;
 	err =3D mddev_stack_rdev_limits(mddev, &lim, MDDEV_STACK_INTEGRITY);
-	if (err) {
-		queue_limits_cancel_update(mddev->gendisk->queue);
+	if (err)
 		return err;
-	}
 	return queue_limits_set(mddev->gendisk->queue, &lim);
 }
=20
