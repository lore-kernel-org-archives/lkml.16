Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BB45227574
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 06:27:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750746455; cv=none; b=BB9rqqsOkjxVxwOYd32zxn7TgMxMXhq/XVLTSFy5xyrWjILi20KqGTqki9kJaO2viE45CTvVU8orI85/y2ooEzvkGwFJmj2XcUWvSwtXIyxlgefggFr+7LBQeHDFZGDwjKquTr6d8OWsVkjnIptocCjBAMH447LSNcIPTILLcqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750746455; c=relaxed/simple;
	bh=xkTiZpv/ASXY9zvmJWSVodQL9KYOVQ0OTX1/kMLhvsU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cdver2a68MgZgdPlLuDYOo1WQJNPZ+m1K8xsoxZ76m2Apn3oOz99JvL3bQLaywOsYBPjVNGejKuK144CeUVMLLx8NtT/uxXjq8Xi7wy85MiRJv9NwOCGIG9NMgwBZnchtD5zK4mNBdyAOC1rwskpMfpnvwtgg3L/XPRQn9zKlbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=brighamcampbell.com; spf=pass smtp.mailfrom=brighamcampbell.com; dkim=pass (2048-bit key) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b=BhC0dnY3; arc=none smtp.client-ip=209.85.160.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=brighamcampbell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=brighamcampbell.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b="BhC0dnY3"
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-2db2f23f174so63561fac.2
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 23:27:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brighamcampbell.com; s=google; t=1750746453; x=1751351253; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jtWuSUmqyfHOpJX4FSI5IleGdX0aakm+epSuzbOI/jM=;
        b=BhC0dnY3Vct8u+gz2i1t2njCt6rWxqXEv+zJoc++Wnra9150dardgHm9ylXJVlfRw0
         RXw0k09xwX6Wu2KMEk558E2HYyFnkeAy0Xb45G3Yr2rUbh9oN0JPkv6ILdjQ3bJT6Taw
         cl7Tk/gTY/9dDptVptLm1zcrLTJVxpKayilSYf3a2fwteTrgvholGFx49EN33UR5pp8R
         qFwE0q/DzUSZlQf2JeebQAWXKSAg4AkZHAKkDMauMHXAXBW5f8di5gKMEyqbhLR71cbZ
         jyHrOEYxXBqEtmkS8fMXQu9sIARmn0FOGHtgZB11rUijYOD+gEQkJ9/9SOBhZo66n9kx
         iHoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750746453; x=1751351253;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jtWuSUmqyfHOpJX4FSI5IleGdX0aakm+epSuzbOI/jM=;
        b=K9AeBqSd/CVs2T2meA0yAv0NqIx9UEflY3V1+KbS6Rd8NggL9OqwV1v28p2laX/dCa
         H+bRUVDGVzc5V5E/qjzsOY5RSBCDQCRlLl94txlhK09/YJiEwC3PB8/ihIds7CVwPNqA
         4kozcFpA54dcnp2RTHHiFXk2ew/3Vl9ZbuVbCg1LWxyvtmVKMSDR6EHTwJ7aCNS2jFlm
         l5+YoZ97+242UYB2EfRzetxHZKp7kF+qotD0TwTUgStBRkv0H3JMPo4tAnoY0qQm5WiD
         zI6eWdkxOVz4l5OOjA1Y2dG8XsV8//0Ri8yHYhw7XvIPvT2Ljb6eTLLmYmncgRqdNkzn
         tYtg==
X-Forwarded-Encrypted: i=1; AJvYcCVaHde+PCuRPiYiiRMSpMjLlgoaxDStPxm3fHIKchZ++PpKLAcc1y8cW/8hwod7d2px4f3JxhdvNi+i7kw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzDdxZnM4BORLuh5sF379rTQUstXkUVDFLC77C1d7gxJAn857hQ
	aq/DagSFuPntG06EpRqp3hvBoLQTWHTqfrsL70LmhYf7jKwHDmbTRojHXHZX+Uv4vHM=
X-Gm-Gg: ASbGnctZrdBr+em0kVNWmDoTdlkRQhtScbRboKK3Uqsdd2Z6IGcN18K5h4zVD1hPHrx
	qHfsSUfszr9tr+gUFCiHgE2VZvh/2HiXKlrF26lCSx2DDlM+Y8YB8BLUo78oNAXyEg1qvqU5N1a
	aaIPltXXhVnfwcdmCRaZb+kC8yG1UKGqD621ZvsnKtDi2/KgF60PJ0PoLmff7t7OFcdeJjzYV7B
	bRXqLDruROtxvxVXwoWBThi6zPY4Hon3UGGs/WFUBEyfACJEjH8BHw2451dxIzuOd6eFejTe7lD
	YR9pNrOn2MYa3qs/BMGp1fgO3U5Z1uJWNJYnEcpB0X1JGbKqEgxriO11CZPhCaLzAKRD6iIFCk0
	wwj6mmsWQQ9w6RnSP1xL4G0X6lxw=
X-Google-Smtp-Source: AGHT+IGXzXncSuwViLxhLF7LjICBNjU3M6FzetwciG96U6KAFP9MbxjiOEvJ2Uymt/tfqzWTPe1Bbg==
X-Received: by 2002:a05:6870:f699:b0:2d4:e8fd:7ffb with SMTP id 586e51a60fabf-2eeda4d3058mr10282116fac.1.1750746452932;
        Mon, 23 Jun 2025 23:27:32 -0700 (PDT)
Received: from acerlaptop.tail542cf.ts.net ([2600:100e:b0c5:b996:8d65:22dd:1f32:69ca])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2ee665ae530sm1957728fac.20.2025.06.23.23.27.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 23:27:32 -0700 (PDT)
From: Brigham Campbell <me@brighamcampbell.com>
To: skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org (open list:DRM DRIVERS),
	linux-kernel@vger.kernel.org (open list)
Cc: Brigham Campbell <me@brighamcampbell.com>
Subject: [PATCH] gpu: drm: Replace scnprintf() with sysfs_emit_at()
Date: Tue, 24 Jun 2025 00:27:27 -0600
Message-ID: <20250624062728.4424-1-me@brighamcampbell.com>
X-Mailer: git-send-email 2.50.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace scnprintf() with sysfs_emit_at() in drivers/gpu/drm/drm_sysfs.c.
Per kernel documentation, show() should only use sysfs_emit() or
sysfs_emit_at() when formatting the value to be returned to user space.

Signed-off-by: Brigham Campbell <me@brighamcampbell.com>
---

I tested this patch with a device that outputs one specific resolution,
or "mode" and with a dummy device which has no output modes. I'd
appreciate Tested-by tags from anyone who can confirm that multi-mode
graphics adapters work as expected too.

 drivers/gpu/drm/drm_sysfs.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_sysfs.c b/drivers/gpu/drm/drm_sysfs.c
index 60c1f26edb6f..66d1fc804c84 100644
--- a/drivers/gpu/drm/drm_sysfs.c
+++ b/drivers/gpu/drm/drm_sysfs.c
@@ -283,8 +283,7 @@ static ssize_t modes_show(struct device *device,
 
 	mutex_lock(&connector->dev->mode_config.mutex);
 	list_for_each_entry(mode, &connector->modes, head) {
-		written += scnprintf(buf + written, PAGE_SIZE - written, "%s\n",
-				    mode->name);
+		written += sysfs_emit_at(buf, written, "%s\n", mode->name);
 	}
 	mutex_unlock(&connector->dev->mode_config.mutex);
 
-- 
2.50.0

