Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6D282DCBE2
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 11:41:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749814917; cv=none; b=C18BWftBhm/fyscpppGU36Ezn40+GqRwQnT3Fp/vIjGptPDODbuDTg3j28wu1g3JMM2zzR0mOOsjvS2qHEZkfFGBvqttc6Mx9s2eK5N++wipqNIU/lwoRQUrilOODLnCPCo6QmZIOnTe7enxL/AQ6elL+bkBd8rhgyDb53iI8B4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749814917; c=relaxed/simple;
	bh=Xu9/tBx7J9HDSStwJKx4qcuH0x0i4S5UUTdM0NWoFms=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mvM+rCutBuKs1JNsT3zS6yd8YwTisuYBmX3nflAByJ3s9qihzAA5gdyyGqmiQzTJ3fb2jDj6mv2X2m7AlKOibF1qBQd9M0PAPnSCm204xjQ93QdWKF/kBnG76Zjny/rqyyhjt9cc11BvYeqKYTLSYRhBX+riPQczyubqzwUAtOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr; spf=pass smtp.mailfrom=sartura.hr; dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b=vCaZPppF; arc=none smtp.client-ip=209.85.219.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b="vCaZPppF"
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-6facf4d8e9eso21444696d6.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 04:41:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1749814915; x=1750419715; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IO9Rd2HFTD+1YUfAySkfEq/dcEm2RB+c5PiJqcKqYFw=;
        b=vCaZPppFKldwMOpfY9qwXMyXK2n63c4Y3wPPdUCkD/NsZWDSzWPhcMrXiaMn397fQK
         lpnhZ7mzLivt8EIJyBy6XjV4oMyqIL0XCtWdsgk31eJdw+AOufwlLY+480r64Su+xOMU
         1738ZjQi87AJ6UGtfhqX3hP7zeSo7D72mgGlpsV/qQ+a52flJbbDe2ec/U8Fl/ZB5y5k
         TvXr0njPK4Emygrhl/JeatCHrJgo/c8q6yZ/vAbtZsu7HM+kaR+7wOT2RRnvkc1PLBbZ
         siE5NBO4GzqM+8O1l2XfaB/uQ2c42VI7ShrVgPFbk74bFmCnyXa+5PDGEhQ5hyHhP87+
         ETiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749814915; x=1750419715;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IO9Rd2HFTD+1YUfAySkfEq/dcEm2RB+c5PiJqcKqYFw=;
        b=OFCuwSxB+4HUm9L5g+giNIBq9uqmPKh8qMB7VkmlJsxOZgjybzU6Y4v9cwDLBobQqM
         DnDD7J59p1wNm9YMc7b+KIwH83+5UrYW/qb/I1NEJs9B8twtp4dtEZe7QkkQJj8haTyv
         UVra7ZekDdrcHurK3Z/E6qMgsGmYOWsO8hhQgKaM8syjouZNH5eY4/M41T6vbo4VnXry
         6SF7XkzBp63rOfH+azCPyj2CtwMCgmCAPja0PBT/8a8nEOwzMEBYipLLJm46pqZSAcDL
         poHUL9GOTnOWbe6SKpPVgByL9R12+j44msBpM93AcA4jNFMem0KVUGnbyrNgxk27J3Si
         r2fg==
X-Forwarded-Encrypted: i=1; AJvYcCW2RrqzFXV65J4k80MYKexByLntUWJ3kXsmm5JSbab2Ydel08wRIau08koAGX9Xu6xMoYzRHaF4vN09bjk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxskiCnz7s9ZllY95es9TlEa647MNgjSuR/u0bV4umRRZccfPtu
	aNmOcducyjT/Ji8ptzjyhU5h5+pjzhGWn2zFFpU4j6Re9rUbBD8RUxEnqIJMpYCnfyYAsepB+Jr
	GzMyg
X-Gm-Gg: ASbGncscqsgw+C3pBbHEa02ssVt9yL4NdohtqW85J8COp0hg6nSajoVOcYY1dFF/pSU
	M945h+8ZMeaL/m5wl3uNOalCbb7hKwsKBWRXBbUGA1RcYJNXPv6P6FWdaf1ZimDwmWXI8ZlJ1+8
	cX/35xg1YeCy8CHRtB2ZUQA5lTF+eeS5bB7IuYyL2W/QvxB4hzujfhFRpdGcR62x63oIAuQtZKK
	o6/Xwyaf20uBnQmfFyw4JCkPME8WJLQetPzlHTZJq/ztDlA/iwCD8XuoxVSNPAOcFSx3EcK8SwS
	4Z7uw9AB2ChnOGQRhbl76Y9N98HhvfnqZkZboAT3OcTnDeWP5nJ2f20IUCmRCcJE8OjBlK+96/S
	35UygbgTuCwtRM1dBMzXWnJPmVjWZIBLc
X-Google-Smtp-Source: AGHT+IEc5wMP8ofTZTO6iGwnPV4OsQNdZGNQL5zwacGNvbNKtJCkrAxEGOyHCjmYXgP1YxiBm+lShw==
X-Received: by 2002:a05:6214:2344:b0:6f5:106a:270e with SMTP id 6a1803df08f44-6fb3e60bc99mr35271836d6.44.1749814914668;
        Fri, 13 Jun 2025 04:41:54 -0700 (PDT)
Received: from fedora.. (cpe-109-60-82-18.zg3.cable.xnet.hr. [109.60.82.18])
        by smtp.googlemail.com with ESMTPSA id 6a1803df08f44-6fb35b3058fsm20558206d6.37.2025.06.13.04.41.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jun 2025 04:41:54 -0700 (PDT)
From: Robert Marko <robert.marko@sartura.hr>
To: catalin.marinas@arm.com,
	will@kernel.org,
	olivia@selenic.com,
	herbert@gondor.apana.org.au,
	davem@davemloft.net,
	vkoul@kernel.org,
	andi.shyti@kernel.org,
	broonie@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	dmaengine@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-spi@vger.kernel.org,
	kernel@pengutronix.de,
	ore@pengutronix.de,
	luka.perkov@sartura.hr,
	arnd@arndb.de,
	daniel.machon@microchip.com
Cc: Robert Marko <robert.marko@sartura.hr>
Subject: [PATCH v7 0/6] arm64: lan969x: Add support for Microchip LAN969x SoC
Date: Fri, 13 Jun 2025 13:39:35 +0200
Message-ID: <20250613114148.1943267-1-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series adds basic support for Microchip LAN969x SoC.

It introduces the SoC ARCH symbol itself and allows basic peripheral
drivers that are currently marked only for AT91 to be also selected for
LAN969x.

DTS and further driver will be added in follow-up series.

Robert Marko (6):
  arm64: lan969x: Add support for Microchip LAN969x SoC
  spi: atmel: make it selectable for ARCH_LAN969X
  i2c: at91: make it selectable for ARCH_LAN969X
  dma: xdmac: make it selectable for ARCH_LAN969X
  char: hw_random: atmel: make it selectable for ARCH_LAN969X
  crypto: atmel-aes: make it selectable for ARCH_LAN969X

 arch/arm64/Kconfig.platforms   | 14 ++++++++++++++
 drivers/char/hw_random/Kconfig |  2 +-
 drivers/crypto/Kconfig         |  2 +-
 drivers/dma/Kconfig            |  2 +-
 drivers/i2c/busses/Kconfig     |  2 +-
 drivers/spi/Kconfig            |  2 +-
 6 files changed, 19 insertions(+), 5 deletions(-)

-- 
2.49.0

