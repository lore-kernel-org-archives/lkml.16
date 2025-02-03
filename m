Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 211C2204C04;
	Mon,  3 Feb 2025 12:18:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738585140; cv=none; b=Udm3OtllD2vhcZplVLKvWEdUUek57VpPkyvK4NjlX/HBBAA9I83Z7Ilr7Z9S5AT9ZH5BsC+zI/l0IrkOIBIBzYvAbBf7Ookx756T6iPXJ2ptywAfCo/j1QV3wzsWqu+vD2oVTX7bEAVsb2mpVXo/MiAofYfM6WUgHJHvwpLh4Bg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738585140; c=relaxed/simple;
	bh=5w++ng0t8AmnGHxvT0Mmm6vdBAdXaAL3u+jefbSRZG4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XFTV31S9Kyp9Ri8RDpFys/V+BCKwJiuHL1V9cSqAynVOA/DhEOKvhfTEfNB8q5x63966kzZHs2Hx/WK3cmP1sYvdJNOf0yDD/w5l1y+jdafUMNjLNlfTF3vgySZNLoBCgnpRaxwqgcG8YkwRKJKdMPIAaQ6iOKitoMCw4DbdlaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LJHVxy32; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LJHVxy32"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-2ee74291415so5438566a91.3;
        Mon, 03 Feb 2025 04:18:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738585138; x=1739189938; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vQ0bIWQ9q6zEM/5sxJXyhS9znYkoFFSEkIGy2uTUko0=;
        b=LJHVxy324wNQxgX55Gt9aTASOCpI65EWr/0EP96SEwBWq3LeBaNVnLGDVAsq5VmZ7J
         jmafQK7fKjbsN20hG8uHPAsinF3gFbo6M2Gn9Z3QnFGnawTEvvAKe92WK8wYfBVmU6CW
         No6bDOaxY+qNb0hRKuq3Aw3CdZdsIZe3lasTRcE3Xm+VtU6GgNCC015407JiCisw9rto
         8eoi+K/gtn+MHeitdmO2x6qVQzFCgJ2vGuKwdK6VyrufXnNIZHWQCkz5gVyWxbHQJKxS
         6RJ9LLze3dmYjWQydAUkKHgzWK8/NAZ9OJK+YNMbd2EzYdHSddxXTR79CClsVWliiomv
         KtNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738585138; x=1739189938;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vQ0bIWQ9q6zEM/5sxJXyhS9znYkoFFSEkIGy2uTUko0=;
        b=Q4tW3V81k5rWCTF3jF/6ptR47xF0tKn5DZxlUGE3ZQOed+VHJceQKTOOHMmJvUIJan
         EaoFgKTCG+Vt7FxMd1l+efoSiIeTrHOarKarNSqKMDR5IN2H96x9NUCZLlURCvlAEXJe
         JVNSWtruBUv42hSC6GmT/fRQALSbhch4VBbuAubYa6zJhWqyP00W1U/HeGJ+o51jDVV5
         PXwjJlU6XIJ8EJjQYqBjSPFieveGuoTUlFVTsH7O1b0T3qA2lMgSlz3K+jWhBVlcbQlY
         MQoCRWiCThEKHKI/HjYQadVXMIyujAvQPlJ1eTJWxOlyG4sEctrDV0f6l+FhztAlZsZ7
         pPhg==
X-Forwarded-Encrypted: i=1; AJvYcCWC/PXXtR5i2Q4Bgg9TPxBi5+ufzTPIlPQ0u3jCoMEWfINPRfvAqvQ6K61Du0sM74nHLpMqAUE0a2X3@vger.kernel.org, AJvYcCWUMNNP3KqL3knHHmpq/BH/yezArveyBhEu2PxSCiaxvf6c3i/Eey4KL+fOVw1nRBAe9s4xUNzmC+UmOI0R@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2XAO5FRbJiHdSqdp4HeKHpywsTcgf+oZoQ6bvTDdsw16tZIGU
	Sg4+Awr+oWJCkWD++513wSJyI6H4Jo7lYE5Tp8il+SmlgVicDEsa
X-Gm-Gg: ASbGncv7n1khIYfYFR6VsHrdd1EoQuagDWdBUU513utFR3jLHLOQnufM8MWfnEVSxU1
	hamt0SddTpplP7jdr9yqFcrjogK4XjME9TzmfsubI9eY92HGrtVe7zORECn0E6yTt5meV1RpH3E
	pvOga7ACKupXvE40Qo19p9qv3wi42N2KOz48dHjoXHddgNd2zTyyJcxOBDIwP5XrWUSFhDqrw1K
	Ll5X9zjF1zSHZB5eCTBOsbvzkgBydIa8TRur7ARrgU0qJMeb0F2uZfKeGKAvSdQ5pySgu9vF9vx
	cv4OqKcHWf+09ea/
X-Google-Smtp-Source: AGHT+IFFymEkMEGgrkjU7zGyOQqWTVsUSLUR/9aihtoecd2Y1Z2PQnMwmmui1qhml39JCWlRaPhsIA==
X-Received: by 2002:a17:90b:2f0d:b0:2f6:dcc9:38e0 with SMTP id 98e67ed59e1d1-2f83aa7cfcdmr39474128a91.0.1738585138321;
        Mon, 03 Feb 2025 04:18:58 -0800 (PST)
Received: from nick-mbp.. ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-2f8489aefc4sm8789225a91.12.2025.02.03.04.18.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 04:18:57 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
To: Hector Martin <marcan@marcan.st>,
	Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Nick Chan <towinchenmi@gmail.com>
Subject: [PATCH v7 RESEND 00/11] Add PMGR nodes for Apple A7-A11, T2 SoCs
Date: Mon,  3 Feb 2025 20:15:44 +0800
Message-ID: <20250203121831.36053-1-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds the PMGR nodes and all known power state subnodes for
Apple A7-A11, T2 SoCs, along with the associated dt-bindings.

Dependencies:
- Split s8000/s8003 SoC DTS files
https://lore.kernel.org/asahi/20250203113949.14760-1-towinchenmi@gmail.com/T

- Device Tree for Apple T2 (T8012) devices.
https://lore.kernel.org/asahi/20250203114417.16453-1-towinchenmi@gmail.com/T

Changes since v6:
- Now arch/arm64/boot/dts/apple/s800-0-3.dtsi builds, somehow this went
under the radar this whole time...

Link to v6: https://lore.kernel.org/asahi/20241222173750.148071-2-towinchenmi@gmail.com/T

Changes since v5:
- Rebase the series such that splitting s8000/s8003 device trees is the
first patch to be applied. Now this series depends on Apple A9 device
tree being split, and the T2 SoC PMGR nodes are added in this series.

Link to v5: https://lore.kernel.org/asahi/20241203050640.109378-1-towinchenmi@gmail.com/T

Changes since v4:
- Use imperative mood in commit messages.

Link to v4: https://lore.kernel.org/asahi/20241201161942.36027-1-towinchenmi@gmail.com/T

Changes since v3:
- Add "apple,always-on" property to "ps_spmi" in t8015 power domains.
This is required for cpufreq to function correctly which will be added
in a later series.

Link to v3: https://lore.kernel.org/asahi/20241122095136.35046-1-towinchenmi@gmail.com/T

Changes since v2:
- Removed "apple,always-on" property from "ps_pmp" from s8001, t8011,
t8015 power domains. It is not on at boot. (Mixed up with ps_pms which
is required to be on)
- Add asahi-soc/dt back into the subject prefix, missing from v2.

Link to v2: https://lore.kernel.org/asahi/20241102011004.59339-1-towinchenmi@gmail.com/T

Changes since v1:
- Removed "framebuffer0" dt aliases. It is not standard and not needed.

Link to v1: https://lore.kernel.org/asahi/20241029010526.42052-1-towinchenmi@gmail.com/T

Nick Chan
---

Nick Chan (11):
  dt-bindings: arm: apple: apple,pmgr: Add A7-A11, T2 compatibles
  dt-bindings: arm: apple: apple,pmgr-pwrstate: Add A7-A11, T2
    compatibles
  arm64: dts: apple: s5l8960x: Add PMGR node
  arm64: dts: apple: t7000: Add PMGR node
  arm64: dts: apple: t7001: Add PMGR node
  arm64: dts: apple: s800-0-3: Add PMGR nodes
  arm64: dts: apple: s8001: Add PMGR nodes
  arm64: dts: apple: t8010: Add PMGR nodes
  arm64: dts: apple: t8011: Add PMGR nodes
  arm64: dts: apple: t8012: Add PMGR nodes
  arm64: dts: apple: t8015: Add PMGR nodes

 .../bindings/arm/apple/apple,pmgr.yaml        |   5 +
 .../bindings/power/apple,pmgr-pwrstate.yaml   |   5 +
 arch/arm64/boot/dts/apple/s5l8960x-5s.dtsi    |   4 +
 arch/arm64/boot/dts/apple/s5l8960x-air1.dtsi  |   4 +
 arch/arm64/boot/dts/apple/s5l8960x-mini2.dtsi |   4 +
 arch/arm64/boot/dts/apple/s5l8960x-pmgr.dtsi  | 610 ++++++++++++
 arch/arm64/boot/dts/apple/s5l8960x.dtsi       |  13 +
 arch/arm64/boot/dts/apple/s800-0-3-pmgr.dtsi  | 757 ++++++++++++++
 arch/arm64/boot/dts/apple/s800-0-3.dtsi       |  22 +
 arch/arm64/boot/dts/apple/s8001-common.dtsi   |   1 +
 .../arm64/boot/dts/apple/s8001-j98a-j99a.dtsi |  26 +
 arch/arm64/boot/dts/apple/s8001-j98a.dts      |   1 +
 arch/arm64/boot/dts/apple/s8001-j99a.dts      |   1 +
 arch/arm64/boot/dts/apple/s8001-pmgr.dtsi     | 822 ++++++++++++++++
 arch/arm64/boot/dts/apple/s8001.dtsi          |  22 +
 arch/arm64/boot/dts/apple/s800x-6s.dtsi       |   4 +
 arch/arm64/boot/dts/apple/s800x-ipad5.dtsi    |   4 +
 arch/arm64/boot/dts/apple/s800x-se.dtsi       |   4 +
 arch/arm64/boot/dts/apple/t7000-6.dtsi        |   4 +
 arch/arm64/boot/dts/apple/t7000-j42d.dts      |   1 +
 arch/arm64/boot/dts/apple/t7000-mini4.dtsi    |   4 +
 arch/arm64/boot/dts/apple/t7000-n102.dts      |   4 +
 arch/arm64/boot/dts/apple/t7000-pmgr.dtsi     | 641 ++++++++++++
 arch/arm64/boot/dts/apple/t7000.dtsi          |  14 +
 arch/arm64/boot/dts/apple/t7001-air2.dtsi     |   1 +
 arch/arm64/boot/dts/apple/t7001-pmgr.dtsi     | 650 ++++++++++++
 arch/arm64/boot/dts/apple/t7001.dtsi          |  13 +
 arch/arm64/boot/dts/apple/t8010-7.dtsi        |   4 +
 arch/arm64/boot/dts/apple/t8010-ipad6.dtsi    |   4 +
 arch/arm64/boot/dts/apple/t8010-n112.dts      |   4 +
 arch/arm64/boot/dts/apple/t8010-pmgr.dtsi     | 772 +++++++++++++++
 arch/arm64/boot/dts/apple/t8010.dtsi          |  22 +
 arch/arm64/boot/dts/apple/t8011-common.dtsi   |   1 +
 arch/arm64/boot/dts/apple/t8011-pmgr.dtsi     | 806 +++++++++++++++
 arch/arm64/boot/dts/apple/t8011-pro2.dtsi     |   8 +
 arch/arm64/boot/dts/apple/t8011.dtsi          |  22 +
 arch/arm64/boot/dts/apple/t8012-pmgr.dtsi     | 837 ++++++++++++++++
 arch/arm64/boot/dts/apple/t8012-touchbar.dtsi |   1 +
 arch/arm64/boot/dts/apple/t8012.dtsi          |  22 +
 arch/arm64/boot/dts/apple/t8015-common.dtsi   |   1 +
 arch/arm64/boot/dts/apple/t8015-pmgr.dtsi     | 931 ++++++++++++++++++
 arch/arm64/boot/dts/apple/t8015.dtsi          |  21 +
 42 files changed, 7097 insertions(+)
 create mode 100644 arch/arm64/boot/dts/apple/s5l8960x-pmgr.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/s800-0-3-pmgr.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/s8001-j98a-j99a.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/s8001-pmgr.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/t7000-pmgr.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/t7001-pmgr.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/t8010-pmgr.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/t8011-pmgr.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/t8012-pmgr.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/t8015-pmgr.dtsi


base-commit: 146773acdbf5afd40b0faf7383061a95adee8a2f
-- 
2.48.1

