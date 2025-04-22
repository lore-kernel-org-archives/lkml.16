Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB496296140
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 08:30:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745310612; cv=none; b=pI71FkMrEfw3ZXYdx+rbuMFdsLNjEioddYC/uVC3rBaUtOTHDvsQ1V4VkzyiZlpr4Dqep1mzNeELYb6cF+tcpKbxuiJovq8SlIDEv7ZWR29PZav3WGA+GnX6l7bf7AVQW82Zq/q22xFoJcsEhVEQfm2PnVEW43DcvSsqwMfyOFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745310612; c=relaxed/simple;
	bh=wpLvYJ8h+2gdD8KlovfRp/KEYqpjX5R39eBimYEADQ8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QEKTrVWTwlO6QlOPElUQjCqIA+az/1h7ReR0tWHM22RxTlict1uwOElnnUT8RJ2jqC6W7IkrkeQ4ERNrf+59CvNJMrpawUGW8qGUSyBFudsFWCkd95NfI0twh4oC7zsXaSOdeDkST3CpVAHEnF9d8jyCXAtrS1wB/gB5n0c1i/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=kGFAXBPf; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="kGFAXBPf"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-7399838db7fso4596904b3a.0
        for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 01:30:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1745310609; x=1745915409; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=suVeEV15xn1TJzAA78ITbkuezXgamtF49ziPRPaA7d4=;
        b=kGFAXBPfkCTyYBf4lAmBXiDYLKXdHMyuQGbr3NYT7kRjdMqCFpVt+3K+V4aq6r/lDb
         V9zyb9ptPR5RVeBg6Gy63t7rnVLay1vAU6lE1Gcj6v6vI/T3uc6oSMpdMnmn6i/YxYQU
         0Llf+EzBbXiG08xRrcbbkDpPhzSdnIlV0A0/w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745310609; x=1745915409;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=suVeEV15xn1TJzAA78ITbkuezXgamtF49ziPRPaA7d4=;
        b=tl8euT0tWFfEnq2VQwgpstxSiG9zGA4ycLQEvoo0F0hBQ1y4uYvv1dMTb40ItFW3kz
         +sI4qmFgCXx5VlfLnPtGRfUK/T9OqCsnVJpeJcwZJlOgJmKlJNqrcFAKjO171YWPT5CK
         BApKof36w8QcvsLS60ZCuedJkqMehfeO2/2XjZBwoaLUaqgcbPjYtNbRKX66UgUuADh5
         CTA3mEtmAWhnn3B3dMCUOtWtseEOzMS+1qlON8IOEZpxrmBW3aIQ/PVuLPD8PNXxSsI3
         VYbbPfPsxpB0Ucdy6R67Y91XhAx9g3f8nyMRH+l4EWUGMW69E7msXMXufa8SZ4BBeWoX
         RrvA==
X-Forwarded-Encrypted: i=1; AJvYcCWkYxR1oz+ujZKap+N8CALPiKpxuUk+LDcwj4+ESVbPgX+Ebfm1UnatQyiwfjGaZ2L/150cC1Vai6EUN7Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YxPueub6eeOjkCdoYfOnOIHHh81CYzh2ptoYQ61LdBe6xxXoVNg
	akiKEngZWR1qy8XXDHCbmOz00Qq4KM1Cyb5usulmzB96t26nBg8tUSTrJXCF3Q==
X-Gm-Gg: ASbGncv50IFXHDefwiw14d414iqCjZbv4iFESTQK15s3P4tRQ9Qs8UGNUTJkE6plRB8
	vOcfOBdsdAch4y+dOjJjglCuwHdGfVkx/jatb+ZSlzgIgS0cRNaX7k0Y0tvOvtnMOw4d11I8zji
	NEwls4mgCVTjqa0CcgUsTO7zcCNKOABUfa6TqOjSlAtSmpcS89XE4BvcKYmWCo/XWCR76CbZi7h
	QlaKKEm0A/BLMonzWrhK4rbPJ4Zpu6r/XCxGnkARg5ZR6djUZth+YOuwgGctTacryIeVP/lSkCo
	JqfOwAcAcmHA3WJS+tXFtw/2BxpXAwiOH6FLvdRB1gZKwaxSQGm4TeoteCFVk3VZ
X-Google-Smtp-Source: AGHT+IEU6I61PKdSk66ALyW1SMKYEj8C6WoYl+I3tAab8Ss6BHWGapI8IPOL/MGB4xnrLL3uRQKw6g==
X-Received: by 2002:aa7:88d2:0:b0:73c:3f2e:5df5 with SMTP id d2e1a72fcca58-73dc1b5a716mr18751882b3a.9.1745310608966;
        Tue, 22 Apr 2025 01:30:08 -0700 (PDT)
Received: from treapking.tpe.corp.google.com ([2401:fa00:1:10:90d6:56e4:9d90:9df3])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73dbf8e0be0sm7993576b3a.49.2025.04.22.01.30.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 01:30:08 -0700 (PDT)
From: Pin-yen Lin <treapking@chromium.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Kaehlcke <mka@chromium.org>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Pin-yen Lin <treapking@chromium.org>,
	Stephen Boyd <swboyd@chromium.org>,
	linux-usb@vger.kernel.org
Subject: [PATCH v3 0/4] Introduce usb-hub.yaml binding and add support for Parade PS5511
Date: Tue, 22 Apr 2025 16:28:26 +0800
Message-ID: <20250422082957.2058229-1-treapking@chromium.org>
X-Mailer: git-send-email 2.49.0.805.g082f7c87e0-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit


This series introduces usb-hub.yaml for on-board USB hubs, and use it for
the newly-added Parade PS5511 binding and the existing Realtek RTS5411
hub controller.

Also add support for Parade PS5511 in onboard_usb_dev.c

Patch 1 introduces usb-hub.yaml as the bindings for on-board USB hubs
Patch 2 adds the binding for Parade PS5511
Patch 3 modifies realtek,rts5411.yaml to adapt usb-hub.yaml
Patch 4 adds the support for Parade PS5511 in onboard_usb_dev.c

Link to v1: https://lore.kernel.org/all/20250328082950.1473406-1-treapking@chromium.org/
Link to v2: https://lore.kernel.org/all/20250415094227.3629916-1-treapking@chromium.org/


Changes in v3:
- Remove redundant schemas
- Update schemas for downstream ports and devices for ps5511 and rts5411

Changes in v2:
- Introduce usb-hub.yaml
- Modify parade,ps5511 and realtek,rts5411 to use usb-hub.yaml
- Minor fixes on parade,ps5511.yaml

Pin-yen Lin (4):
  dt-bindings: usb: Introduce usb-hub.yaml
  dt-bindings: usb: Add binding for PS5511 hub controller
  dt-bindings: usb: realtek,rts5411: Adapt usb-hub.yaml
  usb: misc: onboard_usb_dev: Add Parade PS5511 hub support

 .../bindings/usb/parade,ps5511.yaml           | 108 ++++++++++++++++++
 .../bindings/usb/realtek,rts5411.yaml         |  52 +++------
 .../devicetree/bindings/usb/usb-hub.yaml      |  84 ++++++++++++++
 drivers/usb/misc/onboard_usb_dev.c            |   3 +
 drivers/usb/misc/onboard_usb_dev.h            |   9 ++
 5 files changed, 217 insertions(+), 39 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/usb/parade,ps5511.yaml
 create mode 100644 Documentation/devicetree/bindings/usb/usb-hub.yaml

-- 
2.49.0.805.g082f7c87e0-goog

