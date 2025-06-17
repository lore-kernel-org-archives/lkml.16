Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1186C2E3AE6
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 13:08:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750165741; cv=none; b=rlhdI+8uYpPXhrXlv7dchxPfVagBogPdcw7v7WE9c0HY+HoRDmLaHg15Vzm4RgORSSJQI7YFhNX45QyfAao1ZIGEk5wcpkyFRJOydg+CH5dkGZuqji/fe4bjluf405VC2vZ8Jmwbge5x4tI1jkYOIgrFiDNwos57TMO07y4Czys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750165741; c=relaxed/simple;
	bh=HqA16LR6HAWvdlEy3wx9eZOBIMB7ZcD4My374Vzpq4U=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=IzzZ6aEScYBzU3m1Zk+gZmgVU0ibRDN6DSLgp5WDYFJgN6D8RccOP/J71k5VW2PdE3NsZVD55rmSuEjyGlw6B/CtQO2pfZnx2yss7iVahWN4qiAOlCXTAVe3uVXctPEFPwVJZi9omELBD58FI+SepfCEI/WYiKscjei6Zw7PmwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=fxxssrhM; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="fxxssrhM"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-adf3b33f968so724333166b.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 06:08:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1750165736; x=1750770536; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=tECQ70x1JM1SCckuRST7a9aJYN9UOBuJJP77Z07Vo14=;
        b=fxxssrhMMMtloRbte8jFYgwZwRz0x9WPzcBCEeJJ3z9GSI5aNGJqiXao5fduiv9PYg
         jC/uw1LuR7xpPkJ9ZEz7H/ADFjwVHmOmsC+ptrRK17NEKpHjaNizduKxlgaUJNouXRmO
         E4MO1d4RoHbJgc/ZYNmiWjOJ/W65qLswLJqMdMVk8vNimZCaA7QcLDTPQoXf/XQdjQB0
         VvZ9j/Q8xVkV6ivNtdP7eBgc8QXhoBOWHElphbhAb8emde9eifCgH4cVFoJ20X1fmdi5
         AMtLR9R7uVhiCqk+QsMcrGoX5FonzVoAnXelBg2HZ4fgy7nDZvHHmkgevErR1dXEcJzr
         ItGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750165736; x=1750770536;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tECQ70x1JM1SCckuRST7a9aJYN9UOBuJJP77Z07Vo14=;
        b=Bq7uAcrLOYzi0yOf90dA7VFSUuxiITKcuaULMBN4dxorvM2TLOGGI11oJqy8BSy+LF
         lbtotyDAO1XBX3DLEFnQTdlE+RqYesLY3ZDMp2eG764+jcJx7tP53qkGOwnOF7iynlSd
         NE7g1+zYDGuYAhFrkGHLen60Z8Siv2N3cjuCwX5WLDZsYB+pdFWVfPnG/sKyvWf/6zX5
         7Io9s0fOmruRf28dsZEcdAz+/9rkBpHZEJdpoTmuCCskwvsESdc9wBclhWKa2DMy6MXT
         Lk01dVA/tFU/F9ERD4shhU5NdSF6OTnzMGCj+0alKxd6V+Po/6uLCyjACHc63CPHeIiE
         laPQ==
X-Forwarded-Encrypted: i=1; AJvYcCVncUL0GdTe26BDOWwLCPIRLIqb29d0pxxAMmJGUBU14OYVnG6lA6bmfwROwZKocokUUGgd8EtzeDF7Al0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzxBhwM9cjPvzqvAREMkT24MI5FtCs5hKnZh9cL9FO71H1hFSCF
	Oa4gXAx7CoxXNtuFOH1apuQs2A9M7rjIBD+C7JUQ8kQcrw+bpav6GlhQAHEcUU+fAS8=
X-Gm-Gg: ASbGncsPXUdQrr9p8RnhywqtDKxOtqahHXrrH9blTLLlshfNV0tdm1G8waE76pDeCZq
	N0cyyww2izqYsTmGrcy3q6LY2nIIb+pTBdPYPtv7M1W5iHitxgMaF6VY+YC5o7Yi3z1K/W/I1TN
	jcYGefk+vNUMiTekwgTakf3BqfFxPGjmnoSjnI212o1y3pq+QfwpQox/vLNGCtOkn5Bt+kQVA9y
	8BMRbMeXRNzN9wIQU1mMVdo5xZdHlXpETNfBOcSycurOUlhUcEifJQLBmp23Xd4ljJ1kRjY62od
	itjGCoVJMCRujj4/5Q9JloNXCwbTht3r3jdyjuNdOABuRY+cj44Cl8f+HSPvPmy9uS8i38riDqT
	WWPgOXhNNAw4GWLOF11VMmpngSrD0A1zc
X-Google-Smtp-Source: AGHT+IHZb/sVwRJgA/UO9fRUeHQ7VVUZbqfIWG3k9c+U7l75XFG3Nw9yzuD9XOU45EDledJ7H6W3zg==
X-Received: by 2002:a17:906:c143:b0:ad5:2d5d:2069 with SMTP id a640c23a62f3a-adf9c458189mr1334205766b.13.1750165736215;
        Tue, 17 Jun 2025 06:08:56 -0700 (PDT)
Received: from localhost (host-79-23-237-223.retail.telecomitalia.it. [79.23.237.223])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-adec81be674sm873602666b.53.2025.06.17.06.08.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 06:08:55 -0700 (PDT)
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
Subject: [PATCH stblinux/next 1/2] dt-bindings: clock: rp1: Add missing MIPI DSI defines
Date: Tue, 17 Jun 2025 15:10:26 +0200
Message-ID: <b8a54f41f6393e3b3cae6dee561fcd040e3e5fd0.1750165398.git.andrea.porta@suse.com>
X-Mailer: git-send-email 2.44.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Declare the positional index for the RP1 MIPI clocks.

Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
---
 include/dt-bindings/clock/raspberrypi,rp1-clocks.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/dt-bindings/clock/raspberrypi,rp1-clocks.h b/include/dt-bindings/clock/raspberrypi,rp1-clocks.h
index 248efb895f35..7915fb8197bf 100644
--- a/include/dt-bindings/clock/raspberrypi,rp1-clocks.h
+++ b/include/dt-bindings/clock/raspberrypi,rp1-clocks.h
@@ -58,4 +58,8 @@
 #define RP1_PLL_VIDEO_PRI_PH		43
 #define RP1_PLL_AUDIO_TERN		44
 
+/* MIPI clocks managed by the DSI driver */
+#define RP1_CLK_MIPI0_DSI_BYTECLOCK	45
+#define RP1_CLK_MIPI1_DSI_BYTECLOCK	46
+
 #endif
-- 
2.35.3

