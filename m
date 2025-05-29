Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4C3722D4E6
	for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 12:42:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748522569; cv=none; b=SucIN0bo9vpmtDAiDq0cBB7RKhgL8dX6CIY/IUWD1GV3eC9v96Bv0c/2o+4olp2IMcp09nmI/TI+bEOjLLPOwuR6ltkSXBX1mOhG6JRn1x2B+IwqKYb2SMEUPB0nwAUKVJRO4qxTHYMvAatSY/RbRlKD6EHC55RLM9CpFuxKiG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748522569; c=relaxed/simple;
	bh=Cxv3DdNSTbG6mkWW+XlQDzM5M3k//FCq7uG/9MGjWvM=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cH3SwF3XeApnPkorgrmwTVoe/Rtx06ZnYr6z6YCpx4rysDpVvVXvWCTr4Nj8jQ9TtXkckhWGhlUclk3oZ4aJ6/HTL5TZACQMVS/wkACKErrSwAsrXxF1qZldDq9btpz7VKMYuhDTI8lQrGW6qaO+zFQSi/jsH+MOlRtKpHp43lI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=ZS5zncOf; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="ZS5zncOf"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-ad1d1f57a01so152151666b.2
        for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 05:42:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1748522565; x=1749127365; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i8LMEHYmovrRN8zYWQwYy5+2ddqvSDMDQcnZraZcEHI=;
        b=ZS5zncOfC+K7c9w1dnbJRv6ieLVSoQAPrRkjhVg60LhgyGuVHQ7FO+jREy4JVcZsZf
         wUaohrPRRPCxex9EznSVNEWLE297C90KV73nVMKFqMaUoXwzqB8HYsvLOM2oQnZ42N0y
         6VvAp4BryHzZQRTqOPHh6aIIX/Kuue8Sx7e/m3GEhZrkHVMg4ABmRKtP8g20NBD8F1MG
         NmGmMZBi2Lc4wyI0g4kMyB3Z5QaVpDoORuJbmrAxi8lMGmRhAcjcyAzE91gPRfXIHVFE
         a7IMY9I+Z0xXgbWV5YLC3bWMRrX65sl2KAtNegTxnaabqfoVoM/fCPEjzxbOzP0NP+NR
         iR4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748522565; x=1749127365;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i8LMEHYmovrRN8zYWQwYy5+2ddqvSDMDQcnZraZcEHI=;
        b=u8Uzg/gogB4jiDDPUeBFtsun0r/y4oqo72DzP0E1iIG4gDKRROcndW1IuXGIg83n07
         BekblYWlrpZCoQzjQIQcXx7YHI8yIBBQow1FHaCtE2jl0TrB0BFBX0PQgcrRUPs/7+lF
         gM9etAlXsstpiPyLTsHzcj3WtJjogzzmz3xEbiQ74gquuLfNYtmti3M/JcMVBkshr2kk
         4ErC/36Z+SaFXMW6aQEyUzCAl+AzzB3PGSjUPT6CCxb15DLQZop1lFFQ1qtLRosa96eW
         XHdIml6XphoJr3q5Zr2LHEvxPSEGraFNWuGzzvyvPSSDdcz42iq10UyT+0cshhoblhOI
         0wAQ==
X-Forwarded-Encrypted: i=1; AJvYcCUTjqKvB+BTQbLP4ajAvOsIb/TBQ7HkqbsQGliOVRDPsDdeL0qSshwS23fFzkhWDaldsxIRj4ofAxdloVo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxNeLaoMVAzKZ1RkZKdyYhZykwaEHYcSDbc6BSbbXlgQOirKBYx
	eCJ1F9agcyTKfB69GUYoJTw6/Fa8fzwfB90vFv9AS2HFXwYA06nvqk6Li3Hzijl6b9U=
X-Gm-Gg: ASbGnctumhSLiRO9EI0sRZsv5tjB5QLT8FfdgTlDSaVjxOYQry66POVrPtG7zdfiYOe
	h/J4Nbt0bjRGN6LhFEw6uiEkqbx1V8NUhfpGaMPdppEDs5qutvxCaKHsKWgylzfG6iEV56mzcE5
	iGPyZHmBK1zA4b8zFZmHgx+CsDmSzqxQZLFjecd/4LlMKdoEs8i06iQydFGlhgoyhLZPbFKH6fN
	DTYge6CPkwdEDxMuGByECygIM18V5W6f3c5K8ezkq7V89azv6jpnp1zI4Luzd2akRz03Nkd6vgx
	u0C+/vIibeDUSWrIgz8mDAJg56RZRMqYRc4ZLr6xpByKQ6LihxeW6cREeP+0XAkD1hcJohrM1ch
	s0GjFwHeBdhrXZ1HQskTpU9DHtISG9GV0
X-Google-Smtp-Source: AGHT+IGSKPwPkYLca5xt4DTsp41XrvIAXEH42/7GBMAHBHwSDsKU5tUb2elBTXwGWSigWuI5ixWpNw==
X-Received: by 2002:a17:907:72cb:b0:ad8:9909:20a3 with SMTP id a640c23a62f3a-ad8a1fcd782mr609032066b.43.1748522564992;
        Thu, 29 May 2025 05:42:44 -0700 (PDT)
Received: from localhost (host-87-21-228-106.retail.telecomitalia.it. [87.21.228.106])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ada5d7fed3dsm139572166b.12.2025.05.29.05.42.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 May 2025 05:42:44 -0700 (PDT)
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
Subject: [PATCH v11 13/13] MAINTAINERS: add Raspberry Pi RP1 section
Date: Thu, 29 May 2025 14:44:02 +0200
Message-ID: <20250529124412.26311-8-andrea.porta@suse.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1748522349.git.andrea.porta@suse.com>
References: <cover.1748522349.git.andrea.porta@suse.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Raspberry Pi RP1 is a southbridge PCIe device which embeds several
peripherals.
Add a new section to cover the main RP1 driver, DTS and specific
subperipherals (such as clock and pinconf/pinmux/gpio controller).

Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
---
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 2b16ba4eb1ce..2add073f5bdf 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -20197,6 +20197,14 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/media/raspberrypi,rp1-cfe.yaml
 F:	drivers/media/platform/raspberrypi/rp1-cfe/
 
+RASPBERRY PI RP1 PCI DRIVER
+M:	Andrea della Porta <andrea.porta@suse.com>
+S:	Maintained
+F:	arch/arm64/boot/dts/broadcom/rp1*.dts*
+F:	drivers/clk/clk-rp1.c
+F:	drivers/misc/rp1/
+F:	drivers/pinctrl/pinctrl-rp1.c
+
 RC-CORE / LIRC FRAMEWORK
 M:	Sean Young <sean@mess.org>
 L:	linux-media@vger.kernel.org
-- 
2.35.3

