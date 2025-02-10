Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B357E26461F
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 23:32:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739230374; cv=none; b=BsyIz/mBs0kFb02K7DmGa16DED7SaSrNCY/QUvOHUiBFOxfb/sdos0SQIac7rxjcuVTQLUp0BW8feJJ2sT3oBn/68YJ4HBlBIm7eiQsbQIVGRVaKSGFmRd8NU8zKYEkmS+LXTZlT+Cy9gUS6n0aL/HJZbFfw2Ji1gitcLzgjU/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739230374; c=relaxed/simple;
	bh=22w+j6lhQP8ezfPjcTRSkUjR+nPqYS1QRolgr+MkP2c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ehOR5FwZGpQbCjke5rB6HeZVcktwcW+qnlG9AjaP1FbVfD4woTW+VrU0hY/8mfXLwhFyL+YvJEu+fXFvaGzmFikVTDOxv1loIi6PpPWPuEbiQlu0Fr5yQ/zYgnlGYfHMIWnHtmsVfhs3LtoS4BoJVneA5dM5iiaEfwxR+s7XIbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AVavRFgD; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AVavRFgD"
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-7c05bb6dab7so170405485a.0
        for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 15:32:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739230371; x=1739835171; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Hs5o7sIfj/0izaV2OsPt7FJm28HaB4LTbbVNLtta+7o=;
        b=AVavRFgDfndLAsMQHpOG4uYTg6SyU04BdlHyOzuEEPGGN4LVHXENTsfYyfy6A6MEEy
         36eATVw5dXJXsYN4fXb3C6TiodItttH21m3soOV6eeBkglN05p/ijHy8COK9xD+Y9X9Q
         M4YB1lpG1fFwzx0AuustMwWzrHRtlYQVX8yj0Bot54eE1QtIf0s4yvNu0X0O+JWBHit6
         /aFsPwSVLM1LimCFkiV9dXIZRnbP7ucD4w+kvqxM/iLbQCDwa0f6ygC1/Bh5FDKbrET4
         3P6sgN4VOMKklotzjoT5luHPYhF8o44qSEe9r/AqR0JzY1prvdrqs/+JIaWKFMgiC2ub
         em+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739230371; x=1739835171;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Hs5o7sIfj/0izaV2OsPt7FJm28HaB4LTbbVNLtta+7o=;
        b=b+BY1uBZctwK2hS52+44ms2qMyU+afdBtom5WWUwG4uMqonPSrLOBn5isMHAw9Ob3l
         X5sxmcx796l7HmczYdBz8WND6WkyRDIA2SK3+qFMlNSzq5aVXSJkEHDlVbESakjiEET+
         0+kDmh5BVg/fckAvGmjLJu6Qf22+zD+3xOoQEo/ClVCUN83FS+ju6iPM7JAveU4/SS+t
         KU1BBJOkbZDzAU0nBMNuWB9+MKdG8qaUATe9mF+zg1FCFlDqBSFC3OrDY5WGyYIYkpEf
         f/IiPzjkHjsM2qICjgtzCpjkoUKprJPr9JZ28+JkGF74EmEVaarmR3W89uacd5AjN36k
         X2SA==
X-Forwarded-Encrypted: i=1; AJvYcCV6OyE4YvNvNdIP1J9MO733RHK7QtCCepdOpfMW+pHXM5hbv1+kYjT45OdcQHUsNFiARUtfEyDLUh080i4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyyDTcga2EptO5YD6ai+fsJt5tqrJspv7fUOP+PS+FO2v6BunPx
	eUYk4h4blSIZUJyoYU1ETK32w6DutG6Oy9PIXIU1BW7cRDjUlDA1
X-Gm-Gg: ASbGnctmgCcRZqiW9M3PjHbWETydH/Dd+QkK32Dxc/mdsW1N/Ej67n1NfurVl3edRUY
	+HysPWyglJG86TiNyhGK2hQh9hMvr+3671pwQG7zgUmi5VJVpIRVr0WULebvXf5RwB2fY1usNBj
	uWqEKSxXTug4Sh+5PyHnE0hpoFdoJaZvivcAmy+50Si3+gjKSKHwnr8MkNa0bBrETGqpI8dNPO0
	ncLiAVvGDaj85Yy1cj7jSR7SQzglO7FGoplKeFZQANUWZgMd7Ngdtm65Vm/UcamTJyX/fjWYUvt
	KHbB43zty8cimTMBCsUzoKVOL+PIlkg09t0S0UMI+fT020WrW9aEkyGWKCrfgCNuEV58iBc=
X-Google-Smtp-Source: AGHT+IGgFrE/m2Y9JZDQZ/mWcc25YvWcS1fKTDlDp8O/AKd0D1m5Ap8GO/3iwAKb4YEL7StINcBjVQ==
X-Received: by 2002:a05:620a:1708:b0:7a8:554:c368 with SMTP id af79cd13be357-7c068f8a167mr221812685a.6.1739230371528;
        Mon, 10 Feb 2025 15:32:51 -0800 (PST)
Received: from localhost.localdomain (ool-1826d901.dyn.optonline.net. [24.38.217.1])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6e43babb9e4sm52467166d6.99.2025.02.10.15.32.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 15:32:50 -0800 (PST)
From: Alex Lanzano <lanzano.alex@gmail.com>
To: airlied@gmail.com,
	simona@ffwll.ch,
	tzimmermann@suse.de,
	noralf@tronnes.org
Cc: lanzano.alex@gmail.com,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] MAINTAINERS: Update maintainer of repaper and mi0283qt
Date: Mon, 10 Feb 2025 18:32:31 -0500
Message-ID: <20250210233232.3995143-1-lanzano.alex@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add myself as the maintainer of the recently orphaned repaper and
mi0283qt drivers.

Signed-off-by: Alex Lanzano <lanzano.alex@gmail.com>
---
 MAINTAINERS | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 1c5b22f00434..b5e46f23d1ba 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7352,7 +7352,8 @@ T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
 F:	drivers/gpu/drm/mgag200/
 
 DRM DRIVER FOR MI0283QT
-S:	Orphan
+M:	Alex Lanzano <lanzano.alex@gmail.com>
+S:	Maintained
 T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
 F:	Documentation/devicetree/bindings/display/multi-inno,mi0283qt.txt
 F:	drivers/gpu/drm/tiny/mi0283qt.c
@@ -7455,7 +7456,8 @@ F:	Documentation/devicetree/bindings/display/bridge/ps8640.yaml
 F:	drivers/gpu/drm/bridge/parade-ps8640.c
 
 DRM DRIVER FOR PERVASIVE DISPLAYS REPAPER PANELS
-S:	Orphan
+M:	Alex Lanzano <lanzano.alex@gmail.com>
+S:	Maintained
 T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
 F:	Documentation/devicetree/bindings/display/repaper.txt
 F:	drivers/gpu/drm/tiny/repaper.c
-- 
2.48.1

