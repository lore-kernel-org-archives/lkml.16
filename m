Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C85F646B5;
	Sun, 30 Mar 2025 14:33:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743345182; cv=none; b=U8UBREV+OmM+ApmV1Eiyp/8e2Vyv5lVlailO/9EUWOhSo245r2QtWgm1VDnmrzOoa2WVaxLwWBCUWoXLw2vuNZxnD96yUwTeacrCtlZrMjqSuCZN/lvSAOWJ649+Mfbzz3iktPsOmLP6rRAO0FCKw6SOjsoT8BWhrQyUZul1bqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743345182; c=relaxed/simple;
	bh=c2+wWjdujv3UHeuwB5Y44qeQdzTMiNxOlvXMxrg+ClE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=jqde2deeGSpt4kuHaUgeHOjyJ1whENl+jdzbu+amCcUxB8xasA0K7UPRETGGTXfVAJ7QVOWqM77nY9zu5KJG0viAN17GW2Es5k71GqtF1u1jzFVZ5SKPmISB5Qp3rToDLZ3KBv3Hx0X55afH8DoLYYYcG0kDtZYrxDukWYJR2D0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j3yhVuzY; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j3yhVuzY"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4394a823036so35389825e9.0;
        Sun, 30 Mar 2025 07:33:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743345179; x=1743949979; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KDZlBB97sXiBRPJPnnCLtIfRcmpHR+yPzooZ+KfqlxA=;
        b=j3yhVuzYrt/Y8tRzQ16JcBYm4NQgpm0ip3vFPBKyUWHfIVSoOfSp5rkUn2a+yiEFua
         2+H+HKVa0aMRy6Jsb6FuMyQxQhKqe5swid0Al3f7yd5icouR/WtuX6qmbh0oXrkzGJMz
         0IH5pdZqhxHLDHXZZlyIk+OPIcxwFDaK0QTpmDV1mOLMlZ+56PWNsxjOSCtIxOxsV7nx
         6YdLum0IHRUtAKEMhDSItIj5fMkSmLbo8PbbEieDXgAvgkbs1mrv8Y0LELsVVurhWQ1E
         1znYAXf+D7WzbwL6mFC1LLpW7dae2pEgQCgc1y963LDKADaL09CejUkQaazHo+m4uXgA
         vfpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743345179; x=1743949979;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KDZlBB97sXiBRPJPnnCLtIfRcmpHR+yPzooZ+KfqlxA=;
        b=P3QqzgYNQf95YK1RxTXrJuvMi1+mslAwye+0MdHVIFNUO4n/qubVL908XGZtRQiofL
         CRyz3J3+jr3sptz1AHYN3ewl99QqAdTBZcCtIUzP4IK6wbT91Ci6j/M+O21JTJxlq499
         pXA2lTSRLKnC8FdjoRIlSx3PzE7V2Px8nskJOh6T9KSbUao5CnWwtAEc82gvJLspxWok
         RyEx1crZyBt+qQNoL4Q6byH6oMke1j17tVE59Vqm96dTl9/JdVOJgiZ1NUVjBmSj+vCS
         n2JcPR3UY6H9cYsNAd+egkAi7l6hcCu1FO8bFZ9WNAa1H0j5rX/s3am0jVufxzjH7QQm
         dZ6Q==
X-Forwarded-Encrypted: i=1; AJvYcCUJXq+Rccur2AHvvCd8+0J1yqRdpG8amFmnYeDHovFfog0Y4rNO59LXL+gdm6NjMS5q0A+oyoe3Ua1x@vger.kernel.org, AJvYcCX4y5kRg9SBn+l4a3jCyHJe0NcLop9jzyrG7L4tkRes/TUN7RaMLFqE01IMmgsbHXofvDxmZ/lUl9DPuAV7@vger.kernel.org
X-Gm-Message-State: AOJu0YwMssuUtX1ADCju0PPrb9wtnCKZhlD9lJ0GeoSITDasaGoPHtQ/
	NkeK9lkIT0F8A08fvWk1GbFbmcaLJDsJWB3WC6K983jRw+vjta8J
X-Gm-Gg: ASbGncsZ/8Ljc9M89rw/CMsgPsTZ/AzX7wogyHLnnpGBqx8CubPqhFzcKf38pAO6Uqq
	8QwRVUnXGZpwlt6wIkN1avy6ebEkxMrw1u1D/q7vAqOaKxqcWaZxn6LQBuOc1M5jO6wmYliRrYn
	FoEjvl0OIP8q7qXJdSaTC66ZFF+KV+zRZ51R/jgGmYaHQ/DUgAzvXn8y0+HBthdAp7tFcBRjjDg
	xHQM5POPEGTPdlr+Hxe0MKO1yr1SkKhyaLTQiqYD498gwq064CTbHDwItzl+RI0EhjfbXQF0U5X
	uzoX6bra1ihjWD6NlD4vPJs1NzMQns4g0PpWZLXgFjce3EvsOoDd7fQNGZHj
X-Google-Smtp-Source: AGHT+IHaSWu6Z+1rDc9SQC310UBhA6tjaaU882YzdNUAhxmwTHuuOQ3qnc1Sxxt+8NnSRPc5mpgrvg==
X-Received: by 2002:a05:600c:1f10:b0:43c:f8fc:f6a6 with SMTP id 5b1f17b1804b1-43e8e3cf6d0mr45291815e9.9.1743345178939;
        Sun, 30 Mar 2025 07:32:58 -0700 (PDT)
Received: from toolbox.. ([87.200.95.144])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c0b66363fsm8999934f8f.36.2025.03.30.07.32.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Mar 2025 07:32:58 -0700 (PDT)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Christian Hewitt <christianshewitt@gmail.com>
Subject: [PATCH] arm64: dts: amlogic: gxlx-s905l-p271: add saradc compatible
Date: Sun, 30 Mar 2025 14:32:54 +0000
Message-Id: <20250330143254.3159519-1-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the saradac node using the meson-gxlx-saradc compatible to ensure
MPLL clocks are poked and audio output is enabled on the p271 (S905L)
board.

Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---
The meson-gxlx-saradc compatible is now merged via the IIO tree, see [0].                                   

[0] https://patchwork.kernel.org/project/linux-amlogic/cover/20250330101922.1942169-1-martin.blumenstingl@googlemail.com/

 arch/arm64/boot/dts/amlogic/meson-gxlx-s905l-p271.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxlx-s905l-p271.dts b/arch/arm64/boot/dts/amlogic/meson-gxlx-s905l-p271.dts
index 942df754a0ed..1221f4545130 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxlx-s905l-p271.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxlx-s905l-p271.dts
@@ -38,6 +38,10 @@ mali: gpu@c0000 {
 	};
 };
 
+&saradc {
+	compatible = "amlogic,meson-gxlx-saradc", "amlogic,meson-saradc";
+};
+
 &usb {
 	dr_mode = "host";
 };
-- 
2.34.1

