Received: from mail-qv1-f97.google.com (mail-qv1-f97.google.com [209.85.219.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D2D419006B
	for <linux-kernel@vger.kernel.org>; Sat, 26 Apr 2025 01:17:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.97
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745630259; cv=none; b=bqfPmD6V4G2w+y0Yysw3UntNOzMk7pwzvF6zaihnxbv/z0blgEznQW8glco04+8J3QY54tdGZMOB2cWuCgE3uQioby1LLrxk/Js2F/LBhk5NFSa4z4RdVPgFfS25CqCsOCexEslyjP7JoyL6dZPjk+O/Rsp93ZRxFPzpqbnXTtM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745630259; c=relaxed/simple;
	bh=3SdRMZedVNsGhoUkRDA0ELdVBKWAQIbe+N/5UZyBhJ0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YXvWVUG+8jTc8tA95QE8zt8T6dKXNNDptdHpYL52AzvEWYfjxMSk8bfJ2ReHHNtv8M+t5cOcvxGbwr1eHGnWsO2qHBF+bcgGXq8yE9cI2N0hZI1k27neSmGuvLyYmobVoBJnsr2qvYG1YS0dMh7EnMOim9CSStbPTjoZkBL/b24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=fail smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=CRKq6wUd; arc=none smtp.client-ip=209.85.219.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="CRKq6wUd"
Received: by mail-qv1-f97.google.com with SMTP id 6a1803df08f44-6e8fa1f99a6so3440406d6.3
        for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 18:17:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1745630256; x=1746235056; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sWoTSB4woNticZtUd9FUCqOsuMx2ByEG0kxwm3khTAw=;
        b=CRKq6wUdni9Qufz8JWcpx+oqWwdfu1gLN/rimX4RX62/QWslIHvisI9aADz//p9xUO
         w3z1if0k9hSiB7Fz6MmPLS9oluk6vFuhx6YnbaXXMmzGpWE0yGQsVnYpUaahnFF+jrdQ
         hNLfoz+cRJqzjrZL1zynv9sGHopENq7zIPNqH5Y5Y4PEtpwmnO9GJVUansPK6lQ78e3V
         BQeLfPPhyXyhak2mrDchBEghTzVW/hRWD+MRL3f+8stmgX4kXImQOuUIAyMusLWoPDAt
         HvmDdhiIA4SkqIXijmd/a+27xKPAUCpuT8+rNzL7fgNtXMAscyOlfnt7qFCS4DyMgG+A
         0fbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745630256; x=1746235056;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sWoTSB4woNticZtUd9FUCqOsuMx2ByEG0kxwm3khTAw=;
        b=mIsdVVSOEVdN97QabqcjsiYyDFQBawNgRaZ3JkFuk7OeArWVTz44S/IdZ5DMbdCDCH
         vxAOBMSZjUS8MQbpJgI445yLfNVqpuTf4MY8FnmL3EbVPyXpK5iR0lXHqerDV4p1kSNE
         SmT9QpUjtecX4RQ3SJMsApMoHVjL0jRyVdPSUSViWTIsJHt+SDwGtSSeQ6zTycCsS0jW
         TiGQj7Uwb+fkx23Vg5jujQeHLFIx8GbNhC0cuLnPFYxVawYq+/rUcE4+HuE64DjaJKXr
         DdLGcqQ6o7oxFinvdWRxNfjeO7O/DlNey6QNoUSj9V4ll50YWWfkzih5qJziNxi2DrmN
         XTwA==
X-Forwarded-Encrypted: i=1; AJvYcCWfklG15avTD5mfkv0LIcy4CXRm2CPW6oVTH0UV8d0XtTHC+Eq61LvIGlDTY+lc9ExaMKynFxW9OyVViGY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwhbnQIIHXWKhJMASkC+cT8J1Hz7/05pO2qIJ1VlS2oVK5hmXrl
	ZM/Fo24yN0x1pnVSh+uaIVloCCZHpSzJiPpilheIKGarzY8PAoH8qG/9Qtqzw9i6cGbovxGfn05
	WhUJxi9OnyeT42ObWIpjRFflc5vlnIMdR
X-Gm-Gg: ASbGncup5/IFY+olMpxDMKL46McZBeoTLKSu4xjzr7BkjNHdb7zpkfM3SrcFMnL6uJV
	Nj8Ho1aNcdoaEf5Ml3cTd7gw5o/464QQeVF3onVLkReH9oaP4N0E+s2eRn/R81U6MbwDGkZ175P
	LbR5E70B08wxxzimm8zStdwfveYPphbknegPpaYOk7t8hKyHoX4+kuuTADKkRJUYrBS5oJ8+E/x
	KF+zoc34oLVGfUonwYUl9b95toKy+E8UMBPudtp1VyxoJQ478mqAP4EF+VHfjJNhRnQNlMefWqw
	6wT70kGU+o3g4M+KV6O9WCTAjugyLt9dtKs3UhuTHgWW
X-Google-Smtp-Source: AGHT+IGKOnOAGNaR2172G+3uzVJGtJ0TwGdbe9ifds15Yrh4dQ+LSR97ANlr718s3pllfYeAXRU6CtDhyvT7
X-Received: by 2002:ad4:5dc2:0:b0:6e4:449c:ab1d with SMTP id 6a1803df08f44-6f4cb9b43edmr27466936d6.2.1745630256282;
        Fri, 25 Apr 2025 18:17:36 -0700 (PDT)
Received: from c7-smtp-2023.dev.purestorage.com ([208.88.159.129])
        by smtp-relay.gmail.com with ESMTPS id 6a1803df08f44-6f4c602821dsm1903696d6.41.2025.04.25.18.17.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 18:17:36 -0700 (PDT)
X-Relaying-Domain: purestorage.com
Received: from dev-csander.dev.purestorage.com (unknown [IPv6:2620:125:9007:640:ffff::418a])
	by c7-smtp-2023.dev.purestorage.com (Postfix) with ESMTP id 476823402A4;
	Fri, 25 Apr 2025 19:17:35 -0600 (MDT)
Received: by dev-csander.dev.purestorage.com (Postfix, from userid 1557716354)
	id 40BEDE41BE9; Fri, 25 Apr 2025 19:17:35 -0600 (MDT)
From: Caleb Sander Mateos <csander@purestorage.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: Christoph Hellwig <hch@infradead.org>,
	linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Caleb Sander Mateos <csander@purestorage.com>
Subject: [PATCH v2 0/3] block: avoid hctx spinlock for plug with multiple queues
Date: Fri, 25 Apr 2025 19:17:25 -0600
Message-ID: <20250426011728.4189119-1-csander@purestorage.com>
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

 block/blk-mq.c      | 110 +++++++++++++++++++++++++++++++-------------
 block/mq-deadline.c |   2 +-
 2 files changed, 79 insertions(+), 33 deletions(-)

v2:
- Leave unmatched requests in plug list instead of building a new list
- Add Reviewed-by tags

-- 
2.45.2

