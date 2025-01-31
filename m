Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2265853368
	for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 17:17:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738343865; cv=none; b=fZOE9+pkyQM7ODBbGD830pUtvtwRBCUT4QPZAUlRFII/0zWI4QMl1iqJA6SRfIBet/KjQSNUE7tvMrF895RbDUbvOmyxz2EkHh1ee4jsuxyzQ3ICll6zBAC5rZS7rVBNvaWsPi+eD3CigPSQ7uTfEy12cKukFNHXI7nrnvjUBK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738343865; c=relaxed/simple;
	bh=o1Nb6NBvvvUzC4Nj+fUAGADD1c0p7c6r4SdqUcfysIg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bxHLBRuEZu1m2lFlDRAxRc5EyO9n9O6Nh1m1Pd911gyQmuhDWpG2O+IU6nSje5/lKIBxeZkKlwWIcSOeDsb7CRnLNeIdVmam9Qp1SbdCBhB0kJAwZ5ByC8g9mkufewgI3rQzmKb4YhL3ugk9OctLcdvVp4bBffo0BsWGpfXYV2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr; spf=pass smtp.mailfrom=sartura.hr; dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b=NebiNyVr; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b="NebiNyVr"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5d414b8af7bso4336483a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 09:17:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1738343862; x=1738948662; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RpXnOFSFJsdENn+F4QFZFC2yQiCx8f9L6Vgq8hk8nTs=;
        b=NebiNyVrnQOv9+202q4ToGL0Q3sXU7uAjaakpp+TZ/EXxwAnbASyVhqUzfAv4tfHey
         3oNiebp6Uuq5mFyMyHiYGYfMTjpMSGNMmC6IqpZu7CxmvDAJBxaPjKwYxdT7tJH15HD1
         HVkQDoDurWnKNIloC9Q7jGYAohpIcTOUbLBLFYY1hRuXBu3SxlOkJi4V5IAJ+qrpiAIr
         Miz3C/9+DnoQNYzwyGkR4EDOHaXiy1/Q/doI8rP6/7sVG1X6/culvxQP2RehJjE20uEl
         pMTebjhRTIWr9Myxhs5+Xm3fSFTMTpbSHRq6fXV82AeCYUVbawxWCVsHVw8f1MqD8NrC
         f6iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738343862; x=1738948662;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RpXnOFSFJsdENn+F4QFZFC2yQiCx8f9L6Vgq8hk8nTs=;
        b=rgYFGIKXtBnH3K8XW4DoQUPKcuqUf8VNjCNTGEPAoBMInkLPELey2yicM03khjf5SN
         KZbk4r8Js3WSxbqMn3eneHm0BqQ+L/JwQ/MrCtCxvGUU34A0MZxNja4QUZ21Aezudsq/
         OinQ8ozCta8NfYEtFQfabb8wkF8rCzqwQkLrTqtdAKp2TmVZSJ3UzcLg1DSxvUqlwysn
         bZNSAQTdS/lk9Va0gwBRoo//PK8YL/zZWcOonD8KCv6ul0x0IFTwvsWCw4XT00gnYCVB
         XBvvplEmmdB801l8ZMxEEl5JJTBME78A5kp931/wwy79XOOH90dpYK7kZvZAUqhvNXqu
         Pk/g==
X-Forwarded-Encrypted: i=1; AJvYcCVBa7xG9CSDmbJqzHNiGhVrWkK3xQBzVBMGPp0Ab632AX+UHCwtlOCUeQNEx65j2a6jz8FQ8BuqcBGBCsE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwT8bNADYynvGgWMKiXGiN1hKLQW3ArjBJ7qqOtFGee1dyFo9GU
	QQ0Xj0vM9v5E0WQWdx4denQ/tTf7vsXa6RxMYrhPTZgkEbl/Lx0XRUYC5xxl9hI=
X-Gm-Gg: ASbGncvJMUHC1MEoo6xwpWWexNQVQrN/oI6PY7kSMOXWyWP69MrNN1RxOF3jq8mX3y2
	ykF8u5XYSHs/16ro6HJfyvkbrJhk6o0YO7BuKQwdK1K9+EG1858+sRLoBJ/FWEypIO7Z6rnVLQJ
	op0/fB9x+CM9VM/5+ScVxNRP5gcIOT7h2ouvKv/zc4b8Tsvb0NaobgFL2WHKzhPO+25uTaXTqxX
	Tnrn7HQu6pT7wzi6frMnOovysynvZvbUaEXLm+YBX8xcXYR1Xecg71OVFw6qgrwqtgey00BJYjV
	MFtvF17EXlaOFsZys1OGIEjYsbMCEoJFBA2DvtVmg2/6iwf8TKoT4g==
X-Google-Smtp-Source: AGHT+IGXidhbVnMEkxJ9nSeFLHOKD38PsRpg8PjrysVhhJk5DRufZNR0NxcWPKP/dI3R6fpDrAizog==
X-Received: by 2002:a05:6402:27d2:b0:5dc:8fb1:d44d with SMTP id 4fb4d7f45d1cf-5dc8fb1d71emr194616a12.31.1738343862022;
        Fri, 31 Jan 2025 09:17:42 -0800 (PST)
Received: from fedora.. (cpe-188-129-44-249.dynamic.amis.hr. [188.129.44.249])
        by smtp.googlemail.com with ESMTPSA id 4fb4d7f45d1cf-5dc723e4b6dsm3142413a12.24.2025.01.31.09.17.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jan 2025 09:17:41 -0800 (PST)
From: Robert Marko <robert.marko@sartura.hr>
To: catalin.marinas@arm.com,
	will@kernel.org,
	lee@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	arnd@arndb.de
Cc: luka.perkov@sartura.hr,
	daniel.machon@microchip.com,
	Robert Marko <robert.marko@sartura.hr>
Subject: [PATCH v5 1/2] arm64: lan969x: Add support for Microchip LAN969x SoC
Date: Fri, 31 Jan 2025 18:14:09 +0100
Message-ID: <20250131171739.1044701-1-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This adds support for the Microchip LAN969x ARMv8-based SoC switch family.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
Acked-by: Daniel Machon <daniel.machon@microchip.com>
---
Changes in v5:
* Rebase on top of next-20250131

Changes in v4:
* Rebase on top of next-20250115
* Pickup Acked-by from Daniel

Changes in v3:
* Rebase on top of next-20250107

Changes in v2:
* Add forgotten LAN969x architecture support itself

 arch/arm64/Kconfig.platforms | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
index 02f9248f7c84..247835b08c70 100644
--- a/arch/arm64/Kconfig.platforms
+++ b/arch/arm64/Kconfig.platforms
@@ -133,6 +133,20 @@ config ARCH_SPARX5
 	  security through TCAM-based frame processing using versatile
 	  content aware processor (VCAP).
 
+config ARCH_LAN969X
+	bool "Microchip LAN969X SoC family"
+	select PINCTRL
+	select DW_APB_TIMER_OF
+	help
+	  This enables support for the Microchip LAN969X ARMv8-based
+	  SoC family of TSN-capable gigabit switches.
+
+	  The LAN969X Ethernet switch family provides a rich set of
+	  switching features such as advanced TCAM-based VLAN and QoS
+	  processing enabling delivery of differentiated services, and
+	  security through TCAM-based frame processing using versatile
+	  content aware processor (VCAP).
+
 config ARCH_K3
 	bool "Texas Instruments Inc. K3 multicore SoC architecture"
 	select PM_GENERIC_DOMAINS if PM
-- 
2.48.1

