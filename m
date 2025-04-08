Received: from mail-il1-f173.google.com (mail-il1-f173.google.com [209.85.166.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13D8D1B6CFE
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 17:51:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744134714; cv=none; b=avQrBn1WrF4vIHPhIFcf4YpiKV0qrfqNFpbjI2h3K4WIqd2Lp2jFFXspdmHxJkZM9lO+BTamMi5NFiJq74ZJXbQOhVNwBCU56vpNGbRvyAvpyoPAOWisDV1aRBeE1+BG4EZUZSjitXZfbrIn+cl5/yHuq+ZtgGq/qD6N3vkv148=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744134714; c=relaxed/simple;
	bh=LUAaQpYmHZr2x8IcCyxqSCkpOZjk7GLcZ6iYEadmxbY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hwgLYKkvuqzTsuGeQD6a5ygzRu0di77g0PZ5T4VAee0nkCwRASavxqntdZFiHsequmx3aT0kRj+Uk2PXr0Rfr+DOiR9Dh7Z80uhlVgbpWum+JUQecYtYUBnnOiO2XX6ywQs1rs+Q20Xor/6Imc+9LriVhSazDQcxAAqHjaJKwE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=1UuQVUMj; arc=none smtp.client-ip=209.85.166.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="1UuQVUMj"
Received: by mail-il1-f173.google.com with SMTP id e9e14a558f8ab-3d6d84923c8so17760705ab.0
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 10:51:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1744134710; x=1744739510; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SvGZNr8yAkgwxgzEHlIxH9XT7UuZH9oRFwm3lKyD2fw=;
        b=1UuQVUMjZxymk8a7ggJmPWd6K/v/uzv+CNOzV+b4P4j4FLwIEVcNWu+2x9ZR9mcWS2
         sdVPh835kG9hkRehxtttGl77qHPYoB0bOF0nnB7C42r3GQzlqfoXQgTQ5sB9jh1UYaee
         UphRM0eKApiPF5gGQv0cj1fo4+mHoFlIjbnR2Dix3F4MS9vnaiYZBJ9kb3xOssmRJK7c
         ZWBEUWaZumyPn9M7GlqOh4d4KCHmMgFFWQ3eq2gKw3pAH2ilIV7htAxxLsLobZWE0lRn
         a5Or1yEfusZeVcDJOW8gPVDJyLguve0sHKqoeEjgXEKYsRQinfE8t+ZSnFixjgocA2/O
         1nRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744134710; x=1744739510;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SvGZNr8yAkgwxgzEHlIxH9XT7UuZH9oRFwm3lKyD2fw=;
        b=Gy8b6F0ZYgXG4e59R4b8tRFAVZC7AUnNjo1EaIOtf8a38o4DQ1vu1QrjiVu4SNqr7G
         UQBtVjMgLaApyXWcyQeAuJs2secuxuEwNKG1prFiLy8rBzVVY4z0KfGVgdV47kjblNLg
         xzv7cL7Z1AWDRYu0WDXoOMtFGQKMoe7+zcjxMXug9NsqpiOeneXM7eS3S2JD7VUcB5op
         tdogy4qU7H27JEGxqew5Q86YZgfHFDesZT26iiqJVfCAZUBewBG/fusI3zPJqaQn1iju
         bnSQXJCyFQDwJJwnxhpkPcwARS5m7vJMpw356UopzuXdl8zY3ptWSJhBbD6V7ngav4dQ
         fiVg==
X-Forwarded-Encrypted: i=1; AJvYcCX74ApWjAhkJGGeGxcpLYgyq1pP270cUI3+l/EcomB1W+19lUpXg0cPRUq7JzFZCb17g3i+6TrZLqfX8Ug=@vger.kernel.org
X-Gm-Message-State: AOJu0YxDzz6PEYSE5p6jwDOfNPE/M4PyS36I1EaNYohoPYa1/TpknSIQ
	1jDc7QodggP5ooTp7MrdOb5kmhMviTrtC1N0X6Q/xgOzYgIhMiJeW2Z2baX5TFM=
X-Gm-Gg: ASbGncvDk4PeWGjj0pbJLmgCsQ4TD+M0VuHFH3FlCfq89LLGhgub5ezUj9QI3NyNYEJ
	QT+yzPUxNRffYeF5dypZpLWItFhYBxo67AxmMXA013oLiGMwUMNHLn8Y/0m0C8EGc49u5zHDjyQ
	9CdF67zoACzkpsIVl3s/hYDRW1OsmKJ2+3DoU15vCy157UtmUwQRY/00ebrIpQm/v8ECGN0QIHv
	B9kJ8aHTZ2HE9ju+7Rpl+1WO8o3TodLSuyOcKu1igzjjJh4KoEHLzP5Nt9DfPee/3mqWKKbCNVN
	mM0j05CL8d6MggQOa5nTLNy7qeYd88+2TowpsvN33qxtdvMw29Q/9gvFNY64FiCurJTE/MgHF6H
	uSfUFB5R+HZFZIIBcSg==
X-Google-Smtp-Source: AGHT+IFrFQFeWwluR9916XoDwk7qLK/YcvMXzppSoOv4/49mKNfrTo4IKuB+tZmx7E3ipEdOGJkdyw==
X-Received: by 2002:a05:6e02:4401:10b0:3d2:b154:49dc with SMTP id e9e14a558f8ab-3d6e52f60b0mr131530745ab.5.1744134710141;
        Tue, 08 Apr 2025 10:51:50 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4f4f44e26fcsm595914173.120.2025.04.08.10.51.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 10:51:49 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: benjamin.larsson@genexis.eu,
	bastien.curutchet@bootlin.com,
	andriy.shevchenko@linux.intel.com,
	u.kleine-koenig@baylibre.com,
	lkundrak@v3.sk,
	devicetree@vger.kernel.org,
	linux-serial@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] serial: 8250_of: support an optional bus clock
Date: Tue,  8 Apr 2025 12:51:41 -0500
Message-ID: <20250408175146.979557-1-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The SpacemiT UART hardware requires a bus clock to be enabled in addition
to the primary function clock.

This series makes it possible to specify both clocks via DTS.  If a
bus clock is required, it and the primary clock are fetched by name.

					-Alex

Alex Elder (2):
  dt-bindings: serial: 8250: support an optional second clock
  serial: 8250_of: add support for an optional bus clock

 .../devicetree/bindings/serial/8250.yaml      |  6 ++++-
 drivers/tty/serial/8250/8250_of.c             | 25 +++++++++++++++++--
 2 files changed, 28 insertions(+), 3 deletions(-)

-- 
2.45.2

