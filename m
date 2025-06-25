Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2F342D9ED7
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 16:41:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750869695; cv=none; b=LQqaqMmc+gpPwVAarwWMg+8EeaqmQwUDOpB0L/0WRf1OhM5VakuGnCqRLl/dRY+nXWye42gfd/xbx+fuWeN7FlyRNjkyvDCwiikQFRsADqeMBHXsEi1mheW6mWU+nrZxbCA3LK/2iPF82yiZhojXXfBr6lusFIirF4EEjkdUhCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750869695; c=relaxed/simple;
	bh=E/I9W6fX+DhSmsmtI3yC9YfnKc4TowcG2XvObw3IonQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ftH3e2inVPQl7raY5dLgL4eNhuryiz66GXSS0rRFVUYqM+mdyEOtQG/IZCRfBfJ73NwetAJqOFM+s/yUkznpwhdTD+Dcdj7rr2J41F0mTyALdq4g8g3C1pf72hEOapm2yPNuTq9Hz81rJ3n2zX2xHe5uz4PQdLKp3lel/UJkhzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=ByZhU4AS; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="ByZhU4AS"
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-7d425fc4e5fso8147885a.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 09:41:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1750869692; x=1751474492; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bpaBoGbv3UwS2ctJ5MNrLd4WnRBIdXYjgTh8qQmsLHk=;
        b=ByZhU4ASm4CXKPpovfGRQ1bXfrIbanTBNjGn/9AQW6m3/KAhKbFlMyjeMlharBhSRQ
         FGQWtgHt+Vy3KqoZg6FqaXiwhdaSViEN0sPLTapZqfBzYqc5Mz11SVyef2o+Ou4c2ltE
         M4nFBS+ByV3oenO1Pl4P0D23Nf4hvsaU8e+3t85OA0b+4ZDDCqlRKm3UsDl57KH5ccv3
         0zIrQ2PO9w0Omw+c2y3NqD23J3v9GAhkwXE58zn3bXeKnaBcFxmvA1OAJrRcGFcwwZtn
         uqIl5o2aFpQYxsatuJiU3Wyrs0JzFjLWrYQkSrEgZ5v06OWsqZ3bjDEZoO8vhm7VzoQk
         ZXZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750869692; x=1751474492;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bpaBoGbv3UwS2ctJ5MNrLd4WnRBIdXYjgTh8qQmsLHk=;
        b=QXIhq+sFi4uJXhFNvkbkxwMTMPWIL6EK9pQq9b5fW7mCnOdrispjmTsKre+Sa9aS4f
         yk5aV6j4H+bLUUNlcs75aK4tepcUtBojn3sJdVDGRIafdbC/M+L8unnwom8u6xHM2u+X
         Ekp0oSRI4HXliyAiVEP6TNyOH8GI8J8ht8AFUc+Lw4IRnUHYkljDxgCOuHtMg5uEoymP
         8XuhJFUQalN0eHdJgaZR06mV69UCgR1Z/rO27eDQRQP8rGAMZGjwhfIVLOM3M5zhBGQT
         auQvXSSAVf69zS2Sg6STJ7M4YPcCKd0YmhvYGFAtU0kh5xYvZFW7qQXmh7lGpmGbfYQ+
         HdWw==
X-Forwarded-Encrypted: i=1; AJvYcCW4yDkmoc3LW0W/JjkweKuEcpgP3fvWK2zzFKCRm7n/S+m4Q6qdE9BL1d6i+5WvHqjgW1wDTkVeo8LpEjM=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywn3aPZq24AfNE8qkGCtXm0LgkVQzpuLM2JglMLUaqx7SI9uQGd
	FpwIJ7zKWgu4b4lftPAdkzK6eNe9kaVi0Dlqwcc5BaDay48/Xxo9flTmweBKk7tJIkc=
X-Gm-Gg: ASbGncupjrqI6Hh9KjPt+lC7G1M5Bs9paJoEkYdmH7+/audMs5HjjYC+QzojbS59yE7
	cuzGZ6VDAlL0Jt9+34uBN+RaYFo67o9uWnfb4uW1bk5yJenBdrH/2AgkrXhz6LEbsF5Xz0/NCjj
	o7tx4Ws9aFQExLlpm6ORRKJ2dvyxyxUOOVypvyiLJAuPCudvLeKkljms6rL7/fiO9p4OHYm8Qbw
	sRb/4z50gBc4akIWQ17WIbHK0F6ykun8hWiMFa4p6BwvQ2NpBBHdmCIbIkuBmsF6uRap51hDyuX
	bmc3qC9RYAd4rVUUEi3HYa5R0xOtXNc7SUTW4NJU0hR6SXyTalNcWdsYLJ25lculcO0YoX1QZCz
	szhxPV7uxzadOFG19w0ru8yIFPBYlv0Sx818=
X-Google-Smtp-Source: AGHT+IEwItQMBBDI1vzRkKuMV76VC7n5WgZIJe9oGLx0Xn+RTJyLSXPBEu2hmGxf93T+cVf1NqqyAw==
X-Received: by 2002:a05:620a:3186:b0:7d2:26e8:d186 with SMTP id af79cd13be357-7d42971d918mr638041085a.36.1750869692268;
        Wed, 25 Jun 2025 09:41:32 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d3ffdb190esm576783085a.86.2025.06.25.09.41.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 09:41:31 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: lee@kernel.org,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	alexandre.belloni@bootlin.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: mat.jonczyk@o2.pl,
	dlan@gentoo.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	troymitchell988@gmail.com,
	linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 6/7] riscv: dts: spacemit: define fixed regulators
Date: Wed, 25 Jun 2025 11:41:17 -0500
Message-ID: <20250625164119.1068842-7-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250625164119.1068842-1-elder@riscstar.com>
References: <20250625164119.1068842-1-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Define the DC power input and the 4v power as fixed supplies in the
Banana Pi BPI-F3.

Signed-off-by: Alex Elder <elder@riscstar.com>
---
 .../boot/dts/spacemit/k1-bananapi-f3.dts      | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
index 7c9f91c88e01a..a1c184b814262 100644
--- a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
@@ -28,6 +28,25 @@ led1 {
 			default-state = "on";
 		};
 	};
+
+	reg_dc_in: dc-in-12v {
+		compatible = "regulator-fixed";
+		regulator-name = "dc_in_12v";
+		regulator-min-microvolt = <12000000>;
+		regulator-max-microvolt = <12000000>;
+		regulator-boot-on;
+		regulator-always-on;
+	};
+
+	reg_vcc_4v: vcc-4v {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc_4v";
+		regulator-min-microvolt = <4000000>;
+		regulator-max-microvolt = <4000000>;
+		regulator-boot-on;
+		regulator-always-on;
+		vin-supply = <&reg_dc_in>;
+	};
 };
 
 &emmc {
-- 
2.45.2

