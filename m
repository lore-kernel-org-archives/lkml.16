Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8E3B1DB92A;
	Wed, 30 Apr 2025 07:07:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745996837; cv=none; b=RkfEMuxpSm/r4s4JgYkyuCEtkrJZcUAzNvFJDlpfULTs9ErxARJOp/BX5j2iSFs2SYFhRzk85zYCdsYZlmFwR3NlN+SK6h1q8D8ENmnHgeS9uD8uVyhfUiyK93pRwGOzWmTgREbBacfENGc2zldTPlT4fw/AA/0Jsi6pBMXlMmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745996837; c=relaxed/simple;
	bh=VS+xlrw9Zg+0emm6wlTPjAFokaDbaMcRgsU4cs4QxcQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=NBsUBgaLnu0TTtSCd/SjqsmuYtxqobMAr/rU08pEe28JlJY+Hy/p7fgRfyIsWowX2+X+Vs7uq7VcNaRGHAzAuJYIiJUehAJVZ+X2Ikdkjy58sBsD95DS3Ws8AhcqryE/RYuhjpmVLOBJUk7d3S+omMIGEBXCRb6lL5Z3mrdutFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gewHCpPE; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gewHCpPE"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5e5dce099f4so8905490a12.1;
        Wed, 30 Apr 2025 00:07:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745996834; x=1746601634; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yCZezkL1GW+eHlpdTmG892fGlIjWcoTOGCzL3tZBGt8=;
        b=gewHCpPEXrlAhEXEeiZ+6bfRl6F3nENs29UeBvxMVVDZqYXP38MqPAzO4/LMUK4akP
         aiQ3gQ0t+gK7s9Xz9MABTo5/VNlpoTTGAsvXszV8oZVj032xXscKFT/viUdQcRYakVfj
         7ZS0ju6oSrxB6BCzk/PFqIZTFeNmAO8v3lVDGWE/ymtOgJFMQ/vLqyUWzK24SjqYsOUU
         Yx+GgsjWDw6Z7A4S6YgSMt3tfQscm/HKVVCUqNyN8+mTTGwqD00IOHdMfO4SrK2hdYjR
         FndfggkLnWXh6zoShxs6GMMHD4flNLdMadEXtdviewwAcSnV0gVeth/kb7UG9IcKgqDV
         BqzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745996834; x=1746601634;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yCZezkL1GW+eHlpdTmG892fGlIjWcoTOGCzL3tZBGt8=;
        b=EO5I8KM0vG7I5oN2DcItOkNzngsnPqGiaqMtGGQH7gtMI+9iA994UtdtWCd27hCoHg
         1FbNNwEksKX1v5o/YBTV73Z2DgDhncRGzHW/EFlXNA3wDrkvAQNvKelZ7tXBgiEfw8kK
         hrG9C3w5rxNw1gZ2WzHJwJxbMrNBio6W/N9FoJQy04HxBnAJIEkwn0U6z92Qc7jO/ZzF
         CRH7VoiA3L++0uAFkmgaUbVKS77BQwFMCGDMwxIrlyIzTD++AFEIWAGqmvL2OflV4jaP
         M8I6/p+w8emX70HtTt94S/0FQckdPicRZvtTm07NRzIoyS5dBAmjgoRXOBDgFtw58sbK
         +BBQ==
X-Forwarded-Encrypted: i=1; AJvYcCUGT6Q518SXLmVxMoYMNcaZNiBWaHz4fN6k5MUuw1HIsPleuQWiVvYGpcdwBVkMMERPrmgXuKLdOD5t4/bz@vger.kernel.org, AJvYcCXJ8rt7Lfn7NgBxDM5nEYA9J1HBcw1N3KT98ya9RhKHp38Pd1JRu8t7Xh9sAmaJFv9n7X5WRhk8Sy7Q@vger.kernel.org
X-Gm-Message-State: AOJu0YwgopPiGR0V4lIxjJnHjjnTJ2U/wOOjd8MfdkuerA0zqVMEGB1B
	fyuTfgE32E49wDvpeYtLQUt8P6EZ2KOkevnxDSRyCujBRX6L789p
X-Gm-Gg: ASbGnctzWIIUtQAsxkFPeApqkpYwlvRaw4x8G59v0dKCN0HonlKjun+8ZccVJOXdVi4
	e8ixf4imoAcUdoa8bBlgrEF8oDNd/TF7W9T7wkk61mZdO/nD3APYqujRqQ7p3n0FXAeTh+JkPlp
	s+78ZfTBJNdaJS6OHrTVJluiuNW+O6DEhK+brsAoYOmsjgB95YHoDug0457O+huNX4RNQTED8nP
	BO+rDEDaznDrKAWYdPkkiR9syTb4Do+oGdNcVQHso1OT9zT35xj3lHILR5CjR/sLqbvMx4YNw3A
	v9vZBPZAS4A7LquSBH09PMsKz0uC4XKJUHPKpjJMgGjI0c5W9YDwRZHUBmHD3CZvGQSdx+fPh68
	jHS3hE5twTo0=
X-Google-Smtp-Source: AGHT+IH8AWzlzZJPAMnz09jAaWWKRGsufLNtWVCf7t2a9gB25c8aE/jh3Th5ts6tU+ILFI5+KiZnnA==
X-Received: by 2002:a05:6402:3509:b0:5f6:218d:34f3 with SMTP id 4fb4d7f45d1cf-5f89c116d3cmr1744138a12.28.1745996833764;
        Wed, 30 Apr 2025 00:07:13 -0700 (PDT)
Received: from hex.my.domain (83.8.121.197.ipv4.supernova.orange.pl. [83.8.121.197])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f7013fec3csm8334314a12.19.2025.04.30.00.07.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 00:07:12 -0700 (PDT)
From: Artur Weber <aweber.kernel@gmail.com>
Subject: [PATCH v8 0/9] mfd: bcm590xx: Add support for BCM59054
Date: Wed, 30 Apr 2025 09:07:04 +0200
Message-Id: <20250430-bcm59054-v8-0-e4cf638169a4@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABjMEWgC/3XRwWrDMAwG4FcpPi9DsiVH2WnvMXaQE6c1LE1JR
 tgoefc5hRGTseNv/P3C8t3McUpxNi+nu5nikuY0XnOQp5NpL3o9xyp1ORsLlkDQV6EduAGmSkX
 ANxwJo5h8/TbFPn09qt7ec76k+XOcvh/NC26nW4lDcLCXLFhB5RjrvhFoMbrX86Dp47kdB7OVL
 PY/aDPkXgkQVTnoEbpfyIAOC+gyDEFbtipUS32EtEOLXEDKsAt9sF3tVZiPkAtoy4mcIXjuGb0
 2QPYI/Q4dUAF9hhrF5dezEP1ZTl3A8muWOkOygmh9iBikhOu6/gD13TWT9gEAAA==
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745996831; l=4550;
 i=aweber.kernel@gmail.com; s=20231030; h=from:subject:message-id;
 bh=VS+xlrw9Zg+0emm6wlTPjAFokaDbaMcRgsU4cs4QxcQ=;
 b=LkPJJme0CeOuWGxdl/UEmer7IN2WIrREelfrgk/qqB8Aqo25JGhq61RDghEGRU+wxQe99lPE+
 2YWhvsAq3rfCEo1yh+b1fyLAfOg1dZEEEivrVYPlerUUQYX+Xpjt5A2
X-Developer-Key: i=aweber.kernel@gmail.com; a=ed25519;
 pk=RhDBfWbJEHqDibXbhNEBAnc9FMkyznGxX/hwfhL8bv8=

Add support for the BCM59054 MFD to the bcm590xx driver (mfd and
regulator) and fix a couple of small bugs in it that also affected
the already supported BCM59056.

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
Artur Weber (9):
      dt-bindings: mfd: brcm,bcm59056: Convert to YAML
      dt-bindings: mfd: brcm,bcm59056: Add compatible for BCM59054
      ARM: dts: Drop DTS for BCM59056 PMU
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
 arch/arm/boot/dts/broadcom/bcm28155-ap.dts         |   68 +-
 arch/arm/boot/dts/broadcom/bcm59056.dtsi           |   91 --
 drivers/mfd/bcm590xx.c                             |   67 +-
 drivers/regulator/bcm590xx-regulator.c             | 1289 ++++++++++++++++----
 include/linux/mfd/bcm590xx.h                       |   27 +
 9 files changed, 1358 insertions(+), 406 deletions(-)
---
base-commit: d0eceba4d13341a1d2d52a1ffc31b6987174dfd0
change-id: 20240816-bcm59054-a880695e41e8

Best regards,
-- 
Artur Weber <aweber.kernel@gmail.com>

