Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3E5F211A3D
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 23:56:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745884577; cv=none; b=mXLAN22T9u64JoBLmjxjmEjJf46u39/5Afb1itsjtF8zzHH6JKf4qznlFw4aTDPFXucDmI4LqmiT9VaMnUWXCNLqLrQlfvFtUKOvObOW3anSoWQPN/rO7NA8JmYfA7H4J2B+ssZEtnn40MyIf+AjQb0Gur+cQiLMct+M4W6aOgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745884577; c=relaxed/simple;
	bh=bxmFw1R18RCWVmkLj5Gw+iQe32a7Ap/yaP+7IqnIbJU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Op7XFF2tTL8Xcjdt9boPJQ1mbeKKHCdrKmoZNCnRChglR45T0SGTfe7kP9puTMLHTkGJdyZI7eZbM3+s4hECL+XlI1yn0A/RQHR7i57efbNLLxMFYES7S+66p3yRuBqs2nyA4WYnch6esrbgLQAgzRCPlYgQDOiEYDkOaaTYugA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=simulevski.at; spf=pass smtp.mailfrom=simulevski.at; dkim=pass (2048-bit key) header.d=simulevski.at header.i=@simulevski.at header.b=Zh0zNXN6; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=simulevski.at
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=simulevski.at
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=simulevski.at header.i=@simulevski.at header.b="Zh0zNXN6"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-ac3b12e8518so905918566b.0
        for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 16:56:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=simulevski.at; s=google; t=1745884574; x=1746489374; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wB66ToxGKEi9eBswU4ICqh+7barhwHPSPNy0x89YMy4=;
        b=Zh0zNXN6D5U4hIy3YZHGbFWQW1fbAcw9p9uNazDHQhHhs0VZkVhkyFuJI6pDUWsnSm
         sdMl6Jpp+ZLWy1cVViPoyt4dcAMRGy4Z8IKvmcF6QPypmx9+U+hBO9v+WASconf0+z+H
         IUxOKz7uLYZPnzMB/qEb1AkWKWCB+0O4h/dUhT0VTZSfLE661rAMwBak7YXgBm/tHtdA
         ioY48RsQ1Sh5QbXecud9cpMGDDcHLomMZNSmDZ0Dxl8OZf/ZU81HXq/mwrVDdgAP806w
         rHMpUSNqjA8bYK8PbDRRvuNB1Me5drtx8TkZIW6EpxUzIrvl6vIGlPipve3icde+5tZp
         LETg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745884574; x=1746489374;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wB66ToxGKEi9eBswU4ICqh+7barhwHPSPNy0x89YMy4=;
        b=Ak9jx9cQwzi8UDaQswqWTCLLI5uG3ueNwxFlI0kOKagaRRi+mp1WUaE70RV8yrxAHK
         wvdSFCguGisL3AXL0hQbjhme6rfyHtgGr59EajaSnpzq2rOm34dDHDnG1AVAbGBOpCj2
         zI1glBnhH7wP2j1u0cklkDYd/vURDlqRtK0efe2KG6pHzwJXTHM4b/TW+WcZlPpcxKHR
         m0Z3UP0tKlEhGKWp5qk0sZG2Vm5fTufwLBVjcoIK3ypnfJRJjUgEE68VaGjKIF6IYGlv
         6W5lJrkhPDyqXK2tuh2IUH0C6fVonlBiPjttPEvUBNfGaFMaNTDaJymkFUuwAFJy1aG+
         uSzg==
X-Forwarded-Encrypted: i=1; AJvYcCXlwb0pmb3650LtcmsGFO115TFqXQ+pfFHWJAzYdzayH9GX4FSGXJAF4tzBurLjaHDOfiDEmeF93GhM2CY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzBc9SwFcVgWxnZCwylEImSZ5jWUpnl7POdqzWDn/RdxaNgVsYO
	TwdIkTC94ncxPMoQXvO+sZ1ktifbAI95ZYxj7bLAmqyUzON4TV4LPznD9LW7vKI=
X-Gm-Gg: ASbGncsSE9JK0LBX8L6gX7BQrOiFDyAZu73rQiZfvAzk+soLr4axQBZ2+3JRd89XUwJ
	jYE9hwNRBJhSbdnEPCb2hLrxeawySsTWUXOxLwtUC6PPJHjGEBpLMHl28Ll+egQNYsTJlf2mjpd
	SkwVMq9sJYCM0VYJ08cIstacKWYh3JKr4vTu62omYGimdLSO6HrLxint7D8cXysEQZwkotAKHRj
	INtZMy3bfuBD+IPSi3UnnxjMPWIh+Me58EB6L0KmVj0R6Xx/PHh+c5eQFBU9cdgQd/B66A3dUht
	w6hGI7m+2iJBH0eE1S4c4D31VL4Efa4q3uZ31+YIVbpdccQ1gmYu8mSH9Ql87Yc5BQc=
X-Google-Smtp-Source: AGHT+IHrWau5pzqlu8AZB408xcJLGbooNHtqSnUwY0qLzTMn1zlXklldf4GHYwIOxwVXsIAd1s9Zzg==
X-Received: by 2002:a17:906:c153:b0:ace:31bf:30f3 with SMTP id a640c23a62f3a-ace84ad7e97mr958675166b.43.1745884573629;
        Mon, 28 Apr 2025 16:56:13 -0700 (PDT)
Received: from fedora.home.simulevski.at ([91.65.134.65])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acec3d78514sm68656966b.131.2025.04.28.16.56.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 16:56:13 -0700 (PDT)
From: Ariel Simulevski <ariel@simulevski.at>
To: andy@kernel.org
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ariel Simulevski <ariel@simulevski.at>
Subject: [PATCH] pinctrl: intel: Document Tiger Lake reuse on some Alder Lake platforms
Date: Tue, 29 Apr 2025 01:56:10 +0200
Message-ID: <20250428235610.11324-1-ariel@simulevski.at>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some Alder Lake systems, such as those using the PixArt I2C touchpad (PIXA3848),
reuse GPIO IP blocks similar to Tiger Lake. As a result, enabling
CONFIG_PINCTRL_TIGERLAKE may be required for proper I2C device detection.

Document this in the Kconfig help text to assist users encountering this issue.

Link: https://bugzilla.kernel.org/show_bug.cgi?id=220056
Signed-off-by: Ariel Simulevski <ariel@simulevski.at>
---
 drivers/pinctrl/intel/Kconfig | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/pinctrl/intel/Kconfig b/drivers/pinctrl/intel/Kconfig
index 248c2e558ff3..b8e1436b04f7 100644
--- a/drivers/pinctrl/intel/Kconfig
+++ b/drivers/pinctrl/intel/Kconfig
@@ -54,6 +54,11 @@ config PINCTRL_ALDERLAKE
 	  This pinctrl driver provides an interface that allows configuring
 	  of Intel Alder Lake PCH pins and using them as GPIOs.
 
+	  Note: On some Alder Lake platforms, including systems with
+	  the PixArt I2C touchpad (PIXA3848), the hardware reuses
+	  Tiger Lake style GPIO blocks. For proper device detection,
+	  enabling CONFIG_PINCTRL_TIGERLAKE may be necessary.
+
 config PINCTRL_BROXTON
 	tristate "Intel Broxton pinctrl and GPIO driver"
 	select PINCTRL_INTEL
-- 
2.49.0

