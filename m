Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4417D7261A;
	Thu, 15 May 2025 14:16:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747318599; cv=none; b=GtalHtgEJrkG077ORzLhHy+fnaAKx8erWO/3KfboZv4/68IcqGLCSF1vIsc8V8Iqf6pG14GBvWzZLZh2A7TOaugV/OaQ3yJH6SGYJ4GRCYCh7NhD3MwedsqI7NYCTWY5HTkT1/6T+Eald3Uj7F9fooV+yNnYl98azJIrkJBqfPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747318599; c=relaxed/simple;
	bh=8oygh7jMpux+UzJGWRuCX3mVT7I8LIQFy2zqdzPix2o=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=APFg9UCtW8n8wyIUAl9qnftwYeqEmvwIsiOvadQINBS7VGaPQv0zGM8JXWVTEI5p2R6iGiE+zdZxS3O4OrEt1xp/v/9qLBZ1Iz0D5VoGvNJ8Tmx1hB11fXXg7Sm1xSvguQ8x1+7jh+a3WB8e/cm0NctqeFtVUWPTdmUlDg5Rmvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ggMxzRYq; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ggMxzRYq"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-ad21c5d9db2so167801766b.3;
        Thu, 15 May 2025 07:16:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747318594; x=1747923394; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VEBQIjrgTegErrmLSXKXMsIKpZnPOc6CSNuuKkQttLw=;
        b=ggMxzRYqLmlFH5Q6Kn/TbD6rJN12rvK9XLBLkTRHjIxSmA0GLLxU/NvKOXBlnuQjE9
         ywAw0xS6xDevRQklIBNW19vtJ6quxkd4rOE7eCddT62S8rbTuMGhebm7d1Xvk9SUYXRI
         o0rePYBEkgEyLrqo6mPJzsDN6vlEt5rpkAFPtHCO5l0ZPaWO789vKva0ptZngQG8Es/S
         L/qOB55a7pBoPwpeoXPZ+hoCMGYXBgrrW60ePAY0VsPM7zyucVaIPHID5+/u8j/uRnPG
         jH3SEzoiQETN/qYaoeTPdtlMg9SMeGmXQgaCP/S9p9hpzdZ2t0eSSoE/ZkV//4Ew//Mx
         +b8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747318594; x=1747923394;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VEBQIjrgTegErrmLSXKXMsIKpZnPOc6CSNuuKkQttLw=;
        b=Ub8zYJ1kx/JE5FQYJ/sp2qAY70kHN2wS5j2lX7mcpWzOetUDkh2dfws8MBmtAqhN8y
         vrVu8UIPscId40IBIjPE9B3MYGeMESP/O2sg1RnKPY/D3piOwlZCEl8v/cR/mB5i5DqN
         wniNfKxh/UFLvOrRiUZYIm36rkWhrH1Y5OZxe62TJuTKx7w6Tx1BNvED/Wf+R96gpTJc
         epUiJmHxoe7t5F+xd7jI/igfo2ZmmPOaj22NZWZAv5kwfqurBBCireSc9KgJMIlECtjz
         ENVgX0fSq+EQoAHlYPu+G8C4rfm8HFsnkvavAKlRnOvTwyVX5y560OzGD8iG4p89nBq+
         KqfQ==
X-Forwarded-Encrypted: i=1; AJvYcCWiiEhk1/mQX/5g90TqICZOjnQJoA2NC8PhgTDOiH4Ths6ODO3oDhMMkIGJdHagWLaGpLsH6+dBM/uz@vger.kernel.org, AJvYcCX9y1ap84guPEZFcXyvBMLjTdLj+snz56E2IkGp3JgbYDXGad+UIe/G2uP8BCBK5kkZvPPdlWwgbf75n36m@vger.kernel.org
X-Gm-Message-State: AOJu0Yyhho9H7SOQhGRjfGEra2E4V4cl85y7P2aJiAFURfh1+6+hyOA7
	Jdg9JTctrG6bL938ubZ2c7kRrL1QmhXmg/9tutgZmDw5QrX26rMY
X-Gm-Gg: ASbGncs32JOFMbpD704vqp9JKbUIaPDNOkASiON8rSmr1pcVdgfPZq0zc6LcRkPHVmM
	xEks0SIG7JSXv8qbl7cgT0hbX5UFI/CUJipzXT/qZcOUZbXc4clp8OukYd+qxg0ZtZsPgni8VpY
	liY4DvSHUmGSWTVxD1hs5Gh4ZeDFBH7rwDn/0g3Jeu5rFeozVP+4J+o1D7eZ1WIxh67Q/jsbyAZ
	aJaPxwkMD+z4VS1+hJIkfXSJYQfkTsEJCzIg4dBrgFgGuKl1mLODwVjYSP0MSxh4EJLW+QwyCYx
	tfB91mSh/lxd2cSQsdX8kJIghVe+HnXEbDrpr+AjHn/f0GNCWUJSOUQ41RE0QJ7uMnRUbiRtbVe
	vsEb2k0Dc4Iv8A28zCmU7jQ==
X-Google-Smtp-Source: AGHT+IFNwAr/GS2TMFy+3AZVdmMiBlmMSKDqEwzoB7f5jvM8WXyqmQSQKseFNvcA055ZJ2Myun2L4A==
X-Received: by 2002:a17:907:d310:b0:ad2:4f81:65b4 with SMTP id a640c23a62f3a-ad4f7523191mr578780266b.60.1747318593587;
        Thu, 15 May 2025 07:16:33 -0700 (PDT)
Received: from hex.my.domain (83.11.178.15.ipv4.supernova.orange.pl. [83.11.178.15])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad2192c8535sm1110143966b.8.2025.05.15.07.16.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 May 2025 07:16:33 -0700 (PDT)
From: Artur Weber <aweber.kernel@gmail.com>
Subject: [PATCH v9 0/8] mfd: bcm590xx: Add support for BCM59054
Date: Thu, 15 May 2025 16:16:27 +0200
Message-Id: <20250515-bcm59054-v9-0-14ba0ea2ea5b@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADv3JWgC/3XRwWrEIBAG4FdZPDdlRmeM6anvUXoYje4KzaYkJ
 bQsefeahRKb0uMvfr84c1NznHKc1dPppqa45DmP1xK6h5MKF7meY5P7kpUGTeDQNj4M3AFTI86
 B7TgSRqfK9fcppvx5r3p5LfmS549x+ro3L7idbiUGwcBesmADjWFsU+cgYDTP50Hy22MYB7WVL
 Po/qAvkJASIIuzlCM0PZECDFTQFei+BtThqXXuEtEONXEEqsPfJ67614piPkCuo6xe5QLCcGK1
 0QPoI7Q4NUAVtgRKdKb9nR/RnOG6H9Gs4rsBIIVlTVtYJ1XBd128xwGK49gEAAA==
X-Change-ID: 20240816-bcm59054-a880695e41e8
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: Stanislav Jakubek <stano.jakubek@gmail.com>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 ~postmarketos/upstreaming@lists.sr.ht, 
 Artur Weber <aweber.kernel@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747318592; l=4703;
 i=aweber.kernel@gmail.com; s=20231030; h=from:subject:message-id;
 bh=8oygh7jMpux+UzJGWRuCX3mVT7I8LIQFy2zqdzPix2o=;
 b=As/jQKILnZvkmHW/FwfAn74S3e8To0t55+vN8zCZBbCmAQShIHCQqh12XSAK+DrrhYn6314ay
 909IK9jXZenCVUBNsx9cFw5pfgqvbB/YT2x9mkh13pIW+VX7NPWj1dm
X-Developer-Key: i=aweber.kernel@gmail.com; a=ed25519;
 pk=RhDBfWbJEHqDibXbhNEBAnc9FMkyznGxX/hwfhL8bv8=

Add support for the BCM59054 MFD to the bcm590xx driver and fix a
couple of small bugs in it that also affected the already supported
BCM59056.

While we're at it - convert the devicetree bindings to YAML format
and drop the bcm59056 DTS in favor of describing the PMU in users'
DTS files, as is done for most other MFDs.

The BCM59054 is fairly similar to the BCM59056, with the primary
difference being the different number and layout of regulators.
It is primarily used in devices using the BCM21664 and BCM23550
chipsets.

This patchset has been tested on a Samsung Galaxy Grand Neo
(baffinlite rev02; DTS not in mainline yet) with a BCM59054 PMIC.
Testing on a BCM59056 would be appreciated.

Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
---
Changes in v9:
- Rebase on mfd/for-mfd-next again
- Drop "ARM: dts: Drop DTS for BCM59056 PMU" as it has been applied
- Address another style nitpick on "mfd: bcm590xx: Add PMU ID/revision parsing function"
- Pick up Reviewed-by tag from Stanislav
- Link to v8: https://lore.kernel.org/r/20250430-bcm59054-v8-0-e4cf638169a4@gmail.com

Changes in v8:
- Rebase on mfd/for-mfd-next
- Drop "mfd: bcm590xx: Drop unused "id" member of bcm590xx MFD struct"
  as it has been applied
- Address style nitpicks on "mfd: bcm590xx: Add PMU ID/revision parsing function"
- Link to v7: https://lore.kernel.org/r/20250316-bcm59054-v7-0-4281126be1b8@gmail.com

Changes in v7:
- Return -ENODEV on PMU ID mismatch
- Drop "Check your DT compatible" from ID mismatch error message
- Pick up Reviewed-by trailers from Rob on DT bindings
- Link to v6: https://lore.kernel.org/r/20250304-bcm59054-v6-0-ae8302358443@gmail.com

Changes in v6:
- Rename mfd/brcm,bcm590xx.yaml to mfd/brcm,bcm59056.yaml again
- Use PMU ID value as device type
- Rename rev_dig and rev_ana to rev_digital and rev_analog
- Link to v5: https://lore.kernel.org/r/20250221-bcm59054-v5-0-065f516a9042@gmail.com

Changes in v5:
- Make regulator binding descriptions reference mfd/brcm,bcm590xx.yaml
  instead of mfd/brcm,bcm59056.yaml
- Move regmap type enum to common MFD header
- Link to v4: https://lore.kernel.org/r/20250215-bcm59054-v4-0-dbfb2d76a855@gmail.com

Changes in v4:
- Fix yamllint warnings in DT bindings
- Address miscelaneous review comments related to DT bindings
  - Note that I did not end up moving the regulator refs from
    allOf compatible matches; I explained my reasoning in [1].
    [1] https://lore.kernel.org/lkml/ab853605-859d-44c6-8cbd-44391cd677e6@gmail.com/
- Add PMU ID/revision parsing to MFD driver
- Fix instances of regulator data not matching vendor kernel for
  BCM59054
- Use different voltage table for BCM59054 VSR reg based on PMU
  revision
- Link to v3: https://lore.kernel.org/r/20250131-bcm59054-v3-0-bbac52a84787@gmail.com

Changes in v3:
- Split out regulator DT bindings into separate YAML
- Use tables of regulator info instead of get_XXX_register, reg_is_XXX
  functions
- Drop "regulator: bcm590xx: Add proper handling for PMMODE registers";
  it adds unnecessary noise to the series and will be submitted separately
- Link to v2: https://lore.kernel.org/r/20231030-bcm59054-v2-0-5fa4011aa5ba@gmail.com

Changes in v2:
- Fixed BCM59054 ID being passed to BCM59056 function in the
  regulator driver
- Dropped linux-rpi-kernel from the CC list
- Link to v1: https://lore.kernel.org/r/20231030-bcm59054-v1-0-3517f980c1e3@gmail.com

---
Artur Weber (8):
      dt-bindings: mfd: brcm,bcm59056: Convert to YAML
      dt-bindings: mfd: brcm,bcm59056: Add compatible for BCM59054
      mfd: bcm590xx: Add support for multiple device types + BCM59054 compatible
      mfd: bcm590xx: Add PMU ID/revision parsing function
      regulator: bcm590xx: Use dev_err_probe for regulator register error
      regulator: bcm590xx: Store regulator descriptions in table
      regulator: bcm590xx: Rename BCM59056-specific data as such
      regulator: bcm590xx: Add support for BCM59054 regulators

 .../devicetree/bindings/mfd/brcm,bcm59056.txt      |   39 -
 .../devicetree/bindings/mfd/brcm,bcm59056.yaml     |   76 ++
 .../bindings/regulator/brcm,bcm59054.yaml          |   56 +
 .../bindings/regulator/brcm,bcm59056.yaml          |   51 +
 drivers/mfd/bcm590xx.c                             |   66 +-
 drivers/regulator/bcm590xx-regulator.c             | 1289 ++++++++++++++++----
 include/linux/mfd/bcm590xx.h                       |   27 +
 7 files changed, 1325 insertions(+), 279 deletions(-)
---
base-commit: 6103b87af895954882de162cc652d02a6f65c074
change-id: 20240816-bcm59054-a880695e41e8

Best regards,
-- 
Artur Weber <aweber.kernel@gmail.com>

