Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA7F720DD40;
	Thu, 26 Jun 2025 11:33:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750937637; cv=none; b=tWrk7XmTL0ZRINTjK1LgjNhgWE4fWEtpfoa4I4R7/WgU7NAeIJb5qFsTSqCd/BLu4T6y/kPBlwy39MmKnK0gvHF1UxELok071ALZjoYeG3W2HL3g/6XQld4Ip/AuaiL10u1wDCwMTjrUNElZ9trYE4RcGWxaiRsn3L4uA7eafyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750937637; c=relaxed/simple;
	bh=GRvJ956VXYa1EvgNRCVTjY4zAeOzsOz81AgqeiOn0Gk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=ezzceV3x04+gY42vL0SRKd8nfIRDeekqWYiKSMjOmR2l273a1sVsSBhkeOuzVV0MSQm7s9kru0CVL/z8KmzFFauNwa/mey4ZGUPF94ZUd61VViTUgipl+of/3bA2qzta9fJSnizC3X4B10YloVPYGzgUx8QBE+OBGsDCu/T2u3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W59/ASkU; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W59/ASkU"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3a525eee2e3so640125f8f.2;
        Thu, 26 Jun 2025 04:33:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750937634; x=1751542434; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zpc9wmmg4WU4tXd6pc5djHAn42gtlXDXbKvHWb91+QA=;
        b=W59/ASkUxROoANRKkKurP90b94lwDFhq5nWmTqhBz7h1pwbrUZri3p0I6JZUa4nWA3
         H5Qk/FtsZysMi6l6wzCaCXhebCt1lBcKpmT8zgEv3PDCQx78Ol1U6FM/i+F47C6GdIue
         xorPVgjgaX7C1rLaYC4ulrS0OfCYyo0YkcztMpAocYiLyPik4w6X2LZljhFnhCbNWV8r
         m4En3grJHM09Raxqhle9izZdA9xcEOxKL5RFqNd5h3EZmIyzHRoC8qp8H3u+TBDSGfNJ
         jyyizpkI81aFYiOyybzpiUDBzn67v5s5T9opwmSN6u4y2Tq9x8+BSAt6zh18OZ4+gAPb
         XvFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750937634; x=1751542434;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zpc9wmmg4WU4tXd6pc5djHAn42gtlXDXbKvHWb91+QA=;
        b=JY9Rbbpm0ZnluPk86BD8gMDBO+RCGtSjoxiRvaKWLc8n1fP4Zs8old6SdxhjqZtyC9
         ka+hjMOnlxqYmbnGbZz2FkNUBce8bi6ZH4C6DEWbmZWg/vO+UIAOIajbkMGZISwiBGr9
         PMhSIn/3+Pqm7z1kPARGFcNXyp8wtA+oaq4RqmviJUJlmFM2yT3MvkK5kLpQELjXGg9+
         vLhUxafs1V8apqjggSAmNp2vuJJ/wRqoJe72+5YJS2D9Z5MdrgnvBDxmRTVgcxV7t5wn
         05lLqs2HA3FdnwTFDWxVPt4Tu1RfrOTvN3iszmopRl2PlD1PliaF4t9MyPYg9ScOAzQ2
         DqPw==
X-Forwarded-Encrypted: i=1; AJvYcCU3wn4Ef44dPmc/V91dQJO1Pil3NN7nF+D49EgkPJREkvcXTFj/7GXIw7EYXcE1wKuxumV40sPLLCAgcZOX@vger.kernel.org, AJvYcCUBOJagLLSyfv8ONWjt5VE+5gME6V1w2M5WHNjpPL5ViPbttaXkpwTTP6k34+9fPVGZSR/mO9ukwTjb@vger.kernel.org, AJvYcCV0mg704ZVLp0zmRyzXh7ZNJsb8FaZ2J6/eeY0e/MshGBd1JIeErhyVr6d+G/gJgpzrRq+ddvLURplbH1s=@vger.kernel.org, AJvYcCXMfF9YnreuTXtVc66oChUnFQ/znPNeNuTEorveoQsU5OdL7arM0OZTpLzw5wDhrM43iIMlbr7YU5O7@vger.kernel.org
X-Gm-Message-State: AOJu0YxmRn7lo//GV9nzTujOM72pWU6wSnXlQBEtDkx8ybIxqKgRBq4+
	Bks+afdNoby2Ddfz1Lh/47nsgwBW6Y8Wqa+n1refnCllDC773XkBZJF8
X-Gm-Gg: ASbGncsGvdnE9T5EwAA1LDodUwn0f2LG4R4R1RJ2BdXUNSfsWiUJazpte/KxxB2SC01
	acDZzziqkWvjiR8jVrDDaEIzAa+s1sZQh+fzVAlm/VUkh5Cyz5qiLaL6UaLzLMms/0jAcpHDq+B
	si+E87xB/dQZgKlT78pzNQS91KY4WIlNXZc5i+Zl2je7K5uhiVHPqSMGdpIXNWKhCFJl61EVzoI
	uNexQ8UBGIVVYA3Mu6uzbXkA7LnqTvtnMS/lJ7gfEI1hugo1hJB/e73n4mf0N0n28mKjbxetYVF
	2AXcmIf2vUfMy2qW763eDAYulGTRJZ1fvKKEy8+0GjS8sGLcDXVuef65+6BK7y6G8ozaQKij/Ze
	FTEDPxV1RsXmc3F8scavfP2fFyrcne5TmPYUYN9w70FCf4dhqKOrmKuCuMxXhxus=
X-Google-Smtp-Source: AGHT+IFPq2cyUlQPHSTvPVknBVyZ15kxfS3GSUCkz7cvo5sp4xnR6w47hkbyEgjwl/+6iq0KybLNaQ==
X-Received: by 2002:a05:6000:4013:b0:3a5:27ba:47ba with SMTP id ffacd0b85a97d-3a6ed66e0cbmr6289269f8f.44.1750937633647;
        Thu, 26 Jun 2025 04:33:53 -0700 (PDT)
Received: from skynet.lan (2a02-9142-4580-2e00-0000-0000-0000-0008.red-2a02-914.customerbaf.ipv6.rima-tde.net. [2a02:9142:4580:2e00::8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6e80f22efsm7071753f8f.46.2025.06.26.04.33.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 04:33:53 -0700 (PDT)
From: =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= <noltari@gmail.com>
To: jdelvare@suse.com,
	linux@roeck-us.net,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	corbet@lwn.net,
	linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Cc: =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= <noltari@gmail.com>
Subject: [PATCH 0/3] hwmon: add Microchip EMC2101 driver
Date: Thu, 26 Jun 2025 13:33:48 +0200
Message-Id: <20250626113351.52873-1-noltari@gmail.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The Microchip EMC2101 is a SMBus 2.0 fan controller with temperature
monitoring.

It supports up to 1 fan, 1 internal temperature sensor, 1 external
temperature sensor and an 8 entry look up table to create a
programmable temperature response.

Álvaro Fernández Rojas (3):
  docs: hwmon: add emc2101.rst to docs
  dt-bindings: hwmon: Add Microchip EMC2101 support
  drivers: hwmon: add EMC2101 driver

 .../bindings/hwmon/microchip,emc2101.yaml     |   52 +
 Documentation/hwmon/emc2101.rst               |   61 +
 drivers/hwmon/Kconfig                         |   10 +
 drivers/hwmon/Makefile                        |    1 +
 drivers/hwmon/emc2101.c                       | 2207 +++++++++++++++++
 5 files changed, 2331 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/microchip,emc2101.yaml
 create mode 100644 Documentation/hwmon/emc2101.rst
 create mode 100644 drivers/hwmon/emc2101.c

-- 
2.39.5

