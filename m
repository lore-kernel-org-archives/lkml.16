Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3858E17A2FA;
	Fri, 13 Jun 2025 13:42:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749822173; cv=none; b=dUZb5S7Beo1IGtzgp3MxGE4Acds2Dr7kgv4koCyD2VsMgQhhh9NePprvgHPaW1aKCuAkUmmwZpYc12RB0VPLZosl0CZtuVLiYSzoUDhxi6viYqHVbhWljXYes9kDDe76A8I1DRPIzUqwpu9xvQ1GyHU3vqYfweixTxSEML9DhuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749822173; c=relaxed/simple;
	bh=pl3nzGeSLIqvACpDxps+0kd1+iE3UgJQBxU8R2jhnwQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Ecu9P3m1Y7b07RECksxL2uVY7XEu6v3vUhxx+Q+mhbzhQvkiKDTRVY6qGdj42DJISK6tb9XhIqITpPb2BcUopc79nIbUn0E6PliKWIyOmC058DsBnIorwGbH/lLhOpvI23IZ6qMt44Lw7fPoVU1otdcWVXVbeI+nFfjZmBobUT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AwpqhSCY; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AwpqhSCY"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-7426c44e014so1712247b3a.3;
        Fri, 13 Jun 2025 06:42:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749822171; x=1750426971; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FINzw5WzlZrpC3CqZ8+Ep5xQ8e34hPkhn15RUwJMAMw=;
        b=AwpqhSCYO/lpH3o24MAEFo+84ToQwW2z/EhupOiGmMqvkKkNXzcqLhfDls4JDNns4D
         yQ98M4UVa08hIvwbvjpZR+bOe196nF0pcZvg4S0dWui+TCxzSCGU+JQSHsV0lIwBBEAr
         RfnjIlSmO28mNoq/f9vKpNXHQ2F+BFgb8bWxkDrqCG+R7bPhOayGOb51rO9ETKg7NfwR
         AoPp0EEJEo64hxMoiNqiUFiAoEUKYyzf+Us/h2ZK5TW1BvsN4sVSw2eFfnXSNwK0J6TV
         oicBhPEJbjz+/Ps/gGVgLRS8pPAkCOOpipmubRup+qWv0TsTzIatt5ttfo3rIhn9nS/b
         1yBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749822171; x=1750426971;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FINzw5WzlZrpC3CqZ8+Ep5xQ8e34hPkhn15RUwJMAMw=;
        b=VbDswfF2oryox4x1/0JZ0F3naloj1yUqrOwPiaNRJ/1U2Qp0QW5EQl1PHodJUsi8hJ
         fVq7pmnRDsfnf0qEBRJH4ZMnQFoM1rrSZ6RI3JUAVfIJhzA4mBy/5CgCdy+oujrnbpFH
         H97lk8nl93n9srxO3d1+6/7Kc5s4CtTQzioP5CYTMVhvSPx1/I1+DK3LXUKpRC9IGqjT
         P83zjS0B7MSmqO8IqjvtbzldMmgSwglXPM7/kl4Ggu8JKBy7MsvXSQKvXYIKA/g6Q9mQ
         0Yb2CSdUfyoV8tEdqJDxHjRDvdcAamQRL2gjoOEW3IE+vbv3i3/QwK0Em9B4kRYAzpje
         tbwA==
X-Forwarded-Encrypted: i=1; AJvYcCVrcUAj+3n4pzDrBG8zNHsmoPihR3ZFU960AlhhaDYG9loFsRleLOPSVO2YT+hcjyADiLlOo2aPCQku@vger.kernel.org, AJvYcCWqiVKW93FHt02Z0t9GbSEMh1av915s9bJT8nZ25rfIUe8JqtMqqpAN5LrcPJlW+pN5WOzePRXRpav3tYyC@vger.kernel.org
X-Gm-Message-State: AOJu0YzK/+aPsmWV8xvXT1+drghkkL2hDFc0b/qucrU2a7Y1xSXKQ5mU
	rc25Gn5VOXKRXMITo013cG9ypva52EbUpGLNQL4ci3ooL5bOT5lndppeoADJjnc+
X-Gm-Gg: ASbGncsFqC+Xrq+Ec+NvWsqD7xZ3JjvEAPLkD54Ww6B5EW8cD3qu1DdGgon0zR17Jtu
	HNwrFzkhDC1ACDdjLqE6jRJ8GcIuM6y5mUlQgdUQv0Tev7cIlq9KiAcbMCuvkU7BP0t51m0goyD
	tXjkrOQKQKM/CKDbRFkGmCMfAw/B4VFd33GYi8eVirkvSX8nFS4ud0sUB5p8Vy5Oy2WE1oancDr
	Q+TNV/s2AWlM97ALWnfjmp5ex0CT/2YUKtCXTKLZ8eAu1lY3ab+vIQbuCuefVZCy4hrH+gyzXG8
	Eisbpm5CIYIxSTGnrijCrGrg5Q5UTEGrqpVy1J7S5mGnFo2ufN7VXWO5x1N3z7O1cbXq+IZI4eT
	IJArGZQU3jOC0rzeGXjkm
X-Google-Smtp-Source: AGHT+IF9bt3VFhIKqvSaL2CwqczFiD8n13IRP9sqfnTyktJX28OPLmlq5g21qyWBReJHEzG2h1uTEw==
X-Received: by 2002:a05:6a00:1142:b0:742:a334:466a with SMTP id d2e1a72fcca58-7488f70261cmr4691237b3a.12.1749822171488;
        Fri, 13 Jun 2025 06:42:51 -0700 (PDT)
Received: from joaog-nb.corp.toradex.com ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-748900b2d8asm1605826b3a.132.2025.06.13.06.42.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jun 2025 06:42:51 -0700 (PDT)
From: =?utf-8?q?Jo=C3=A3o_Paulo_Gon=C3=A7alves?= <jpaulo.silvagoncalves@gmail.com>
Subject: [PATCH v4 0/3] hwmon: (amc6821) Add cooling device support
Date: Fri, 13 Jun 2025 10:42:37 -0300
Message-Id: <20250613-b4-amc6821-cooling-device-support-v4-0-a8fc063c55de@toradex.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAM0qTGgC/43OQQ6DIBAF0KsY1p0GARG66j2aLhCoklQxYImN8
 e5FkybtzuX/ybw/C4o2OBvRpVhQsMlF54cc2KlAulNDa8GZnBHBpMIcE2gYqF5zQUrQ3j/d0IL
 Jd9pCfI2jDxNoTBushJS0qlF2xmAfbt43bvecOxcnH977ZCJb+9XpAT0RwFAzyagWQipirhlTx
 s5n7Xu0+Yn+mOWRjxPNJuWYi1LVvCL631zX9QOVlaIIKAEAAA==
X-Change-ID: 20250602-b4-amc6821-cooling-device-support-c03b0a899357
To: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Farouk Bouabid <farouk.bouabid@cherry.de>, 
 Quentin Schulz <quentin.schulz@cherry.de>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?Jo=C3=A3o_Paulo_Gon=C3=A7alves?= <joao.goncalves@toradex.com>
X-Mailer: b4 0.14.2

Add support for using the AMC6821 as a cooling device. The AMC6821
registers with the thermal framework only if the `cooling-levels`
property is present in the fan device tree child node. If this property
is present, the driver assumes the fan will operate in open-loop, and
the kernel will control it directly. In this case, the driver will
change the AMC6821 mode to manual (software DCY) and set the initial PWM
duty cycle to the maximum fan cooling state level as defined in the DT.
It is worth mentioning that the cooling device is registered on the
child fan node, not on the fan controller node. Existing behavior is
unchanged, so the AMC6821 can still be used without the thermal
framework (hwmon only).

Signed-off-by: João Paulo Gonçalves <joao.goncalves@toradex.com>
---
v4:
- Fix uninitialized variable `err` on probe()
v3: https://lore.kernel.org/r/20250612-b4-amc6821-cooling-device-support-v3-0-360681a7652c@toradex.com/
- Fix using fan node after of_node_put() with scope based free
- Add setting the pwm duty cycle to max fan cooling state level on
  initialization
v2: https://lore.kernel.org/lkml/20250603-b4-amc6821-cooling-device-support-v2-0-74943c889a2d@toradex.com/
- Remove devm_action on release and call of_node_put() manually
- Change of_pwm_polarity to store resulting pwm polarity on driver
  private data
v1: https://lore.kernel.org/lkml/20250530-b4-v1-amc6821-cooling-device-support-b4-v1-0-7bb98496c969@toradex.com/

---
João Paulo Gonçalves (3):
      dt-bindings: hwmon: amc6821: Add cooling levels
      hwmon: (amc6821) Move reading fan data from OF to a function
      hwmon: (amc6821) Add cooling device support

 .../devicetree/bindings/hwmon/ti,amc6821.yaml      |   6 +
 drivers/hwmon/amc6821.c                            | 130 +++++++++++++++++++--
 2 files changed, 127 insertions(+), 9 deletions(-)
---
base-commit: 78ca360f14d17f2c4dd4f3a1c9381b1c3451f4c8
change-id: 20250602-b4-amc6821-cooling-device-support-c03b0a899357

Best regards,
-- 
João Paulo Gonçalves <joao.goncalves@toradex.com>

