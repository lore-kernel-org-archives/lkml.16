Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E55129B221
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 18:52:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745347940; cv=none; b=IOFDbCVXjFVjtflMXntwkPMlAfjUoyoL54yYLm6W1Aj92cZcefv9SirvifWbSuJR0s6lSrmLXldjJNNzkB+ZCpvbixXSYQ/LE9YH8RtAl4KCoePKTeAbm0PWVY6jVEgU0QDy9iLPGPjTCbIwpRuB5tPijpA1J05BO2iEFhBzZ5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745347940; c=relaxed/simple;
	bh=1k1unQkkbNJWyNIqqzpizkZc3aIKLdvvcUxlVK4aZEM=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=m1qrOZ6oFtwMkdIxVr+6hw9ikPLr57CZUTHsG7myJl/rPPPhwtQopj4NQbqWye6yonyX1ycSopu/B2BSyDHu3KNw8tySvGtk459D47+LpSuXswpirWmi996+u9ni6t7mEt2NrcAnu7Nqalw8ACJydHmPqL886HmHeKScOtsllmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=KuDvxyHy; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="KuDvxyHy"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3914aba1ce4so3716493f8f.2
        for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 11:52:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1745347935; x=1745952735; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ADsz4nM5zt5mk0SaIqSNaWehe790A/IESs0jsUHL+uk=;
        b=KuDvxyHyGrC25lEjuJl0sHhcCvZF/pF3czD68drf8To7cQccp2Y8qxi3RM0ChZwcqX
         NbVxTb518ACxsReOslqkprpiBHaHOsJ8IdMQTCRFEV963Ovpcki1WXdbPdsJohoN2OaC
         DdHN2FholbvCNcoeBTvuMjkjOshdifxbF5wOtUb4xrs4i7LW5nrDHyYm3+H8uo/1UK3R
         t0mskDWsLu/XNkDzlLEQfHxAoLRN8rqABMX3JXLWx81j8DkSdtZVUAXKY/eYCtcAODTV
         Na/ivldAIglcA0uzm1Yo6rn9BUBgEVJ6BV7RqnMUXGgkFTqOb49hZ6SdHUNbe0dfMVTC
         M5nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745347935; x=1745952735;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ADsz4nM5zt5mk0SaIqSNaWehe790A/IESs0jsUHL+uk=;
        b=MDWZh0+saRLkwmRdGEkaC09qKKRxAJXoOWowH9pZ8lWQ8wS0lOiopA09C01Isk0r6S
         QKGkexF+xnWDYcn+rc+PHejcOlS1Yd4SQZAwLwkXyouvaQcxxp/28VrHKO3RqdL9dLVU
         Ukf1K+KGvvN879ewI+dGNdx/IURzfDRFFo4QYba51RtN3lNzXM56dtYlW35nDC7e6cJB
         IIJE9CjFEwK2pHWPkJAX7G8oUnHZVy1Sn80BDYdYLuU6yQYHtxJCC97PdOEKobE9w+x1
         raTfMX9ogXNaLXvs2QhEGAwK7PKW+algg+JMXQjNlfJwdwny/Czy+i9bVES/d+GNF5WU
         Nu9g==
X-Forwarded-Encrypted: i=1; AJvYcCWbDMlOdlqRXjU4Prjx2xvYYAy7+qCkw1h4QngsmrOTl7sghSEeXltCluV5No8BePmtIbkh97IF1Nhn9d4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzMhIqfpOVEPFG0xaLmyh5raNoHF7c6rfQyemUTGdNFnHoNKeqT
	Uw4qldE78orC/Pzg1Pw0V44mltP6auaLHi0VM7262PQg/b4hGg94YE0mPsHFOfA=
X-Gm-Gg: ASbGnctXMiocqiNHB0+p/he27SKm/nuN7kXJ3p5n3rg6BvgZBOQNdHlPRfsr68IPVOk
	OrdunioiqAvnKip0+cJJ9e3IBGo3SkoWdXmzirgwDOAcSILF1RLiIs1W79vZx7e/MAjrl1dX9ff
	6i5a0vYR+VUAg8/eQAsep1qusc2Uxs/7z7C2OChtKekCwPc5zUSQO2aIni80mucCNzxJcIBIXPh
	uJmqhPI0kATSnjxVLJ7jGVKxmcwgBWAT3wv87QEGXATe+t2y9HtD345cmX4kiz0nj9qaWkdo3g3
	MJ/9b8n8CZwMwRI/ahi53v+jsPLFHV3d+l8Vfbj7/H/v4mm/SnhU2R3t+M9eV6JfiTRdVQFqZMB
	HB7VZ9w==
X-Google-Smtp-Source: AGHT+IHaQWcyIld8HmOWqZEWQ8mfScJy5XfhH5TexVF3JHDuC1C8WH0PzZCZR43OQba1F6XglJkm3Q==
X-Received: by 2002:a5d:648d:0:b0:39c:141b:904a with SMTP id ffacd0b85a97d-39efba2ca27mr13013041f8f.11.1745347935584;
        Tue, 22 Apr 2025 11:52:15 -0700 (PDT)
Received: from localhost (93-44-188-26.ip98.fastwebnet.it. [93.44.188.26])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa4207afsm16278846f8f.12.2025.04.22.11.52.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 11:52:15 -0700 (PDT)
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
Subject: [PATCH v9 -next 12/12] arm64: defconfig: Enable OF_OVERLAY option
Date: Tue, 22 Apr 2025 20:53:21 +0200
Message-ID: <8baf7818aae1fe5be046015e4bd8121ccc9acb20.1745347417.git.andrea.porta@suse.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1745347417.git.andrea.porta@suse.com>
References: <cover.1745347417.git.andrea.porta@suse.com>
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
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 53748ea4a5cb..23656b0bb7e0 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1640,6 +1640,7 @@ CONFIG_FPGA_BRIDGE=m
 CONFIG_ALTERA_FREEZE_BRIDGE=m
 CONFIG_FPGA_REGION=m
 CONFIG_OF_FPGA_REGION=m
+CONFIG_OF_OVERLAY=y
 CONFIG_TEE=y
 CONFIG_OPTEE=y
 CONFIG_MUX_GPIO=m
-- 
2.35.3

