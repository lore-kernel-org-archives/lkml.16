Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD65A59B71
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 11:48:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745840929; cv=none; b=Rzjb4y6VrS3n7B15H/ahcMh0MwAZdLJyLe+Kju3V6l5cw1F60f8h86JhRebhaXLRnO09kRpQEDVwktAWId/1Hj4TudNq2OCZPganZBeTxU8pRbUxBWyvQNUGglFNPa9crhZi9Dxigi10cqIhf/333/MX6c5Ul3JBt5ZNiLcHhpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745840929; c=relaxed/simple;
	bh=S2zQys9jQjl7ZjcZRlkiU1xkTRbKd21inVtiBa9HuzM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=n/KlGMdtuNJDLsDHQZN4nfOXOBlji2LNO1faTY3vtVdCuIbXn4VeRksuZjPs592aeXnuUm7hyOZnj03jo7tvFJThF0sxiMZ87lutjgWgXcwvxHJWsnbDQf8MozDoAomlJcnm5HkjgaaxpqQW/lRNzoQESIFM4DrO5pk2FzsBojQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ionos.com; spf=pass smtp.mailfrom=ionos.com; dkim=pass (2048-bit key) header.d=ionos.com header.i=@ionos.com header.b=VqN3KPyb; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ionos.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ionos.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ionos.com header.i=@ionos.com header.b="VqN3KPyb"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-43edecbfb94so44665855e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 04:48:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ionos.com; s=google; t=1745840926; x=1746445726; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0q78s0qb5XBHEDUWv0h7QHkhC+VFSCzWihLuUxK1ToU=;
        b=VqN3KPybz+kJcNPIqTsqGuJhoN5+BFAwbd4g0r1jmK6CFkCxHwmVp2veMpgyUMfdjO
         BECQixtdLCHcaZpqZ5BbzyEo6uUVEzn23/k81kTXLxYLad96W3Ed9tcZ80doCLdsO3au
         ZFZVdS6AqKK8iPemUx5+iCDl9JR81n1MfvCeO+u9OBOXk4q92TtSPk4unrAJ2tKabKWe
         lIFBBhojArmrw8N4ioiYYj5aK8mY4shhSZ5EBXa7VEsQxmjheq4mAh8/eV3UCpi+H2CP
         WXqyUbp/3J36TSBrScaKzOg1o6dhVp2UBTB2O9S+PfF2GOyY+9HaVe413ORdcioYSe4J
         hxMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745840926; x=1746445726;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0q78s0qb5XBHEDUWv0h7QHkhC+VFSCzWihLuUxK1ToU=;
        b=PiHsyl7vvQG/jacaJC5rGMd+wei1+60n4TWSna2/pkWU2AIRTo40UNueEwuxAgyyjz
         KSpiY1KViScqs52ke65L9yx0U5MNIxFeQ38hYfzY7SXDZEL9KzjNvTjESvT0/RwRCCzn
         yCWXVaG+UihWthcaQe+gp7RSbhoIYpB1CvfbMVdKxkJo9incB6INaBp3LL7iwnzvMHpn
         lGjpWO91iYb/OrsHeitVk3Yv64J8FrRJaCotpJ5zoKoZ7FHwWHXteVdInXy1XNpWyngH
         h7EuRMQFoWVpD/crvp+p3yQl/JxpQp5afDUCDnMsAuVL0BqmMBTwXFek/hi12wO1uF7g
         4oXg==
X-Forwarded-Encrypted: i=1; AJvYcCVcd8q9EsDpSwKjCO8BRXCaNTmNNVpVDQnErlHTGfgd5KfkzOmpTD4q0StNOdms7cuDxke0Vb1FvzrxSSg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwKpPWuDMyOnyDwwsgLHssZZXLpplcS17PU+FLK5+4Tz0ujzx00
	04ENaJo49mAeVF31hjMSNXpB5TyyNKQY5qq37Qf/LJBX/xmBhr1RlXA5ka7vk0E=
X-Gm-Gg: ASbGncsMhNIE30JkgKbpnnn8Wq3jBua9Kkxv8xqfQnU0oIWTBheLMTuiMSSo1q7POt1
	gDJsltEfvDtVk+3PAJocqFfLQB2VoRzIUiuFU1h58sn8uacxTCZm1NApQG1ljt1FCIpZM7aRyHh
	0DJNVADIigFdOCdzNASkT53nr+G8v/jcq5/jc27QEUGbszq5BBOBDUliA+n30LFmhyYyitzFC5s
	C7+fGTPQvigB3dQX9XIWw7ztyHCfnJ93ggv4Sp1wIJ0kharEwHW6CZJkgYB3lVIDX2gsYbTC5zx
	Zb79sA9jPRwlMQQmR6/G3Qe93XRCT1Kkiod9W13t6J7KoceYouTXh61y1QIccUfcOYfWEj2BH26
	x8t3ZIQ2cygSX3y+Hm7hG0A69NmhiAMFL0H5bsQ2q
X-Google-Smtp-Source: AGHT+IEYPoQYtU0kOe9zY7p5LAAhJRacyEF3DOk0Tid5iIYE4VZLhFE0WyyUoatOxkTUDVWHxJFqNQ==
X-Received: by 2002:a05:600c:a085:b0:43d:aed:f7d0 with SMTP id 5b1f17b1804b1-440a66b6e60mr77264835e9.28.1745840925954;
        Mon, 28 Apr 2025 04:48:45 -0700 (PDT)
Received: from raven.intern.cm-ag (p200300dc6f46c100023064fffe740809.dip0.t-ipconnect.de. [2003:dc:6f46:c100:230:64ff:fe74:809])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-440a5310a8fsm123991385e9.22.2025.04.28.04.48.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 04:48:45 -0700 (PDT)
From: Max Kellermann <max.kellermann@ionos.com>
To: dhowells@redhat.com,
	netfs@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Max Kellermann <max.kellermann@ionos.com>
Subject: [PATCH] fs/netfs/read_collect: remove duplicate line
Date: Mon, 28 Apr 2025 13:48:42 +0200
Message-ID: <20250428114842.3180169-1-max.kellermann@ionos.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The `ret` variable has already been assigned before the `switch`
block.

Signed-off-by: Max Kellermann <max.kellermann@ionos.com>
Fixes: e2d46f2ec332 ("netfs: Change the read result collector to only use one work item")
---
 fs/netfs/read_collect.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/fs/netfs/read_collect.c b/fs/netfs/read_collect.c
index 23c75755ad4e..422bfac47817 100644
--- a/fs/netfs/read_collect.c
+++ b/fs/netfs/read_collect.c
@@ -653,7 +653,6 @@ ssize_t netfs_wait_for_read(struct netfs_io_request *rreq)
 		switch (rreq->origin) {
 		case NETFS_DIO_READ:
 		case NETFS_READ_SINGLE:
-			ret = rreq->transferred;
 			break;
 		default:
 			if (rreq->submitted < rreq->len) {
-- 
2.47.2

