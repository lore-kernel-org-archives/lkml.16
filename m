Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 841EE236435
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 11:09:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744801768; cv=none; b=Ps3TMy3zZ//Q7Vaj1SvNEwf0SJmF0fDavlaZCJNlEUIDSlgLJ1rIp7xa77DMdoqhwbKR3gqmDBO+DpAjKI9LXThH/VzkDQ0k5dfwuL5Mk/+K5xlKmwEusTvYTOML1ZNV9UFIOFLZqVBJXoTqQ9hy8mZMZSzlFsHktce3MytkXJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744801768; c=relaxed/simple;
	bh=6vbNHqCq64KR5XtBXl5v9gH4kSLDvAvERDHu6pcREeI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ds81jVcNGqwQA8SjfycFcEOtcLsAaZ8AJTiZBntZRc839NFv7LGoSbx61SK78kIviep2enG8I9WcjmSKq/Vw8vmCBLVIZUpr7GTjfXOSeszoLQftj+CmOPfir+EA2f1qV99D2TF2EOYKwJ5fyN3hb9pIvIybKthKDBvI5120viU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ol5lCuWX; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ol5lCuWX"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43cf0d787eeso76199705e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 04:09:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744801765; x=1745406565; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JF0Z7gGf1sTr4yNTYDi/uIElOA7c6FMutBpGSopg3TE=;
        b=ol5lCuWXzrr6A/vxpiUTtlMwQMBYSYj3r9jzvGhZkFD+dHU7sZmNtWwT2jmGdrBNo4
         4bUq3ryQrko/dH/CqLdaxGnlGFrKTwQvUM0R9nQQ1xNOnVniJ7Km9Mt1eKvV7UeZUXpr
         NTSIMsgN1P1HpKs461rVvyJV/Xe2PzLm9hyYZ6yaU8lAOnokH5V4fAgR5ikxmG3UUfau
         bgZaC4raQgJP58qfw/zH8Hf5M7GNSKNics1uab0j3Tk2F5Wm8zE2zwl+R5UIhEwFQ9Vz
         hY8YviEYAcyt7T+ujD6CT2XJ89AMotyjdKo5Wt/SZB5sKfnOkjoA2L4Pyl573OJWKIQH
         ae3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744801765; x=1745406565;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JF0Z7gGf1sTr4yNTYDi/uIElOA7c6FMutBpGSopg3TE=;
        b=ELTwGPsd9BMDLWU6NULZ2FvzT01qRbmHNlcNHK3zEs+xTN5/H5d/7KTn6vXoUdvBHE
         XIGsWFsH6GNWkqjk31wxGMz47todzh+DkAu9hPjY+2z65TRmIygonh6UU/WJif0ChP58
         7XoVR94GgWzx888JleTA1WoNUe/hLOpTvUhgRYv6nMghaiL7na7Hnk6oiFuzC0L8Lkm/
         3XRrIihyvj5qgQLz6A68S8CAnnrjObN2IRSeBrwKdvTssYUqAiHFAbGYwKtuT9jd+bgW
         30nvB7IkCYkMBc2d5eknxhm5bl8VOG3Z0XpitV1Ws6s0qLD1hkgVpp0qO4DwbNpLSAVT
         gHbQ==
X-Forwarded-Encrypted: i=1; AJvYcCVyz8HHPWVPA3W9qSLfpwlCuOo5N2lyU5KOjmlZJjQAQ294yn3IpX0uS/GF6mS9EXmu2NK1XGImxbByck4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzXrWV407fJ2+P7lEYoaJzZbJfmYk2qnG8kj6ejUt9Iq/1SwNUT
	tEVik9rU2iZVQjc0Hp6URYNm+TOGIaHfMJjz454OBeP+qyMTzahHHygT21ASLZc=
X-Gm-Gg: ASbGncshMnRajTgTNeGvazBTeCmxa5n9AFUMbBNC/6bZA9KTPBQI3HJ/dAevd0FDtEg
	jVhQP4Mrs32C3DO1pCVHisPT6mIaExwKgIuhlFYp7kphhZ/pbFnEjtEQ1Cnagths3NNj5VESXXo
	L/SogghZOkU90GC979anGNewcbaRw9XR96CecYjdF83huM5hGGwWuSwEkotXpNs1C/a71bqEx0g
	FRySZGSMHt0IWude4CJJRUdlU1Ly9mKSXF1Hu8w1pINeZtyvWz6lIgss4Qobj8yhW+eicWk2H24
	fC4r5WheS0DVfk3PSnBFDiwv8OFqkAnE5sRFrt6KCObCvQ==
X-Google-Smtp-Source: AGHT+IE0M2ogmZ3Kz2Re9Yfivx+X34a5bjUap/WvGE5uPRjHdo77GDmKa2/LSpuLxrJNZcmScbAtOg==
X-Received: by 2002:a05:600c:3d14:b0:43c:ef55:f1e8 with SMTP id 5b1f17b1804b1-4405d6255efmr15632385e9.13.1744801764696;
        Wed, 16 Apr 2025 04:09:24 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4405b5a9846sm17583005e9.35.2025.04.16.04.09.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 04:09:24 -0700 (PDT)
Date: Wed, 16 Apr 2025 14:09:20 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Dave Airlie <airlied@redhat.com>, Sean Paul <sean@poorly.run>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH next] drm/udl: Set error code in udl_init()
Message-ID: <Z_-P4N4_U-xTC9-O@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

Return -ENOMEM if udl_alloc_urb_list() fails.  Don't return success.

Fixes: fb10144ba426 ("drm/udl: Support adapters without firmware descriptor")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpu/drm/udl/udl_main.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/udl/udl_main.c b/drivers/gpu/drm/udl/udl_main.c
index 3dfeb88cf918..bc58991a6f14 100644
--- a/drivers/gpu/drm/udl/udl_main.c
+++ b/drivers/gpu/drm/udl/udl_main.c
@@ -361,6 +361,7 @@ int udl_init(struct udl_device *udl)
 
 	if (!udl_alloc_urb_list(udl, WRITES_IN_FLIGHT, MAX_TRANSFER)) {
 		DRM_ERROR("udl_alloc_urb_list failed\n");
+		ret = -ENOMEM;
 		goto err;
 	}
 
-- 
2.47.2

