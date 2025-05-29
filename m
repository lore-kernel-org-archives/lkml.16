Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB3BA224AF6
	for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 12:42:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748522569; cv=none; b=nJWcvQb2SjgAIHtpgowSo/mQHHYcHbL+bQ3EKl9rFoVVTrnI3Jxza4r1d4OzS7aG7BzVNgIFcdEeTADLqUHDqDjM1w9h1lYl11OGwLktfaeFuVnyuqu0rzsnPSN/8cGRJPj5fBnEhdFlzgNP2puaVYRXZvI+aGIg/IRVEzbj6SQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748522569; c=relaxed/simple;
	bh=RRM404hdZVflbCbuZ7OBxFTgWWaneCmtEfkgg/Xp1Lk=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gtWXeZ0XeVF1dRSVA7LI0NkT95MD1mYiR0RJIDPAAGvLRTnPxz+GnV+amyjNX9WzIasIRttkBiOKCuH25hQiNfWSfztwZ/qPS2dXcr0ecP2K37+lBHjyf5skO4u0eXFqqA7Okzn3KLDJXWu+GFq0uu8DsYXI4us7mZoA9z71AJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=ERBtpWvS; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="ERBtpWvS"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-604f26055c6so3611473a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 05:42:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1748522564; x=1749127364; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hTCgL7Vlc0a5ielumzwkk7bjVhaA3TYeVWaUN3CkeyQ=;
        b=ERBtpWvS8RaK3IDnvbLxoGyt4ZJvpGUlaYT1QyeLhP3NJSw/kcd27AybBz19pQPXPm
         gBxFyO7qANgLs+8cBLhqXKWlYl8RE7jwiWKvWg1bLJRpv4GESZ+fdlm0ycar/chJ1kkS
         xlHL8r/b8D8k12l3zbVn4YaXEISZ2uQ3Ifsbdo5fn2yJmFxrSBiEcIKe9SisQgzm/sf+
         6MXVjvL3BgupsdQt8/aCWUnDiJuMAKD4hWMH/Bqj094ABNbFmmQG3Wbdhd5l39Fsn1fQ
         gC47kEU47CeOWjkRNOdMwRm3RfQqJ+UsJ2HjwhGJoIyU272vLlI8o/TbsBWxDyq2HwX+
         q1AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748522564; x=1749127364;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hTCgL7Vlc0a5ielumzwkk7bjVhaA3TYeVWaUN3CkeyQ=;
        b=B5Z5xDaXHhTu4MbMleDccdz8smdd61DGuqTeH6zVuU6IWI2foSAPB//HS7TiElMmL9
         qJb2jsIc2mVf6VnPDoqJcFZktlHBc3l+vdOiM8gZjITqmmvvXssVpd2o8njEcA2xEycE
         RUP3bLAEwgjMR0K2sn2cwc2r7BggEhF6e7ASy8EnhAZiQkXIxvJcqdfxHeeQUuycYpSf
         l4+tv36pofMvyWxLuqjI5UNOMNi6MdjX2oPEe59+/wpNw5+19YbJYhM1H0lL6oeh3ZAc
         RkDL1ATEvA3PEi8Re5l7JC9dgCUfyprq9Y4szTQvtcJC6/heyMJ3DX1+B1iTg+dyZqA7
         XeJQ==
X-Forwarded-Encrypted: i=1; AJvYcCWrY2HP7rmpnzVlE4kfutfigPevBM9FL9vx19n1ER1PxXRbmQwmJV/5xbhCHjuri5CLKkUfbeKxZ1GxJ20=@vger.kernel.org
X-Gm-Message-State: AOJu0YwMesD+2h3Q+G1PBFiFkSt9q7doqujwR54xKrh2NhGccm8m5z53
	louEvqi/gi9TM8UjyVUCc3kkPjDxG9qwTHu3Wk2wL/3sSl/yo523V7jrxyEP8olEMIY=
X-Gm-Gg: ASbGncu3eQp+/sAdWZgoVwE69P2M3mmne1Hp631qwpf8j3jfiZRMDrkBsIiExQ9/gbl
	1gBsCe/w5jaZbUdf+fn/uJw2DsAxKZwCae5ut01CHRoCUHV7EdxMC4yjQnGikBde6I3RYpG6Los
	CUXvXcNw86rSO48WjoVhNobFIEyjxlbEj+qbtT6ntBtMyx8Hr3BaB5XWPDAV+e/AJEoezn6bvLP
	yLOuFn1m64QI0Q9jGYs80oAB0QTI9RTgEfzCjNNaEbEIl7g/IAkpAulNx3qNvJboZd5d2LB7Z8y
	/QYJ3jxTBrvfRaVeORIc/9Z+S3+i9wZz63F6fkMfrfklHelHBKRwW6ckdmuJoOvtxnwq9ZwkXZF
	jh8W/XG7Bo2U+35+mDTJNmkJ8ooTWKwK4
X-Google-Smtp-Source: AGHT+IGU0cArmNGBE3alDxaSeS0c7kho0TQ3gbduZH4lCYtigEniaEd9Y5YqaiqYC9HAzb90Z71eXw==
X-Received: by 2002:a05:6402:510f:b0:604:dcba:dafd with SMTP id 4fb4d7f45d1cf-60536c20f82mr2597026a12.15.1748522563913;
        Thu, 29 May 2025 05:42:43 -0700 (PDT)
Received: from localhost (host-87-21-228-106.retail.telecomitalia.it. [87.21.228.106])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6051d79e940sm2308553a12.67.2025.05.29.05.42.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 May 2025 05:42:43 -0700 (PDT)
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
Subject: [PATCH v11 12/13] arm64: defconfig: Enable OF_OVERLAY option
Date: Thu, 29 May 2025 14:44:01 +0200
Message-ID: <20250529124412.26311-7-andrea.porta@suse.com>
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

