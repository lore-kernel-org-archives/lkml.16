Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BA9F2AE96;
	Mon, 28 Apr 2025 22:14:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745878488; cv=none; b=MO/e71n3eKmb17zVixFEJ/dbxMrd25fKtOLb14F2VNLAuhNuvijEDVM/fBX2H5PMssMEdXREIliewtzhZ37Orpgo5tJpiUAZCT40G4wJjAci18HO9/sZb72gSNahXPgpgdAoDb5vBUR6B7rXBBtlXjGi8pl06dKk2AE5YFtAfa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745878488; c=relaxed/simple;
	bh=AVy40o64QFt6x/ouh/PiCtN2yt0Kf/b+NL8kxoIotQI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ACve0MFzuo+TpTHfXtu4Yiac7qxxe/oGmgKoopcC3gSYukCxk5kMQLeIyCJuESEozQ/ssaM03DYwwUbcgI0HGi/IiMjj104UsZlEIlJJDXTftGS77AqwPYAN3Ffbl2+J4wguVQjUTAcm3bVPOjIZWq/3dVVrpfMIuUZ96Mo0S5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NkKVeh/t; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NkKVeh/t"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43cfba466b2so50732855e9.3;
        Mon, 28 Apr 2025 15:14:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745878485; x=1746483285; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AGx5n+9atRrB2QZYeDRA4sEdUwwps5ruTDWN1T8K+3s=;
        b=NkKVeh/twSOoYJSlie9e2y/dpbmfoXjY2csibhqQN7mPfPCSo9itXp1pFW1i/ClVKl
         tsrtpcACy3a70MypoqhENVolNUhL8OT8kC2yNL6OEV7c6D/LtWNaUyiVCgaT+r1K0QoK
         cpd10juGntr6RD0ZIR+Gol/YY9TCsOSaUrFiRzob5GDPcAyBJ+uUoLoEQAHFNRigL+X9
         H72tXO2lLScQLOapJESB8t254GQLafnbwP3dxC9jFAA8vDrYCqiF9EMy3jzg6wMZ3m6T
         xshQM5tKGgwsX56Dh4amMc6QzxB7YHTVkueUkvPPapwJ1tV8t14Bfg1MmkzE4vDIn9Gv
         Uedg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745878485; x=1746483285;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AGx5n+9atRrB2QZYeDRA4sEdUwwps5ruTDWN1T8K+3s=;
        b=KLdFoJG9sylM4NGOzg5qQ5TMXW6YXIUwKH9GdOHTpOAR5cbDs8o/06UawWmdeggTbR
         UVA+8D0q4RiPEO62Ev4ZOH4w6QrsT/8gQpZ5kmsHo/Qx67z1oIRQrZT1W5qD4dTgCoWv
         kcoi9eTynXNM50pcEZuM1PSXCPtdE9Zct7F/8aXxbVSifcw+xFvm9loHs32BMy2y8tx9
         ihyjUNg6myJT0i87I9eCEwJ4lq1Ou5y22FTKVIkvOBqGYBGWt04MoG2Bd4D6qLFXRyTl
         SuKs8WhBNJTbk7Ct8FxFhxhrevtvfQPjat37vjOycJ8XnopAGr2r7yJZaMYshXz1Y8Z+
         p8vQ==
X-Forwarded-Encrypted: i=1; AJvYcCW1kSLwNpBxyN7wVcSvWomAq/Y2/waiSHAWwpdaIDNn6ABpih7/z/5MWXCPS4iV/tPzuMhnWAoW7KXO@vger.kernel.org, AJvYcCXb7g6I6v49ylJ06ka23DRm0H92l+JXbVufE/ixpmQvycKKame5Z9tKD70Zrh8DYSy4/Q3TnNS43Ort@vger.kernel.org, AJvYcCXcBt+mt3u53Ux6RKS5F+sFcGT67fV9i2D074XesPlDBnnr6AkFVsUBNx+44QySDksvf/56Tmho0uJQJITe@vger.kernel.org
X-Gm-Message-State: AOJu0YzMQyGLSwcE5stXkM/3En1NLQ5FycEN9bmaqtQsr2nh5GpngBwm
	NhsigpAhbLlXRgK2TCtPLKrhm2FWia/u7tEtxt2FHrCQ+r9nHfh6JGv2Kxix
X-Gm-Gg: ASbGncvTRYNYZbWlwZ8S2RS4I7p77zp32SWBT0Sb7uFG5uF7UcVWinftgtmjNeie/uJ
	smeiasFGVrO21GgaXTl6pVb3FMExnJyKVMS4Om4elbtNndwXahb79orRMvGsnzvQQdaoOJn85NU
	Nqv0wsrN/HdG9Z4MjNaw/7hhAfqbHNuThxVWQcavmuB8nitnFDKs0QENCWSLo+CIARzCy2AZFLu
	wLeFaEzldUncB9YaI6DjxNCbhrDPKR7QPUBienbDN9eFbQ9vM298QbNiSqYaY2kcUZz1GXAmlqk
	pRFYw92n4ArrEIWbbR4HndZxP0ZaINOMsOknHjJ3gOuyoxOm6nr2P26eqlVj2pg5+npvVZLLpUq
	T
X-Google-Smtp-Source: AGHT+IEqYc+FEDLDoI7dgmiKWdJiq0uJntkjgS9miQ30Gtow0iIdMKbM+xnjFdR0ZXG/wLCWw3JEow==
X-Received: by 2002:a05:600c:a181:b0:43d:fa59:be38 with SMTP id 5b1f17b1804b1-440abe464eamr56784525e9.32.1745878485038;
        Mon, 28 Apr 2025 15:14:45 -0700 (PDT)
Received: from tempest2.110.lan (xt27dd.stansat.pl. [83.243.39.221])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-440a53870f9sm135901085e9.33.2025.04.28.15.14.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 15:14:44 -0700 (PDT)
From: Pawel Dembicki <paweldembicki@gmail.com>
To: linux-hwmon@vger.kernel.org
Cc: Pawel Dembicki <paweldembicki@gmail.com>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Greg KH <gregkh@linuxfoundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Shen Lichuan <shenlichuan@vivo.com>,
	Charles Hsu <ythsu0511@gmail.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH 0/5] hwmon: pmbus: Add support for MPM82504 and MPM3695-10
Date: Tue, 29 Apr 2025 00:13:30 +0200
Message-ID: <20250428221420.2077697-1-paweldembicki@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series extends the hwmon PMBus driver for the MPS MPQ8785 to support
two additional Monolithic Power Systems devices: the MPM82504 and
MPM3695-10.

The driver is restructured to support multiple devices using device tree
matching. It also introduces an optional "voltage-scale-loop"
property to configure the VOUT_SCALE_LOOP PMBus register, which adjusts
reported output voltages depending on the external feedback divider.

Device tree bindings are updated accordingly.

Changes have been tested on hardware with device-tree based matching
using both the MPM82504 and MPM3695-10.

Signed-off-by: Pawel Dembicki <paweldembicki@gmail.com>

Pawel Dembicki (5):
  hwmon: pmbus: mpq8785: Prepare driver for multiple device support
  hwmon: pmbus: mpq8785: Add support for MPM82504
  hwmon: pmbus: mpq8785: Add support for MPM3695
  hwmon: pmbus: mpq8785: Implement voltage scale loop configuration
  dt-bindings: hwmon: Add bindings for mpq8785 driver

 .../bindings/hwmon/pmbus/mps,mpq8785.yaml     | 54 ++++++++++++++++
 Documentation/hwmon/mpq8785.rst               | 29 +++++++--
 drivers/hwmon/pmbus/mpq8785.c                 | 61 ++++++++++++++++---
 3 files changed, 131 insertions(+), 13 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/hwmon/pmbus/mps,mpq8785.yaml

-- 
2.43.0

