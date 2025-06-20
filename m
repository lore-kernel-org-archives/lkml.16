Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83FE120F091
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 10:31:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750415498; cv=none; b=godllalgx30t3cqlmJGD0now+5KrgnRmjAYlOcxSjBubmzuuEZpVyxHixFt2Kwrjv/zFWEoMgxMS8RueOAetxgEcA4EZz8vebt5CAnxOht+MKHggXHwNm4hRqZb6ep3tsJ03L0syTn8HdVza7WilZEI4M7Pd1NBX/8YlhmZBdM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750415498; c=relaxed/simple;
	bh=g/vzD+cOWNqqj2T/TniSFBbEUCUdsEigkFpQHb857BU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=bfCLkgepJwm1ANvUV1uQhVOYxq4HzPqgWex6pQ60N7jqCexnjfcxkfewsfXbkcqbGE2o+Awh+sj+23aaFrHF7WNW4FU98ajN+BV8cV/rq2f65vCe/lHvyg0RbvXSyXCYwW9YzRnhjRjZp+Xz+SCWS2CwGryJ6dxR6cGVL9TQbzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=N/8NpJs9; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="N/8NpJs9"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-adb2bb25105so279914666b.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 03:31:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1750415494; x=1751020294; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1muw2blYzxaHAsDZg3IXNPfcSbqmSvh2KRGWNScsj00=;
        b=N/8NpJs9dg3pyarbLXvUlulb9TyRFA4p5WKoT3XPptUWkRk+VIsT0rya51KAtFIiHd
         14+zus8p8k4Vnx1cwhHZQIjaH5yhIxK41rOR719hPjp5oVnsAgaHsSJWdGuv/hhXHMZl
         dUUDe0z2/9fHLpk8ATboBfOnM9O2cH7sbgW6bSd6ov/Sy52bt3Yv8c5qvcfve1UQYTHS
         PPkcALp99j4Av66Wh4ULIEW3M7ojVdPDvYDdXW0dlcedhrjxSW3Ey/4Mynkaz6lM7Fyn
         S+k1cd0bWeK53RtkJEcX+/7wR2XasPPNB4sVywcjZHv3mMiuUuBbbss0j+8BssX8CJ5X
         0T9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750415494; x=1751020294;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1muw2blYzxaHAsDZg3IXNPfcSbqmSvh2KRGWNScsj00=;
        b=nAt4UrFRf8cpQq+wmRscmt6H4Tm2e3dbeiW2ZO9Vs0xqHuKqs3k4BYKgJXBYcZqjiD
         XDXmRs0m7GVK9kQOv4/ekd1GsitRoJ1ijOoZ7Gt2EmZYCShQTtDveCM7i/PTqO7HkexK
         9ykm03t/+oR4yqC1IKVsyKJUX/TcuAUfnvngAtQh2m+QsE0P3jHi0MEKxVacX4uiHDWf
         MYTZAvsjHhQ8shqin0rcyArPMzK4ppw3X0Xn3DRrgy5JCQHpYyrJ1Uv1uoSLRrOMW7XT
         hgXLKHh7+Z4F8YCiWVCN9UISLONPELTbgU6K8Iq+45ItTeToT7QGZbzcWxE2BOMKZTpR
         pArw==
X-Forwarded-Encrypted: i=1; AJvYcCX1jpfgj3yS3dgQUAKHtNeCki4hyaJdITkBpdr4RyH0mEiuYMDK/aCmmon/Tw/sYJWTdG3Yl1Gd0dfMf9k=@vger.kernel.org
X-Gm-Message-State: AOJu0YxvX11gb5BdEQqMbAkXRlVY7r8bd26AR7vG81BroVLUfFiCFE1w
	Smn57XzFDiwyXk61zFT9Gj7S3ucX2yqIxID4q6Y67ZkrdTSm7mSiXb2u6f70ItW3tk53Kezmyol
	wfJRj
X-Gm-Gg: ASbGncvWjsZiTGMxp7jPD610b8qvOWECI5fhkqpR1E+5mCigzj80gXl+TkMcIRziizY
	m2YLb1Png9+09x1dz8cNU+zZyAZmQHvOxRJi4BmlbeeANu+Ckl5qf6tUH9R9oBNrlQB6eH6NH6D
	HuwbVqL2JABq+Ke7VTPYYWmWFP3rmw/TlnILfjQbmOuOyqDA2Z1Fn09t+Gq4xFUDUY6JGRmm6Qu
	yBEDoLq+r+s00vlSyTkQ7dWzA/FZckws57UCEO3BxRgHcnwl/kXyeNkHUHSrZlD56naKIj9RQK1
	b6loT7Me/TDEh4J22+ILbKuSZvFFJZrxI34M/+kQkdpvQ/a53aiyvDyOxzvtay/OtCdPOHOWGPZ
	IAujiyqR4/pFERCMFaFa51KnV70fp6JjP
X-Google-Smtp-Source: AGHT+IHoDGaWZ5BrbMFRiOuhEj2IF/mLQzBgFpihvoZBrr7fr3ArCX7v7z9d95MM7gVJZXVieJjUCw==
X-Received: by 2002:a17:907:97cd:b0:adf:f8f4:2001 with SMTP id a640c23a62f3a-ae057bf6566mr224474466b.49.1750415493718;
        Fri, 20 Jun 2025 03:31:33 -0700 (PDT)
Received: from otso.local (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae0541b6f5csm138047366b.122.2025.06.20.03.31.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 03:31:33 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Subject: [PATCH 0/3] Add interconnent support for simpledrm/simplefb
Date: Fri, 20 Jun 2025 12:31:24 +0200
Message-Id: <20250620-simple-drm-fb-icc-v1-0-d92142e8f74f@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHw4VWgC/x3MTQqAIBBA4avErBtIS8uuEi3KxhroRxQikO6et
 PwW7yWIFJgi9EWCQDdHvs4MURZgt+lcCXnJBllJVWnRYuTD74RLONDNyNZiZxotrFLGiBpy5wM
 5fv7nML7vB1pWCE9jAAAA
X-Change-ID: 20250617-simple-drm-fb-icc-89461c559913
To: Hans de Goede <hdegoede@redhat.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Javier Martinez Canillas <javierm@redhat.com>, Helge Deller <deller@gmx.de>
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750415493; l=929;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=g/vzD+cOWNqqj2T/TniSFBbEUCUdsEigkFpQHb857BU=;
 b=9cYc3EXbQ33AMBFKnPLXHwMs1U5skgQNdQEyFJ2oPbg7cPoKkn78i6p8FdCpi4ycoC0PtPnwr
 xSeaoEOjEGfB4uj+AatP1PQpE65PFg2JOldcgkg62kv7/usFdeh7zaK
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Some devices might require keeping an interconnect path alive so that
the framebuffer continues working. Add support for that by setting the
bandwidth requirements appropriately for all provided interconnect
paths.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Luca Weiss (3):
      dt-bindings: display: simple-framebuffer: Add interconnects property
      drm/sysfb: simpledrm: Add support for interconnect paths
      fbdev/simplefb: Add support for interconnect paths

 .../bindings/display/simple-framebuffer.yaml       |  3 +
 drivers/gpu/drm/sysfb/simpledrm.c                  | 83 ++++++++++++++++++++++
 drivers/video/fbdev/simplefb.c                     | 83 ++++++++++++++++++++++
 3 files changed, 169 insertions(+)
---
base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
change-id: 20250617-simple-drm-fb-icc-89461c559913

Best regards,
-- 
Luca Weiss <luca.weiss@fairphone.com>

