Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B35491FF1DF
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 09:34:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738575300; cv=none; b=IGRiadyMk2LBZuEJzptcFunWgnJUvghrUI22gq7tN5rW+zAbY8LzcpvEBBp4hR6Wb8ghRwO2pFQxhnj9JPNum1Y/UYf3Hi9j6+r456j1+eeQ0RGh8I6o428mPOaKbALb57iA//G4D6dcXnfbPymTaH0mOwiIIRrgLnHWYW4x/8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738575300; c=relaxed/simple;
	bh=4iSXCSQD+iqnPgY9Sq7mg/18cYhXxnnkILGNsHGeDb0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=QYOqHxDqqtnYcUv2u+8WVwGElMexpdsyFHbDWXXY39vJ13SGmx9RGsxxfgu7CknPsbMlA505xRU+dqlty3cTPlDCnQ4uM/Kf3CumFemb1+bvh4VrIuZ86vnJTLhSNmyFK7I4heEmgsU1spawW/71KvMWcJSW8SQrHOaBzjqsC5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=PLHJ9DLF; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="PLHJ9DLF"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-385f06d0c8eso2203487f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 03 Feb 2025 01:34:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1738575296; x=1739180096; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XQniEnlPqREiFOfpNWpo606nSBL+SggHNXBd+i0UwbA=;
        b=PLHJ9DLFqptZXbuWoPwutv9pSn1ahfiY5+ucrsoybD7ly2AW+YmZ3Gmx6R2TdMEE1o
         btC8ecK8mD8kRL+iB3v/0++FTS0QNL9W/bL0+IB3OgJD5iNUm4TLKZc4nmBU3oIh+B5B
         UApebPEIp/I00bbQUJsF+gNtUThrvIA11a58/gLU8AhRTYkUgL0HWyF4T0xx267b/J2Z
         Ct5qKPRWEhpwp8wGG8QFuoklcDGzkgAI3QCX+nBtqf5kKrYgdMN6JaxC6qcVZfqdfBQE
         wrlcVwgCn5KeWn3MjYOL2epoLgvGmPggRXuFdo3PwCngsqVKzSJDGw7qhq72VO1MaSo4
         aWgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738575296; x=1739180096;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XQniEnlPqREiFOfpNWpo606nSBL+SggHNXBd+i0UwbA=;
        b=gcbrmxL8s4FRGyA0xpQYZpRGV6+GCdoXYeyycj6fzmaMu0EuQ1Pov08UP2I4S64L6z
         81fOl4WMRxzqZGzbpugGVU2rFKh06ACYzir94xe3Trs9rSdy61ZvuUccyUHLwT3JzDu/
         EVgvauE8cCLhwcFC/os3B6H/AnmO54TXEEB24ZAmgJi7gyZthYT+zXqqv5yuTjvUd4iD
         bSQzqh1NaTQtN3ZnNDp92Qhm4DOunV9eIAegDDK5GmTvk3mZx9AdCtNZsbVxvNzpJbRO
         BlSZgRAwkZU8uG2sMFJIIYoXeYtjIXHmA+1z3RdZjITHfdnv4wSSIATE3p8+jPbtO1zb
         j0aA==
X-Forwarded-Encrypted: i=1; AJvYcCU9Gy18YjxribQHD6p+9Q58ZdABUafveYq6KrTpnRRCOXILCuJ6W1oUh3ZQkQ7u6UwTH1DQtaUuySECEc8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4vQSQouj2TNSYb/xgktd/d6ifE1OFvfNJkYkt50THw5RnuFfq
	1T5PIc+4M/zUF7UUT7xbfSL9yT+L8nJ4syE4QPrin7BHSAapXwQmGkjaPRVljcU=
X-Gm-Gg: ASbGncv5b4hcQiV28wiLIzR/XxD5dayIo83KhSBke+qibmEu6qIh89eXP53+JgQWv5s
	DV/Ip0TYV0+qbcnDQ2Yj5yxzdDMPsANI79KfiiVLtwzPG/XuY9MiPb6YUuf0xOgDOQdvEeh1IM1
	i0zshS3Gfc+AZLaJQJYwmW15p04XkYGHGI6ePsNjqU41bDTccBz8U/5LY6xd5ab24ug2rTdhkux
	g6l6enB8hJKt9g7rk/AREwXdlq9pf5WTRK4D+qDe4DXweM+1A2Td0Vy3+E2Wf+MEfVlPDb1+fj9
	RCHvzwrTBSd2
X-Google-Smtp-Source: AGHT+IGAS4aZe1uEvA/6IkSMVPyhPq7FXIW82d+vI0jBSD7HAnozIOs8zd6eghdccvxRb8J90wOJQQ==
X-Received: by 2002:a05:6000:4011:b0:386:3328:6106 with SMTP id ffacd0b85a97d-38c520a35dcmr20209543f8f.35.1738575295835;
        Mon, 03 Feb 2025 01:34:55 -0800 (PST)
Received: from localhost ([2001:4090:a245:80cb:f705:a3ac:14fe:4e1b])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-38c5c0ec7aasm12136166f8f.5.2025.02.03.01.34.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 01:34:55 -0800 (PST)
From: Markus Schneider-Pargmann <msp@baylibre.com>
Subject: [PATCH 0/3] arm64: dts: ti: k3-am62*-sk: Add wkup/mcu_uart0
 aliases
Date: Mon, 03 Feb 2025 10:34:09 +0100
Message-Id: <20250203-topic-am62-serial-aliases-v6-14-v1-0-f26d4124a9f1@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJGNoGcC/x2NSQqEQAwAvyI5G2jjBvOVwUO00xpwoyMiiH+fH
 o91qKobTKKKwSe7IcqpptuaoMgzGCZeR0H1iYEc1Y5cice264C8NIR/lWfkWdnE8GywqLCtyNd
 lCL53LaTKHiXo9R6+3fP8AJM+k2txAAAA
X-Change-ID: 20250203-topic-am62-serial-aliases-v6-14-742d53ffdb07
To: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Vishal Mahaveer <vishalm@ti.com>, Kevin Hilman <khilman@baylibre.com>, 
 Dhruva Gole <d-gole@ti.com>, Sebin Francis <sebin.francis@ti.com>, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Markus Schneider-Pargmann <msp@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=816; i=msp@baylibre.com;
 h=from:subject:message-id; bh=4iSXCSQD+iqnPgY9Sq7mg/18cYhXxnnkILGNsHGeDb0=;
 b=owGbwMvMwCGm0rPl0RXRdfaMp9WSGNIX9M7e8vPOM4FNq18/+x1yXmo6w/K/WnxyykWT3ls06
 zE+a1vp31HKwiDGwSArpshy98PCd3Vy1xdErHvkCDOHlQlkCAMXpwBMJGM9I8OiGdnTonxCHZbx
 V3bZfbkaXHmFq/XyO/sTXTW392zmX/OG4Q/HpAm6x0y9nxt1M4j+Mfgcq8Wi4i9TXyJv8lA6aOG
 PPFYA
X-Developer-Key: i=msp@baylibre.com; a=openpgp;
 fpr=BADD88DB889FDC3E8A3D5FE612FA6A01E0A45B41

Hi,

add serial aliases for wkup and mcu uart0. Add them to have the same
order on all boards as well.

Best
Markus

Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>

---
Markus Schneider-Pargmann (2):
      arm64: dts: ti: k3-am62x-sk-common: Add serial aliases
      arm64: dts: ti: k3-am62a7-sk: Add serial alias

Vibhore Vardhan (1):
      arm64: dts: ti: k3-am62p5-sk: Add serial alias

 arch/arm64/boot/dts/ti/k3-am62a7-sk.dts        | 1 +
 arch/arm64/boot/dts/ti/k3-am62p5-sk.dts        | 1 +
 arch/arm64/boot/dts/ti/k3-am62x-sk-common.dtsi | 2 ++
 3 files changed, 4 insertions(+)
---
base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
change-id: 20250203-topic-am62-serial-aliases-v6-14-742d53ffdb07

Best regards,
-- 
Markus Schneider-Pargmann <msp@baylibre.com>

