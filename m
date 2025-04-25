Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06015243374
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 11:18:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745579913; cv=none; b=rHZwJxNQA5IZ78TfvNK1GD0h6Kq+PQ4q37Ot1VnvAPDqY+n7z9t1Y6nCK+KL+RU6FApA6i7Coin07gUcylgxBLNgm7EV8Ow/SxPNyp2QLaJLhogidM0k91Z79Eu03xErPoIh2X6w/6AYVYpqk1bhy/1q3R8NQNn8P5tMr/3QxB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745579913; c=relaxed/simple;
	bh=ygMbzKzD3kI+8/mxoJF4de83lsKYgsPjh3MC5BHAUPA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YfprqxjjWcB2x/uvv3a1HZqL8NXyJA2SayZGIMXJRAVcqH7ja59lnH8vPjoAjgCFx6OACCVZObUY/HfN/gerZ21EvRHlHqoiVpG37ZzvVPMJ5yVVHhF8c2kQt9qZb3ImFpuXCl1G89zHrwDa6cSgwHUKHMtlQknrrw5qub5b2zI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mwa.re; spf=pass smtp.mailfrom=mwa.re; dkim=pass (2048-bit key) header.d=mwa.re header.i=@mwa.re header.b=U0mDri4v; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mwa.re
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mwa.re
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mwa.re header.i=@mwa.re header.b="U0mDri4v"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43cfdc2c8c9so11167685e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 04:18:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mwa.re; s=google; t=1745579908; x=1746184708; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=T5n7vWr4dvh3itAQhDGMUdrJl92cU0T7zk39q8wkmGw=;
        b=U0mDri4vBOumG/f1/NRl/c8ZVjSUev21oXqEeN5J6jIivim+iWArowv5XEQRf5jFZq
         vIM7QyeAVHV5PNW0VIaKyZxWp/Oh1vGOPkvT8GDm4G1K8l1GLHAa8m3WwyPWG72Bh1tp
         MrRypWA6pyXvheIaBU41uIYYoNnPUI0BRWXMidIZ9snI7NIyFWjqld5uJg9r1V9asuLO
         Ua70T3x5MeTzkarT3dX4PWAIGj6gflKu3U/5+BbqCbj8AzFO+xGw/5eaYdxXdSWqKbw6
         PwSFcJMdyXAs7H5ZmaSBCteqzofE4bifANf71JYo/fE+WRM7BvNdrdHvBSQ8v+BaX4hd
         u9gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745579908; x=1746184708;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T5n7vWr4dvh3itAQhDGMUdrJl92cU0T7zk39q8wkmGw=;
        b=KsUhbRR283xeaE4w+Lt2jtFhKYKWENmWSeujZxQy7mEQc5THJgspbSbelhy68M/XlF
         2jmWEVddFXwuM/OXU0Yh0KWzXRvYPlWUx+AL5eU2d5pbsMMLlcg+cCJx/XDbir2RNI7S
         4jeHAeQVvXo/e0El5JZR6ac3X/H1XxoPvgIywrtds2T0Y8HJCP6+rHaIVb06W+qvLlLZ
         YIfTl9yaRoYYT4CAej2CGkzYSimGIu4303IH7EFdQX+R2m/9imQqv+Lt35AXVnX5D6w3
         xWivnrMPpGnU27oPOT0zJnsT+Ogn9C5kj2YZrkmZrl0DgvaNSQ6lBVQ503d0VkWm4ukN
         NVpw==
X-Forwarded-Encrypted: i=1; AJvYcCX8zA5GdIUJ/c3VvOW0k/hmGzCLKnclboOUrXa0NiM8Dtfzm64kVrc8auQtbOMpIrucgWRBsTQZGEExy0U=@vger.kernel.org
X-Gm-Message-State: AOJu0YyP0DLcHjnFFCLCMPnBy2+QXCuqvfYpV9ZkcjZnqBXSXclJJi14
	MxYDonD3JjVcvJcQdL6iqxhbQDNN5yQvJibzjBi2PnBh3X93VkFphCRq/RU6J0Y=
X-Gm-Gg: ASbGncuro3sXrsz7aRAaqmqWX2lhnvCRcZ6SU+g+7IEBvs16FOgPVZYWTbDKvsnx2qg
	hFOGZVdXRZbdh02aSfwRwrUwqRldxhdMZYHzZcaaLCGFsgA+/a65h2fewZ+h0XyefjYokR4waUO
	S44YX1dc/lp75ccY+3Yjis0WVZhOB8wi3B/ns4A2eS432NXWsc9mFp1oeTyblNWtCPfCDaSNnMg
	BM/SQG+8Ny5IFCsn40j8Rch5UVNyWKWN7eDC4khmfUnpYBJS6w6tUUFWkB4dYdD4YUyX0qEKzAF
	mJwOPU5ui7rmCWGrafMdwSLryfpzCIxtYiKJLGyrNUlCGzrWK7XpAQ1ZfN90PW/ji7FFdCvtZ/B
	E
X-Google-Smtp-Source: AGHT+IErBreCI+aZUQSHRKHCRHBvn1tri5fl9i7MgLbnV6lm+dUMhIRmMJF/7U+2vkVn14Vo9DYcgQ==
X-Received: by 2002:a05:600c:1988:b0:43c:fe15:41d4 with SMTP id 5b1f17b1804b1-440a661a0ebmr14851625e9.18.1745579908064;
        Fri, 25 Apr 2025 04:18:28 -0700 (PDT)
Received: from mw-ac-stu-3.corp.mwa.re (static-195-14-251-13.nc.de. [195.14.251.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-440a5310a8fsm22195235e9.22.2025.04.25.04.18.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 04:18:27 -0700 (PDT)
From: Antonios Salios <antonios@mwa.re>
To: rcsekar@samsung.com
Cc: mkl@pengutronix.de,
	mailhol.vincent@wanadoo.fr,
	linux-can@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	lukas@mwa.re,
	jan@mwa.re,
	msp@baylibre.com,
	Antonios Salios <antonios@mwa.re>
Subject: [PATCH v3] can: m_can: initialize spin lock on device probe
Date: Fri, 25 Apr 2025 13:17:45 +0200
Message-ID: <20250425111744.37604-2-antonios@mwa.re>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The spin lock tx_handling_spinlock in struct m_can_classdev is not being
initialized. This leads the following spinlock bad magic complaint from the
kernel, eg. when trying to send CAN frames with cansend from can-utils:

[   10.631450] BUG: spinlock bad magic on CPU#0, cansend/95
[   10.631462]  lock: 0xff60000002ec1010, .magic: 00000000, .owner: <none>/-1, .owner_cpu: 0
[   10.631479] CPU: 0 UID: 0 PID: 95 Comm: cansend Not tainted 6.15.0-rc3-00032-ga79be02bba5c #5 NONE
[   10.631487] Hardware name: MachineWare SIM-V (DT)
[   10.631490] Call Trace:
[   10.631493] [<ffffffff800133e0>] dump_backtrace+0x1c/0x24
[   10.631503] [<ffffffff800022f2>] show_stack+0x28/0x34
[   10.631510] [<ffffffff8000de3e>] dump_stack_lvl+0x4a/0x68
[   10.631518] [<ffffffff8000de70>] dump_stack+0x14/0x1c
[   10.631526] [<ffffffff80003134>] spin_dump+0x62/0x6e
[   10.631534] [<ffffffff800883ba>] do_raw_spin_lock+0xd0/0x142
[   10.631542] [<ffffffff807a6fcc>] _raw_spin_lock_irqsave+0x20/0x2c
[   10.631554] [<ffffffff80536dba>] m_can_start_xmit+0x90/0x34a
[   10.631567] [<ffffffff806148b0>] dev_hard_start_xmit+0xa6/0xee
[   10.631577] [<ffffffff8065b730>] sch_direct_xmit+0x114/0x292
[   10.631586] [<ffffffff80614e2a>] __dev_queue_xmit+0x3b0/0xaa8
[   10.631596] [<ffffffff8073b8fa>] can_send+0xc6/0x242
[   10.631604] [<ffffffff8073d1c0>] raw_sendmsg+0x1a8/0x36c
[   10.631612] [<ffffffff805ebf06>] sock_write_iter+0x9a/0xee
[   10.631623] [<ffffffff801d06ea>] vfs_write+0x184/0x3a6
[   10.631633] [<ffffffff801d0a88>] ksys_write+0xa0/0xc0
[   10.631643] [<ffffffff801d0abc>] __riscv_sys_write+0x14/0x1c
[   10.631654] [<ffffffff8079ebf8>] do_trap_ecall_u+0x168/0x212
[   10.631662] [<ffffffff807a830a>] handle_exception+0x146/0x152

Initializing the spin lock in m_can_class_allocate_dev solves that
problem.

Fixes: 1fa80e23c150 ("can: m_can: Introduce a tx_fifo_in_flight counter")

Signed-off-by: Antonios Salios <antonios@mwa.re>
Reviewed-by: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
---
Changes since v2:
 * Clarify bug in commit message

Changes since v1:
 * Move spin_lock_init from device probe functions to classdev alloc function
 * Add a fixes tag
---
 drivers/net/can/m_can/m_can.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/can/m_can/m_can.c b/drivers/net/can/m_can/m_can.c
index 884a6352c..12e313998 100644
--- a/drivers/net/can/m_can/m_can.c
+++ b/drivers/net/can/m_can/m_can.c
@@ -2379,6 +2379,8 @@ struct m_can_classdev *m_can_class_allocate_dev(struct device *dev,
 	SET_NETDEV_DEV(net_dev, dev);
 
 	m_can_of_parse_mram(class_dev, mram_config_vals);
+
+	spin_lock_init(&class_dev->tx_handling_spinlock);
 out:
 	return class_dev;
 }
-- 
2.49.0

