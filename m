Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3B393597C;
	Tue,  3 Jun 2025 11:46:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748951179; cv=none; b=bOwFQGgL3XTfZQMKUwH8jOa3XBi6XEIXetSGKuKKQhzn5C6XbBV+FdS5pyxKDw+xrrp9Oah4QcJVmPxUgMSbk9IVDyYLCtWzFK8NMLFq7brebXINAQJuDmp+RqSIMszC8XLK8mLhAQTqWDWPh1EDdFqJwODc/PcM7OaMwY9k7CI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748951179; c=relaxed/simple;
	bh=ifKsQ2uocZtDqykYVoV2XkbRJ741T0KpmsTEF6FlxAo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=IrQZW+h6SIwPSXx4x5016a4bZROu/ZRnSirU7TkpOuOtDXptj0NPXs8zFZDalzXuhSPpFRnALUtO26Wm/lu2wK/65cj73DCDqIL2uPRkK03Kfvu5X5251sU6DNzR6AH4KUkdrr6enAs50dc9/cDEeahUx+LPgAj+Qwf/8hSwfiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QrGQEQ6a; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QrGQEQ6a"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-72d3b48d2ffso4100457b3a.2;
        Tue, 03 Jun 2025 04:46:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748951175; x=1749555975; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=n2/X3xPBsMNy2pCcmhvB5NbHHd/N5CiCRmq2yAjEjIc=;
        b=QrGQEQ6aHT2SXeAUiomLRK7NK7GGy9dby0dJi9IxpWBDKMv4nUSnLZqAGtJooYRwGo
         3KApJaHllltGyfe6bIs7Z3Ffr57RbXyZZI48pmmCBYNznj9N3C57vhy3eBCmb4TgbWjN
         uBYz94nxt2kScHTYVe2UlKzb1vqBHzZcuB2SGfrW7HSWuORKm93fo9HkLLRv8aqmc2Dn
         tPoLd/6ErRpRKo1NPBF2KTAmKs/KnX3/Gm35ddM4E9QLTIs9rPitUtzCFGNnm7H/Qhil
         ijrkVBi5sONeRo6kZ2pmFBzTiy1nf3C4drJ2jpG7U1U6tVf4WDTEiEonsiUriP0J6bsb
         RYUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748951175; x=1749555975;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n2/X3xPBsMNy2pCcmhvB5NbHHd/N5CiCRmq2yAjEjIc=;
        b=bXQK+2wmciaoq7jSdTI5gwQrvlrbe8F+d3XNkmKRPRSKwobXl6GBvy6MQIWuzZJJ/R
         3O/WSREb4CrrxYJYyn3xVSEJ5emXSL/Ki5NijMR161SNr19Gd9YUZvKAWe0SMrKXUTDM
         jBbKc5yzV7TlIoiocdKr8v2tDXy99iSH9Muo6dOeIRrg48nKS6Z8VjYRm8Iec5CDm9Ni
         Rgyuzta2V03mHjv506moJnmVuA7352g0UgROSNCqYj4F3ynydgab6ZRMvIw5sqoQ85+U
         Z0vRFi/a1UXwD72gwemnUBE4GKh7Qg+dpHy5pFX/j0pNwbFV9Lo4JFmJWKe9PINW19ZI
         olwQ==
X-Forwarded-Encrypted: i=1; AJvYcCU3NUGoocORo0g3K4Ax/eYk1sdzgsWTL7eDp6U5WGi/pPy897VCtnUdQaa69CKTtDeVohw/74bKGQQOMp23@vger.kernel.org, AJvYcCW+GTioxJ2AZY/4/Q0Y2zLOE0MrP/4z8I7b/9PZOXH05vFdfPw/rEW3stFnnjXFT5Fj4941qzyzPymT@vger.kernel.org
X-Gm-Message-State: AOJu0YzSdfzutPAiFYzKughQSfrue88tY/Y5GD892OXcDxWh2BA7kEao
	z8/v5FKS9DcNKSgh3I4a4iBZ4ajaS3qq4N/F8kXyUaC3kbWhkRilpNzl
X-Gm-Gg: ASbGnctDDqQsTBhroRp29z1VGLvKkYxMgD4UoL0YyFxMwm+r41PehAV9f0Io5BjhwTy
	h8hnLtBES4pBCn68Q/d4fbbqa3DipLWIva3+hZQ5bKXPArO2luT0mCyNw+xPDSLkHfq8gdw1WYp
	mUlsgQTflWncLYwecEPuZEgkRPqJorQSM7O845rS7n/h4ict/cEIEc2wOBMxpLtoelDwEpzS5eK
	RATY7rrNvazyZUxTz8sXZPiFuzMiLyieVOo3fkU0S6BVGxudQaCvru/ukX0xHDzXCBLYjnC/Kio
	6255wxnvN/9hFB0/GQTgptQcFx97GM2A/y07sXGv2vEJJgpqrdAKERVotggXswfpIgHqt35WEb5
	QkQb3HGFzLhLniYBsf/zn
X-Google-Smtp-Source: AGHT+IFuqgYDw4qpLD7iMBYCaosHLzaBzYy1x871vGKtSqREWNk6OZjBkmNzVB1dmfydYu89nGvlWA==
X-Received: by 2002:a05:6a00:7491:b0:740:6615:33c7 with SMTP id d2e1a72fcca58-747c1c83852mr16387325b3a.23.1748951174960;
        Tue, 03 Jun 2025 04:46:14 -0700 (PDT)
Received: from joaog-nb.corp.toradex.com ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-747afeadbb8sm9446459b3a.66.2025.06.03.04.46.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jun 2025 04:46:14 -0700 (PDT)
From: =?utf-8?q?Jo=C3=A3o_Paulo_Gon=C3=A7alves?= <jpaulo.silvagoncalves@gmail.com>
Subject: [PATCH v2 0/3] hwmon: (amc6821) Add Cooling device support
Date: Tue, 03 Jun 2025 08:44:53 -0300
Message-Id: <20250603-b4-amc6821-cooling-device-support-v2-0-74943c889a2d@toradex.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIADbgPmgC/x2NQQ6CMBAAv0L27CbrIgh+hXgoy4qbaNu0YEwIf
 6fhOIeZ2SBrMs3wqDZI+rNswRfgSwXydn5WtKkwMHFDLTGON3RfaTu+ooTwMT/jVDxRzGuMIS0
 oVI/kur6vmzuUTkz6sv/5GJ77fgBaqO6acwAAAA==
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
property is present in the fan device tree child node. Existing behavior
is unchanged, so the AMC6821 can still be used without the thermal
framework (hwmon only).

v2:
- Remove devm_action on release and call of_node_put() manually
- Change of_pwm_polarity to store resulting pwm polarity on driver private data
v1:
- https://lore.kernel.org/lkml/20250530-b4-v1-amc6821-cooling-device-support-b4-v1-0-7bb98496c969@toradex.com/

Signed-off-by: João Paulo Gonçalves <joao.goncalves@toradex.com>
---
João Paulo Gonçalves (3):
      dt-bindings: hwmon: amc6821: Add cooling levels
      hwmon: (amc6821) Move reading fan data from OF to a function
      hwmon: (amc6821) Add cooling device support

 .../devicetree/bindings/hwmon/ti,amc6821.yaml      |   6 ++
 drivers/hwmon/amc6821.c                            | 115 +++++++++++++++++++--
 2 files changed, 112 insertions(+), 9 deletions(-)
---
base-commit: 7e801aa73daa456c4404fde177d3fc397661abf0
change-id: 20250602-b4-amc6821-cooling-device-support-c03b0a899357

Best regards,
-- 
João Paulo Gonçalves <joao.goncalves@toradex.com>

