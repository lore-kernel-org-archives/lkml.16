Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B22D527CB18
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 08:52:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745916762; cv=none; b=GL6T7JsWE4mQzrBJtorIDX1iOZNP+yhSxH/ETyg2FXO0kTmL8XViTRf/M6GE7R0eO+STCJ2+CrpN6q9+KIsAq3gqWuqXcDF8QCg9pfJ9BUVyCr/aEYDvHD4mUfY7LdYDjOAtHC/ow3I+0J6+1nX8ovSftq6haVFNmsQYz86pAiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745916762; c=relaxed/simple;
	bh=snO5UlRxqymfMmKvVew8ZDq0Uh+aBwp66nsHilnsiK4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bqRmxZKewkG4SFtuyHiPsZxlv7C2KitFZWXyQZ5Bku9T34t1nsJGahQFZyHM9dZbGOIbp4gGngtEhhIrnFydNxmKcYuV+6PAO+Gq4uprkWZSm6k0nmtQShP0dqMW8qPGkDHFLz+eRezGLu+hdveKFI5gTFESG80WzgfzkCqNiJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=SCRRoWfe; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="SCRRoWfe"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-227b828de00so57021025ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 01:52:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1745916760; x=1746521560; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2mEqVehBRCDyoxu9q2vBqacMHsZUXwyFpRPZVYhXUX8=;
        b=SCRRoWfedbJL16NYxzyE8b4wtFlqY+PhCtRsg9BMzyqBc0SP7X0aAgB2Ovr4QF3vGE
         K6XhrgoT+/iiL4CFUsNoUkMUyw2gdLDw/4tu7l/BGk7tg+dm2zHDnjcKB83LYceZNIxB
         73vZG66nl44xhHJLJcoZcZNGVCTGXIukd+lynH2uAPkrR0ofw16DgFLrHBcZNvAhFuAw
         CjmLGkh28N6YLXYW2qbk/43Au2eQe7fmvZ1aycQquA5UniCWtvlZECoXMG3nCdI/x+HZ
         uI5Uh5YSbVxtw3frS2Ac3CcPWfJPhqlEHhTUUzWh5oEgeP5hCrKWRIxnabJ+dDPFCKAV
         T1Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745916760; x=1746521560;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2mEqVehBRCDyoxu9q2vBqacMHsZUXwyFpRPZVYhXUX8=;
        b=aGITa26GaCmv12e/cVUpEGRexRrjO0v3c0F9cr1gNfPXjeWvrLq1SRTeee97NuM0uV
         EJB5hE+Ud/5zbyDDpa+jIhZtcU7/eWxkSfns+d8063XxMpQr9trNZ4kBB2E1cs1cXoXH
         hoool3CXiW01rHQw33ytMOuCfb6ubN9aG91GmNNfQnflPxXKHiy8DAtBdWodJtqSMQzj
         mB54CmG+Mxmfa/2oArYIWLAjNOBFw43c3JdEUybcpJmWkoO8U8DBsmmA10caNN+ywo4n
         Qq4Ue4qCAvrQFVmEbNnPy6rbfagvJqL5UU/Xb3NOF5h6+A8cmbzyhBQDUMBOVE+P7HkK
         cLzg==
X-Forwarded-Encrypted: i=1; AJvYcCWxN5ssb0PXtfMsuEQQB2z0uB8n5alwMRrkqv+dTcMPLBvOsUeFRwRCj/k7dFExNYTYUcZAhzHSDLMLtPM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwCyYHQaB4IGqlXLGj5JT5YexYK/YzqX9tS2E6JoMxieVP+0ZKZ
	M6Elov4RSxIzgty761TSXtIt1udBoa185OwG4Q+yzWtm6b3h+wEimWTGkrvEPHM=
X-Gm-Gg: ASbGncsZ5fWwFJ4EPH3UFX/m0m9YO0FcEOfoC+DK7W6G9AwFOo/6Ww5b8NhATPpc8wB
	gMlU95xexMCCK+qUPTu3k5sV9F4huWT/TI7I+HbWsiEfBZ+4VOnebMC5nuX3ODcdnqoxwTiPcJY
	BjHaQVTi+zbgpExXhlmaE1bMXCWiMeHPGT38DaFSW/6Iwl5xOuhflQqA9YdAJNIxCFL2vRUtK00
	khnMijEUvuDbZ7DYhKwnx61BYfq0VQiQdIyyRT8AUbIKJ5L36d/T/4doq8Qyu8d/5Emi0lzkzG5
	pz4d0SftDeJxddhtVYyFDPFlnm24v/728OZZJ5yJ5krZqwPyX+af64kSW2pImD6/cT2Cob8fZoO
	t4J3PZHEAKuCbQSomj0NluFXSVw==
X-Google-Smtp-Source: AGHT+IGnvzbUWhLI/YOaGHPG2HlwGVUVLczRsChSXyhLNMaAX1vRU5+feyFIpxGpmIkb1IMqyytUCA==
X-Received: by 2002:a17:902:e5cd:b0:220:fe50:5b44 with SMTP id d9443c01a7336-22de7037cb5mr28009905ad.31.1745916760002;
        Tue, 29 Apr 2025 01:52:40 -0700 (PDT)
Received: from localhost.localdomain (210-61-187-174.hinet-ip.hinet.net. [210.61.187.174])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b15f8597e0bsm8550119a12.44.2025.04.29.01.52.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 01:52:39 -0700 (PDT)
From: Guodong Xu <guodong@riscstar.com>
To: ukleinek@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	dlan@gentoo.org,
	p.zabel@pengutronix.de,
	drew@pdp7.com,
	inochiama@gmail.com,
	geert+renesas@glider.be,
	heylenay@4d2.org,
	tglx@linutronix.de,
	hal.feng@starfivetech.com,
	unicorn_wang@outlook.com,
	duje.mihanovic@skole.hr,
	heikki.krogerus@linux.intel.com
Cc: elder@riscstar.com,
	linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	guodong@riscstar.com
Subject: [PATCH v3 6/6] riscv: defconfig: Enable PWM support for SpacemiT K1 SoC
Date: Tue, 29 Apr 2025 16:50:48 +0800
Message-ID: <20250429085048.1310409-7-guodong@riscstar.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250429085048.1310409-1-guodong@riscstar.com>
References: <20250429085048.1310409-1-guodong@riscstar.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable CONFIG_PWM and CONFIG_PWM_PXA in the defconfig
to support the PWM controller used on the SpacemiT K1 SoC.

Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
v3: No change
v2: Changed PWM_PXA from built-in to a loadable module (=m)

 arch/riscv/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
index 3c8e16d71e17..3c4d9bb8f01e 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -257,6 +257,8 @@ CONFIG_RPMSG_CTRL=y
 CONFIG_RPMSG_VIRTIO=y
 CONFIG_PM_DEVFREQ=y
 CONFIG_IIO=y
+CONFIG_PWM=y
+CONFIG_PWM_PXA=m
 CONFIG_THEAD_C900_ACLINT_SSWI=y
 CONFIG_PHY_SUN4I_USB=m
 CONFIG_PHY_STARFIVE_JH7110_DPHY_RX=m
-- 
2.43.0

