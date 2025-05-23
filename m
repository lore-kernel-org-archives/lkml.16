Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A456221C178
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 07:19:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747984771; cv=none; b=kbUza51jtHuOITZ/RocSwTFlNwxbqa65Uo1KsECFHHJ6tktMoJSK7zZARPGPMMdv/zYcHn5bHNPTWBHnX4TJ47R+DYMi6X2FXz6oQYvep1WzpZsZ5t2IDXnxHaUpvzuwJZ4nSztOyQkM5lC38ngCRxNloL1Fk1ZUSZFaV4ZUuY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747984771; c=relaxed/simple;
	bh=IkqU1+YOZQL5nm1ikl+F6IOi48x3OtFpXoZm9jK0g3E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SbwGy9BiVSQeg/im59j9fOUPKlJW7w82BlhJvMnIaJfXI/eyAl7y8FAijyZ+UCzn0RRsth8KG3cZOKjM88Qxf8L/q4CNgHNQnG333L9KrvBxeZSO92SgAnKgwahCv7lh8xgTQ5RKpEA6S2Yap3r4xOiIIQtvcRoRHSX1wzZIcyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=A6KSB+hi; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="A6KSB+hi"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3a36561d25cso902026f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 00:19:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747984768; x=1748589568; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jfvyOT2qQJmDemukIqtuWAp3lV9Gs8pt3uqlQs5zhio=;
        b=A6KSB+hi1KH202Fn/R9Yh153f0JYVsnfDlfsoKfxWejUoHZayHxU4zhE9RTrVGzPFl
         pieGn7PDpeS5x21IiWBFuEG9zm9RoaH56mhbf4WLdrFt4LtGc91zc97dIcLOZfkvuRDf
         TJcvdcnoP1VQ01S+nt0TbUcIcF6AiB20Zc4/cZpJfmIMjWPLS3XclteWd2TuYlYgx+H3
         OqXKApXXT+TuWbxJ8bqfbV3/Kp5rSWhCvCMurec1ZX61/VfEMnm/NPRZvun1xPER369U
         8TkSd6nNt9hUWfPM4U3HHMqwwc56QqshMY6RHsvsfIuvZFqWc0eFRJyVat2KKvXYUnuV
         gOnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747984768; x=1748589568;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jfvyOT2qQJmDemukIqtuWAp3lV9Gs8pt3uqlQs5zhio=;
        b=AIHlAIQ7YvphHozuaYUkuRgk40fpakCsIrcXlzyxPQLvdG2MK0uJywdgrJwO8CmstX
         9/LrxzAgm3Cje4MidKUNyAU9qGXZ8BDTZP7uV9wrVA/MIQvPGfV4Br7uqQMsSAZ6C6et
         ywJDp6/7aUQrlvNCsBERtErsBR2cWIp2oqZKs50yD+v6roMmTaV4hWy+CjmFG6tbIkCh
         zcUZRVoGP3OiyJD7eTJ/nb8ZKRY0via34V5ik7jD91BFhm36rmzTSoo7K0EBmndJHMwp
         1d3hApQ9rUbLpXGBWP9E42ZMZbcjaNdqJfCEYET/1z3Tt4YzqIKBVfJNNBtCjwQhbkQn
         6OJg==
X-Forwarded-Encrypted: i=1; AJvYcCURJfpUS5sAyx0tFYRjTh0opfm1I6ps+8eU2pkI67YtkUUqvY/ck32Myu5kHbKeZoGZr9+tKudsJS543XM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3jJWe1lxo6n/d1JM3jmoyr+qa7PfwB4YnpPLUywpYOmwhU8XP
	i7fh2eUFRnjBJKh7T7P7xB8gc3+PC7H5aZkt2JKkHKYzN3SLo4TBaE+Lg7M/h4HoRA4=
X-Gm-Gg: ASbGnctZpG6DeGDqUjdXR5yEk1lmN8rp9Kp+Kdrz54bqKrftI1wKASzWW67UnG11Nyv
	rXH62s2+oJpqknwpK34zgemaC649itVWlzd6/scoYmYmL8j3Ow20/cURIIbrh+SVVh7/ZaRGSvP
	IS4ThFJKnJ/R66gVyVZtf+WRRA47VvXFaAJVNPkMKuFKHcOlFZaQt/1BGtUdEw/qf1v35Nca1W3
	zqVPnnFIZmh+z+7x2W9PIFxdcxYR1LVoCDSFgLq2w2bHAVhKxg9kkhcXkqidSfW4cnoNAOiUC00
	cpNUJ8NtkLUR96X1C1Np8CxAZtueLvpPmy/kepqTFOz32JOM0VD75HSEXI2uNg==
X-Google-Smtp-Source: AGHT+IGBNOsoOK+S41pp3KUoOq+S4YrQwUjMqxnUCD7vywhBYAzJhRIuqVg+IYydO5PV7DwyagRBFA==
X-Received: by 2002:a05:6000:2384:b0:3a3:5c95:573f with SMTP id ffacd0b85a97d-3a4c2b3a3eamr454612f8f.3.1747984767899;
        Fri, 23 May 2025 00:19:27 -0700 (PDT)
Received: from kuoka.. ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a35ca8899bsm25436432f8f.62.2025.05.23.00.19.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 00:19:27 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Stefan Agner <stefan@agner.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Xiubo Li <Li.Xiubo@freescale.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] ARM: dts: vfxxx: Correctly use two tuples for timer address
Date: Fri, 23 May 2025 09:19:22 +0200
Message-ID: <20250523071921.43216-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1052; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=IkqU1+YOZQL5nm1ikl+F6IOi48x3OtFpXoZm9jK0g3E=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoMCF5bxPJSgi5/ne/yPzZtpTvhOereS0imHenz
 /t/xfi8AzOJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaDAheQAKCRDBN2bmhouD
 1/ZsD/9IR1yuwC98pxQq+Pv+yBs9rB2sGVNDOWYzxKChgcmNhPD2QJ81RbfSVYSVy6LniSCZ8lg
 Qwv3jyDqIiA8p4LaIt4/W0L/JvuBm1Tagbj2ah3/VyXbjZ+ai0dkez7mLbnngPo4/1CZPYBvOm5
 NG6HmTyOEaW17YbMXe8s5xDtuDCZSAYEP4kvpl0+nPWvRChjexAMbM4WquP3kwpRNHsYssLmAuL
 aKgHT3mMg4iKbQDg80/12nP7ebmxv0lJ4afrTTbd9x1i0iL2agh2yEpSK4Pk0K0MpAA2qEcYEwK
 u3Qeu9AFWLeriKZFPnc/Uz5dg7TuQ2Mju7MDSro+8IyCSx62y92hLpdcU5KrWjyhV3iNcIO1KtT
 Ue6v0t9HOZmXPV1mw6AAUYSZVdtOtUdXD4N4b5LpX3NBOKwHzb5o8+9eKNRhyjSicwiSWFlS8t2
 PoMjjP/Fpv0bdnDl0dzBUIUwpWC+DYSF6lGtWs0MhLPaSjUOQ9hUrb1AfULf9oNQMIEGK2TNO1E
 fteS5GDunzy8P6UE4r/SixFq8A+SuaGZOg2f8qm2ehv95zCP2Y3jh9haPeRKnJnPJWOliGfyK4C
 9N2VmeznJMolBRpDqo+S1+4oUOImeioh//CuEAX+A2PsLKe+Phcsik2GxkFHkS8UXB9fItfCcRY WikOMLyDVIZ/ZrQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit

Address and size-cells are 1 and the ftm timer node takes two address
spaces in "reg" property, so this should be in two <> tuples.  Change
has no functional impact, but original code is confusing/less readable.

Fixes: 07513e1330a9 ("ARM: dts: vf610: Add Freescale FlexTimer Module timer node.")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm/boot/dts/nxp/vf/vfxxx.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/nxp/vf/vfxxx.dtsi b/arch/arm/boot/dts/nxp/vf/vfxxx.dtsi
index 597f20be82f1..62e555bf6a71 100644
--- a/arch/arm/boot/dts/nxp/vf/vfxxx.dtsi
+++ b/arch/arm/boot/dts/nxp/vf/vfxxx.dtsi
@@ -603,7 +603,7 @@ usbmisc1: usb@400b4800 {
 
 			ftm: ftm@400b8000 {
 				compatible = "fsl,ftm-timer";
-				reg = <0x400b8000 0x1000 0x400b9000 0x1000>;
+				reg = <0x400b8000 0x1000>, <0x400b9000 0x1000>;
 				interrupts = <44 IRQ_TYPE_LEVEL_HIGH>;
 				clock-names = "ftm-evt", "ftm-src",
 					"ftm-evt-counter-en", "ftm-src-counter-en";
-- 
2.45.2

