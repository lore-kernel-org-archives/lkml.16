Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2958E29617E
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 17:59:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745344784; cv=none; b=WEBy+Eckgil6R9KVXeO89HcuSZPU+E7+T5H9WZKho0QJ5gjaXBQ9689h929QOIYT2Zmzqe2hwpXYlX+dmMzLe3HrkgTZl2A53KDg8mTLKzvPbloIOx1a1FIbCQ8qRsl0bWMp73gpsIcdMJWEpdaouFemxScvSfvRv5/9LyFbWNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745344784; c=relaxed/simple;
	bh=NGXz1/C84LouGjqEw3CBsAoV1AGsU6iLIRZzXDV0zJU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=m8Q+HV5GQfWfBdsOTLJse0uecVyzVm74lugZz4EupVypy2C9eSYDUixlzU49t0qyE9mTVkaNgMkNkRCnOAohFOL1PU0TNfKAODUnXkpULXecosTbiZNENidCtpXCj3pnxT6N/P+QejWP0bKUhXlVto/VIpg2FV9sZiF/eN9ZlaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=conclusive.pl; spf=pass smtp.mailfrom=conclusive.pl; dkim=pass (2048-bit key) header.d=conclusive.pl header.i=@conclusive.pl header.b=iiAapg8g; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=conclusive.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=conclusive.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=conclusive.pl header.i=@conclusive.pl header.b="iiAapg8g"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-ac3eb3fdd2eso938871266b.0
        for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 10:59:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=conclusive.pl; s=google; t=1745344779; x=1745949579; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5vmDFRe336F7jeHxUtjEEM738t0/3jAPa2su7mI8vUM=;
        b=iiAapg8gTmYaEpIXQTglf1KBocMYKn7RC83FIvH1jXCzMmsw+7ypb5bVE1FoGghlfK
         QlOJICsdDNtqPtEeBr9WVW4NEbJxJ9sDiuEGgfcnd+5ycCLhLtqEbAsIKOl8b4PsKZUo
         pfQGMJyoEtGzGumDkcyNLlxYQ77qsynSpoOAwZw3cWTe1oZDvEeFi3o4c0ud2UWUpJri
         fPWf1quMCOYji66tOLRujhorvS8ypPNmCniA6j6WhVk0sOmw4sOf7cLVQkRE7gy28E1W
         FaiMYW9DijHhBppbAC34SSEbkE0+g5H7LwDI45OOwEhTtgh3s9BVhrx5Fl4XG32wby5r
         Fu9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745344779; x=1745949579;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5vmDFRe336F7jeHxUtjEEM738t0/3jAPa2su7mI8vUM=;
        b=q5qUv2aJBct7DPpXDk5vQGFZgo0goGoJEcKWudVlxuae91D8vBk5vfMaXh5hS7KIG0
         3wxJzm/XAhClWgbldaGT2aEmKCbwzHIgEPRhzkQXlD8BYbgoxTCUigC550nDn8A02P1u
         CWZ4BPkSJCuQr6xPF0pWC5UfrcCHPse8G2YxV0K1L3aDMgLcKls2EfQdzVaERF3j4pf9
         MDkzdvIC+haR3q+rdK3OpzQI3EkGrLBoQAJiQB286V1SDTFcHe83+6fmPUJYIhe1F+6U
         LHMpaKUruShjca4ooEyfAfN1E2umcb/8LTEdvvaV0gY38xLVU1eiBC5Wwm/nhIygxUrv
         ywKA==
X-Forwarded-Encrypted: i=1; AJvYcCVvjf7S+/j32YHGCvYqPT7sw361FI4jR2k4mDHZCKAqxgfBYae+qITA8J4QW+GFRKWp/u/S2vBsjS2KHSU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzKotUG0L2nn28acCuJm2ls2fxMGnXipLcT7GDJ6w5Aq+1y1Ilk
	zsQzv9UqHv2i5csvyq7AQf3t+NX8zqrbxxQy7gOgJgoGah5dPLmuTIVsLTEwW5k=
X-Gm-Gg: ASbGncvc8pf/RtLjppOnNffQMTKThUo7jk9yO6UF4KiKUL0huRFVcUtaDnkdPHcQjHt
	SaIv+V4dDtX3DCFT4lDB3VGLPb61fWGM3XOIqwzsBinQakXTfpkBFzWDORg4IHP1lM4ofwgKtxK
	5igNfIKoDSyOEFobhKB6UCpDpPe6yeuerG/BRTjoVqMswfjat+sQT6E7wRpMdWWsl/NAHQF0Fdk
	WiR14KlHPr/5WOao7tOzHAGhM/PUZR7YsNz97TzR3Hhxr36nuxU+Rk47xg4mCBtLrLTZgS4QjVR
	96ijV7mE7mfDv1djDoFQFf25353NYMEJm7Hhsaz0B0KKQ3Y/VfBJi6GX9hvY5ymETA7Lus3t7XW
	j310u2sG8
X-Google-Smtp-Source: AGHT+IFuB00QPLtb3gbpigfCavyTE7nKWB/3ILqnGrcipA/uEF7A5WS0H1m/Gfrg87ZGf4Wv+vqyVA==
X-Received: by 2002:a17:907:1c0c:b0:ac2:4db0:1d22 with SMTP id a640c23a62f3a-acb74db7cffmr1265583466b.42.1745344779566;
        Tue, 22 Apr 2025 10:59:39 -0700 (PDT)
Received: from wiesia.conclusive.pl (host-89.25.128.123.static.3s.pl. [89.25.128.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acb6ef47733sm690208466b.144.2025.04.22.10.59.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 10:59:39 -0700 (PDT)
From: Artur Rojek <artur@conclusive.pl>
To: Johannes Berg <johannes@sipsolutions.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>
Cc: linux-wireless@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jakub Klama <jakub@conclusive.pl>,
	Wojciech Kloska <wojciech@conclusive.pl>,
	Ulf Axelsson <ulf.axelsson@nordicsemi.no>,
	Artur Rojek <artur@conclusive.pl>
Subject: [RFC PATCH v2 0/2] wifi: Nordic nRF70 series
Date: Tue, 22 Apr 2025 19:59:16 +0200
Message-ID: <20250422175918.585022-1-artur@conclusive.pl>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi all,

this is v2 of the Nordic nRF70 series.
The order of patches has been swapped to reflect the Device Tree
submission rules (bindings before implementation). I also replaced
the 'net: wireless:' prefix with 'wifi:' for the series, so hopefully
this time it correctly shows up in Patchwork.

Patch [1/2] now resolves all issues uncovered by dt_binding_check.
All gpio based properties have also been replaced with *-supply and
interrupts properties, where appropriate, and their usage clarified in
respective description fields.

Patch [2/2] addresses the same gpio usage concerns, now utilizing
the regulator API. Another major change is migration of
nrf7002_qfn_rf_params from being an array into a struct, in order to
better access its individual fields. All the remaining concerns from v1
have been addressed as well. 

As this is RFC, and none of my questions from v1 have been answered, I
will feature them again, while also adding a new one:

1) Nordic gave us permission to upstream the firmware blob [1] required
   to use this driver. As that needs to go through separate
   linux-firmware repository and is subject to different licensing,
   should I try to upstream it in parallel with this series, or does it
   need to wait until the kernel driver gets in? 

2) In AP mode, for each connected peer I maintain a pending queue for TX
   skbs that can't be transmitted while the peer is in power save mode.
   I then use a wiphy_work (nrf70_pending_worker) to move the collected
   skbs into a single hw queue once the peer is able to receive again.
   This means there can be multiple workers putting skbs onto the hw
   queue at any given time. As this scheme relies on the wiphy_work
   workqueue, can I assume that multiple workers will be able to run in
   parallel, even on a system with a single CPU? If not, what would be
   a better solution to the above problem?

3) nRF70 hardware communicates using byte packed, little-endian
   payloads (documented in nrf70_cmds.h). As these can get very large
   and complicated, I decided against writing some sort of endianness
   conversion scheme, and simply dropped big endian support by this
   driver. Is that acceptable?

4) Please put particular attention to the wiphy configuration. I am not
   100% confident I got all the flags/features/band caps right.

5) Should I add myself to the MAINTAINERS file regarding this driver, or
   is that not mandatory?

Cheers,
Artur

[1] https://github.com/nrfconnect/sdk-nrfxlib/raw/refs/heads/main/nrf_wifi/bin/ncs/default/nrf70.bin

Artur Rojek (2):
  dt-bindings: wifi: Add support for Nordic nRF70
  wifi: Add Nordic nRF70 series Wi-Fi driver

 .../bindings/net/wireless/nordic,nrf70.yaml   |   71 +
 drivers/net/wireless/Kconfig                  |    1 +
 drivers/net/wireless/Makefile                 |    1 +
 drivers/net/wireless/nordic/Kconfig           |   26 +
 drivers/net/wireless/nordic/Makefile          |    3 +
 drivers/net/wireless/nordic/nrf70.c           | 4703 +++++++++++++++++
 drivers/net/wireless/nordic/nrf70_cmds.h      | 1137 ++++
 drivers/net/wireless/nordic/nrf70_rf_params.h |   65 +
 8 files changed, 6007 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/wireless/nordic,nrf70.yaml
 create mode 100644 drivers/net/wireless/nordic/Kconfig
 create mode 100644 drivers/net/wireless/nordic/Makefile
 create mode 100644 drivers/net/wireless/nordic/nrf70.c
 create mode 100644 drivers/net/wireless/nordic/nrf70_cmds.h
 create mode 100644 drivers/net/wireless/nordic/nrf70_rf_params.h

-- 
2.49.0

