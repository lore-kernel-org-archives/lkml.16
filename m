Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 915F62B9A9
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 17:16:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747761382; cv=none; b=k7UULdN/g1isVKT4aHnD3wtKjmwsfTev+l+547xjtNuZR+UqYZo1BOW/SvkaqaLHocN2p8Z+GQopBTtdvbi1etsuwN/EDVUGQSR1czMFyUW+r4TiOqz5/L5u8u9ifHN5qgAutPx3oyz2IwnjtTn+WqlWLNCgjkwVsix7IMP9p0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747761382; c=relaxed/simple;
	bh=Hhv5fquzljXQOb7qNhcyrnD4iPULEy7d9ZIL25JtaHE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QASD272btkhlIYE38bShj38qr8P5PHHRqNS0G8cnTQro4rg6fUMxG5DsNUuZF+KYZ5sZiIpnlPckdyHOpfFQyv984RZom0a1o52OZTsiIw5gfxv53p7bqAH+KJcZdq1ovWXXgXZEyjLIAaFS7jtBe3rVa2OhF/VCk66y6X1odFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rFY5+w0f; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rFY5+w0f"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43d0618746bso47502655e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 10:16:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747761378; x=1748366178; darn=vger.kernel.org;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Kp2k/si18WbmFO+LkSod6QM6cscGLD0T1g20W7ThRR0=;
        b=rFY5+w0fPOtu7MRrBtVAcRMvG6vLLJi1fKyUV/kW0bDQ+6qmxmKJAYZ5Uu2KuvdDfo
         OaFiGWLLh8sjngBMqcg75LKOFptsqeLa2eEUTco1pO2XvA0mY2yWALgaSJ+E32BKUWhC
         mtmr+jZNWhgU7cpsn2aeHLx0sY7QC/zi2tgUHHjSbUfhctWKloNAtq+Q4DMcKepbwcW5
         ZK24uxBSZI3tJ4WRdaj2pfMrOTk4BRVBDTsomXOE4CQU6BC7wC9YmVXtFr6CmVDnORXh
         7Wbg9b9AuCDapPgk4GWsdqLBrf+7EsubV7JeSb9j/hm44v9WdZMPVBfscsWh5pdpOwzv
         C3Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747761378; x=1748366178;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Kp2k/si18WbmFO+LkSod6QM6cscGLD0T1g20W7ThRR0=;
        b=AhCMkldkDHCXBIcw+fZiPfqGctzIcwR69+FThexvI7C4hinIkHn7sDPPg4Exk+wCK6
         RIyuKXWO1P6/SfjMQzVtGBH9OL1vJIcoGI7yI/opTAJ+Ytp99DgOy09Rdwp9F2FNGtIz
         qO+LQobF4VDo2LjB85FVpIRjC91ejZ0/7DXYkaq/Zabgs3NDBQ5wK3i72xTRb3C768RN
         1rLUYCwTvLbpvYmP6JNvtdcmPMDsuwJAT9EA+C2CLxcdcj6GU2NNjFlXdnHJqxmkiFeW
         B2Sw7L11c7tZA7QN8N0H+ZkKDxrRPjrwh7JbnoKkT1fV4uHiSe9HFzxtq+TkTlkq4T5C
         aCSQ==
X-Forwarded-Encrypted: i=1; AJvYcCWfRd1L1NPmhiyOU+FaPxTZyd02sUpYsIOebnQattBMY3VSVnJxFGBC+dPnfU3M2AeySI/rHyWcvKtES9w=@vger.kernel.org
X-Gm-Message-State: AOJu0YyN2l212lNTqRNRKiQLW6dgbRld4ATrxkLwr9qV+NlnfKE9qc49
	73IYvGKuRvHRwYAgaKaZe55Tq+MJHM8/malRBc3LZ7qqfyqYx/ozEv4uBLKOvgs1LN8=
X-Gm-Gg: ASbGncvh5BunaVYa+i/+8rYl/6sjtGD0Z2YvAFKYcdDuoUZs229Nwch27bAkgsZutE9
	vkZ6+x1U+vMIsBBV0ufecppJg3KVq4z8VnfixO0K51vmq4iqb3XaSaAjTxyiDMy3/mV0tjBCAbB
	s6ImXMKqrBO0O320nvRVr0b329I+6C8JSzyi/Y/oLRkD3Ixhr/KGocPdJBG8UAd4dR/+QcKHwRk
	CD2OM8uOl99DnJppwOAHjSv8z6zhGgsAXS2liE2cMTBNZeqhZkLTGQXVde9QZ+kkaiWO5//18hF
	S1FnC7z6r6uX43WVgbdgiey2JUj+XQ3SaKnUZovkRsiAcoTww8UxqmOFNtSy9SQbcytO8zqRJuz
	sGiiPaOhSMKMzig==
X-Google-Smtp-Source: AGHT+IFDCxqbOwiqbDUivShw50Gjiul7V5jK8CSfuTWmrdpn//kYJgzQFbyVkjYqLlv6IavGJrFl2Q==
X-Received: by 2002:a05:600c:1c16:b0:43c:fd27:a216 with SMTP id 5b1f17b1804b1-442ff029e12mr134257535e9.23.1747761377737;
        Tue, 20 May 2025 10:16:17 -0700 (PDT)
Received: from mai.linaro.org (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a35ca5aba3sm16720031f8f.40.2025.05.20.10.16.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 10:16:17 -0700 (PDT)
Date: Tue, 20 May 2025 19:16:15 +0200
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: daniel.lezcano@linaro.org, robh@kernel.org,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	darshan.prajapati@einfochips.com, cjd@cjdns.fr, inochiama@gmail.com,
	robelin@nvidia.com, pohsuns@nvidia.com, j.ne@posteo.net,
	arnd@arndb.de, linux-kernel@vger.kernel.org
Subject: [GIT PULL] Timer drivers for v6.16-rc1
Message-ID: <aCy43_obHEdIpwWg@mai.linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hi Thomas,

the timer drivers repository has moved to git.kernel.org. The link
below is unchanged on purpose assuming you have permission to 'ssh'
to the server.

Please consider pulling the following changes since commit
0af2f6be1b4281385b618cb86ad946eded089ac8:

  Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)

are available in the Git repository at:

  ssh://git@gitolite.kernel.org/pub/scm/linux/kernel/git/daniel.lezcano/linux tags/timers-v6.16-rc1

for you to fetch changes up to d204e391a0d83d73fc312e71fc62896c4d8bae79:

  clocksource/drivers/renesas-ostm: Unconditionally enable reprobe support (2025-05-16 13:33:11 +0200)

----------------------------------------------------------------
- Add the System Timer Module driver for the S32G NXP platforms
  (Daniel Lezcano)

- Convert the remaining text formatted DT bindings in schemas (Rob
  Herring)

- Fix a Kconfig dependency on the atmel TCB driver to prevent a
  compilation warning when CONFIG_OF is disabled (Arnd Bergmann)

- Fix self-pinging and support gettimeleft in the watchdog part of the tegra186
  timer (Pohsun Su)

- Add the Sophgo SG2044 ACLINT timer binding (Inochi Amaoto)

- Add the EcoNet Timer HPT driver along with the DT bindings (Caleb
  James DeLisle)

- Add the Renesas R9A09G056 compatible string bindings and enable
  reprobe support on the Renesas OSTM (Lab Prabhakar)

----------------------------------------------------------------
Arnd Bergmann (1):
      clocksource/drivers/atmel_tcb: Fix kconfig dependency

Caleb James DeLisle (2):
      dt-bindings: timer: Add EcoNet EN751221 "HPT" CPU Timer
      clocksource/drivers: Add EcoNet Timer HPT driver

Daniel Lezcano (2):
      dt-bindings: timer: Add NXP System Timer Module
      clocksource/drivers/nxp-timer: Add the System Timer Module for the s32gx platforms

Darshan Prajapati (1):
      dt-bindings: timer: Add ESWIN EIC7700 CLINT

Inochi Amaoto (1):
      dt-bindings: timer: Add Sophgo SG2044 ACLINT timer

J. Neuschäfer (1):
      dt-bindings: timer: Convert fsl,gtm to YAML

Lad Prabhakar (2):
      dt-bindings: timer: renesas,ostm: Document RZ/V2N (R9A09G056) support
      clocksource/drivers/renesas-ostm: Unconditionally enable reprobe support

Pohsun Su (2):
      clocksource/drivers/timer-tegra186: Add WDIOC_GETTIMELEFT support
      clocksource/drivers/timer-tegra186: Fix watchdog self-pinging

Rob Herring (Arm) (18):
      dt-bindings: timer: Convert marvell,orion-timer to DT schema
      dt-bindings: timer: Convert csky,mptimer to DT schema
      dt-bindings: timer: Convert csky,gx6605s-timer to DT schema
      dt-bindings: timer: Convert cnxt,cx92755-timer to DT schema
      dt-bindings: timer: Convert arm,mps2-timer to DT schema
      dt-bindings: timer: Convert altr,timer-1.0 to DT schema
      dt-bindings: timer: Convert cirrus,clps711x-timer to DT schema
      dt-bindings: timer: Convert ezchip,nps400-timer to DT schema
      dt-bindings: timer: Convert img,pistachio-gptimer to DT schema
      dt-bindings: timer: Convert jcore,pit to DT schema
      dt-bindings: timer: Convert lsi,zevio-timer to DT schema
      dt-bindings: timer: Convert snps,archs-gfrc to DT schema
      dt-bindings: timer: Convert snps,archs-rtc to DT schema
      dt-bindings: timer: Convert snps,arc-timer to DT schema
      dt-bindings: timer: Convert socionext,milbeaut-timer to DT schema
      dt-bindings: timer: Convert st,spear-timer to DT schema
      dt-bindings: timer: Convert ti,keystone-timer to DT schema
      dt-bindings: timer: Convert marvell,armada-370-timer to DT schema

robelin (1):
      clocksource/drivers/timer-tegra186: Remove unused bits

 .../devicetree/bindings/timer/altr,timer-1.0.txt   |  18 -
 .../devicetree/bindings/timer/altr,timer-1.0.yaml  |  39 ++
 .../devicetree/bindings/timer/arm,mps2-timer.txt   |  28 --
 .../devicetree/bindings/timer/arm,mps2-timer.yaml  |  49 ++
 .../bindings/timer/cirrus,clps711x-timer.txt       |  29 --
 .../bindings/timer/cirrus,clps711x-timer.yaml      |  45 ++
 .../bindings/timer/cnxt,cx92755-timer.yaml         |  49 ++
 .../bindings/timer/csky,gx6605s-timer.txt          |  42 --
 .../bindings/timer/csky,gx6605s-timer.yaml         |  40 ++
 .../devicetree/bindings/timer/csky,mptimer.txt     |  42 --
 .../devicetree/bindings/timer/csky,mptimer.yaml    |  46 ++
 .../devicetree/bindings/timer/digicolor-timer.txt  |  18 -
 .../bindings/timer/econet,en751221-timer.yaml      |  80 ++++
 .../bindings/timer/ezchip,nps400-timer.yaml        |  45 ++
 .../bindings/timer/ezchip,nps400-timer0.txt        |  17 -
 .../bindings/timer/ezchip,nps400-timer1.txt        |  15 -
 .../devicetree/bindings/timer/fsl,gtm.txt          |  30 --
 .../devicetree/bindings/timer/fsl,gtm.yaml         |  83 ++++
 .../bindings/timer/img,pistachio-gptimer.txt       |  28 --
 .../bindings/timer/img,pistachio-gptimer.yaml      |  69 +++
 .../devicetree/bindings/timer/jcore,pit.txt        |  24 -
 .../devicetree/bindings/timer/jcore,pit.yaml       |  43 ++
 .../devicetree/bindings/timer/lsi,zevio-timer.txt  |  33 --
 .../devicetree/bindings/timer/lsi,zevio-timer.yaml |  56 +++
 .../bindings/timer/marvell,armada-370-timer.yaml   |  88 ++++
 .../bindings/timer/marvell,armada-370-xp-timer.txt |  44 --
 .../bindings/timer/marvell,orion-timer.txt         |  16 -
 .../bindings/timer/marvell,orion-timer.yaml        |  43 ++
 .../devicetree/bindings/timer/nxp,s32g2-stm.yaml   |  64 +++
 .../devicetree/bindings/timer/renesas,ostm.yaml    |  12 +-
 .../devicetree/bindings/timer/sifive,clint.yaml    |   1 +
 .../devicetree/bindings/timer/snps,arc-timer.txt   |  27 --
 .../devicetree/bindings/timer/snps,arc-timer.yaml  |  45 ++
 .../devicetree/bindings/timer/snps,archs-gfrc.txt  |  14 -
 .../devicetree/bindings/timer/snps,archs-gfrc.yaml |  30 ++
 .../devicetree/bindings/timer/snps,archs-rtc.txt   |  14 -
 .../devicetree/bindings/timer/snps,archs-rtc.yaml  |  30 ++
 .../bindings/timer/socionext,milbeaut-timer.txt    |  17 -
 .../bindings/timer/socionext,milbeaut-timer.yaml   |  40 ++
 .../devicetree/bindings/timer/st,spear-timer.txt   |  16 -
 .../devicetree/bindings/timer/st,spear-timer.yaml  |  36 ++
 .../bindings/timer/thead,c900-aclint-mtimer.yaml   |   1 +
 .../bindings/timer/ti,keystone-timer.txt           |  29 --
 .../bindings/timer/ti,keystone-timer.yaml          |  63 +++
 drivers/clocksource/Kconfig                        |  20 +-
 drivers/clocksource/Makefile                       |   2 +
 drivers/clocksource/renesas-ostm.c                 |   4 +-
 drivers/clocksource/timer-econet-en751221.c        | 216 +++++++++
 drivers/clocksource/timer-nxp-stm.c                | 495 +++++++++++++++++++++
 drivers/clocksource/timer-tegra186.c               | 100 +++--
 50 files changed, 1886 insertions(+), 549 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/timer/altr,timer-1.0.txt
 create mode 100644 Documentation/devicetree/bindings/timer/altr,timer-1.0.yaml
 delete mode 100644 Documentation/devicetree/bindings/timer/arm,mps2-timer.txt
 create mode 100644 Documentation/devicetree/bindings/timer/arm,mps2-timer.yaml
 delete mode 100644 Documentation/devicetree/bindings/timer/cirrus,clps711x-timer.txt
 create mode 100644 Documentation/devicetree/bindings/timer/cirrus,clps711x-timer.yaml
 create mode 100644 Documentation/devicetree/bindings/timer/cnxt,cx92755-timer.yaml
 delete mode 100644 Documentation/devicetree/bindings/timer/csky,gx6605s-timer.txt
 create mode 100644 Documentation/devicetree/bindings/timer/csky,gx6605s-timer.yaml
 delete mode 100644 Documentation/devicetree/bindings/timer/csky,mptimer.txt
 create mode 100644 Documentation/devicetree/bindings/timer/csky,mptimer.yaml
 delete mode 100644 Documentation/devicetree/bindings/timer/digicolor-timer.txt
 create mode 100644 Documentation/devicetree/bindings/timer/econet,en751221-timer.yaml
 create mode 100644 Documentation/devicetree/bindings/timer/ezchip,nps400-timer.yaml
 delete mode 100644 Documentation/devicetree/bindings/timer/ezchip,nps400-timer0.txt
 delete mode 100644 Documentation/devicetree/bindings/timer/ezchip,nps400-timer1.txt
 delete mode 100644 Documentation/devicetree/bindings/timer/fsl,gtm.txt
 create mode 100644 Documentation/devicetree/bindings/timer/fsl,gtm.yaml
 delete mode 100644 Documentation/devicetree/bindings/timer/img,pistachio-gptimer.txt
 create mode 100644 Documentation/devicetree/bindings/timer/img,pistachio-gptimer.yaml
 delete mode 100644 Documentation/devicetree/bindings/timer/jcore,pit.txt
 create mode 100644 Documentation/devicetree/bindings/timer/jcore,pit.yaml
 delete mode 100644 Documentation/devicetree/bindings/timer/lsi,zevio-timer.txt
 create mode 100644 Documentation/devicetree/bindings/timer/lsi,zevio-timer.yaml
 create mode 100644 Documentation/devicetree/bindings/timer/marvell,armada-370-timer.yaml
 delete mode 100644 Documentation/devicetree/bindings/timer/marvell,armada-370-xp-timer.txt
 delete mode 100644 Documentation/devicetree/bindings/timer/marvell,orion-timer.txt
 create mode 100644 Documentation/devicetree/bindings/timer/marvell,orion-timer.yaml
 create mode 100644 Documentation/devicetree/bindings/timer/nxp,s32g2-stm.yaml
 delete mode 100644 Documentation/devicetree/bindings/timer/snps,arc-timer.txt
 create mode 100644 Documentation/devicetree/bindings/timer/snps,arc-timer.yaml
 delete mode 100644 Documentation/devicetree/bindings/timer/snps,archs-gfrc.txt
 create mode 100644 Documentation/devicetree/bindings/timer/snps,archs-gfrc.yaml
 delete mode 100644 Documentation/devicetree/bindings/timer/snps,archs-rtc.txt
 create mode 100644 Documentation/devicetree/bindings/timer/snps,archs-rtc.yaml
 delete mode 100644 Documentation/devicetree/bindings/timer/socionext,milbeaut-timer.txt
 create mode 100644 Documentation/devicetree/bindings/timer/socionext,milbeaut-timer.yaml
 delete mode 100644 Documentation/devicetree/bindings/timer/st,spear-timer.txt
 create mode 100644 Documentation/devicetree/bindings/timer/st,spear-timer.yaml
 delete mode 100644 Documentation/devicetree/bindings/timer/ti,keystone-timer.txt
 create mode 100644 Documentation/devicetree/bindings/timer/ti,keystone-timer.yaml
 create mode 100644 drivers/clocksource/timer-econet-en751221.c
 create mode 100644 drivers/clocksource/timer-nxp-stm.c

-- 

 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
