Received: from mail-pj1-f97.google.com (mail-pj1-f97.google.com [209.85.216.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9331426B96A
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 20:51:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.97
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745441496; cv=none; b=cI1tl251BOHKsZ09FbHoEzfYz/xNsF+gMxLd+CEiOc9H/jvIvzCQXnt42mZTG7lWnv0NJJ2rA2z91wKDVyTi/s/fm3rPLIPy8CYf2FzVHioTQpOmPfOVTIm8B7jG9EnNQBv2TQOWrMnthDqCW+s/aFLPPIacS9W+YQO+D5qPYpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745441496; c=relaxed/simple;
	bh=Hk4CcxicHHVtPH18BOXInku52HV1nXKPB08vqHt5p+Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oaVfK3pOaosyUD78uqd148HlKOHvVoNx7I6jnxGTAPQ1/GG2eLXy0ZezWW2esN7t7Kjr62zjBWiKJaLMYaKNLvxWfGpxMuhWsjPXd5f/Y0yiDOECs/TFjp7NKhabW/KJ3O/hYCYUwx0vHgCusf25DMcuKEjINxT0u6m4lV/P/aI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=fail smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=cTghGSDb; arc=none smtp.client-ip=209.85.216.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="cTghGSDb"
Received: by mail-pj1-f97.google.com with SMTP id 98e67ed59e1d1-30363975406so49720a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 13:51:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1745441494; x=1746046294; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=goNu6vGqXHnJ8RO1fz4V5E7ge6aZfBjCMg2/5j2/saU=;
        b=cTghGSDbEm+c2zlXX2a4rzHKFCXmrry4/ieFC/wkXO3FO1J2X2mv/6WD/QQ5Wotlmz
         Xrknb4ySo4wohzfcyrGfdIv2KiB5wPm7w2kuqeEfxt0Bd3OAyR7b04SRnegHrqCzdPi/
         vV9FkIl0HQCPkjBJpKdNFjFEqRbYaWW1D+GlDP/8n5eipnnRZ9sXH7dAwbAH0XwSGNTb
         V5ooOeYo3DQAwjqiCZa+hYIWXdHZIvfXEGSBJfUSs72uzNYQaKXAv0gMQ1/n9zFHmLuN
         cFEGDSmPtQkGegIaYDOwWR5A5we8swoNejZcRD4Svn2cHs9DUZ1/SwW3Fk3SK+4h7516
         NZkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745441494; x=1746046294;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=goNu6vGqXHnJ8RO1fz4V5E7ge6aZfBjCMg2/5j2/saU=;
        b=Qs8ta0BzEb66nwvPj64mXC2g4e5O4juz6K8QhTADwjRFmnfHVo9+D1RxVpuULmZiei
         yyQKTzfq/KhEqtvo9Yk1AOjWAjRLEycssh0SLrFH3pL13R8WZKXn9Awr3dQd0K4zn4tZ
         +Mkg3jT0LBIh+Uv4bsQy4/rAHXnWExrCIO7wYJGqIOB0PPo+pbrls2VCCURDRsnkQLsh
         /Wg1VvE5OUGebOQucuXrN16aoyBnLjTY/iviNVfd9Wjv/upV1mDBlVuixA44G2jijJoZ
         l9Mun74Db7K7GThcAeIVD8ivOjid9jI6OtGL/1cTsPoED7oCsxeSBf4RuEztniusbVB5
         UpBg==
X-Forwarded-Encrypted: i=1; AJvYcCWIUiqQJT15QQ4yYXG29MwyGiISQCVU7FRdATRd9gtrtyGwCYaQeiU06Y9pzxQ0MJ/1Nk59JZGc/+Xl6w0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxVwZ7SjiH/CiIw7Ofs5AkU5eeTqg5h6Ed/qJ7zCetL00umnoqF
	JP0uggV9XJ/+G97qy76oGGZkmI9FUi+Jcin9DzMpyHR7awaXAd+cPcW0eIBraajWuS8Rcy2IZgS
	y2i9FXCF38xlKD1oDDZrWPfCml7BM5+tvEo80nnERvn0oQJUc
X-Gm-Gg: ASbGncuziByTaD2haJo/KUc8u3O5U9nzUKQhYyIJNhVF4TV/quvt0JUro8o66CvIPQl
	fwPcHaHHELfNd1CPGOGrcAFGKmwLkWvzqKje+e9vlOpExkJfBJ2JQ3VQslKjBhpHUdGJTamDWEh
	V2UJYXmoebqOg9VGTWheRK0pWmmRrZCsSOYAJNpJVFKmk/tsWdu1QlawvA6lwoXoXL6pFINDxI0
	aAhAhn2oVKd4pZSsP96GB0vGRMrYzyMXAmJPtpFt35zZ12ezhWAHtxXR1As/E+/imVLl3kvj0zj
	p3oZTC2aTTog2O/E6SUWs3l9Fz2aOQ==
X-Google-Smtp-Source: AGHT+IEZRHcMFxF+HVqKALRsVl/gqkKMSWX6d9LvtJXMiaBIYMjl7zUK+xTB64fko8CZygZIAEAvBSRvj0Jx
X-Received: by 2002:a17:90b:33d0:b0:2ee:f59a:94d3 with SMTP id 98e67ed59e1d1-309ed3ce35cmr109800a91.0.1745441493574;
        Wed, 23 Apr 2025 13:51:33 -0700 (PDT)
Received: from c7-smtp-2023.dev.purestorage.com ([2620:125:9017:12:36:3:5:0])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-309df9daeefsm131362a91.2.2025.04.23.13.51.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 13:51:33 -0700 (PDT)
X-Relaying-Domain: purestorage.com
Received: from dev-csander.dev.purestorage.com (unknown [IPv6:2620:125:9007:640:ffff::418a])
	by c7-smtp-2023.dev.purestorage.com (Postfix) with ESMTP id C8319340159;
	Wed, 23 Apr 2025 14:51:32 -0600 (MDT)
Received: by dev-csander.dev.purestorage.com (Postfix, from userid 1557716354)
	id B3126E428A5; Wed, 23 Apr 2025 14:51:32 -0600 (MDT)
From: Caleb Sander Mateos <csander@purestorage.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Caleb Sander Mateos <csander@purestorage.com>
Subject: [PATCH 0/3] block: avoid hctx spinlock for plug with multiple queues
Date: Wed, 23 Apr 2025 14:51:24 -0600
Message-ID: <20250423205127.2976981-1-csander@purestorage.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

blk_mq_flush_plug_list() has a fast path if all requests in the plug
are destined for the same request_queue. It calls ->queue_rqs() with the
whole batch of requests, falling back on ->queue_rq() for any requests
not handled by ->queue_rqs(). However, if the requests are destined for
multiple queues, blk_mq_flush_plug_list() has a slow path that calls
blk_mq_dispatch_list() repeatedly to filter the requests by ctx/hctx.
Each queue's requests are inserted into the hctx's dispatch list under a
spinlock, then __blk_mq_sched_dispatch_requests() takes them out of the
dispatch list (taking the spinlock again), and finally
blk_mq_dispatch_rq_list() calls ->queue_rq() on each request.

Acquiring the hctx spinlock twice and calling ->queue_rq() instead of
->queue_rqs() makes the slow path significantly more expensive. Thus,
batching more requests into a single plug (e.g. io_uring_enter syscall)
can counterintuitively hurt performance by causing the plug to span
multiple queues. We have observed 2-3% of CPU time spent acquiring the
hctx spinlock alone on workloads issuing requests to multiple NVMe
devices in the same io_uring SQE batches.

Add a medium path in blk_mq_flush_plug_list() for plugs that don't have
elevators or come from a schedule, but do span multiple queues. Filter
the requests by queue and call ->queue_rqs()/->queue_rq() on the list of
requests destined to each request_queue.

With this change, we no longer see any CPU time spent in _raw_spin_lock
from blk_mq_flush_plug_list and throughput increases accordingly.

Caleb Sander Mateos (3):
  block: take rq_list instead of plug in dispatch functions
  block: factor out blk_mq_dispatch_queue_requests() helper
  block: avoid hctx spinlock for plug with multiple queues

 block/blk-mq.c      | 106 +++++++++++++++++++++++++++++++-------------
 block/mq-deadline.c |   2 +-
 2 files changed, 75 insertions(+), 33 deletions(-)

-- 
2.45.2

