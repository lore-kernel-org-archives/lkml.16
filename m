Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4B04367;
	Sun, 20 Apr 2025 16:48:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745167705; cv=none; b=iE+I0Hru25lDN6SxjNZ8V92v4WbA9QyseygukxJ3hdQKk6C4xZoZylmBRTuhK732noAt07IATaDeYcOBPElU9vzDTDrjsh0nktEBV+05Zwcl8oZ2Dmz50n5Omsr2i1MgJoJNiqa7vzZTuToX5KmPeZYE3BnEWhU/hJl7SrM1T3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745167705; c=relaxed/simple;
	bh=r5BUDroOZ6LSp7aT9+MILiAhHhSHpvQ1qz+XAOWXZU4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YJDHHh/U0x3Ca1qT4pmD+EMtTXVb/NY6wRFwhZCv+G74sukLjTAjfyx03PLOvdwUs4LPwzJ6g+4hVwpjIlm/0j1kOvwLNY+PF9C9VPpjwUGCmFurx6pTm121gsOtnTtTOQ8cD6qnFha6emFpmOPeq2fZ+unT0BlQH6oCwj33zJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com; spf=pass smtp.mailfrom=googlemail.com; dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b=lvLO2rNj; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="lvLO2rNj"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-ac289147833so594401066b.2;
        Sun, 20 Apr 2025 09:48:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1745167702; x=1745772502; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EEGw4ei1ltPqT9EdfPygnEz1mrR7+WwPBOwxKSKXcf4=;
        b=lvLO2rNjUtTsYXU056/zBfSYyoK7mrqW1c9UFqy4VGs77q3I2SestFUxUOqbYfJfEX
         TIWtzKNaL+J0R5yKzladIGc36uaOGVbr+LRLBO3BdiJTEZ7H2K/g1H8dzbc32R6KpuZ1
         zJMsdF4W70qpbTPC7gal3QjHXVAw51seP6xyGfO2c69gaHmPURbVVmtXwHmJUTNap0Fz
         +BUVQ9L+XeItZKAmAT20CMMFKL3CAHEW5+1118F6P/qutt2jMhXmnx2xICefk4HfZJe7
         wHNbD/Ccf9KdFqRIS40WJ4htAYhPgKPFItOEmQQNQBg2xNrn7kXX6h1ELdvH88/sz1ts
         Cc5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745167702; x=1745772502;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EEGw4ei1ltPqT9EdfPygnEz1mrR7+WwPBOwxKSKXcf4=;
        b=TMshiEigWbukZpGhwaJ0E2r+wzX+u6+MBGr8Xjvh2wiFnunTjeK4rIoR0orV1ZcGlP
         dUs6nutuhHjXaIDpxIGx/JFzjusYc57RyeSxFMpPa9YfU6H2UPmXpIN5RUcjg5fsmlxh
         Pyn+ThnnMG7lIrSZ2PwPW/pDgSzbVEsjlfhWoBTy2GzZ7s41iwM3LtoRbD8767cUgDWx
         NwDHci5S4M8IvUlOvbxxEi6kglg1Av2ITkDs0Yx9JKB/hL5ofv8Yjp72JuMxoYSRkxfJ
         huV5ndeK937aLNq3/yIU/LL6sLaDMf+dJNIXg5vKYkBk66jekrE+Rtdi1hM0pejJoHhl
         yAkA==
X-Forwarded-Encrypted: i=1; AJvYcCUpm+v1Q+/JBWB1H/djW0afjZZyGkkzg+/eW0I3XY4s5yM1RCJZUTjLXW+xRUzEbvv7Tm3h5eWUxOU/RANe@vger.kernel.org, AJvYcCWgqlq6h6M61wgMnvnRCoepam10cCd2zwiUzwxB/Rirggt7nuCuZzslbxo/YtA2ufUC66G0sovrn8JH@vger.kernel.org
X-Gm-Message-State: AOJu0YxYYM0199x03kJkFLp24mVo0+gb+KGFUOmTQmx4e+r1sSe4wRFh
	xxU5FRdlZNsquvfvboi+xGBo2e5nNQRhEwgJlKxblqgQmGr9pEHPgzT1lA==
X-Gm-Gg: ASbGncsPyOOTmbHaTKxk1pXTm4GEQoG3SXi2aCULRK71s7iqZ+mge2HQvMerLj9Lmyo
	8RPcWNn/ODWdCaUOmJLlg2AXog+RNnqV6KICt0wzlKjtZzY5TK3znvXWQd21vutis0XzMbE1L39
	Nz8k19BEIADLrN39MgxPnCvt+xixX8118IPqnYfETrhXMItZju+0uuLZwlGG828O0w63rD3Qb8Q
	C/AQYN0gABnPAfO7gtow5ojQeSmVFgDK9HyYXNn9s2Kq3UMthuF2mWiOJuQTXrm8705FqMdaX7M
	pVvUNKQ9Ono+CisfyiAkBZioLir/Af40ExIoSAO9KcI2nFzorRg+iKqft/k1pFG+eowwt9PrnQH
	IgMMGk7Bap5iEb34PbI4GQvlJYWIFK+KnNGobI4vp19SPpyot4VJBt0wAf1KrXa0NLw==
X-Google-Smtp-Source: AGHT+IE3PsQolxVL2KiqFnBgslOuRCqoai4HIDr8cg10JY7uGcdQOpXmUPJ3NaFiU0N/NqtaE0v6vQ==
X-Received: by 2002:a17:907:7207:b0:acb:168e:c257 with SMTP id a640c23a62f3a-acb74b7f3c5mr939128866b.26.1745167701617;
        Sun, 20 Apr 2025 09:48:21 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-9ddb-f900-0000-0000-0000-0e63.310.pool.telefonica.de. [2a02:3100:9ddb:f900::e63])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-acb6ef48e5csm416142366b.148.2025.04.20.09.48.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Apr 2025 09:48:21 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org
Cc: neil.armstrong@linaro.org,
	jbrunet@baylibre.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	christianshewitt@gmail.com,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH v1 0/4] dts: amlogic: fix FCLK{3,4} clocks for new PWM controller binding
Date: Sun, 20 Apr 2025 18:47:57 +0200
Message-ID: <20250420164801.330505-1-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Christian has reported Bluetooth issues on some of his boards, for
example on a (GXBB) WeTek Play 2:
  # dmesg | grep -i blue
  Bluetooth: Core ver 2.22
  NET: Registered PF_BLUETOOTH protocol family
  Bluetooth: HCI device and connection manager initialized
  Bluetooth: HCI socket layer initialized
  Bluetooth: L2CAP socket layer initialized
  Bluetooth: SCO socket layer initialized
  Bluetooth: HCI UART driver ver 2.3
  Bluetooth: HCI UART protocol H4 registered
  Bluetooth: HCI UART protocol Three-wire (H5) registered
  Bluetooth: HCI UART protocol Broadcom registered
  Bluetooth: HCI UART protocol QCA registered
  Bluetooth: HCI UART protocol AML registered
  Bluetooth: null: hu 0000000023fa9791
  Bluetooth: hci0: hu 0000000023fa9791
  Bluetooth: hci0: hu 0000000023fa9791 skb 000000003f7acf2f
  Bluetooth: hci0: command 0x0c03 tx timeout
  Bluetooth: hci0: BCM: Reset failed (-110)
  Bluetooth: hci0: hu 0000000023fa9791
  Bluetooth: hci0: hu 0000000023fa9791

It turns out there's a typo in the references to the untested/unknown
clock input that made it into the already applied series
"dts: amlogic: switch to the new PWM controller binding" [0]

The original goal was to skip this input. This can be achieved by
specifying a clock input as <0> (which this series does). When using
<> (note the lack of 0) the clock is completely ignored when parsing
the .dtb, resulting in a shift in index of the FCLK DIV4 / DIV3 inputs.
This then results in the PWM controller driver calculating the
frequencies for a different clock compared to what the actual hardware
uses.

Neil, please apply this as a fix for the next 6.15-rc.


[0] https://lore.kernel.org/linux-amlogic/20241227212514.1376682-1-martin.blumenstingl@googlemail.com/


Martin Blumenstingl (4):
  ARM: dts: amlogic: meson8: fix reference to unknown/untested PWM clock
  ARM: dts: amlogic: meson8b: fix reference to unknown/untested PWM
    clock
  arm64: dts: amlogic: gx: fix reference to unknown/untested PWM clock
  arm64: dts: amlogic: g12: fix reference to unknown/untested PWM clock

 arch/arm/boot/dts/amlogic/meson8.dtsi             | 6 +++---
 arch/arm/boot/dts/amlogic/meson8b.dtsi            | 6 +++---
 arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi | 6 +++---
 arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi       | 6 +++---
 arch/arm64/boot/dts/amlogic/meson-gxl.dtsi        | 6 +++---
 5 files changed, 15 insertions(+), 15 deletions(-)

-- 
2.49.0

