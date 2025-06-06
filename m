Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54A751A9B3D
	for <linux-kernel@vger.kernel.org>; Fri,  6 Jun 2025 22:10:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749247855; cv=none; b=DERo0wfCbzBDccSpdIFNz2XUYxsmmWky+NCSRVY3gRYei6r5h+kxM3c5Pwl+v0TL3StXhzOJjCSQQA3idZL5j5qLwv9sFoqIFdSLFZlRil5lLUSUlNQj4kmzR2gQKxBYavXzvpzbhPHO4vqA1CptwJ49yqa52eRw207CigrJ1Dc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749247855; c=relaxed/simple;
	bh=7m1FdBQ+yRtJREgdiFFGs3i2+EqJk6E9CGpQgOWC22U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LQ+8f7Bz4uPutf8V/k51XVSZkHcS4kR/8+x1f89jGDd14eJks3wqWDUcQv6ujgI7JZkx/bRVPKCNoBxapP1aalbNrAKcdIiUPPUrIFL7JqDdyuoz2UwYTcWwpxHReUMwuCZr3N7ytwzvOxAYGfiSjZmvCQbqFX+Dqwk/08ShD1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com; spf=pass smtp.mailfrom=googlemail.com; dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b=ZPqkOypP; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="ZPqkOypP"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6077d0b9bbeso1774120a12.3
        for <linux-kernel@vger.kernel.org>; Fri, 06 Jun 2025 15:10:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1749247851; x=1749852651; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=N3ygnVw/n+6bwn53y0Mh0mYQycS7zL+z+SR1TPl0nEc=;
        b=ZPqkOypPeuwpepHACwkM8mAazdrs7dDpmryJhke7W0siyPAxOVzrDDJu+C2t+7AFKR
         B7BKD3ewEzILlDQGYQngyTYhBfIqCjjwHzbUOgAxI4pbpmxAbGT2MKaIrvQ+ASkG6il2
         Ea2ssljo/VvKOLY+wxkyQH03YZAzhC3oSIEUupu8fjHnvWnhiLqJHFQGtzbPRiNirKpH
         uqdvHYSmKamxG7I0F0+A634OD/d+Q2KHtdn8LQwVtsODrlPr0GH2No293nMQAZ8L3XbL
         XSg6/cDBc8TzhgR29VNuHp7ZDp4efou6v9Zd8Vayq0bX8C4gXttELMSAotTCpucjN1eO
         pmow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749247851; x=1749852651;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N3ygnVw/n+6bwn53y0Mh0mYQycS7zL+z+SR1TPl0nEc=;
        b=s152knvLzkKKFFbZ3Q8LObz8a7qGV3qGW0MeZSjhIHSRU4OpMgBL01QlKiG8nnuLSf
         ZFXIBFbwiOYyd3/DRn00wR9GWpXYmxllAouv6XDX2jkfUP1Sft2rZ5PYXqLFydBJIrmL
         n1/Seg2uGOA4x+Qtt+vKsODLMS//1rEw4Z+rSlTM/yCTe5YRtvd6iXt8jvCAMKBSeCBK
         5lksR230J9+QymuuhhWCThOSGN61anVvqpBsfPHwzXkgORMmFxu7279B7SU/xlFKNTtn
         htXt1/vnQDrq9VUODaHnuH5v1D+3c+obSuziCZEWd+UFv2wwpP8eSTgaCa9R407X8ji6
         3S8w==
X-Forwarded-Encrypted: i=1; AJvYcCXcYznaAYxLqpSmfx44Er95mYU2iebR4Gffk/Tr5X9QmC9R3BsLCcBt21a2ZM92/cyfSi/4Zhtmvmv1tQs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9IYiHldEuy1Bur5EFPb5hWZ4mHIBRPQYPePvQo7PnygtLlVGt
	k+OCL+V3wetbwd32OqRsxUYYIRhqGVndXRqkFHaHpptzAZmlW5/n56tn
X-Gm-Gg: ASbGncvGziPMPV/plVAVnw1ii8nINNkh7g/Q1Nkjm9Jy3KCZH9xgD8r99ng9VHNIfmv
	nNin5UQKE+HwA8nUkawq4nI2xc+zZd4Tzzx3iNOoiXXoJIEtHbhYu5XHrKQIBJb+dxXDmZ17z8Q
	teUsvtioOX94c3MdKEBb9OAvFoZCn5DVi1sKyeGYBtFa2Bu5Y4xnGIzNnzBnxIcCP+/XH/VQOc3
	3Xwtb1igXgF6AEDw7cRmVW2VDWV9NOkixUeZ5RcQDm0C2WNG1BCCu3YX15i5akwB9XW41C3tEGa
	t3V2e4DOHywe5q5kFrggggmlHRYD6yBKLQzlXrQUUCQ2yGevQRFf+L+qjYJrWBfRiCnxdXzLCIU
	go/drgMrQJDJsw9Xtp/0JHRtAUH6LakXdJ7ZtglQIGh0XJQ035K1cFffCnQkfF4X7EpjAh7TGCw
	kTZg8zpIB0S0kB0jfZ8naBQcfehISSYQ==
X-Google-Smtp-Source: AGHT+IF2GDmxSpU2PUP8gOk0whzGQdZbH1jzBstBC+SVXNfKpbrPiO7RDCeI9rjuTtfJwFYp3Msy5Q==
X-Received: by 2002:a17:907:9628:b0:ad8:9e80:6bb1 with SMTP id a640c23a62f3a-ade1aa933admr431541366b.18.1749247851398;
        Fri, 06 Jun 2025 15:10:51 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a032-8c00-1e86-0bff-fe2f-57b7.310.pool.telefonica.de. [2a02:3100:a032:8c00:1e86:bff:fe2f:57b7])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-ade1dc78f47sm178605166b.153.2025.06.06.15.10.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jun 2025 15:10:49 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org,
	dri-devel@lists.freedesktop.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH] drm/meson: use vclk_freq instead of pixel_freq in debug print
Date: Sat,  7 Jun 2025 00:10:31 +0200
Message-ID: <20250606221031.3419353-1-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

meson_vclk_vic_supported_freq() has a debug print which includes the
pixel freq. However, within the whole function the pixel freq is
irrelevant, other than checking the end of the params array. Switch to
printing the vclk_freq which is being compared / matched against the
inputs to the function to avoid confusion when analyzing error reports
from users.

Fixes: e5fab2ec9ca4 ("drm/meson: vclk: add support for YUV420 setup")
Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/gpu/drm/meson/meson_vclk.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/meson/meson_vclk.c b/drivers/gpu/drm/meson/meson_vclk.c
index 3325580d885d..c4123bb958e4 100644
--- a/drivers/gpu/drm/meson/meson_vclk.c
+++ b/drivers/gpu/drm/meson/meson_vclk.c
@@ -790,9 +790,9 @@ meson_vclk_vic_supported_freq(struct meson_drm *priv,
 	}
 
 	for (i = 0 ; params[i].pixel_freq ; ++i) {
-		DRM_DEBUG_DRIVER("i = %d pixel_freq = %lluHz alt = %lluHz\n",
-				 i, params[i].pixel_freq,
-				 PIXEL_FREQ_1000_1001(params[i].pixel_freq));
+		DRM_DEBUG_DRIVER("i = %d vclk_freq = %lluHz alt = %lluHz\n",
+				 i, params[i].vclk_freq,
+				 PIXEL_FREQ_1000_1001(params[i].vclk_freq));
 		DRM_DEBUG_DRIVER("i = %d phy_freq = %lluHz alt = %lluHz\n",
 				 i, params[i].phy_freq,
 				 PHY_FREQ_1000_1001(params[i].phy_freq));
-- 
2.49.0

