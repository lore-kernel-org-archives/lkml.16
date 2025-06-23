Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D77BE70838;
	Mon, 23 Jun 2025 22:35:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750718151; cv=none; b=rnOY1OkeRrSTmCMoID8bkWuSQeK/95Zu3/r7OZ0YMTzCdsZsmnCsILLm35Y/LwIPZaYaSSM9ZiplWsrU6nbK51b5S6Pim8y+WymyLaj6sj61C0LXgorrzz2wU52tQMtZZRATDjKZE4Oimq1DKUcW58ZD5k8x9eQbmoHm+c02+j4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750718151; c=relaxed/simple;
	bh=iPi9bgaQMxaCP6hQ9vj6jG/kXbnYCnKdFVPUYdbaBKU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=t/Qay4GG5TUj2x1V/Xw5ersPfzbQXk0+w4e4w6zSeC1hl6nrT/hDmIKDKfYD97OZ8hh84uHdybDPHQrlu1gvjkcllUsWMPWsrOg0ZBiirdqM+2obkpt5VawttJkoWXC6oKz4C88d0kPdkDAXDFQGGL1CaZ9ZCyxy5Rzdj+2133A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BmziHJ3j; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BmziHJ3j"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-453426170b6so33831575e9.1;
        Mon, 23 Jun 2025 15:35:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750718148; x=1751322948; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=w8X8+lYPNXJfIiqIH3VT7v0hy5MQ4DjDzji7la3F3Sk=;
        b=BmziHJ3jHTf9d2pVu+IMXBplzjxxa4W1h4EDKWcAQF9cwKWik/U9S+MV0VLdQkEYJk
         HY/lLSYQNOQWW77VsCsxJhhpvpZXcM+IyguX+9sfcdMqa9jUv6aKwNO7q8z39VqYqoZB
         2mgP78mI0Ia7QQofdT+1noSfvwFKcFgT+alnsoQCDdeSp3ftbN0R4PF3yb7i1JVQ+GMo
         vqGAfdeJ9AlStVwnJmOI7dNPgzcH6pIMCcu/YvvUSVOxZI/FgtEMPEJzUB2eTBa6YU6H
         e5AQcLLs5uCOoc9ZhxLH3pcnWeSzxvzkeXGz8OjiyCXxp8w3NnAfja5V3gTO/2auJs2S
         7HLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750718148; x=1751322948;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w8X8+lYPNXJfIiqIH3VT7v0hy5MQ4DjDzji7la3F3Sk=;
        b=evh0IsK8/hMNc2HtAOnjbqBdIP8JizEeiB/bBU2CG5CHIxw6PYe9SWofFWeM/qoLeE
         iZKmIzi2Embl6Xw/y/PCFMSEfKc3q+4m/ALb2ohmd8Q7KeSkLe5ExxlczWdER8+vTGkj
         OcMfu0KVENyXROszwo+/kMhRK6qLV0Ppqy4zvtR4K0/ta+sPpAYs4RII4obUO2litEmL
         qgfMpG9oNBnPysvhO5ta2MEfab8VJqfL9LcoQdz8/nTrj6CKNqAjT2wQkT1B9+rQja8p
         QOrAp/G90s7w6DV7UaeQ1Edke7pJ1Ekp+rY/rhmewmR6rWKMCl/lHSiHubtnS8f40dch
         LaVQ==
X-Forwarded-Encrypted: i=1; AJvYcCWrW892+IaLLV/aEGLoc2XrRO6CAiRcD6UYswGsa4Ps+ZHTw+6XuwtyCoI1tWmJOfRCHJAijhkdFHeIGfU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzeWMAbLosGQY+yBwAUEQQodanAcwe83DLO2uJ3BSg3QvrDvQo9
	b+XrubcTLXoYiP4D05t8APp1Rn2kr7jr/rF9TtoldRV9ayc1tVE/cppg
X-Gm-Gg: ASbGncvgksy3D1TPAXLNLXEBEKJ5lj/geJ1XtHQv2StghRf4eQ+GMJpRS6B7dUQPd8a
	t6N5A1phhS3pBoJfGw0S18tl4neuhvGYMyFcz0k5biK4XXXe/cmy76qU2UxDgi2OPXkuImRtXhK
	44OXBIKqi9GgByr36Ts7mbYVHOFri3kxGswhpCfa6hOedvsRCFFmxVAGqZlJUFww70SLVik2PWL
	joKHI+8UDLxSW7rhsWPm+P/snruvebT7I2BUmQbzSjcehETrtrwJOHWo4YWvijfBw6mHzSRhAyl
	CoNuz2olEll5doRVnOqKHudoUQBZdCOkUcCwB+JG7oSB7BFxcnhW7musJ1HZ
X-Google-Smtp-Source: AGHT+IFZ8AJI3ew4IzWWU/Tkz1lnQ+LEc34WeS3W9X9qKZcysFcEpbE85v5c+G/NlHApltmH5vsaYw==
X-Received: by 2002:a05:600c:458a:b0:453:92e:a459 with SMTP id 5b1f17b1804b1-4537ba90848mr6811445e9.16.1750718147995;
        Mon, 23 Jun 2025 15:35:47 -0700 (PDT)
Received: from localhost ([87.254.0.133])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4536470903asm125406135e9.40.2025.06.23.15.35.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 15:35:47 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Zack Rusin <zack.rusin@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Ian Forbes <ian.forbes@broadcom.com>,
	dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] drm/vmwgfx: fix missing assignment to ts
Date: Mon, 23 Jun 2025 23:35:26 +0100
Message-ID: <20250623223526.281398-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.50.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

The assignment to ts is missing on the call to ktime_to_timespec64.
Fix this by adding the missing assignment.

Fixes: db6a94b26354 ("drm/vmwgfx: Implement dma_fence_ops properly")
Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_fence.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_fence.c b/drivers/gpu/drm/vmwgfx/vmwgfx_fence.c
index c2294abbe753..00be92da5509 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_fence.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_fence.c
@@ -538,7 +538,7 @@ static void vmw_event_fence_action_seq_passed(struct dma_fence *f,
 	if (likely(eaction->tv_sec != NULL)) {
 		struct timespec64 ts;
 
-		ktime_to_timespec64(f->timestamp);
+		ts = ktime_to_timespec64(f->timestamp);
 		/* monotonic time, so no y2038 overflow */
 		*eaction->tv_sec = ts.tv_sec;
 		*eaction->tv_usec = ts.tv_nsec / NSEC_PER_USEC;
-- 
2.50.0

