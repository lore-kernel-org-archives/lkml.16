Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB3031F099F;
	Fri,  4 Apr 2025 13:50:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743774661; cv=none; b=etZwnvP1JV/OeRnblvSPL4EFMLsHVEmWqAsomxZujvMi+FO2V+5mn0lBBMkixVr9qog41aMpPLiIFFe+Th7RrXHOf3WRQMSrZim5bXpscKo3ByPlpDU04PACrru3fB2Ia9FAdxUWdEVDFMFgQ3dcpEJrUfzjAqpAi//xzBpeVuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743774661; c=relaxed/simple;
	bh=KM16sgTNvRvbJg0m55JE30pDne9XoFpHhIalYoOmghY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ho8sTNiXYVrelSUWMu9sm2SGjpcqjQli/GCNdozH+UHx3F2Ip72rSIMrE3iEC+owOz3U1ZF2BcH1y5vUcT0856Z3QaJkE9W1vlpCaaemn1mCJufkUOWf7TdIV9c71S6N6qEmOIWm5eSe01ZV0IlXefJCDIOXhGy9jVTsrZs3d5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=chNKscuE; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="chNKscuE"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-54afb5fcebaso2359594e87.3;
        Fri, 04 Apr 2025 06:50:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743774658; x=1744379458; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cCGlLG2iHtytohZhZKlz2DSZKkgEAMa/DMrE1qjBDGM=;
        b=chNKscuEC1W/8NQWIXY9LeSb0bNQSkoOANl+oJl42qiL/ncpFc5y2Ht24eAPWXw1zs
         WdjoftHoX2TzpQwTUEgpJ30ppVym7YPj1wZVhrvgej9hMfjw1EyxQPSv5nVf8+PL+jC6
         //dwDydNx8bY3q3gn9iU0nTBN9Xck1phHSfa7Y/Sj8hv3ZC3+qvuOmcQ4+HqIPbflWU/
         q85xlsKFH0ezxwBPDx7/mdR8SugZ5xNB2h0mY9q9r9jEL4vOdHEVMPFdM7EIPRQB3kzb
         qQf/Su8MJ/cha1YwzZi/b7aYg/qZWQIm+g9v3eK4zFqcMnAsLYgk9KElmEnpyrxPXOQ/
         +EWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743774658; x=1744379458;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cCGlLG2iHtytohZhZKlz2DSZKkgEAMa/DMrE1qjBDGM=;
        b=ilGiE0v7hN2qOB8gkruS4gy+Ocye4a01vC2Vu7ivN31PA+aqqtX3v1JNvbps3xAU5F
         5fagSqGY3y+g37HAJ9JMmvq11exmSkUcW6uyMuCNNrICUjwLp0vb7wyXSZcEZeZeLliL
         gxKYlXJZJzc/z3ovggUbG8rfI8qEgtbCF1/bW0tt7i1M0Jox90ehec09L1KbyMu4U72M
         bhL61CNCqMh06WfH/Hji00Wd060AKv5ZdRGPIpsHuNcqYHQ7lR30n0ru6QGdIgYvncQb
         4/pMa5GXRHRynLi3PT7ccEVv4pF41RZ6KHXCUcJRRH443S4hSfvw9KGjYjgb5I2fYxCD
         059Q==
X-Forwarded-Encrypted: i=1; AJvYcCU2VTnnsQUQBRP7ge9f/HeMsSh31M62JMWSmpj+V5OHGC0Q4xAmcPps7uDqoM6WXNAzIjOaSWtoMl7coGBc@vger.kernel.org, AJvYcCXfWpVVvv7cpy97YqBL7+uGNboj+UWo3OSv6csVyRxKwHyb4X47Zoo1G1DtvDbwmGVgT2IAQinF2XTp@vger.kernel.org
X-Gm-Message-State: AOJu0YyJcIu2oJ1UyTLjb8GgZ2mJUudtqQUL2n3tczFRIyvvkkTizu7Y
	samIdIFDVWVnZzix9NBGMiDUDeOOgCFBSWnrA7AysB20EfRewe9J
X-Gm-Gg: ASbGncvmWA9ZhbnqPwitHw+sXpN9+2rnEY2oRuP3uKoS0Fpue2d02xjymAhaCLCFJbH
	K6DlkQkmFK2bSGuV9RNAIWz0VK5GmMhzDgfquxCvm0MzbGBTksK5GLu4ul50rwQduZ9KVnzgEOu
	5pAYO5/8LGMTn1C/kxLmpxZy+SN82qBJYY+u7dGDc9uhLrTABEuKb2g1XS5TaDSjPE5gPe0pos9
	4RZYTuGOw+fJ0aSKY/FYTuEaiajRvkppdAj8Qj8lgAqA6BMoPi3ey2Y0BEQuGW72O/eNXVID1D2
	5ATk9NHCdA2Uu4HpMVzl0GYJR9cPsne4OppXNSrDVYssfAVjCd29sTqsSEYnJmny+MYQeMx7SyV
	Rutd+fGQx1spNIdS/FHkGRIov
X-Google-Smtp-Source: AGHT+IFSrSttsSE4MU1Mk7zmK95JgwzJ/3t6TQITIO2ULof82nLa8JgXrAys8wyTLvDhwm1+3gcSuw==
X-Received: by 2002:a05:6512:3da0:b0:549:8f47:e67d with SMTP id 2adb3069b0e04-54c2278b06cmr1001454e87.34.1743774657464;
        Fri, 04 Apr 2025 06:50:57 -0700 (PDT)
Received: from [192.168.1.199] (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54c1e635c7dsm436687e87.144.2025.04.04.06.50.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Apr 2025 06:50:56 -0700 (PDT)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Subject: [PATCH v2 0/3] Add support for Sitronix ST7571 LCD controller
Date: Fri, 04 Apr 2025 15:50:31 +0200
Message-Id: <20250404-st7571-v2-0-4c78aab9cd5a@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKfj72cC/zXMQQ6DIBCF4auYWZcGUGrpqvdoXAAOOkkVA4a0M
 d691MTl//LybZAwEiZ4VBtEzJQozCXkpQI3mnlARn1pkFwq3nDB0tqqVjBd36XVzjteeyjnJaK
 nzwG9utIjpTXE7+Fm8V9PQp5EFoyzWon+ZjWibcxzmAy9ry5M0O37/gMwabB8nAAAAA==
X-Change-ID: 20250401-st7571-9382b9cfc03f
To: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Marcus Folkesson <marcus.folkesson@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1550;
 i=marcus.folkesson@gmail.com; h=from:subject:message-id;
 bh=KM16sgTNvRvbJg0m55JE30pDne9XoFpHhIalYoOmghY=;
 b=owEBbQKS/ZANAwAIAYiATm9ZXVIyAcsmYgBn7+Osqu96HCbtIQ2AggwXIp1BUNgmxz2AxKm+0
 C9BmuH2VQKJAjMEAAEIAB0WIQQFUaLotmy1TWTBLGWIgE5vWV1SMgUCZ+/jrAAKCRCIgE5vWV1S
 MoPlD/90YFLZy0IiD76aYxfa48IfgxJ3RjJQKXM3Z5mkJbiJ3G9K6H7F+qDjw6EzKWFMG+WO0eN
 u6ZM9MTHmX/RYhtSp9bCyBrXy3fTxbeio/LqVKYmrOXDlznltLaOJUbQXgee/9+t3tzRexQTSw6
 d1PDjF2Ewvk7dmVeAkP6h2c+XGY4gbfI4KRM4wopsWRrWo2jvn4utIJusMO1S2UKezsvMNGJ/So
 Av7i4/sC4Nn8JqzKbz7fI0gOsxQ0KmJG5wjhB1Mjs/Njdbdpq36TJnMSxIs19/zp8nlfQhn8Ry/
 /b13Q5s+PTULqEiwRoGkrrVPn3L26DF5bKq4KRgfK3KBZFWty3rWUIxyeBCza3q/1kWIaVeaeOk
 q1IkQjTjk0Vipl3us2VN6F55c/Ey2Ke0NW9LIPBZPmASJXRmLr0GPyHQAAG+Fd9c9BtZEJqMRob
 6PBPe6P3R3v+aPyi6FBl3x9ACs7QozJJsQKCFtrkUdc+LsjN4HkzzGUP3k0Xj6k+WCe3HCfwvly
 1WA/K37gzy0g3wAwj/EpZ31LyRlcsAN5Dfc1UndPRWuFGGpj8SAwA6Ljcbahpu7ISsEHX1G5fQp
 DaO1SHFXyQwtrTAGBlP+IAQULBxY6Vmo4/8wXc8gC3VPel09WsxhdsEF+zDLJOeNZwBCVcMeWTn
 0ux9tTEKSOBrkvA==
X-Developer-Key: i=marcus.folkesson@gmail.com; a=openpgp;
 fpr=AB91D46C7E0F6E6FB2AB640EC0FE25D598F6C127

This series add support for the ST7571 LCD Controller.
It is a 4 gray scale dot matrix LCD controller that supports several
interfaces such as SPI, I2C and a 8bit parallell port.

This driver only supports the I2C interface, but all common parts could
easily be put into a common file to be used with other interfaces.
I only have I2C to test with.

The device is a little defiant, it tends to NAK some commands, but all
commands takes effect, hence the I2C_M_IGNORE_NAK flag.

Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
---
Changes in v2:
- Reworked pretty much the whole driver to not use obsolete code.
- Use panel and timing bindings to specify resolution and panel size
- Link to v1: https://lore.kernel.org/r/20250402-st7571-v1-0-351d6b9eeb4a@gmail.com

---
Marcus Folkesson (3):
      dt-bindings: display: Add Sitronix ST7571 panel
      drm/st7571-i2c: add support for Sitronix ST7571 LCD controller
      MAINTAINERS: add antry for Sitronix ST7571 LCD controller

 .../bindings/display/sitronix,st7571.yaml          |  73 +++
 MAINTAINERS                                        |   6 +
 drivers/gpu/drm/tiny/Kconfig                       |  11 +
 drivers/gpu/drm/tiny/Makefile                      |   1 +
 drivers/gpu/drm/tiny/st7571-i2c.c                  | 720 +++++++++++++++++++++
 5 files changed, 811 insertions(+)
---
base-commit: 1e26c5e28ca5821a824e90dd359556f5e9e7b89f
change-id: 20250401-st7571-9382b9cfc03f

Best regards,
-- 
Marcus Folkesson <marcus.folkesson@gmail.com>

