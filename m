Received: from mail-ua1-f98.google.com (mail-ua1-f98.google.com [209.85.222.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5379A1D86CE
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 15:47:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743176838; cv=none; b=ilHzQ8eNgxwe4pG5DvInDArcuiZ0bHeQruOKCDDTBYsC0S9m0uUSG6BY6ThF18hxSPknlt89wKf9t0tL9mtNlVIrbBzpcHXjjV7xH4ZF1WfKYHqZhjK6sBYSlfUnqC4m/+WxWoXX7iWrgO5NmVlcUFDXQSnY98gOuPidezGxxTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743176838; c=relaxed/simple;
	bh=gvF1oARvUAWHdyUpUJyX1ddyxJvSalxLbCGGNhclpFM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TQ+a29dzrCyKuvw5geMJFus4E8LQ5PxM/KD5ZXo8jj9R7zMU/vfbLwgrcIPgoS1SKr1ZUbfkfCEHwBVpkqCuZXZBu+53Db02vTP3C/xERiy8dJXo/MibwAdV+iTO3Jbs+yFJUhFrtCK6DrKIstXWrZk0yvax9YL8IISF5qHtaMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=fail smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=FXjXF0pL; arc=none smtp.client-ip=209.85.222.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="FXjXF0pL"
Received: by mail-ua1-f98.google.com with SMTP id a1e0cc1a2514c-86ca7d2bda0so129996241.2
        for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 08:47:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1743176835; x=1743781635; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gt+Qb9IbUDqMOWgjJF/41cbBN6cQ8nnHS3i+KThbO6c=;
        b=FXjXF0pL9uLJ2K1A3tdiyKaP62Rskbw2nR0Khgu62Q064lGzsFt32TldAV6F7Nfp2e
         inZlhV5zWm5w2OKZpR/oBCegeDqbW/SX/8fARnWY5LjO3vBzq1elb1Ffu3POjBcyuMV5
         gn+7ZC89iZc/GnKEhjryb1oaOKNYlQ221RNySnscKRnFg+J3H9yDsNHbu5hvLeqBBX/b
         gaC0uQ2pMzS99uxPWbBu6utflI80ieI/MiuVaxo7Mu9KRe5BSa5jLGgIIHtDkKHQXwgI
         cr8Lq0BCWy+H+sKrOlcYRxD846o9EVauCAbmqvPO4W9KOefWFClyQgBkgpNSXn9s2skO
         Ckiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743176835; x=1743781635;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Gt+Qb9IbUDqMOWgjJF/41cbBN6cQ8nnHS3i+KThbO6c=;
        b=KIZDj2BAv7LCJ4YObVcJm6ydJ+4iigDDrI/HSUQmTJb1mJqB93qUC69XUAzNMvOOQz
         KDs4/PB7ollINEmG7vMGontdqHgr9O/Sh6qzQz3IGW6GOqeHUM0us9/kaRbwYO06Ei45
         6/qIriqhKxlC3sc+8/IjV6IVpDr+obFVmumXkk+dq1t6RH/e7Ve3hf9XLVh1QsYFo+3X
         8cmbo5tk8siy2JdSGiNzjed36+6BHeNrgc0VIdd1FaCDNW64XJ3WV9Sf0PB4kD2oIjYO
         AfNbmZE9zkG5SQaPUkgr2at2Hf2sACFvQ9SkJVnqXO6IGqd8am8OGR+iEgewM3CM6ADv
         8mig==
X-Forwarded-Encrypted: i=1; AJvYcCXK3KR/1cbD/z0eU7Jr6LSXR8RGfPELwENKHmMK7KTaZhDr/mB2ezHTDoPzjkW1mTBYas9ovOBpdzzHJBk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3R0WIqBKCGYWx5TxxBKbMUgNQJ5CXvV8Lo39je9Nppf6v4G25
	JgI5llQ6qV9Oy+6u+rz2Jz6A3A+YTQswWCKUIggdC+xYZCzfm1yc+TNOoBGIHpV00XsNAqwKOga
	CWHTLoLw8zFQWxULAogKy3KInjfhYUE2DmMPGI+CHXV+gLHhB
X-Gm-Gg: ASbGncv/y23VS8FdXKwhd4HLnHs4J/KeK++Yv2JHqS3zYIrCDWXB9WEHvp2iOG5qPJy
	+0lmdVMX06pCmtMJA1iysrUlw6zclKVX9kDMf7hYF7+rU+oQW1MbvlpfkR3x5i/Lnhq+DrUNNd2
	kaOM0l7PRr1e0W3LmxfJKYgCMLVgoaeMCtU+DqGFncfAby2H90u4ZD9aC8LJ3VfGYX8bUgh5Why
	P5d98tftY+P4z7DvradUcvn9ExZ+DKggbrmF5Q8tqhTdzWSSL5bkKT7vrb8Ry5g4blpzz2ybVkm
	V0BtY9uBkuMPY0d4hQeTV0mXg9GTNg34dg==
X-Google-Smtp-Source: AGHT+IEIEYPcBdsJZpKh2cvQEk66b3OVfAq5JkqYNBmXLDDWmMZLlGArepCBDdYK+K0T2LFBmFbzQDs9f1sI
X-Received: by 2002:a05:6122:348a:b0:516:20fe:d5d8 with SMTP id 71dfb90a1353d-52602d93fb3mr1803006e0c.2.1743176834950;
        Fri, 28 Mar 2025 08:47:14 -0700 (PDT)
Received: from c7-smtp-2023.dev.purestorage.com ([2620:125:9017:12:36:3:5:0])
        by smtp-relay.gmail.com with ESMTPS id 71dfb90a1353d-5260e9baa77sm190070e0c.9.2025.03.28.08.47.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Mar 2025 08:47:14 -0700 (PDT)
X-Relaying-Domain: purestorage.com
Received: from dev-csander.dev.purestorage.com (dev-csander.dev.purestorage.com [10.7.70.37])
	by c7-smtp-2023.dev.purestorage.com (Postfix) with ESMTP id 7169334018F;
	Fri, 28 Mar 2025 09:47:13 -0600 (MDT)
Received: by dev-csander.dev.purestorage.com (Postfix, from userid 1557716354)
	id 6F39CE40A9F; Fri, 28 Mar 2025 09:47:13 -0600 (MDT)
From: Caleb Sander Mateos <csander@purestorage.com>
To: Keith Busch <kbusch@kernel.org>,
	Jens Axboe <axboe@kernel.dk>,
	Christoph Hellwig <hch@lst.de>,
	Sagi Grimberg <sagi@grimberg.me>,
	Pavel Begunkov <asml.silence@gmail.com>
Cc: Chaitanya Kulkarni <kch@nvidia.com>,
	linux-nvme@lists.infradead.org,
	io-uring@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Caleb Sander Mateos <csander@purestorage.com>
Subject: [PATCH v4 1/3] nvme/ioctl: don't warn on vectorized uring_cmd with fixed buffer
Date: Fri, 28 Mar 2025 09:46:45 -0600
Message-ID: <20250328154647.2590171-2-csander@purestorage.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250328154647.2590171-1-csander@purestorage.com>
References: <20250328154647.2590171-1-csander@purestorage.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The vectorized io_uring NVMe passthru opcodes don't yet support fixed
buffers. But since userspace can trigger this condition based on the
io_uring SQE parameters, it shouldn't cause a kernel warning.

Signed-off-by: Caleb Sander Mateos <csander@purestorage.com>
Reviewed-by: Jens Axboe <axboe@kernel.dk>
Reviewed-by: Chaitanya Kulkarni <kch@nvidia.com>
Reviewed-by: Christoph Hellwig <hch@lst.de>
Fixes: 23fd22e55b76 ("nvme: wire up fixed buffer support for nvme passthrough")
---
 drivers/nvme/host/ioctl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/nvme/host/ioctl.c b/drivers/nvme/host/ioctl.c
index a35ff018da74..0634e24eac97 100644
--- a/drivers/nvme/host/ioctl.c
+++ b/drivers/nvme/host/ioctl.c
@@ -140,11 +140,11 @@ static int nvme_map_user_request(struct request *req, u64 ubuffer,
 
 	if (ioucmd && (ioucmd->flags & IORING_URING_CMD_FIXED)) {
 		struct iov_iter iter;
 
 		/* fixedbufs is only for non-vectored io */
-		if (WARN_ON_ONCE(flags & NVME_IOCTL_VEC)) {
+		if (flags & NVME_IOCTL_VEC) {
 			ret = -EINVAL;
 			goto out;
 		}
 		ret = io_uring_cmd_import_fixed(ubuffer, bufflen,
 				rq_data_dir(req), &iter, ioucmd,
-- 
2.45.2

