Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD6BE231839;
	Wed, 11 Jun 2025 08:05:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749629121; cv=none; b=TEPokdcQ/B4/ZpJV3Hk7XRIFA+q6HQ/upowM2dBQ6MPhn9k6fDx/bwphQ2GtVFfovUFzKHx5J4g9ds8TvMOAXqgbpqE3DI62KdihVnfjmB8N1xpIbea3pDAr8DfW71g1BDDWz+4HktlYQOwL8UUJSqxxFMkXBuc2hMaZLmyuZgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749629121; c=relaxed/simple;
	bh=SQl2eyv6jLz5JeUPDZu+f0mJ2UZL6D4bC62grEciy60=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=PEXlPBCEHn1rqDG72S795n1Aja8GOdadphK6iNNsQTGGgocNyUwnR8kqL3cpHgTDHMl1cCQPOfDQ6DsB4jgGB6/dZ5WE0iNgXZ+P8yDwhsc+433Ne+/XMpTXnk6NoWZUCLEshYCVeT+S32xCWoO1w+Sfxt9u+vnBFbtBwIhCUpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YchtfF3j; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YchtfF3j"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2345c60507bso44824155ad.0;
        Wed, 11 Jun 2025 01:05:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749629119; x=1750233919; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lXPMVnUwf3/EoxHQfzIlGfhIh7pfwuueI5x8/O9yKtc=;
        b=YchtfF3jmNYIn6WDFwlJ/ae4L932Jtk9Z0+tbHQdTA+fBXtI5S091UXXJ7bzM0VpMa
         wvR6REbAttQ/0YRkP+rnP79AvQZfWM+ChQPsfKvbzPbnmJZu4HDl4trtNpAWU2wGHtXN
         1bL5np1VuHPfiSh05cyJyyeA3rPL+FhxRdzjlkBbBbmqZMQYJfqWQTb7GwUhJZh3wrlD
         igFrp7o68uaH0r0WHcA4gy9sYzfcLJuZIb3X6JmjA68Wu5fEkyC0fdJ/ogkc5P/WlvUC
         8JhK9gzdVmeS5ceO5M2ivwDLS10Jvs3HYvPg5enqJXrR/08blP5LPikvTLD9fo1T0kh5
         W0QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749629119; x=1750233919;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lXPMVnUwf3/EoxHQfzIlGfhIh7pfwuueI5x8/O9yKtc=;
        b=LwRsYHXPGlqwj24ZZ6mhx66TQkA4m8KCepCushylvC6a0V2V7Z0fbawMXmbTrdtk5H
         psMqe0ex+FkY+SqUCekqQnufdMfEw9GDrPM5AiuFCCO1L2Nj6vWrcfQbi6zrm8mReqwb
         VCrdrP39xdUQyB/3t0+tUJ0sVbOS+s7P85X3gzMWAgOBBrUH30iiP9tlIodjIMkMv5dg
         LCYwqfYZLcBNTW/TxCoZvYOEA8T1omIAGxLFJKAPCvZhD892IBimBEbmmZ8fN1Yki7bu
         UE5O+lGC/RXC6xI+6XTdkWnMhwOO/PzBahp3GiX2yAu3HQdIKm59ekW3X+ytH5bLOtYz
         kBsg==
X-Forwarded-Encrypted: i=1; AJvYcCUejfQcY+Fpyef52Hzs0JbZLkr0WFcvl2mPntrdM7xZ88gtGTRJeJeWR6vTLKvZmAPjCHP6C/aN5Ha77utn@vger.kernel.org, AJvYcCV8QQvo0CZs27f6dEJ0GeyajLqDLkCnbTHgM6sx6ikAcPWqlgBJqKY1EDO5gaPW6IdgE2tGvf9adQaM@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9c7zVE4HjfVqi2gzfEyHix/+/JH6J46jHuIUVG37SHfRIKGc0
	bVA7M+9pBXTzxCoOh8POj0/yEMdt5DafL2p/iBSzSobEk2XPO7FVAVKn
X-Gm-Gg: ASbGncvm6vd2QYTAwcVAVx86s4pNsfK5vJvgbuTqH+o9FrvYcQiTRUwTm2JmjZeBYso
	i7J/udFtIWf58djv5Fcrcp0RcU64qU3nSNBCfUjaFLf7v+lx2XKYz2S8P9NxwoBdMVTXJkX1NnB
	0MEvOP0W1darcggcPcOPpLEC+2FEV002Ug9zZ2mCzDrWp08dxbvkiYkt3elRBzSirYufoTv80M9
	XKv/iK5Es1M0xfqOTxq5uWftDh+z6N0/VOcouFqAvf45aUk/HeZ8GvGuDSIuNTEigK2/Vk81INv
	i2qSIGk6I/Hh2fu8OrWRH7CImmRfF+SzwlhbpOevbBjj0wIfmvZ8XUm6MWu9k2Kd8XkmT7T8FMx
	RfPSC6BJZoWa3/fNRAn1JOZYvCXkBgycvlWLmv/dxpvzeBkarJtPsQ6eLgQmSAJJ/ror5EtnzTC
	2M9jb++JqUfWniTLPb
X-Google-Smtp-Source: AGHT+IHeguJ9PfRvFO2Sr8bPSpOlwMx9Qn9l4lODdIxgT6Z8X+BhIHgTKrD1PU4ZUCit2Tge/jE+KA==
X-Received: by 2002:a17:902:ecc1:b0:234:ed31:fc98 with SMTP id d9443c01a7336-23641b14d61mr29238475ad.37.1749629118911;
        Wed, 11 Jun 2025 01:05:18 -0700 (PDT)
Received: from localhost.localdomain (2001-b400-e357-b8a8-7759-271d-6134-9aa3.emome-ip6.hinet.net. [2001:b400:e357:b8a8:7759:271d:6134:9aa3])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2363ad90982sm21283835ad.220.2025.06.11.01.05.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 01:05:18 -0700 (PDT)
From: Peter Yin <peteryin.openbmc@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Cc: peteryin.openbmc@gmail.com
Subject: [PATCH v2 0/5] Revise Meta(Facebook) Harma BMC(AST2600)
Date: Wed, 11 Jun 2025 16:05:09 +0800
Message-Id: <20250611080514.3123335-1-peteryin.openbmc@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Summary:
Revise linux device tree entry related to Meta(Facebook) Harma
specific devices connected to BMC(AST2600) SoC.

Based on:
https://github.com/torvalds/linux/blob/master/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
commit-id: cb3f397b17bbda3f2998eff9e54b040c8fa85cc9

v1 -> v2
  - Patch 0001: ARM: dts: aspeed: harma: add E1.S power monitor
  - Patch 0002: ARM: dts: aspeed: harma: add fan board I/O expander
  - Patch 0003: ARM: dts: aspeed: harma: add ADC128D818 for voltage monitoring
  - Patch 0004: ARM: dts: aspeed: Harma: revise gpio bride pin for battery
  - Patch 0005: ARM: dts: aspeed: harma: add mmc health
v1
  - Patch 0001 - Harma: Revise node name
  - Patch 0002 - Harma: Add retimer device
  - Patch 0003 - Harma: Revise GPIO line name
  - Patch 0004 - Harma: add e1s power monitor
  - Patch 0005 - Harma: fan board io-expander

Peter Yin (5):
  ARM: dts: aspeed: harma: add E1.S power monitor
  ARM: dts: aspeed: harma: add fan board I/O expander
  ARM: dts: aspeed: harma: add ADC128D818 for voltage monitoring
  ARM: dts: aspeed: Harma: revise gpio bride pin for battery
  ARM: dts: aspeed: harma: add mmc health

 .../dts/aspeed/aspeed-bmc-facebook-harma.dts  | 85 ++++++++++++++++++-
 1 file changed, 83 insertions(+), 2 deletions(-)

-- 
2.25.1

