Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC0852AF0E
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 08:06:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746000401; cv=none; b=AeCv1wSoCjy3GB9b+wNk4VrCDFO4gav+AozRCW0bslbXW6ojeNqT5G68VZ+PLl/+MZc9l+YgP2DlrN+k53emshBXwP9xrFRHmzpZIM5WHS2V9lJU256oh16rdGsu/LcODk1s41fYhIXbMYhWfypp640Fwgj7KgGYvMeBSL7fg3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746000401; c=relaxed/simple;
	bh=99+kCDIITBMCpmDZvnmLUTjaZZ6LPqCubOvj04JEBtI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WnIFsMC9E/zxW2tsBlgWntd+QkHCYOBRw1nN3j2Sl6D2OuU5RrNEaQBvpZzGN7HYtVbpPyiQyW5Hh7JZBds4U4yiEYMx0xKenKRuljkSp6K5Cla7KSX1ToSPzsB1dSEqB6P3Ky0FmpFx15lRTcyDgMh9TLgbfB7mgXpRsA6lB/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QkipsDXr; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QkipsDXr"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43cfe63c592so71720255e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 01:06:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746000398; x=1746605198; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JaBtCb/6XVAvBecubHAVnnEpXRtXlY0yxjWDApUS/CE=;
        b=QkipsDXrVNvE6qclzrfPGxtpF7ikYP30XwL1H89kwa4VsZnDEKgc/x+2+35NS7uiUg
         G6k+s8yg41e6PA6gcmdztdAUPo7S//ULJybdRx1b/GZpFyFOE3RaQhiSZ18+7p1vNB6H
         O/SNCRHsP2fxfvnM3XF+FQjJRRlEpk0Le9I2ETcf5u4qAcdksRpM1yLSAkqe8B30s4cM
         WKOH8/+7xJsExW8uHaqQlMwc2qV/KXFp0nSnrloRCb8araKgfb8d7ueHsk454HN7t06r
         u7EKoPvILkDNxxcYM3QHsw+klEdejpKZradDhmy0E0AHGMaHqP831SfDnmiKATZeK9Me
         UE+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746000398; x=1746605198;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JaBtCb/6XVAvBecubHAVnnEpXRtXlY0yxjWDApUS/CE=;
        b=RwakzIRjx3UmyIdfwqLoB7Y7SR5atLP82w7vjZ6rfxy/ytceBjRNZAjLASGe2LwECZ
         VQlqcEzyb2hQHJzt9rH5guvv9Esg89FNOHb5XDjsTyjKhi8lCvoeDLWxvYdsXd2nACwP
         elSo4aUZ6QLCAOtH8PjYlGBp+9AZYVLMP5rvYquq58th76Bj5EsvAvk8T18HgsD+KRaT
         nYT4dPn/BbFbOmJ9TlZ+WbstH5GqpI+Q8xGYLKVUJVlFk4GnwkmqV8pj4zHZR3/bKCDV
         KMVo94vft+Zpo0+sN94ObkmaTt1LvkKncm7pmnaLkTA3M2ST+E+Ij2AZZ8eqrTNuuFiB
         6a1A==
X-Forwarded-Encrypted: i=1; AJvYcCWmJfiahnI/lBvrC3Khqf5qslvGblZGarpVDuAi0/dQrRRJ4Fle0M/EKe+/RZNpWxR2dflW+MPdv7EKxkM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwbRpszWEyJkySf1lQkLZPTXUXb05Vf78jjOZeratDqUwjDxEMr
	iR8RdM9ZErUjByTFfu2uq09lYqcZ+DfKTwiXOVSRZKmU3bKh/Rl/HxvbU4TZ5oM=
X-Gm-Gg: ASbGncvZML+kqkr2bbHLAvNxhn67t2gKmizrVf99vMHZL+IMAyHJIjDizB7VFTlRa5d
	sBRriYJGuRlO6v04ff73+xTc49LfrzPUZH9T94hSMbI15KPe8M3jUkpiXRBXsy1uLgx5dtp8S+S
	RH/U0GYPfi9D/I54ySHx4odY+URKo3Hg9vmpX4CLWfo3v2wVSscbTAjT/HjboztOxoPgOD7ePUb
	VfrT/cEcL3a92utjZs0pdpE1LGRCZwv6B5iqSlZKbV4kxmW8lLNIR0yr5HQu9bxwc5Bg+o20s/1
	EtMt4ys8TUI96fXhsab87Z4uWfphlUrQD+H7/7uGip4N+w==
X-Google-Smtp-Source: AGHT+IHP+atkeWPXnPct3xYEf+jUQ0S7DQqC5h4qJD0wJmpfwo3S07LKuBCrJm3Z9SrRTQ8TUMm+ag==
X-Received: by 2002:a05:600c:502b:b0:440:6a1a:d89f with SMTP id 5b1f17b1804b1-441b1f30736mr19057575e9.4.1746000398163;
        Wed, 30 Apr 2025 01:06:38 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-441b2bbbedfsm15173965e9.26.2025.04.30.01.06.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 01:06:37 -0700 (PDT)
Date: Wed, 30 Apr 2025 11:06:32 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Lyude Paul <lyude@redhat.com>
Cc: Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org,
	nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] drm/nouveau/fifo: small cleanup in nvkm_chan_cctx_get()
Message-ID: <aBHaCM66pXaP84ei@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

"&chan->cgrp->mutex" and "&cgrp->mutex" are the same thing.  Use
"&cgrp->mutex" consistently.  It looks nicer and it silences a
Smatch static checker warning.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpu/drm/nouveau/nvkm/engine/fifo/chan.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/chan.c b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/chan.c
index 7d4716dcd512..f5cd7f7c48b4 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/chan.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/chan.c
@@ -104,7 +104,7 @@ nvkm_chan_cctx_get(struct nvkm_chan *chan, struct nvkm_engn *engn, struct nvkm_c
 	if (cctx) {
 		refcount_inc(&cctx->refs);
 		*pcctx = cctx;
-		mutex_unlock(&chan->cgrp->mutex);
+		mutex_unlock(&cgrp->mutex);
 		return 0;
 	}
 
-- 
2.47.2

