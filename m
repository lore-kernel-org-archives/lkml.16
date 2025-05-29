Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC21F28F934
	for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 10:48:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748515697; cv=none; b=NaMoA44nweDvrjWoMU8eZY9blG6XESggnvJiP+CZrCK5+TTHQCxmNxb5W6ld+jCWbQHll62zix1GF6Q+YI05wsvo4kaoL6hi0xq82HZTmfRf09ypCAgWZdzSanR7lmies8gV5LDJkdCH5nk9czkAY2VOl0eNK7gcPmB9PNxwIDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748515697; c=relaxed/simple;
	bh=RRM404hdZVflbCbuZ7OBxFTgWWaneCmtEfkgg/Xp1Lk=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IYSWm/s1Excc+PIFf3yTFmWKc6Xm+NLKlCLvul5FFtx9tojpN4HO2ZMbkFw2tPI/7DsUfkrF74c0UkOiT37VFTra42pydJSgmoOCrXEF/P53zgzCxljd7ROygVgWxplreLW6hRBBlTmkF/fVB5wvq2fb9+yf0sFd8sMY3usdxFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=aptyvc0j; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="aptyvc0j"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-acb39c45b4eso106469666b.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 03:48:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1748515693; x=1749120493; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hTCgL7Vlc0a5ielumzwkk7bjVhaA3TYeVWaUN3CkeyQ=;
        b=aptyvc0jIAKCaTd0t/ly60+cWkgqGHqrIKbdEvjAedG2fLvKmcpPc9NsmTXEODizKJ
         GePKiTPjZL+XT9KxUqxZQGXM0+K/44/hIWB/HSlt3RoSOlhp1AWfz4gWVbXOGnxisDr4
         yP6/nl57zjLZaEJ4O+Diz+460Dt7rmEHI+M3FAPF6vy7095lnCEIXXTJdJ1q+cf5dGz1
         yJZ0rOl8dOSpdMaU7jPZ4Vq0q4bA9hbqeHBGw/2H29LJqUH/5bZNiBhKISNXbFHsEPPY
         UQ2lTHq6Ya3J87ByzJmsKP2cUaN7grgMiDYetBSCd0xcyjEEQs+EdHBmNPcUSY21DI63
         peFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748515693; x=1749120493;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hTCgL7Vlc0a5ielumzwkk7bjVhaA3TYeVWaUN3CkeyQ=;
        b=bwH8oKDSUyAxIR6lkgZdzowrAwAWUAc1Fk33x6eCozNr7SG7MYm5iUG+gPgTbFFfW2
         r0PBKGncYOx1VSjUL8PuDwxqNDdwQZ4Znjne7ydK6saotbPAJbVUbHDb3Ex8tfDo+ouo
         0BX4dFtO6Zp4QzfEBY0JEh0cBNi+ORBVOezVG3z0MUhppoIZGulnynwqHuXd76BgHkpG
         RZT6Didy/umCz04iB+ah3xpFM2/y7DbkUwB2BT2iQ/pU3wOMt4+v4XU7NQ8AkerZlXIt
         HUqfF7c5AELXYA0M3bYIEm+ReHS84lUTnge+niUyHMSclWvedY77DfIIEbxtWcidwPMS
         p15w==
X-Forwarded-Encrypted: i=1; AJvYcCVk6V1jn1sRXmtXJYjdpLTPx9fI2xsS2KOEWzQYT5VezBeS0RTDimSR2wHcuauZSa3tfKu/2FqoLAapE7A=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyq2NXwvPL3ZyPvyK/4xFnAuQmKHRfdMNJEOVLWOjf4bsGTItrp
	OxloPIGOmHycssrTCieUCFhI/q41LUyGeGofYDMfgXjwJYbuph2TvJsmaO57EShVGhs=
X-Gm-Gg: ASbGnctVWolofCr+J+7WQbgZcBgqrfMSsWG3sMlBUPh9Ko9XpFQEXeslEXef16RPlZ5
	huxXoEOkGL/IT+UAZF8Ianlrp/hR3LKGHHVEpYI/d05zlkBtECv0sW9rM6OXcGJqSAWbPjnopri
	IqXdteepeN/QyR65ISG4uxQJPuJM9HmkuC9KK9YOLGBwBGo6ZsXWGa+J9OljxSvXVbNQlC3pjYs
	Z3ZI0qTwqZ+xoRaPsbQMDHjZbPMBaTAF4A/lzXXYRwim0rKvlRVM/C2zl9QKgBpfXZRxTtlBQu9
	WxvFOOubn42uBx2IMqs7McPfKwr+muke4jKaGS0rvl4QxWZJtyJm1RQJ0QfFNsvcDdGWEMHzQJo
	CGexhyq1tZ8iQdzmgszfbUw==
X-Google-Smtp-Source: AGHT+IGcndJR5WSb66PATrzUwaAKdyGw+iAxbtsrtdyFNRYpJH+6sC62/Ji0kCEJoq4+a4yiL897iA==
X-Received: by 2002:a17:907:2d28:b0:ad8:8835:f794 with SMTP id a640c23a62f3a-ad8a1f31b97mr453973866b.32.1748515692908;
        Thu, 29 May 2025 03:48:12 -0700 (PDT)
Received: from localhost (host-87-21-228-106.retail.telecomitalia.it. [87.21.228.106])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ada5d82de76sm121072866b.65.2025.05.29.03.48.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 May 2025 03:48:12 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
To: Andrea della Porta <andrea.porta@suse.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof Wilczynski <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Derek Kiernan <derek.kiernan@amd.com>,
	Dragan Cvetic <dragan.cvetic@amd.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Saravana Kannan <saravanak@google.com>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	Stefan Wahren <wahrenst@gmx.net>,
	Herve Codina <herve.codina@bootlin.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Phil Elwell <phil@raspberrypi.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	kernel-list@raspberrypi.com,
	Matthias Brugger <mbrugger@suse.com>
Subject: [PATCH v10 12/12] arm64: defconfig: Enable OF_OVERLAY option
Date: Thu, 29 May 2025 12:49:29 +0200
Message-ID: <20250529104940.23053-7-andrea.porta@suse.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1748514765.git.andrea.porta@suse.com>
References: <cover.1748514765.git.andrea.porta@suse.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The RP1 driver uses the infrastructure enabled by OF_OVERLAY config
option. Enable that option in defconfig in order to produce a kernel
usable on RaspberryPi5 avoiding to enable it separately.

Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
Reviewed-by: Stefan Wahren <wahrenst@gmx.net>
Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index f6e9bb2a3578..ccf2f50673a3 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1659,6 +1659,7 @@ CONFIG_FPGA_BRIDGE=m
 CONFIG_ALTERA_FREEZE_BRIDGE=m
 CONFIG_FPGA_REGION=m
 CONFIG_OF_FPGA_REGION=m
+CONFIG_OF_OVERLAY=y
 CONFIG_TEE=y
 CONFIG_OPTEE=y
 CONFIG_MUX_GPIO=m
-- 
2.35.3

