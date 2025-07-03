Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC9471D63F0;
	Thu,  3 Jul 2025 08:45:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751532356; cv=none; b=LmAlbzyo5m/lzCYFGWo/OQ7+bnAbz1Z7kGcQ6AB4wrbqeB8yWd8tL/VdStrMr2duvQQRT8hUyTS0mTGQevDc3X16wxauuGQPIpS82gZSjEFrALRgXP1C/D8o6t4MUh6Q1l36lHnwg13yhJ8dYyl3559YjvqEyiIMcK1Wtdnr2yw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751532356; c=relaxed/simple;
	bh=1tGtbdNqK6gn8AkLdlUlA7WqhmtKF7KK8+Gop3r51G4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Z2sQ6rU/WxC7jjxyH15t8qqxMO7xxSUH03+KVMZy5iCA5vMXrUCWoD04Z7wXiTbqM41G3WBHBhxqFnszr5/XmUXIQYu7bZj5vyjEXw+2zS55sCHmqb+QmLrvNT22ysVE+wmPbCHJ7nbKeRn4qIex6bPB0fDyV247GmWK8KRwlc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HX2YDY0/; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HX2YDY0/"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3a5257748e1so3628101f8f.2;
        Thu, 03 Jul 2025 01:45:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751532353; x=1752137153; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VZZ5suwPV8JvNIE1HcHsv0fY/f507EGEB4rZQRxbOPs=;
        b=HX2YDY0/ij8rt7pEtKZPWMHqL1m3x3k2erY/IpaPHhEKNKYz0B0yS8u+acPpHpC1As
         twFBEBzH5pUIzIizqfzrsAUb7VHTV5Y6DjKRt2uUG+62bmGDm3LmxKu0Cm+Wg+KTIzJZ
         zR4GzNod/8f1WODp3yfB7Y6Ju5UejXYwaEcA/VABgCcqcNitwlw6aDs5ipZxer6sKMXW
         1YzYMLmZg4TPGFrb2W5oKNCHQrzUUOcOuW11A6M48cU1BDZz95X24khh05hs+A6bFhAX
         iVcEHn60IybR0bjX3le82Knw5criLGRtq7n9K4PLCWxHTvA2YQf6BDY04lRYMVvaZPtg
         qJog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751532353; x=1752137153;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VZZ5suwPV8JvNIE1HcHsv0fY/f507EGEB4rZQRxbOPs=;
        b=PXORWUR05FsJgcsrVEFhl4x2YECjJoh9QBQW2/ul/Zk2alnYUA59/Enu71beYxbR+/
         H1Ma9pNozKiBNnUz/4e8ssnQvtOpm8WV04t0c0R7ZzyH8t8YXf+UBOoOUs+ED3DTwUA0
         z87Cqb/H/9ATUde7Db465Lrl4uJVrgbDX6/kmlZsXDKLC3+en739RtRbtlbyR0pgRl2q
         fgUzQ/D3UVNoU/sVTJusGnKwMzCZQtTlsk2WVkuKJZ4e1eIz16XpRRJKZrwjt1sQS5Dn
         62WqT+dj6EdemEQ+cJj5hKDVh6giEahtexGYHftGnDvwBYU2myX9LFWFRNrldsP2pATv
         7UhQ==
X-Forwarded-Encrypted: i=1; AJvYcCUFCkSCH3tNV/0bb1McPK3JEnJblCkSSnWrWnY5M3cmVZrP0rrITcQFFS1ACXJLGNt7purjomvekiYr@vger.kernel.org, AJvYcCURHkr8UCNfcGy9XcbZ/HQ/d9EfbgmB2aNzxp+r1X+TqT9qx1UPzF9JM9Q1afAjhDD4hC4zSnmzzP/V5Nje@vger.kernel.org
X-Gm-Message-State: AOJu0Yyoh2T/DFYJG8zr+AiSlY8m3V05aW0ASuBjyPfU6D4HbnFVBBGQ
	bDINGiPV0TsK7Y3TtaTWSnTnbMxVgtKhA1cNkVgjP25pIc1sZcmrzrOH
X-Gm-Gg: ASbGncsN8rdbX/kICi7t2TY1qRSGZ/NRLzOjcRjy56819eg/xy4Qwr33AH/6gfpgjzI
	XnCPTT+BnpeOZz/JtmPZfDi8fOEk0LdMYkN1d3zkQxNWcj1jvwzRKYeskvAk4p96e/khS99BNg6
	FLF4C9fa6zEdGqgQDGjfh1ePJ1JYtDdnyMQ1g9rsJvbfVUvS04+cjYJITJ8ql18bx9vn0o4jF/P
	RsAdzipBBXKZ+oGIMTUDKEKL2TNMmiMiDJjxMkiJdh05afmKMDWVc8VGjmBsYsO4iZdSvDlnq+E
	GKf4DEE6+VGEjw0lqIuWxOmRYMm2u4eGVXZzeyDUAQngCp0aFDBIbBLpUmRu6+4P55K4MaiSuUy
	Zy6cxm8DdjbmXIZjt8VBf7yUOGPEoI+vE3hQWmgvr0CEGokyMNJ2+Lae2NETr74enH7pn
X-Google-Smtp-Source: AGHT+IHKVzrFH8EdFJRt9+sIGdgnsO77Zqi7iCWJlIKvDOF7Fz7qaovoCqBOU4nm+R3zMocdJDsu9Q==
X-Received: by 2002:a05:6000:2f85:b0:3a5:2257:17b4 with SMTP id ffacd0b85a97d-3b201ba2a5dmr5403191f8f.55.1751532352765;
        Thu, 03 Jul 2025 01:45:52 -0700 (PDT)
Received: from partp-nb.corp.toradex.com (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a88c7e76e1sm18392949f8f.16.2025.07.03.01.45.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 01:45:52 -0700 (PDT)
From: Parth Pancholi <parth105105@gmail.com>
To: Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Parth Pancholi <parth.pancholi@toradex.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: ti: k3-am62p-verdin: fix PWM_3_DSI GPIO direction
Date: Thu,  3 Jul 2025 10:45:34 +0200
Message-Id: <20250703084534.1649594-1-parth105105@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Parth Pancholi <parth.pancholi@toradex.com>

PWM_3_DSI is used as the HDMI Hot-Plug Detect (HPD) GPIO for the Verdin
DSI-to-HDMI adapter. After the commit 33bab9d84e52 ("arm64: dts: ti:
k3-am62p: fix pinctrl settings"), the pin was incorrectly set as output
without RXACTIVE, breaking HPD detection and display functionality.
The issue was previously hidden and worked by chance before the mentioned
pinctrl fix.

Fix the pinmux configuration to correctly set PWM_3_DSI GPIO as an input.

Fixes: 87f95ea316ac ("arm64: dts: ti: Add Toradex Verdin AM62P")
Signed-off-by: Parth Pancholi <parth.pancholi@toradex.com>
---
 arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi b/arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi
index d90d13287076..1a6490572453 100644
--- a/arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi
@@ -426,7 +426,7 @@ AM62PX_IOPAD(0x00f4, PIN_INPUT, 7) /* (Y20) VOUT0_DATA15.GPIO0_60 */ /* WIFI_SPI
 	/* Verdin PWM_3_DSI as GPIO */
 	pinctrl_pwm3_dsi_gpio: main-gpio1-16-default-pins {
 		pinctrl-single,pins = <
-			AM62PX_IOPAD(0x01b8, PIN_OUTPUT, 7) /* (E20) SPI0_CS1.GPIO1_16 */ /* SODIMM 19 */
+			AM62PX_IOPAD(0x01b8, PIN_INPUT, 7) /* (E20) SPI0_CS1.GPIO1_16 */ /* SODIMM 19 */
 		>;
 	};
 
-- 
2.34.1

