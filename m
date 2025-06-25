Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCB702BCF72
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 15:22:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750864935; cv=none; b=G8RW1HwVmQZoYwJVR4JsiPCbwxa9IyNCEemRnL512hfl/KbB+9gyYtH/zvb5XN4Z4IMeogXSJaIWjFtbGqX2qTLJIblGBHtDEvDGaTs4uQemv2+s8pabvmUvmeXP01Qq81jtKMfY988xqyvPpJbr1ENpZDPIMisgKatHxM5nUrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750864935; c=relaxed/simple;
	bh=aTkJQnR/3DETZjCrMFipfbUfY5SsPpOZ1VX4D8ujLV0=;
	h=Message-ID:Date:From:To:Cc:Subject:MIME-Version:Content-Type:
	 Content-Disposition; b=XzDapm1f3YPnA3AQmOZg9vyW+mlVEQ28OkTsdS9iwQXmaQ0mLlzz8da3U+GLCltI8Rd0KMgk58UsGi9itLvICHh7p2pJ+kgQ7QJKN7x7e7MpuX7SxOQPOTd34cHOcJ8kAuBMwvzC7Y++BS2oYWLWeT2WbR4HDcP7yiG7z88oiPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=p4zTCpIm; arc=none smtp.client-ip=209.85.210.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="p4zTCpIm"
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-73a44512c8aso554619a34.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 08:22:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750864933; x=1751469733; darn=vger.kernel.org;
        h=content-disposition:mime-version:subject:cc:to:from:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=u98SmNY03cRBjpwBKU5+I1U9gP6hvTPRDks/D5f8cPE=;
        b=p4zTCpImNNnbGlWsO67b4H/W/CW0sjDE6vYfK0JTfFywa0bcYYIzVSNig62b/x39R4
         JDGiM/OHl+d8uz7zpjMy6OtMtzBDY8iG3Bbg8qBV1FEsh6ZtefUqNxxFM6lsTZyO+eKW
         UYsD/uFynkjrMFgA/W80A+pGH853Kg2iu0zxZ07hF6K7t07q0qK8ynWNoszVl0mK+iSI
         IflvDX4+qiZ6LrKrFNAAiSC8sCCkRULMqZ0GpGCWtsmjk5ViyhtHQGcYbvQKIM8bV7hc
         /TCo+PocYltKNpxDCeHBCsEvTVl46HykTQsXZUt99IqDf6qKQtCzhk5+jhbNqBK/0Uhc
         d96A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750864933; x=1751469733;
        h=content-disposition:mime-version:subject:cc:to:from:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=u98SmNY03cRBjpwBKU5+I1U9gP6hvTPRDks/D5f8cPE=;
        b=cpy09smP0c14t1Z6lUbO8KL593sgw0VLuFcR+MIuoe5PtUGp8Fj9MZxe79MUhm9C8g
         LsYENbJPcXOaq8VOP3KpdrEnzsJvFYTsxdAD2zS9QGpJqQtivTBZbk9DKAnLm3h1geeM
         TJwZG3DGQI0g7VKS1NoGRcVT7hPV2vV3y4WvVsxDL9WYFIU2wlpRiYw4VhfBB4RnQtWw
         aKXFFwxkUTGhYj8hTdrgBBO2UNtjwbHTEuJJeU6HxP+GB2BlA7dOl61UEqXM25lOlaV0
         zSBuFOz9tRP2wP1PbFsTHjlUUZp/WQ4ckashh8RodVN8VLbvzZaBkC7kZFPapdbh/vsQ
         F1pw==
X-Forwarded-Encrypted: i=1; AJvYcCUxrI9tQr35EIka+abcgatYJCuyVSRszAnpUnkYi7ygWlNUOZfNjh285oTICcmq4bY9DRYiMk9PgyNRaWI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwxsGaN22vIQKZGCBhNnmB3Mo2XnJTGxZIABSgWgOPY9m1uNR9F
	wePsRP0VxZI9R4resR/yp3hYK6hy9ndMKZfhb9Wreslvt6tQmbqhQzbKwmubQ1LQwWxrJ5on5h+
	8Sh13
X-Gm-Gg: ASbGncsIsn25/bRLytrgxD3TyiglDegqXYRL+2h04CQ2znLNdoh7+333rptAHcuZIL3
	PVqUjh8CFqXTQjsBgLz9xqs+t6+IzFZlGovDdGnBVakNg5cWZKw+z0xy7pJsxJinLcOMrzFL2jC
	QBiDw+9Ru1z2fdynOhzOHciFqqTWM+Wr4xOD14liP2K0G4slj7JUScnPPQbttOyyo7CZBRCftBJ
	AozXYw4+TR4gXr7jJ4Gi/sUCiHZEpEtJUh++8sX7b4djkzdoinzkA/9A1CdbnNnvBOG7xA2Gs4l
	VyJ8RrXaqq05XEAJCfoQ2ROIgzRtKyqO5dq50FXdriPXl4mVIPwuZ2y+vNLEW39DU2+X3Q==
X-Google-Smtp-Source: AGHT+IHkG6dat7iqtvzwTRnE7a7/Ug1VTKQvcFownkvnX4pRkEWxDAtT4ssRBcmMzlRv3IfqQ4RMqQ==
X-Received: by 2002:a05:6830:8088:b0:72b:7cc8:422 with SMTP id 46e09a7af769-73adc7eb8eemr1793945a34.20.1750864932939;
        Wed, 25 Jun 2025 08:22:12 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:1fca:a60b:12ab:43a3])
        by smtp.gmail.com with UTF8SMTPSA id 46e09a7af769-73a90ca9c12sm2236713a34.50.2025.06.25.08.22.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 08:22:12 -0700 (PDT)
Message-ID: <685c1424.050a0220.baa8.d6a1@mx.google.com>
X-Google-Original-Message-ID: <@sabinyo.mountain>
Date: Wed, 25 Jun 2025 10:22:11 -0500
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Xiubo Li <xiubli@redhat.com>
Cc: Ilya Dryomov <idryomov@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>,
	ceph-devel@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] ceph: fix NULL vs IS_ERR() bug in ceph_zero_partial_page()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The filemap_lock_folio() never returns NULL.  It returns error pointers.
Update the checking to match.

Fixes: 483239f03149 ("ceph: convert ceph_zero_partial_page() to use a folio")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 fs/ceph/file.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/fs/ceph/file.c b/fs/ceph/file.c
index d5c674d2ba8a..f6e63265c516 100644
--- a/fs/ceph/file.c
+++ b/fs/ceph/file.c
@@ -2536,12 +2536,13 @@ static inline void ceph_zero_partial_page(struct inode *inode,
 	struct folio *folio;
 
 	folio = filemap_lock_folio(inode->i_mapping, offset >> PAGE_SHIFT);
-	if (folio) {
-		folio_wait_writeback(folio);
-		folio_zero_range(folio, offset_in_folio(folio, offset), size);
-		folio_unlock(folio);
-		folio_put(folio);
-	}
+	if (IS_ERR(folio))
+		return;
+
+	folio_wait_writeback(folio);
+	folio_zero_range(folio, offset_in_folio(folio, offset), size);
+	folio_unlock(folio);
+	folio_put(folio);
 }
 
 static void ceph_zero_pagecache_range(struct inode *inode, loff_t offset,
-- 
2.47.2

