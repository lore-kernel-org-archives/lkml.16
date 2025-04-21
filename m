Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 047752AE7F
	for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 08:15:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745223322; cv=none; b=N8mfSBfDNaU2G7hztRXzHcHcJ36m9s8LGQL1PY46p46rgN2BugBRhmybM5KRdBGOGQvH7gnVJzDvRmaWFPoZW5VXl98ZrXOohyRhcRm8K7eepTNN2ju0QtPabsaL/NHJWx5COVH0NTTaeKwpvw+J/M7Yy1sPRokccW0vJLtWOC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745223322; c=relaxed/simple;
	bh=wh2ZvJ0MpzyvSvb/71rDMCsRepQ7ZRPMAExEDL7P2Y0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=bujYASptOgK3ro4TYZ/f2diggCmRjp9vxa7RjakLuzVALTiaovKWbOMdNxj/6CruF2kv7bMP4gLKlqDFAH3lA0UfOlu8AluvfRZj/5pCcgnm3m+1l8OEGnbXDnfbF08BhF/1yePduL/8A0iJkTGVwq9RNSiX9UiJ3Hs12X8KCmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=EwXQDZvS; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="EwXQDZvS"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5f4b7211badso5246327a12.2
        for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 01:15:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1745223318; x=1745828118; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=j8qJ55ToF3jTe+9KsGyg1OHhc22gynF+LRW6Ku4tCvk=;
        b=EwXQDZvSd2LVyQiMCPmhCOo4WP8btFTpnn8jQ61bsUX9mGQyS2Fm5F+HLnV83uDo1E
         YyfNdBLExg5ZL/N0MX3a/QCVqNl0Uf9hj6dMnAARpoqGKD/rhnmLZwJGA7+MVlx3JlLP
         am4WmBrzen4WtvU9sjY2fmWtYu17Ew0dOL1/MdNU+7s363ov0Vj92Nd1LQN3THN+fDqu
         bxvaareQdH9bi0Pl3GT7ChdMPq4FC+dFG8J5W4Ue1nK7of3osmaqutXai/SMSjWkuoOl
         InWHK1IwKQ7X9qenVS6LRg+26hAWJaJkmTbLkpc0g+v0knqP2gUyAzT1fk3wXanjlEzH
         Xggg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745223318; x=1745828118;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j8qJ55ToF3jTe+9KsGyg1OHhc22gynF+LRW6Ku4tCvk=;
        b=dTKUiyz0+wk7+oLprfWIPxuVx5MNhawrkS4cQL4PRW+m6yswFRyoZgDtRNJ+jnDncF
         gY/HjX+f757lJxltCpNt+ewz3Paf5pdLIdbfFd6jba/+SOceYeuCW4QJ76MTXFOaGKpg
         CIwHFOStwqzVZU3CWghrj1xAfChvwoFrAvLppHvyWeIaSochMhbqNUd8EfkKcyveBtXU
         XdmnCqo/MvSGrTx02UcltxNshHLNBEnw/8kvqhALqB4Td1NKN9ydDlEldy5C7wUB6t/s
         r/T3+YYlLYkhU8UBRL8h4lMLZaAuP75y5XPTlSGvUXSs6JQ70WmRIltUhfwy6bXOEugG
         JKGw==
X-Forwarded-Encrypted: i=1; AJvYcCXx36q6/2hD6ZPkAko+0q1qkprw9MmvRUw6xNmcKh2TqTusMj8X60clo4+VVhFwldVUuDVYJxEnonOJH4g=@vger.kernel.org
X-Gm-Message-State: AOJu0YwSYhNnxqO12zp76yCwG+lb/psWP5QHp8mtl2HUibTRyFgvXK3w
	15QH7JGyIuK+9/FHz2jGRLxqzjBFdHxUKaAdn9m3GAunLTFRn88qc0ISs7EHcQQ=
X-Gm-Gg: ASbGncuFZHrAvKc+GQfh2tB6k9w6PWCWKuI/k3MtL/78j+NaGBXDyiUPk3vbEvE7/EW
	nlPrvIq8dMKsgIPJrvTmE1YeGqj9Dl8hKFXwVansLXqWIgR2vxRAdgv582KH3wSb30uCZUP+Teg
	H7CckdeVeSV0gM+yxE35vqGSoc99k6QuxnNy2CTytqLnucmshkf74PMZen7yXGTcAscBcSKbvsh
	FhxRisg4bCWBYV/i3mFaBWO51lAr7I0wrvZv93+JuGscwoRuEnJN447Af4BzVzy387MEQZ7iZcB
	zyXuGfcNiwcie/7NWHMG/J17E80BM38c80HIkjkrU24O6g==
X-Google-Smtp-Source: AGHT+IHl9ajmtuDkj5s00oPoVojYOBkZKIewBG+zW2Dai7berQhTSgtIulOKXTkdhuk7U3TNOYhilQ==
X-Received: by 2002:a05:6402:50c8:b0:5e6:4ee9:f043 with SMTP id 4fb4d7f45d1cf-5f628603c66mr7983837a12.26.1745223318219;
        Mon, 21 Apr 2025 01:15:18 -0700 (PDT)
Received: from localhost ([2001:4091:a245:826e:c0c:4cef:7dd:26bd])
        by smtp.gmail.com with UTF8SMTPSA id 4fb4d7f45d1cf-5f625a3e4bbsm4216959a12.72.2025.04.21.01.15.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Apr 2025 01:15:17 -0700 (PDT)
From: Markus Schneider-Pargmann <msp@baylibre.com>
Subject: [PATCH 0/7] arm64: dts: ti: k3-am62: Add wakeup-sources for low
 power modes
Date: Mon, 21 Apr 2025 10:14:18 +0200
Message-Id: <20250421-topic-am62-dt-partialio-v6-15-v1-0-6ced30aafddb@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFr+BWgC/02Nyw6CMBBFf4XM2jG0vIRfMSxKO+hEodgWNCH8u
 w24cHnuTc5ZwZNj8tAkKzha2LMdI4hTAvquxhshm8ggU1mkuSgw2Ik1qqGUaAJOygVWT7a4lBj
 fTFbGiL4XlVEQHZOjnj+7/9oe7Og1x0w4RuiUJ9R2GDg0yVKeo8RpAf/9Jon1XKRp/asPWo34V
 g+aJ/R2dpr2vMSLFqas60x05tIsFbTb9gUlg9dq4gAAAA==
X-Change-ID: 20250415-topic-am62-dt-partialio-v6-15-327dd1ff17da
To: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Vishal Mahaveer <vishalm@ti.com>, 
 Kevin Hilman <khilman@baylibre.com>, Dhruva Gole <d-gole@ti.com>, 
 Sebin Francis <sebin.francis@ti.com>, Kendall Willis <k-willis@ti.com>, 
 Akashdeep Kaur <a-kaur@ti.com>, 
 Markus Schneider-Pargmann <msp@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4509; i=msp@baylibre.com;
 h=from:subject:message-id; bh=wh2ZvJ0MpzyvSvb/71rDMCsRepQ7ZRPMAExEDL7P2Y0=;
 b=owGbwMvMwCXWejAsc4KoVzDjabUkhgzWf+mHHmf8eNTUFh8i8uPM59+GinUpOuw9eteZzoS/v
 S34TbKio5SFQYyLQVZMkaUzMTTtv/zOY8mLlm2GmcPKBDKEgYtTACZi+47hn/G249KnvmYE1vk8
 E1aadJbRY9re+3O+3rV+f0778CkrtqsM/6y/W3QIpuz9tlAg76ntCxUxh/a9ryuTuJc0iF2QVHJ
 4ywEA
X-Developer-Key: i=msp@baylibre.com; a=openpgp;
 fpr=BADD88DB889FDC3E8A3D5FE612FA6A01E0A45B41

Hi,

This series adds devicetree changes needed for Partial-IO support
on TI am62, am62a, and am62p SoCs. It defines system states for various
low power modes and configures the wakeup-sources for devices in the CANUART
group. Depending on the SoC and board details, some low power modes may not
be available, so the wakeup-sources are described in the board files.
The series also adds the necessary pinctrl settings required for proper
wakeup functionality.

Partial-IO Overview
------------------
Partial-IO is a low power system state in which nearly everything is
turned off except the pins of the CANUART group (mcu_mcan0, mcu_mcan1,
wkup_uart0 and mcu_uart0). These devices can trigger a wakeup of the system
on pin activity. Note that this does not resume the system as the DDR is
off as well. So this state can be considered a power-off state with wakeup
capabilities.

A documentation can also be found in section 6.2.4 in the TRM:
  https://www.ti.com/lit/pdf/spruiv7

Implementation Details
----------------------
The complete Partial-IO feature requires three coordinated series, each handling
a different aspect of the implementation:

1. m_can driver series: Implements device-specific wakeup functionality
    for m_can devices, allowing them to be set as wakeup sources.
    https://gitlab.baylibre.com/msp8/linux/-/tree/topic/mcan-wakeup-source/v6.15?ref_type=heads
    https://lore.kernel.org/r/20250421-topic-mcan-wakeup-source-v6-12-v7-0-1b7b916c9832@baylibre.com

2. This series (devicetree): Defines system states and wakeup sources in the
    devicetree for am62, am62a and am62p.

3. TI-SCI firmware series: Implements the firmware interface to enter Partial-IO
    mode when appropriate wakeup sources are enabled.
    https://gitlab.baylibre.com/msp8/linux/-/tree/topic/tisci-partialio/v6.15?ref_type=heads

Devicetree Bindings
-------------------
This series depends on the dt-schema pull request that adds bindings for
system-idle-states and updates the binding for wakeup-source:
  https://github.com/devicetree-org/dt-schema/pull/150

These new bindings allow us to define the system states and reference them
from device wakeup-source properties.

Testing
-------
A test branch is available here that includes all patches required to
test Partial-IO:

https://gitlab.baylibre.com/msp8/linux/-/tree/integration/am62-partialio/v6.15?ref_type=heads

After enabling Wake-on-LAN the system can be powered off and will enter
the Partial-IO state in which it can be woken up by activity on the
specific pins:
    ethtool -s can0 wol p
    ethtool -s can1 wol p
    poweroff

I tested these patches on am62-lp-sk.

Best,
Markus

Previous versions
-----------------
 - As part of the series "firmware: ti_sci: Partial-IO support"
   https://lore.kernel.org/r/20250306-topic-am62-partialio-v6-12-b4-v5-0-f9323d3744a2@baylibre.com

Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
---
Markus Schneider-Pargmann (7):
      arm64: dts: ti: k3-pinctrl: Add WKUP_EN flag
      arm64: dts: ti: k3-am62: Define possible system states
      arm64: dts: ti: k3-am62a: Define possible system states
      arm64: dts: ti: k3-am62p: Define possible system states
      arm64: dts: ti: k3-am62-lp-sk: Set wakeup-source system-states
      arm64: dts: ti: k3-am62a7-sk: Set wakeup-source system-states
      arm64: dts: ti: k3-am62p5-sk: Set wakeup-source system-states

 arch/arm64/boot/dts/ti/k3-am62-lp-sk.dts | 60 +++++++++++++++++++++++++
 arch/arm64/boot/dts/ti/k3-am62.dtsi      | 22 +++++++++
 arch/arm64/boot/dts/ti/k3-am62a.dtsi     | 27 ++++++++++++
 arch/arm64/boot/dts/ti/k3-am62a7-sk.dts  | 76 ++++++++++++++++++++++++++++++++
 arch/arm64/boot/dts/ti/k3-am62p.dtsi     | 27 ++++++++++++
 arch/arm64/boot/dts/ti/k3-am62p5-sk.dts  | 76 ++++++++++++++++++++++++++++++++
 arch/arm64/boot/dts/ti/k3-pinctrl.h      |  2 +
 7 files changed, 290 insertions(+)
---
base-commit: 64e9fdfc89a76fed38d8ddeed72d42ec71957ed9
change-id: 20250415-topic-am62-dt-partialio-v6-15-327dd1ff17da
prerequisite-change-id: 20241009-topic-mcan-wakeup-source-v6-12-8c1d69931bd8:v7
prerequisite-patch-id: 02b7142f56c849c9a3faab2d2871805febd647aa
prerequisite-patch-id: 830b339ea452edd750b04f719da91e721be630cb
prerequisite-patch-id: 56fd0aae20e82eb2dfb48f1b7088d62311a11f05
prerequisite-patch-id: 41f55b96c0428240d74d488e3c788c09842a1753

Best regards,
-- 
Markus Schneider-Pargmann <msp@baylibre.com>

