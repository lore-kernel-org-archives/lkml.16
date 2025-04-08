Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AB95269B0B
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 11:01:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744110094; cv=none; b=PWpw47XKU9sQ5hP/kD411BRj+/OAuJoabCYa23DtAb6BinkoRPyX8G4jK8xkQBg9eQ6mIq4t0XHDc031HsrJm1oKqVlpbsjE8pSoLz3/zZyBtDp+Sto6qmX7YKi3yJyAALvhsO5NkgNQGJB7IyAHtqWoDypjUDhQFuG0rMbvVa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744110094; c=relaxed/simple;
	bh=9vZ07Fu9TFUznVzjN0MD5NdxVuzdwWr225mK7qPMJLU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IuY/+sA6HG6LWNyWQtsV7K6Qje2xdxgea8cW8zuEWCfPszP/bXP58PASc2//Tz5TuaYcbdBZtLyNXRxJdc740I1gI6j5gy9pTgBixyj4hrX/2r/kWyCMZuJoiq6l1LA+ph0/0u+zSaej+ApfcZhBJSnZWI9xc+uiTlnIadYC0uI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fgAvkt6L; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fgAvkt6L"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-43ce70f9afbso58779795e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 04:01:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744110090; x=1744714890; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NirbuKEOTyR2moljejzdS649GYkI8qfTa3FOlPaWlDQ=;
        b=fgAvkt6L6AnUQ/sC4a0Tx5fQ3HeLZ/DrMb5BkPpSBuG6jpwqx6Ujfk/Ll9y/QlqN4+
         Ne331SGeeVPkDvHMMrA7WTDhp2SzGCWTYxUNguI+X3yflfrXFz+lTOHpBnZgsVdegzHO
         WV51bHHShySZ0SlT/Wfy6/JVWtiXsnRCbr0ElDIoITs2sCx9QcdY70s8infd8PnBiGZK
         SeGZ0RkyjV/Z4J1v1TV5XUuo0zlJP7E1mu8SlNt5MdOW0JiztWqJmJ3ChbaUkiyFmRqC
         8dRQ8ZwdCya14cbjpD7OUCO+GriIFmSSX0K7FfhHOeP2oKo7ZfhkoQ6gvaa70MwLPICN
         YCbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744110090; x=1744714890;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NirbuKEOTyR2moljejzdS649GYkI8qfTa3FOlPaWlDQ=;
        b=rTr0XDbTOtSzFlGs/uHIV3otcvIR2oKEWjLVtO9jYzdpcxwrNhMpQVRMXoRV14nTLR
         BkEKWWSC+uUQpMsyaDxuL4K1pW6WAHablzAc6s8xGbhgq8Gr4LvVIzGefpCRM+iui4kc
         G8Tph1FKtGe8zqHdTLvWrlpnfDJERT8/yxB2i643TPyv7tn8T9JWx3r3i2/V0hkLgzy7
         DzFtGybR9/V+tR7kdX/dXi5IaikiFJI6TgiYsNHw3J2RUaSWy6aq2lLykYd2+JtoQb/b
         WPYKmfiEXZFUro4i7WgXcKU9OWu/3ce3+jMomXJ6//8ghV2uG/P2NKRRBBbwTSIhHKl5
         d4Hw==
X-Forwarded-Encrypted: i=1; AJvYcCW9u9nec4YjlpjbXk4uCg4gsOQ4iofL4+D9rdrX+9SOsQ9qvn/7X3JLIWN0ZgzQFciuikBPASMCo92jeLc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyQ3Nqiu0szwb6fY+Sg26YHyhTwpMk19PWGCSRnD9TeyHOrtULo
	KTot0JQ3hXNX3dnuvn0HGSs9JLoepLm3CZkL45G48bMDY6i3+YrahTH1FITRx04=
X-Gm-Gg: ASbGnctPbJOiN3PNGP3/rHQylQTR8qC9J/NwAcRgIdUXJCUpAWZ9cmRgiSZZ6W6uBzu
	DDdpap7pHjyotgLxLHChd8fOniij0AvOsLV72vswyt5L3bXSkBW/FrZ2MSQPZAnIaiLhSC6F0B1
	DHvPX+TJzV+/5gddwMyYdg8dsKBN7TAqpxVPp5uNolDLC4GawuN0rA3msDA98oWbyj9sKSrCD74
	SoSoyIrFgDe9I0wPE97KZ5+gjke/hBoPqCHrTtoUUk5GOUGKfGC8R9I7bbhuu0FECzFvFtbGFZq
	HT4XL7VmP2CILW7d4iO/P55wMJduew8g6KyUHPStPuial2viUsn3Pg+nhL5l
X-Google-Smtp-Source: AGHT+IG1HG474H6q6bPpOt7xbsbQ8wAky1uvAa0teAmjbL304Djm6yn2qTXg3DoixKQK6rupsAkAwQ==
X-Received: by 2002:a05:600c:524c:b0:43c:e70d:44f0 with SMTP id 5b1f17b1804b1-43f1890857emr4294885e9.19.1744110090538;
        Tue, 08 Apr 2025 04:01:30 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-43ec169b8a3sm159770715e9.19.2025.04.08.04.01.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 04:01:30 -0700 (PDT)
Date: Tue, 8 Apr 2025 14:01:26 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Rob Clark <robdclark@chromium.org>
Cc: Sumit Semwal <sumit.semwal@linaro.org>,
	Gustavo Padovan <gustavo@padovan.org>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Pekka Paalanen <pekka.paalanen@collabora.com>,
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH v2] dma-buf/sw_sync: Decrement refcount on error in
 sw_sync_ioctl_get_deadline()
Message-ID: <a010a1ac-107b-4fc0-a052-9fd3706ad690@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

Call dma_fence_put(fence) before returning an error if
dma_fence_to_sync_pt() fails.  Use an unwind ladder at the
end of the function to do the cleanup.

Fixes: 70e67aaec2f4 ("dma-buf/sw_sync: Add fence deadline support")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
v2: style changes.

 drivers/dma-buf/sw_sync.c | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/drivers/dma-buf/sw_sync.c b/drivers/dma-buf/sw_sync.c
index f5905d67dedb..22a808995f10 100644
--- a/drivers/dma-buf/sw_sync.c
+++ b/drivers/dma-buf/sw_sync.c
@@ -438,15 +438,17 @@ static int sw_sync_ioctl_get_deadline(struct sync_timeline *obj, unsigned long a
 		return -EINVAL;
 
 	pt = dma_fence_to_sync_pt(fence);
-	if (!pt)
-		return -EINVAL;
+	if (!pt) {
+		ret = -EINVAL;
+		goto put_fence;
+	}
 
 	spin_lock_irqsave(fence->lock, flags);
-	if (test_bit(SW_SYNC_HAS_DEADLINE_BIT, &fence->flags)) {
-		data.deadline_ns = ktime_to_ns(pt->deadline);
-	} else {
+	if (!test_bit(SW_SYNC_HAS_DEADLINE_BIT, &fence->flags)) {
 		ret = -ENOENT;
+		goto unlock;
 	}
+	data.deadline_ns = ktime_to_ns(pt->deadline);
 	spin_unlock_irqrestore(fence->lock, flags);
 
 	dma_fence_put(fence);
@@ -458,6 +460,13 @@ static int sw_sync_ioctl_get_deadline(struct sync_timeline *obj, unsigned long a
 		return -EFAULT;
 
 	return 0;
+
+unlock:
+	spin_unlock_irqrestore(fence->lock, flags);
+put_fence:
+	dma_fence_put(fence);
+
+	return ret;
 }
 
 static long sw_sync_ioctl(struct file *file, unsigned int cmd,
-- 
2.47.2

