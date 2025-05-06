Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C98D24EA8F;
	Tue,  6 May 2025 09:27:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746523651; cv=none; b=lLHVbzZFdKqSEOpDgrPN760ffgupGAvK8Q9Pa11ljrR3dAQeGRajLNtSGFxB8Fw6Wl0Po34aYP/cVFE/bb3skzbuxH48gTsv/t1k/A7L9J/3VnRUBzZ8ZD4Z59KDCWD/a59fJt2CNoI4VI9aAJNyS8bFzKl6ilciogMEgdlpP48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746523651; c=relaxed/simple;
	bh=9HwLwVH4rtBu1AcEFKq5QUoTX5AGExymfeqtIDbAVr4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=O3WwybBYmkBNGCAdGqeiKnDygh5etpXmFl2l/brkHs+XJ9oMrDIKrMYludnZDgudIy94198vpR40y5Fe2j2OA9INatOY6VdSSsUnOPLhaJQB+FUX5Rq8NFULatlLbWZLLAcRLZbMbKh4KhXTJ1LCb9MgTHy3oKHsS6EGSsAfjJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SD5F6bN4; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SD5F6bN4"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5f4d0da2d2cso10651700a12.3;
        Tue, 06 May 2025 02:27:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746523648; x=1747128448; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=184wuFTAJlMSFIwKpNsxB4H0JZOaRNDGBSu0dTC1wqA=;
        b=SD5F6bN49vGijgfSbdow9/CLueEXDYktZvZNbtXVStViHuBjblNydDl23OfJkgy5SB
         +wCKCFmVQkHhQ+AzmVhGeRrL98s+39hnaQ1ASEsuQAInxJm3dRKwzdhFJfEvx6EZ1Pmm
         xgBm8CBhTqnTeLBPKoQb2lZXKi5pmNYWUDwq7HQ3B1e/AsvhdwASLlywYE6im4WjeeWL
         LykX9wXtx5r9rE/qlZUSy6NLc+Qno9Kc59bQGaE+yAXEmoDD2dddtoBbG/QKGGIWK06d
         0bIwFkKYxz8cEQW/ugBugv90C7uudwpj07TXd2WzYlulAXVUaJs46AoZq2LbVxish44O
         yZzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746523648; x=1747128448;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=184wuFTAJlMSFIwKpNsxB4H0JZOaRNDGBSu0dTC1wqA=;
        b=HyQKIOoAD62tRvlQO0JXUM/DY4DCHOod6V2vJMJITiM6cm3tG9T9+EtAJ+RzQ9V2EH
         QF9dLaTH1HnEOiw7vxJ7MWCwybq0zK3N6u/chHK5B8fau5gsupKqIWH8J4YPXuOK0uBD
         cqQTQbsuKqSV6O0pyw8ZqAYnahy2xg8V8EJG5YehViqcn2NsqY7q6l/TWOwoasL5BM6H
         LxB5r3uB/JwfOElgX6cMEJjVLtH2zhwoOO17vBGXhn3OrtJcHtbXcOzgLXzha+rQi7OR
         eoQCMxZRq8NrLZJgn5FzZBB+ypY706TgeESUYspAeWKWe3+LQHFp2/eIdolSnOv/ipRo
         9CEw==
X-Forwarded-Encrypted: i=1; AJvYcCWHZ6Lpe/twiGu1BqGJeLurbbaAgV6GjG+EbRdJyBVVBecctXHmqDSUwfaFbZNQU/co6KgXSEIuc2j6LC0r@vger.kernel.org, AJvYcCWP7jgM1Fgedu7kViA1MfNDXALoQT6zNQDrR9WEIDZrXwADLml9y3878hiBcxNCz4vqxI8IrvDN+F7A@vger.kernel.org
X-Gm-Message-State: AOJu0YwzTvpe2LthkZNJhS9nygc6U/Esd3DJDriI+iwF0MkwaeP8o5NR
	eg/8piAIDEGwW9cANrGLtw/QNXyDJyk1qHcXQ+X0tO98XyEibCBv
X-Gm-Gg: ASbGnctjtIgEb9vfHdATc4UMFAfRRMoyy6FZC7FFUy2it12Ga4CcL947oVaItmrhKxh
	ZKquOzTiAd7v8R8eDastknGScnGTyqHXivbTycJzM3JAIlYyWrRE222iVgZDQK17amh8m9VELRj
	iloGFnhG2AVWVzRwads3LMxeKQ27Sxswva3ReJIUiATSktiEscHehu3bkeoYCKlKYkHtr3CP8F5
	yoDDNLCevejci8NSUmloeTaW2WaYL8Lw1EBUwQO6Zg6qkRFYqqMAW75FvOkseJF6bYTtZ16e1xz
	NTxViQ3H7VDYSiPIgnCxGgrLVyAb/oTw
X-Google-Smtp-Source: AGHT+IEfjJcQzL0jr4eUj8ffG6VatLpr1FG10qmF3SwSlavdo3y44IW2Rq1TdRSj1YvO7W1aQKJEvg==
X-Received: by 2002:a05:6402:348d:b0:5f8:d4bf:e663 with SMTP id 4fb4d7f45d1cf-5fb6fb8e175mr1840105a12.2.1746523647640;
        Tue, 06 May 2025 02:27:27 -0700 (PDT)
Received: from xeon.. ([188.163.112.70])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5fa77756206sm7349523a12.3.2025.05.06.02.27.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 02:27:27 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <quic_jesszhan@quicinc.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/4] drm: panel: add support for panels used in LG P880/P895
Date: Tue,  6 May 2025 12:27:14 +0300
Message-ID: <20250506092718.106088-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for panels used in LG P880/P895 which are based on Renesas IC
(not related to Renesas RISC-V architecture just the same manufacturer).

---
Changes in v3:
- switch to devm_drm_panel_alloc
- rebased on top of drm-misc-next

Changes in v2:
- added IC vendor compatible ass fallback
- renamed renesas,inversion > renesas,column-inversion
---

Maxim Schwalm (1):
  drm: panel: Add support for Renesas R69328 based MIPI DSI panel

Svyatoslav Ryhel (3):
  dt-bindings: display: panel: Document Renesas R61307 based DSI panel
  drm: panel: Add support for Renesas R61307 based MIPI DSI panel
  dt-bindings: display: panel: Document Renesas R69328 based DSI panel

 .../display/panel/renesas,r61307.yaml         |  94 +++++
 .../display/panel/renesas,r69328.yaml         |  73 ++++
 drivers/gpu/drm/panel/Kconfig                 |  26 ++
 drivers/gpu/drm/panel/Makefile                |   2 +
 drivers/gpu/drm/panel/panel-renesas-r61307.c  | 325 ++++++++++++++++++
 drivers/gpu/drm/panel/panel-renesas-r69328.c  | 281 +++++++++++++++
 6 files changed, 801 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/renesas,r61307.yaml
 create mode 100644 Documentation/devicetree/bindings/display/panel/renesas,r69328.yaml
 create mode 100644 drivers/gpu/drm/panel/panel-renesas-r61307.c
 create mode 100644 drivers/gpu/drm/panel/panel-renesas-r69328.c

-- 
2.48.1

