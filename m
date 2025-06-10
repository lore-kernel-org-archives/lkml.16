Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77A4B242D7C;
	Tue, 10 Jun 2025 17:04:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749575089; cv=none; b=RqDOsvPZr7KxJwEfSSI0huUgMYsBzWFsyPhAn7FAL8rvzHzkO6TD2LBQNhR7nWXiF/TyXmcBHrMzevn/05pf/ovXi3MKQna9J2wBYQWrXhHsGj0f1FqDEdkfuqvqZu1MrJOzF+x+u3D+EHtUn16EooC8ZRNBb7NDrX8vZe55C6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749575089; c=relaxed/simple;
	bh=FeGGqTV3hMLvtuAUwQjWTQyZXr9HDJB5RrZEzdTh77s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=N9MBCpgVgVTIIJ0zzlsjnQLFHLg+O9P2JXE8vgZiQ4Cfji9aZdBli1DxCKTzdt9cRjLd4+WGW9vQtcl34ZwVR3PjgpewDgwPi8aKi9/EL5i0LzUMBv8sDoUWZpI9cyivw7U4wYjTRQrTsy2afCSpBMJGrEFtW3B9THLR7kYPrzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W92UpArF; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W92UpArF"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-234c5b57557so53443105ad.3;
        Tue, 10 Jun 2025 10:04:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749575088; x=1750179888; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=l1SAMsGs37SGD+chia/RQyRlWwAaxqTB5CEOsEmZAX0=;
        b=W92UpArFJRh9sgQMpe/ysaNsasvC7Fwa/MprFd2w9/aUTaEpkOWGVBMP/cEH+uliH6
         aTYVFPgVJNoFniVlOsa32P9OV+iuBtbPhnJppDuhxE7ZFF+ClK7NNKzY1+oXeBmNcXfs
         +pL2gVpP2Wu8q+e7xvFBArM+eEv8Q9cjAzMvVsnpJ3YUtd5I+xhip1qKN4VCb59W7ziZ
         T4MtL7OE2zKNL8pk19fv3hgLItX1i50y0PT5uAcjwoUrNB1RxWx4vSbe2Mj0+UJYhpie
         24D3wqPXFM8uSvBsTk1AKYaDuuXvVc92rxx73FEWTSzdazpM9yPc67j7G/ATu+X+bmFR
         78Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749575088; x=1750179888;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l1SAMsGs37SGD+chia/RQyRlWwAaxqTB5CEOsEmZAX0=;
        b=up1gy8zVThOfUxeegDlBG81S80PM3SIBThhNgtNa6+35k/DZGvKeOjrloQGmhuxN7r
         fmsycqicBEjOwgFegQmqVk6WXPRlUKpEeaOtJEtyCaTqcAtUlykW13S8U0FqBf0nRdU1
         00ZmGc74DF+CdXGDhUV9CyQw/cNnqICuh0Hhb5BYRC2hH3oJU6UG1f00Y3spJuOqiqj+
         jjpVKo2S1MlfTYgWHol+4i5SUcQilaG3hhm7JR4xNzjAHT2/QqWkkRG+mtLkLNbBUhfF
         xXwXoomDCLtWRlBhHTsB4TTMkk8y3sHzXpucC204O8Ivm19dJ+ZmhHxkgq2ZYNBDMT/6
         c60g==
X-Forwarded-Encrypted: i=1; AJvYcCWomffkN2EcH0iSr0Fw0Lyobi89fzScTm2+PW3jP6sUEu9Z0ARTkvLf+nDY4xuijwINLN3lPUWpa0CzcNk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzrsct8DQB+QyqqsWU4aFv79+p7tq5r1jZl9gFBD54/jkKSP/lm
	GMKZN6VcnEatHT7EH6F+bmNCIpU/IY9N6YRtb4X24oZWQf40d5u5pEuj
X-Gm-Gg: ASbGnctd/UKjjx7N9hxMzsnccGt55dLysNbnMUs5inuaU5ZaEa+A25Mq4DiufMZeTk2
	DBy+8LCPYwJnOJ4xoqE6YlswzwgDhruX3SSEQHMN7GBBPaKhcBsNc0xL5dswT/FmwiSnujRPq8E
	GGKfSHbpQMsJNR3p94kjpldxpw5k7K/kCwBqvYnv2U/gBcWremWFI7exUplWCCaHzm0ATjElBru
	8dsXS8Xh5jz1vs+3vYj3wG2XJipf7v7Ay/q8e0fb7mAMdWiLCaJ7J3Sz7KcWEDv3hhtZCepVB+I
	ZcEDx0HIChrDd897ZBbidFd5iO7Qa0Au5EOLbf3jIYDa6r1o5F2wt/J0dVY74QN6ScwkgI8NLmY
	sG6jN5bMD8ZKMGzEqKwYLrEJN3C+dCBNRZF9KQ+4EiwydTJw9XQ==
X-Google-Smtp-Source: AGHT+IGN8fWm1wd/rYS+vEB4RxNmREuCEW79sACTf92qnjh+StZfwWgh0XTKc+e8n8+kZsmS0X1KRQ==
X-Received: by 2002:a17:902:c94c:b0:235:81c7:3c45 with SMTP id d9443c01a7336-23641b26eeamr523415ad.46.1749575086817;
        Tue, 10 Jun 2025 10:04:46 -0700 (PDT)
Received: from localhost.localdomain (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-236034065edsm72958615ad.185.2025.06.10.10.04.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 10:04:46 -0700 (PDT)
From: Potin Lai <potin.lai.pt@gmail.com>
Date: Wed, 11 Jun 2025 01:02:09 +0800
Subject: [PATCH] ARM: dts: aspeed: catalina: Enable MCTP for frontend NIC
 management
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250611-catalina-mctp-i2c-10-15-v1-1-2a882e461ed9@gmail.com>
X-B4-Tracking: v=1; b=H4sIABBlSGgC/x3MSwqAMAwA0atI1gaa4v8q4qLWqAGt0hYRxLtbX
 L7FzAOBvXCALnvA8yVBDpdAeQZ2NW5hlCkZtNKlqojQmmg2cQZ3G08UbZEUUontWHNbFJUa5wZ
 SfXqe5f7P/fC+H35ZZLBpAAAA
To: Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Patrick Williams <patrick@stwcx.xyz>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 Cosmo Chou <cosmo.chou@quantatw.com>, Potin Lai <potin.lai@quantatw.com>, 
 Potin Lai <potin.lai.pt@gmail.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749575084; l=1422;
 i=potin.lai.pt@gmail.com; s=20240724; h=from:subject:message-id;
 bh=FeGGqTV3hMLvtuAUwQjWTQyZXr9HDJB5RrZEzdTh77s=;
 b=lRWcKzdCWOshs6fYek3iMrxbKcUD0Q0b2Tn4RqRTi0y+t19th2ZR1mJJ/o5nxpConHX4xZfj9
 M55WJ2w/KdyB4EiBoVxPni3QOtFCBWVk2dtVdkjJqPvrVw6cQn81u4y
X-Developer-Key: i=potin.lai.pt@gmail.com; a=ed25519;
 pk=6Z4H4V4fJwLteH/WzIXSsx6TkuY5FOcBBP+4OflJ5gM=

Add the `mctp-controller` property and MCTP nodes to enable support for
frontend NIC management via PLDM over MCTP.

Signed-off-by: Potin Lai <potin.lai.pt@gmail.com>
---
Add the mctp-controller property and MCTP nodes to enable support for
frontend NIC management via PLDM over MCTP.
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.dts | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.dts
index 5fb67ad2d777..8d786510167f 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.dts
@@ -797,6 +797,12 @@ eeprom@56 {
 
 &i2c10 {
 	status = "okay";
+	multi-master;
+	mctp-controller;
+	mctp@10 {
+		compatible = "mctp-i2c-controller";
+		reg = <(0x10 | I2C_OWN_SLAVE_ADDRESS)>;
+	};
 
 	// OCP NIC0 TEMP
 	temperature-sensor@1f {
@@ -926,6 +932,12 @@ io_expander14: gpio@15 {
 
 &i2c15 {
 	status = "okay";
+	multi-master;
+	mctp-controller;
+	mctp@10 {
+		compatible = "mctp-i2c-controller";
+		reg = <(0x10 | I2C_OWN_SLAVE_ADDRESS)>;
+	};
 
 	// OCP NIC1 TEMP
 	temperature-sensor@1f {

---
base-commit: 4d75f5c664195b970e1cd2fd25b65b5eff257a0a
change-id: 20250611-catalina-mctp-i2c-10-15-9b7e94460bf8

Best regards,
-- 
Potin Lai <potin.lai.pt@gmail.com>

