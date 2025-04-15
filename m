Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0698F28B4E5
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 09:42:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744710158; cv=none; b=jgN7a7lW3GkH0P9mhB19PodH7CGeSm43Qe19cywF2HbScU5S3ysZi3/8jv8Q6nDsRCG/D9AhExwqgINOHLgA49Jzv8TTsUaLpQE7Jp+tvxiGxkFJ0jWhVkC9ELUENwwp7qtFT/g4QLw5eyxhOLA32satc3ORh7mx5Jd9IKrRh9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744710158; c=relaxed/simple;
	bh=rvPK/Dg5T2im/RIHeiod+rLhyhXLcDICeW5UPJLeBGc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uqmFO05H28IG0Iss9daGrGZX6mql0Daxe5VULXL8uz5+g7t4glqJGKgFuSC0cM0Lp3A0uw0srORm/vlLuqxdpMKte4TJiNA9FtQP3QdZQ5vMVfWtq3l59cy0h+JVYqN/hXYCYyOuOHaEirdBrxQJjk4L+1fSg6pypbi++gQA6F8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=QPSqwTMl; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="QPSqwTMl"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2254e0b4b79so71694165ad.2
        for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 02:42:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1744710156; x=1745314956; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cBaoORDclgJIxRjLsgxp6IQxhEhL0T0NDAX9n9Trx5U=;
        b=QPSqwTMlDFRxts7YsVmvtlCYyL+FG21cZwk9QQjNa4t0acDmb9K7+z3LKF4O0waP5F
         +I+jQjdiPNtuD7dMOdxp6N/jgThFN+AGECXxYOtc0xqPnTYWAM6gezu1le95d9B6Mb6P
         +NAdHqFJaWO0irvmasbaQhn0tGuLNl0xV+9C8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744710156; x=1745314956;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cBaoORDclgJIxRjLsgxp6IQxhEhL0T0NDAX9n9Trx5U=;
        b=EJ6H8s/V7ja8OUgGi15q6uyoY5WWoR0aOgTuKZGi6m6kTZiSByb3wOhKavo1PKTZ2G
         ihJKiNV6DmvtuE96e1QyRNYLrvzDJiTOTvBehICyT1l4QV6syUlga8PqPO2Cpvfw5o74
         9c00I8zdOeXntRMaE6i7FD5QCL8Gyg+r13pABaRoEnyE9lm3f5hpqT4EbkfEyZLfaeid
         S6Y9rQekh5n4b5FwofATkWVu56ILqBw+AXp/tekTrsXtOzLhovj1nbw/9zhPfhRteHt3
         sif3z3tLS56ME7Cjw0AhXei3k1Ie0yP1pN+r5qEBJKfzakr63bB5fBU/91/mRSzTX5uR
         V10g==
X-Forwarded-Encrypted: i=1; AJvYcCUNAK9yVld/AQ60oeJ99/b3rNGXHp+t60QHk4vrgajW45xA9fClkRgvneAESVidytqxWLGpae67qQzyv6g=@vger.kernel.org
X-Gm-Message-State: AOJu0YzTj0T5BUjaN8DSssQSGKiuSi2T2BWBtWOEpSBh93WOP/UJ6sNA
	9QvDXRExzB/YYslSBlyzvw015XUXUuOuuu2GCyBjHqlYouOSxRV9Zvs9YgUwdA==
X-Gm-Gg: ASbGnctpkQZq8wZDP0QD/8vRM5K79z5DxiKIGrcNwMjRRNBWWZmaN4osKVzvjjMESR9
	v2dBZNNLHZBQAOQdi7iRDZ5/5F43TSWXY7dNewUwYnvEAYt9kNn6gBzWCJlzIRFhW9XvdhWfWTz
	Qpn/7biARY86HARmSMx5O+Wc4XU42qpqW8Kk/UuqB33/axZLQ4NMGEfMOzhs8UL91Jma09XPhyq
	l5kwxIaFIr0TYgB0PQjQslYjCABXLJXO7KBvWhntPu8mmB1iqtqd/qDJbJwhjIzCefEDWNT7vAS
	EakiDODhx4/RGVciUuWa59hALZj61bCJRWTndSfisRleq4dnAzb0QE2iILhKihuo
X-Google-Smtp-Source: AGHT+IHVvAZ1ygtLt+QZlSxzIJDMWWSa3m/mDTZEHZmrVvlbbotGb9BvVB2zRgsynJ3aC8i0qEwfeQ==
X-Received: by 2002:a17:902:dac3:b0:224:f12:3734 with SMTP id d9443c01a7336-22bea4bd79bmr179704025ad.30.1744710156249;
        Tue, 15 Apr 2025 02:42:36 -0700 (PDT)
Received: from treapking.tpe.corp.google.com ([2401:fa00:1:10:7d0d:86ea:ee84:cd08])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7ccca5asm113135215ad.254.2025.04.15.02.42.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 02:42:35 -0700 (PDT)
From: Pin-yen Lin <treapking@chromium.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Kaehlcke <mka@chromium.org>
Cc: Stephen Boyd <swboyd@chromium.org>,
	linux-kernel@vger.kernel.org,
	Pin-yen Lin <treapking@chromium.org>,
	devicetree@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH v2 0/4] Introduce usb-hub.yaml binding and add support for Parade PS5511
Date: Tue, 15 Apr 2025 17:41:57 +0800
Message-ID: <20250415094227.3629916-1-treapking@chromium.org>
X-Mailer: git-send-email 2.49.0.777.g153de2bbd5-goog
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


Changes in v2:
- Introduce usb-hub.yaml
- Modify parade,ps5511 and realtek,rts5411 to use usb-hub.yaml
- Minor fixes on parade,ps5511.yaml

Pin-yen Lin (4):
  dt-bindings: usb: Introduce usb-hub.yaml
  dt-bindings: usb: Add binding for PS5511 hub controller
  dt-bindings: usb: realtek,rts5411: Adapt usb-hub.yaml
  usb: misc: onboard_usb_dev: Add Parade PS5511 hub support

 .../bindings/usb/parade,ps5511.yaml           | 115 ++++++++++++++++++
 .../bindings/usb/realtek,rts5411.yaml         |  47 ++-----
 .../devicetree/bindings/usb/usb-hub.yaml      |  91 ++++++++++++++
 drivers/usb/misc/onboard_usb_dev.c            |   3 +
 drivers/usb/misc/onboard_usb_dev.h            |   9 ++
 5 files changed, 231 insertions(+), 34 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/usb/parade,ps5511.yaml
 create mode 100644 Documentation/devicetree/bindings/usb/usb-hub.yaml

-- 
2.49.0.777.g153de2bbd5-goog

