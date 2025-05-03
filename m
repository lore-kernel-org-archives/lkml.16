Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36A2C14D2B7;
	Sat,  3 May 2025 09:42:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746265329; cv=none; b=sPgqgZCYlaCSAmZy47Bq3FQHQ/3db0g+uguQTloji3DuSfrRd12SuR9r5jgGDg+07loJ3h3/Ft0JP5gz0oObmYVpvOfMOl30iUcjydJXFn43fw3fw6S5qygHMa/pW+V++49QFX4q/sjrifWrLrj402BnlUst0YDPAakxE4CKDFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746265329; c=relaxed/simple;
	bh=ln1yXZyQrtFbDh3LKhIEcf/4pTTaVG0Uu/Jka7tOWaI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FzXd+0d95DdIRm1BoZeg7P580qIv53TgfNvOGZqS7KHKQTd2MeKbQweCaaA/f/M/skleSon9ySay+OcnjAjgJ2QL69XQS/9wWcToAWPe499s+lC2ACiUk0X+a8yBKqD6jTsc+Jbp/uj3qYMPL3zn2UAh84tcm48lPJp+8RIhxjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IAxzs3GO; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IAxzs3GO"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-ac3b12e8518so490320366b.0;
        Sat, 03 May 2025 02:42:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746265326; x=1746870126; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HRzJEkB5JYl0DdIU3L/hXETUklhxJ9F3t6evSuadxqg=;
        b=IAxzs3GO/nSFYJnCZukkT3qQE4eQhTgU96djOAi0mUtodXQq1qba5aVRdu117zo5YS
         FHKnnYWvYv1o2dFNplEw6MEnF+0GtNfw04bVGUoevfgJQjrzpnDUe9SKT69pAFzAXBdS
         g9cLHsSe9+KuBXUelTUoLFTBDFOeCjf1Kt2Di2C33YAsR64l5si0oxnLZdetoUvQXdFB
         siDspey+7lgKu7Pbgy2tBqb4zC38NJU6Y+quY7v1RM9cL4oPX0Bo9iBolvpzsVA04vOK
         BoFefAFu9C9sSGOxzM6wZ2JbSEpKf93ALasoMZIAG8VSNZ2N4ig+N5oACn05/AYcaPIw
         kcGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746265326; x=1746870126;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HRzJEkB5JYl0DdIU3L/hXETUklhxJ9F3t6evSuadxqg=;
        b=SDI+aPmdwGgDVZGoKlpdNC663JvPALVxdiDyqNB1Nea4OVhsh3QzT2MXZVCVogAZlK
         sJaaTV/0BRZImNBD0qN/xYgIE7EosGgaMilUiorjr423gM64kWa95Gr8EvxgNaB6aQyS
         onzYlZjLu5uuAtBAYdKKfMtbZ6YBqPJkY7gH4GSYb2FI5SwiQGRKl5Ct6uScgxcupnZe
         IuZXh9NaDx+nhaHHAr4+I2Xbt505aNJ75L4EQ72+Vw1IC/TXtBchFxcSwj0ZVTK/RicW
         6FrgL+3ybDKG6QSvIAlTwCGpVlyRdPDONu1Ge5c3Lr/7GwgBh2c7eMoKE16GDZr8P83l
         PF8w==
X-Forwarded-Encrypted: i=1; AJvYcCU3XdN+0Rfz7PssUxwT+2ND9GVgFcFCx74XHDwKUzSl2XIwqPnzO9zIU8iJFcWEt0bF+SqPW5Pfgtxk@vger.kernel.org, AJvYcCUrCtrUEC61edAo+woF3za+9na3POBw0HlBLjIMJ86ahGhVLWANGC9DX/3qTCy4RH8nhbEBTlWN3C4PZURo@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8qQgb5KZb9WgKeTl7ztnldAZ2zZV9U5RV5DnL+T8GcmaKWswv
	xEHyMwS/bL2dZofuz4P40eF4y95Ezd0XnQ75pM07hhLvVU6nXhz3
X-Gm-Gg: ASbGnctd1hsOSkuIR79XSQQ3aa/6k0aZEXwsWljp41nHKKIe2F2juUYWav/TOKig1mr
	qzf0vp1hFoWC5TSqiWPoj3gPaAllw5mz8YrbFM37FtEgcMjWjS6ObCoUXUo+nTkTBye0FD+0yM9
	2jG4FkcvaTiX2C1FJVLUNyJ3nPSzEMD1mriKj4Cp+G8x3mwxBgP3+bcHmmlVDgxha73H61RvxAP
	qIqppc1FYadrAj2EkRUogV2SSGrKcHXoJyFccnH0E8GYljWCt3sRHvRpffvgP0pA8rlJj5QiGmd
	sQWzBf97bw811z5P6I16Nq9FXss5NqIj
X-Google-Smtp-Source: AGHT+IGGeJl2tlU9uooYzf/Ee9b+oIKzptXSJEsbTWbOy2XBTYA/rYncL//Ldq00kOmZ7BTfx9Hb2Q==
X-Received: by 2002:a17:906:6a19:b0:abf:19ac:771 with SMTP id a640c23a62f3a-ad1a48bc392mr41488666b.2.1746265326088;
        Sat, 03 May 2025 02:42:06 -0700 (PDT)
Received: from xeon.. ([188.163.112.70])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad18950e3ecsm169103966b.160.2025.05.03.02.42.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 May 2025 02:42:05 -0700 (PDT)
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
Subject: [PATCH v2 0/4] drm: panel: add support for panels used in LG P880/P895
Date: Sat,  3 May 2025 12:41:45 +0300
Message-ID: <20250503094149.29201-1-clamor95@gmail.com>
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

 .../display/panel/renesas,r61307.yaml         |  95 +++++
 .../display/panel/renesas,r69328.yaml         |  74 ++++
 drivers/gpu/drm/panel/Kconfig                 |  26 ++
 drivers/gpu/drm/panel/Makefile                |   2 +
 drivers/gpu/drm/panel/panel-renesas-r61307.c  | 327 ++++++++++++++++++
 drivers/gpu/drm/panel/panel-renesas-r69328.c  | 283 +++++++++++++++
 6 files changed, 807 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/renesas,r61307.yaml
 create mode 100644 Documentation/devicetree/bindings/display/panel/renesas,r69328.yaml
 create mode 100644 drivers/gpu/drm/panel/panel-renesas-r61307.c
 create mode 100644 drivers/gpu/drm/panel/panel-renesas-r69328.c

-- 
2.48.1

