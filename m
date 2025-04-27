Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49CDB24E4CE;
	Sun, 27 Apr 2025 08:26:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745742393; cv=none; b=JHRwU4nly/+z3W4pJi/khoCXMYr6wJoF4gV8m8q9TgqGSi+1wpI0+J6WDhfiTRfAiWhupxFWPmfLdyaDNfEKTyyho7xJ+vTjmmJs+xyk89Oijcekbx+j2uiq4n92HK8r83cg0mUavdScmTvz162Ax9Disdsz02Hz6ZhC3IYQvHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745742393; c=relaxed/simple;
	bh=n/s2ADo+b0i7nG5dHcMjYTx2QEqnguzqYqE4wCSoiL8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=fS0TAyEiL0CyI4EL3iAdPpmH8OI1M8IbSx4rb8qc9q54BpsCq2893MUU3TnIq/BT/MYg92insK2NTSFpE0r3p9dC9GADL+LlwKU/etlYfQxLoaq83zQAqn1rpm9MPwJIYXovNin/QsLzaVWC1UMiryekeFtV8BI/X/h0glRN3yA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nbtpjSav; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nbtpjSav"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-7369ce5d323so2974872b3a.1;
        Sun, 27 Apr 2025 01:26:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745742390; x=1746347190; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tfx8AHr/yIS8tp/7G1Y7pM5wDQkLVkrc9vIVDSWIJkA=;
        b=nbtpjSavMT/LyqLpcXS1Fa+PnTQXrSRn10gj1DjxvZw4e0RKkRUZjwDK6pdedcKAO8
         0mqODOGqXRpEyTVYHCNv+xjy2OyGlPyn8fLKogpi468SIgTI43ZmuOU1vgdYgxqPQDzQ
         nu+GDZlpA6kOQxtTaLkAs/MW2coFwMqwm/ZkHFDYORUsYwrZMpo/lhfU8liHGXiwKWUE
         wi51QsZ1hFspa1RbN4iygJ7/WpVZKr99yq0a5Y4+zo4cJ34w8/Xdp9fw71DeCmSV+PN3
         pNJpNNq4J1B2yenKzPyxEEoaHI3AKJJcLCdDv+/yln4ukgVZ3In66f3p4831H49h2yav
         MkcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745742390; x=1746347190;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Tfx8AHr/yIS8tp/7G1Y7pM5wDQkLVkrc9vIVDSWIJkA=;
        b=o6rVlBaEo/17aRITdBDY3X4KHELxhiA77bbn7+G3+Qj2bzu29An0+42Lz6xzHlKIf5
         XJhs2UvXuHS1mrPI9uxNEWAzcFaJnsHRiYcIItmxYoUrtjzIfC9pKye56ZLu8lwsWRb5
         9SkF0FcAjWUPYTgCNqc9Li3bmLchX/rn+99WO5P1pmo8cC06ABu+JaEwO9B6KdL/5FT2
         27q/GnRhQlhXk/0q6qSIpxxFT0GatrRUi0kqHTrSOGkmx17Mhu60I+pEPZZv0FZ1ulsN
         gcJRhfQr5aUzK3np3sPlsuroTELF3nyQGM1O1UF+t7k96Wu8rFyrMA0geKcNAiIa9Uxu
         kESA==
X-Forwarded-Encrypted: i=1; AJvYcCUOz6GbNtCjF7zRsNf5n6Fvrk27jeRV1ar48CG98QoNR93dfT8f7WS4yPLnwUM0AW+m7K5nfx8w+VLU@vger.kernel.org, AJvYcCV8fW+3KpdxYs+N/81AmvH6EIker/FFqypajx2xdaARsbTMdOTIVqxE0TExvmm9IUgpyHWVOYkq+VWfkcfN@vger.kernel.org, AJvYcCWJZKzFhxWKlQe6pIWKCmXZaaOQk0HlSaeOiko1/KAS5Jb1C+TAPhSLHxj5uR43Q+CnmgozJPabrF7Y@vger.kernel.org
X-Gm-Message-State: AOJu0YwLQNo8X+GWGmc3xKDKSS+3Pvdg1n9uvPtsyR6q00XeEelRJTcw
	qCqQ6uDwSEMsZehkSGqWItEiWXVwWXSbdeYYJ2ScTyAO46uxC+FK
X-Gm-Gg: ASbGncvdsyD8PBM+A2rOlZe84dNTsGsUXrFM2WNEfmjhaq+CaxzSFk8N853MKpn70TD
	xoeQ6NRf55amWKzFIFUJxczodtC+8vMyYhviG9jTgYFm8naUrP6uzRZI26d1/Kp+KXcu753nghK
	sCPhOJ1TC0v/7Tc0/T7nVPgaGTGX9TR2NXJ6lau4iwe7ocec4Qcoq5mO4S569Gg29kGDrrYcoRV
	97fqeToO0dmfl2/yxGmGaVW0SNNylXjQaSfRmfUql57j2ORxhOwj8+qUzkGT2q1TFsmyRrxYORt
	PYi3xusJIxWpdssdfOkRaVoVKS1P1x3tX1a7v4oOZr8o1CAjJ7pulQ==
X-Google-Smtp-Source: AGHT+IEzt7O6nxfbxNZZfuE1bP+CHD3uFhriBll+5j0uMVFN7BYF4H32/W9H2w3LsDhK6SwCjKCA3w==
X-Received: by 2002:a05:6a00:114b:b0:732:2923:b70f with SMTP id d2e1a72fcca58-73fd74c5d0amr10293019b3a.11.1745742390591;
        Sun, 27 Apr 2025 01:26:30 -0700 (PDT)
Received: from localhost.localdomain ([14.171.43.210])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73e2549f570sm5900852b3a.0.2025.04.27.01.26.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Apr 2025 01:26:30 -0700 (PDT)
From: Nam Tran <trannamatk@gmail.com>
To: andy@kernel.org
Cc: geert@linux-m68k.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	christophe.jaillet@wanadoo.fr,
	corbet@lwn.net,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	florian.fainelli@broadcom.com,
	bcm-kernel-feedback-list@broadcom.com,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Nam Tran <trannamatk@gmail.com>
Subject: [PATCH v8 5/5] arm64: dts: Add LP5812 node for Raspberry Pi 4 Model B
Date: Sun, 27 Apr 2025 15:24:47 +0700
Message-Id: <20250427082447.138359-6-trannamatk@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250427082447.138359-1-trannamatk@gmail.com>
References: <20250427082447.138359-1-trannamatk@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the LP5812 LED driver node to the Device Tree for Raspberry Pi 4 B.
This enables the LED connected to the LP5812 to be controlled via I2C.

Signed-off-by: Nam Tran <trannamatk@gmail.com>
---
 arch/arm/boot/dts/broadcom/bcm2711-rpi-4-b.dts | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm/boot/dts/broadcom/bcm2711-rpi-4-b.dts b/arch/arm/boot/dts/broadcom/bcm2711-rpi-4-b.dts
index 353bb50ce542..2f058cf5d76e 100644
--- a/arch/arm/boot/dts/broadcom/bcm2711-rpi-4-b.dts
+++ b/arch/arm/boot/dts/broadcom/bcm2711-rpi-4-b.dts
@@ -152,6 +152,16 @@ &hdmi1 {
 	status = "okay";
 };
 
+&i2c1 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	led-controller@1b {
+		compatible = "ti,lp5812";
+		reg = <0x1b>;
+	};
+};
+
 &led_act {
 	gpios = <&gpio 42 GPIO_ACTIVE_HIGH>;
 };
-- 
2.25.1

